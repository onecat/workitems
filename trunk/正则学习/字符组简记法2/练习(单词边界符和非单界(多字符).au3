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
$path =@ScriptDir & "\��ҳԴ��1.txt"

$Ra1_1 = "\bbody\b"
$Ra1_2 = "\Bbody\B"
;~ $Ra1_3 = "\t"
;~ $Ra1_4 = "\n"
;~ $Ra1_5 = "\r"
;~ $Ra1_6 = "\f"
$Form1 = GUICreate("����", 560, 503, 192, 124)
$Edit1 = GUICtrlCreateEdit("", 40, 16, 513, 200,$WS_VSCROLL)
GUICtrlSetData(-1, bb($path))
$Edit2 = GUICtrlCreateEdit("", 40, 256, 505, 177,$WS_VSCROLL)
$Radio1 = GUICtrlCreateRadio("\b", 48, 232, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("\B", 136, 232, 73, 17)
;~ $Radio3 = GUICtrlCreateRadio("\t", 224, 232, 73, 17);
;~ $Radio4 = GUICtrlCreateRadio("\n", 312, 232, 73, 17)
;~ $Radio5 = GUICtrlCreateRadio("\r", 392, 232, 73, 17)
;~ $Radio6 = GUICtrlCreateRadio("\f", 472, 232, 73, 17);
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
			GUICtrlSetData($Edit2,zz())
	EndSwitch
WEnd


Func ra()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $str4 = $Ra1_1
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $str4 = $Ra1_2
;~ 	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $str4 = $Ra1_3
;~ 	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $str4 = $Ra1_4
;~ 	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $str4 = $Ra1_5
;~ 	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $str4 = $Ra1_6
	Return $str4
EndFunc

Func zz()
	$str=""
	Local $str1 = bb ($path), $str2 = ra()
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

Func bb($iDIR)
	$sFile = FileOpen($iDIR,0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc	