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
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("����", 615, 438, 192, 124)
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 313)
GUICtrlSetData(-1, "")
$Button1 = GUICtrlCreateButton("����", 160, 384, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
				MsgBox(0,"����ӺŽ��",zz())
				MsgBox(0,"�����ʺŽ��",aa())
	EndSwitch
WEnd

Func zz()
	If StringRegExp (GUICtrlRead($Edit1),"4.+8") then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
			$h = StringRegExp (GUICtrlRead($Edit1),"4.+8",3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
			Return  $h[0]
	EndIf
EndFunc	

Func aa()
	If StringRegExp (GUICtrlRead($Edit1),"7.?8") then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
			$h = StringRegExp (GUICtrlRead($Edit1),"7.?8",3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
			Return  $h[0]
	EndIf
EndFunc	