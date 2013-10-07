

#Include <WinAPIEx.au3>
$hToken = _WinAPI_OpenProcessToken(0x000F01FF);提权，如果不提权可以读取到就可以注释掉
Local $a
ConsoleWrite(_WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, 2,$a) & @CRLF);同上

$pid = ProcessExists('qq.exe')
;~ ConsoleWrite('UnLoadDll:' & _UnloadDll($pid,@DesktopDir & '\bz.dll') & @CRLF)
;~ ConsoleWrite($pid  & @CRLF)
;~ $ret = InDll($pid ,@DesktopDir & '\bz.dll')
$ret = InDll($pid ,'TSET.dll')
If $ret = 1 Then
	MsgBox(0,'','注入成功!')
Else
	MsgBox(0,'','注入失败！')
EndIf

;~ _WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, 2,$a);提权
_WinAPI_CloseHandle($hToken);提权

Func InDll($pid,$DllPath);进程PID，DLL路径						
	Local $hp,$DllLen,$addr,$ret,$n
	If FileExists($DllPath)=0 Then Return -1
	$r = DllCall("KERNEL32.DLL", "long", "OpenProcess", "long", 2035711,"long", 0, "long", $pid)	
	$hp=$r[0]
	If $r[0]=0 Then Return	-2
	$DllLen=LenB($DllPath)+1
	$r = DllCall("KERNEL32.DLL", "long", "VirtualAllocEx", "long", $hp,"ptr", 0, "long", $DllLen,"long",4096,"long",4)
	$addr=$r[0]
	$r= DllCall("KERNEL32.DLL", "long", "WriteProcessMemory", "handle", $hp,"ptr",$addr,"str",$DllPath,"ulong_ptr",$DllLen,"ulong_ptr*",0)
	If $r[0] Then
		$r=DllCall("KERNEL32.DLL", "long", "GetModuleHandle", "str","KERNEL32.DLL")
		$ret=$r[0]
		$r=DllCall("KERNEL32.DLL", "long", "GetProcAddress","LONG",$ret,"str","LoadLibraryA")
		$EntryPoint=$r[0]
		$r=DllCall("KERNEL32.DLL", "long", "CreateRemoteThread", "LONG",$hp,"long*",0,"long",0,"long",$EntryPoint,"long",$addr,"long",0,"ptr",0)	
		$ret=$r[0]
		If $ret Then
			$n=1
			$r=DllCall("KERNEL32.DLL", "long", "WaitForSingleObject","LONG",$ret,"long",4294967295)	
			$r=DllCall("KERNEL32.DLL", "long", "GetExitCodeThread","LONG",$ret,"long*",0)			
		EndIf
	EndIf
	If $addr Then $r=DllCall("KERNEL32.DLL", "long", "VirtualFreeEx", "LONG",$hp,"ptr",$addr,"long",0,"long",32768)
	If $ret Then $r=DllCall("KERNEL32.DLL", "handle", "CloseHandle","LONG",$ret)
	If $hp Then $r=DllCall("KERNEL32.DLL", "long", "CloseHandle","LONG",$hp)		
	Return $n	
EndFunc;DLL注入，XBS

Func LenB($c)
	Local $r=DllCall("KERNEL32.DLL", "long", "lstrlen","str",$c)
	If @error Then Return 0
	Return $r[0]
EndFunc  ;检测字符串所占用的字节数，XBS

Func _UnloadDll($iProcessID, $sModule)
        Local $aModule, $hModule, $pFreeLibrary, $hThread, $hProcess
        Local $hToken, $aPriv[1][2] = [[$SE_DEBUG_NAME, 2]], $iFlags

;~         $hToken = _WinAPI_OpenProcessToken(0x000F01FF,@AutoItPID);提权
;~ 		_WinAPI_AdjustTokenPrivileges($hToken,$SE_DEBUG_NAME,1);提权

        $hProcess = _WinAPI_OpenProcess(0x1F0FFF,0,$iProcessID)
;~ 		ConsoleWrite($hProcess & ' ' & VarGetType($hProcess) & @CRLF)
        If $hProcess < 1 Then Return SetError(@error, 0, 0)
        $hModule = _WinAPI_GetModuleHandle("Kernel32.dll")
        $pFreeLibrary = _WinAPI_GetProcAddress($hModule, "FreeLibrary")

        $aModule = _EnumProcessModules($hProcess)
;~ 		ConsoleWrite($aModule & @CRLF)
        For $i = 1 To $aModule[0][0]
                If $aModule[$i][1] <> $sModule Then ContinueLoop
                $hThread = _CreateRemoteThread($hProcess, 0, 0, $pFreeLibrary, $aModule[$i][0], 0)
                If @extended Then $iFlags = 1
                _WinAPI_CloseHandle($hThread)
			Next
			ConsoleWrite($iFlags & @CRLF)
        $aModule = _EnumProcessModules($hProcess)
        For $i = 1 To $aModule[0][0]
                If $aModule[$i][1] = $sModule Then $iFlags = 0
        Next
        Return SetError(0, _WinAPI_CloseHandle($hProcess), $iFlags)
EndFunc        ;==>_UnloadDll

Func _CreateRemoteThread($hProcess, $pThreadSecur, $iStackSize, $pStartAddr, $pParam, $iFlags)
	Local $iResult
	$iResult = DllCall("Kernel32.dll", "hWnd", "CreateRemoteThread", "hWnd", $hProcess, _
                        "ptr", $pThreadSecur, "dword", $iStackSize, "ptr", $pStartAddr, _
                        "ptr", $pParam, "dword", $iFlags, "dword*", 0)
	Return SetError(_WinAPI_GetLastError(), $iResult[7], $iResult[0])
EndFunc        ;==>_CreateRemoteThread
	
Func _EnumProcessModules($hProcess)
    Local $aReturn[1][2] = [[0,'']]
    Local $aCall,$tModulesStruct, $hPsapi = DllOpen("Psapi.dll")
    $tModulesStruct = DllStructCreate("hwnd [200]")
    Local $SIZEOFHWND = DllStructGetSize($tModulesStruct) / 200
	
	If Not IsHWnd($hProcess) And Not IsPtr($hProcess) Then $hProcess = _WinAPI_OpenProcess($hProcess,0x1F0FFF,0)  
	
    If Not $hProcess Then Return SetError(1, 0, -1)
	
    $aCall = DllCall($hPsapi, "int", "EnumProcessModules", "ptr", $hProcess, "ptr", DllStructGetPtr($tModulesStruct), "dword", DllStructGetSize($tModulesStruct), "dword*", "")
    If @error <> 0 Then Return SetError(1, 0, '')
    If $aCall[4] > DllStructGetSize($tModulesStruct) Then
        $tModulesStruct = DllStructCreate("hwnd [" & $aCall[4] / $SIZEOFHWND & "]")
        $aCall = DllCall($hPsapi, "int", "EnumProcessModules", "ptr", $hProcess, "ptr", DllStructGetPtr($tModulesStruct), "dword", $aCall[4], "dword*", "")
    EndIf
    $Size = $aCall[4] / $SIZEOFHWND
    ReDim $aReturn[$Size][2]
    $aReturn[0][0] = $Size - 1
    For $i = 1 To UBound($aReturn) - 1
		$aReturn[$i][0] = DllStructGetData($tModulesStruct, 1, $i + 1)
        $aCall = DllCall($hPsapi, "dword", "GetModuleFileNameExW", "ptr", $hProcess, "int",$aReturn[$i][0] , "wstr", "", "dword", 65536)
        If @error <> 0 Then Return SetError(1, 0, '')
        $aReturn[$i][1] = $aCall[3]
    Next
;~     DllCall("Kernel32.dll", "int", "CloseHandle", "int", $hProcess)
    DllClose($hPsapi)
    Return $aReturn
EndFunc