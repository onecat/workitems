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
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $time = 100
Global $Stop = 1
AdlibRegister("time")
$time1 = TimerInit()
$Form1 = GUICreate("Form1", 337, 200, 192, 124)
Global $Progress1 = GUICtrlCreateProgress(32, 40, 241, 65)
$Button1 = GUICtrlCreateButton("ȷ��", 200, 136, 89, 49)
$Input1 = GUICtrlCreateInput("Input1", 32, 144, 153, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        If GUICtrlRead($Input1) = "123456" Then 
						 $Stop = 0
					Else	 
                        Exit
                        ; �������123456 Ҫִ�������ĳ��򣬾��������޸�~
					EndIf
                EndSwitch
        
        If $time = 0 Then Exit
WEnd
Func Time()
        If TimerDiff($time1) > 100 Then
                ;GUICtrlSetData($Label1, $time & "��󽫽���������!")
                GUICtrlSetData($Progress1, (100 - $time) / 1)
                $time = $time - 1
                $time1 = TimerInit()
				If $Stop = 0 Then AdlibUnRegister()
				If $time1 < 0 Then Exit
        EndIf
EndFunc   ;==>Time

;~ #include <ButtonConstants.au3>
;~ #include <EditConstants.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <ProgressConstants.au3>
;~ #include <WindowsConstants.au3>
;~ #Region ### START Koda GUI section ### Form=
;~ Global $Form1 = GUICreate("Form1", 322, 202, 192, 124)
;~ Global $Progress1 = GUICtrlCreateProgress(8, 24, 305, 17)
;~ Global $Input1 = GUICtrlCreateInput("Input1", 8, 64, 217, 21)
;~ Global $Button1 = GUICtrlCreateButton("ȷ��", 240, 64, 65, 25)
;~ Global $Button2 = GUICtrlCreateButton("��ʼ��ʱ�˳�", 96, 120, 129, 49)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###

;~ Global $Timer = 60
;~ Global $Stop = 1

;~ _main()

;~ Func _main()
;~         While 1
;~                 $nMsg = GUIGetMsg()
;~                 Switch $nMsg
;~                         Case $GUI_EVENT_CLOSE
;~                                 Exit
;~                         Case $Button1
;~                                 If GUICtrlRead($Input1)="123456" Then $Stop = 0
;~                         Case $Button2
;~                                 AdlibRegister("_TimeExit", 100)
;~                 EndSwitch
;~         WEnd
;~ EndFunc   ;==>_main

;~ Func _TimeExit()
;~         $Timer -= 1
;~         GUICtrlSetData($Progress1, (60 - $Timer) / 60 * 100)
;~         If $Stop = 0 Then AdlibUnRegister()
;~         If $Timer < 0 Then Exit
;~ EndFunc   ;==>_TimeExit