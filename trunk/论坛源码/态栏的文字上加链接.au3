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
#include <GUIStatusBar.au3>
#include <GUIConstants.au3>
#include <WindowsConstants.au3>

$hGUI = GUICreate("Test", 400, 300)

;GUICtrlCreateLabel("www.google.cn", 4, 4, 200, 20)
GUICtrlCreateLabel("�ȸ�", 4, 4, 200, 20)
GUICtrlSetFont(-1, 9, 400, 4, "Verdana")

$hFont = _SendMessage(GUICtrlGetHandle(-1), $WM_GETFONT, 0, 0)
;Local $aText[2] = ["www.google.cn", ""], $aPart[2] = [400 / 1.5, -1]
Local $aText[2] = ["�ȸ�", ""], $aPart[2] = [400 / 1.5, -1]
$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPart, $aText)
_SendMessage($hStatusBar, $WM_SETFONT, $hFont, 1, 0, "wparam", "int")
GUICtrlSetState(-1, $GUI_HIDE)

$hLibrary = _WinAPI_LoadLibrary("Shell32.dll")
$hCursor = _LoadCursor($hLibrary, 1002)
_WinAPI_FreeLibrary($hLibrary)

$hSTC = DllCallbackRegister("_StatusBarProcedure", "int", "hWnd;uint;wparam;lparam")
$hOSTC = _WinAPI_SetWindowLong($hStatusBar, -4, DllCallbackGetPtr($hSTC))

Func _StatusBarProcedure($hWnd, $iMsg, $iwParam, $ilParam)
        Local $iX, $iY

        If (($iMsg = $WM_MOUSEMOVE) Or ($iMsg = $WM_LBUTTONDOWN) Or _
                ($iMsg = $WM_LBUTTONUP) Or ($iMsg = $WM_LBUTTONDBLCLK)) Then
                $iX = bitAnd($ilParam, 0xFFFF)
                $iY = bitShift($ilParam, 0x10)

                If ($iX > 0 And $iX < 100) And ($iY > 0 And $iY < 21) Then
                        _SetCursor($hCursor)
                        If ($iMsg = $WM_LBUTTONDBLCLK) Then
                                ShellExecute("www.google.cn")
                        EndIf
                EndIf
        EndIf
        Return _WinAPI_CallWindowProc($hOSTC, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc        ;==>_StatusBarProcedure

GUISetState()

Do
Until GUIGetMsg() = -3

Opt("TrayIconHide", 1)
ProcessClose(@AutoItPid)

Func _LoadCursor($hInstance, $iCursorId)
        Local $iResult
        $iResult = DllCall("User32.dll", "hWnd", "LoadCursor", "hWnd", $hInstance, "int", $iCursorId)
        Return $iResult[0]
EndFunc        ;==>_LoadCursor

Func _SetCursor($hCursor)
        Local $iResult = DllCall("User32.dll", "int", "SetCursor", "hWnd", $hCursor)
        Return $iResult[0]
EndFunc        ;==>_SetCursor
