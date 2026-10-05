# Combined stage + camera demo.
# Steps X across its travel, snaps a frame at each position, saves one HDF5
# with every frame tagged by commanded and measured stage position.
#
# Run: cd ~/src/MicroscopeControl.jl && xvfb-run -a julia --project=. dev/stage_camera_demo.jl
using Dates
using HDF5
using MicroscopeControl
const MC = MicroscopeControl
M = MC.HardwareImplementations.DCAM4
S = MC.HardwareImplementations.MadCityLabs

const OUTDIR   = "/mnt/d/divi_linux_project27/demos"
const LOCALDIR = joinpath(homedir(), "captures")
const POSITIONS = [0.0, 25.0, 50.0, 75.0, 100.0]   # microns, X axis
const AXIS = 1                                      # 1=X, 2=Y, 3=Z

# --- raw madlib calls (stage driver lacks clamping; see notes) ---
getcal(a, h)   = ccall((:MCL_GetCalibration, "libmadlib"), Cdouble, (Cuint, Cint), a, h)
readpos(a, h)  = ccall((:MCL_SingleReadN,    "libmadlib"), Cdouble, (Cuint, Cint), a, h)
writepos(p, a, h) = ccall((:MCL_SingleWriteN, "libmadlib"), Cint, (Cdouble, Cuint, Cint), p, a, h)
inith()        = ccall((:MCL_InitHandle,     "libmadlib"), Cint, ())
releaseh(h)    = ccall((:MCL_ReleaseHandle,  "libmadlib"), Cvoid, (Cint,), h)

function moveto(target, axis, handle, cal; settle = 0.5)
    p = clamp(target, 0.0, cal)
    rc = writepos(p, axis, handle)
    rc != 0 && error("SingleWriteN($p) failed: code $rc")
    sleep(settle)
    readpos(axis, handle)
end

println("=== Stage + camera demo ===")
mkpath(LOCALDIR)
stamp = Dates.format(now(), "yyyy-mm-dd_HHMMSS")

handle = inith()
handle == 0 && error("MCL_InitHandle returned 0 - stage not found.")
cam = M.DCAM4Camera(0)
M.initialize(cam)

try
    cal = getcal(AXIS, handle)
    println("stage handle $handle, X range 0-$(round(cal, digits=3)) um")

    cam.exposure_time = 0.1
    M.setexposuretime!(cam)
    cam.roi = M.CameraROI(0, 0, 1024, 1024)
    println("camera ready, 1024x1024 @ $(cam.exposure_time*1000) ms\n")

    frames    = Dict{String,Any}()
    commanded = Float64[]
    measured  = Float64[]

    for (i, target) in enumerate(POSITIONS)
        actual = moveto(target, AXIS, handle, cal)
        img = nothing
        for attempt in 1:3
            img = M.capture(cam)
            img === nothing || break
            print("(retry $attempt) ")
        end
        img === nothing && error("capture failed at $(target) um: $(cam.last_error)")

        push!(commanded, target)
        push!(measured, actual)
        println("  pos $(lpad(round(target, digits=1), 6)) um -> read $(lpad(round(actual, digits=3), 8)) um   frame $(size(img))  mean $(round(sum(Float64, img)/length(img), digits=1))")

        frames["position_$(lpad(i, 2, '0'))"] = (
            Dict{String,Any}("commanded_um" => target,
                             "measured_um"  => actual,
                             "axis"         => "x",
                             "index"        => i),
            img,
            Dict{String,Any}()
        )
    end

    # stage state reflects where we ended up
    stage = S.MCLStage(id = handle, connectionstatus = true,
                       real_x = measured[end],
                       range_x = (0.0, cal), range_y = (0.0, getcal(2, handle)),
                       range_z = (0.0, getcal(3, handle)))

    cam_attrs,   _, _ = MC.export_state(cam)
    stage_attrs, _, _ = MC.export_state(stage)

    children = Dict{String,Any}(
        "camera" => (cam_attrs,   nothing, Dict{String,Any}()),
        "stage"  => (stage_attrs, nothing, Dict{String,Any}()),
        "frames" => (Dict{String,Any}("n_positions"  => length(POSITIONS),
                                      "commanded_um" => commanded,
                                      "measured_um"  => measured),
                     nothing, frames),
    )
    top = Dict{String,Any}("timestamp" => stamp,
                           "demo"      => "stage_camera_demo",
                           "axis"      => "x")

    local_h5 = joinpath(LOCALDIR, "stage_camera_$(stamp).h5")
    println("\nsaving $local_h5")
    MC.save_attributes_and_data(local_h5, "Main", top, nothing, children)

    mkpath(OUTDIR)
    dest = joinpath(OUTDIR, "stage_camera_$(stamp).h5")
    cp(local_h5, dest; force = true)
    println("copied  $dest")

finally
    println("\nparking stage and shutting down")
    try
        cal = getcal(AXIS, handle)
        moveto(0.0, AXIS, handle, cal)
    catch e
        @warn "park failed" exception = e
    end
    releaseh(handle)
    M.abort(cam); M.shutdown(cam)
    println("clean")
end
