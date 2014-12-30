#RequireAdmin

#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>

Global $IDLETIME, $KERNELTIME, $USERTIME,$StartIdle, $StartKernel, $StartUser,$EndIdle, $EndKernel, $EndUser

$hGUI = GUICreate("系统资源窗格", 346, 301, -1, -1)
$hGroup = GUICtrlCreateGroup("系统资源窗格", 20, 19, 304, 214)
GUICtrlSetResizing(-1,128)
$hButton = GUICtrlCreateButton("确定", 76, 257, 179, 30)
$hCPU_Label = GUICtrlCreateLabel("CPU占用率：", 44, 54, 73, 16)
$hCPU_Show = GUICtrlCreateLabel("20%", 117, 54, 39, 13)
$hCPU_Progress = GUICtrlCreateProgress(44, 77, 256, 12)
$hMem_Label = GUICtrlCreateLabel("内存使用率：", 44, 108, 78, 16)
$hMem_Show = GUICtrlCreateLabel("2.6G / 8G", 127, 108, 87, 13)
$hMem_Progress = GUICtrlCreateProgress(45, 133, 256, 12)
$hCpan_Label = GUICtrlCreateLabel("C盘使用率：", 46, 163, 68, 16)
$hCpan_Show = GUICtrlCreateLabel("24.6G / 80.00G", 125, 164, 110, 15)
$hCpan_Progress = GUICtrlCreateProgress(46, 192, 256, 12)
GUISetState(@SW_SHOW)
$IDLETIME = DllStructCreate("dword;dword")
$KERNELTIME = DllStructCreate("dword;dword")
$USERTIME = DllStructCreate("dword;dword")

_TimerProc()
AdlibRegister("_TimerProc", 1000)


While 1
	$hMsg = GUIGetMsg()
	Switch $hMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $hButton
			Exit
	EndSwitch
WEnd


Func _TimerProc()
        _GetSysTime($EndIdle, $EndKernel, $EndUser)
        _CPUCalc()
        _GetSysTime($StartIdle, $StartKernel, $StartUser)
EndFunc   ;==>_TimerProc
 
Func _GetSysTime(ByRef $sIdle, ByRef $sKernel, ByRef $sUser)
        DllCall("kernel32.dll", "int", "GetSystemTimes", "ptr", DllStructGetPtr($IDLETIME), _
                        "ptr", DllStructGetPtr($KERNELTIME), _
                        "ptr", DllStructGetPtr($USERTIME))
 
        $sIdle = DllStructGetData($IDLETIME, 1)
        $sKernel = DllStructGetData($KERNELTIME, 1)
        $sUser = DllStructGetData($USERTIME, 1)
EndFunc   ;==>_GetSysTime
 
Func _CPUCalc()
        Local $iSystemTime, $iTotal, $iCalcIdle, $iCalcKernel, $iCalcUser
        $iCalcIdle = ($EndIdle - $StartIdle)
        $iCalcKernel = ($EndKernel - $StartKernel)
        $iCalcUser = ($EndUser - $StartUser)
        $iSystemTime = ($iCalcKernel + $iCalcUser)
        $iTotal = Int(($iSystemTime - $iCalcIdle) * (100 / $iSystemTime))
        Local $CPU = $iTotal
        Local $tArr = MemGetStats()
        Local $RAM1 =  Round ((($tArr[1]-$tArr[2])/1024/1024),2) & "G / "& Round (($tArr[1]/1024/1024),2) & "G"
		Local $RAM = $tArr[0]
        If $CPU & "%" <> GUICtrlRead($hCPU_Show) And ($CPU >= 0 And $CPU <= 100) Then
                GUICtrlSetData($hCPU_Progress, $CPU)
                GUICtrlSetData($hCPU_Show, $CPU & "%")
        EndIf
        If $RAM & "%" <> GUICtrlRead($hMem_Show) And ($RAM >= 0 And $RAM <= 100) Then
                GUICtrlSetData($hMem_Progress, $RAM)
                GUICtrlSetData($hMem_Show, $RAM1)
		EndIf
		Local $Disk_C_Used = Round(((DriveSpaceTotal ("C:\") - DriveSpaceFree ("C:\"))/1024),2)
		Local $Disk_C_Total = Round((DriveSpaceTotal ("C:\")/1024),2)
			GUICtrlSetData($hCpan_Progress, ($Disk_C_Used / $Disk_C_Total)*100)
			GUICtrlSetData($hCpan_Show, $Disk_C_Used &"GB / "& $Disk_C_Total &"GB")
EndFunc   ;==>_CPUCalc
