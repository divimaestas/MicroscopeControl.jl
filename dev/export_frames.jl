using HDF5

const CAPROOT = "/mnt/d/divi_linux_project27/captures"
const DSET    = "Main/camera/data"

const HAVE_PNG = try
    @eval using FileIO, ImageCore
    true
catch
    false
end

function write_bmp(path, g::AbstractMatrix{UInt8})
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

function to_gray8(frame, lo, hi)
    d = max(hi - lo, 1)
    round.(UInt8, clamp.((Float32.(frame) .- lo) ./ d, 0, 1) .* 255)
end

function save_frame(outdir, stem, k, frame, lo, hi)
    g = to_gray8(frame, lo, hi)
    if HAVE_PNG
        p = joinpath(outdir, "$(stem)_f$(lpad(k,3,'0')).png")
        save(p, Gray.(reinterpret(N0f8, g)))
        p
    else
        p = joinpath(outdir, "$(stem)_f$(lpad(k,3,'0')).bmp")
        write_bmp(p, g)
        p
    end
end

function export_file(h5path; first_only = false)
    folder = dirname(h5path)
    stem   = replace(basename(h5path), r"\.h5$"i => "")
    outdir = joinpath(folder, "png")
    mkpath(outdir)
    # Two layouts exist: the GUI writes Main/camera/data as a 1024x1024xN
    # stack; rig scans write Main/frames/position_NN/data, one 2-D frame per
    # position. Find image-shaped datasets instead of assuming a path.
    a = h5open(h5path, "r") do f
        if haskey(f, DSET)
            read(f[DSET])
        else
            paths = String[]
            function walk(o, prefix)
                for k in sort(collect(keys(o)))
                    c = o[k]
                    p2 = prefix == "" ? k : prefix * "/" * k
                    if c isa HDF5.Group
                        walk(c, p2)
                    elseif ndims(c) >= 2 && size(c, 1) > 4 && size(c, 2) > 4
                        push!(paths, p2)
                    end
                end
            end
            walk(f, "")
            isempty(paths) && error("no image-like dataset in $h5path")
            frames = [read(f[q]) for q in paths]
            if length(frames) == 1
                frames[1]
            else
                cat(frames...; dims = ndims(frames[1]) + 1)
            end
        end
    end
    nframes = size(a, 3)
    lo, hi  = extrema(a)
    mean_   = round(sum(Float64, a) / length(a), digits = 1)
    println(basename(h5path), "  ", size(a), "  range ", (lo, hi), "  mean ", mean_)
    if hi == lo
        println("   FLAT frame - nothing was captured")
        return String[]
    end
    written = String[]
    for k in (first_only ? (1:1) : 1:nframes)
        push!(written, save_frame(outdir, stem, k, (@view a[:, :, k]), lo, hi))
    end
    written
end

function export_folder(dir; first_only = false)
    files = sort(filter(f -> endswith(lowercase(f), ".h5"), readdir(dir; join = true)))
    isempty(files) && (println("no .h5 files in ", dir); return)
    println("=== ", dir, " ===")
    total = 0
    for f in files
        try
            total += length(export_file(f; first_only = first_only))
        catch e
            println(basename(f), "  FAILED: ", sprint(showerror, e))
        end
    end
    println("wrote ", total, " image(s) to ", joinpath(dir, "png"))
end

function newest_folder()
    dirs = filter(isdir, readdir(CAPROOT; join = true))
    sort(dirs; by = d -> stat(d).mtime)[end]
end

function main()
    args = filter(a -> a != "--first", ARGS)
    first_only = "--first" in ARGS
    target = isempty(args) ? newest_folder() : args[1]
    HAVE_PNG || println("(ImageIO not available - writing BMP instead of PNG)")
    if isfile(target)
        export_file(target; first_only = first_only)
        println("wrote to ", joinpath(dirname(target), "png"))
    elseif isdir(target)
        export_folder(target; first_only = first_only)
    else
        println("not found: ", target)
    end
end

main()
