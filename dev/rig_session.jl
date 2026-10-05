#!/usr/bin/env julia
# Long-lived rig session: camera + MCL stage held open across many commands.
# One DCAM init per process. Commands arrive on stdin, one per line.
#
#   cd ~/src/MicroscopeControl.jl
#   xvfb-run -a julia --project=. dev/rig_session.jl
#
# Commands:
#   status                  camera + stage state
#   read [x|y|z|all]        stage position
#   move <axis> by <um>     relative move
#   move <axis> to <um>     absolute move
#   park [axis|all]         to 0 um
#   snap | collect          one frame, report stats
#   scan <axis> <start> <stop> <n>   move+collect series, saves .h5
#   exposure <seconds>
#   help / quit
using Dates, HDF5, MicroscopeControl
const MC = MicroscopeControl
M = MC.HardwareImplementations.DCAM4

const LOCALDIR = joinpath(homedir(), "captures")
const OUTDIR   = "/mnt/d/divi_linux_project27/demos"
const AXES = Dict("x" => 1, "y" => 2, "z" => 3)
axname(i) = ("x","y","z")[i]

getcal(a,h)      = ccall((:MCL_GetCalibration,"libmadlib"), Cdouble,(Cuint,Cint),a,h)
readpos(a,h)     = ccall((:MCL_SingleReadN,"libmadlib"),   Cdouble,(Cuint,Cint),a,h)
writepos(p,a,h)  = ccall((:MCL_SingleWriteN,"libmadlib"),  Cint,(Cdouble,Cuint,Cint),p,a,h)
inith()          = ccall((:MCL_InitHandle,"libmadlib"),    Cint,())
releaseh(h)      = ccall((:MCL_ReleaseHandle,"libmadlib"), Cvoid,(Cint,),h)
getserial(h)     = ccall((:MCL_GetSerialNumber,"libmadlib"),Cint,(Cint,),h)

function moveto(target, axis, h, cal; settle=0.4)
    p = clamp(target, 0.0, cal)
    rc = writepos(p, axis, h)
    rc != 0 && error("write $(round(p,digits=3)) um failed: code $rc")
    sleep(settle)
    readpos(axis, h)
end

# NB: not named `collect` -- that would shadow Base.collect, used below.
function collect_frame(cam)
    for attempt in 1:3
        img = M.capture(cam)
        img === nothing || return img
        @warn "capture retry $attempt" err=cam.last_error
    end
    return nothing
end

println("=== rig session ===")
mkpath(LOCALDIR)
handle = inith()
handle == 0 && error("stage: MCL_InitHandle returned 0")
cal = Dict(a => getcal(a, handle) for a in 1:3)
println("stage  serial $(getserial(handle)), ranges ",
        join(["$(axname(a)) 0-$(round(cal[a],digits=1))" for a in 1:3], "  "))

cam = M.DCAM4Camera(0)
M.initialize(cam)
cam.exposure_time = 0.1
M.setexposuretime!(cam)
cam.roi = M.CameraROI(0, 0, 1024, 1024)
println("camera ready. type 'help' for commands.\n")

try
    while true
        print("rig> "); flush(stdout)
        line = readline(stdin)
        isempty(line) && eof(stdin) && break
        parts = split(strip(line))
        isempty(parts) && continue
        cmd = lowercase(parts[1])

        try
            if cmd in ("quit","exit")
                break

            elseif cmd == "help"
                println("status | read [axis] | move <axis> by|to <um> | park [axis] |")
                println("snap (collect) | scan <axis> <start> <stop> <n> | exposure <sec> | quit")

            elseif cmd == "status"
                println("  camera exposure $(cam.exposure_time)s  roi $(cam.roi.width)x$(cam.roi.height)  running=$(cam.is_running)")
                for a in 1:3
                    println("  stage $(axname(a))  $(round(readpos(a,handle),digits=3)) um  (0-$(round(cal[a],digits=3)))")
                end

            elseif cmd == "read"
                axs = length(parts) > 1 && lowercase(parts[2]) != "all" ? [AXES[lowercase(parts[2])]] : [1,2,3]
                for a in axs
                    println("  $(axname(a))  $(round(readpos(a,handle),digits=3)) um")
                end

            elseif cmd == "move"
                a = AXES[lowercase(parts[2])]
                v = parse(Float64, parts[4])
                tgt = lowercase(parts[3]) == "by" ? readpos(a,handle) + v : v
                got = moveto(tgt, a, handle, cal[a])
                println("  $(axname(a)) -> $(round(got,digits=3)) um")

            elseif cmd == "park"
                axs = length(parts) > 1 && lowercase(parts[2]) != "all" ? [AXES[lowercase(parts[2])]] : [1,2,3]
                for a in axs
                    println("  $(axname(a)) -> $(round(moveto(0.0,a,handle,cal[a]),digits=3)) um")
                end

            elseif cmd == "exposure"
                cam.exposure_time = parse(Float64, parts[2])
                M.setexposuretime!(cam)
                println("  exposure $(cam.exposure_time) s")

            elseif cmd == "collect" || cmd == "snap"
                img = collect_frame(cam)
                img === nothing ? println("  FAILED: $(cam.last_error)") :
                    println("  $(size(img))  range $(extrema(img))  mean $(round(sum(Float64,img)/length(img),digits=1))")

            elseif cmd == "scan"
                a  = AXES[lowercase(parts[2])]
                p0 = parse(Float64, parts[3]); p1 = parse(Float64, parts[4])
                n  = parse(Int, parts[5])
                targets = n == 1 ? [p0] : collect(range(p0, p1, length=n))
                frames = Dict{String,Any}(); commanded = Float64[]; measured = Float64[]
                for (i,t) in enumerate(targets)
                    actual = moveto(t, a, handle, cal[a])
                    img = collect_frame(cam)
                    img === nothing && error("collect failed at $(t) um")
                    push!(commanded, t); push!(measured, actual)
                    println("  $(lpad(round(t,digits=1),7)) um -> $(lpad(round(actual,digits=3),8)) um   mean $(round(sum(Float64,img)/length(img),digits=1))")
                    frames["position_$(lpad(i,2,'0'))"] = (
                        Dict{String,Any}("commanded_um"=>t, "measured_um"=>actual,
                                         "axis"=>axname(a), "index"=>i), img, Dict{String,Any}())
                end
                stamp = Dates.format(now(), "yyyy-mm-dd_HHMMSS")
                cam_attrs, _, _ = MC.export_state(cam)
                children = Dict{String,Any}(
                    "camera" => (cam_attrs, nothing, Dict{String,Any}()),
                    "frames" => (Dict{String,Any}("n_positions"=>length(targets),
                                                  "commanded_um"=>commanded,
                                                  "measured_um"=>measured,
                                                  "axis"=>axname(a)), nothing, frames))
                f = joinpath(LOCALDIR, "scan_$(stamp).h5")
                MC.save_attributes_and_data(f, "Main",
                    Dict{String,Any}("timestamp"=>stamp, "kind"=>"scan"), nothing, children)
                println("  saved $f")
                try
                    mkpath(OUTDIR); cp(f, joinpath(OUTDIR, basename(f)); force=true)
                    println("  copied $(joinpath(OUTDIR, basename(f)))")
                catch e
                    @warn "copy to OUTDIR failed" exception=e
                end

            else
                println("  unknown command: $cmd  (try 'help')")
            end
        catch e
            println("  error: ", e isa ErrorException ? e.msg : e)
        end
    end
finally
    println("\nparking and shutting down")
    for a in 1:3
        try moveto(0.0, a, handle, cal[a]) catch; end
    end
    releaseh(handle)
    M.abort(cam); M.shutdown(cam)
    println("clean")
end
