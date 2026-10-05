#=
For reference, when choosing axis
1 = X
2 = Y
3 = Z
=#

"""
singleread(stage::MCLStage)

Reads the location of specific axis
# Arguments
- `stage::MCLStage`: The stage whose handle is to be released.
- `axis::Int`: The axis to read from.
# Description
This function reads the location of the specified axis and updates the structure's real location for that axis.
"""
function singleread(stage::MCLStage, axis::Int)
    if axis == 1
        position = @ccall madlibpath.MCL_SingleReadN(Cint(1)::Cint, stage.id::Cint)::Cdouble
        stage.real_x = position
    elseif axis == 2
        position = @ccall madlibpath.MCL_SingleReadN(Cint(2)::Cint, stage.id::Cint)::Cdouble
        stage.real_y = position
    elseif axis == 3
        position = @ccall madlibpath.MCL_SingleReadN(Cint(3)::Cint, stage.id::Cint)::Cdouble
        stage.real_z = position
    else
        @error "Invalid axis"
        return false
    end

    return position
end

"""
singlereadZ(stage::MCLStage)

Reads the location of the Z axis
# Arguments
- `stage::MCLStage`: The stage whose handle is to be released.
# Description
This function reads the location of the Z axis and updates the structure's real location for that axis.
"""
function singlereadZ(stage::MCLStage)
    position = @ccall madlibpath.MCL_SingleReadZ(stage.id::Cint)::Cdouble
    stage.real_z = position
    return position
end

"""
singlewrite(stage::MCLStage, axis::Int, position::Float64)

Moves the stage to a given location on a specific axis

# Arguments
- `stage::MCLStage`: The stage to move.
- `axis::Int`: The axis to move.
- `position::Float64`: The position to move to.

# Description
This function moves the stage to the given position on the specified axis. The function updates the target position for the axis and returns the error code from the move operation.

"""
function singlewrite(stage::MCLStage, axis::Int, position::Float64)
    if axis == 1
        errcode = @ccall madlibpath.MCL_SingleWriteN(position::Cdouble, Cint(1)::Cint, stage.id::Cint)::Cint
        stage.targ_x = position
        return HardwareReturn[errcode]
    elseif axis == 2
        errcode = @ccall madlibpath.MCL_SingleWriteN(position::Cdouble, Cint(2)::Cint, stage.id::Cint)::Cint
        stage.targ_y = position
        return HardwareReturn[errcode]
    elseif axis == 3
        errcode = @ccall madlibpath.MCL_SingleWriteN(position::Cdouble, Cint(3)::Cint, stage.id::Cint)::Cint
        stage.targ_z = position
        return HardwareReturn[errcode]
    else
        @error "Invalid axis"
        return false
    end
end

"""
singlewriteZ(stage::MCLStage)

Sets the position of the Z axis
# Arguments
- `stage::MCLStage`: The stage whose handle is to be released.
- `position::Float64`: The position to move to.
# Description
This function sets the location of the Z axis and updates the structure's target location for that axis.
"""
function singlewriteZ(stage::MCLStage, position::Float64)
    errcode = @ccall madlibpath.MCL_SingleWriteZ(position::Cdouble, stage.id::Cint)::Cint
    stage.targ_z = position
    return HardwareReturn[errcode]
end

"""
    axis_range(stage::MCLStage, axis::Int) -> Tuple{Float64,Float64}

The calibrated travel for one axis. Used to clamp before every write.
"""
function axis_range(stage::MCLStage, axis::Int)
    axis == 1 && return stage.range_x
    axis == 2 && return stage.range_y
    axis == 3 && return stage.range_z
    error("Invalid axis $axis (expected 1, 2 or 3)")
end

"""
    clamp_to_range(stage::MCLStage, axis::Int, position::Float64) -> Float64

Clamp an absolute target into the axis's calibrated travel. A position read
back at a limit is routinely a few nanometres negative; feeding that straight
back to Madlib returns -6 MCL_ARGUMENT_ERROR. These values are measurement
noise at the limit, not user error, so clamping silently is correct here.
"""
function clamp_to_range(stage::MCLStage, axis::Int, position::Float64)
    lo, hi = axis_range(stage, axis)
    return clamp(position, Float64(lo), Float64(hi))
end

"""
monitor(stage::MCLStage, axis::Int, position::Float64)

# Arguments
- `stage::MCLStage`: The stage to move.
- `axis::Int`: The axis to move.
- `position::Float64`: The position to move to.

# Returns
- The location of the stage after movement.

# Description
This function moves the stage to a given position then reads the location after movement
"""
function monitor(stage::MCLStage, axis::Int, position::Float64)
    axis in (1, 2, 3) || (@error "Invalid axis" axis; return false)

    target = clamp_to_range(stage, axis, position)

    # MCL_MonitorN returns a double: the position after the move, or a
    # negative error code.
    location = @ccall madlibpath.MCL_MonitorN(
        target::Cdouble, UInt32(axis)::Cuint, stage.id::Cint
    )::Cdouble

    # Madlib error codes are whole negative integers (-1..-8). A position a
    # few nanometres below zero is measurement noise at the travel limit, not
    # an error, so only treat <= -1.0 as a failure.
    if location <= -1.0
        code = round(Int, location)
        @error "MCL_MonitorN failed" axis target code =
            get(HardwareReturn, code, "unknown error $code")
        return location
    end

    if axis == 1
        stage.targ_x = target
        stage.real_x = location
    elseif axis == 2
        stage.targ_y = target
        stage.real_y = location
    else
        stage.targ_z = target
        stage.real_z = location
    end

    return location
end

"""
monitorZ(stage::MCLStage)

Sets the position of the Z axis
# Arguments
- `stage::MCLStage`: The stage whose handle is to be released.
- `position::Float64`: The position to move to.
# Description
Commands the Nano-Drive to move the Z axis to a position and then reads the current position of the axis.
"""
function monitorZ(stage::MCLStage, position::Float64)
    target = clamp_to_range(stage, 3, position)

    location = @ccall madlibpath.MCL_MonitorZ(
        target::Cdouble, stage.id::Cint
    )::Cdouble

    # Madlib error codes are whole negative integers (-1..-8). A position a
    # few nanometres below zero is measurement noise at the travel limit, not
    # an error, so only treat <= -1.0 as a failure.
    if location <= -1.0
        code = round(Int, location)
        @error "MCL_MonitorZ failed" target code =
            get(HardwareReturn, code, "unknown error $code")
        return location
    end

    stage.targ_z = target
    stage.real_z = location
    return location
end

