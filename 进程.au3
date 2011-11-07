#include <Array.au3>
#include <GuiListView.au3>
Opt("GUIOnEventMode", 1)
Global Const $GUI_DEFBUTTON = 512
Global Const $GUI_EVENT_CLOSE = -3
$GUI = GUICreate("AU3全API进程管理器", 640, 540)
GUISetOnEvent($GUI_EVENT_CLOSE, "main")

$menu1 = GUICtrlCreateMenu("文件(&F)")
$runitem = GUICtrlCreateMenuItem("新建任务(&N)", $menu1)
GUICtrlSetOnEvent($runitem, "main")
GUICtrlSetState($runitem, $GUI_DEFBUTTON)
GUICtrlCreateMenuItem("", $menu1)
$exititem = GUICtrlCreateMenuItem("退出程序(&X)", $menu1)
GUICtrlSetOnEvent($exititem, "main")
$menu2 = GUICtrlCreateMenu("帮助(&H)", -1, 1)
$aboutitem = GUICtrlCreateMenuItem("关于(&A)", $menu2)
GUICtrlSetOnEvent($aboutitem, "main")

$Process32_ListView = GUICtrlCreateListView("映像名称|PID|内存|创建时间|映像路径|命令行|父进程PID", 5, 5, 630, 495)
GUICtrlSetOnEvent($Process32_ListView, "main")
Dim $B_DESCENDING1[_GUICtrlListView_GetColumnCount($Process32_ListView)]
_GUICtrlListView_SetColumnWidth($Process32_ListView, 0, 120)
$ListView_menu = GUICtrlCreateContextMenu($Process32_ListView)
$refreshitem = GUICtrlCreateMenuItem("刷新列表", $ListView_menu)
GUICtrlSetOnEvent($refreshitem, "main")
$closeProcessitem = GUICtrlCreateMenuItem("结束进程", $ListView_menu)
GUICtrlSetOnEvent($closeProcessitem, "main")
GUICtrlCreateMenuItem("", $ListView_menu)
$moduleitem = GUICtrlCreateMenuItem("获取进程模块", $ListView_menu)
GUICtrlSetOnEvent($moduleitem, "main")
$threadsitem = GUICtrlCreateMenuItem("获取进程线程", $ListView_menu)
GUICtrlSetOnEvent($threadsitem, "main")
$childProcessitem = GUICtrlCreateMenuItem("获取进程子进程", $ListView_menu)
GUICtrlSetOnEvent($childProcessitem, "main")
GUICtrlCreateMenuItem("", $ListView_menu)
$openpathitem = GUICtrlCreateMenuItem("定位文件夹", $ListView_menu)
GUICtrlSetOnEvent($openpathitem, "main")

GUICtrlCreateLabel("AU3全API进程管理器 By Crossdoor", 0, 505, 400, 16, 0x100B)
$blogLabel = GUICtrlCreateLabel("http://crossdoor.cublog.cn/", 400, 505, 240, 16, 0x100B)
GUICtrlSetOnEvent(-1, "main")
GUICtrlSetFont(-1, 9, 400, 4)
GUICtrlSetColor(-1, 0x0000ff)
GUICtrlSetCursor(-1, 0)
$hSnapshot = _WinAPI_CreateToolhelp32Snapshot()
_Process32List($hSnapshot)
GUISetState()

While 1
	Sleep(100000)
WEnd

Func main()
	Switch @GUI_CtrlId
		Case $GUI_EVENT_CLOSE, $exititem
			Exit
		Case $refreshitem
			$hSnapshot = _WinAPI_CreateToolhelp32Snapshot()
			_Process32List($hSnapshot)			
		Case $runitem
			Send("#r")
		Case $aboutitem
			MsgBox(0, "关于", "AU3全API进程管理器" & @LF & "By Crossdoor" & @LF & "http://crossdoor.cublog.cn/")
		Case $blogLabel
			Run("rundll32.exe url.dll,FileProtocolHandler http://crossdoor.cublog.cn/")
		Case $closeProcessitem
			$index = _GUICtrlListView_GetSelectedIndices($Process32_ListView)
			If StringLen($index) Then
				$pid = _GUICtrlListView_GetItemText($Process32_ListView, Number($index), 1)
				If ProcessClose($pid) Then _GUICtrlListView_DeleteItemsSelected($Process32_ListView)
			EndIf
		Case $moduleitem
			$pid = _getlistviewdat()
			If $pid <> "" Then
				$Modules = _WinAPI_GetProcessLoadedModules(ProcessExists($pid))
				If Not @error Then _ArrayDisplay($Modules, "进程 " & _WinAPI_GetProcessName($pid) & " 加载的模块")
			EndIf
		Case $threadsitem
			$pid = _getlistviewdat()
			If $pid <> "" Then
				$threads = _WinAPI_EnumProcessThreads(ProcessExists($pid))
				If Not @error Then _ArrayDisplay($threads, "进程 " & _WinAPI_GetProcessName($pid) & " 下属的线程")				
			EndIf
		Case $childProcessitem
			$pid = _getlistviewdat()
			If $pid <> "" Then
				$childProcess = _WinAPI_EnumChildProcess(ProcessExists($pid))
				If Not @error Then _ArrayDisplay($childProcess, "进程 " & _WinAPI_GetProcessName($pid) & " 开启的子进程")				
			EndIf
		Case $openpathitem
			$path = _getlistviewdat(1)
			If $path <> '' Then ShellExecute(StringRegExpReplace($path, '\\[^\\]*$', ''))
		Case $Process32_ListView
			_GUICtrlListView_SimpleSort($Process32_ListView, $B_DESCENDING1, GUICtrlGetState($Process32_ListView))
	EndSwitch
EndFunc

Func _getlistviewdat($p = 0)
	Dim $dat
	$index = _GUICtrlListView_GetSelectedIndices($Process32_ListView)
	If StringLen($index) Then
		If $p = 0 Then 
			$dat = _GUICtrlListView_GetItemText($Process32_ListView, Number($index), 1)
			If Not ProcessExists(Number($dat)) Then
				_GUICtrlListView_DeleteItemsSelected($Process32_ListView)
				$dat = ""
			EndIf
		Else
			$dat = _GUICtrlListView_GetItemText($Process32_ListView, Number($index), 4)
		EndIf
	EndIf
	Return $dat
EndFunc

Func _WinAPI_CreateToolhelp32Snapshot()
	Local $TH32CS_SNAPPROCESS = 0x00000002, $TH32CS_SNAPTHREAD = 0x00000004, $TH32CS_SNAPMODULE = 0x00000008
	Local $aResult = DllCall("kernel32.dll", "LONG", "CreateToolhelp32Snapshot", "int", $TH32CS_SNAPPROCESS, "int", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc

Func _Process32List($hSnapshot)
	Local $tagPROCESSENTRY32 = DllStructCreate("dword dwsize;" & _
			"dword cntUsage;" & _
			"dword th32ProcessID;" & _
			"uint th32DefaultHeapID;" & _
			"dword th32ModuleID;" & _
			"dword cntThreads;" & _
			"dword th32ParentProcessID;" & _
			"long pcPriClassBase;" & _
			"dword dwFlags;" & _
			"char szExeFile[260]")
	DllStructSetData($tagPROCESSENTRY32, 1, DllStructGetSize($tagPROCESSENTRY32))
	Local $p_PROCESSENTRY32 = DllStructGetPtr($tagPROCESSENTRY32)

	$b = DllCall("Kernel32.dll", "int", "Process32First", "long", $hSnapshot, "ptr", $p_PROCESSENTRY32)
	If @error Then Return SetError(@error, @extended, False)
	_GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($Process32_ListView))
	Dim $aItems[1][7], $i = 0
	ReDim $aItems[$i + 1][7]
	If DllStructGetData($tagPROCESSENTRY32, "th32ProcessID") <> 0 Then
		$aItems[$i][0] = DllStructGetData($tagPROCESSENTRY32, "szExeFile")
		$aItems[$i][1] = DllStructGetData($tagPROCESSENTRY32, "th32ProcessID")
		$aItems[$i][2] = _WinAPI_GetProcessMemory($aItems[$i][1])
		$aItems[$i][3] = _WinAPI_GetProcessCreationTime($aItems[$i][1])
		$aItems[$i][4] = _WinAPI_GetModuleFileNameEx($aItems[$i][1])
		$aItems[$i][5] = _WinAPI_GetCommandLine($aItems[$i][1])
		$aItems[$i][6] = DllStructGetData($tagPROCESSENTRY32, "th32ParentProcessID")
		GUICtrlCreateListViewItem($aItems[$i][0] & "|" & $aItems[$i][1] & "|" & $aItems[$i][2] & "|" & $aItems[$i][3] & "|" & _
									$aItems[$i][4] & "|" & $aItems[$i][5] & "|" & $aItems[$i][6], $Process32_ListView)
		$i += 1
	EndIf
	While $b[0]
		$b = DllCall("Kernel32.dll", "int", "Process32Next", "long", $hSnapshot, "ptr", $p_PROCESSENTRY32)
		If Not $b[0] Then ExitLoop		
		ReDim $aItems[$i + 1][7]
		$aItems[$i][0] = DllStructGetData($tagPROCESSENTRY32, "szExeFile")
		$aItems[$i][1] = DllStructGetData($tagPROCESSENTRY32, "th32ProcessID")
		$aItems[$i][2] = _WinAPI_GetProcessMemory($aItems[$i][1])
		$aItems[$i][3] = _WinAPI_GetProcessCreationTime($aItems[$i][1])
		$aItems[$i][4] = _WinAPI_GetModuleFileNameEx($aItems[$i][1])
		$aItems[$i][5] = _WinAPI_GetCommandLine($aItems[$i][1])
		$aItems[$i][6] = DllStructGetData($tagPROCESSENTRY32, "th32ParentProcessID")
		GUICtrlCreateListViewItem($aItems[$i][0] & "|" & $aItems[$i][1] & "|" & $aItems[$i][2] & "|" & $aItems[$i][3] & "|" & $aItems[$i][4] & "|" & _
								$aItems[$i][5] & "|" & $aItems[$i][6], $Process32_ListView)
		$i += 1
	WEnd
	DllCall("Kernel32.dll", "int", "CloseHandle", "long", $hSnapshot)
;~ 	_GUICtrlListView_AddArray($Process32_ListView, $aItems);使用数组添加listview项目，则把上面的2处GUICtrlCreateListViewItem注释掉
	Return True
EndFunc

Func _WinAPI_GetProcessMemory($PID = 0)
	If Not $PID Then $PID = @AutoItPID
	Local $hProc = DllCall('kernel32.dll', 'ptr', 'OpenProcess', 'dword', 0x00000410, 'int', 0, 'dword', $PID)
	If (@error) Or ($hProc[0] = 0) Then
		Return SetError(1, 0, 0)
	EndIf
	$hProc = $hProc[0]
	Local $tPROCESS_MEMORY_COUNTERS = DllStructCreate('dword Size;dword PageFaultCount;long PeakWorkingSetSize;long WorkingSetSize;long QuotaPeakPagedPoolUsage;long QuotaPagedPoolUsage;long QuotaPeakNonPagedPoolUsage;long QuotaNonPagedPoolUsage;long PagefileUsage;long PeakPagefileUsage')
	Local $Ret = DllCall('psapi.dll', 'int', 'GetProcessMemoryInfo', 'ptr', $hProc, 'ptr', DllStructGetPtr($tPROCESS_MEMORY_COUNTERS), 'int', DllStructGetSize($tPROCESS_MEMORY_COUNTERS))
	If (@error) Or ($Ret[0] = 0) Then
		$Ret = 0
	EndIf
	DllCall("Kernel32.dll", "int", "CloseHandle", "long", $hProc)
	Return (DllStructGetData($tPROCESS_MEMORY_COUNTERS, 'PeakPagefileUsage') / 1024) & "K"
EndFunc

Func _WinAPI_GetCommandLine($PID = 0)
	If Not $PID Then $PID = @AutoItPID
    $ret1=DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x00000410, 'int', False, 'int', $PID)
    $PBI=DllStructCreate("int ExitStatus;ptr PebBaseAddress;ptr AffinityMask;ptr BasePriority;ulong UniqueProcessId;ulong InheritedFromUniqueProcessId;")
    DllCall("ntdll.dll", "int", "ZwQueryInformationProcess", "hwnd", $ret1[0], "int", 0, "ptr", DllStructGetPtr($PBI), "int", DllStructGetSize($PBI), "int", 0)
    $dw=DllStructCreate("ptr")
    DllCall("kernel32.dll", "int", "ReadProcessMemory", "hwnd", $ret1[0], "ptr", DllStructGetData($PBI,2)+0x10, "ptr", DllStructGetPtr($dw), "int", 4, "ptr", 0)
    $unicode_string = DllStructCreate("ushort Length;ushort MaxLength;ptr String")
    DllCall("kernel32.dll", "int", "ReadProcessMemory", "hwnd", $ret1[0], "ptr", DllStructGetData($dw, 1)+0x40, "ptr", DllStructGetPtr($unicode_string), "int", DllStructGetSize($unicode_string), "ptr", 0)
    $ret=DllCall("kernel32.dll", "int", "ReadProcessMemory", "hwnd", $ret1[0], "ptr", DllStructGetData($unicode_string, "String"), "wstr", 0, "int", DllStructGetData($unicode_string, "Length") + 2, "int*", 0)
    DllCall("kernel32.dll", 'int', 'CloseHandle', "hwnd", $ret1[0])
    If $ret[5] Then Return $ret[3]
    Return ""
EndFunc

Func _WinAPI_GetModuleFileNameEx($_Pid = 0)
	If Not $_Pid Then $_Pid = @AutoItPID
    $_Hwnd = DllCall("Kernel32.dll","hwnd","OpenProcess","dword",0x00000410,"int",0,"dword",$_Pid)
	If (@error) Or ($_Hwnd[0] = 0) Then
		Return SetError(1, 0, 0)
	EndIf	    
    $_Return = DllCall("Psapi.dll","long","GetModuleFileNameEx","hwnd",$_Hwnd[0],"long",0,"str",0,"long",255)        
    DllCall("Kernel32.dll","int","CloseHandle","hwnd",$_Hwnd[0])
    If StringInStr($_Return[3],"\") Then Return $_Return[3]
    Return ""
EndFunc

Func _WinAPI_GetProcessCreationTime($PID = 0)
	If Not $PID Then $PID = @AutoItPID
	Local $hProc = DllCall('kernel32.dll', 'ptr', 'OpenProcess', 'dword', 0x00000400, 'int', 0, 'dword', $PID)
	If (@error) Or ($hProc[0] = 0) Then
		Return SetError(1, 0, 0)
	EndIf

	$hProc = $hProc[0]
	Local $tFILETIME = DllStructCreate('dword;dword')
	Local $Ret = DllCall('kernel32.dll', 'int', 'GetProcessTimes', 'ptr', $hProc, 'ptr', DllStructGetPtr($tFILETIME), 'ptr*', 0, 'ptr*', 0, 'ptr*', 0)
	If (@error) Or ($Ret[0] = 0) Then
		$Ret = 0
	EndIf
	DllCall("kernel32.dll", 'int', 'CloseHandle', "hwnd", $hProc)
	$tSYSTEMTIME = _WinAPI_FileTimeToSystemTime(_WinAPI_FileTimeToLocalFileTime($tFILETIME))
	$Year = DllStructGetData($tSYSTEMTIME, 'Year')
	$Month = DllStructGetData($tSYSTEMTIME, 'Month')
	$Day = DllStructGetData($tSYSTEMTIME, 'Day')
	$Hour = DllStructGetData($tSYSTEMTIME, 'Hour')
	$Minute = StringFormat('%02s', DllStructGetData($tSYSTEMTIME, 'Minute'))
	$Second = StringFormat('%02s', DllStructGetData($tSYSTEMTIME, 'Second'))
	Return $Year & "-" & $Month & "-" & $Day & " " & $Hour & ":" & $Minute & ":" & $Second
EndFunc

Func _WinAPI_EnumChildProcess($PID = 0)
	If Not $PID Then $PID = @AutoItPID
	Local $hSnapshot = DllCall('kernel32.dll', 'ptr', 'CreateToolhelp32Snapshot', 'dword', 0x00000002, 'dword', 0)
	If (@error) Or (Not $hSnapshot[0]) Then
		Return SetError(1, 0, 0)
	EndIf

	Local $tPROCESSENTRY32 = DllStructCreate('dword Size;dword Usage;dword ProcessID;ulong_ptr DefaultHeapID;dword ModuleID;dword Threads;dword ParentProcessID;long PriClassBase;dword Flags;wchar ExeFile[260]')
	Local $pPROCESSENTRY32 = DllStructGetPtr($tPROCESSENTRY32)
	Local $Ret, $Result[1][2], $i = 0
	$hSnapshot = $hSnapshot[0]
	DllStructSetData($tPROCESSENTRY32, 'Size', DllStructGetSize($tPROCESSENTRY32))
	$Ret = DllCall('kernel32.dll', 'int', 'Process32FirstW', 'ptr', $hSnapshot, 'ptr', $pPROCESSENTRY32)
	While (Not @error) And ($Ret[0])
		If DllStructGetData($tPROCESSENTRY32, 'ParentProcessID') = $PID Then
			ReDim $Result[$i + 1][2]
			$Result[$i][0] = DllStructGetData($tPROCESSENTRY32, 'ProcessID')
			$Result[$i][1] = DllStructGetData($tPROCESSENTRY32, 'ExeFile')
			$i += 1
		EndIf
		$Ret = DllCall('kernel32.dll', 'int', 'Process32NextW', 'ptr', $hSnapshot, 'ptr', $pPROCESSENTRY32)
	WEnd
	DllCall("kernel32.dll", 'int', 'CloseHandle', "hwnd", $hSnapshot)
	Return $Result
EndFunc 

Func _WinAPI_EnumProcessThreads($PID = 0)
	If Not $PID Then $PID = @AutoItPID
	Local $hSnapshot = DllCall('kernel32.dll', 'ptr', 'CreateToolhelp32Snapshot', 'dword', 0x00000004, 'dword', 0)
	If (@error) Or (Not $hSnapshot[0]) Then
		Return SetError(1, 0, 0)
	EndIf

	Local $tTHREADENTRY32 = DllStructCreate('dword Size;dword Usage;dword ThreadID;dword OwnerProcessID;long BasePri;long DeltaPri;dword Flags')
	Local $pTHREADENTRY32 = DllStructGetPtr($tTHREADENTRY32)
	Local $Ret, $Result[1], $i = 0

	$hSnapshot = $hSnapshot[0]
	DllStructSetData($tTHREADENTRY32, 'Size', DllStructGetSize($tTHREADENTRY32))
	$Ret = DllCall('kernel32.dll', 'int', 'Thread32First', 'ptr', $hSnapshot, 'ptr', $pTHREADENTRY32)
	While (Not @error) And ($Ret[0])
		If DllStructGetData($tTHREADENTRY32, 'OwnerProcessID') = $PID Then
			ReDim $Result[$i + 1]
			$Result[$i] = DllStructGetData($tTHREADENTRY32, 'ThreadID')
			$i += 1
		EndIf
		$Ret = DllCall('kernel32.dll', 'int', 'Thread32Next', 'ptr', $hSnapshot, 'ptr', $pTHREADENTRY32)
	WEnd
	DllCall("kernel32.dll", 'int', 'CloseHandle', "hwnd", $hSnapshot)
	Return $Result
EndFunc

Func _WinAPI_GetProcessLoadedModules($iPID = 0)
	If Not $iPID Then $iPID = @AutoItPID
	Local $aReturn[1] = [0]
	Local $aCall, $hPsapi = DllOpen("Psapi.dll")
	Local $hProcess, $tModulesStruct
	$tModulesStruct = DllStructCreate("hwnd [200]")
	Local $SIZEOFHWND = DllStructGetSize($tModulesStruct) / 200
	$aResult = DllCall("kernel32.dll", "hwnd", "OpenProcess", "dword", 0x00000410, "int", 0, "dword", $iPID)
	If @error <> 0 Then Return SetError(1, 0, '')
	$hProcess = $aResult[0]
	If Not $hProcess Then Return SetError(1, 0, -1)
	$aCall = DllCall($hPsapi, "int", "EnumProcessModules", "ptr", $hProcess, "ptr", DllStructGetPtr($tModulesStruct), "dword", DllStructGetSize($tModulesStruct), "dword*", "")
	If @error <> 0 Then Return SetError(1, 0, '')
	If $aCall[4] > DllStructGetSize($tModulesStruct) Then
		$tModulesStruct = DllStructCreate("hwnd [" & $aCall[4] / $SIZEOFHWND & "]")
		$aCall = DllCall($hPsapi, "int", "EnumProcessModules", "ptr", $hProcess, "ptr", DllStructGetPtr($tModulesStruct), "dword", $aCall[4], "dword*", "")
	EndIf
	$Size = $aCall[4] / $SIZEOFHWND
	ReDim $aReturn[$Size]
	$aReturn[0] = $Size - 1
	For $i = 1 To UBound($aReturn) - 1
		$aCall = DllCall($hPsapi, "dword", "GetModuleFileNameExW", "ptr", $hProcess, "int", DllStructGetData($tModulesStruct, 1, $i + 1), "wstr", "", "dword", 65536)
		If @error <> 0 Then Return SetError(1, 0, '')
		$aReturn[$i] = $aCall[3]
	Next
	DllCall("Kernel32.dll", "int", "CloseHandle", "int", $hProcess)
	DllClose($hPsapi)
	Return $aReturn
EndFunc

Func _WinAPI_GetProcessName($PID = 0)
	If Not $PID Then $PID = @AutoItPID
	Local $hSnapshot = DllCall('kernel32.dll', 'ptr', 'CreateToolhelp32Snapshot', 'dword', 0x00000002, 'dword', 0)
	If (@error) Or (Not $hSnapshot[0]) Then
		Return SetError(1, 0, '')
	EndIf
	Local $tPROCESSENTRY32 = DllStructCreate('dword Size;dword Usage;dword ProcessID;ulong_ptr DefaultHeapID;dword ModuleID;dword Threads;dword ParentProcessID;long PriClassBase;dword Flags;wchar ExeFile[260]')
	Local $pPROCESSENTRY32 = DllStructGetPtr($tPROCESSENTRY32)
	Local $Ret, $Error = 1

	$hSnapshot = $hSnapshot[0]
	DllStructSetData($tPROCESSENTRY32, 'Size', DllStructGetSize($tPROCESSENTRY32))
	$Ret = DllCall('kernel32.dll', 'int', 'Process32FirstW', 'ptr', $hSnapshot, 'ptr', $pPROCESSENTRY32)
	While (Not @error) And ($Ret[0])
		If DllStructGetData($tPROCESSENTRY32, 'ProcessID') = $PID Then
			$Error = 0
			ExitLoop
		EndIf
		$Ret = DllCall('kernel32.dll', 'int', 'Process32NextW', 'ptr', $hSnapshot, 'ptr', $pPROCESSENTRY32)
	WEnd
	DllCall("kernel32.dll", 'int', 'CloseHandle', "hwnd", $hSnapshot)
	Return DllStructGetData($tPROCESSENTRY32, 'ExeFile')
EndFunc

Func _WinAPI_FileTimeToSystemTime($tFILETIME)
	Local $tSYSTEMTIME = DllStructCreate("word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds")
	Local $Ret = DllCall('kernel32.dll', 'int', 'FileTimeToSystemTime', 'ptr', DllStructGetPtr($tFILETIME), 'ptr', DllStructGetPtr($tSYSTEMTIME))

	If (@error) Or ($Ret[0] = 0) Then
		Return SetError(1, 0, 0)
	EndIf
	Return $tSYSTEMTIME
EndFunc

Func _WinAPI_FileTimeToLocalFileTime($tFILETIME)
	Local $tFILETIMELOCAL = DllStructCreate("dword Lo;dword Hi")
	Local $Ret = DllCall('kernel32.dll', 'int', 'FileTimeToLocalFileTime', 'ptr', DllStructGetPtr($tFILETIME), 'ptr', DllStructGetPtr($tFILETIMELOCAL))

	If (@error) Or ($Ret[0] = 0) Then
		Return SetError(1, 0, 0)
	EndIf
	Return $tFILETIMELOCAL
EndFunc
