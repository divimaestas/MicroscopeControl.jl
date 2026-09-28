function is_CaptureStatus(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_CaptureStatus, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_SetSaturation(hCam, ChromU, ChromV)
    ccall((:is_SetSaturation, libuc480), INT, (HCAM, INT, INT), hCam, ChromU, ChromV)
end

function is_PrepareStealVideo(hCam, Mode, StealColorMode)
    ccall((:is_PrepareStealVideo, libuc480), INT, (HCAM, Cint, ULONG), hCam, Mode, StealColorMode)
end

function is_GetNumberOfDevices()
    ccall((:is_GetNumberOfDevices, libuc480), INT, ())
end

function is_StopLiveVideo(hCam, Wait)
    ccall((:is_StopLiveVideo, libuc480), INT, (HCAM, INT), hCam, Wait)
end

function is_FreezeVideo(hCam, Wait)
    ccall((:is_FreezeVideo, libuc480), INT, (HCAM, INT), hCam, Wait)
end

function is_CaptureVideo(hCam, Wait)
    ccall((:is_CaptureVideo, libuc480), INT, (HCAM, INT), hCam, Wait)
end

function is_IsVideoFinish(hCam, pValue)
    ccall((:is_IsVideoFinish, libuc480), INT, (HCAM, Ptr{INT}), hCam, pValue)
end

function is_HasVideoStarted(hCam, pbo)
    ccall((:is_HasVideoStarted, libuc480), INT, (HCAM, Ptr{BOOL}), hCam, pbo)
end

function is_AllocImageMem(hCam, width, height, bitspixel, ppcImgMem, pid)
    ccall((:is_AllocImageMem, libuc480), INT, (HCAM, INT, INT, INT, Ptr{Ptr{Cchar}}, Ptr{Cint}), hCam, width, height, bitspixel, ppcImgMem, pid)
end

function is_SetImageMem(hCam, pcMem, id)
    ccall((:is_SetImageMem, libuc480), INT, (HCAM, Ptr{Cchar}, Cint), hCam, pcMem, id)
end

function is_FreeImageMem(hCam, pcMem, id)
    ccall((:is_FreeImageMem, libuc480), INT, (HCAM, Ptr{Cchar}, Cint), hCam, pcMem, id)
end

function is_GetImageMem(hCam, pMem)
    ccall((:is_GetImageMem, libuc480), INT, (HCAM, Ptr{Ptr{Cvoid}}), hCam, pMem)
end

function is_GetActiveImageMem(hCam, ppcMem, pnID)
    ccall((:is_GetActiveImageMem, libuc480), INT, (HCAM, Ptr{Ptr{Cchar}}, Ptr{Cint}), hCam, ppcMem, pnID)
end

function is_InquireImageMem(hCam, pcMem, nID, pnX, pnY, pnBits, pnPitch)
    ccall((:is_InquireImageMem, libuc480), INT, (HCAM, Ptr{Cchar}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hCam, pcMem, nID, pnX, pnY, pnBits, pnPitch)
end

function is_GetImageMemPitch(hCam, pPitch)
    ccall((:is_GetImageMemPitch, libuc480), INT, (HCAM, Ptr{INT}), hCam, pPitch)
end

function is_SetAllocatedImageMem(hCam, width, height, bitspixel, pcImgMem, pid)
    ccall((:is_SetAllocatedImageMem, libuc480), INT, (HCAM, INT, INT, INT, Ptr{Cchar}, Ptr{Cint}), hCam, width, height, bitspixel, pcImgMem, pid)
end

function is_CopyImageMem(hCam, pcSource, nID, pcDest)
    ccall((:is_CopyImageMem, libuc480), INT, (HCAM, Ptr{Cchar}, Cint, Ptr{Cchar}), hCam, pcSource, nID, pcDest)
end

function is_CopyImageMemLines(hCam, pcSource, nID, nLines, pcDest)
    ccall((:is_CopyImageMemLines, libuc480), INT, (HCAM, Ptr{Cchar}, Cint, Cint, Ptr{Cchar}), hCam, pcSource, nID, nLines, pcDest)
end

function is_AddToSequence(hCam, pcMem, nID)
    ccall((:is_AddToSequence, libuc480), INT, (HCAM, Ptr{Cchar}, INT), hCam, pcMem, nID)
end

function is_ClearSequence(hCam)
    ccall((:is_ClearSequence, libuc480), INT, (HCAM,), hCam)
end

function is_GetActSeqBuf(hCam, pnNum, ppcMem, ppcMemLast)
    ccall((:is_GetActSeqBuf, libuc480), INT, (HCAM, Ptr{INT}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}), hCam, pnNum, ppcMem, ppcMemLast)
end

function is_LockSeqBuf(hCam, nNum, pcMem)
    ccall((:is_LockSeqBuf, libuc480), INT, (HCAM, INT, Ptr{Cchar}), hCam, nNum, pcMem)
end

function is_UnlockSeqBuf(hCam, nNum, pcMem)
    ccall((:is_UnlockSeqBuf, libuc480), INT, (HCAM, INT, Ptr{Cchar}), hCam, nNum, pcMem)
end

function is_GetError(hCam, pErr, ppcErr)
    ccall((:is_GetError, libuc480), INT, (HCAM, Ptr{INT}, Ptr{Ptr{IS_CHAR}}), hCam, pErr, ppcErr)
end

function is_SetErrorReport(hCam, Mode)
    ccall((:is_SetErrorReport, libuc480), INT, (HCAM, INT), hCam, Mode)
end

function is_ReadEEPROM(hCam, Adr, pcString, Count)
    ccall((:is_ReadEEPROM, libuc480), INT, (HCAM, INT, Ptr{Cchar}, INT), hCam, Adr, pcString, Count)
end

function is_WriteEEPROM(hCam, Adr, pcString, Count)
    ccall((:is_WriteEEPROM, libuc480), INT, (HCAM, INT, Ptr{Cchar}, INT), hCam, Adr, pcString, Count)
end

function is_SetColorMode(hCam, Mode)
    ccall((:is_SetColorMode, libuc480), INT, (HCAM, INT), hCam, Mode)
end

function is_GetColorDepth(hCam, pnCol, pnColMode)
    ccall((:is_GetColorDepth, libuc480), INT, (HCAM, Ptr{INT}, Ptr{INT}), hCam, pnCol, pnColMode)
end

function is_RenderBitmap(hCam, nMemID, hwnd, nMode)
    ccall((:is_RenderBitmap, libuc480), INT, (HCAM, INT, HWND, INT), hCam, nMemID, hwnd, nMode)
end

function is_SetDisplayMode(hCam, Mode)
    ccall((:is_SetDisplayMode, libuc480), INT, (HCAM, INT), hCam, Mode)
end

function is_SetDisplayPos(hCam, x, y)
    ccall((:is_SetDisplayPos, libuc480), INT, (HCAM, INT, INT), hCam, x, y)
end

function is_SetHwnd(hCam, hwnd)
    ccall((:is_SetHwnd, libuc480), INT, (HCAM, HWND), hCam, hwnd)
end

function is_GetVsyncCount(hCam, pIntr, pActIntr)
    ccall((:is_GetVsyncCount, libuc480), INT, (HCAM, Ptr{Clong}, Ptr{Clong}), hCam, pIntr, pActIntr)
end

function is_GetDLLVersion()
    ccall((:is_GetDLLVersion, libuc480), INT, ())
end

function is_InitEvent(hCam, hEv, which)
    ccall((:is_InitEvent, libuc480), INT, (HCAM, HANDLE, INT), hCam, hEv, which)
end

function is_ExitEvent(hCam, which)
    ccall((:is_ExitEvent, libuc480), INT, (HCAM, INT), hCam, which)
end

function is_EnableEvent(hCam, which)
    ccall((:is_EnableEvent, libuc480), INT, (HCAM, INT), hCam, which)
end

function is_DisableEvent(hCam, which)
    ccall((:is_DisableEvent, libuc480), INT, (HCAM, INT), hCam, which)
end

function is_SetExternalTrigger(hCam, nTriggerMode)
    ccall((:is_SetExternalTrigger, libuc480), INT, (HCAM, INT), hCam, nTriggerMode)
end

function is_SetTriggerCounter(hCam, nValue)
    ccall((:is_SetTriggerCounter, libuc480), INT, (HCAM, INT), hCam, nValue)
end

function is_SetRopEffect(hCam, effect, param, reserved)
    ccall((:is_SetRopEffect, libuc480), INT, (HCAM, INT, INT, INT), hCam, effect, param, reserved)
end

function is_InitCamera(phCam, hWnd)
    ccall((:is_InitCamera, libuc480), INT, (Ptr{HCAM}, HWND), phCam, hWnd)
end

function is_ExitCamera(hCam)
    ccall((:is_ExitCamera, libuc480), INT, (HCAM,), hCam)
end

function is_GetCameraInfo(hCam, pInfo)
    ccall((:is_GetCameraInfo, libuc480), INT, (HCAM, PBOARDINFO), hCam, pInfo)
end

function is_CameraStatus(hCam, nInfo, ulValue)
    ccall((:is_CameraStatus, libuc480), ULONG, (HCAM, INT, ULONG), hCam, nInfo, ulValue)
end

function is_GetCameraType(hCam)
    ccall((:is_GetCameraType, libuc480), INT, (HCAM,), hCam)
end

function is_GetNumberOfCameras(pnNumCams)
    ccall((:is_GetNumberOfCameras, libuc480), INT, (Ptr{INT},), pnNumCams)
end

function is_GetUsedBandwidth(hCam)
    ccall((:is_GetUsedBandwidth, libuc480), INT, (HCAM,), hCam)
end

function is_GetFrameTimeRange(hCam, min, max, intervall)
    ccall((:is_GetFrameTimeRange, libuc480), INT, (HCAM, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCam, min, max, intervall)
end

function is_SetFrameRate(hCam, FPS, newFPS)
    ccall((:is_SetFrameRate, libuc480), INT, (HCAM, Cdouble, Ptr{Cdouble}), hCam, FPS, newFPS)
end

function is_GetFramesPerSecond(hCam, dblFPS)
    ccall((:is_GetFramesPerSecond, libuc480), INT, (HCAM, Ptr{Cdouble}), hCam, dblFPS)
end

function is_GetSensorInfo(hCam, pInfo)
    ccall((:is_GetSensorInfo, libuc480), INT, (HCAM, PSENSORINFO), hCam, pInfo)
end

function is_GetRevisionInfo(hCam, prevInfo)
    ccall((:is_GetRevisionInfo, libuc480), INT, (HCAM, PREVISIONINFO), hCam, prevInfo)
end

function is_EnableAutoExit(hCam, nMode)
    ccall((:is_EnableAutoExit, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_EnableMessage(hCam, which, hWnd)
    ccall((:is_EnableMessage, libuc480), INT, (HCAM, INT, HWND), hCam, which, hWnd)
end

function is_SetHardwareGain(hCam, nMaster, nRed, nGreen, nBlue)
    ccall((:is_SetHardwareGain, libuc480), INT, (HCAM, INT, INT, INT, INT), hCam, nMaster, nRed, nGreen, nBlue)
end

function is_SetWhiteBalance(hCam, nMode)
    ccall((:is_SetWhiteBalance, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_SetWhiteBalanceMultipliers(hCam, dblRed, dblGreen, dblBlue)
    ccall((:is_SetWhiteBalanceMultipliers, libuc480), INT, (HCAM, Cdouble, Cdouble, Cdouble), hCam, dblRed, dblGreen, dblBlue)
end

function is_GetWhiteBalanceMultipliers(hCam, pdblRed, pdblGreen, pdblBlue)
    ccall((:is_GetWhiteBalanceMultipliers, libuc480), INT, (HCAM, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCam, pdblRed, pdblGreen, pdblBlue)
end

function is_SetColorCorrection(hCam, nEnable, factors)
    ccall((:is_SetColorCorrection, libuc480), INT, (HCAM, INT, Ptr{Cdouble}), hCam, nEnable, factors)
end

function is_SetSubSampling(hCam, mode)
    ccall((:is_SetSubSampling, libuc480), INT, (HCAM, INT), hCam, mode)
end

function is_ForceTrigger(hCam)
    ccall((:is_ForceTrigger, libuc480), INT, (HCAM,), hCam)
end

function is_GetBusSpeed(hCam)
    ccall((:is_GetBusSpeed, libuc480), INT, (HCAM,), hCam)
end

function is_SetBinning(hCam, mode)
    ccall((:is_SetBinning, libuc480), INT, (HCAM, INT), hCam, mode)
end

function is_ResetToDefault(hCam)
    ccall((:is_ResetToDefault, libuc480), INT, (HCAM,), hCam)
end

function is_SetCameraID(hCam, nID)
    ccall((:is_SetCameraID, libuc480), INT, (HCAM, INT), hCam, nID)
end

function is_SetBayerConversion(hCam, nMode)
    ccall((:is_SetBayerConversion, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_SetHardwareGamma(hCam, nMode)
    ccall((:is_SetHardwareGamma, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_GetCameraList(pucl)
    ccall((:is_GetCameraList, libuc480), INT, (PUC480_CAMERA_LIST,), pucl)
end

function is_SetAutoParameter(hCam, param, pval1, pval2)
    ccall((:is_SetAutoParameter, libuc480), INT, (HCAM, INT, Ptr{Cdouble}, Ptr{Cdouble}), hCam, param, pval1, pval2)
end

function is_GetAutoInfo(hCam, pInfo)
    ccall((:is_GetAutoInfo, libuc480), INT, (HCAM, Ptr{UC480_AUTO_INFO}), hCam, pInfo)
end

function is_GetImageHistogram(hCam, nID, ColorMode, pHistoMem)
    ccall((:is_GetImageHistogram, libuc480), INT, (HCAM, Cint, INT, Ptr{DWORD}), hCam, nID, ColorMode, pHistoMem)
end

function is_SetTriggerDelay(hCam, nTriggerDelay)
    ccall((:is_SetTriggerDelay, libuc480), INT, (HCAM, INT), hCam, nTriggerDelay)
end

function is_SetGainBoost(hCam, mode)
    ccall((:is_SetGainBoost, libuc480), INT, (HCAM, INT), hCam, mode)
end

function is_SetGlobalShutter(hCam, mode)
    ccall((:is_SetGlobalShutter, libuc480), INT, (HCAM, INT), hCam, mode)
end

function is_SetExtendedRegister(hCam, index, value)
    ccall((:is_SetExtendedRegister, libuc480), INT, (HCAM, INT, WORD), hCam, index, value)
end

function is_GetExtendedRegister(hCam, index, pwValue)
    ccall((:is_GetExtendedRegister, libuc480), INT, (HCAM, INT, Ptr{WORD}), hCam, index, pwValue)
end

function is_SetHWGainFactor(hCam, nMode, nFactor)
    ccall((:is_SetHWGainFactor, libuc480), INT, (HCAM, INT, INT), hCam, nMode, nFactor)
end

function is_Renumerate(hCam, nMode)
    ccall((:is_Renumerate, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_WriteI2C(hCam, nDeviceAddr, nRegisterAddr, pbData, nLen)
    ccall((:is_WriteI2C, libuc480), INT, (HCAM, INT, INT, Ptr{BYTE}, INT), hCam, nDeviceAddr, nRegisterAddr, pbData, nLen)
end

function is_ReadI2C(hCam, nDeviceAddr, nRegisterAddr, pbData, nLen)
    ccall((:is_ReadI2C, libuc480), INT, (HCAM, INT, INT, Ptr{BYTE}, INT), hCam, nDeviceAddr, nRegisterAddr, pbData, nLen)
end

function is_GetHdrMode(hCam, Mode)
    ccall((:is_GetHdrMode, libuc480), INT, (HCAM, Ptr{INT}), hCam, Mode)
end

function is_EnableHdr(hCam, Enable)
    ccall((:is_EnableHdr, libuc480), INT, (HCAM, INT), hCam, Enable)
end

function is_SetHdrKneepoints(hCam, KneepointArray, KneepointArraySize)
    ccall((:is_SetHdrKneepoints, libuc480), INT, (HCAM, Ptr{KNEEPOINTARRAY}, INT), hCam, KneepointArray, KneepointArraySize)
end

function is_GetHdrKneepoints(hCam, KneepointArray, KneepointArraySize)
    ccall((:is_GetHdrKneepoints, libuc480), INT, (HCAM, Ptr{KNEEPOINTARRAY}, INT), hCam, KneepointArray, KneepointArraySize)
end

function is_GetHdrKneepointInfo(hCam, KneepointInfo, KneepointInfoSize)
    ccall((:is_GetHdrKneepointInfo, libuc480), INT, (HCAM, Ptr{KNEEPOINTINFO}, INT), hCam, KneepointInfo, KneepointInfoSize)
end

function is_SetOptimalCameraTiming(hCam, Mode, Timeout, pMaxPxlClk, pMaxFrameRate)
    ccall((:is_SetOptimalCameraTiming, libuc480), INT, (HCAM, INT, INT, Ptr{INT}, Ptr{Cdouble}), hCam, Mode, Timeout, pMaxPxlClk, pMaxFrameRate)
end

function is_GetSupportedTestImages(hCam, SupportedTestImages)
    ccall((:is_GetSupportedTestImages, libuc480), INT, (HCAM, Ptr{INT}), hCam, SupportedTestImages)
end

function is_GetTestImageValueRange(hCam, TestImage, TestImageValueMin, TestImageValueMax)
    ccall((:is_GetTestImageValueRange, libuc480), INT, (HCAM, INT, Ptr{INT}, Ptr{INT}), hCam, TestImage, TestImageValueMin, TestImageValueMax)
end

function is_SetSensorTestImage(hCam, Param1, Param2)
    ccall((:is_SetSensorTestImage, libuc480), INT, (HCAM, INT, INT), hCam, Param1, Param2)
end

function is_GetColorConverter(hCam, ColorMode, pCurrentConvertMode, pDefaultConvertMode, pSupportedConvertModes)
    ccall((:is_GetColorConverter, libuc480), INT, (HCAM, INT, Ptr{INT}, Ptr{INT}, Ptr{INT}), hCam, ColorMode, pCurrentConvertMode, pDefaultConvertMode, pSupportedConvertModes)
end

function is_SetColorConverter(hCam, ColorMode, ConvertMode)
    ccall((:is_SetColorConverter, libuc480), INT, (HCAM, INT, INT), hCam, ColorMode, ConvertMode)
end

function is_WaitForNextImage(hCam, timeout, ppcMem, imageID)
    ccall((:is_WaitForNextImage, libuc480), INT, (HCAM, UINT, Ptr{Ptr{Cchar}}, Ptr{INT}), hCam, timeout, ppcMem, imageID)
end

function is_InitImageQueue(hCam, nMode)
    ccall((:is_InitImageQueue, libuc480), INT, (HCAM, INT), hCam, nMode)
end

function is_ExitImageQueue(hCam)
    ccall((:is_ExitImageQueue, libuc480), INT, (HCAM,), hCam)
end

function is_SetTimeout(hCam, nMode, Timeout)
    ccall((:is_SetTimeout, libuc480), INT, (HCAM, UINT, UINT), hCam, nMode, Timeout)
end

function is_GetTimeout(hCam, nMode, pTimeout)
    ccall((:is_GetTimeout, libuc480), INT, (HCAM, UINT, Ptr{UINT}), hCam, nMode, pTimeout)
end

function is_GetDuration(hCam, nMode, pnTime)
    ccall((:is_GetDuration, libuc480), INT, (HCAM, UINT, Ptr{INT}), hCam, nMode, pnTime)
end

function is_GetSensorScalerInfo(hCam, pSensorScalerInfo, nSensorScalerInfoSize)
    ccall((:is_GetSensorScalerInfo, libuc480), INT, (HCAM, Ptr{SENSORSCALERINFO}, INT), hCam, pSensorScalerInfo, nSensorScalerInfoSize)
end

function is_SetSensorScaler(hCam, nMode, dblFactor)
    ccall((:is_SetSensorScaler, libuc480), INT, (HCAM, UINT, Cdouble), hCam, nMode, dblFactor)
end

function is_GetImageInfo(hCam, nImageBufferID, pImageInfo, nImageInfoSize)
    ccall((:is_GetImageInfo, libuc480), INT, (HCAM, INT, Ptr{UC480IMAGEINFO}, INT), hCam, nImageBufferID, pImageInfo, nImageInfoSize)
end

function is_ImageFormat(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_ImageFormat, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_FaceDetection(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_FaceDetection, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_Focus(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_Focus, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_ImageStabilization(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_ImageStabilization, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_ScenePreset(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_ScenePreset, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_Zoom(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_Zoom, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_Sharpness(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_Sharpness, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_Saturation(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_Saturation, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_TriggerDebounce(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_TriggerDebounce, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_ColorTemperature(hCam, nCommand, pParam, nSizeOfParam)
    ccall((:is_ColorTemperature, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, nSizeOfParam)
end

function is_DirectRenderer(hCam, nMode, pParam, SizeOfParam)
    ccall((:is_DirectRenderer, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nMode, pParam, SizeOfParam)
end

function is_HotPixel(hCam, nMode, pParam, SizeOfParam)
    ccall((:is_HotPixel, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nMode, pParam, SizeOfParam)
end

function is_AOI(hCam, nCommand, pParam, SizeOfParam)
    ccall((:is_AOI, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, SizeOfParam)
end

function is_Transfer(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Transfer, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_BootBoost(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_BootBoost, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_DeviceFeature(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_DeviceFeature, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Exposure(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Exposure, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Trigger(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Trigger, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_DeviceInfo(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_DeviceInfo, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Callback(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Callback, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_OptimalCameraTiming(hCam, u32Command, pParam, u32SizeOfParam)
    ccall((:is_OptimalCameraTiming, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, u32Command, pParam, u32SizeOfParam)
end

function is_SetStarterFirmware(hCam, pcFilepath, uFilepathLen)
    ccall((:is_SetStarterFirmware, libuc480), INT, (HCAM, Ptr{CHAR}, UINT), hCam, pcFilepath, uFilepathLen)
end

function is_SetPacketFilter(iAdapterID, uFilterSetting)
    ccall((:is_SetPacketFilter, libuc480), INT, (INT, UINT), iAdapterID, uFilterSetting)
end

function is_GetComportNumber(hCam, pComportNumber)
    ccall((:is_GetComportNumber, libuc480), INT, (HCAM, Ptr{UINT}), hCam, pComportNumber)
end

function is_IpConfig(iID, mac, nCommand, pParam, cbSizeOfParam)
    ccall((:is_IpConfig, libuc480), INT, (INT, UC480_ETH_ADDR_MAC, UINT, Ptr{Cvoid}, UINT), iID, mac, nCommand, pParam, cbSizeOfParam)
end

function is_Configuration(nCommand, pParam, cbSizeOfParam)
    ccall((:is_Configuration, libuc480), INT, (UINT, Ptr{Cvoid}, UINT), nCommand, pParam, cbSizeOfParam)
end

function is_IO(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_IO, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_AutoParameter(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_AutoParameter, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Convert(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Convert, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_ParameterSet(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_ParameterSet, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_EdgeEnhancement(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_EdgeEnhancement, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_PixelClock(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_PixelClock, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_ImageFile(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_ImageFile, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Blacklevel(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Blacklevel, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_ImageBuffer(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_ImageBuffer, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_Measure(hCam, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Measure, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParam)
end

function is_LUT(hCam, nCommand, pParam, cbSizeOfParams)
    ccall((:is_LUT, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParams)
end

function is_Gamma(hCam, nCommand, pParam, cbSizeOfParams)
    ccall((:is_Gamma, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParams)
end

function is_Memory(hf, nCommand, pParam, cbSizeOfParam)
    ccall((:is_Memory, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hf, nCommand, pParam, cbSizeOfParam)
end

function is_Multicast(hCam, nCommand, pParam, cbSizeOfParams)
    ccall((:is_Multicast, libuc480), INT, (HCAM, UINT, Ptr{Cvoid}, UINT), hCam, nCommand, pParam, cbSizeOfParams)
end

