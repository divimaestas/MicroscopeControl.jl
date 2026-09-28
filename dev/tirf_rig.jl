# tirf_rig.jl — Julia port of microscope-tirf/devices_basic.m
# Rig: Olympus IX71 TIRF, Lidke Lab. Status column reflects Linux validation as of 2026-09-28.
using MicroscopeControl
H = MicroscopeControl.HardwareImplementations

# ROI presets from devices_basic.m, MATLAB order [x0 x1 y0 y1], 1-based inclusive.
const ROI_CENTER_512  = (769, 1280, 769, 1280)
const ROI_CENTER_256  = (897, 1152, 897, 1152)
const ROI_UL_512      = (513, 1024, 513, 1024)
const ROI_UR_512      = (1025, 1536, 513, 1024)
const ROI_LL_512      = (513, 1024, 1025, 1536)
const ROI_LR_512      = (1025, 1536, 1025, 1536)

# --- Camera: C11440-22CU. VERIFIED on Linux (DCAM-API Lite 26.6.7175). ---
cam = H.DCAM4.DCAM4Camera(0)
H.DCAM4.initialize(cam)

# --- DAQ: NI PCIe-6323. Needs native Linux + NI-DAQmx; not reachable from WSL. ---
# daq = H.NIDAQcard.NIdaq()
# dev = first(H.NIDAQcard.showdevices(daq))   # never hardcode "Dev1"

# --- Lamp: IX71, ao3 + Port0/Line12. Open question: is DaqTrLight missing the TTL line? ---
# lamp = H.DaqTrLight(...)

# --- Stage: MCL Nano-LPS100. Waiting on Linux Madlib from MCL. ---
# stage = H.MCLStage()

# --- 488: shutter only, Port0/Line4 (shutter-ttl branch). ---
# l488 = H.ShutterTTL(daq, "$dev/port0/line4")

# --- 642: TCube TLD001 S/N 64838719. Kinesis is Windows-only; needs APT-over-serial port. ---
# l642 = H.TCubeLaser("64838719")

# --- 405 (ao1 + Port0/Line3) and 561 (COM4 + ND wheel + Port1/Line1): commented out in
#     devices_basic.m but still part of the rig. DAQ-gated; native install. ---
