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
#include <GuiStatusBar.au3>
#Region ### START Koda GUI section ### Form=
Local $str, $n
$path =@ScriptDir & "\11.txt"

$Ra1_1 = 'a.{1,}c'
$Ra1_2 = 'a.{1,}?c'
;~ $Ra1_3 = 'color="#008000">(.{8,70})(\d{4}-\d{1,2}-\d{1,2})'
;~ $Ra1_4 = 'color="#008000">((.{8,70})(\d{4}-\d{1,2}-\d{1,2}))'
;~ $Ra1_5 = "\d{3,4}[-|\s]\d{7,8}"
;~ $Ra1_6 = "\d{3,4}[-|\s]?\d{7,8}";����\s����Ҳ���Բ�����Ҳ����
$Form1 = GUICreate("����", 560, 503, 192, 124)
$Edit1 = GUICtrlCreateEdit("", 40, 16, 513, 200,$WS_VSCROLL)
GUICtrlSetData(-1, bb($path))
$Edit2 = GUICtrlCreateEdit("", 40, 256, 505, 177,$WS_VSCROLL)
$Radio1 = GUICtrlCreateRadio("̰��ƥ��", 48, 232, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("����ƥ��", 136, 232, 73, 17)
;~ $Radio3 = GUICtrlCreateRadio("���Ӻ�����", 224, 232, 73, 17)
;~ $Radio4 = GUICtrlCreateRadio("��������", 312, 232, 73, 17)
;~ $Radio5 = GUICtrlCreateRadio("|ʹ��", 392, 232, 73, 17);
;~ $Radio6 = GUICtrlCreateRadio("?ʹ��", 472, 232, 73, 17)
$Button1 = GUICtrlCreateButton("����", 160, 440, 273, 33)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "������");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			zz($str, $n)
			GUICtrlSetData($Edit2,$str)
			_GUICtrlStatusBar_SetText($StatusBar1, " �ܹ�" &  $n & "��")
	EndSwitch
WEnd


Func ra()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $str4 = $Ra1_1
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $str4 = $Ra1_2
;~ 	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $str4 = $Ra1_3
;~ 	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $str4 = $Ra1_4
;~ 	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $str4 = $Ra1_5
;~ 	If GUICtrlRead($Radio6) = $GUI_CHECKED Then $str4 = $Ra1_6
	Return $str4
EndFunc

Func bb($iDIR)
	$sFile = FileOpen($iDIR,0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc	


Func zz(ByRef $str, ByRef $n)
		$str="" 
		Local $i=1 , $j=0
		Local $str1 = bb ($path), $str2 = ra()
			If StringRegExp($str1, $str2) Then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
				$h = StringRegExp($str1, $str2, 3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
				;MsgBox(0, "", $h[0])
			Else
				MsgBox(0, "", "��ƥ��")
			EndIf
				For $n=0 To UBound($h)-1
					$str &=$h[$n] & @CRLF 			
	    Next
		Return $str
			
EndFunc			