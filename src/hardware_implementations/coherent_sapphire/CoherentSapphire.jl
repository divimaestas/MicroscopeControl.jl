"""
    CoherentSapphireControl

Coherent Sapphire laser (the rig's 561) over its serial port.

This is the serial half only. On the TIRF rig the 561 also has a TTL shutter
on a NI-DAQ line and an ND filter wheel on a Dynamixel servo. Those are
separate devices composed in the rig script, not part of this driver.

Protocol, from `MIC_CoherentLaser561.m`: 19200 baud, CR/LF terminated ASCII.

    >=0      prompt off
    E=0      echo off
    L=1/0    emission on/off
    P=<mW>   power setpoint
    ?P       read power
    ?STA     read status
    ?L       read emission state

Unlike the MATLAB class, `initialize` does not enable emission. Emission is
only changed by `light_on` and `light_off`.

The port is opened in `initialize`, not in the constructor, matching the PI,
MCL and TCube drivers. The `io` field is any `IO`, so tests can substitute an
`IOBuffer`.
"""
module CoherentSapphireControl

using ...MicroscopeControl.HardwareInterfaces.LightSourceInterface
using LibSerialPort

import ...MicroscopeControl: export_state, initialize, shutdown

export CoherentSapphire, query, status, getpower

const TERM = "\r\n"

"""
    CoherentSapphire

Coherent Sapphire laser on a serial port.

# Fields
- `unique_id::String`: identifier for this light source.
- `properties::LightSourceProperties`: power unit, setpoint, on/off, limits.
- `laser_color::String`: wavelength label, "561".
- `portname::String`: serial port, e.g. "/dev/ttyUSB0" or "COM4".
- `baudrate::Int`: serial baud rate, 19200 for this laser.
- `io::Union{IO, Nothing}`: open port, or `nothing` before `initialize`.
- `connectionstatus::Bool`: true once the laser has answered a query.
"""
mutable struct CoherentSapphire <: LightSource
    unique_id::String
    properties::LightSourceProperties
    laser_color::String
    portname::String
    baudrate::Int
    io::Union{IO, Nothing}
    connectionstatus::Bool
end

"""
    CoherentSapphire(portname::String; unique_id, min_power, max_power, baudrate)

Construct a `CoherentSapphire` on `portname`. Pure: nothing is opened until
`initialize`.

# Arguments
- `portname::String`: serial port, e.g. "/dev/ttyUSB0" on Linux or "COM4" on Windows.
- `unique_id::String`: identifier, default "CoherentSapphire561".
- `min_power::Float64`: minimum setpoint in mW, default 10.0 (the Sapphire 561-100 rejects lower).
  Note the laser accepts P=0 only in the sense of "off"; use `light_off`.
- `max_power::Float64`: maximum setpoint in mW, default 110.0 (from the laser's own error reply).
- `baudrate::Int`: default 19200.
"""
function CoherentSapphire(portname::String;
    unique_id::String = "CoherentSapphire561",
    min_power::Float64 = 10.0,
    max_power::Float64 = 110.0,
    baudrate::Int = 19200)
    properties = LightSourceProperties("mW", 0.0, false, min_power, max_power)
    return CoherentSapphire(unique_id, properties, "561", portname, baudrate, nothing, false)
end

"""
    query(light::CoherentSapphire, cmd::AbstractString; wait=0.2)

Send `cmd` and return the reply as a stripped string. Returns an empty string
if the laser does not answer within `wait` seconds.
"""
function query(light::CoherentSapphire, cmd::AbstractString; timeout::Float64 = 1.0, quiet::Float64 = 0.08)
    io = light.io
    io === nothing && error("$(light.unique_id): port not open, call initialize first")
    bytesavailable(io) > 0 && read(io)
    write(io, cmd * TERM)
    buf = UInt8[]
    t0 = time()
    seen_newline = false
    tlast = time()
    while time() - t0 < timeout
        n = bytesavailable(io)
        if n > 0
            append!(buf, read(io, n))
            tlast = time()
            seen_newline |= (UInt8('\n') in buf)
        elseif seen_newline && time() - tlast > quiet
            break
        else
            sleep(0.01)
        end
    end
    return strip(replace(String(buf), r"[\r\n>]+" => " "))
end

"""
    send(light::CoherentSapphire, cmd::AbstractString)

Send a command and discard the reply.
"""
function send(light::CoherentSapphire, cmd::AbstractString)
    query(light, cmd)
    return nothing
end

"""
    status(light::CoherentSapphire)

Return the laser's status word from `?STA`.
"""
function status(light::CoherentSapphire)
    return query(light, "?STA")
end

"""
    initialize(light::CoherentSapphire)

Open the serial port, turn off the command prompt and echo, and read the
laser's status and emission state. Does not change emission.
"""
function initialize(light::CoherentSapphire)
    if light.io === nothing
        light.io = LibSerialPort.open(light.portname, light.baudrate)
    end
    send(light, ">=0")
    send(light, "E=0")
    sta = status(light)
    if isempty(sta)
        @warn "$(light.unique_id): no response on $(light.portname). Is the controller powered and the key on?"
        light.connectionstatus = false
    else
        light.connectionstatus = true
        @info "$(light.unique_id) connected" port = light.portname status = sta
    end
    light.properties.is_on = (query(light, "?L") == "1")
    return nothing
end

"""
    shutdown(light::CoherentSapphire)

Turn emission off and close the port.
"""
function shutdown(light::CoherentSapphire)
    if light.io !== nothing
        try
            send(light, "L=0")
        finally
            close(light.io)
            light.io = nothing
        end
    end
    light.properties.is_on = false
    light.connectionstatus = false
    return nothing
end

"""
    setpower(light::CoherentSapphire, power::Float64)

Set the power setpoint in mW. Errors if `power` is outside
`[min_power, max_power]`.
"""
function LightSourceInterface.setpower(light::CoherentSapphire, power::Float64)
    lo = light.properties.min_power
    hi = light.properties.max_power
    lo <= power <= hi || error("$(light.unique_id): power $power mW is outside [$lo, $hi]")
    reply = query(light, "P=" * string(round(power, digits = 3)))
    occursin(r"must be|error|invalid"i, reply) && error("$(light.unique_id): laser rejected P=$power: $reply")
    # The controller accepts the setpoint immediately but ?SP lags by up to ~1 s.
    t0 = time()
    sp = NaN
    while time() - t0 < 3.0
        sp = something(tryparse(Float64, query(light, "?SP")), NaN)
        isapprox(sp, power; atol = 0.01) && break
        sleep(0.1)
    end
    isapprox(sp, power; atol = 0.01) || error("$(light.unique_id): setpoint did not take, ?SP=$sp after P=$power")
    light.properties.power = sp
    return nothing
end

"""
    getpower(light::CoherentSapphire)

Return the measured output power in mW from `?P`. Zero when emission is off.
"""
function getpower(light::CoherentSapphire)
    return something(tryparse(Float64, query(light, "?P")), NaN)
end

"""
    light_on(light::CoherentSapphire)

Enable emission at the current setpoint.
"""
function LightSourceInterface.light_on(light::CoherentSapphire)
    send(light, "L=1")
    light.properties.is_on = true
    return nothing
end

"""
    light_off(light::CoherentSapphire)

Disable emission.
"""
function LightSourceInterface.light_off(light::CoherentSapphire)
    send(light, "L=0")
    light.properties.is_on = false
    return nothing
end

"""
    export_state(light::CoherentSapphire)

Return the `(attributes, data, children)` triple used by the state exporter.
"""
function export_state(light::CoherentSapphire)
    attributes = Dict{String, Any}(
        "unique_id" => light.unique_id,
        "laser_color" => light.laser_color,
        "port" => light.portname,
        "power_unit" => light.properties.power_unit,
        "power" => light.properties.power,
        "is_on" => light.properties.is_on,
        "min_power" => light.properties.min_power,
        "max_power" => light.properties.max_power,
        "connected" => light.connectionstatus
    )

    data = nothing
    children = Dict{String, Any}()

    return attributes, data, children
end

end
