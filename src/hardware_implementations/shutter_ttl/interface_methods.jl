function _write_line(sh::ShutterTTL, value::Float64)
    t = NIDAQcard.createtask(sh.daq, "DO", sh.channel)
    try
        NIDAQcard.setvoltage(sh.daq, t, value)
    finally
        NIDAQcard.deletetask(sh.daq, t)
    end
    return nothing
end

"""
    initialize(sh::ShutterTTL)

Close the shutter. Tasks are created per operation, so there is no
persistent connection to open.
"""
function initialize(sh::ShutterTTL)
    close_shutter(sh)
    return nothing
end

"Open the shutter (drive the line high)."
function open_shutter(sh::ShutterTTL)
    _write_line(sh, 1.0)
    sh.is_open = true
    return nothing
end

"Close the shutter (drive the line low)."
function close_shutter(sh::ShutterTTL)
    _write_line(sh, 0.0)
    sh.is_open = false
    return nothing
end

"""
    shutdown(sh::ShutterTTL)

Close the shutter. A shutter is left closed rather than in its current
state, so a laser is never left exposed by a shutdown.
"""
function shutdown(sh::ShutterTTL)
    close_shutter(sh)
    return nothing
end

function export_state(sh::ShutterTTL)
    attributes = Dict{String,Any}(
        "unique_id" => sh.unique_id,
        "channel"   => sh.channel,
        "is_open"   => sh.is_open,
    )
    return attributes
end
