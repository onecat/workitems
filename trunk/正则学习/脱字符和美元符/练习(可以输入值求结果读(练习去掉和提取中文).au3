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
#EndRegion ACNԤ����������(���ò���)
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
#include <Array.au3>
#Region ### START Koda GUI section ### Form=
Local $str, $n
$path ='<a href="space-uid-7620.html">����</a>'
$Ra1_1 = "[\x20-\x7f]"
$Ra1_2 = "[^a-z]"
$Ra1_3 = "[^0-9]"
$Ra1_4 = "[0-9a-z]"
$Ra1_5 = "[^\x20-\x7f]"
$Form1 = GUICreate("����", 616, 458, 192, 124)
;$Input1 = GUICtrlCreateInput(, 120, 340, 305, 21)
$Edit1 = GUICtrlCreateEdit("", 40, 16, 513, 240)
GUICtrlSetData(-1, $path)
$Edit2 = GUICtrlCreateEdit("", 40, 272, 505, 57,$ES_WANTRETURN)
;GUICtrlSetData(-1, "")
$Radio1 = GUICtrlCreateRadio("ȥ������", 32, 384, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("ȥ����ĸ", 120, 384, 73, 17)
$Radio3 = GUICtrlCreateRadio("ȥ������", 208, 384, 73, 17)
$Radio4 = GUICtrlCreateRadio("��ȡ���ֺ��ַ�",  296, 384, 105, 17)
$Radio5 = GUICtrlCreateRadio("��ȡ����", 416, 384, 73, 17)
$Button1 = GUICtrlCreateButton("����", 160, 416, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData($Edit2,zz())
	EndSwitch
WEnd


Func ra()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $str4 = $Ra1_1
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $str4 = $Ra1_2
	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $str4 = $Ra1_3
	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $str4 = $Ra1_4
	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $str4 = $Ra1_5
	Return $str4
EndFunc

Func zz()
	$str=""
	Local $str1 = $path, $str2 = ra()
			If StringRegExp($str1, $str2) Then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
				$h = StringRegExp($str1, $str2, 3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
			Else
				MsgBox(0, "", "��ƥ��")
			EndIf
				For $n=0 To UBound($h)-1
			$str &=$h[$n]; & @CRLF 
	    Next
		Return $str	
			
EndFunc			