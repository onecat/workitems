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
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $gu_Form1 = GUICreate("Form1", 378, 208, -1, -1)

Global $gu_Button[4]
$gu_Button[1] = GUICtrlCreateButton("Button1", 32, 16, 129, 41)
$gu_Button[2] = GUICtrlCreateButton("Button2", 32, 64, 129, 41)
$gu_Button[3] = GUICtrlCreateButton("Button3", 32, 112, 129, 41)

Global $gu_Radio1 = GUICtrlCreateRadio("���ð�ť", 248, 112, 65, 17)
Global $gu_Radio2 = GUICtrlCreateRadio("���ð�ť", 248, 136, 65, 17)

_Main()
Exit

Func _Main()
        
        GUISetState(@SW_SHOW)
        
        Local $i
        
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_Radio1
                                For $i = 1 To UBound($gu_Button, 1) - 1
                                        GUICtrlSetState($gu_Button[$i], $GUI_DISABLE)
                                Next
                        Case $gu_Radio2
                                For $i = 1 To UBound($gu_Button, 1) - 1
                                        GUICtrlSetState($gu_Button[$i], $GUI_ENABLE)
                                Next
                EndSwitch
        WEnd

EndFunc   ;==>_Main
