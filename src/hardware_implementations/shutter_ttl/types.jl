"""
    ShutterTTL

A Thorlabs SH05 shutter driven by a KSC101 solenoid controller in trigger
mode. The controller is switched by one digital output line on the NI-DAQ
card: high opens the shutter, low closes it.

Ported from `MIC_ShutterTTL` (Farzin Farzam, Lidke Lab, 2017) in
LidkeLab/matlab-instrument-control.

# Fields
- `unique_id`: identifier for state export.
- `daq`: the DAQ card that owns the line.
- `channel`: full DO line name, e.g. "Dev1/port0/line3".
- `is_open`: last commanded state. Not a hardware readback.
"""
mutable struct ShutterTTL <: AbstractInstrument
    unique_id::String
    daq::NIdaq
    channel::String
    is_open::Bool
end

"""
    ShutterTTL(channel; unique_id, daq)

Construct a shutter on `channel` and close it, so the line starts in a
known state.
"""
function ShutterTTL(channel::String;
                    unique_id::String = "ShutterTTL",
                    daq::NIdaq = NIdaq())
    sh = ShutterTTL(unique_id, daq, channel, false)
    close_shutter(sh)
    return sh
end
