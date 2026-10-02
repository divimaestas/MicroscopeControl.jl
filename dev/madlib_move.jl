# Small relative move on X with read-back, then return to start.
# Positions are clamped into [0, cal]: a stage resting at the travel
# limit reads slightly negative, and SingleWriteN rejects that (-6).

const LIBMADLIB = "libmadlib"
const STEP = 5.0
const AXIS = 1  # 1=X, 2=Y, 3=Z

inithandle()          = ccall((:MCL_InitHandle, LIBMADLIB), Cint, ())
releasehandle(h)      = ccall((:MCL_ReleaseHandle, LIBMADLIB), Cvoid, (Cint,), h)
getcalibration(a, h)  = ccall((:MCL_GetCalibration, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singleread(a, h)      = ccall((:MCL_SingleReadN, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singlewrite(p, a, h)  = ccall((:MCL_SingleWriteN, LIBMADLIB), Cint, (Cdouble, Cuint, Cint), p, a, h)

function moveto(pos, axis, handle, cal; settle=0.5)
    p = clamp(pos, 0.0, cal)
    rc = singlewrite(p, axis, handle)
    rc != 0 && error("MCL_SingleWriteN($p) failed with code $rc")
    sleep(settle)
    singleread(axis, handle)
end

function main()
    handle = inithandle()
    handle == 0 && error("MCL_InitHandle returned 0.")

    try
        cal   = getcalibration(AXIS, handle)
        start = singleread(AXIS, handle)
        println("X range 0-$(cal) um, starting at $(round(start, digits=3)) um")

        target = clamp(start + STEP, 0.0, cal)
        println("moving to $(round(target, digits=3)) um ...")
        got = moveto(target, AXIS, handle, cal)
        println("  read back $(round(got, digits=3)) um  (error $(round(got - target, digits=3)) um)")

        println("returning to $(round(start, digits=3)) um ...")
        back = moveto(start, AXIS, handle, cal)
        println("  read back $(round(back, digits=3)) um")

        println("net displacement from start: $(round(back - start, digits=3)) um")
    finally
        releasehandle(handle)
        println("handle released.")
    end
end

main()
