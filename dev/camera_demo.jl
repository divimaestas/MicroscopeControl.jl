# Camera control demo: Hamamatsu ORCA-Flash4.0 V2 (C11440-22CU) on Linux
# through MicroscopeControl.jl. Run: xvfb-run -a julia --project=. dev/camera_demo.jl
# Writes camera_demo.bmp to the Windows Desktop (via /mnt/c) and to /tmp.
using MicroscopeControl
M = MicroscopeControl.HardwareImplementations.DCAM4

function write_bmp(path, img::AbstractMatrix{UInt16})
    lo, hi = extrema(img)
    g = round.(UInt8, (Float32.(img) .- lo) ./ max(hi - lo, 1) .* 255)
    h, w = size(g)
    rowbytes = (3w + 3) & ~3
    open(path, "w") do io
        write(io, b"BM", UInt32(54 + rowbytes * h), UInt32(0), UInt32(54))
        write(io, UInt32(40), Int32(w), Int32(h), UInt16(1), UInt16(24), UInt32(0),
                  UInt32(rowbytes * h), Int32(2835), Int32(2835), UInt32(0), UInt32(0))
        pad = zeros(UInt8, rowbytes - 3w)
        for r in h:-1:1
            for c in 1:w
                v = g[r, c]; write(io, v, v, v)
            end
            write(io, pad)
        end
    end
end

println("=== Camera demo: DCAM on Linux ===")
cam = M.DCAM4Camera(0)
M.initialize(cam)
try
    h = cam.camera_handle
    for id in (M.DCAM_IDSTR_VENDOR, M.DCAM_IDSTR_MODEL, M.DCAM_IDSTR_CAMERAID, M.DCAM_IDSTR_CAMERAVERSION)
        println(rpad(replace(string(id), "DCAM_IDSTR_" => ""), 14), M.dcamdev_getstring(h, id)[2])
    end

    cam.exposure_time = 0.1
    M.setexposuretime!(cam)
    _, v = M.dcamprop_getvalue(h, M.DCAM_IDPROP_EXPOSURETIME)
    println("exposure      ", round(v * 1000, digits = 2), " ms")

    cam.roi = M.CameraROI(0, 0, 1024, 1024)
    print("snap          ")
    r = nothing; t = 0.0
    for attempt in 1:3
        t = @elapsed r = M.capture(cam)
        r === nothing || break
        print("(retry $attempt) ")
    end
    r === nothing && error("capture failed: $(cam.last_error)")
    println(size(r), "  range ", extrema(r), "  mean ", round(sum(Float64, r) / length(r), digits = 1), "  ", round(t, digits = 2), " s")

    print("sequence x5   ")
    M.sequence(cam, 5)
    t0 = time(); while cam.is_running != 0 && time() - t0 < 10; sleep(0.05); end
    d = M.getdata(cam)
    println(size(d), "  per-frame mean ", [round(sum(Float64, @view d[:, :, k]) / (size(d, 1) * size(d, 2)), digits = 1) for k in 1:size(d, 3)])

    out = "/tmp/camera_demo.bmp"
    write_bmp(out, r)
    desk = String[]
    try
        prof = strip(read(`cmd.exe /c echo %USERPROFILE%`, String))
        d = strip(read(`wslpath -u $prof`, String)) * "/Desktop"
        isdir(d) && push!(desk, d)
    catch
    end
    isempty(desk) || cp(out, joinpath(first(desk), "camera_demo.bmp"); force = true)
    println("image         ", out, isempty(desk) ? "" : "  and  " * joinpath(first(desk), "camera_demo.bmp"))
finally
    M.abort(cam); M.shutdown(cam)
    println("shutdown clean")
end
