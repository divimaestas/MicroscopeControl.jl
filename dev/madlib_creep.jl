# Slow full-travel creep on X so the motion is observable.
const LIBMADLIB = "libmadlib"
const AXIS = 1

inithandle()         = ccall((:MCL_InitHandle, LIBMADLIB), Cint, ())
releasehandle(h)     = ccall((:MCL_ReleaseHandle, LIBMADLIB), Cvoid, (Cint,), h)
getcalibration(a, h) = ccall((:MCL_GetCalibration, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singleread(a, h)     = ccall((:MCL_SingleReadN, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singlewrite(p, a, h) = ccall((:MCL_SingleWriteN, LIBMADLIB), Cint, (Cdouble, Cuint, Cint), p, a, h)

function main()
    handle = inithandle()
    handle == 0 && error("MCL_InitHandle returned 0.")
    try
        cal = getcalibration(AXIS, handle)
        hi  = cal - 1.0
        println("creeping X 0 -> $(round(hi, digits=1)) um and back, 2 um steps\n")
        for t in vcat(0.0:2.0:hi, hi:-2.0:0.0)
            p = clamp(t, 0.0, cal)
            rc = singlewrite(p, AXIS, handle)
            rc != 0 && error("write $p failed: $rc")
            sleep(0.15)
            got = singleread(AXIS, handle)
            print("\r  ", lpad(round(got, digits=2), 8), " um  |",
                  repeat("=", round(Int, max(got, 0) / 2)), "    ")
        end
        println("\n\nparking at 0 um")
        singlewrite(0.0, AXIS, handle)
    finally
        releasehandle(handle)
        println("handle released.")
    end
end

main()
