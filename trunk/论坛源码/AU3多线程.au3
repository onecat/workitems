#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

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
