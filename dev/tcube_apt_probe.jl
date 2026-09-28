# Proof that the TCube TLD001 (642 laser) answers APT protocol over its FTDI
# serial link from Julia, with no Kinesis library. Verified 2026-09-28:
# 90-byte MGMSG_HW_GET_INFO reply, serial 64838719, model TLD001.
#
# Port settings per the Thorlabs APT protocol spec: 115200 8N1, RTS/CTS, DTR on.
# Header is 6 bytes little-endian: msgid(2) param1 param2 dest src.
# dest 0x50 = generic USB unit, src 0x01 = host.
#
# Next: replace tcube_laser/tcubeapi.jl's nine Kinesis calls with the
# matching LA_* messages from the APT spec (enable/disable output, set/req
# params, req readings, status update). Read-only messages first.
using LibSerialPort

port = only(filter(p -> occursin("APT_Laser_Diode", p), readdir("/dev/serial/by-id"; join = true)))
sp = LibSerialPort.open(port, 115200)
LibSerialPort.sp_set_flowcontrol(sp.ref, LibSerialPort.SP_FLOWCONTROL_RTSCTS)
LibSerialPort.sp_set_dtr(sp.ref, LibSerialPort.SP_DTR_ON)
sleep(0.05); bytesavailable(sp) > 0 && read(sp)

write(sp, UInt8[0x05, 0x00, 0x00, 0x00, 0x50, 0x01])   # MGMSG_HW_REQ_INFO
sleep(0.5)
r = read(sp)
println("got ", length(r), " bytes")
if length(r) >= 90
    println("serial = ", reinterpret(UInt32, r[7:10])[1])
    println("model  = ", strip(String(r[11:18]), '\0'))
    println("fw     = ", join(reverse(r[21:23]), "."))
end
close(sp)
