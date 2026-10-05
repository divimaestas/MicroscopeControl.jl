# TCube TLD001 (642 nm) — APT-over-serial driver skeleton. READ-ONLY.
#
# Protocol decoded in 2026-10-01 notes §6. 115200 8N1, RTS/CTS.
# Header: msgid(2) param1 param2 dest src, little-endian. dest 0x50, src 0x01.
# Status arrives ONLY by subscription (HW_START_UPDATEMSGS), ~10 Hz,
# and stops after ~50 messages unless LD_ACK_STATUSUPDATE is sent >=1/s.
#
# NO EMISSION. LA_ENABLEOUTPUT (0x0811) is deliberately absent from this file.
# Emission stays blocked until the shutter is under software control.

module TCubeAPT

using LibSerialPort

const PORT_GLOB = "/dev/serial/by-id"
const DEST      = 0x50
const SRC       = 0x01

# message ids
const HW_REQ_INFO            = 0x0005
const HW_GET_INFO            = 0x0006
const HW_START_UPDATEMSGS    = 0x0011
const HW_STOP_UPDATEMSGS     = 0x0012
const LD_GET_STATUSUPDATE    = 0x0826
const LD_ACK_STATUSUPDATE    = 0x0827
const LD_REQ_MAXCURRENTDIGPOT= 0x0818
const LD_GET_MAXCURRENTDIGPOT= 0x0819

"Status bits, from the 10-01 decode of 0x0000084E."
const STATUS_BITS = [
    (0x00000001, "laser output ENABLED"),
    (0x00000002, "keyswitch enabled"),
    (0x00000004, "closed-loop (power) mode"),
    (0x00000008, "safety interlock enabled"),
    (0x00000040, "TIA range 3 (1 mA)"),
    (0x00000800, "laser diode open circuit"),
]

mutable struct TCube
    sp::SerialPort
    port::String
    serial::String
    model::String
    firmware::String
    last_status::Union{Nothing,NamedTuple}
    subscribed::Bool
end

"Find the TCube by its stable by-id path (survives ttyUSB renumbering)."
function find_port()
    isdir(PORT_GLOB) || error("no $PORT_GLOB — is the device attached?")
    for f in readdir(PORT_GLOB)
        occursin("APT_Laser_Diode", f) || continue
        return realpath(joinpath(PORT_GLOB, f))
    end
    error("no APT Laser Diode device under $PORT_GLOB")
end

"6-byte short-form header."
short_msg(id::UInt16, p1::UInt8=0x00, p2::UInt8=0x00) =
    UInt8[id & 0xff, (id >> 8) & 0xff, p1, p2, DEST, SRC]

function open_tcube(port::String = find_port())
    sp = LibSerialPort.open(port, 115200)
    try
        set_flow_control(sp; rts = SP_RTS_FLOW_CONTROL, cts = SP_CTS_FLOW_CONTROL)
    catch e
        # usbip-forwarded FTDI devices reject an explicit RTS set; the
        # RTSCTS flow-control mode below works and is what we actually need.
        try
            LibSerialPort.Lib.sp_set_flowcontrol(sp.ref, LibSerialPort.Lib.SP_FLOWCONTROL_RTSCTS)
        catch e2
            @warn "no hardware flow control available; continuing without it" exception=e2
        end
    end
    sleep(0.1)
    t = TCube(sp, port, "", "", "", nothing, false)
    identify!(t)
    t
end

function close_tcube(t::TCube)
    t.subscribed && unsubscribe!(t)
    close(t.sp)
    println("port closed")
end

"HW_REQ_INFO -> 90-byte reply: serial (dw), model (6 chars), firmware."
function identify!(t::TCube)
    write(t.sp, short_msg(HW_REQ_INFO))
    sleep(0.3)
    nb = bytesavailable(t.sp)
    nb == 0 && error("no reply to HW_REQ_INFO — wrong port, or device busy?")
    buf = read(t.sp, nb)
    length(buf) < 24 && error("short HW_GET_INFO reply: $(length(buf)) bytes")
    sn  = UInt32(buf[7]) | UInt32(buf[8])<<8 | UInt32(buf[9])<<16 | UInt32(buf[10])<<24
    t.serial   = string(Int(sn))
    t.model    = strip(String(copy(buf[11:18])), ['\0', ' '])
    t.firmware = "$(buf[21]).$(buf[20]).$(buf[19])"
    println("serial   ", t.serial)
    println("model    ", t.model)
    println("firmware ", t.firmware)
    t
end

"Decode a 20-byte LD_GET_STATUSUPDATE packet (p.319 layout)."
function decode_status(b::Vector{UInt8})
    length(b) < 20 && return nothing
    u16(i) = UInt16(b[i]) | UInt16(b[i+1])<<8
    u32(i) = UInt32(b[i]) | UInt32(b[i+1])<<8 | UInt32(b[i+2])<<16 | UInt32(b[i+3])<<24
    (laser_current = u16(7),
     photo_current = u16(9),
     laser_voltage = u16(11),
     status_bits   = u32(17))
end

function describe(s::NamedTuple)
    println("  laser current ", s.laser_current,
            "   photo current ", s.photo_current,
            "   laser voltage ", s.laser_voltage)
    println("  status 0x", string(s.status_bits; base = 16, pad = 8))
    for (mask, name) in STATUS_BITS
        println("    ", (s.status_bits & mask) != 0 ? "[x] " : "[ ] ", name)
    end
    (s.status_bits & 0x1) == 0 && println("    => OUTPUT IS DISABLED")
end

"Subscribe, read for `seconds`, acking once per second, then unsubscribe."
function monitor(t::TCube; seconds = 5.0)
    subscribe!(t)
    t0 = time(); lastack = t0; n = 0
    try
        while time() - t0 < seconds
            if bytesavailable(t.sp) >= 20
                pkt = read(t.sp, 20)
                if length(pkt) >= 2 && (UInt16(pkt[1]) | UInt16(pkt[2])<<8) == LD_GET_STATUSUPDATE
                    t.last_status = decode_status(pkt)
                    n += 1
                end
            end
            if time() - lastack > 0.8          # keepalive: >=1/s or stream dies
                write(t.sp, short_msg(LD_ACK_STATUSUPDATE))
                lastack = time()
            end
            sleep(0.02)
        end
    finally
        unsubscribe!(t)
    end
    println("received ", n, " status messages")
    t.last_status === nothing || describe(t.last_status)
    t.last_status
end

function subscribe!(t::TCube)
    write(t.sp, short_msg(HW_START_UPDATEMSGS))
    t.subscribed = true
end

function unsubscribe!(t::TCube)
    write(t.sp, short_msg(HW_STOP_UPDATEMSGS))
    t.subscribed = false
    sleep(0.1)
    bytesavailable(t.sp) > 0 && read(t.sp, bytesavailable(t.sp))  # drain
end

"Short-form query that answers without subscription (10-01 finding)."
function max_current_digpot(t::TCube)
    write(t.sp, short_msg(LD_REQ_MAXCURRENTDIGPOT))
    sleep(0.2)
    nb = bytesavailable(t.sp)
    nb == 0 && return nothing
    b = read(t.sp, nb)
    (UInt16(b[1]) | UInt16(b[2])<<8) == LD_GET_MAXCURRENTDIGPOT ? Int(b[3]) : nothing
end

end # module

# ---------------------------------------------------------------- demo
using .TCubeAPT
println("=== TCube TLD001 APT driver (read-only) ===")
t = TCubeAPT.open_tcube()
mc = TCubeAPT.max_current_digpot(t)
mc === nothing || println("max current digpot ", mc)
println("\nsubscribing for 5 s...")
TCubeAPT.monitor(t; seconds = 5.0)
TCubeAPT.close_tcube(t)
