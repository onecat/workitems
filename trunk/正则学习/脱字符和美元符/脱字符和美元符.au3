#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiStatusBar.au3>
#Region ### START Koda GUI section ### Form=
Local $str, $n
$path = @ScriptDir & "\Դ����.htm"
$Form1 = GUICreate("����", 615, 450, 192, 124)
$Input1 = GUICtrlCreateInput('(?m)^<a href=".+?html">.+?</a>$', 120, 340, 305, 21);�����ı� ����(?m)����ģʽѡ��
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 280)
;GUICtrlSetData(-1, bb($path))
$Button1 = GUICtrlCreateButton("����", 160, 384, 273, 33)
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
			GUICtrlSetData($Edit1,$str)
			;MsgBox(0,"����",$n & " ��")
			_GUICtrlStatusBar_SetText($StatusBar1, " �ܹ�" &  $n & "��")
	EndSwitch
WEnd

Func bb($iDIR)
	$sFile = FileOpen($iDIR, 0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc   ;==>bb

Func zz(ByRef $str, ByRef $n)
	$str = ""
	Local $str1 = bb($path), $str2 = GUICtrlRead($Input1)
	If StringRegExp($str1, $str2) Then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
		$h = StringRegExp($str1, $str2, 3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
		
		;ע�⣺�鿴au3�İ���  ����ģʽ ��Ҫ��������ƥ�� ������˵����
		;(?m) ����: ^ �� $ ƥ�������ڵĻ��з�. Ĭ�϶����ǹرյ�. 
		
		;_ArrayDisplay($h);�б���ͼ�鿴���� ���ڵ���
		;ConsoleWrite($h[0]);��������ı�  ���ڵ���
		;MsgBox(0, "", $h[0])
	Else
		MsgBox(0, "", "��ƥ��")
	EndIf
	
		For $n = 0 To UBound($h) - 1
			$str &= $h[$n] & @CRLF
		Next
	Return $str

EndFunc   ;==>test