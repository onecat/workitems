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

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 299, 136, 192, 114)
$Label1 = GUICtrlCreateLabel("��ֹճ��", 8, 8, 52, 17)
$Input1 = GUICtrlCreateInput("", 32, 48, 225, 21)
$wProcOld = GUIRegisterMsgEx($Input1, "_MyWindowProc") ;�������໯
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        GUIDelete($Form1)
                        Exit
        EndSwitch
WEnd
 
Func GUIRegisterMsgEx($ctrID, $funcName) ;�ؼ�id,������
        Local $wProcNew = DllCallbackRegister($funcName, "ptr", "hwnd;uint;long;ptr")
        Local $wProcOld = _WinAPI_SetWindowLong(GUICtrlGetHandle($ctrID), $GWL_WNDPROC, DllCallbackGetPtr($wProcNew))
        Return $wProcOld
EndFunc   ;==>GUIRegisterMsgEx
 
Func _MyWindowProc($hWnd, $uiMsg, $wParam, $lParam)
        Switch $uiMsg
                Case $WM_PASTE
                        Return 0 ;�����������Ϣ
        EndSwitch
        ;��Ĭ�ϴ��ڽ��̴���δ���������Ϣ
        Return _WinAPI_CallWindowProc($wProcOld, $hWnd, $uiMsg, $wParam, $lParam)
EndFunc   ;==>_MyWindowProc
