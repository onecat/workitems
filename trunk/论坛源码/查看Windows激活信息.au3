#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\chtyfox\Desktop\�½� AutoIt v3 �ű�.exe
#PRE_Compression=4
#PRE_UseX64=y
#PRE_Res_Fileversion=0.0.0.1
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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
#include <Process.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("�鿴Windows������Ϣ", 256, 114, 192, 124)
$Button1 = GUICtrlCreateButton("��ϸ������Ϣ", 24, 16, 91, 25)
$Button2 = GUICtrlCreateButton("���֤��Ϣ", 152, 16, 75, 25)
$Button3 = GUICtrlCreateButton("�Ƿ񳹵׼���", 24, 72, 91, 25)
$Button4 = GUICtrlCreateButton("�汾��Ϣ", 152, 72, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button1
			 _RunDOS("slmgr.vbs -dlv")
		Case $nMsg = $Button2
			_RunDOS("slmgr.vbs -dli")
		Case $nMsg = $Button3
			_RunDOS("slmgr.vbs -xpr")
		Case $nMsg = $Button4
			_RunDOS("Winver")
	EndSelect
WEnd

