# serial number: 64849775

serialNo::String = "64849775"


# Build device list: builds a list of all connected devices
function device_list()
    @ccall libkinesis_tcube_ld.TLI_BuildDeviceList()::Cshort
end

# Open device
function tcube_laser_open(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_Open(serialNo::Cstring)::Cshort
end

# Start polling: frequently checks the status of the device in [ms]
function start_polling(serialNo::String, milliseconds::Int32)
    @ccall libkinesis_tcube_ld.LD_StartPolling(serialNo::Cstring, milliseconds::Cint)::Bool
end

# Set open loop mode: so that the laser diode is controlled directly by the user or softeware without any feedback mechanism.
function set_openloopmode(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_SetOpenLoopMode(serialNo::Cstring)::Cshort
end

# Enable output: turns on the laser output
function enable_output(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_EnableOutput(serialNo::Cstring)::Cshort
end

# Set laser set point: sets the current to the laser diode in mA
function set_current(serialNo::String, laserDiodeCurrent::UInt16)
    @ccall libkinesis_tcube_ld.LD_SetLaserSetPoint(serialNo::Cstring, laserDiodeCurrent::Cushort)::Cshort
end

# Stop polling: stops the polling of the device
function stop_polling(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_StopPolling(serialNo::Cstring)::Bool
end

# Close device: closes the device
function tcube_laser_close(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_Close(serialNo::Cstring)::Cshort
end

# Get current: gets the current of the laser diode in mA
function get_current_reading(serialNo::String)
    @ccall libkinesis_tcube_ld.LD_GetLaserDiodeCurrentReading(serialNo::Cstring)::Cshort
end