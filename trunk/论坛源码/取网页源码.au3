#cs
����һЩ�����õ��Ķ�����
	.�汾 2
	
	.�ӳ��� ��Դ��, �ֽڼ�
	.���� ��ַ, �ı���
	.�ֲ����� ����, ����
	.�ֲ����� bp, �ֽڼ�
	
	.��� (����.���� (��Microsoft.XMLHTTP��, ))
	����.���� (��open��, ��GET��, ��ַ, ��)
	����.���� (��send��, )
	bp �� ����.������ (��responseBody��, ).ȡ�ֽڼ� ()
	���� (bp)
	.����
	���� (���ֽڼ� (����))
	
	_INetGetSource ( $s_URL )
	��д����ʱ�ļ���ȡ��ַԴ����.
	�ɹ�: ����Դ����.
	ʧ��: ����0������@ERRORΪ1
	
	ctrl+T�������
#ce
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <INet.au3>
#Region ### START Koda GUI section ### Form=C:\Users\ilv\Desktop\Form1.kxf
$Form1 = GUICreate("ȡ��ҳԴ�� by ilv", 511, 305, 263, 121)
$Label1 = GUICtrlCreateLabel("��ַ:", 32, 35, 31, 17, $SS_LEFTNOWORDWRAP)
GUICtrlSetCursor(-1, 2)
$Input1 = GUICtrlCreateInput("http://www1.baidu.com/", 78, 31, 353, 21)
$Button1 = GUICtrlCreateButton("��ȡ", 454, 31, 33, 25)
$List1 = GUICtrlCreateInput("", 24, 72, 465, 214, $ES_MULTILINE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $Button1
			$url = GUICtrlRead($Input1)
			If $url <> "" Then GUICtrlSetData($List1, GetSource())
			Sleep(300)
			MsgBox(64, "ok", "��ȡ��ɣ�", 1)
			
;~ 			GUICtrlSetData($Input1,"����һ������")
;~ 			Local $str=GUICtrlRead($Input1)

		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
Func GetSource()
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	Sleep(300)
	Return ($return)
EndFunc   ;==>GetSource

