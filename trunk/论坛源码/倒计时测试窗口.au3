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
#include <ButtonConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Timers.au3>
;~ Global $time = 30
;~ #Region ### START Koda GUI section ### Form=
;~ $Form1 = GUICreate("����ʱ���Դ���", 350, 172, -1, -1)
;~ $Label1 = GUICtrlCreateLabel("30��󽫽���������!", 56, 32, 232, 28)
;~ GUICtrlSetFont(-1, 18, 400, 0, "����_GB2312")
;~ $Progress1 = GUICtrlCreateProgress(8, 88, 333, 17)
;~ $Button1 = GUICtrlCreateButton("ȷ��(&Y)", 63, 128, 73, 25, 0)
;~ $Button2 = GUICtrlCreateButton("�˳�(&X)", 210, 128, 73, 25, 0)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###
;~ TrayTip("^_^ pcbar��ʾ", "�ƶ����̻���꽫ֹͣ����ʱ��", 10, 1)
;~ AdlibRegister("_timer", 1000)
;~ $timer1 = _Timer_Init()
;~ While 1
;~         $nMsg = GUIGetMsg()
;~         Switch $nMsg
;~                 Case $GUI_EVENT_CLOSE, $Button2
;~                         Exit
;~                 Case $Button1
;~                         main()
;~         EndSwitch
;~         If $time <= 0 Then
;~                 AdlibUnRegister()
;~                 main()
;~         EndIf
;~         If _Timer_GetIdleTime() <= _Timer_Diff($timer1) Then AdlibUnRegister()
;~ WEnd
;~ AdlibUnRegister()
;~ Exit
;~  
;~ Func _timer()
;~         $time -= 1
;~         GUICtrlSetData($Label1, $time & "��󽫽���������!")
;~         GUICtrlSetData($Progress1, (30 - $time) / 0.3)
;~         If $time <= 0 Then AdlibUnRegister()
;~ EndFunc   ;==>_timer
;~  
;~ Func main()
;~         MsgBox(0, 'test', '����ʱ����,����������.', 10)
;~         ;����Ϊ������
;~         Exit
;~ EndFunc   ;==>main


 
Global $time = 30
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("����ʱ���Դ���", 350, 172, 193, 125)
$Label1 = GUICtrlCreateLabel("30��󽫽���������!", 56, 32, 232, 28)
GUICtrlSetFont(-1, 18, 400, 0, "����_GB2312")
$Progress1 = GUICtrlCreateProgress(8, 88, 333, 17)
$Button1 = GUICtrlCreateButton("ȷ��(&Y)", 53, 128, 73, 25, 0)
$Button2 = GUICtrlCreateButton("�˳�(&X)", 210, 128, 73, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;AdlibRegister("_timer", 1000)
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE, $Button2
                        Exit
					Case $Button1
						AdlibRegister("timer",1000)
                      ; ExitLoop
        EndSwitch
        If $time <= 0 Then ExitLoop
WEnd
main()
Exit
 
Func timer()
        $time -= 1
        GUICtrlSetData($Label1, $time & "��󽫽���������!")
        GUICtrlSetData($Progress1, (30 - $time) / 0.3)
       If $time <= 0 Then AdlibUnRegister()
EndFunc   ;==>_timer
 
Func main()
        MsgBox(0, 'test', '����ʱ����,����������.', 10)
        ;����Ϊ������
EndFunc   ;==>main
