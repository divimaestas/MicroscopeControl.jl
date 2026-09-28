function TLI_BuildDeviceList()
    ccall((:TLI_BuildDeviceList, libkinesis_tcube_ld), Cshort, ())
end

# no prototype is found for this function at Thorlabs.MotionControl.TCube.LaserDiode.h:201:32, please use with caution
function TLI_GetDeviceListSize()
    ccall((:TLI_GetDeviceListSize, libkinesis_tcube_ld), Cshort, ())
end

function TLI_GetDeviceList(stringsReceiver)
    #ccall((:TLI_GetDeviceList, libkinesis_tcube_ld), Cshort, (Ptr{Ptr{SAFEARRAY}},), stringsReceiver)
    ccall((:TLI_GetDeviceList, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), stringsReceiver)
end

function TLI_GetDeviceListByType(stringsReceiver, typeID)
    ccall((:TLI_GetDeviceListByType, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Cint), stringsReceiver, typeID)
end

function TLI_GetDeviceListByTypes(stringsReceiver, typeIDs, length)
    ccall((:TLI_GetDeviceListByTypes, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Ptr{Cint}, Cint), stringsReceiver, typeIDs, length)
end

function TLI_GetDeviceListExt(receiveBuffer, sizeOfBuffer)
    ccall((:TLI_GetDeviceListExt, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, DWORD), receiveBuffer, sizeOfBuffer)
end

function TLI_GetDeviceListByTypeExt(receiveBuffer, sizeOfBuffer, typeID)
    ccall((:TLI_GetDeviceListByTypeExt, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, DWORD, Cint), receiveBuffer, sizeOfBuffer, typeID)
end

function TLI_GetDeviceListByTypesExt(receiveBuffer, sizeOfBuffer, typeIDs, length)
    ccall((:TLI_GetDeviceListByTypesExt, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, DWORD, Ptr{Cint}, Cint), receiveBuffer, sizeOfBuffer, typeIDs, length)
end

function TLI_GetDeviceInfo(serialNo, info)
    ccall((:TLI_GetDeviceInfo, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Ptr{TLI_DeviceInfo}), serialNo, info)
end

# no prototype is found for this function at Thorlabs.MotionControl.TCube.LaserDiode.h:313:31, please use with caution
function TLI_InitializeSimulations()
    ccall((:TLI_InitializeSimulations, libkinesis_tcube_ld), Cvoid, ())
end

# no prototype is found for this function at Thorlabs.MotionControl.TCube.LaserDiode.h:317:31, please use with caution
function TLI_UninitializeSimulations()
    ccall((:TLI_UninitializeSimulations, libkinesis_tcube_ld), Cvoid, ())
end

function LD_Open(serialNo)
    ccall((:LD_Open, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_Close(serialNo)
    ccall((:LD_Close, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar},), serialNo)
end

function LD_CheckConnection(serialNo)
    ccall((:LD_CheckConnection, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar},), serialNo)
end

function LD_Identify(serialNo)
    ccall((:LD_Identify, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar},), serialNo)
end

function LD_GetHardwareInfo(serialNo, modelNo, sizeOfModelNo, type, numChannels, notes, sizeOfNotes, firmwareVersion, hardwareVersion, modificationState)
    ccall((:LD_GetHardwareInfo, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Ptr{Cchar}, DWORD, Ptr{WORD}, Ptr{WORD}, Ptr{Cchar}, DWORD, Ptr{DWORD}, Ptr{WORD}, Ptr{WORD}), serialNo, modelNo, sizeOfModelNo, type, numChannels, notes, sizeOfNotes, firmwareVersion, hardwareVersion, modificationState)
end

function LD_GetHardwareInfoBlock(serialNo, hardwareInfo)
    ccall((:LD_GetHardwareInfoBlock, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Ptr{TLI_HardwareInformation}), serialNo, hardwareInfo)
end

function LD_GetFirmwareVersion(serialNo)
    ccall((:LD_GetFirmwareVersion, libkinesis_tcube_ld), DWORD, (Ptr{Cchar},), serialNo)
end

function LD_GetSoftwareVersion(serialNo)
    ccall((:LD_GetSoftwareVersion, libkinesis_tcube_ld), DWORD, (Ptr{Cchar},), serialNo)
end

function LD_LoadSettings(serialNo)
    ccall((:LD_LoadSettings, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar},), serialNo)
end

function LD_LoadNamedSettings(serialNo, settingsName)
    ccall((:LD_LoadNamedSettings, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar}, Ptr{Cchar}), serialNo, settingsName)
end

function LD_PersistSettings(serialNo)
    ccall((:LD_PersistSettings, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar},), serialNo)
end

function LD_Disable(serialNo)
    ccall((:LD_Disable, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_Enable(serialNo)
    ccall((:LD_Enable, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_ClearMessageQueue(serialNo)
    ccall((:LD_ClearMessageQueue, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar},), serialNo)
end

function LD_RegisterMessageCallback(serialNo, functionPointer)
    ccall((:LD_RegisterMessageCallback, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}), serialNo, functionPointer)
end

function LD_MessageQueueSize(serialNo)
    ccall((:LD_MessageQueueSize, libkinesis_tcube_ld), Cint, (Ptr{Cchar},), serialNo)
end

function LD_GetNextMessage(serialNo, messageType, messageID, messageData)
    ccall((:LD_GetNextMessage, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar}, Ptr{WORD}, Ptr{WORD}, Ptr{DWORD}), serialNo, messageType, messageID, messageData)
end

function LD_WaitForMessage(serialNo, messageType, messageID, messageData)
    ccall((:LD_WaitForMessage, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar}, Ptr{WORD}, Ptr{WORD}, Ptr{DWORD}), serialNo, messageType, messageID, messageData)
end

function LD_SetOpenLoopMode(serialNo)
    ccall((:LD_SetOpenLoopMode, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_SetClosedLoopMode(serialNo)
    ccall((:LD_SetClosedLoopMode, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_EnableMaxCurrentAdjust(serialNo, enableAdjust, enableDiode)
    ccall((:LD_EnableMaxCurrentAdjust, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, CPPBOOL, CPPBOOL), serialNo, enableAdjust, enableDiode)
end

function LD_RequestMaxCurrentDigPot(serialNo)
    ccall((:LD_RequestMaxCurrentDigPot, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetMaxCurrentDigPot(serialNo)
    ccall((:LD_GetMaxCurrentDigPot, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_SetMaxCurrentDigPot(serialNo, maxCurrent)
    ccall((:LD_SetMaxCurrentDigPot, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, WORD), serialNo, maxCurrent)
end

function LD_FindTIAGain(serialNo)
    ccall((:LD_FindTIAGain, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_EnableTIAGainAdjust(serialNo, enable)
    ccall((:LD_EnableTIAGainAdjust, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, CPPBOOL), serialNo, enable)
end

function LD_DisableOutput(serialNo)
    ccall((:LD_DisableOutput, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_EnableOutput(serialNo)
    ccall((:LD_EnableOutput, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_RequestControlSource(serialNo)
    ccall((:LD_RequestControlSource, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetControlSource(serialNo)
    ccall((:LD_GetControlSource, libkinesis_tcube_ld), LD_InputSourceFlags, (Ptr{Cchar},), serialNo)
end

function LD_SetControlSource(serialNo, source)
    ccall((:LD_SetControlSource, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, LD_InputSourceFlags), serialNo, source)
end

function LD_GetInterlockState(serialNo)
    ccall((:LD_GetInterlockState, libkinesis_tcube_ld), BYTE, (Ptr{Cchar},), serialNo)
end

function LD_RequestDisplay(serialNo)
    ccall((:LD_RequestDisplay, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetDisplayUnits(serialNo)
    ccall((:LD_GetDisplayUnits, libkinesis_tcube_ld), LD_DisplayUnits, (Ptr{Cchar},), serialNo)
end

function LD_SetDisplayUnits(serialNo, units)
    ccall((:LD_SetDisplayUnits, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, LD_DisplayUnits), serialNo, units)
end

function LD_GetLEDBrightness(serialNo)
    ccall((:LD_GetLEDBrightness, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_SetLEDBrightness(serialNo, brightness)
    ccall((:LD_SetLEDBrightness, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Cshort), serialNo, brightness)
end

function LD_RequestLaserSetPoint(serialNo)
    ccall((:LD_RequestLaserSetPoint, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetLaserSetPoint(serialNo)
    ccall((:LD_GetLaserSetPoint, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_SetLaserSetPoint(serialNo, laserDiodeCurrent)
    ccall((:LD_SetLaserSetPoint, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, WORD), serialNo, laserDiodeCurrent)
end

function LD_RequestStatus(serialNo)
    ccall((:LD_RequestStatus, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_RequestReadings(serialNo)
    ccall((:LD_RequestReadings, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_RequestStatusBits(serialNo)
    ccall((:LD_RequestStatusBits, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetPhotoCurrentReading(serialNo)
    ccall((:LD_GetPhotoCurrentReading, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_GetVoltageReading(serialNo)
    ccall((:LD_GetVoltageReading, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_GetLaserDiodeCurrentReading(serialNo)
    ccall((:LD_GetLaserDiodeCurrentReading, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_RequestLaserDiodeMaxCurrentLimit(serialNo)
    ccall((:LD_RequestLaserDiodeMaxCurrentLimit, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetLaserDiodeMaxCurrentLimit(serialNo)
    ccall((:LD_GetLaserDiodeMaxCurrentLimit, libkinesis_tcube_ld), WORD, (Ptr{Cchar},), serialNo)
end

function LD_RequestWACalibFactor(serialNo)
    ccall((:LD_RequestWACalibFactor, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetWACalibFactor(serialNo)
    ccall((:LD_GetWACalibFactor, libkinesis_tcube_ld), Cfloat, (Ptr{Cchar},), serialNo)
end

function LD_SetWACalibFactor(serialNo, calibFactor)
    ccall((:LD_SetWACalibFactor, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, Cfloat), serialNo, calibFactor)
end

function LD_RequestLaserPolarity(serialNo)
    ccall((:LD_RequestLaserPolarity, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

function LD_GetLaserPolarity(serialNo)
    ccall((:LD_GetLaserPolarity, libkinesis_tcube_ld), LD_POLARITY, (Ptr{Cchar},), serialNo)
end

function LD_SetLaserPolarity(serialNo, polarity)
    ccall((:LD_SetLaserPolarity, libkinesis_tcube_ld), Cshort, (Ptr{Cchar}, LD_POLARITY), serialNo, polarity)
end

function LD_GetStatusBits(serialNo)
    ccall((:LD_GetStatusBits, libkinesis_tcube_ld), DWORD, (Ptr{Cchar},), serialNo)
end

function LD_StartPolling(serialNo, milliseconds)
    ccall((:LD_StartPolling, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar}, Cint), serialNo, milliseconds)
end

function LD_PollingDuration(serialNo)
    ccall((:LD_PollingDuration, libkinesis_tcube_ld), Clong, (Ptr{Cchar},), serialNo)
end

function LD_StopPolling(serialNo)
    ccall((:LD_StopPolling, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar},), serialNo)
end

function LD_TimeSinceLastMsgReceived(serialNo, arg2)
    ccall((:LD_TimeSinceLastMsgReceived, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar}, __int64), serialNo, arg2)
end

function LD_EnableLastMsgTimer(serialNo, enable, lastMsgTimeout)
    ccall((:LD_EnableLastMsgTimer, libkinesis_tcube_ld), Cvoid, (Ptr{Cchar}, CPPBOOL, __int32), serialNo, enable, lastMsgTimeout)
end

function LD_HasLastMsgTimerOverrun(serialNo)
    ccall((:LD_HasLastMsgTimerOverrun, libkinesis_tcube_ld), CPPBOOL, (Ptr{Cchar},), serialNo)
end

function LD_RequestSettings(serialNo)
    ccall((:LD_RequestSettings, libkinesis_tcube_ld), Cshort, (Ptr{Cchar},), serialNo)
end

