# TIRF SR Collect - two windows: controls (like gui.m) + live camera display.
using Dates, GLMakie, HDF5, Printf, MicroscopeControl
const MC = MicroscopeControl
M = MC.HardwareImplementations.DCAM4
const LOCALDIR = "/mnt/d/divi_linux_project27/captures"
const ROIS = [
 "Full"=>(0,0,2048,2048), "Left"=>(0,0,1024,2048), "Right"=>(1024,0,1024,2048),
 "Left Center"=>(0,512,1024,1024), "Right Center"=>(1024,512,1024,1024),
 "Center Horizontally"=>(512,512,1024,1024), "Left Top"=>(0,0,1024,1024),
 "Left Bottom"=>(0,1024,1024,1024), "Right Top"=>(1024,0,1024,1024),
 "Right Bottom"=>(1024,1024,1024,1024), "Top"=>(0,0,2048,1024),
 "Bottom"=>(0,1024,2048,1024), "Center256"=>(896,896,256,256)]
const LASERS = [("405",0.0,10.0),("488",0.0,100.0),("561",0.0,100.0),("642",0.0,80.0)]

getcal(a,h)=ccall((:MCL_GetCalibration,"libmadlib"),Cdouble,(Cuint,Cint),a,h)
readpos(a,h)=ccall((:MCL_SingleReadN,"libmadlib"),Cdouble,(Cuint,Cint),a,h)
writepos(p,a,h)=ccall((:MCL_SingleWriteN,"libmadlib"),Cint,(Cdouble,Cuint,Cint),p,a,h)
inith()=ccall((:MCL_InitHandle,"libmadlib"),Cint,())
releaseh(h)=ccall((:MCL_ReleaseHandle,"libmadlib"),Cvoid,(Cint,),h)

mkpath(LOCALDIR)
h = inith(); h == 0 && error("stage: InitHandle returned 0 (is 6-5 attached?)")
cal = Dict(a=>getcal(a,h) for a in 1:3)
moveto(t,a) = (p=clamp(t,0.0,cal[a]); rc=writepos(p,a,h);
               rc != 0 && error("write failed: $rc"); sleep(0.4); readpos(a,h))
cam = M.DCAM4Camera(0); M.initialize(cam)
cam.exposure_time = 0.01; M.setexposuretime!(cam)
cam.roi = M.CameraROI(0,1024,1024,1024)
grab() = (for _ in 1:3; im=M.capture(cam); im===nothing || return im; end; nothing)

img  = Observable(zeros(UInt16,1024,1024))
clim = Observable((0.0,1.0))
msg  = Observable("ready")
live = Observable(false); abrt = Observable(false); busy = Observable(false)
function show!(f)
    img[] = f
    lo, hi = extrema(f)
    clim[] = (Float64(lo), Float64(max(hi, lo + 1)))
    return nothing
end

# ---- WINDOW 1: camera display -------------------------------------------
GLMakie.activate!(title="TIRF Camera")
vfig = Figure(size=(820,860))
vax = Axis(vfig[1,1], aspect=DataAspect(), yreversed=true)
hidedecorations!(vax)
vhm = image!(vax, img, colormap=:grays, colorrange=clim)
Colorbar(vfig[1,2], vhm, width=14)
Label(vfig[2,1:2], msg, halign=:left, tellwidth=false)
display(GLMakie.Screen(), vfig)

# ---- WINDOW 2: controls --------------------------------------------------
GLMakie.activate!(title="TIRF SR Collect")
fig = Figure(size=(430,980))
P = fig[1,1] = GridLayout()
r = 0
nr() = (global r += 1)
hdr(t) = Label(P[nr(),1:4], t; font=:bold, fontsize=13, halign=:left, tellwidth=false)
note(t,c) = Label(P[nr(),1:4], t; fontsize=9, color=c, halign=:left, tellwidth=false)

hdr("FILE")
Label(P[nr(),1],"Save Dir",halign=:left,fontsize=11)
tb_dir = Textbox(P[r,2:4], stored_string=LOCALDIR, width=230)
Label(P[nr(),1],"Base Name",halign=:left,fontsize=11)
tb_base = Textbox(P[r,2:4], stored_string="Cell1", width=230)

hdr("CAMERA")
Label(P[nr(),1],"ROI",halign=:left,fontsize=11)
mn_roi = Menu(P[r,2:4], options=first.(ROIS), default="Left Bottom", width=230)
on(mn_roi.selection) do s
    x,y,w,ht = last(ROIS[findfirst(q->first(q)==s,ROIS)])
    cam.roi = M.CameraROI(x,y,w,ht); msg[] = "ROI $s $(w)x$(ht)"
end
Label(P[nr(),1],"Exp Focus",halign=:left,fontsize=11)
tb_ef = Textbox(P[r,2:3], stored_string="0.01", width=110, validator=Float64)
Label(P[nr(),1],"Exp Seq",halign=:left,fontsize=11)
tb_es = Textbox(P[r,2:3], stored_string="0.01", width=110, validator=Float64)
Label(P[nr(),1],"Num Frames",halign=:left,fontsize=11)
tb_nf = Textbox(P[r,2:3], stored_string="10", width=110, validator=Int)

hdr("REGISTRATION")
note("Reg3DTrans not ported (needs DAQ lamp).", :gray50)

hdr("LIGHT SOURCE")
for (nm,lo,hi) in LASERS
    rr = nr(); Label(P[rr,1], "$nm nm", halign=:left, fontsize=11)
    Toggle(P[rr,2], active=false); Toggle(P[rr,3], active=false)
    Textbox(P[rr,4], stored_string="0", width=50, validator=Float64)
end
note("Focus / Acq / Power. DISABLED: shutters are on the\nNI PCIe-6323, unreachable over usbipd.", :firebrick)

hdr("CONTROL")
Label(P[nr(),1],"Num Seq",halign=:left,fontsize=11)
tb_ns = Textbox(P[r,2:3], stored_string="5", width=110, validator=Int)
rr = nr()
b_snap  = Button(P[rr,1:2], label="Snap", width=100)
b_focus = Button(P[rr,3:4], label="Focus (live)", width=120, buttoncolor=RGBf(1,1,.85))
on(b_snap.clicks) do _
    f = grab()
    f === nothing ? (msg[] = "capture FAILED $(cam.last_error)") :
        (show!(f); msg[] = @sprintf("%dx%d  range %d-%d  mean %.1f",
            size(f,1),size(f,2),minimum(f),maximum(f),sum(Float64,f)/length(f)))
end
on(b_focus.clicks) do _
    if live[]; live[] = false; b_focus.label = "Focus (live)"; msg[] = "live off"
    else
        busy[] && return
        v = tryparse(Float64, tb_ef.stored_string[])
        isnothing(v) || (cam.exposure_time = v; M.setexposuretime!(cam))
        live[] = true; b_focus.label = "STOP"
        @async while live[]
            f = grab()
            f === nothing ? (live[] = false; msg[] = "capture failed") : show!(f)
            sleep(0.03); yield()
        end
    end
end
rr = nr()
b_start = Button(P[rr,1:2], label="START", width=100, buttoncolor=RGBf(0,.8,0))
b_abort = Button(P[rr,3:4], label="ABORT", width=120, buttoncolor=RGBf(1,0,1))
on(b_abort.clicks) do _; abrt[] = true; live[] = false; msg[] = "ABORT"; end
on(b_start.clicks) do _
    busy[] && return
    live[] = false; b_focus.label = "Focus (live)"; abrt[] = false
    @async begin
        busy[] = true
        try
            v = tryparse(Float64, tb_es.stored_string[])
            isnothing(v) || (cam.exposure_time = v; M.setexposuretime!(cam))
            ns = parse(Int, tb_ns.stored_string[]); nf = parse(Int, tb_nf.stored_string[])
            stamp = Dates.format(now(),"yyyy-mm-dd_HHMMSS")
            dir = joinpath(tb_dir.stored_string[], "$(tb_base.stored_string[])_$stamp")
            mkpath(dir)
            for s in 1:ns
                abrt[] && (msg[] = "aborted after $(s-1)/$ns"; break)
                stack = Array{UInt16}(undef, cam.roi.width, cam.roi.height, nf)
                for k in 1:nf
                    abrt[] && break
                    f = grab(); f === nothing && error("capture failed at seq $s frame $k")
                    stack[:,:,k] = f
                    k % 5 == 0 && (show!(f); msg[] = "seq $s/$ns  frame $k/$nf")
                end
                abrt[] && break
                ca,_,_ = MC.export_state(cam)
                MC.save_attributes_and_data(
                    joinpath(dir, @sprintf("sequence_%03d.h5", s)), "Main",
                    Dict{String,Any}("timestamp"=>stamp,"kind"=>"sequence","index"=>s,
                                     "n_frames"=>nf),
                    nothing, Dict{String,Any}("camera"=>(ca,stack,Dict{String,Any}())))
                msg[] = "saved sequence $s/$ns"
            end
            abrt[] || (msg[] = "done -> $dir")
        catch e; msg[] = "acquisition failed: $e"
        finally; busy[] = false end
    end
end
rr = nr(); Label(P[rr,1],"Stage z",halign=:left,fontsize=11)
zl = Observable(@sprintf("%.3f um", readpos(3,h)))
Label(P[rr,2:4], zl, halign=:left, fontsize=11)
rr = nr()
for (i,st) in enumerate((-1.0,-0.1,0.1,1.0))
    b = Button(P[rr,i], label=string(st), width=48)
    on(b.clicks) do _
        try zl[] = @sprintf("%.3f um", moveto(readpos(3,h)+st, 3))
        catch e; msg[] = "move failed: $e" end
    end
end

screen = display(GLMakie.Screen(), fig)
println("Two windows open. Close the CONTROL window to shut down.")
wait(screen)
live[] = false
for a in 1:3; try moveto(0.0,a) catch; end; end
releaseh(h); M.abort(cam); M.shutdown(cam); println("clean")
