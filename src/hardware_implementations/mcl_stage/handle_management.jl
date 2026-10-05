"""
    inithandle(stage::MCLStage)

Initializes the handle for the given stage. This function is specific to stages of type `MCLStage`.

# Arguments
- `stage::MCLStage`: The stage whose handle is to be initialized.

# Returns
- The handle for the stage as an integer. If the stage is not found, the handle is 0 and an error is logged.

# Description
This function is responsible for initializing the handle for the stage. The handle is used to identify the stage in subsequent operations. If the stage is not found, the function logs an error and sets the connection status of the stage to false.

"""
function inithandle(stage::MCLStage)
    handle = @ccall madlibpath.MCL_InitHandle()::Cint
    stage.id = handle
    stage.connectionstatus = true    

    if handle == 0
        @error "Stage Not Found"
        stage.connectionstatus = false
        return handle
    end

    # Read the travel from the device rather than trusting the struct
    # defaults. monitor/move clamp against these ranges, so a wrong range
    # means either a refused write (-6 MCL_ARGUMENT_ERROR) or a clamp that
    # does nothing. Every Nano-Drive reports its own calibration.
    for axis in 1:3
        try
            getcalibration(stage, axis)
        catch e
            @warn "Could not read calibration; keeping the default range" axis exception = e
        end
    end

    return handle
end

"""
releasehandle(stage::MCLStage)

Closes the connection to a given stage

# Arguments
- `stage::MCLStage`: The stage whose handle is to be released.

# Description
This function is responsible for releasing the handle for the stage. After the handle is released, the connection status of the stage is set to false.

"""
function releasehandle(stage::MCLStage)
    @ccall madlibpath.MCL_ReleaseHandle(stage.id::Cint)::Cvoid
    stage.connectionstatus = false
    return nothing
end 


function releaseallhandles(stage::MCLStage)
    @ccall madlibpath.MCL_ReleaseAllHandles()::Cvoid
    stage.connectionstatus = false
    return nothing
end
