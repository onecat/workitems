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
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#region ### START Koda GUI section ### Form=
 
Dim $k = 0
 
Dim $Circle[18], $pi = 3.14159265358979, $R = 35
$FrmWin8 = GUICreate("Win8 Circle", 280, 220, 492, 250)
GUISetBkColor(0x000000)
For $i = 0 To 14
        $Circle[$i] = GUICtrlCreateLabel("��", 200, 200, 14, 14)
        GUICtrlSetFont(-1, 11, 400, 0, "Tahoma")
        GUICtrlSetColor(-1, 0xFFFFFF)
        $x = 128 + Sin($pi * $i * 25.8 / 180) * $R
        $y = 80 - Cos($pi * $i * 25.8 / 180) * $R
        GUICtrlSetPos($Circle[$i], $x, $y)
Next
$LblText = GUICtrlCreateLabel("Starting Windows...", 55, 160, 180, 29)
GUICtrlSetFont(-1, 14, 500, 0, "΢���ź�")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_SHOW)
$i = 0
#endregion ### END Koda GUI section ###
 
$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")
$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 60, "ptr", DllCallbackGetPtr($Timer))
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                         DllCall ( "user32.dll" , "int" , "KillTimer" , "hwnd" , 0, "uint" , $TimerDLL[0])
                        Exit
        EndSwitch
WEnd
 
Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)
        If Mod($k, 2) = 0 Then
                GUICtrlSetState($Circle[$i], $GUI_HIDE)
        Else
                GUICtrlSetState($Circle[$i], $GUI_show)
        EndIf
        $i += 1
        If $i > 13 Then
                $i = 0
                $k += 1
        EndIf
EndFunc   ;==>Timer

