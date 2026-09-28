module PI_N472
    using ...MicroscopeControl.HardwareInterfaces.StageInterface
    using GLMakie

    import ...MicroscopeControl: export_state, initialize, shutdown, gui

    using ...Libraries: libpigcs2


    include("constants_GCS2.jl")
    include("functions_GCS2.jl")
    include("types.jl")
    include("helper.jl")
    include("interface_methods.jl")
    include("gui.jl")

    export N472
    # `reference` was exported but never implemented (only `reference_ref` is
    # defined, unexported, in helper.jl); dropped.
    export setvel
    export gui
end