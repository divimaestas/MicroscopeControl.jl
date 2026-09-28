# Hardware smoke test: DCAM4Camera on Linux (DCAM-API Lite).
# Validated 2026-09-28 on C11440-22CU, DCAM-API Lite v26.6.7175, Ubuntu 26.04.1, via usbipd-win.
# Run: xvfb-run -a julia --project=. dev/linux_camera_smoke.jl
using MicroscopeControl
M = MicroscopeControl.HardwareImplementations.DCAM4

cam = M.DCAM4Camera(0)
M.initialize(cam)
try
    h = cam.camera_handle
    for id in (M.DCAM_IDSTR_MODEL, M.DCAM_IDSTR_CAMERAID, M.DCAM_IDSTR_CAMERAVERSION)
        println(rpad(string(id), 28), " => ", M.dcamdev_getstring(h, id)[2])
    end

    cam.exposure_time = 0.05
    M.setexposuretime!(cam)
    _, v = M.dcamprop_getvalue(h, M.DCAM_IDPROP_EXPOSURETIME)
    println("exposure: asked 0.05, camera says ", v)

    cam.roi = M.CameraROI(0, 0, 1024, 1024)
    r = M.capture(cam)
    println("snap: ", r === nothing ? cam.last_error : (size(r), extrema(r)))

    # sequence() is async: start, wait on is_running, getdata, then abort.
    M.sequence(cam, 5)
    t0 = time()
    while cam.is_running != 0 && time() - t0 < 10; sleep(0.1); end
    d = M.getdata(cam)
    println("sequence: ", d === nothing ? cam.last_error : (size(d), extrema(d)))
finally
    M.abort(cam)
    M.shutdown(cam)
    println("clean shutdown")
end
