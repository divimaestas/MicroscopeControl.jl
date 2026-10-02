# Read-only TLD001 status query over APT. Changes nothing on the device.
# MGMSG_LD_REQ_STATUSUPDATE 0x0825 -> MGMSG_LD_GET_STATUSUPDATE 0x0826 (20 bytes)
# Data packet (14 bytes): LaserCurrent(word) PhotoCurrent(word)
#   LaserVoltage(word) Reserved(dword) StatusBits(dword)
# Spec: APT Communications Protocol Issue 42.1, pages 319-320.
using LibSerialPort

const TLD001_BITS = [
    (0x00000001, "laser output enabled"),
    (0x00000002, "keyswitch enabled"),
    (0x00000004, "closed loop (power) mode"),
    (0x00000008, "safety interlock enabled"),
    (0x00000010, "TIA range 1 (10uA)"),
    (0x00000020, "TIA range 2 (100uA)"),
    (0x00000040, "TIA range 3 (1mA)"),
    (0x00000080, "TIA range 4 (10mA)"),
    (0x00000100, "cathode grounded"),
    (0x00000200, "external SMA input enabled"),
    (0x00000800, "laser diode open circuit"),
    (0x00001000, "all PSU voltages OK"),
    (0x00002000, "TIA range overlimit"),
    (0x00004000, "TIA range underlimit"),
    (0x40000000, "ERROR"),
]

port = only(filter(p -> occursin("APT_Laser_Diode", p), readdir("/dev/serial/by-id"; join = true)))
sp = LibSerialPort.open(port, 115200)
LibSerialPort.sp_set_flowcontrol(sp.ref, LibSerialPort.SP_FLOWCONTROL_RTSCTS)
LibSerialPort.sp_set_dtr(sp.ref, LibSerialPort.SP_DTR_ON)
sleep(0.05); bytesavailable(sp) > 0 && read(sp)

try
    write(sp, UInt8[0x25, 0x08, 0x00, 0x00, 0x50, 0x01])   # LD_REQ_STATUSUPDATE
    sleep(0.5)
    r = read(sp)
    println("got ", length(r), " bytes")
    println("raw: ", join(string.(r; base = 16, pad = 2), " "))

    if length(r) >= 20 && r[1] == 0x26 && r[2] == 0x08
        current = reinterpret(Int16,  r[7:8])[1]
        photo   = reinterpret(Int16,  r[9:10])[1]
        volts   = reinterpret(Int16,  r[11:12])[1]
        status  = reinterpret(UInt32, r[17:20])[1]

        println("\nlaser current  ", current, "  (", round(current * 200 / 32767, digits = 3), " mA)")
        println("photo current  ", photo)
        println("laser voltage  ", volts, "  (", round(volts / 1000, digits = 3), " V)")
        println("status bits    0x", string(status; base = 16, pad = 8))
        for (mask, name) in TLD001_BITS
            status & mask != 0 && println("    ", name)
        end
    else
        println("\nunexpected reply - check the request message id")
    end
finally
    close(sp)
    println("\nport closed")
end
