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

export CoherentSapphire, gui, query, status

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
- `min_power::Float64`: minimum setpoint in mW, default 0.0.
- `max_power::Float64`: maximum setpoint in mW, default 100.0.
- `baudrate::Int`: default 19200.
"""
function CoherentSapphire(portname::String;
    unique_id::String = "CoherentSapphire561",
    min_power::Float64 = 0.0,
    max_power::Float64 = 100.0,
    baudrate::Int = 19200)
    properties = LightSourceProperties("mW", 0.0, false, min_power, max_power)
    return CoherentSapphire(unique_id, properties, "561", portname, baudrate, nothing, false)
end

"""
    query(light::CoherentSapphire, cmd::AbstractString; wait=0.2)

Send `cmd` and return the reply as a stripped string. Returns an empty string
if the laser does not answer within `wait` seconds.
"""
function query(light::CoherentSapphire, cmd::AbstractString; wait::Float64 = 0.2)
    io = light.io
    io === nothing && error("$(light.unique_id): port not open, call initialize first")
    write(io, cmd * TERM)
    sleep(wait)
    reply = String(read(io))
    return strip(replace(reply, r"[\r\n>]+" => " "))
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
    send(light, "P=" * string(round(power, digits = 2)))
    light.properties.power = power
    return nothing
end

"""
    light_on(light::CoherentSapphire)

Enable emission.
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
