# Visible-scale sweep on X: 0 -> 50 um in 10 um steps, then back.
# No sample mounted. Lateral axis only; Z untouched.

const LIBMADLIB = "libmadlib"
const AXIS = 1

inithandle()          = ccall((:MCL_InitHandle, LIBMADLIB), Cint, ())
releasehandle(h)      = ccall((:MCL_ReleaseHandle, LIBMADLIB), Cvoid, (Cint,), h)
getcalibration(a, h)  = ccall((:MCL_GetCalibration, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singleread(a, h)      = ccall((:MCL_SingleReadN, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singlewrite(p, a, h)  = ccall((:MCL_SingleWriteN, LIBMADLIB), Cint, (Cdouble, Cuint, Cint), p, a, h)

function moveto(pos, axis, handle, cal; settle=0.4)
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
        println("X range 0-$(round(cal, digits=3)) um, starting at $(round(start, digits=3)) um")
        println()

        targets = vcat(0.0:10.0:50.0, 40.0:-10.0:0.0)
        for t in targets
            got = moveto(t, AXIS, handle, cal)
            bar = repeat("=", round(Int, got / 2))
            println(lpad(round(t, digits=1), 6), " um -> read ",
                    lpad(round(got, digits=3), 8), "  |", bar)
        end

        println()
        fin = moveto(start, AXIS, handle, cal)
        println("returned to $(round(fin, digits=3)) um")
    finally
        releasehandle(handle)
        println("handle released.")
    end
end

main()
