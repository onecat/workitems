#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
 
Global Enum $TIMERID1 = 1001, $TIMERID2, $TIMERID3
Global $iLabel, $iMemo, $Count, $Var = 1, $Var2 = 1, $hGUI, $iTimer1, $iTimer2, $hCallBack, $hCallBack2, $First = 1
 
$hGUI = GUICreate("My Timers", 600, 296)
GUISetBkColor(0xFFFFFF)
$iLabel = GUICtrlCreateLabel("0", 10, 10, 100, 25)
$iLabel2 = GUICtrlCreateLabel("0", 150, 10, 300, 25)
$iMemo = GUICtrlCreateEdit("", 2, 32, 596, 262, BitOR($WS_HSCROLL, $WS_VSCROLL))
GUICtrlSetState($iMemo, $GUI_DISABLE)
GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
GUISetState()
$hCallBack = DllCallbackRegister("_TimerCallBackFunc", "none", "hwnd;int;int;dword")
$hCallBack2 = DllCallbackRegister("_TimerCallBackFunc", "none", "hwnd;int;int;dword")
$hCallBack3 = DllCallbackRegister("_TimerCallBackFunc", "none", "hwnd;int;int;dword")
$iTimer1 = _WinAPI_SetTimer($hGUI, $TIMERID1, 1000, DllCallbackGetPtr($hCallBack))
Sleep(100)
$iTimer2 = _WinAPI_SetTimer($hGUI, $TIMERID2, 5000, DllCallbackGetPtr($hCallBack2))
$iTimer3 = _WinAPI_SetTimer($hGUI, $TIMERID3, 3000, DllCallbackGetPtr($hCallBack3))
 
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
    EndSwitch
WEnd
 
_WinAPI_KillTimer($hGUI, $iTimer1)
_WinAPI_KillTimer($hGUI, $iTimer2)
DllCallbackFree($hCallBack)
DllCallbackFree($hCallBack2)
 
Func _WinAPI_SetTimer($hWnd, $iIDEvent, $iElapse, $pTimerFunc = 0)
    Local $iResult = DllCall("user32.dll", "int", "SetTimer", "hwnd", $hWnd, "int", $iIDEvent, "int", $iElapse, "ptr", $pTimerFunc)
    If @error Then Return SetError(-1, -1, 0)
    Return $iResult[0]
EndFunc   ;==>_WinAPI_SetTimer
 
Func _WinAPI_KillTimer($hWnd, $iIDEvent)
    Local $iResult = DllCall("user32.dll", "int", "KillTimer", "hwnd", $hWnd, "int", $iIDEvent)
    If @error Then Return SetError(-1, -1, 0)
    Return $iResult[0] <> 0
EndFunc   ;==>_WinAPI_KillTimer
 
Func _TimerCallBackFunc($hWnd, $Msg, $iIDTimer, $dwTime)
    If $First = 1 And $iIDTimer = $TIMERID1 Then
        $First = 0
        Global $FirstTime = $dwTime
    EndIf
    GUICtrlSetData($iMemo, "hWnd : " & $hWnd & "  Msg : " & $Msg & "  iIDTimer : " & $iIDTimer & "  dwTime : " & $dwTime & @CRLF, 1)
    GUICtrlSetData($iLabel2, $dwTime - $FirstTime)
    If $iIDTimer = $TIMERID1 Then
        If $Var = 1 Then
            $Count += 1
        Else
            $Count -= 1
        EndIf
        GUICtrlSetData($iLabel, $Count)
    ElseIf $iIDTimer = $TIMERID2 Then
        If $Var = 1 Then
            $Var = 2
        Else
            $Var = 1
        EndIf
    Else
        If $Var2 = 1 Then
            GUISetBkColor(0x000000)
            GUICtrlSetColor($iLabel, 0xFFFFFF)
            GUICtrlSetColor($iLabel2, 0xFFFFFF)
            $Var2 = 2
        Else
            GUISetBkColor(0xFFFFFF)
            GUICtrlSetColor($iLabel, 0x000000)
            GUICtrlSetColor($iLabel2, 0x000000)
            $Var2 = 1
        EndIf
    EndIf
EndFunc   ;==>_TimerCallBackFunc
