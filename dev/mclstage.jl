#!/usr/bin/env julia
# CLI for the MCL Nano-Drive.
#
#   julia mclstage.jl status
#   julia mclstage.jl read  --axis z
#   julia mclstage.jl move  --axis x --by 5
#   julia mclstage.jl move  --axis z --to 50 --settle 0.5
#   julia mclstage.jl park  --axis all
#
# Any command accepts --json for machine-readable output.
# Exits nonzero on error.

const LIBMADLIB = "libmadlib"
const AXES = Dict("x" => 1, "y" => 2, "z" => 3)

inithandle()         = ccall((:MCL_InitHandle, LIBMADLIB), Cint, ())
releasehandle(h)     = ccall((:MCL_ReleaseHandle, LIBMADLIB), Cvoid, (Cint,), h)
getserial(h)         = ccall((:MCL_GetSerialNumber, LIBMADLIB), Cint, (Cint,), h)
getcalibration(a, h) = ccall((:MCL_GetCalibration, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singleread(a, h)     = ccall((:MCL_SingleReadN, LIBMADLIB), Cdouble, (Cuint, Cint), a, h)
singlewrite(p, a, h) = ccall((:MCL_SingleWriteN, LIBMADLIB), Cint, (Cdouble, Cuint, Cint), p, a, h)

const ERRS = Dict(-1 => "general error", -2 => "device error", -3 => "device not attached",
                  -4 => "usage error", -5 => "device not ready", -6 => "argument error",
                  -7 => "invalid axis", -8 => "invalid handle")
errname(c) = get(ERRS, c, "code $c")

function parseargs(argv)
    length(argv) == 0 && return ("help", Dict{String,Any}())
    cmd = argv[1]
    opts = Dict{String,Any}()
    i = 2
    while i <= length(argv)
        a = argv[i]
        if a == "--json"
            opts["json"] = true; i += 1
        elseif startswith(a, "--")
            i + 1 > length(argv) && error("$a needs a value")
            opts[a[3:end]] = argv[i+1]; i += 2
        else
            error("unexpected argument: $a")
        end
    end
    (cmd, opts)
end

axlist(opts) = begin
    s = lowercase(get(opts, "axis", "all"))
    s == "all" && return [1, 2, 3]
    haskey(AXES, s) || error("bad --axis $s (x, y, z or all)")
    [AXES[s]]
end

axname(i) = ("x", "y", "z")[i]

function moveto(pos, axis, handle, cal, settle)
    p = clamp(pos, 0.0, cal)
    rc = singlewrite(p, axis, handle)
    rc != 0 && error("write $(round(p, digits=3)) um on $(axname(axis)) failed: $(errname(rc))")
    sleep(settle)
    singleread(axis, handle)
end

function emit(rows, opts)
    if get(opts, "json", false)
        println("[", join([string("{\"axis\":\"", r.axis, "\",\"position\":", r.position,
                                  ",\"range\":", r.range, "}") for r in rows], ","), "]")
    else
        for r in rows
            println(rpad(uppercase(r.axis), 2), lpad(round(r.position, digits=3), 10),
                    " um   (0-", round(r.range, digits=3), ")")
        end
    end
end

function main(argv)
    cmd, opts = parseargs(argv)

    if cmd in ("help", "--help", "-h")
        println(read(@__FILE__, String)[1:findfirst("\nconst", read(@__FILE__, String)).start])
        return 0
    end

    handle = inithandle()
    handle == 0 && error("no device (MCL_InitHandle returned 0)")
    settle = parse(Float64, get(opts, "settle", "0.4"))

    try
        if cmd == "status"
            rows = [(axis=axname(a), position=singleread(a, handle),
                     range=getcalibration(a, handle)) for a in 1:3]
            get(opts, "json", false) || println("Nano-Drive serial $(getserial(handle))")
            emit(rows, opts)

        elseif cmd == "read"
            rows = [(axis=axname(a), position=singleread(a, handle),
                     range=getcalibration(a, handle)) for a in axlist(opts)]
            emit(rows, opts)

        elseif cmd == "move"
            haskey(opts, "by") == haskey(opts, "to") &&
                error("give exactly one of --by (relative) or --to (absolute)")
            rows = NamedTuple[]
            for a in axlist(opts)
                cal = getcalibration(a, handle)
                cur = singleread(a, handle)
                tgt = haskey(opts, "by") ? cur + parse(Float64, opts["by"]) :
                                           parse(Float64, opts["to"])
                (tgt < 0 || tgt > cal) &&
                    error("$(axname(a)) target $(round(tgt, digits=3)) um outside 0-$(round(cal, digits=3))")
                got = moveto(tgt, a, handle, cal, settle)
                push!(rows, (axis=axname(a), position=got, range=cal))
            end
            emit(rows, opts)

        elseif cmd == "park"
            rows = NamedTuple[]
            for a in axlist(opts)
                cal = getcalibration(a, handle)
                got = moveto(0.0, a, handle, cal, settle)
                push!(rows, (axis=axname(a), position=got, range=cal))
            end
            emit(rows, opts)

        else
            error("unknown command: $cmd")
        end
    finally
        releasehandle(handle)
    end
    return 0
end

try
    exit(main(ARGS))
catch e
    println(stderr, "error: ", e isa ErrorException ? e.msg : e)
    exit(1)
end
