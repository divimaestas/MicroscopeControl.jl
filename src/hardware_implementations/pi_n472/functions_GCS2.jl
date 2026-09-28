function PI_InterfaceSetupDlg(szRegKeyName)
    ccall((:PI_InterfaceSetupDlg, libpigcs2), Cint, (Ptr{Cchar},), szRegKeyName)
end

function PI_ConnectRS232(nPortNr, iBaudRate)
    ccall((:PI_ConnectRS232, libpigcs2), Cint, (Cint, Cint), nPortNr, iBaudRate)
end

function PI_TryConnectRS232(port, baudrate)
    ccall((:PI_TryConnectRS232, libpigcs2), Cint, (Cint, Cint), port, baudrate)
end

function PI_TryConnectUSB(szDescription)
    ccall((:PI_TryConnectUSB, libpigcs2), Cint, (Ptr{Cchar},), szDescription)
end

function PI_IsConnecting(threadID, bCOnnecting)
    ccall((:PI_IsConnecting, libpigcs2), BOOL, (Cint, Ptr{BOOL}), threadID, bCOnnecting)
end

function PI_GetControllerID(threadID)
    ccall((:PI_GetControllerID, libpigcs2), Cint, (Cint,), threadID)
end

function PI_CancelConnect(threadID)
    ccall((:PI_CancelConnect, libpigcs2), BOOL, (Cint,), threadID)
end

function PI_OpenRS232DaisyChain(iPortNumber, iBaudRate, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
    ccall((:PI_OpenRS232DaisyChain, libpigcs2), Cint, (Cint, Cint, Ptr{Cint}, Ptr{Cchar}, Cint), iPortNumber, iBaudRate, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
end

function PI_ConnectDaisyChainDevice(iPortId, iDeviceNumber)
    ccall((:PI_ConnectDaisyChainDevice, libpigcs2), Cint, (Cint, Cint), iPortId, iDeviceNumber)
end

function PI_CloseDaisyChain(iPortId)
    ccall((:PI_CloseDaisyChain, libpigcs2), Cvoid, (Cint,), iPortId)
end

function PI_ConnectNIgpib(nBoard, nDevAddr)
    ccall((:PI_ConnectNIgpib, libpigcs2), Cint, (Cint, Cint), nBoard, nDevAddr)
end

function PI_ConnectTCPIP(szHostname, port)
    ccall((:PI_ConnectTCPIP, libpigcs2), Cint, (Ptr{Cchar}, Cint), szHostname, port)
end

function PI_EnableTCPIPScan(iMask)
    ccall((:PI_EnableTCPIPScan, libpigcs2), Cint, (Cint,), iMask)
end

function PI_EnumerateTCPIPDevices(szBuffer, iBufferSize, szFilter)
    ccall((:PI_EnumerateTCPIPDevices, libpigcs2), Cint, (Ptr{Cchar}, Cint, Ptr{Cchar}), szBuffer, iBufferSize, szFilter)
end

function PI_ConnectTCPIPByDescription(szDescription)
    ccall((:PI_ConnectTCPIPByDescription, libpigcs2), Cint, (Ptr{Cchar},), szDescription)
end

function PI_OpenTCPIPDaisyChain(szHostname, port, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
    ccall((:PI_OpenTCPIPDaisyChain, libpigcs2), Cint, (Ptr{Cchar}, Cint, Ptr{Cint}, Ptr{Cchar}, Cint), szHostname, port, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
end

function PI_StartDaisyChainScanTCPIP(szHostname, port)
    ccall((:PI_StartDaisyChainScanTCPIP, libpigcs2), Cint, (Ptr{Cchar}, Cint), szHostname, port)
end

function PI_StartDaisyChainScanRS232(iPortNumber, iBaudRate)
    ccall((:PI_StartDaisyChainScanRS232, libpigcs2), Cint, (Cint, Cint), iPortNumber, iBaudRate)
end

function PI_StartDaisyChainScanUSB(szDescription)
    ccall((:PI_StartDaisyChainScanUSB, libpigcs2), Cint, (Ptr{Cchar},), szDescription)
end

function PI_DaisyChainScanning(threadId, scanning, progressPercentage)
    ccall((:PI_DaisyChainScanning, libpigcs2), Cint, (Cint, Ptr{BOOL}, Ptr{Cdouble}), threadId, scanning, progressPercentage)
end

function PI_GetDaisyChainID(threadId)
    ccall((:PI_GetDaisyChainID, libpigcs2), Cint, (Cint,), threadId)
end

function PI_GetDevicesInDaisyChain(portId, numberOfDevices, buffer, bufferSize)
    ccall((:PI_GetDevicesInDaisyChain, libpigcs2), Cint, (Cint, Ptr{Cint}, Ptr{Cchar}, Cint), portId, numberOfDevices, buffer, bufferSize)
end

function PI_StopDaisyChainScan(threadId)
    ccall((:PI_StopDaisyChainScan, libpigcs2), Cint, (Cint,), threadId)
end

function PI_GetConnectedDaisyChains(daisyChainIds, nrDaisyChainsIds)
    ccall((:PI_GetConnectedDaisyChains, libpigcs2), Cint, (Ptr{Cint}, Cint), daisyChainIds, nrDaisyChainsIds)
end

# no prototype is found for this function at PI_GCS2_DLL.h:163:18, please use with caution
function PI_GetNrConnectedDaisyChains()
    ccall((:PI_GetNrConnectedDaisyChains, libpigcs2), Cint, ())
end

# no prototype is found for this function at PI_GCS2_DLL.h:164:19, please use with caution
function PI_CloseAllDaisyChains()
    ccall((:PI_CloseAllDaisyChains, libpigcs2), Cvoid, ())
end

function PI_EnumerateUSB(szBuffer, iBufferSize, szFilter)
    ccall((:PI_EnumerateUSB, libpigcs2), Cint, (Ptr{Cchar}, Cint, Ptr{Cchar}), szBuffer, iBufferSize, szFilter)
end

function PI_ConnectUSB(szDescription)
    ccall((:PI_ConnectUSB, libpigcs2), Cint, (Ptr{Cchar},), szDescription)
end

function PI_ConnectUSBWithBaudRate(szDescription, iBaudRate)
    ccall((:PI_ConnectUSBWithBaudRate, libpigcs2), Cint, (Ptr{Cchar}, Cint), szDescription, iBaudRate)
end

function PI_OpenUSBDaisyChain(szDescription, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
    ccall((:PI_OpenUSBDaisyChain, libpigcs2), Cint, (Ptr{Cchar}, Ptr{Cint}, Ptr{Cchar}, Cint), szDescription, pNumberOfConnectedDaisyChainDevices, szDeviceIDNs, iBufferSize)
end

function PI_IsConnected(ID)
    ccall((:PI_IsConnected, libpigcs2), BOOL, (Cint,), ID)
end

function PI_CloseConnection(ID)
    ccall((:PI_CloseConnection, libpigcs2), Cvoid, (Cint,), ID)
end

function PI_GetError(ID)
    ccall((:PI_GetError, libpigcs2), Cint, (Cint,), ID)
end

# no prototype is found for this function at PI_GCS2_DLL.h:187:18, please use with caution
function PI_GetInitError()
    ccall((:PI_GetInitError, libpigcs2), Cint, ())
end

function PI_SetErrorCheck(ID, bErrorCheck)
    ccall((:PI_SetErrorCheck, libpigcs2), BOOL, (Cint, BOOL), ID, bErrorCheck)
end

function PI_TranslateError(errNr, szBuffer, iBufferSize)
    ccall((:PI_TranslateError, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), errNr, szBuffer, iBufferSize)
end

function PI_SetTimeout(ID, timeoutInMS)
    ccall((:PI_SetTimeout, libpigcs2), Cint, (Cint, Cint), ID, timeoutInMS)
end

function PI_SetDaisyChainScanMaxDeviceID(maxID)
    ccall((:PI_SetDaisyChainScanMaxDeviceID, libpigcs2), Cint, (Cint,), maxID)
end

function PI_EnableReconnect(ID, bEnable)
    ccall((:PI_EnableReconnect, libpigcs2), BOOL, (Cint, BOOL), ID, bEnable)
end

function PI_SetNrTimeoutsBeforeClose(ID, nrTimeoutsBeforeClose)
    ccall((:PI_SetNrTimeoutsBeforeClose, libpigcs2), Cint, (Cint, Cint), ID, nrTimeoutsBeforeClose)
end

function PI_GetInterfaceDescription(ID, szBuffer, iBufferSize)
    ccall((:PI_GetInterfaceDescription, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_SetConnectTimeout(timeoutInMS)
    ccall((:PI_SetConnectTimeout, libpigcs2), Cvoid, (Cint,), timeoutInMS)
end

function PI_EnableBaudRateScan(enableBaudRateScan)
    ccall((:PI_EnableBaudRateScan, libpigcs2), Cvoid, (BOOL,), enableBaudRateScan)
end

function PI_qERR(ID, pnError)
    ccall((:PI_qERR, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, pnError)
end

function PI_qIDN(ID, szBuffer, iBufferSize)
    ccall((:PI_qIDN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_INI(ID, szAxes)
    ccall((:PI_INI, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qHLP(ID, szBuffer, iBufferSize)
    ccall((:PI_qHLP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qHPA(ID, szBuffer, iBufferSize)
    ccall((:PI_qHPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qHPV(ID, szBuffer, iBufferSize)
    ccall((:PI_qHPV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qCSV(ID, pdCommandSyntaxVersion)
    ccall((:PI_qCSV, libpigcs2), BOOL, (Cint, Ptr{Cdouble}), ID, pdCommandSyntaxVersion)
end

function PI_qOVF(ID, szAxes, piValueArray)
    ccall((:PI_qOVF, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, piValueArray)
end

function PI_RBT(ID)
    ccall((:PI_RBT, libpigcs2), BOOL, (Cint,), ID)
end

function PI_REP(ID)
    ccall((:PI_REP, libpigcs2), BOOL, (Cint,), ID)
end

function PI_BDR(ID, iBaudRate)
    ccall((:PI_BDR, libpigcs2), BOOL, (Cint, Cint), ID, iBaudRate)
end

function PI_qBDR(ID, iBaudRate)
    ccall((:PI_qBDR, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iBaudRate)
end

function PI_DBR(ID, iBaudRate)
    ccall((:PI_DBR, libpigcs2), BOOL, (Cint, Cint), ID, iBaudRate)
end

function PI_qDBR(ID, iBaudRate)
    ccall((:PI_qDBR, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iBaudRate)
end

function PI_qVER(ID, szBuffer, iBufferSize)
    ccall((:PI_qVER, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qSSN(ID, szSerialNumber, iBufferSize)
    ccall((:PI_qSSN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szSerialNumber, iBufferSize)
end

function PI_CCT(ID, iCommandType)
    ccall((:PI_CCT, libpigcs2), BOOL, (Cint, Cint), ID, iCommandType)
end

function PI_qCCT(ID, iCommandType)
    ccall((:PI_qCCT, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iCommandType)
end

function PI_qTVI(ID, szBuffer, iBufferSize)
    ccall((:PI_qTVI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_IFC(ID, szParameters, szValues)
    ccall((:PI_IFC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szParameters, szValues)
end

function PI_qIFC(ID, szParameters, szBuffer, iBufferSize)
    ccall((:PI_qIFC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szParameters, szBuffer, iBufferSize)
end

function PI_IFS(ID, szPassword, szParameters, szValues)
    ccall((:PI_IFS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, szPassword, szParameters, szValues)
end

function PI_qIFS(ID, szParameters, szBuffer, iBufferSize)
    ccall((:PI_qIFS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szParameters, szBuffer, iBufferSize)
end

function PI_qECO(ID, szSendString, szValues, iBufferSize)
    ccall((:PI_qECO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szSendString, szValues, iBufferSize)
end

function PI_MOV(ID, szAxes, pdValueArray)
    ccall((:PI_MOV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qMOV(ID, szAxes, pdValueArray)
    ccall((:PI_qMOV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_MVR(ID, szAxes, pdValueArray)
    ccall((:PI_MVR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_MVE(ID, szAxes, pdValueArray)
    ccall((:PI_MVE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_POS(ID, szAxes, pdValueArray)
    ccall((:PI_POS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qPOS(ID, szAxes, pdValueArray)
    ccall((:PI_qPOS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_IsMoving(ID, szAxes, pbValueArray)
    ccall((:PI_IsMoving, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_HLT(ID, szAxes)
    ccall((:PI_HLT, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_STP(ID)
    ccall((:PI_STP, libpigcs2), BOOL, (Cint,), ID)
end

function PI_STF(ID)
    ccall((:PI_STF, libpigcs2), BOOL, (Cint,), ID)
end

function PI_StopAll(ID)
    ccall((:PI_StopAll, libpigcs2), BOOL, (Cint,), ID)
end

function PI_qONT(ID, szAxes, pbValueArray)
    ccall((:PI_qONT, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_RTO(ID, szAxes)
    ccall((:PI_RTO, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qRTO(ID, szAxes, piValueArray)
    ccall((:PI_qRTO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piValueArray)
end

function PI_ATZ(ID, szAxes, pdLowvoltageArray, pfUseDefaultArray)
    ccall((:PI_ATZ, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{BOOL}), ID, szAxes, pdLowvoltageArray, pfUseDefaultArray)
end

function PI_qATZ(ID, szAxes, piAtzResultArray)
    ccall((:PI_qATZ, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piAtzResultArray)
end

function PI_AOS(ID, szAxes, pdValueArray)
    ccall((:PI_AOS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qAOS(ID, szAxes, pdValueArray)
    ccall((:PI_qAOS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_HasPosChanged(ID, szAxes, pbValueArray)
    ccall((:PI_HasPosChanged, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_GetErrorStatus(ID, pbIsReferencedArray, pbIsReferencing, pbIsMovingArray, pbIsMotionErrorArray)
    ccall((:PI_GetErrorStatus, libpigcs2), BOOL, (Cint, Ptr{BOOL}, Ptr{BOOL}, Ptr{BOOL}, Ptr{BOOL}), ID, pbIsReferencedArray, pbIsReferencing, pbIsMovingArray, pbIsMotionErrorArray)
end

function PI_SVA(ID, szAxes, pdValueArray)
    ccall((:PI_SVA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qSVA(ID, szAxes, pdValueArray)
    ccall((:PI_qSVA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_SVR(ID, szAxes, pdValueArray)
    ccall((:PI_SVR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_DFH(ID, szAxes)
    ccall((:PI_DFH, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qDFH(ID, szAxes, pdValueArray)
    ccall((:PI_qDFH, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_GOH(ID, szAxes)
    ccall((:PI_GOH, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qCST(ID, szAxes, szNames, iBufferSize)
    ccall((:PI_qCST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szAxes, szNames, iBufferSize)
end

function PI_CST(ID, szAxes, szNames)
    ccall((:PI_CST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szAxes, szNames)
end

function PI_qVST(ID, szBuffer, iBufferSize)
    ccall((:PI_qVST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qPUN(ID, szAxes, szUnit, iBufferSize)
    ccall((:PI_qPUN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szAxes, szUnit, iBufferSize)
end

function PI_EAX(ID, szAxes, pbValueArray)
    ccall((:PI_EAX, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qEAX(ID, szAxes, pbValueArray)
    ccall((:PI_qEAX, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_SVO(ID, szAxes, pbValueArray)
    ccall((:PI_SVO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qSVO(ID, szAxes, pbValueArray)
    ccall((:PI_qSVO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_SMO(ID, szAxes, piValueArray)
    ccall((:PI_SMO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piValueArray)
end

function PI_qSMO(ID, szAxes, piValueArray)
    ccall((:PI_qSMO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piValueArray)
end

function PI_DCO(ID, szAxes, pbValueArray)
    ccall((:PI_DCO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qDCO(ID, szAxes, pbValueArray)
    ccall((:PI_qDCO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_BRA(ID, szAxes, pbValueArray)
    ccall((:PI_BRA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qBRA(ID, szAxes, pbValueArray)
    ccall((:PI_qBRA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_RON(ID, szAxes, pbValueArray)
    ccall((:PI_RON, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qRON(ID, szAxes, pbValueArray)
    ccall((:PI_qRON, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_VEL(ID, szAxes, pdValueArray)
    ccall((:PI_VEL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qVEL(ID, szAxes, pdValueArray)
    ccall((:PI_qVEL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_JOG(ID, szAxes, pdValueArray)
    ccall((:PI_JOG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qJOG(ID, szAxes, pdValueArray)
    ccall((:PI_qJOG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qTCV(ID, szAxes, pdValueArray)
    ccall((:PI_qTCV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_VLS(ID, dSystemVelocity)
    ccall((:PI_VLS, libpigcs2), BOOL, (Cint, Cdouble), ID, dSystemVelocity)
end

function PI_qVLS(ID, pdSystemVelocity)
    ccall((:PI_qVLS, libpigcs2), BOOL, (Cint, Ptr{Cdouble}), ID, pdSystemVelocity)
end

function PI_ACC(ID, szAxes, pdValueArray)
    ccall((:PI_ACC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qACC(ID, szAxes, pdValueArray)
    ccall((:PI_qACC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_DEC(ID, szAxes, pdValueArray)
    ccall((:PI_DEC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qDEC(ID, szAxes, pdValueArray)
    ccall((:PI_qDEC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_VCO(ID, szAxes, pbValueArray)
    ccall((:PI_VCO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qVCO(ID, szAxes, pbValueArray)
    ccall((:PI_qVCO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_SPA(ID, szItems, iParameterArray, pdValueArray, szStrings)
    ccall((:PI_SPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cchar}), ID, szItems, iParameterArray, pdValueArray, szStrings)
end

function PI_qSPA(ID, szItems, iParameterArray, pdValueArray, szStrings, iMaxNameSize)
    ccall((:PI_qSPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cchar}, Cint), ID, szItems, iParameterArray, pdValueArray, szStrings, iMaxNameSize)
end

function PI_SEP(ID, szPassword, szItems, iParameterArray, pdValueArray, szStrings)
    ccall((:PI_SEP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cchar}), ID, szPassword, szItems, iParameterArray, pdValueArray, szStrings)
end

function PI_qSEP(ID, szItems, iParameterArray, pdValueArray, szStrings, iMaxNameSize)
    ccall((:PI_qSEP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cdouble}, Ptr{Cchar}, Cint), ID, szItems, iParameterArray, pdValueArray, szStrings, iMaxNameSize)
end

function PI_WPA(ID, szPassword, szItems, iParameterArray)
    ccall((:PI_WPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}), ID, szPassword, szItems, iParameterArray)
end

function PI_DPA(ID, szPassword, szItems, iParameterArray)
    ccall((:PI_DPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}), ID, szPassword, szItems, iParameterArray)
end

function PI_TIM(ID, dTimer)
    ccall((:PI_TIM, libpigcs2), BOOL, (Cint, Cdouble), ID, dTimer)
end

function PI_qTIM(ID, pdTimer)
    ccall((:PI_qTIM, libpigcs2), BOOL, (Cint, Ptr{Cdouble}), ID, pdTimer)
end

function PI_RPA(ID, szItems, iParameterArray)
    ccall((:PI_RPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}), ID, szItems, iParameterArray)
end

function PI_SPA_String(ID, szItems, iParameterArray, szStrings)
    ccall((:PI_SPA_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}), ID, szItems, iParameterArray, szStrings)
end

function PI_qSPA_String(ID, szItems, iParameterArray, szStrings, iMaxNameSize)
    ccall((:PI_qSPA_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}, Cint), ID, szItems, iParameterArray, szStrings, iMaxNameSize)
end

function PI_SEP_String(ID, szPassword, szItems, iParameterArray, szStrings)
    ccall((:PI_SEP_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}), ID, szPassword, szItems, iParameterArray, szStrings)
end

function PI_qSEP_String(ID, szItems, iParameterArray, szStrings, iMaxNameSize)
    ccall((:PI_qSEP_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}, Cint), ID, szItems, iParameterArray, szStrings, iMaxNameSize)
end

function PI_SPA_int64(ID, szItems, iParameterArray, piValueArray)
    ccall((:PI_SPA_int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{__int64}), ID, szItems, iParameterArray, piValueArray)
end

function PI_qSPA_int64(ID, szItems, iParameterArray, piValueArray)
    ccall((:PI_qSPA_int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{__int64}), ID, szItems, iParameterArray, piValueArray)
end

function PI_SEP_int64(ID, szPassword, szItems, iParameterArray, piValueArray)
    ccall((:PI_SEP_int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cuint}, Ptr{__int64}), ID, szPassword, szItems, iParameterArray, piValueArray)
end

function PI_qSEP_int64(ID, szItems, iParameterArray, piValueArray)
    ccall((:PI_qSEP_int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{__int64}), ID, szItems, iParameterArray, piValueArray)
end

function PI_STE(ID, szAxes, dOffsetArray)
    ccall((:PI_STE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, dOffsetArray)
end

function PI_qSTE(ID, szAxes, pdValueArray)
    ccall((:PI_qSTE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_IMP(ID, szAxes, pdImpulseSize)
    ccall((:PI_IMP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdImpulseSize)
end

function PI_IMP_PulseWidth(ID, cAxis, dOffset, iPulseWidth)
    ccall((:PI_IMP_PulseWidth, libpigcs2), BOOL, (Cint, Cchar, Cdouble, Cint), ID, cAxis, dOffset, iPulseWidth)
end

function PI_qIMP(ID, szAxes, pdValueArray)
    ccall((:PI_qIMP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_SAI(ID, szOldAxes, szNewAxes)
    ccall((:PI_SAI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szOldAxes, szNewAxes)
end

function PI_qSAI(ID, szAxes, iBufferSize)
    ccall((:PI_qSAI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szAxes, iBufferSize)
end

function PI_qSAI_ALL(ID, szAxes, iBufferSize)
    ccall((:PI_qSAI_ALL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szAxes, iBufferSize)
end

function PI_CCL(ID, iComandLevel, szPassWord)
    ccall((:PI_CCL, libpigcs2), BOOL, (Cint, Cint, Ptr{Cchar}), ID, iComandLevel, szPassWord)
end

function PI_qCCL(ID, piComandLevel)
    ccall((:PI_qCCL, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piComandLevel)
end

function PI_AVG(ID, iAverrageTime)
    ccall((:PI_AVG, libpigcs2), BOOL, (Cint, Cint), ID, iAverrageTime)
end

function PI_qAVG(ID, iAverrageTime)
    ccall((:PI_qAVG, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iAverrageTime)
end

function PI_qHAR(ID, szAxes, pbValueArray)
    ccall((:PI_qHAR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qLIM(ID, szAxes, pbValueArray)
    ccall((:PI_qLIM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qTRS(ID, szAxes, pbValueArray)
    ccall((:PI_qTRS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_FNL(ID, szAxes)
    ccall((:PI_FNL, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qFPH(ID, szAxes, pdValueArray)
    ccall((:PI_qFPH, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_FPH(ID, szAxes)
    ccall((:PI_FPH, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_FPL(ID, szAxes)
    ccall((:PI_FPL, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_FRF(ID, szAxes)
    ccall((:PI_FRF, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_FED(ID, szAxes, piEdgeArray, piParamArray)
    ccall((:PI_FED, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}), ID, szAxes, piEdgeArray, piParamArray)
end

function PI_qFRF(ID, szAxes, pbValueArray)
    ccall((:PI_qFRF, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_DIO(ID, piChannelsArray, pbValueArray, iArraySize)
    ccall((:PI_DIO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piChannelsArray, pbValueArray, iArraySize)
end

function PI_qDIO(ID, piChannelsArray, pbValueArray, iArraySize)
    ccall((:PI_qDIO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piChannelsArray, pbValueArray, iArraySize)
end

function PI_qTIO(ID, piInputNr, piOutputNr)
    ccall((:PI_qTIO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}), ID, piInputNr, piOutputNr)
end

function PI_IsControllerReady(ID, piControllerReady)
    ccall((:PI_IsControllerReady, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piControllerReady)
end

function PI_qSRG(ID, szAxes, iRegisterArray, iValArray)
    ccall((:PI_qSRG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}), ID, szAxes, iRegisterArray, iValArray)
end

function PI_ATC(ID, piChannels, piValueArray, iArraySize)
    ccall((:PI_ATC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piChannels, piValueArray, iArraySize)
end

function PI_qATC(ID, piChannels, piValueArray, iArraySize)
    ccall((:PI_qATC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piChannels, piValueArray, iArraySize)
end

function PI_qATS(ID, piChannels, piOptions, piValueArray, iArraySize)
    ccall((:PI_qATS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piChannels, piOptions, piValueArray, iArraySize)
end

function PI_SPI(ID, szAxes, pdValueArray)
    ccall((:PI_SPI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qSPI(ID, szAxes, pdValueArray)
    ccall((:PI_qSPI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_SCT(ID, dCycleTime)
    ccall((:PI_SCT, libpigcs2), BOOL, (Cint, Cdouble), ID, dCycleTime)
end

function PI_qSCT(ID, pdCycleTime)
    ccall((:PI_qSCT, libpigcs2), BOOL, (Cint, Ptr{Cdouble}), ID, pdCycleTime)
end

function PI_SST(ID, szAxes, pdValueArray)
    ccall((:PI_SST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qSST(ID, szAxes, pdValueArray)
    ccall((:PI_qSST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qCTV(ID, szAxes, pdValarray)
    ccall((:PI_qCTV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValarray)
end

function PI_CTV(ID, szAxes, pdValarray)
    ccall((:PI_CTV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValarray)
end

function PI_CTR(ID, szAxes, pdValarray)
    ccall((:PI_CTR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValarray)
end

function PI_qCAV(ID, szAxes, pdValarray)
    ccall((:PI_qCAV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValarray)
end

function PI_qCCV(ID, szAxes, pdValarray)
    ccall((:PI_qCCV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValarray)
end

function PI_qCMO(ID, szAxes, piValArray)
    ccall((:PI_qCMO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piValArray)
end

function PI_CMO(ID, szAxes, piValArray)
    ccall((:PI_CMO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, piValArray)
end

function PI_IsRunningMacro(ID, pbRunningMacro)
    ccall((:PI_IsRunningMacro, libpigcs2), BOOL, (Cint, Ptr{BOOL}), ID, pbRunningMacro)
end

function PI_MAC_BEG(ID, szMacroName)
    ccall((:PI_MAC_BEG, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szMacroName)
end

function PI_MAC_START(ID, szMacroName)
    ccall((:PI_MAC_START, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szMacroName)
end

function PI_MAC_NSTART(ID, szMacroName, nrRuns)
    ccall((:PI_MAC_NSTART, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szMacroName, nrRuns)
end

function PI_MAC_START_Args(ID, szMacroName, szArgs)
    ccall((:PI_MAC_START_Args, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szMacroName, szArgs)
end

function PI_MAC_NSTART_Args(ID, szMacroName, nrRuns, szArgs)
    ccall((:PI_MAC_NSTART_Args, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Ptr{Cchar}), ID, szMacroName, nrRuns, szArgs)
end

function PI_MAC_END(ID)
    ccall((:PI_MAC_END, libpigcs2), BOOL, (Cint,), ID)
end

function PI_MAC_DEL(ID, szMacroName)
    ccall((:PI_MAC_DEL, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szMacroName)
end

function PI_MAC_DEF(ID, szMacroName)
    ccall((:PI_MAC_DEF, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szMacroName)
end

function PI_MAC_qDEF(ID, szBuffer, iBufferSize)
    ccall((:PI_MAC_qDEF, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_MAC_qERR(ID, szBuffer, iBufferSize)
    ccall((:PI_MAC_qERR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_MAC_qFREE(ID, iFreeSpace)
    ccall((:PI_MAC_qFREE, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iFreeSpace)
end

function PI_qMAC(ID, szMacroName, szBuffer, iBufferSize)
    ccall((:PI_qMAC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szMacroName, szBuffer, iBufferSize)
end

function PI_qRMC(ID, szBuffer, iBufferSize)
    ccall((:PI_qRMC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_DEL(ID, nMilliSeconds)
    ccall((:PI_DEL, libpigcs2), BOOL, (Cint, Cint), ID, nMilliSeconds)
end

function PI_WAC(ID, szCondition)
    ccall((:PI_WAC, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szCondition)
end

function PI_MEX(ID, szCondition)
    ccall((:PI_MEX, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szCondition)
end

function PI_VAR(ID, szVariable, szValue)
    ccall((:PI_VAR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szVariable, szValue)
end

function PI_qVAR(ID, szVariables, szValues, iBufferSize)
    ccall((:PI_qVAR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szVariables, szValues, iBufferSize)
end

function PI_ADD(ID, szVariable, value1, value2)
    ccall((:PI_ADD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Cdouble), ID, szVariable, value1, value2)
end

function PI_CPY(ID, szVariable, szCommand)
    ccall((:PI_CPY, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szVariable, szCommand)
end

function PI_GcsCommandset(ID, szCommand)
    ccall((:PI_GcsCommandset, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szCommand)
end

function PI_GcsGetAnswer(ID, szAnswer, iBufferSize)
    ccall((:PI_GcsGetAnswer, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szAnswer, iBufferSize)
end

function PI_GcsGetAnswerSize(ID, iAnswerSize)
    ccall((:PI_GcsGetAnswerSize, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iAnswerSize)
end

function PI_qTMN(ID, szAxes, pdValueArray)
    ccall((:PI_qTMN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qTMX(ID, szAxes, pdValueArray)
    ccall((:PI_qTMX, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_NLM(ID, szAxes, pdValueArray)
    ccall((:PI_NLM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qNLM(ID, szAxes, pdValueArray)
    ccall((:PI_qNLM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_PLM(ID, szAxes, pdValueArray)
    ccall((:PI_PLM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qPLM(ID, szAxes, pdValueArray)
    ccall((:PI_qPLM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_SSL(ID, szAxes, pbValueArray)
    ccall((:PI_SSL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qSSL(ID, szAxes, pbValueArray)
    ccall((:PI_qSSL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qVMO(ID, szAxes, pdValarray, pbMovePossible)
    ccall((:PI_qVMO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{BOOL}), ID, szAxes, pdValarray, pbMovePossible)
end

function PI_qCMN(ID, szAxes, pdValueArray)
    ccall((:PI_qCMN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qCMX(ID, szAxes, pdValueArray)
    ccall((:PI_qCMX, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_IsGeneratorRunning(ID, piWaveGeneratorIds, pbValueArray, iArraySize)
    ccall((:PI_IsGeneratorRunning, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piWaveGeneratorIds, pbValueArray, iArraySize)
end

function PI_qTWG(ID, piWaveGenerators)
    ccall((:PI_qTWG, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piWaveGenerators)
end

function PI_WAV_SIN_P(ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iCenterPointOfWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
    ccall((:PI_WAV_SIN_P, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cint), ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iCenterPointOfWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
end

function PI_WAV_LIN(ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iNumberOfSpeedUpDownPointsInWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
    ccall((:PI_WAV_LIN, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cint), ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iNumberOfSpeedUpDownPointsInWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
end

function PI_WAV_NOISE(ID, iWaveTableId, iAddAppendWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
    ccall((:PI_WAV_NOISE, libpigcs2), BOOL, (Cint, Cint, Cint, Cdouble, Cdouble, Cint), ID, iWaveTableId, iAddAppendWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
end

function PI_WAV_SWEEP(ID, iWaveTableId, iAddAppendWave, iStarFequencytValueInPoints, iStopFrequencyValueInPoints, nLengthOfWave, dAmplitudeOfWave, dOffsetOfWave)
    ccall((:PI_WAV_SWEEP, libpigcs2), BOOL, (Cint, Cint, Cint, Cuint, Cuint, Cuint, Cdouble, Cdouble), ID, iWaveTableId, iAddAppendWave, iStarFequencytValueInPoints, iStopFrequencyValueInPoints, nLengthOfWave, dAmplitudeOfWave, dOffsetOfWave)
end

function PI_WAV_RAMP(ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iCenterPointOfWave, iNumberOfSpeedUpDownPointsInWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
    ccall((:PI_WAV_RAMP, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cint), ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, iCenterPointOfWave, iNumberOfSpeedUpDownPointsInWave, dAmplitudeOfWave, dOffsetOfWave, iSegmentLength)
end

function PI_WAV_PNT(ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, pdWavePoints)
    ccall((:PI_WAV_PNT, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Cint, Ptr{Cdouble}), ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfPoints, iAddAppendWave, pdWavePoints)
end

function PI_qWAV(ID, piWaveTableIdsArray, piParamereIdsArray, pdValueArray, iArraySize)
    ccall((:PI_qWAV, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piWaveTableIdsArray, piParamereIdsArray, pdValueArray, iArraySize)
end

function PI_WGO(ID, piWaveGeneratorIdsArray, iStartModArray, iArraySize)
    ccall((:PI_WGO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, iStartModArray, iArraySize)
end

function PI_qWGO(ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
    ccall((:PI_qWGO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
end

function PI_WGC(ID, piWaveGeneratorIdsArray, piNumberOfCyclesArray, iArraySize)
    ccall((:PI_WGC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piNumberOfCyclesArray, iArraySize)
end

function PI_qWGC(ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
    ccall((:PI_qWGC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
end

function PI_qWGI(ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
    ccall((:PI_qWGI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
end

function PI_qWGN(ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
    ccall((:PI_qWGN, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piValueArray, iArraySize)
end

function PI_qWGS(ID, iWaveGeneratorId, szItem, buffer, bufferSize)
    ccall((:PI_qWGS, libpigcs2), BOOL, (Cint, Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, iWaveGeneratorId, szItem, buffer, bufferSize)
end

function PI_WSL(ID, piWaveGeneratorIdsArray, piWaveTableIdsArray, iArraySize)
    ccall((:PI_WSL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piWaveTableIdsArray, iArraySize)
end

function PI_qWSL(ID, piWaveGeneratorIdsArray, piWaveTableIdsArray, iArraySize)
    ccall((:PI_qWSL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piWaveTableIdsArray, iArraySize)
end

function PI_DTC(ID, piDdlTableIdsArray, iArraySize)
    ccall((:PI_DTC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piDdlTableIdsArray, iArraySize)
end

function PI_qDTL(ID, piDdlTableIdsArray, piValueArray, iArraySize)
    ccall((:PI_qDTL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piDdlTableIdsArray, piValueArray, iArraySize)
end

function PI_WCL(ID, piWaveTableIdsArray, iArraySize)
    ccall((:PI_WCL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piWaveTableIdsArray, iArraySize)
end

function PI_qTLT(ID, piNumberOfDdlTables)
    ccall((:PI_qTLT, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piNumberOfDdlTables)
end

function PI_qGWD_SYNC(ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfValues, pdValueArray)
    ccall((:PI_qGWD_SYNC, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cdouble}), ID, iWaveTableId, iOffsetOfFirstPointInWaveTable, iNumberOfValues, pdValueArray)
end

function PI_qGWD(ID, iWaveTableIdsArray, iNumberOfWaveTables, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qGWD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, iWaveTableIdsArray, iNumberOfWaveTables, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_WOS(ID, iWaveTableIdsArray, pdValueArray, iArraySize)
    ccall((:PI_WOS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, iWaveTableIdsArray, pdValueArray, iArraySize)
end

function PI_qWOS(ID, iWaveTableIdsArray, pdValueArray, iArraySize)
    ccall((:PI_qWOS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, iWaveTableIdsArray, pdValueArray, iArraySize)
end

function PI_WTR(ID, piWaveGeneratorIdsArray, piTableRateArray, piInterpolationTypeArray, iArraySize)
    ccall((:PI_WTR, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piTableRateArray, piInterpolationTypeArray, iArraySize)
end

function PI_qWTR(ID, piWaveGeneratorIdsArray, piTableRateArray, piInterpolationTypeArray, iArraySize)
    ccall((:PI_qWTR, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveGeneratorIdsArray, piTableRateArray, piInterpolationTypeArray, iArraySize)
end

function PI_DDL(ID, iDdlTableId, iOffsetOfFirstPointInDdlTable, iNumberOfValues, pdValueArray)
    ccall((:PI_DDL, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cdouble}), ID, iDdlTableId, iOffsetOfFirstPointInDdlTable, iNumberOfValues, pdValueArray)
end

function PI_qDDL_SYNC(ID, iDdlTableId, iOffsetOfFirstPointInDdlTable, iNumberOfValues, pdValueArray)
    ccall((:PI_qDDL_SYNC, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cdouble}), ID, iDdlTableId, iOffsetOfFirstPointInDdlTable, iNumberOfValues, pdValueArray)
end

function PI_qDDL(ID, iDdlTableIdsArray, iNumberOfDdlTables, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qDDL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, iDdlTableIdsArray, iNumberOfDdlTables, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_DPO(ID, szAxes)
    ccall((:PI_DPO, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_qWMS(ID, piWaveTableIds, iWaveTableMaximumSize, iArraySize)
    ccall((:PI_qWMS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveTableIds, iWaveTableMaximumSize, iArraySize)
end

function PI_TWE(ID, piWaveTableIdsArray, piWaveTableStartIndexArray, piWaveTableEndIndexArray, iArraySize)
    ccall((:PI_TWE, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveTableIdsArray, piWaveTableStartIndexArray, piWaveTableEndIndexArray, iArraySize)
end

function PI_qTWE(ID, piWaveTableIdsArray, piWaveTableStartIndexArray, piWaveTableEndIndexArray, iArraySize)
    ccall((:PI_qTWE, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piWaveTableIdsArray, piWaveTableStartIndexArray, piWaveTableEndIndexArray, iArraySize)
end

function PI_TWC(ID)
    ccall((:PI_TWC, libpigcs2), BOOL, (Cint,), ID)
end

function PI_TWS(ID, piTriggerChannelIdsArray, piPointNumberArray, piSwitchArray, iArraySize)
    ccall((:PI_TWS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, piTriggerChannelIdsArray, piPointNumberArray, piSwitchArray, iArraySize)
end

function PI_qTWS(ID, iTriggerChannelIdsArray, iNumberOfTriggerChannels, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qTWS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, iTriggerChannelIdsArray, iNumberOfTriggerChannels, iOffset, nrValues, pdValarray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_CTO(ID, piTriggerOutputIds, piTriggerParameterArray, pdValueArray, iArraySize)
    ccall((:PI_CTO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piTriggerOutputIds, piTriggerParameterArray, pdValueArray, iArraySize)
end

function PI_CTOString(ID, piTriggerOutputIds, piTriggerParameterArray, szValueArray, iArraySize)
    ccall((:PI_CTOString, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint), ID, piTriggerOutputIds, piTriggerParameterArray, szValueArray, iArraySize)
end

function PI_qCTO(ID, piTriggerOutputIds, piTriggerParameterArray, pdValueArray, iArraySize)
    ccall((:PI_qCTO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piTriggerOutputIds, piTriggerParameterArray, pdValueArray, iArraySize)
end

function PI_qCTOString(ID, piTriggerOutputIds, piTriggerParameterArray, szValueArray, iArraySize, iBufferSize)
    ccall((:PI_qCTOString, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint, Cint), ID, piTriggerOutputIds, piTriggerParameterArray, szValueArray, iArraySize, iBufferSize)
end

function PI_TRO(ID, piTriggerOutputIds, pbTriggerState, iArraySize)
    ccall((:PI_TRO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piTriggerOutputIds, pbTriggerState, iArraySize)
end

function PI_qTRO(ID, piTriggerOutputIds, pbTriggerState, iArraySize)
    ccall((:PI_qTRO, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piTriggerOutputIds, pbTriggerState, iArraySize)
end

function PI_TRI(ID, piTriggerInputIds, pbTriggerState, iArraySize)
    ccall((:PI_TRI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piTriggerInputIds, pbTriggerState, iArraySize)
end

function PI_qTRI(ID, piTriggerInputIds, pbTriggerState, iArraySize)
    ccall((:PI_qTRI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, piTriggerInputIds, pbTriggerState, iArraySize)
end

function PI_CTI(ID, piTriggerInputIds, piTriggerParameterArray, szValueArray, iArraySize)
    ccall((:PI_CTI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint), ID, piTriggerInputIds, piTriggerParameterArray, szValueArray, iArraySize)
end

function PI_qCTI(ID, piTriggerInputIds, piTriggerParameterArray, szValueArray, iArraySize, iBufferSize)
    ccall((:PI_qCTI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint, Cint), ID, piTriggerInputIds, piTriggerParameterArray, szValueArray, iArraySize, iBufferSize)
end

function PI_qHDR(ID, szBuffer, iBufferSize)
    ccall((:PI_qHDR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qTNR(ID, piNumberOfRecordCannels)
    ccall((:PI_qTNR, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piNumberOfRecordCannels)
end

function PI_DRC(ID, piRecordTableIdsArray, szRecordSourceIds, piRecordOptionArray)
    ccall((:PI_DRC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cchar}, Ptr{Cint}), ID, piRecordTableIdsArray, szRecordSourceIds, piRecordOptionArray)
end

function PI_qDRC(ID, piRecordTableIdsArray, szRecordSourceIds, piRecordOptionArray, iRecordSourceIdsBufferSize, iRecordOptionArraySize)
    ccall((:PI_qDRC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cchar}, Ptr{Cint}, Cint, Cint), ID, piRecordTableIdsArray, szRecordSourceIds, piRecordOptionArray, iRecordSourceIdsBufferSize, iRecordOptionArraySize)
end

function PI_qDRR_SYNC(ID, iRecordTablelId, iOffsetOfFirstPointInRecordTable, iNumberOfValues, pdValueArray)
    ccall((:PI_qDRR_SYNC, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cdouble}), ID, iRecordTablelId, iOffsetOfFirstPointInRecordTable, iNumberOfValues, pdValueArray)
end

function PI_qDRR(ID, piRecTableIdIdsArray, iNumberOfRecTables, iOffsetOfFirstPointInRecordTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qDRR, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, piRecTableIdIdsArray, iNumberOfRecTables, iOffsetOfFirstPointInRecordTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_DRT(ID, piRecordChannelIdsArray, piTriggerSourceArray, szValues, iArraySize)
    ccall((:PI_DRT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint), ID, piRecordChannelIdsArray, piTriggerSourceArray, szValues, iArraySize)
end

function PI_qDRT(ID, piRecordChannelIdsArray, piTriggerSourceArray, szValues, iArraySize, iValueBufferLength)
    ccall((:PI_qDRT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint, Cint), ID, piRecordChannelIdsArray, piTriggerSourceArray, szValues, iArraySize, iValueBufferLength)
end

function PI_RTR(ID, piReportTableRate)
    ccall((:PI_RTR, libpigcs2), BOOL, (Cint, Cint), ID, piReportTableRate)
end

function PI_qRTR(ID, piReportTableRate)
    ccall((:PI_qRTR, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piReportTableRate)
end

function PI_WGR(ID)
    ccall((:PI_WGR, libpigcs2), BOOL, (Cint,), ID)
end

function PI_qDRL(ID, piRecordChannelIdsArray, piNuberOfRecordedValuesArray, iArraySize)
    ccall((:PI_qDRL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piRecordChannelIdsArray, piNuberOfRecordedValuesArray, iArraySize)
end

function PI_WFR(ID, szAxis, iMode, dAmplitude, dLowFrequency, dHighFrequency, iNumberOfFrequencies)
    ccall((:PI_WFR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Cdouble, Cdouble, Cdouble, Cint), ID, szAxis, iMode, dAmplitude, dLowFrequency, dHighFrequency, iNumberOfFrequencies)
end

function PI_qWFR(ID, szAxis, iMode, pbValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qWFR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, szAxis, iMode, pbValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_VMA(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_VMA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_qVMA(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qVMA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_VMI(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_VMI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_qVMI(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qVMI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_VOL(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_VOL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_qVOL(ID, piPiezoChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qVOL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPiezoChannelsArray, pdValueArray, iArraySize)
end

function PI_qTPC(ID, piNumberOfPiezoChannels)
    ccall((:PI_qTPC, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piNumberOfPiezoChannels)
end

function PI_ONL(ID, iPiezoCannels, piValueArray, iArraySize)
    ccall((:PI_ONL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, iPiezoCannels, piValueArray, iArraySize)
end

function PI_qONL(ID, iPiezoCannels, piValueArray, iArraySize)
    ccall((:PI_qONL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, iPiezoCannels, piValueArray, iArraySize)
end

function PI_qTAD(ID, piSensorsChannelsArray, piValueArray, iArraySize)
    ccall((:PI_qTAD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piSensorsChannelsArray, piValueArray, iArraySize)
end

function PI_qTNS(ID, piSensorsChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qTNS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piSensorsChannelsArray, pdValueArray, iArraySize)
end

function PI_TSP(ID, piSensorsChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_TSP, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piSensorsChannelsArray, pdValueArray, iArraySize)
end

function PI_qTSP(ID, piSensorsChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qTSP, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piSensorsChannelsArray, pdValueArray, iArraySize)
end

function PI_SCN(ID, piSensorsChannelsArray, piValueArray, iArraySize)
    ccall((:PI_SCN, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piSensorsChannelsArray, piValueArray, iArraySize)
end

function PI_qSCN(ID, piSensorsChannelsArray, piValueArray, iArraySize)
    ccall((:PI_qSCN, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piSensorsChannelsArray, piValueArray, iArraySize)
end

function PI_qTSC(ID, piNumberOfSensorChannels)
    ccall((:PI_qTSC, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piNumberOfSensorChannels)
end

function PI_APG(ID, piPIEZOWALKChannelsArray, iArraySize)
    ccall((:PI_APG, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, iArraySize)
end

function PI_qAPG(ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
    ccall((:PI_qAPG, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
end

function PI_OAC(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_OAC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOAC(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qOAC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_OAD(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_OAD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOAD(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qOAD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_ODC(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_ODC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qODC(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qODC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_OCD(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_OCD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOCD(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qOCD, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_OSM(ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
    ccall((:PI_OSM, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
end

function PI_qOSM(ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
    ccall((:PI_qOSM, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
end

function PI_OSMf(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_OSMf, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOSMf(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qOSMf, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_OSMstringIDs(ID, szAxisOrChannelIds, pdValueArray)
    ccall((:PI_OSMstringIDs, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxisOrChannelIds, pdValueArray)
end

function PI_qOSMstringIDs(ID, szAxisOrChannelIds, pdValueArray)
    ccall((:PI_qOSMstringIDs, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxisOrChannelIds, pdValueArray)
end

function PI_OVL(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_OVL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOVL(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qOVL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qOSN(ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
    ccall((:PI_qOSN, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, piValueArray, iArraySize)
end

function PI_qOSNstringIDs(ID, szAxisOrChannelIds, piValueArray)
    ccall((:PI_qOSNstringIDs, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxisOrChannelIds, piValueArray)
end

function PI_SSA(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_SSA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_qSSA(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qSSA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_RNP(ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_RNP, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piPIEZOWALKChannelsArray, pdValueArray, iArraySize)
end

function PI_PGS(ID, piPIEZOWALKChannelsArray, iArraySize)
    ccall((:PI_PGS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piPIEZOWALKChannelsArray, iArraySize)
end

function PI_qTAC(ID, pnNrChannels)
    ccall((:PI_qTAC, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, pnNrChannels)
end

function PI_qTAV(ID, piChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qTAV, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piChannelsArray, pdValueArray, iArraySize)
end

function PI_OMA(ID, szAxes, pdValueArray)
    ccall((:PI_OMA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qOMA(ID, szAxes, pdValueArray)
    ccall((:PI_qOMA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_OMR(ID, szAxes, pdValueArray)
    ccall((:PI_OMR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qJAS(ID, iJoystickIDsArray, iAxesIDsArray, pdValueArray, iArraySize)
    ccall((:PI_qJAS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, iJoystickIDsArray, iAxesIDsArray, pdValueArray, iArraySize)
end

function PI_JAX(ID, iJoystickID, iAxesID, szAxesBuffer)
    ccall((:PI_JAX, libpigcs2), BOOL, (Cint, Cint, Cint, Ptr{Cchar}), ID, iJoystickID, iAxesID, szAxesBuffer)
end

function PI_qJAX(ID, iJoystickIDsArray, iAxesIDsArray, iArraySize, szAxesBuffer, iBufferSize)
    ccall((:PI_qJAX, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cchar}, Cint), ID, iJoystickIDsArray, iAxesIDsArray, iArraySize, szAxesBuffer, iBufferSize)
end

function PI_qJBS(ID, iJoystickIDsArray, iButtonIDsArray, pbValueArray, iArraySize)
    ccall((:PI_qJBS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{BOOL}, Cint), ID, iJoystickIDsArray, iButtonIDsArray, pbValueArray, iArraySize)
end

function PI_JDT(ID, iJoystickIDsArray, iAxisIDsArray, piValueArray, iArraySize)
    ccall((:PI_JDT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iJoystickIDsArray, iAxisIDsArray, piValueArray, iArraySize)
end

function PI_JLT(ID, iJoystickID, iAxisID, iStartAdress, pdValueArray, iArraySize)
    ccall((:PI_JLT, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cdouble}, Cint), ID, iJoystickID, iAxisID, iStartAdress, pdValueArray, iArraySize)
end

function PI_qJLT(ID, iJoystickIDsArray, iAxisIDsArray, iNumberOfTables, iOffsetOfFirstPointInTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qJLT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, iJoystickIDsArray, iAxisIDsArray, iNumberOfTables, iOffsetOfFirstPointInTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_JON(ID, iJoystickIDsArray, pbValueArray, iArraySize)
    ccall((:PI_JON, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, iJoystickIDsArray, pbValueArray, iArraySize)
end

function PI_qJON(ID, iJoystickIDsArray, pbValueArray, iArraySize)
    ccall((:PI_qJON, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{BOOL}, Cint), ID, iJoystickIDsArray, pbValueArray, iArraySize)
end

function PI_AAP(ID, szAxis1, dLength1, szAxis2, dLength2, dAlignStep, iNrRepeatedPositions, iAnalogInput)
    ccall((:PI_AAP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Cdouble, Cint, Cint), ID, szAxis1, dLength1, szAxis2, dLength2, dAlignStep, iNrRepeatedPositions, iAnalogInput)
end

function PI_FIO(ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dLinearStep, dAngleScan, iAnalogInput)
    ccall((:PI_FIO, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, Cdouble, Cint), ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dLinearStep, dAngleScan, iAnalogInput)
end

function PI_FLM(ID, szAxis, dLength, dThreshold, iAnalogInput, iDirection)
    ccall((:PI_FLM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Cdouble, Cint, Cint), ID, szAxis, dLength, dThreshold, iAnalogInput, iDirection)
end

function PI_FLS(ID, szAxis, dLength, dThreshold, iAnalogInput, iDirection)
    ccall((:PI_FLS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Cdouble, Cint, Cint), ID, szAxis, dLength, dThreshold, iAnalogInput, iDirection)
end

function PI_FSA(ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, dAlignStep, iAnalogInput)
    ccall((:PI_FSA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, Cdouble, Cint), ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, dAlignStep, iAnalogInput)
end

function PI_FSC(ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, iAnalogInput)
    ccall((:PI_FSC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, Cint), ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, iAnalogInput)
end

function PI_FSM(ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, iAnalogInput)
    ccall((:PI_FSM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Cdouble, Cdouble, Cint), ID, szAxis1, dLength1, szAxis2, dLength2, dThreshold, dDistance, iAnalogInput)
end

function PI_qFSS(ID, piResult)
    ccall((:PI_qFSS, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, piResult)
end

function PI_FGC(ID, szProcessIds, pdScanAxisCenterValueArray, pdStepAxisCenterValueArray)
    ccall((:PI_FGC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{Cdouble}), ID, szProcessIds, pdScanAxisCenterValueArray, pdStepAxisCenterValueArray)
end

function PI_qFGC(ID, szProcessIds, pdScanAxisCenterValueArray, pdStepAxisCenterValueArray)
    ccall((:PI_qFGC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{Cdouble}), ID, szProcessIds, pdScanAxisCenterValueArray, pdStepAxisCenterValueArray)
end

function PI_FRC(ID, szProcessIdBase, szProcessIdsCoupled)
    ccall((:PI_FRC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szProcessIdBase, szProcessIdsCoupled)
end

function PI_qFRC(ID, szProcessIdsBase, szBuffer, iBufferSize)
    ccall((:PI_qFRC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szProcessIdsBase, szBuffer, iBufferSize)
end

function PI_qTCI(ID, piFastAlignmentInputIdsArray, pdCalculatedInputValueArray, iArraySize)
    ccall((:PI_qTCI, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piFastAlignmentInputIdsArray, pdCalculatedInputValueArray, iArraySize)
end

function PI_SIC(ID, iFastAlignmentInputId, iCalcType, pdParameters, iNumberOfParameters)
    ccall((:PI_SIC, libpigcs2), BOOL, (Cint, Cint, Cint, Ptr{Cdouble}, Cint), ID, iFastAlignmentInputId, iCalcType, pdParameters, iNumberOfParameters)
end

function PI_qSIC(ID, piFastAlignmentInputIdsArray, iNumberOfInputIds, szBuffer, iBufferSize)
    ccall((:PI_qSIC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Ptr{Cchar}, Cint), ID, piFastAlignmentInputIdsArray, iNumberOfInputIds, szBuffer, iBufferSize)
end

function PI_FDR(ID, szScanRoutineName, szScanAxis, dScanAxisRange, szStepAxis, dStepAxisRange, szParameters)
    ccall((:PI_FDR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cdouble, Ptr{Cchar}, Cdouble, Ptr{Cchar}), ID, szScanRoutineName, szScanAxis, dScanAxisRange, szStepAxis, dStepAxisRange, szParameters)
end

function PI_FDG(ID, szScanRoutineName, szScanAxis, szStepAxis, szParameters)
    ccall((:PI_FDG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, szScanRoutineName, szScanAxis, szStepAxis, szParameters)
end

function PI_FRS(ID, szScanRoutineNames)
    ccall((:PI_FRS, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szScanRoutineNames)
end

function PI_FRP(ID, szScanRoutineNames, piOptionsArray)
    ccall((:PI_FRP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szScanRoutineNames, piOptionsArray)
end

function PI_qFRP(ID, szScanRoutineNames, piOptionsArray)
    ccall((:PI_qFRP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szScanRoutineNames, piOptionsArray)
end

function PI_qFRR(ID, szScanRoutineNames, iResultId, szResult, iBufferSize)
    ccall((:PI_qFRR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Ptr{Cchar}, Cint), ID, szScanRoutineNames, iResultId, szResult, iBufferSize)
end

function PI_qFRRArray(ID, szScanRoutineNames, iResultIds, szResult, iBufferSize)
    ccall((:PI_qFRRArray, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}, Ptr{Cchar}, Cint), ID, szScanRoutineNames, iResultIds, szResult, iBufferSize)
end

function PI_qFRH(ID, szBuffer, iBufferSize)
    ccall((:PI_qFRH, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_SGA(ID, piAnalogChannelIds, piGainValues, iArraySize)
    ccall((:PI_SGA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piAnalogChannelIds, piGainValues, iArraySize)
end

function PI_qSGA(ID, piAnalogChannelIds, piGainValues, iArraySize)
    ccall((:PI_qSGA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piAnalogChannelIds, piGainValues, iArraySize)
end

function PI_NAV(ID, piAnalogChannelIds, piNrReadingsValues, iArraySize)
    ccall((:PI_NAV, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piAnalogChannelIds, piNrReadingsValues, iArraySize)
end

function PI_qNAV(ID, piAnalogChannelIds, piNrReadingsValues, iArraySize)
    ccall((:PI_qNAV, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piAnalogChannelIds, piNrReadingsValues, iArraySize)
end

function PI_GetDynamicMoveBufferSize(ID, iSize)
    ccall((:PI_GetDynamicMoveBufferSize, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iSize)
end

function PI_qCOV(ID, piChannelsArray, pdValueArray, iArraySize)
    ccall((:PI_qCOV, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piChannelsArray, pdValueArray, iArraySize)
end

function PI_MOD(ID, szItems, iModeArray, szValues)
    ccall((:PI_MOD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}), ID, szItems, iModeArray, szValues)
end

function PI_qMOD(ID, szItems, iModeArray, szValues, iMaxValuesSize)
    ccall((:PI_qMOD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}, Ptr{Cchar}, Cint), ID, szItems, iModeArray, szValues, iMaxValuesSize)
end

function PI_qDIA(ID, iIDArray, szValues, iBufferSize, iArraySize)
    ccall((:PI_qDIA, libpigcs2), BOOL, (Cint, Ptr{Cuint}, Ptr{Cchar}, Cint, Cint), ID, iIDArray, szValues, iBufferSize, iArraySize)
end

function PI_qHDI(ID, szBuffer, iBufferSize)
    ccall((:PI_qHDI, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qHIS(ID, szBuffer, iBufferSize)
    ccall((:PI_qHIS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_HIS(ID, iDeviceIDsArray, iItemIDsArray, iPropertyIDArray, szValues, iArraySize)
    ccall((:PI_HIS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cchar}, Cint), ID, iDeviceIDsArray, iItemIDsArray, iPropertyIDArray, szValues, iArraySize)
end

function PI_qHIE(ID, iDeviceIDsArray, iAxesIDsArray, pdValueArray, iArraySize)
    ccall((:PI_qHIE, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, iDeviceIDsArray, iAxesIDsArray, pdValueArray, iArraySize)
end

function PI_qHIB(ID, iDeviceIDsArray, iButtonIDsArray, pbValueArray, iArraySize)
    ccall((:PI_qHIB, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iDeviceIDsArray, iButtonIDsArray, pbValueArray, iArraySize)
end

function PI_HIL(ID, iDeviceIDsArray, iLED_IDsArray, pnValueArray, iArraySize)
    ccall((:PI_HIL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iDeviceIDsArray, iLED_IDsArray, pnValueArray, iArraySize)
end

function PI_qHIL(ID, iDeviceIDsArray, iLED_IDsArray, pnValueArray, iArraySize)
    ccall((:PI_qHIL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iDeviceIDsArray, iLED_IDsArray, pnValueArray, iArraySize)
end

function PI_HIN(ID, szAxes, pbValueArray)
    ccall((:PI_HIN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_qHIN(ID, szAxes, pbValueArray)
    ccall((:PI_qHIN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_HIA(ID, szAxes, iFunctionArray, iDeviceIDsArray, iAxesIDsArray)
    ccall((:PI_HIA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), ID, szAxes, iFunctionArray, iDeviceIDsArray, iAxesIDsArray)
end

function PI_qHIA(ID, szAxes, iFunctionArray, iDeviceIDsArray, iAxesIDsArray)
    ccall((:PI_qHIA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), ID, szAxes, iFunctionArray, iDeviceIDsArray, iAxesIDsArray)
end

function PI_HDT(ID, iDeviceIDsArray, iAxisIDsArray, piValueArray, iArraySize)
    ccall((:PI_HDT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iDeviceIDsArray, iAxisIDsArray, piValueArray, iArraySize)
end

function PI_qHDT(ID, iDeviceIDsArray, iAxisIDsArray, piValueArray, iArraySize)
    ccall((:PI_qHDT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint), ID, iDeviceIDsArray, iAxisIDsArray, piValueArray, iArraySize)
end

function PI_HIT(ID, piTableIdsArray, piPointNumberArray, pdValueArray, iArraySize)
    ccall((:PI_HIT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piTableIdsArray, piPointNumberArray, pdValueArray, iArraySize)
end

function PI_qHIT(ID, piTableIdsArray, iNumberOfTables, iOffsetOfFirstPointInTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
    ccall((:PI_qHIT, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, piTableIdsArray, iNumberOfTables, iOffsetOfFirstPointInTable, iNumberOfValues, pdValueArray, szGcsArrayHeader, iGcsArrayHeaderMaxSize)
end

function PI_qMAN(ID, szCommand, szBuffer, iBufferSize)
    ccall((:PI_qMAN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szCommand, szBuffer, iBufferSize)
end

function PI_KSF(ID, szNameOfCoordSystem)
    ccall((:PI_KSF, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szNameOfCoordSystem)
end

function PI_KEN(ID, szNameOfCoordSystem)
    ccall((:PI_KEN, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szNameOfCoordSystem)
end

function PI_KRM(ID, szNameOfCoordSystem)
    ccall((:PI_KRM, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szNameOfCoordSystem)
end

function PI_KLF(ID, szNameOfCoordSystem)
    ccall((:PI_KLF, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szNameOfCoordSystem)
end

function PI_KSD(ID, szNameOfCoordSystem, szAxes, pdValueArray)
    ccall((:PI_KSD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, szNameOfCoordSystem, szAxes, pdValueArray)
end

function PI_KST(ID, szNameOfCoordSystem, szAxes, pdValueArray)
    ccall((:PI_KST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, szNameOfCoordSystem, szAxes, pdValueArray)
end

function PI_KSW(ID, szNameOfCoordSystem, szAxes, pdValueArray)
    ccall((:PI_KSW, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, szNameOfCoordSystem, szAxes, pdValueArray)
end

function PI_KLD(ID, szNameOfCoordSystem, szAxes, pdValueArray)
    ccall((:PI_KLD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, szNameOfCoordSystem, szAxes, pdValueArray)
end

function PI_KSB(ID, szNameOfCoordSystem, szAxes, pdValueArray)
    ccall((:PI_KSB, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, szNameOfCoordSystem, szAxes, pdValueArray)
end

function PI_MRT(ID, szAxes, pdValueArray)
    ccall((:PI_MRT, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_MRW(ID, szAxes, pdValueArray)
    ccall((:PI_MRW, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, szAxes, pdValueArray)
end

function PI_qKLT(ID, szStartCoordSystem, szEndCoordSystem, buffer, bufsize)
    ccall((:PI_qKLT, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szStartCoordSystem, szEndCoordSystem, buffer, bufsize)
end

function PI_qKEN(ID, szNamesOfCoordSystems, buffer, bufsize)
    ccall((:PI_qKEN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szNamesOfCoordSystems, buffer, bufsize)
end

function PI_qKET(ID, szTypes, buffer, bufsize)
    ccall((:PI_qKET, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szTypes, buffer, bufsize)
end

function PI_qKLS(ID, szNameOfCoordSystem, szItem1, szItem2, buffer, bufsize)
    ccall((:PI_qKLS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szNameOfCoordSystem, szItem1, szItem2, buffer, bufsize)
end

function PI_KLN(ID, szNameOfChild, szNameOfParent)
    ccall((:PI_KLN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szNameOfChild, szNameOfParent)
end

function PI_qKLN(ID, szNamesOfCoordSystems, buffer, bufsize)
    ccall((:PI_qKLN, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szNamesOfCoordSystems, buffer, bufsize)
end

function PI_qTRA(ID, szAxes, pdComponents, pdValueArray)
    ccall((:PI_qTRA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{Cdouble}), ID, szAxes, pdComponents, pdValueArray)
end

function PI_qKLC(ID, szNameOfCoordSystem1, szNameOfCoordSystem2, szItem1, szItem2, buffer, bufsize)
    ccall((:PI_qKLC, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szNameOfCoordSystem1, szNameOfCoordSystem2, szItem1, szItem2, buffer, bufsize)
end

function PI_KCP(ID, szSource, szDestination)
    ccall((:PI_KCP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, szSource, szDestination)
end

function PI_TGA(ID, piTrajectoriesArray, pdValarray, iArraySize)
    ccall((:PI_TGA, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cdouble}, Cint), ID, piTrajectoriesArray, pdValarray, iArraySize)
end

function PI_TGC(ID, piTrajectoriesArray, iArraySize)
    ccall((:PI_TGC, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piTrajectoriesArray, iArraySize)
end

function PI_TGF(ID, piTrajectoriesArray, iArraySize)
    ccall((:PI_TGF, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piTrajectoriesArray, iArraySize)
end

function PI_TGS(ID, piTrajectoriesArray, iArraySize)
    ccall((:PI_TGS, libpigcs2), BOOL, (Cint, Ptr{Cint}, Cint), ID, piTrajectoriesArray, iArraySize)
end

function PI_qTGL(ID, piTrajectoriesArray, iTrajectorySizesArray, iArraySize)
    ccall((:PI_qTGL, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Cint), ID, piTrajectoriesArray, iTrajectorySizesArray, iArraySize)
end

function PI_TGT(ID, iTrajectoryTiming)
    ccall((:PI_TGT, libpigcs2), BOOL, (Cint, Cint), ID, iTrajectoryTiming)
end

function PI_qTGT(ID, iTrajectoryTiming)
    ccall((:PI_qTGT, libpigcs2), BOOL, (Cint, Ptr{Cint}), ID, iTrajectoryTiming)
end

function PI_FSF(ID, szAxis, forceValue1, positionOffset, useForceValue2, forceValue2)
    ccall((:PI_FSF, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cdouble, Cdouble, BOOL, Cdouble), ID, szAxis, forceValue1, positionOffset, useForceValue2, forceValue2)
end

function PI_qFSF(ID, szAxes, pForceValue1Array, pPositionOffsetArray, pForceValue2Array)
    ccall((:PI_qFSF, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), ID, szAxes, pForceValue1Array, pPositionOffsetArray, pForceValue2Array)
end

function PI_qFSR(ID, szAxes, pbValueArray)
    ccall((:PI_qFSR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{BOOL}), ID, szAxes, pbValueArray)
end

function PI_GetSupportedParameters(ID, piParameterIdArray, piCommandLevelArray, piMemoryLocationArray, piDataTypeArray, piNumberOfItems, iiBufferSize, szParameterName, iMaxParameterNameSize)
    ccall((:PI_GetSupportedParameters, libpigcs2), BOOL, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{Cchar}, Cint), ID, piParameterIdArray, piCommandLevelArray, piMemoryLocationArray, piDataTypeArray, piNumberOfItems, iiBufferSize, szParameterName, iMaxParameterNameSize)
end

function PI_GetSupportedControllers(szBuffer, iBufferSize)
    ccall((:PI_GetSupportedControllers, libpigcs2), BOOL, (Ptr{Cchar}, Cint), szBuffer, iBufferSize)
end

function PI_GetAsyncBufferIndex(ID)
    ccall((:PI_GetAsyncBufferIndex, libpigcs2), Cint, (Cint,), ID)
end

function PI_GetAsyncBuffer(ID, pdValueArray)
    ccall((:PI_GetAsyncBuffer, libpigcs2), BOOL, (Cint, Ptr{Ptr{Cdouble}}), ID, pdValueArray)
end

function PI_AddStage(ID, szAxes)
    ccall((:PI_AddStage, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szAxes)
end

function PI_RemoveStage(ID, szStageName)
    ccall((:PI_RemoveStage, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, szStageName)
end

function PI_OpenUserStagesEditDialog(ID)
    ccall((:PI_OpenUserStagesEditDialog, libpigcs2), BOOL, (Cint,), ID)
end

function PI_OpenPiStagesEditDialog(ID)
    ccall((:PI_OpenPiStagesEditDialog, libpigcs2), BOOL, (Cint,), ID)
end

function PI_WriteConfigurationFromDatabaseToController(ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
    ccall((:PI_WriteConfigurationFromDatabaseToController, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
end

function PI_WriteConfigurationFromDatabaseToControllerAndSave(ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
    ccall((:PI_WriteConfigurationFromDatabaseToControllerAndSave, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
end

function PI_ReadConfigurationFromControllerToDatabase(ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
    ccall((:PI_ReadConfigurationFromControllerToDatabase, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, szFilter, szConfigurationName, szWarnings, warningsBufferSize)
end

function PI_GetAvailableControllerConfigurationsFromDatabase(ID, szConfigurationNames, configurationNamesBufferSize)
    ccall((:PI_GetAvailableControllerConfigurationsFromDatabase, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szConfigurationNames, configurationNamesBufferSize)
end

function PI_GetAvailableControllerConfigurationsFromDatabaseByType(ID, szConfigurationNames, configurationNamesBufferSize, configurationType)
    ccall((:PI_GetAvailableControllerConfigurationsFromDatabaseByType, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Cuint), ID, szConfigurationNames, configurationNamesBufferSize, configurationType)
end

function PI_IsAvailable(ID)
    ccall((:PI_IsAvailable, libpigcs2), BOOL, (Cint,), ID)
end

function PI_GetDllVersionInformation(ID, dllVersionsInformationBuffer, bufferSize)
    ccall((:PI_GetDllVersionInformation, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, dllVersionsInformationBuffer, bufferSize)
end

function PI_GetPIStages3VersionInformation(ID, piStages3VersionsInformationBuffer, bufferSize)
    ccall((:PI_GetPIStages3VersionInformation, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, piStages3VersionsInformationBuffer, bufferSize)
end

function PI_POL(ID, szAxes, iValueArray)
    ccall((:PI_POL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, szAxes, iValueArray)
end

function PI_STD(ID, tableType, tableID, data)
    ccall((:PI_STD, libpigcs2), BOOL, (Cint, Cint, Cint, Ptr{Cchar}), ID, tableType, tableID, data)
end

function PI_RTD(ID, tableType, tableID, name)
    ccall((:PI_RTD, libpigcs2), BOOL, (Cint, Cint, Cint, Ptr{Cchar}), ID, tableType, tableID, name)
end

function PI_qRTD(ID, tableType, tableID, infoID, buffer, bufsize)
    ccall((:PI_qRTD, libpigcs2), BOOL, (Cint, Cint, Cint, Cint, Ptr{Cchar}, Cint), ID, tableType, tableID, infoID, buffer, bufsize)
end

function PI_qLST(ID, buffer, bufsize)
    ccall((:PI_qLST, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, buffer, bufsize)
end

function PI_DLT(ID, name)
    ccall((:PI_DLT, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, name)
end

function PI_REC_START(ID, recorderIds)
    ccall((:PI_REC_START, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, recorderIds)
end

function PI_REC_STOP(ID, recorderIds)
    ccall((:PI_REC_STOP, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, recorderIds)
end

function PI_REC_RATE(ID, recorderId, rate)
    ccall((:PI_REC_RATE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, recorderId, rate)
end

function PI_qREC_RATE(ID, recorderIds, rateValues)
    ccall((:PI_qREC_RATE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, recorderIds, rateValues)
end

function PI_REC_TRACE(ID, recorderId, traceId, containerUnitId, functionUnitId, parameterId)
    ccall((:PI_REC_TRACE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, recorderId, traceId, containerUnitId, functionUnitId, parameterId)
end

function PI_REC_TRG(ID, recorderId, triggerMode, triggerOption1, triggerOption2)
    ccall((:PI_REC_TRG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, recorderId, triggerMode, triggerOption1, triggerOption2)
end

function PI_qREC_NUM(ID, recorderIds, numDataValues)
    ccall((:PI_qREC_NUM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cint}), ID, recorderIds, numDataValues)
end

function PI_qREC_STATE(ID, recorderIds, statesBuffer, statesBufferSize)
    ccall((:PI_qREC_STATE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, recorderIds, statesBuffer, statesBufferSize)
end

function PI_qREC_TRG(ID, recorderIds, triggerConfigurationBuffer, triggerConfigurationBufferSize)
    ccall((:PI_qREC_TRG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, recorderIds, triggerConfigurationBuffer, triggerConfigurationBufferSize)
end

function PI_qREC_TRACE(ID, recorderId, traceIndex, traceConfigurationBuffer, traceConfigurationBufferSize)
    ccall((:PI_qREC_TRACE, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint, Ptr{Cchar}, Cint), ID, recorderId, traceIndex, traceConfigurationBuffer, traceConfigurationBufferSize)
end

function PI_qREC_DAT(ID, recorderId, dataFormat, offset, numberOfValue, traceIndices, numberOfTraceIndices, dataValues, gcsArrayHeaderBuffer, gcsArrayHeaderBufferSize)
    ccall((:PI_qREC_DAT, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cdouble}}, Ptr{Cchar}, Cint), ID, recorderId, dataFormat, offset, numberOfValue, traceIndices, numberOfTraceIndices, dataValues, gcsArrayHeaderBuffer, gcsArrayHeaderBufferSize)
end

function PI_UCL(ID, userCommandLevel, password)
    ccall((:PI_UCL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}), ID, userCommandLevel, password)
end

function PI_qUCL(ID, userCommandLevel, bufSize)
    ccall((:PI_qUCL, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, userCommandLevel, bufSize)
end

function PI_qIPR(ID, szBuffer, iBufferSize)
    ccall((:PI_qIPR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, szBuffer, iBufferSize)
end

function PI_qUSG(ID, usg, bufSize)
    ccall((:PI_qUSG, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cint), ID, usg, bufSize)
end

function PI_qUSG_CMD(ID, chapter, usg, bufSize)
    ccall((:PI_qUSG_CMD, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, chapter, usg, bufSize)
end

function PI_qUSG_SYS(ID, chapter, usg, bufSize)
    ccall((:PI_qUSG_SYS, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, chapter, usg, bufSize)
end

function PI_qUSG_PAM(ID, chapter, usg, bufSize)
    ccall((:PI_qUSG_PAM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, chapter, usg, bufSize)
end

function PI_qUSG_HW(ID, chapter, usg, bufSize)
    ccall((:PI_qUSG_HW, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, chapter, usg, bufSize)
end

function PI_qUSG_PROP(ID, chapter, usg, bufSize)
    ccall((:PI_qUSG_PROP, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, chapter, usg, bufSize)
end

function PI_qLOG(ID, startIndex, errorLog, bufSize)
    ccall((:PI_qLOG, libpigcs2), BOOL, (Cint, Cint, Ptr{Cchar}, Cint), ID, startIndex, errorLog, bufSize)
end

function PI_SPV_Int32(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_Int32, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, INT32), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_SPV_UInt32(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_UInt32, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, UINT32), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_SPV_Int64(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_Int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, INT64), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_SPV_UInt64(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_UInt64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, UINT64), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_SPV_Double(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_Double, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cdouble), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_SPV_String(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_SPV_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV(ID, memType, containerUnit, functionUnit, parameter, answer, bufSize)
    ccall((:PI_qSPV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, memType, containerUnit, functionUnit, parameter, answer, bufSize)
end

function PI_qSPV_Int32(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_qSPV_Int32, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{INT32}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV_UInt32(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_qSPV_UInt32, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{UINT32}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV_Int64(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_qSPV_Int64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{INT64}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV_UInt64(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_qSPV_UInt64, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{UINT64}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV_Double(ID, memType, containerUnit, functionUnit, parameter, value)
    ccall((:PI_qSPV_Double, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cdouble}), ID, memType, containerUnit, functionUnit, parameter, value)
end

function PI_qSPV_String(ID, memType, containerUnit, functionUnit, parameter, value, bufSize)
    ccall((:PI_qSPV_String, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), ID, memType, containerUnit, functionUnit, parameter, value, bufSize)
end

function PI_CPA(ID, sourceMemType, targetMemType, containerUnit, functionUnit, parameter)
    ccall((:PI_CPA, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), ID, sourceMemType, targetMemType, containerUnit, functionUnit, parameter)
end

function PI_qSTV(ID, containerUnit, statusArray)
    ccall((:PI_qSTV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}), ID, containerUnit, statusArray)
end

function PI_SAM(ID, axisContainerUnit, axisOperationMode)
    ccall((:PI_SAM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Cuint), ID, axisContainerUnit, axisOperationMode)
end

function PI_qSAM(ID, axisContainerUnit, axesOperationModesArray)
    ccall((:PI_qSAM, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cuint}), ID, axisContainerUnit, axesOperationModesArray)
end

function PI_RES(ID, axisContainerUnit)
    ccall((:PI_RES, libpigcs2), BOOL, (Cint, Ptr{Cchar}), ID, axisContainerUnit)
end

function PI_SMV(ID, axisContainerUnitsArray, numberOfStepsArray)
    ccall((:PI_SMV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, axisContainerUnitsArray, numberOfStepsArray)
end

function PI_qSMV(ID, axisContainerUnit, commandedSteps)
    ccall((:PI_qSMV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, axisContainerUnit, commandedSteps)
end

function PI_qSMR(ID, axisContainerUnit, remainingSteps)
    ccall((:PI_qSMR, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, axisContainerUnit, remainingSteps)
end

function PI_OCV(ID, axisContainerUnitsArray, controlValueArray)
    ccall((:PI_OCV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, axisContainerUnitsArray, controlValueArray)
end

function PI_qOCV(ID, axisContainerUnit, controlValueArray)
    ccall((:PI_qOCV, libpigcs2), BOOL, (Cint, Ptr{Cchar}, Ptr{Cdouble}), ID, axisContainerUnit, controlValueArray)
end

