# Read-only first contact with the MCL Nano-Drive.
# No motion. Does not write position. Safe with the objective in place.

const LIBMADLIB = "libmadlib"

function dllversion()
    v = Ref{Int16}(0); r = Ref{Int16}(0)
    ccall((:MCL_DLLVersion, LIBMADLIB), Cvoid, (Ptr{Int16}, Ptr{Int16}), v, r)
    (v[], r[])
end

inithandle()         = ccall((:MCL_InitHandle, LIBMADLIB), Cint, ())
releasehandle(h)     = ccall((:MCL_ReleaseHandle, LIBMADLIB), Cvoid, (Cint,), h)
getserialnumber(h)   = ccall((:MCL_GetSerialNumber, LIBMADLIB), Cint, (Cint,), h)
getcalibration(a, h) = ccall((:MCL_GetCalibration, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singleread(a, h)     = ccall((:MCL_SingleReadN, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
printdeviceinfo(h)   = ccall((:MCL_PrintDeviceInfo, LIBMADLIB), Cvoid, (Cint,), h)

function main()
    println("Madlib DLL version: ", dllversion())

    handle = inithandle()
    handle == 0 && error("MCL_InitHandle returned 0 - no device, or permissions.")
    println("handle = ", handle)

    try
        println("serial = ", getserialnumber(handle))
        println("--- MCL_PrintDeviceInfo ---")
        printdeviceinfo(handle)
        println("---------------------------")
        for axis in 1:3
            cal  = getcalibration(axis, handle)
            pos  = singleread(axis, handle)
            name = ("X", "Y", "Z")[axis]
            if cal < 0
                println("axis $axis ($name): not present or error (code $cal)")
            else
                println("axis $axis ($name): range 0-$(cal) um, now at $(pos) um")
            end
        end
    finally
        releasehandle(handle)
        println("handle released.")
    end
end

main()
