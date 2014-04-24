#include-once

; #### Title ####
; ===================================================================================
; Remote procedure call, - Pusofalse, kanxinqi@yahoo.com.cn
; ===================================================================================


Global Const $hAu3ThreadDll = DllOpen("Kernel32.dll")

Func _RTCreateRemoteThread($hProcess, $pStartAddress, $pParameter = 0, _
		$iFlags = 0, $pSecurAttr = 0, $iStackSize = 0)

	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "handle", "CreateRemoteThread", "handle", $hProcess, _
			"ptr", $pSecurAttr, "dword", $iStackSize, "ptr", $pStartAddress, _
			"ptr", $pParameter, "dword", $iFlags, "dword*", 0)
	Return SetError(_RTLastError(), $iResult[7], $iResult[0])
EndFunc	;==>_RTCreateRemoteThread

Func _RTExitThread($iExitStatus = 0)
	DllCall($hAu3ThreadDll, "none", "ExitThread", "dword", $iExitStatus)
EndFunc	;==>_RTExitThread

Func _RTGetWindowThreadProcessId($hWnd)
	Local $iResult
	$iResult = DllCall("User32.dll", "dword", "GetWindowThreadProcessId", "hWnd", $hWnd, "dword*", 0)
	Return SetError(_RTLastError(), $iResult[0], $iResult[2])
EndFunc	;==>_RTGetWindowThreadProcessId

Func _RTGetProcAddress($vModule, $sProcedure)
	Local $iResult

	If IsString($vModule) Then
		$vModule = _RTGetModuleHandle($vModule)
	EndIf
	$iResult = DllCall($hAu3ThreadDll, "ptr", "GetProcAddress", "ptr", $vModule, "str", $sProcedure)
	Return SetError(_RTLastError(), $vModule, $iResult[0])
EndFunc	;==>_RTGetProcAddress

Func _RTGetModuleHandle($sModule)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "GetModuleHandle", "str", $sModule)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTGetModuleHandle

Func _RTLoadLibrary($sModule)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "LoadLibrary", "str", $sModule)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTLoadLibrary


Const $RT_MEMCOMMIT = 0x1000
Const $RT_MEMRESERVE = 0x2000
Const $RT_MEMDECOMMIT = 0x4000
Const $RT_MEMRELEASE = 0x8000

Func _RTReadProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, $sReturnType = "ptr")
	Local $iFlags, $iResult

	Switch $sReturnType
	Case "ptr"
		If IsDllStruct($pBuffer) Then $pBuffer = DllStructGetPtr($pBuffer)
	Case "binary", "binary*"
		Local $tBuffer = DllStructCreate("ubyte Binary[" & $iSize & "]")
		$pBuffer = DllStructGetPtr($tBuffer)
		$sReturnType = "ptr"
		$iFlags = 1
	Case "str"
		$iSize += 1
	Case "wstr"
		$iSize += 2
	EndSwitch

	$iResult = DllCall($hAu3ThreadDll, "bool", "ReadProcessMemory", "handle", $hProcess, _
			"ptr", $pBaseAddress, $sReturnType, $pBuffer, "dword", $iSize, _
			"dword*", 0)
	If (@error) Then
		If ($iFlags) Then $tBuffer = 0
		Return SetError(87, 0, "")
	EndIf
	If ($iResult[0] = 0) Then
		$iResult[3] = ""
		If ($iFlags) Then $tBuffer = 0
	ElseIf ($iFlags) Then
		$sReturnType = "binary"
		$iResult[3] = DllStructGetData($tBuffer, 1)
	EndIf

	If ($sReturnType = "ptr") Then
		Return SetError(_RTLastError(), $iResult[5], $iResult[0])
	Else
		Return SetError(_RTLastError(), $iResult[5], $iResult[3])
	EndIf
EndFunc	;==>_RTReadProcessMemory

Func _RTWriteProcessMemory($hProcess, $pBaseAddress, $pBuffer, $iSize, $sBufferType = "ptr")
	Switch $sBufferType
	Case "ptr"
		If IsDllStruct($pBuffer) Then $pBuffer = DllStructGetPtr($pBuffer)
	Case "binary", "binary*"
		$sBufferType = "ptr"
		Local $tBuffer = DllStructCreate("ubyte Binary[" & $iSize & "]")
		DllStructSetData($tBuffer, "Binary", $pBuffer)
		$pBuffer = DllStructGetPtr($tBuffer)
	Case "str"
		$iSize += 1
	Case "wstr"
		$iSize += 2
	EndSwitch

	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "WriteProcessMemory", "handle", $hProcess, _
			"ptr", $pBaseAddress, $sBufferType, $pBuffer, "dword", $iSize, _
			"dword*", 0)
	If ($sBufferType = "binary") Or ($sBufferType = "binary*") Then $tBuffer = 0
	If (@error) Then
		Return SetError(87, 0, 0)
	Else
		Return SetError(_RTLastError(), $iResult[5], $iResult[0])
	EndIf
EndFunc	;==>_RTWriteProcessMemory

Func _RTReadBytes($pBuffer, $sType = "dword", $iBytesToRead = 4)
	Local $vReturn

	If ($sType <> "str") And ($sType <> "wstr") Then $sType &= "*"
	$vReturn = _RTReadProcessMemory(-1, $pBuffer, 0, $iBytesToRead, $sType)
	Return SetError(@error, @extended, $vReturn)
EndFunc	;==>_RTReadBytes

Func _RTWriteBytes($pBuffer, $vData, $sType = "dword", $iBytesToWrite = 4)
	Local $fResult

	If ($sType <> "str") And ($sType <> "wstr") Then $sType &= "*"

	$fResult = _RTWriteProcessMemory(-1, $pBuffer, $vData, $iBytesToWrite, $sType)
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_RTWriteBytes

Func _RTLongPtrToBytes($iLongPtr)
	Return Hex(Binary($iLongPtr))
EndFunc	;==>_RTLongPtrToBytes

Func _RTUlongToBytes($iUlong)
	Return _RTLongPtrToBytes(Ptr($iUlong))
EndFunc	;==>_RTUlongToBytes

Func _RTVirtualAllocEx($hProcess, $iSize, $iProtect = 0x40, $iAllocType = $RT_MEMCOMMIT, $pBaseAddress = 0)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "VirtualAllocEx", "handle", $hProcess, _
			"ptr", $pBaseAddress, "dword", $iSize, "dword", $iAllocType, "dword", $iProtect)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTVirtualAllocEx

Func _RTVirtualFreeEx($hProcess, $pBaseAddress, $iSize, $iFlags = $RT_MEMDECOMMIT)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualFreeEx", "handle", $hProcess, _
			"ptr", $pBaseAddress, "dword", $iSize, "dword", $iFlags)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTVirtualFreeEx

Func _RTVirtualAlloc($iSize, $iProtect = 0x40, $iAllocType = $RT_MEMCOMMIT, $pBaseAddress = 0)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "VirtualAlloc", "ptr", $pBaseAddress, _
			"dword", $iSize, "dword", $iAllocType, "dword", $iProtect)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTVirtualAlloc

Func _RTVirtualFree($pBaseAddress, $iSize, $iFlags = $RT_MEMDECOMMIT)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualFree", "ptr", $pBaseAddress, _
			"dword", $iSize, "dword", $iFlags)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTVirtualFree

Func _RTOpenProcess($iPid, $iDesiredAccess = 0x1F0FFF, $fInherit = 0)
	Local $iResult

	If ($iPid = -1) Or ($iPid = @AutoItPid) Then
		Return _RTCurrentProcess()
	EndIf

	$iPid = ProcessExists($iPid)
	If ($iPid = 0) Then Return SetError(2, 0, 0)

	$iResult = DllCall($hAu3ThreadDll, "handle", "OpenProcess", "dword", $iDesiredAccess, _
			"bool", $fInherit, "dword", $iPid)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTOpenProcess

Func _RTCreateThread($pStartAddress, $pParameter = 0, _
		$iFlags = 0, $pSecurAttr = 0, $iStackSize = 0)

	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "handle", "CreateThread", "ptr", $pSecurAttr, _
			"dword", $iStackSize, "ptr", $pStartAddress, "ptr", $pParameter, _
			"dword", $iFlags, "dword*", 0)
	Return SetError(_RTLastError(), $iResult[6], $iResult[0])
EndFunc	;==>_RTCreateThread

Func _RTOpenThread($iThreadId, $iDesiredAccess = 0x1F03FF, $fInherit = 0)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "handle", "OpenThread", "dword", $iDesiredAccess, _
			"bool", $fInherit, "dword", $iThreadId)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTOpenThread

Func _RTLastError()
	Local $iResult = DllCall($hAu3ThreadDll, "long", "GetLastError")
	Return $iResult[0]
EndFunc	;==>_RTLastError

Func _RTCurrentThread()
	Local $iResult = DllCall($hAu3ThreadDll, "handle", "GetCurrentThread")
	Return $iResult[0]
EndFunc	;==>_RTCurrentThread

Func _RTCurrentThreadId()
	Local $iResult = DllCall("Kernel32.dll", "dword", "GetCurrentThreadId")
	Return $iResult[0]
EndFunc	;==>_RTCurrentThreadId

Func _RTCloseHandle($hHandle)
	Local $iResult = DllCall($hAu3ThreadDll, "bool", "CloseHandle", "handle", $hHandle)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTCloseHandle

Func _RTCloseHandles($aHandle, $iStart = 0, $iEnd = -1)
	If UBound($aHandle, 0) <> 1 Then Return SetError(87, 0, 0)

	If $iStart < 0 Then $iStart = 0
	If $iEnd = -1 Then $iEnd = UBound($aHandle) - 1
	If $iStart >= $iEnd Then Return SetError(87, 0, 0)

	Local $fResult = True
	For $i = $iStart To $iEnd
		$fResult = $fResult And _RTCloseHandle($aHandle[$i])
	Next
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_RTCloseHandles

Func _RTCurrentProcess()
	Local $iResult = DllCall($hAu3ThreadDll, "handle", "GetCurrentProcess")
	Return $iResult[0]
EndFunc	;==>_RTCurrentProcess


Const $RT_DUP_CLOSE_SOURCE = 1
Const $RT_DUP_SAME_ACCESS = 2

Func _RTDuplicateHandle($hSrcProcess, $hSrcHandle, $hTgtProcess, _
		$iFlags = $RT_DUP_SAME_ACCESS, $iDesiredAccess = 0, $fInherit = 0)

	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "DuplicateHandle", "handle", $hSrcProcess, _
			"handle", $hSrcHandle, "handle", $hTgtProcess, "handle*", 0, _
			"dword", $iDesiredAccess, "bool", $fInherit, "dword", $iFlags)
	Return SetError(_RTLastError(), 0, $iResult[4])
EndFunc	;==>_RTDuplicateHandle

Func _RTTerminateThread($hThread, $iExitCode = 0)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "TerminateThread", "handle", $hThread, "dword", $iExitCode)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTTerminateThread


Func _RTResumeThread($hThread)
	Local $iResult
	$iResult =  DllCall($hAu3ThreadDll, "bool", "ResumeThread", "handle", $hThread)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTResumeThread

Func _RTSuspendThread($hThread)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "int", "SuspendThread", "handle", $hThread)
	Return SetError(_RTLastError(), $iResult[0], $iResult[0] <> -1)
EndFunc	;==>_RTSuspendThread

Func _RTWaitForObject($hObject, $iTimeout = -1)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "dword", "WaitForSingleObject", _
			"handle", $hObject, "dword", $iTimeout)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTWaitForObject

Func _RTFillBytes($pDestination, $iLength, $iBytes = 0x00)
	DllCall("Ntdll.dll", "none", "RtlFillMemory", "ptr", $pDestination, _
			"dword", $iLength, "ubyte", $iBytes)
EndFunc	;==>_RTFillBytes

Const $RT_PROCESS_HEAP = _RTProcessHeap()

Func _RTHeapFree($pBuffer)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "HeapFree", "handle", $RT_PROCESS_HEAP, _
			"dword", 0, "ptr", $pBuffer)
	Return $iResult[0]
EndFunc	;==>_RTHeapFree

Func _RTHeapSize($pBuffer)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "long", "HeapSize", "handle", $RT_PROCESS_HEAP, _
			"dword", 0, "ptr", $pBuffer)
	Return $iResult[0]
EndFunc	;==>_RTHeapSize

Func _RTProcessHeap()
	Local $iResult = DllCall($hAu3ThreadDll, "handle", "GetProcessHeap")
	Return $iResult[0]
EndFunc	;==>_RTProcessHeap

Func _RTHeapAlloc($iBytesToAlloc, $iFlags = 8)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "HeapAlloc", "handle", $RT_PROCESS_HEAP, _
			"dword", $iFlags, "dword", $iBytesToAlloc)
	Return SetExtended($iBytesToAlloc, $iResult[0])
EndFunc	;==>_RTHeapAlloc

Func _RTHeapReAlloc($pBaseAddress, $iSizeToRealloc, $iFlags = 24)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "ptr", "HeapReAlloc", "handle", $RT_PROCESS_HEAP, _
			"dword", $iFlags, "ptr", $pBaseAddress, "dword", $iSizeToRealloc)
	Return $iResult[0]
EndFunc	;==>_RTHeapReAlloc


Func _RTVirtualProtectEx($hProcess, $pBaseAddress, $iSize, $iNewProtect = 0x40)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualProtectEx", "handle", $hProcess, _
			"ptr", $pBaseAddress, "dword", $iSize, "dword", $iNewProtect, _
			"dword*", 0)
	Return SetError(_RTLastError(), $iResult[5], $iResult[0])
EndFunc	;==>_RTVirtualProtectEx

Func _RTVirtualProtect($pBaseAddress, $iSize, $iNewProtect = 0x40)
	Local $iResult
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualProtect", "ptr", $pBaseAddress, _
			"dword", $iSize, "dword", $iNewProtect, "dword*", 0)
	Return SetError(_RTLastError(), $iResult[4], $iResult[0])
EndFunc	;==>_RTVirtualProtect

Const $tagRT_MEMORY_BASIC_INFO = "ptr BaseAddress;ptr AllocBase;dword AllocProtect;dword RegionSize;dword State;dword Protect;dword Type"


Func _RTVirtualQueryEx($hProcess, $pBaseAddress)
	Local $pBuffer, $iResult

	$pBuffer = _RTHeapAlloc(28)
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualQueryEx", "handle", $hProcess, _
			"ptr", $pBaseAddress, "ptr", $pBuffer, "dword", 28)
	If ($iResult[0]) Then
		Return SetError(_RTLastError(), 0, $pBuffer)
	Else
		Return SetError(_RTLastError(), _RTHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_RTVirtualQueryEx

Func _RTVirtualQuery($pBaseAddress)
	Local $pBuffer, $iResult

	$pBuffer = _RTHeapAlloc(28)
	$iResult = DllCall($hAu3ThreadDll, "bool", "VirtualQuery", _
			"ptr", $pBaseAddress, "ptr", $pBuffer, "dword", 28)
	If ($iResult[0]) Then
		Return SetError(_RTLastError(), 0, $pBuffer)
	Else
		Return SetError(_RTLastError(), _RTHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_RTVirtualQuery

Const $RT_VARTYPE_BOOL = 0
Const $RT_VARTYPE_BYTES = 1
Const $RT_VARTYPE_WORD = 2
Const $RT_VARTYPE_DWORD = 3
Const $RT_VARTYPE_INT64 = 4

Const $RT_VARTYPE_STRING = 0x1000
Const $RT_VARTYPE_ANSI = 0x1005
Const $RT_VARTYPE_UNICODE = 0x1006


Func _RtSizeof($vVariable, $iType = $RT_VARTYPE_BOOL)
	Switch $iType
	Case $RT_VARTYPE_BOOL, $RT_VARTYPE_DWORD
		Return 4
	Case $RT_VARTYPE_BYTES
		If Not StringRegExp($vVariable, "(?i)[^0-9A-F]") Then
			If (StringLeft($vVariable, 2) = "0x") Then
				Return BinaryLen($vVariable)
			Else
				Return StringLen($vVariable)
			EndIf
		Else
			Local $iResult = DllCall("Kernel32.dll", "int", "lstrlenA", "str", $vVariable)
			Return $iResult[0]
		EndIf
	Case $RT_VARTYPE_WORD
		Return 2
	Case $RT_VARTYPE_INT64
		Return 8
	Case $RT_VARTYPE_ANSI
		Local $iResult = DllCall("Kernel32.dll", "int", "lstrlenA", "str", $vVariable)
		Return $iResult[0]
	Case $RT_VARTYPE_UNICODE
		Local $iResult = DllCall("Kernel32.dll", "int", "lstrlenW", "wstr", $vVariable)
		Return $iResult[0]
	Case Else
		Return -1
	EndSwitch
EndFunc	;==>_RtSizeof

Func _RtStringToBytesW($sText)
	Local $tText, $tBinary, $pText, $iLength, $bBinary

	$iLength = StringLen($sText) + 1
	$tText = DllStructCreate("wchar Text[" & $iLength & "]")
	$pText = DllStructGetPtr($tText)
	$tBinary = DllStructCreate("ubyte Binary[" & ($iLength * 2) & "]", $pText)
	DllStructSetData($tText, "Text", $sText)

	$bBinary = Hex(DllStructGetData($tBinary, 1))
	$tBinary = 0
	$tText = 0
	Return $bBinary
EndFunc	;==>_RtStringToBytesW


Func _RTQueryObject($hObject, $iInfoClass, $pBuffer, $iSizeofBuffer)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "dword", "NtQueryObject", "handle", $hObject, _
			"dword", $iInfoClass, "ptr", $pBuffer, "dword", $iSizeofBuffer, _
			"dword*", 0)
	Return SetError(($iResult[0]), $iResult[5], $iResult[0] = 0)
EndFunc	;==>_RTQueryObject

Func _RTCallWindowProc($pCallAddr, $sReturn = "int", $hParam1 = 0, $iParam2 = 0, $wParam3 = 0, $lParam4 = 0)
	Local $iResult
	$iResult = DllCall("User32.dll", $sReturn, "CallWindowProc", "ptr", $pCallAddr, _
			"hWnd", $hParam1, "uint", $iParam2, "wparam", $wParam3, _
			"lparam", $lParam4)
	If (@error) Then Return SetError(87, 0, "")
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTCallWindowProc


Const $tagRT_IO_COUNTERS = "int64 ReadOpr;int64 WriteOpr;int64 OtherOpr;int64 ReadTrans;int64 WriteTrans;int64 OtherTrans;"
Const $tagRT_VM_COUNTERS = "ulong PeakVirtualSize;ulong VirtualSize;ulong PageFaultCount;ulong PeakWorkingSetSize;ulong WorkingSetSize;ulong QuotaPeakPagedPoolUsage;ulong QuotaPagedPoolUsage;ulong QuotaPeakNonPagedPoolUsage;ulong QuotaNonPagedPoolUsage;ulong PagefileUsage;ulong PeakPagefileUsage;"

Const $tagRT_SYSTHREAD = "int64 KernelTime;int64 UserTime;int64 CreationTime;ulong WaitTime;ptr StartAddress;ulong ProcessId;ulong ThreadId;ulong Priority;long BasePriority;ulong ContextSwitchCount;ulong State;ulong WaitReason"

Const $tagRT_SYSPROCESS_INFO = "ulong NextEntryOffset;ulong NumberofThreads;int64 Reserved[3];int64 CreationTime;int64 UserTime;int64 KernelTime;ubyte ImageName[8];ulong BasePriority;ulong ProcessId;ulong InheritedFromProcessId;ulong HandleCount;ulong Reserved2[2];ulong PrivatePageCount;" & $tagRT_VM_COUNTERS & $tagRT_IO_COUNTERS

Func _RTEnumerateThreads($iProcessId = 0)
	Local $pBuffer, $iOffset, $pThreads, $pBuffer1, $aResult[1][8] = [[0]]

	If (@NumParams) Then
		If $iProcessId = -1 Then $iProcessId = @AutoItPid
		$iProcessId = ProcessExists($iProcessId)
		If Not $iProcessId Then Return SetError(2, 0, $aResult)
	EndIf

	_RTQuerySystemInformation(5, 0, 0)
	If (@Extended = 0) Then Return SetError(@error, 0, $aResult)

	$pBuffer = _RTHeapAlloc(@Extended)
	If _RTQuerySystemInformation(5, $pBuffer, @Extended) = False Then
		Return SetError(@error, _RTHeapFree($pBuffer), $aResult)
	EndIf
	$pBuffer1 = $pBuffer

	If @NumParams Then
		While 1
			$iOffset = _RTReadBytes($pBuffer)

			If _RTReadBytes($pBuffer + 68) <> $iProcessId Then
				If ($iOffset) Then
					$pBuffer += $iOffset
					ContinueLoop
				Else
					ExitLoop
				EndIf
			EndIf

			$aResult[0][0] = _RTReadBytes($pBuffer + 4)
			$pThreads = $pBuffer + 184

			Redim $aResult[$aResult[0][0] + 1][8]

			For $i = 1 To $aResult[0][0]
				$aResult[$i][0] = _RTReadBytes($pThreads + ($i - 1) * 64 + 36); ThreadId
				$aResult[$i][1] = $iProcessId	; ProcessId
				$aResult[$i][2] = _RTReadBytes($pThreads + ($i - 1) * 64 + 40); Priority
				$aResult[$i][3] = _RTReadBytes($pThreads + ($i - 1) * 64 + 44); BPriority
				$aResult[$i][4] = _RTReadBytes($pThreads + ($i - 1) * 64 + 28, "ptr")
				$aResult[$i][5] = _RTReadBytes($pThreads + ($i - 1) * 64 + 48); CSwitch
				$aResult[$i][6] = _RTReadBytes($pThreads + ($i - 1) * 64 + 52); State
				$aResult[$i][7] = _RTReadBytes($pThreads + ($i - 1) * 64 + 56); Reason
			Next
			ExitLoop
		WEnd
	Else
		Local $iPrevIndex = 1
		While 1
			$iOffset = _RTReadBytes($pBuffer)

			$aResult[0][0] += _RTReadBytes($pBuffer + 4)
			$pThreads = $pBuffer + 184

			Redim $aResult[$aResult[0][0] + 1][8]

			For $i = $iPrevIndex To $aResult[0][0]
				$aResult[$i][0] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 36)
				$aResult[$i][1] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 32)
				$aResult[$i][2] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 40)
				$aResult[$i][3] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 44)
				$aResult[$i][4] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 28, "ptr")
				$aResult[$i][5] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 48)
				$aResult[$i][6] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 52)
				$aResult[$i][7] = _RTReadBytes($pThreads + ($i - $iPrevIndex) * 64 + 56)
			Next
			If ($iOffset = 0) Then ExitLoop

			$pBuffer += $iOffset
			$iPrevIndex = $aResult[0][0] + 1
		WEnd

	EndIf
	Return SetError(0, _RTHeapFree($pBuffer1), $aResult)
EndFunc	;==>_RTEnumerateThreads

Func _RTQuerySystemInformation($iInfoClass, $pBuffer, $iSizeofBuffer)
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "dword", "NtQuerySystemInformation", "int", $iInfoClass, _
			"ptr", $pBuffer, "dword", $iSizeofBuffer, "dword*", 0)
	Return SetError($iResult[0], $iResult[4], $iResult[0] = 0)
EndFunc	;==>_RTQuerySystemInformation

Const $tagSECURITY_QUALITY_OF_SERVICE = "dword Length;dword ImpersonationLevel;boolean ContextTrackingMode;boolean EffectiveOnly"

Func _RtImpersonateThread($hThread, $hThreadToImpersonate, $pSecurService)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "dword", "NtImpersonateThread", "handle", $hThread, _
			"handle", $hThreadToImpersonate, "ptr", $pSecurService)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_RtImpersonateThread

Const $tagRT_CLIENT_ID = "dword ProcessId;dword ThreadId"
Const $tagRT_NT_TIB = "ptr ExpectionList;ptr StackBase;ptr StackLimit;ptr SubSystemTib;ulong Version;ptr ArbitraryUserPointer;ptr Self"
Const $tagRT_THREAD_BASIC_INFO = "dword ExitStatus;ptr TebBaseAddress;ulong ProcessId;ulong ThreadId;ulong AffinityMask;ulong Priority;ulong BasePriority"

Func _RTQueryThreadInformation($hThread, $iInfoClass, $pBuffer, $iSizeofBuffer)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "dword", "NtQueryInformationThread", "handle", $hThread, _
			"ulong", $iInfoClass, "ptr", $pBuffer, "dword", $iSizeofBuffer, "ulong*", 0)
	Return SetError($iResult[0], $iResult[5], $iResult[0] = 0)
EndFunc	;==>_RTQueryThreadInformation

Func _RTQueryProcessInformation($hProcess, $iInfoClass, $pBuffer, $iSizeofBuffer)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "dword", "NtQueryInformationProcess", "handle", $hProcess, _
			"ulong", $iInfoClass, "ptr", $pBuffer, "dword", $iSizeofBuffer, "ulong*", 0)
	Return SetError($iResult[0], $iResult[5], $iResult[0] = 0)
EndFunc	;==>_RTQueryProcessInformation

Func _RTQueryThreadStartAddress($hThread)
	Local $pBuffer = _RTHeapAlloc(4), $pStartAddr

	If _RTQueryThreadInformation($hThread, 9, $pBuffer, 4) Then
		$pStartAddr = _RTReadBytes($pBuffer, "ptr", 4)
		Return SetExtended(_RTHeapFree($pBuffer), $pStartAddr)
	Else
		Return SetError(@error, _RTHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_RTQueryThreadStartAddress

Func _RTQueryThreadBasicInfo($hThread)
	Local $pBuffer = _RTHeapAlloc(28)

	If _RTQueryThreadInformation($hThread, 0, $pBuffer, 28) Then
		Return $pBuffer
	Else
		Return SetError(@error, _RTHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_RTQueryThreadBasicInfo

Func _RTEmptyWorkingSet()
	Local $pEmptyWorkingSet, $pSleep, $pStartAddr, $bCode, $hThread

	$pEmptyWorkingSet = _RTGetProcAddress("psapi.dll", "EmptyWorkingSet")
	$pSleep = _RTGetProcAddress("Kernel32.dll", "Sleep")
	If ($pEmptyWorkingSet And $pSleep) = 0 Then Return 0

	$pStartAddr = _RTVirtualAlloc(64)
	$bCode = "0x6AFFB8" & _RTLongPtrToBytes($pEmptyWorkingSet) & "FFD0" & _
		"6800010000B8" & _RTLongPtrToBytes($pSleep) & "FFD0EB" & Hex(-23, 2)
	_RTWriteBytes($pStartAddr, $bCode, "binary", BinaryLen($bCode))
	Return _RTCreateThread($pStartAddr)
EndFunc	;==>_RTEmptyWorkingSet

Func _RTLength($sStructure)
	Local $tBuffer = DllStructCreate($sStructure)
	Local $iSize = DllStructGetSize($tBuffer)
	$tBuffer = 0
	Return $iSize
EndFunc	;==>_RTLength

Func _RTSetThreadInformation($hThread, $iInfoClass, $vBuffer, $iSizeofBuffer, $sBufferType = "ptr")
	Local $iResult

	$iResult = DllCall("Ntdll.dll", "dword", "NtSetInformationThread", "handle", $hThread, _
			"dword", $iInfoClass, $sBufferType, $vBuffer, "ulong", $iSizeofBuffer)
	If (@error) Then
		Return SetError(0xC000000D, 0, False)
	Else
		Return SetError($iResult[0], 0, $iResult[0] = 0)
	EndIf
EndFunc	;==>_RTSetThreadInformation

Func _TerminateProcessTree($iTopNodePid, $iReserved = 0)
	If Not ProcessExists($iTopNodePid) Then Return 0

	If ($iReserved) Then
		Local $aProcess = Eval($iReserved & $iTopNodePid)
		If ($aProcess) Then
			$aProcess = StringSplit($aProcess, ",")
			For $i = 1 To $aProcess[0] - 1
				_TerminateProcessTree($aProcess[$i], $iReserved)
			Next
		EndIf
		Return ProcessClose($iTopNodePid)
	Else
		Local $pBuffer, $pBuffer1, $iSizeofBuffer
		Local $iOffset, $iPid, $iParentId, $sRandom

		_RTQuerySystemInformation(5, 0, 0)
		$iSizeofBuffer = @Extended
		$pBuffer = _RTHeapAlloc(@Extended)
		_RTQuerySystemInformation(5, $pBuffer, $iSizeofBuffer)
		$pBuffer1 = $pBuffer
		$sRandom = Random(10000, 10000000) & Random(10000, 10000000) & ","

		While 1
			$iOffset = _RTReadBytes($pBuffer)
			$iPid = _RTReadBytes($pBuffer + 68)
			$iParentId = _RTReadBytes($pBuffer + 72)

			Assign($sRandom & $iParentId, Eval($sRandom & $iParentId) & $iPid & ",", 2)
			If ($iOffset) Then
				$pBuffer += $iOffset
			Else
				ExitLoop
			EndIf
		WEnd
		_RTHeapFree($pBuffer1)
		Return _TerminateProcessTree($iTopNodePid, $sRandom)
	EndIf
EndFunc	;==>_TerminateProcessTree

Const $tagRT_THREADCONTEXT = "dword ContextFlags;dword Dr0;dword Dr1;dword Dr2;dword Dr3;dword Dr6;" & _
		"dword Dr7;dword ControlWord;dword StatusWord;dword TagWord;dword ErrorOffset;" & _
		"dword ErrorSelector;dword DataOffset;dword DataSelector;byte RegisterArea[80];" & _
		"dword Cr0NpxState;dword SegGs;dword SegFs;dword SegEs;dword SegDs;dword Edi;" & _
		"dword Esi;dword Ebx;dword Edx;dword Ecx;dword Eax;dword Ebp;dword Eip;dword SegCs;" & _
		"dword EFlags;ptr Esp;dword SegS"

Func _RTGetThreadContext($hThread)
	Local $iResult, $pBuffer = _RTHeapAlloc(204)

	_RTWriteBytes($pBuffer, 0x10007, "dword", 4)

	$iResult = DllCall("Ntdll.dll", "dword", "NtGetContextThread", _
			"handle", $hThread, "ptr", $pBuffer)
	If ($iResult[0] = 0) Then
		Return $pBuffer
	Else
		Return SetError($iResult[0], _RTHeapFree($pBuffer), 0)
	EndIf
EndFunc	;==>_RTGetThreadContext

Func _RTSetThreadContext($hThread, $pContext)
	Local $iResult
	$iResult = DllCall("Ntdll.dll", "dword", "NtSetContextThread", _
			"handle", $hThread, "ptr", $pContext)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_RTSetThreadContext

Func _RTInitBufferW($vBuffer)
	Local $vResult = _RTInitBufferExW($vBuffer, -1)
	Return SetError(@error, @extended, $vResult)
EndFunc	;==>_RTInitBufferW

Func _RTFreeBufferExW($pBuffer, $hProcess = -1)
	Local $pMemory, $iLength, $fResult

	$pMemory = _RTVirtualQueryEx($hProcess, $pBuffer)
	If ($pMemory = 0) Then Return SetError(@error, 0, 0)

	$iLength = _RTReadBytes($pMemory + 12)
	$fResult = _RTVirtualFreeEx($hProcess, $pBuffer, $iLength)
	Return SetError(@error, _RTHeapFree($pMemory), $fResult)
EndFunc	;==>_RTFreeBufferExW

Func _RTInitBufferExW($vBuffer, $hProcess = -1)
	If IsPtr($vBuffer) Then
		Local $sData, $iLen, $pData

		$iLen = _RTReadProcessMemory($hProcess, $vBuffer + 2, 0, 2, "ushort*")
		$pData = _RTReadProcessMemory($hProcess, $vBuffer + 4, 0, 4, "ptr*")
		$sData = _RTReadProcessMemory($hProcess, $pData, "", $iLen, "wstr")

		Return SetError(@error, @extended, $sData)
	Else
		Local $tBuffer, $iLen, $pAddress

		$vBuffer = String($vBuffer)
		$iLen = StringLen($vBuffer) * 2
		$pAddress = _RTVirtualAllocEx($hProcess, $iLen + 10)

		$tBuffer = DllStructCreate("ushort;ushort;ptr;wchar[" & ($iLen / 2 + 1) & "]")
		DllStructSetData($tBuffer, 1, $iLen)
		DllStructSetData($tBuffer, 2, $iLen + 2)
		DllStructSetData($tBuffer, 3, $pAddress + 8)
		DllStructSetData($tBuffer, 4, $vBuffer)

		_RTWriteProcessMemory($hProcess, $pAddress, DllStructGetPtr($tBuffer), $iLen + 10)
		Return SetError(@error, @extended, $pAddress)
	EndIf
Endfunc	;==>_RTInitBufferExW

Func _RTInitializeBufferW($vBuffer, $iReserved = 0)
	#forceref $iReserved

	If VarGetType($vBuffer) = "Ptr" Then
		Local $iBuffer, $tBuffer, $pBuffer, $tData

		$tBuffer = DllStructCreate("ushort;ushort;ptr", $vBuffer)
		$iBuffer = DllStructGetData($tBuffer, 2)
		$pBuffer = DllStructGetData($tBuffer, 3)
		$tData = DllStructCreate("wchar[" & $iBuffer / 2 & "]", $pBuffer)
		$sReturn = DllStructGetData($tData, 1)
		$tBuffer = 0
		$tData = 0
		Return $sReturn
	Else
		Local $tBuffer, $pBuffer, $iBuffer

		$vBuffer = String($vBuffer)
		$iBuffer = StringLen($vBuffer)
		$pBuffer = _RTHeapAlloc(10 + $iBuffer * 2)
		$tBuffer = DllStructCreate("ushort;ushort;ptr;wchar[" & $iBuffer + 1 & "]", $pBuffer)
		DllStructSetData($tBuffer, 1, $iBuffer * 2)
		DllStructSetData($tBuffer, 2, $iBuffer * 2 + 2)
		DllStructSetData($tBuffer, 3, $pBuffer + 8)
		DllStructSetData($tBuffer, 4, $vBuffer)
		$tBuffer = 0
		Return $pBuffer
	EndIf
EndFunc	;==>_RTInitializeBufferW

Const $tagRT_SYSHANDLE_INFO = "ulong ProcessId;ubyte ObjType;ubyte Flags;ushort Handle;ptr Object;dword DesiredAccess"

Func _RTEnumerateHandles($iProcessId = 0)
	Local $pBuffer, $iNumberofHandles, $tBuffer, $pBuffer1, $iBuffer, $aHandle[1][6]

	$pBuffer = _RTHeapAlloc(20)
	_RTQuerySystemInformation(16, $pBuffer, 20)
	If (@Extended = 0) Then
		Return SetError(@error, _RTHeapFree($pBuffer), $aHandle)
	EndIf
	$iBuffer = @Extended
	_RTHeapFree($pBuffer)
	$pBuffer = _RTHeapAlloc($iBuffer)
	$pBuffer1 = $pBuffer

	_RTQuerySystemInformation(16, $pBuffer, $iBuffer)

	$iNumberofHandles = _RTReadBytes($pBuffer, "ulong", 4)
	$pBuffer += 4

	If (@NumParams) Then
		For $i = 1 To $iNumberofHandles
			$tBuffer = DllStructCreate($tagRT_SYSHANDLE_INFO, $pBuffer)
			$pBuffer += 16
			If DllStructGetData($tBuffer, "ProcessId") <> $iProcessId Then
				$tBuffer = 0
				ContinueLoop
			EndIf

			$aHandle[0][0] += 1
			Redim $aHandle[$aHandle[0][0] + 1][6]
			$aHandle[$aHandle[0][0]][0] = $iProcessId
			$aHandle[$aHandle[0][0]][1] = DllStructGetData($tBuffer, "ObjType")
			$aHandle[$aHandle[0][0]][2] = DllStructGetData($tBuffer, "Flags")
			$aHandle[$aHandle[0][0]][3] = DllStructGetData($tBuffer, "Handle")
			$aHandle[$aHandle[0][0]][4] = DllStructGetData($tBuffer, "Object")
			$aHandle[$aHandle[0][0]][5] = DllStructGetData($tBuffer, "DesiredAccess")
			$tBuffer = 0
		Next
	Else
		If $iProcessId = -1 Then $iProcessId = @AutoItPid
		$aHandle[0][0] = $iNumberofHandles
		Redim $aHandle[$iNumberofHandles + 1][6]
		For $i = 1 To $iNumberofHandles
			$tBuffer = DllStructCreate($tagRT_SYSHANDLE_INFO, $pBuffer)
			$aHandle[$i][0] = DllStructGetData($tBuffer, "ProcessId")
			$aHandle[$i][1] = DllStructGetData($tBuffer, "ObjType")
			$aHandle[$i][2] = DllStructGetData($tBuffer, "Flags")
			$aHandle[$i][3] = DllStructGetData($tBuffer, "Handle")
			$aHandle[$i][4] = DllStructGetData($tBuffer, "Object")
			$aHandle[$i][5] = DllStructGetData($tBuffer, "DesiredAccess")

			$tBuffer = 0
			$pBuffer += 16
		Next
	EndIf
	_RTHeapFree($pBuffer1)
	Return $aHandle
EndFunc	;==>_RTEnumerateHandles

Func _RTWaitForMultiObjects($aHandles, $fWaitAll = 1, $iMilliseconds = -1)
	If Not IsArray($aHandles) Then Return SetError(87, 1, 0)
	If UBound($aHandles, 0) <> 1 Then Return SetError(87, 2, 0)

	Local $iUBound, $tHandle, $pHandle, $fResult

	$iUBound = UBound($aHandles)
	$pHandle = _RTHeapAlloc(4 * $iUBound)
	$tHandle = DllStructCreate("handle Handles[" & $iUBound & "]", $pHandle)
;	$pHandle = DllStructGetPtr($tHandle)

	For $i = 0 To $iUBound - 1
		DllStructSetData($tHandle, "Handles", $aHandles[$i], $i + 1)
	Next

	$fResult = _RTWaitForMultiObjectsEx($pHandle, $iUBound, $fWaitAll, $iMilliseconds)
	Return SetError(@error, 3, $fResult)
EndFunc	;==>_RTWaitForMultiObjects

Func _RTWaitForMultiObjectsEx($pHandles, $iCount, $fWaitAll = 1, $iMilliseconds = -1)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "int", "WaitForMultipleObjects", "dword", $iCount, _
			"ptr", $pHandles, "bool", $fWaitAll, "dword", $iMilliseconds)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTWaitForMultiObjectsEx

Func _RTGetProcessThreadId($iProcessId = @AutoItPid)
	Local $aThread = _RTEnumerateThreads($iProcessId)
	If ($aThread[0]) Then
		Return $aThread[1]
	Else
		Return SetError(@error, @extended, 0)
	EndIf

	Return SetError(@error, @extended, $aThread[1])
EndFunc	;==>_RTGetProcessThreadId

Func _RTGetThreadProcessId($vThread)
	Local $pBuffer, $iPid, $hThread = $vThread

	If VarGetType($vThread) = "Int32" Then
		$hThread = _RTOpenThread($vThread, 0x40)
		If ($hThread = 0) Then Return SetError(@error, 0, 0)
	EndIf

	$pBuffer = _RTQueryThreadBasicInfo($hThread)
	If ($pBuffer = 0) Then
		Local $iError = @error
		If VarGetType($vThread) = "Int32" Then
			_RTCloseHandle($hThread)
		EndIf
		Return SetError($iError, 0, 0)
	EndIf

	$iPid = _RTReadBytes($pBuffer + 8)
	If VarGetType($vThread) = "Int32" Then
		_RTCloseHandle($hThread)
	EndIf

	Return SetError(0, _RTHeapFree($pBuffer), $iPid)
EndFunc	;==>_RTGetThreadProcessId

Func _RTTlsAlloc()
	Local $iResult = DllCall("Kernel32.dll", "dword", "TlsAlloc")
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTTlsAlloc

Func _RTTlsGetValue($iIndex, $sRetType = "ptr")
	Local $iResult
	$iResult = DllCall("Kernel32.dll", $sRetType, "TlsGetValue", "dword", $iIndex)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTTlsGetValue

Func _RTTlsSetValue($iIndex, $vValue)
	Local $iResult

	$iResult = DllCall("Kernel32.dll", "bool", "TlsSetValue", "dword", $iIndex, _
			"dword", $vValue)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTTlsSetValue

Func _RTTlsFree($iIndex)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "bool", "TlsFree", "dword", $iIndex)
	Return SetError(_RTLastError(), 0, $iResult[0])
EndFunc	;==>_RTTlsFree

Func _RTInject($pStartAddr, $bBinaryCode)
	Local $fResult
	$fResult = _RTWriteBytes($pStartAddr, $bBinaryCode, "binary", BinaryLen($bBinaryCode))
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_RTInject

Func _RTInjectEx($hProcess, $pStartAddr, $bBinaryCode)
	Local $fResult
	$fResult = _RTWriteProcessMemory($hProcess, $pStartAddr, $bBinaryCode, BinaryLen($bBinaryCode), "binary")
	Return SetError(@error, @extended, $fResult)
EndFunc	;==>_RTInjectEx

Func _RTRemoteProcedure($hThread, $pProcedure)
	Local $pContext, $tContext

	If _RTSuspendThread($hThread) = 0 Then
		Return SetError(@error, 0, 0)
	EndIf
	$pContext = _RTGetThreadContext($hThread)
	If ($pContext = 0) Then
		Return SetError(@error, _RTResumeThread($hThread), 0)
	EndIf

	$tContext = DllStructCreate($tagRT_THREADCONTEXT, $pContext)
	DllStructSetData($tContext, "Eip", $pProcedure)

	If _RTSetThreadContext($hThread, $pContext) = 0 Then
		Return SetError(@error, _RTResumeThread($hThread), _RTHeapFree($pContext) * 0)
	EndIf

	Return SetError(@error, _RTHeapFree($pContext), _RTResumeThread($hThread))
EndFunc	;==>_RTRemoteProcedure




