"""
    ShutterTTLControl

A module for controlling a TTL-triggered shutter through a NIDAQ card.
"""
module ShutterTTLControl

using DAQmx

using ...MicroscopeControl.HardwareImplementations.NIDAQcard
using ...MicroscopeControl: AbstractInstrument

import ...MicroscopeControl: export_state, initialize, shutdown

export ShutterTTL, open_shutter, close_shutter

include("types.jl")
include("interface_methods.jl")

end
