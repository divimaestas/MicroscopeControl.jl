function okFrontPanel_GetDeviceInfoWithSize(hnd, info, size)
    ccall((:okFrontPanel_GetDeviceInfoWithSize, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{okTDeviceInfo}, Cuint), hnd, info, size)
end

function okError_GetMessage(err)
    ccall((:okError_GetMessage, libokfrontpanel), Ptr{Cchar}, (Ptr{okError},), err)
end

function okError_Free(err)
    ccall((:okError_Free, libokfrontpanel), Cvoid, (Ptr{okError},), err)
end

# no prototype is found for this function at okFrontPanel.h:622:27, please use with caution
function okFrontPanel_GetAPIVersionMajor()
    ccall((:okFrontPanel_GetAPIVersionMajor, libokfrontpanel), Cint, ())
end

# no prototype is found for this function at okFrontPanel.h:623:27, please use with caution
function okFrontPanel_GetAPIVersionMinor()
    ccall((:okFrontPanel_GetAPIVersionMinor, libokfrontpanel), Cint, ())
end

# no prototype is found for this function at okFrontPanel.h:624:27, please use with caution
function okFrontPanel_GetAPIVersionMicro()
    ccall((:okFrontPanel_GetAPIVersionMicro, libokfrontpanel), Cint, ())
end

# no prototype is found for this function at okFrontPanel.h:626:35, please use with caution
function okFrontPanel_GetAPIVersionString()
    ccall((:okFrontPanel_GetAPIVersionString, libokfrontpanel), Ptr{Cchar}, ())
end

function okFrontPanel_CheckAPIVersion(major, minor, micro)
    ccall((:okFrontPanel_CheckAPIVersion, libokfrontpanel), Bool, (Cint, Cint, Cint), major, minor, micro)
end

# no prototype is found for this function at okFrontPanel.h:636:1, please use with caution
function okFrontPanel_TryLoadLib()
    ccall((:okFrontPanel_TryLoadLib, libokfrontpanel), Bool, ())
end

# no prototype is found for this function at okFrontPanel.h:652:41, please use with caution
function okPLL22393_Construct()
    ccall((:okPLL22393_Construct, libokfrontpanel), okPLL22393_HANDLE, ())
end

function okPLL22393_Destruct(pll)
    ccall((:okPLL22393_Destruct, libokfrontpanel), Cvoid, (okPLL22393_HANDLE,), pll)
end

function okPLL22393_SetCrystalLoad(pll, capload)
    ccall((:okPLL22393_SetCrystalLoad, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cdouble), pll, capload)
end

function okPLL22393_SetReference(pll, freq)
    ccall((:okPLL22393_SetReference, libokfrontpanel), Cvoid, (okPLL22393_HANDLE, Cdouble), pll, freq)
end

function okPLL22393_GetReference(pll)
    ccall((:okPLL22393_GetReference, libokfrontpanel), Cdouble, (okPLL22393_HANDLE,), pll)
end

function okPLL22393_SetPLLParameters(pll, n, p, q, enable)
    ccall((:okPLL22393_SetPLLParameters, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint, Cint, Cint, Bool), pll, n, p, q, enable)
end

function okPLL22393_SetPLLLF(pll, n, lf)
    ccall((:okPLL22393_SetPLLLF, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint, Cint), pll, n, lf)
end

function okPLL22393_SetOutputDivider(pll, n, div)
    ccall((:okPLL22393_SetOutputDivider, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint, Cint), pll, n, div)
end

function okPLL22393_SetOutputSource(pll, n, clksrc)
    ccall((:okPLL22393_SetOutputSource, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint, ok_ClockSource_22393), pll, n, clksrc)
end

function okPLL22393_SetOutputEnable(pll, n, enable)
    ccall((:okPLL22393_SetOutputEnable, libokfrontpanel), Cvoid, (okPLL22393_HANDLE, Cint, Bool), pll, n, enable)
end

function okPLL22393_GetPLLP(pll, n)
    ccall((:okPLL22393_GetPLLP, libokfrontpanel), Cint, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_GetPLLQ(pll, n)
    ccall((:okPLL22393_GetPLLQ, libokfrontpanel), Cint, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_GetPLLFrequency(pll, n)
    ccall((:okPLL22393_GetPLLFrequency, libokfrontpanel), Cdouble, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_GetOutputDivider(pll, n)
    ccall((:okPLL22393_GetOutputDivider, libokfrontpanel), Cint, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_GetOutputSource(pll, n)
    ccall((:okPLL22393_GetOutputSource, libokfrontpanel), ok_ClockSource_22393, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_GetOutputFrequency(pll, n)
    ccall((:okPLL22393_GetOutputFrequency, libokfrontpanel), Cdouble, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_IsOutputEnabled(pll, n)
    ccall((:okPLL22393_IsOutputEnabled, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint), pll, n)
end

function okPLL22393_IsPLLEnabled(pll, n)
    ccall((:okPLL22393_IsPLLEnabled, libokfrontpanel), Bool, (okPLL22393_HANDLE, Cint), pll, n)
end

# no prototype is found for this function at okFrontPanel.h:677:41, please use with caution
function okPLL22150_Construct()
    ccall((:okPLL22150_Construct, libokfrontpanel), okPLL22150_HANDLE, ())
end

function okPLL22150_Destruct(pll)
    ccall((:okPLL22150_Destruct, libokfrontpanel), Cvoid, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_SetCrystalLoad(pll, capload)
    ccall((:okPLL22150_SetCrystalLoad, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, Cdouble), pll, capload)
end

function okPLL22150_SetReference(pll, freq, extosc)
    ccall((:okPLL22150_SetReference, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, Cdouble, Bool), pll, freq, extosc)
end

function okPLL22150_GetReference(pll)
    ccall((:okPLL22150_GetReference, libokfrontpanel), Cdouble, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_SetVCOParameters(pll, p, q)
    ccall((:okPLL22150_SetVCOParameters, libokfrontpanel), Bool, (okPLL22150_HANDLE, Cint, Cint), pll, p, q)
end

function okPLL22150_GetVCOP(pll)
    ccall((:okPLL22150_GetVCOP, libokfrontpanel), Cint, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_GetVCOQ(pll)
    ccall((:okPLL22150_GetVCOQ, libokfrontpanel), Cint, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_GetVCOFrequency(pll)
    ccall((:okPLL22150_GetVCOFrequency, libokfrontpanel), Cdouble, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_SetDiv1(pll, divsrc, n)
    ccall((:okPLL22150_SetDiv1, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, ok_DividerSource, Cint), pll, divsrc, n)
end

function okPLL22150_SetDiv2(pll, divsrc, n)
    ccall((:okPLL22150_SetDiv2, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, ok_DividerSource, Cint), pll, divsrc, n)
end

function okPLL22150_GetDiv1Source(pll)
    ccall((:okPLL22150_GetDiv1Source, libokfrontpanel), ok_DividerSource, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_GetDiv2Source(pll)
    ccall((:okPLL22150_GetDiv2Source, libokfrontpanel), ok_DividerSource, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_GetDiv1Divider(pll)
    ccall((:okPLL22150_GetDiv1Divider, libokfrontpanel), Cint, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_GetDiv2Divider(pll)
    ccall((:okPLL22150_GetDiv2Divider, libokfrontpanel), Cint, (okPLL22150_HANDLE,), pll)
end

function okPLL22150_SetOutputSource(pll, output, clksrc)
    ccall((:okPLL22150_SetOutputSource, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, Cint, ok_ClockSource_22150), pll, output, clksrc)
end

function okPLL22150_SetOutputEnable(pll, output, enable)
    ccall((:okPLL22150_SetOutputEnable, libokfrontpanel), Cvoid, (okPLL22150_HANDLE, Cint, Bool), pll, output, enable)
end

function okPLL22150_GetOutputSource(pll, output)
    ccall((:okPLL22150_GetOutputSource, libokfrontpanel), ok_ClockSource_22150, (okPLL22150_HANDLE, Cint), pll, output)
end

function okPLL22150_GetOutputFrequency(pll, output)
    ccall((:okPLL22150_GetOutputFrequency, libokfrontpanel), Cdouble, (okPLL22150_HANDLE, Cint), pll, output)
end

function okPLL22150_IsOutputEnabled(pll, output)
    ccall((:okPLL22150_IsOutputEnabled, libokfrontpanel), Bool, (okPLL22150_HANDLE, Cint), pll, output)
end

# no prototype is found for this function at okFrontPanel.h:707:46, please use with caution
function okDeviceSensors_Construct()
    ccall((:okDeviceSensors_Construct, libokfrontpanel), okDeviceSensors_HANDLE, ())
end

function okDeviceSensors_Destruct(hnd)
    ccall((:okDeviceSensors_Destruct, libokfrontpanel), Cvoid, (okDeviceSensors_HANDLE,), hnd)
end

function okDeviceSensors_GetSensorCount(hnd)
    ccall((:okDeviceSensors_GetSensorCount, libokfrontpanel), Cint, (okDeviceSensors_HANDLE,), hnd)
end

function okDeviceSensors_GetSensor(hnd, n)
    ccall((:okDeviceSensors_GetSensor, libokfrontpanel), okTDeviceSensor, (okDeviceSensors_HANDLE, Cint), hnd, n)
end

# no prototype is found for this function at okFrontPanel.h:715:51, please use with caution
function okDeviceSettingNames_Construct()
    ccall((:okDeviceSettingNames_Construct, libokfrontpanel), okDeviceSettingNames_HANDLE, ())
end

function okDeviceSettingNames_Destruct(hnd)
    ccall((:okDeviceSettingNames_Destruct, libokfrontpanel), Cvoid, (okDeviceSettingNames_HANDLE,), hnd)
end

function okDeviceSettingNames_GetCount(hnd)
    ccall((:okDeviceSettingNames_GetCount, libokfrontpanel), Cint, (okDeviceSettingNames_HANDLE,), hnd)
end

function okDeviceSettingNames_Get(hnd, n)
    ccall((:okDeviceSettingNames_Get, libokfrontpanel), Ptr{Cchar}, (okDeviceSettingNames_HANDLE, Cint), hnd, n)
end

# no prototype is found for this function at okFrontPanel.h:723:47, please use with caution
function okDeviceSettings_Construct()
    ccall((:okDeviceSettings_Construct, libokfrontpanel), okDeviceSettings_HANDLE, ())
end

function okDeviceSettings_Destruct(hnd)
    ccall((:okDeviceSettings_Destruct, libokfrontpanel), Cvoid, (okDeviceSettings_HANDLE,), hnd)
end

function okDeviceSettings_GetString(hnd, key, length, buf)
    ccall((:okDeviceSettings_GetString, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, Ptr{Cchar}, Cint, Ptr{Cchar}), hnd, key, length, buf)
end

function okDeviceSettings_SetString(hnd, key, buf)
    ccall((:okDeviceSettings_SetString, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, Ptr{Cchar}, Ptr{Cchar}), hnd, key, buf)
end

function okDeviceSettings_GetInt(hnd, key, value)
    ccall((:okDeviceSettings_GetInt, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, Ptr{Cchar}, Ptr{UINT32}), hnd, key, value)
end

function okDeviceSettings_SetInt(hnd, key, value)
    ccall((:okDeviceSettings_SetInt, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, Ptr{Cchar}, UINT32), hnd, key, value)
end

function okDeviceSettings_Delete(hnd, key)
    ccall((:okDeviceSettings_Delete, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, Ptr{Cchar}), hnd, key)
end

function okDeviceSettings_Save(hnd)
    ccall((:okDeviceSettings_Save, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE,), hnd)
end

function okDeviceSettings_List(hnd, names)
    ccall((:okDeviceSettings_List, libokfrontpanel), ok_ErrorCode, (okDeviceSettings_HANDLE, okDeviceSettingNames_HANDLE), hnd, names)
end

function okBuffer_Construct(size)
    ccall((:okBuffer_Construct, libokfrontpanel), okBuffer_HANDLE, (Cuint,), size)
end

function okBuffer_FromData(ptr, size)
    ccall((:okBuffer_FromData, libokfrontpanel), okBuffer_HANDLE, (Ptr{Cvoid}, Cuint), ptr, size)
end

function okBuffer_Copy(hnd)
    ccall((:okBuffer_Copy, libokfrontpanel), okBuffer_HANDLE, (okBuffer_HANDLE,), hnd)
end

function okBuffer_Destruct(hnd)
    ccall((:okBuffer_Destruct, libokfrontpanel), Cvoid, (okBuffer_HANDLE,), hnd)
end

function okBuffer_IsEmpty(hnd)
    ccall((:okBuffer_IsEmpty, libokfrontpanel), okBool, (okBuffer_HANDLE,), hnd)
end

function okBuffer_GetSize(hnd)
    ccall((:okBuffer_GetSize, libokfrontpanel), Cuint, (okBuffer_HANDLE,), hnd)
end

function okBuffer_GetData(hnd)
    ccall((:okBuffer_GetData, libokfrontpanel), Ptr{Cuchar}, (okBuffer_HANDLE,), hnd)
end

function okScriptValue_Copy(h)
    ccall((:okScriptValue_Copy, libokfrontpanel), okScriptValue_HANDLE, (okScriptValue_HANDLE,), h)
end

function okScriptValue_NewString(s)
    ccall((:okScriptValue_NewString, libokfrontpanel), okScriptValue_HANDLE, (Ptr{Cchar},), s)
end

function okScriptValue_NewBool(b)
    ccall((:okScriptValue_NewBool, libokfrontpanel), okScriptValue_HANDLE, (okBool,), b)
end

function okScriptValue_NewInt(n)
    ccall((:okScriptValue_NewInt, libokfrontpanel), okScriptValue_HANDLE, (Cint,), n)
end

function okScriptValue_NewBuffer(buf)
    ccall((:okScriptValue_NewBuffer, libokfrontpanel), okScriptValue_HANDLE, (okBuffer_HANDLE,), buf)
end

function okScriptValue_GetAsString(h, ps)
    ccall((:okScriptValue_GetAsString, libokfrontpanel), okBool, (okScriptValue_HANDLE, Ptr{Ptr{Cchar}}), h, ps)
end

function okScriptValue_GetAsBool(h, pb)
    ccall((:okScriptValue_GetAsBool, libokfrontpanel), okBool, (okScriptValue_HANDLE, Ptr{okBool}), h, pb)
end

function okScriptValue_GetAsInt(h, pn)
    ccall((:okScriptValue_GetAsInt, libokfrontpanel), okBool, (okScriptValue_HANDLE, Ptr{Cint}), h, pn)
end

function okScriptValue_GetAsBuffer(h, pbuf)
    ccall((:okScriptValue_GetAsBuffer, libokfrontpanel), okBool, (okScriptValue_HANDLE, Ptr{okBuffer_HANDLE}), h, pbuf)
end

function okScriptValue_Destruct(h)
    ccall((:okScriptValue_Destruct, libokfrontpanel), Cvoid, (okScriptValue_HANDLE,), h)
end

# no prototype is found for this function at okFrontPanel.h:770:45, please use with caution
function okScriptValues_Construct()
    ccall((:okScriptValues_Construct, libokfrontpanel), okScriptValues_HANDLE, ())
end

function okScriptValues_Copy(h)
    ccall((:okScriptValues_Copy, libokfrontpanel), okScriptValues_HANDLE, (okScriptValues_HANDLE,), h)
end

function okScriptValues_Destruct(hnd)
    ccall((:okScriptValues_Destruct, libokfrontpanel), Cvoid, (okScriptValues_HANDLE,), hnd)
end

function okScriptValues_Clear(hnd)
    ccall((:okScriptValues_Clear, libokfrontpanel), Cvoid, (okScriptValues_HANDLE,), hnd)
end

function okScriptValues_Add(hnd, arg)
    ccall((:okScriptValues_Add, libokfrontpanel), Cvoid, (okScriptValues_HANDLE, okScriptValue_HANDLE), hnd, arg)
end

function okScriptValues_GetCount(hnd)
    ccall((:okScriptValues_GetCount, libokfrontpanel), Cint, (okScriptValues_HANDLE,), hnd)
end

function okScriptValues_Get(hnd, n)
    ccall((:okScriptValues_Get, libokfrontpanel), okScriptValue_HANDLE, (okScriptValues_HANDLE, Cint), hnd, n)
end

# no prototype is found for this function at okFrontPanel.h:783:43, please use with caution
function okFrontPanel_Construct()
    ccall((:okFrontPanel_Construct, libokfrontpanel), okFrontPanel_HANDLE, ())
end

function okFrontPanel_Destruct(hnd)
    ccall((:okFrontPanel_Destruct, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetErrorString(ec, buf, length)
    ccall((:okFrontPanel_GetErrorString, libokfrontpanel), Cint, (Cint, Ptr{Cchar}, Cint), ec, buf, length)
end

function okFrontPanel_GetLastErrorMessage(hnd)
    ccall((:okFrontPanel_GetLastErrorMessage, libokfrontpanel), Ptr{Cchar}, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_AddCustomDevice(matchInfo, devInfo)
    ccall((:okFrontPanel_AddCustomDevice, libokfrontpanel), ok_ErrorCode, (Ptr{okTDeviceMatchInfo}, Ptr{okTDeviceInfo}), matchInfo, devInfo)
end

function okFrontPanel_RemoveCustomDevice(productID)
    ccall((:okFrontPanel_RemoveCustomDevice, libokfrontpanel), ok_ErrorCode, (Cint,), productID)
end

function okFrontPanel_WriteI2C(hnd, addr, length, data)
    ccall((:okFrontPanel_WriteI2C, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint, Cint, Ptr{Cuchar}), hnd, addr, length, data)
end

function okFrontPanel_ReadI2C(hnd, addr, length, data)
    ccall((:okFrontPanel_ReadI2C, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint, Cint, Ptr{Cuchar}), hnd, addr, length, data)
end

function okFrontPanel_FlashEraseSector(hnd, address)
    ccall((:okFrontPanel_FlashEraseSector, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, UINT32), hnd, address)
end

function okFrontPanel_FlashWrite(hnd, address, length, buf)
    ccall((:okFrontPanel_FlashWrite, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, UINT32, UINT32, Ptr{UINT8}), hnd, address, length, buf)
end

function okFrontPanel_FlashRead(hnd, address, length, buf)
    ccall((:okFrontPanel_FlashRead, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, UINT32, UINT32, Ptr{UINT8}), hnd, address, length, buf)
end

function okFrontPanel_GetFPGAResetProfile(hnd, method, profile)
    ccall((:okFrontPanel_GetFPGAResetProfile, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, ok_FPGAConfigurationMethod, Ptr{okTFPGAResetProfile}), hnd, method, profile)
end

function okFrontPanel_GetFPGAResetProfileWithSize(hnd, method, profile, size)
    ccall((:okFrontPanel_GetFPGAResetProfileWithSize, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, ok_FPGAConfigurationMethod, Ptr{okTFPGAResetProfile}, Cuint), hnd, method, profile, size)
end

function okFrontPanel_SetFPGAResetProfile(hnd, method, profile)
    ccall((:okFrontPanel_SetFPGAResetProfile, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, ok_FPGAConfigurationMethod, Ptr{okTFPGAResetProfile}), hnd, method, profile)
end

function okFrontPanel_SetFPGAResetProfileWithSize(hnd, method, profile, size)
    ccall((:okFrontPanel_SetFPGAResetProfileWithSize, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, ok_FPGAConfigurationMethod, Ptr{okTFPGAResetProfile}, Cuint), hnd, method, profile, size)
end

function okFrontPanel_ReadRegister(hnd, addr, data)
    ccall((:okFrontPanel_ReadRegister, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, UINT32, Ptr{UINT32}), hnd, addr, data)
end

function okFrontPanel_ReadRegisters(hnd, num, regs)
    ccall((:okFrontPanel_ReadRegisters, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cuint, Ptr{okTRegisterEntry}), hnd, num, regs)
end

function okFrontPanel_WriteRegister(hnd, addr, data)
    ccall((:okFrontPanel_WriteRegister, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, UINT32, UINT32), hnd, addr, data)
end

function okFrontPanel_WriteRegisters(hnd, num, regs)
    ccall((:okFrontPanel_WriteRegisters, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cuint, Ptr{okTRegisterEntry}), hnd, num, regs)
end

function okFrontPanel_GetHostInterfaceWidth(hnd)
    ccall((:okFrontPanel_GetHostInterfaceWidth, libokfrontpanel), Cint, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_IsHighSpeed(hnd)
    ccall((:okFrontPanel_IsHighSpeed, libokfrontpanel), Bool, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetBoardModel(hnd)
    ccall((:okFrontPanel_GetBoardModel, libokfrontpanel), ok_BoardModel, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_FindUSBDeviceModel(usbVID, usbPID)
    ccall((:okFrontPanel_FindUSBDeviceModel, libokfrontpanel), ok_BoardModel, (Cuint, Cuint), usbVID, usbPID)
end

function okFrontPanel_GetBoardModelString(hnd, m, buf)
    ccall((:okFrontPanel_GetBoardModelString, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, ok_BoardModel, Ptr{Cchar}), hnd, m, buf)
end

function okFrontPanel_GetDeviceCount(hnd)
    ccall((:okFrontPanel_GetDeviceCount, libokfrontpanel), Cint, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetDeviceListModel(hnd, num)
    ccall((:okFrontPanel_GetDeviceListModel, libokfrontpanel), ok_BoardModel, (okFrontPanel_HANDLE, Cint), hnd, num)
end

function okFrontPanel_GetDeviceListSerial(hnd, num, buf)
    ccall((:okFrontPanel_GetDeviceListSerial, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Cint, Ptr{Cchar}), hnd, num, buf)
end

function okFrontPanel_OpenBySerial(hnd, serial)
    ccall((:okFrontPanel_OpenBySerial, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cchar}), hnd, serial)
end

function okFrontPanel_IsOpen(hnd)
    ccall((:okFrontPanel_IsOpen, libokfrontpanel), Bool, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_IsRemote(hnd)
    ccall((:okFrontPanel_IsRemote, libokfrontpanel), Bool, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_EnableAsynchronousTransfers(hnd, enable)
    ccall((:okFrontPanel_EnableAsynchronousTransfers, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Bool), hnd, enable)
end

function okFrontPanel_SetBTPipePollingInterval(hnd, interval)
    ccall((:okFrontPanel_SetBTPipePollingInterval, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint), hnd, interval)
end

function okFrontPanel_SetTimeout(hnd, timeout)
    ccall((:okFrontPanel_SetTimeout, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Cint), hnd, timeout)
end

function okFrontPanel_GetDeviceMajorVersion(hnd)
    ccall((:okFrontPanel_GetDeviceMajorVersion, libokfrontpanel), Cint, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetDeviceMinorVersion(hnd)
    ccall((:okFrontPanel_GetDeviceMinorVersion, libokfrontpanel), Cint, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_ResetFPGA(hnd)
    ccall((:okFrontPanel_ResetFPGA, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_Close(hnd)
    ccall((:okFrontPanel_Close, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetSerialNumber(hnd, buf)
    ccall((:okFrontPanel_GetSerialNumber, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Ptr{Cchar}), hnd, buf)
end

function okFrontPanel_GetDeviceSensors(hnd, settings)
    ccall((:okFrontPanel_GetDeviceSensors, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okDeviceSensors_HANDLE), hnd, settings)
end

function okFrontPanel_GetDeviceSettings(hnd, settings)
    ccall((:okFrontPanel_GetDeviceSettings, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okDeviceSettings_HANDLE), hnd, settings)
end

function okFrontPanel_GetDeviceID(hnd, buf)
    ccall((:okFrontPanel_GetDeviceID, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Ptr{Cchar}), hnd, buf)
end

function okFrontPanel_SetDeviceID(hnd, strID)
    ccall((:okFrontPanel_SetDeviceID, libokfrontpanel), Cvoid, (okFrontPanel_HANDLE, Ptr{Cchar}), hnd, strID)
end

function okFrontPanel_ClearFPGAConfiguration(hnd)
    ccall((:okFrontPanel_ClearFPGAConfiguration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_ConfigureFPGA(hnd, strFilename)
    ccall((:okFrontPanel_ConfigureFPGA, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cchar}), hnd, strFilename)
end

function okFrontPanel_ConfigureFPGAWithReset(hnd, strFilename, reset)
    ccall((:okFrontPanel_ConfigureFPGAWithReset, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cchar}, Ptr{okTFPGAResetProfile}), hnd, strFilename, reset)
end

function okFrontPanel_ConfigureFPGAFromMemory(hnd, data, length)
    ccall((:okFrontPanel_ConfigureFPGAFromMemory, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cuchar}, Culong), hnd, data, length)
end

function okFrontPanel_ConfigureFPGAFromMemoryWithProgress(hnd, data, length, callback, arg)
    ccall((:okFrontPanel_ConfigureFPGAFromMemoryWithProgress, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cuchar}, Culong, okTProgressCallback, Ptr{Cvoid}), hnd, data, length, callback, arg)
end

function okFrontPanel_ConfigureFPGAFromMemoryWithReset(hnd, data, length, reset)
    ccall((:okFrontPanel_ConfigureFPGAFromMemoryWithReset, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Ptr{Cuchar}, Culong, Ptr{okTFPGAResetProfile}), hnd, data, length, reset)
end

function okFrontPanel_ConfigureFPGAFromFlash(hnd, configIndex)
    ccall((:okFrontPanel_ConfigureFPGAFromFlash, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Culong), hnd, configIndex)
end

function okFrontPanel_GetPLL22150Configuration(hnd, pll)
    ccall((:okFrontPanel_GetPLL22150Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22150_HANDLE), hnd, pll)
end

function okFrontPanel_SetPLL22150Configuration(hnd, pll)
    ccall((:okFrontPanel_SetPLL22150Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22150_HANDLE), hnd, pll)
end

function okFrontPanel_GetEepromPLL22150Configuration(hnd, pll)
    ccall((:okFrontPanel_GetEepromPLL22150Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22150_HANDLE), hnd, pll)
end

function okFrontPanel_SetEepromPLL22150Configuration(hnd, pll)
    ccall((:okFrontPanel_SetEepromPLL22150Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22150_HANDLE), hnd, pll)
end

function okFrontPanel_GetPLL22393Configuration(hnd, pll)
    ccall((:okFrontPanel_GetPLL22393Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22393_HANDLE), hnd, pll)
end

function okFrontPanel_SetPLL22393Configuration(hnd, pll)
    ccall((:okFrontPanel_SetPLL22393Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22393_HANDLE), hnd, pll)
end

function okFrontPanel_GetEepromPLL22393Configuration(hnd, pll)
    ccall((:okFrontPanel_GetEepromPLL22393Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22393_HANDLE), hnd, pll)
end

function okFrontPanel_SetEepromPLL22393Configuration(hnd, pll)
    ccall((:okFrontPanel_SetEepromPLL22393Configuration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, okPLL22393_HANDLE), hnd, pll)
end

function okFrontPanel_LoadDefaultPLLConfiguration(hnd)
    ccall((:okFrontPanel_LoadDefaultPLLConfiguration, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_IsFrontPanelEnabled(hnd)
    ccall((:okFrontPanel_IsFrontPanelEnabled, libokfrontpanel), Bool, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_IsFrontPanel3Supported(hnd)
    ccall((:okFrontPanel_IsFrontPanel3Supported, libokfrontpanel), Bool, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_UpdateWireIns(hnd)
    ccall((:okFrontPanel_UpdateWireIns, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetWireInValue(hnd, epAddr, val)
    ccall((:okFrontPanel_GetWireInValue, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint, Ptr{UINT32}), hnd, epAddr, val)
end

function okFrontPanel_SetWireInValue(hnd, ep, val, mask)
    ccall((:okFrontPanel_SetWireInValue, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint, Culong, Culong), hnd, ep, val, mask)
end

function okFrontPanel_UpdateWireOuts(hnd)
    ccall((:okFrontPanel_UpdateWireOuts, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_GetWireOutValue(hnd, epAddr)
    ccall((:okFrontPanel_GetWireOutValue, libokfrontpanel), Culong, (okFrontPanel_HANDLE, Cint), hnd, epAddr)
end

function okFrontPanel_ActivateTriggerIn(hnd, epAddr, bit)
    ccall((:okFrontPanel_ActivateTriggerIn, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE, Cint, Cint), hnd, epAddr, bit)
end

function okFrontPanel_UpdateTriggerOuts(hnd)
    ccall((:okFrontPanel_UpdateTriggerOuts, libokfrontpanel), ok_ErrorCode, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_IsTriggered(hnd, epAddr, mask)
    ccall((:okFrontPanel_IsTriggered, libokfrontpanel), Bool, (okFrontPanel_HANDLE, Cint, Culong), hnd, epAddr, mask)
end

function okFrontPanel_GetTriggerOutVector(hnd, epAddr)
    ccall((:okFrontPanel_GetTriggerOutVector, libokfrontpanel), UINT32, (okFrontPanel_HANDLE, Cint), hnd, epAddr)
end

function okFrontPanel_GetLastTransferLength(hnd)
    ccall((:okFrontPanel_GetLastTransferLength, libokfrontpanel), Clong, (okFrontPanel_HANDLE,), hnd)
end

function okFrontPanel_WriteToPipeIn(hnd, epAddr, length, data)
    ccall((:okFrontPanel_WriteToPipeIn, libokfrontpanel), Clong, (okFrontPanel_HANDLE, Cint, Clong, Ptr{Cuchar}), hnd, epAddr, length, data)
end

function okFrontPanel_ReadFromPipeOut(hnd, epAddr, length, data)
    ccall((:okFrontPanel_ReadFromPipeOut, libokfrontpanel), Clong, (okFrontPanel_HANDLE, Cint, Clong, Ptr{Cuchar}), hnd, epAddr, length, data)
end

function okFrontPanel_WriteToBlockPipeIn(hnd, epAddr, blockSize, length, data)
    ccall((:okFrontPanel_WriteToBlockPipeIn, libokfrontpanel), Clong, (okFrontPanel_HANDLE, Cint, Cint, Clong, Ptr{Cuchar}), hnd, epAddr, blockSize, length, data)
end

function okFrontPanel_ReadFromBlockPipeOut(hnd, epAddr, blockSize, length, data)
    ccall((:okFrontPanel_ReadFromBlockPipeOut, libokfrontpanel), Clong, (okFrontPanel_HANDLE, Cint, Cint, Clong, Ptr{Cuchar}), hnd, epAddr, blockSize, length, data)
end

function okScriptEngine_ConstructLua(fp)
    ccall((:okScriptEngine_ConstructLua, libokfrontpanel), okScriptEngine_HANDLE, (okFrontPanel_HANDLE,), fp)
end

function okScriptEngine_Destruct(hnd)
    ccall((:okScriptEngine_Destruct, libokfrontpanel), Cvoid, (okScriptEngine_HANDLE,), hnd)
end

function okScriptEngine_LoadScript(hnd, name, code, err)
    ccall((:okScriptEngine_LoadScript, libokfrontpanel), Bool, (okScriptEngine_HANDLE, Ptr{Cchar}, Ptr{Cchar}, Ptr{Ptr{okError}}), hnd, name, code, err)
end

function okScriptEngine_LoadFile(hnd, path, err)
    ccall((:okScriptEngine_LoadFile, libokfrontpanel), Bool, (okScriptEngine_HANDLE, Ptr{Cchar}, Ptr{Ptr{okError}}), hnd, path, err)
end

function okScriptEngine_PrependToScriptPath(hnd, dir)
    ccall((:okScriptEngine_PrependToScriptPath, libokfrontpanel), Cvoid, (okScriptEngine_HANDLE, Ptr{Cchar}), hnd, dir)
end

function okScriptEngine_RunScriptFunction(hnd, name, retval, args, err)
    ccall((:okScriptEngine_RunScriptFunction, libokfrontpanel), Bool, (okScriptEngine_HANDLE, Ptr{Cchar}, Ptr{okScriptValues_HANDLE}, okScriptValues_HANDLE, Ptr{Ptr{okError}}), hnd, name, retval, args, err)
end

function okScriptEngine_RunScriptFunctionAsync(hnd, callback, data, name, args, err)
    ccall((:okScriptEngine_RunScriptFunctionAsync, libokfrontpanel), Bool, (okScriptEngine_HANDLE, okScriptEngineAsyncCallback, Ptr{Cvoid}, Ptr{Cchar}, okScriptValues_HANDLE, Ptr{Ptr{okError}}), hnd, callback, data, name, args, err)
end

function okFrontPanelManager_Construct(self, realm)
    ccall((:okFrontPanelManager_Construct, libokfrontpanel), okCFrontPanelManager_HANDLE, (okFrontPanelManager_HANDLE, Ptr{Cchar}), self, realm)
end

function okFrontPanelManager_ConstructWithCallbacks(self, realm, onAdded, onRemoved)
    ccall((:okFrontPanelManager_ConstructWithCallbacks, libokfrontpanel), okCFrontPanelManager_HANDLE, (okFrontPanelManager_HANDLE, Ptr{Cchar}, okFrontPanelManager_OnDeviceCallback_t, okFrontPanelManager_OnDeviceCallback_t), self, realm, onAdded, onRemoved)
end

function okFrontPanelManager_Destruct(hnd)
    ccall((:okFrontPanelManager_Destruct, libokfrontpanel), Cvoid, (okCFrontPanelManager_HANDLE,), hnd)
end

function okFrontPanelManager_StartMonitoring(hnd)
    ccall((:okFrontPanelManager_StartMonitoring, libokfrontpanel), ok_ErrorCode, (okCFrontPanelManager_HANDLE,), hnd)
end

function okFrontPanelManager_StartMonitoringWithCBInfo(hnd, cbInfo)
    ccall((:okFrontPanelManager_StartMonitoringWithCBInfo, libokfrontpanel), ok_ErrorCode, (okCFrontPanelManager_HANDLE, Ptr{okTCallbackInfo}), hnd, cbInfo)
end

function okFrontPanelManager_StopMonitoring(hnd)
    ccall((:okFrontPanelManager_StopMonitoring, libokfrontpanel), ok_ErrorCode, (okCFrontPanelManager_HANDLE,), hnd)
end

function okFrontPanelManager_EnterMonitorLoop(hnd, cbInfo)
    ccall((:okFrontPanelManager_EnterMonitorLoop, libokfrontpanel), Cint, (okCFrontPanelManager_HANDLE, Ptr{okTCallbackInfo}), hnd, cbInfo)
end

function okFrontPanelManager_EnterMonitorLoopWithTimeout(hnd, cbInfo, millisecondsTimeout)
    ccall((:okFrontPanelManager_EnterMonitorLoopWithTimeout, libokfrontpanel), Cint, (okCFrontPanelManager_HANDLE, Ptr{okTCallbackInfo}, Cint), hnd, cbInfo, millisecondsTimeout)
end

function okFrontPanelManager_ExitMonitorLoop(hnd, exitCode)
    ccall((:okFrontPanelManager_ExitMonitorLoop, libokfrontpanel), Cvoid, (okCFrontPanelManager_HANDLE, Cint), hnd, exitCode)
end

function okFrontPanelManager_Open(hnd, serial)
    ccall((:okFrontPanelManager_Open, libokfrontpanel), okFrontPanel_HANDLE, (okCFrontPanelManager_HANDLE, Ptr{Cchar}), hnd, serial)
end

function okFrontPanelManager_EmulateTestDeviceConnection(serial, connect)
    ccall((:okFrontPanelManager_EmulateTestDeviceConnection, libokfrontpanel), ok_ErrorCode, (Ptr{Cchar}, Bool), serial, connect)
end

function okFrontPanelDevices_Construct(realm, err)
    ccall((:okFrontPanelDevices_Construct, libokfrontpanel), okCFrontPanelDevices_HANDLE, (Ptr{Cchar}, Ptr{Ptr{okError}}), realm, err)
end

function okFrontPanelDevices_Destruct(hnd)
    ccall((:okFrontPanelDevices_Destruct, libokfrontpanel), Cvoid, (okCFrontPanelDevices_HANDLE,), hnd)
end

function okFrontPanelDevices_GetCount(hnd)
    ccall((:okFrontPanelDevices_GetCount, libokfrontpanel), Cint, (okCFrontPanelDevices_HANDLE,), hnd)
end

function okFrontPanelDevices_GetSerial(hnd, num, buf)
    ccall((:okFrontPanelDevices_GetSerial, libokfrontpanel), Cvoid, (okCFrontPanelDevices_HANDLE, Cint, Ptr{Cchar}), hnd, num, buf)
end

function okFrontPanelDevices_Open(hnd, serial)
    ccall((:okFrontPanelDevices_Open, libokfrontpanel), okFrontPanel_HANDLE, (okCFrontPanelDevices_HANDLE, Ptr{Cchar}), hnd, serial)
end

