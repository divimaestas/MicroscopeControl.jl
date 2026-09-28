module OK_XEM
    using ...MicroscopeControl.HardwareImplementations.NIDAQcard

    import ...MicroscopeControl: export_state, initialize, shutdown

    using ...Libraries: libokfrontpanel

    include("constants_okFP.jl")
    include("functions_okFP.jl")
    include("types.jl")
    include("interface_methods.jl")

    export XEM
    export setexposure, enable,setupIO, setwirein, activetriggerin, getwireout #, initialize

end