#NoTrayIcon
#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\WINDOWS\system32\SHELL32.dll|-222
#PRE_UseUpx=n
#PRE_Res_Comment=ϵͳ���������Ϣ��ȡ���� By��1cvvvv IT���ר�ù���� Beta2
#PRE_Res_Description=ϵͳ���������Ϣ��ȡ���� By��1cvvvv IT���ר�ù���� Beta2
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_LegalCopyright=By:1cvvvv
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
If $CmdLine[0] = 1 Or $CmdLine[0] = 2 Then
	If $CmdLine[1] = "/SC" Then
		FileDelete(@HomeDrive&"\info.txt")
		RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
		$Info=FileRead(@HomeDrive&"\info.txt")
		FileDelete(@HomeDrive&"\info.txt")
		ClipPut($Info)
		Exit
	ElseIf $CmdLine[1] = "/SF" Then
		If $CmdLine[2] = "FileSave" Then
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			$Info=FileRead(@HomeDrive&"\info.txt")
			FileDelete(@HomeDrive&"\info.txt")
			$Data = FileSaveDialog("����ϵͳ��Ϣ",@DesktopDir&"\","�ı��ļ�(*.txt)",16)
			If StringRight($Data,4) = ".txt" Then
			Else
				$Data=$Data&".txt"
			EndIf
			FileDelete($Data)
			FileWrite($Data,$Info)
			Exit
		Else
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			$Info=FileRead(@HomeDrive&"\info.txt")
			FileDelete(@HomeDrive&"\info.txt")
			$Data = $CmdLine[2]
			FileDelete($Data)
			FileWrite($Data,$Info)
			Exit
		EndIf
	Else
		MsgBox(0,"����˵��","����˵��"&@CRLF&"/SC ��Ĭ��ȡ��Ϣ�����Ƶ�������"&@CRLF&"/SF FileSave ��Ĭ��ȡ��Ϣ����������ѯ�ʴ��·����"&@CRLF&"/SF [·��] ��Ĭ��ȡ��Ϣ���洢��ָ��·��������·�������ո�����·�����Լ����ţ���"&@CRLF&"By:1cvvvv")
		Exit
	EndIf
EndIf
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("ϵͳ���������Ϣ��ȡ���� By��1cvvvv IT���ר�ù����", 393, 345)
$Button1 = GUICtrlCreateButton("ˢ��", 0, 0, 49, 25)
$Button2 = GUICtrlCreateButton("���浽�ļ�", 48, 0, 75, 25)
$Button3 = GUICtrlCreateButton("���Ƶ�������", 122, 0, 75, 25)
$Edit1 = GUICtrlCreateEdit("", 0, 26, 391, 297)
$Label1 = GUICtrlCreateLabel("����Bug�뷴�����������䣺2117879346@qq.comлл��ϡ�", 0, 324, 321, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$Label2 = GUICtrlCreateLabel("���ڻ�ȡ��Ϣ�����Ժ�", 236, 4, 136, 17)
FileDelete(@HomeDrive&"\info.txt")
RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
GUICtrlSetData($Edit1,FileRead(@HomeDrive&"\info.txt"))
FileDelete(@HomeDrive&"\info.txt")
GUICtrlDelete($Label2)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			$Label2 = GUICtrlCreateLabel("���ڻ�ȡ��Ϣ�����Ժ�", 236, 4, 136, 17)
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			GUICtrlSetData($Edit1,FileRead(@HomeDrive&"\info.txt"))
			FileDelete(@HomeDrive&"\info.txt")
			GUICtrlDelete($Label2)
		Case $Button2
			$Data = FileSaveDialog("����ϵͳ��Ϣ",@DesktopDir&"\","�ı��ļ�(*.txt)",16)
			If StringRight($Data,4) = ".txt" Then
			Else
				$Data=$Data&".txt"
			EndIf
			FileDelete($Data)
			FileWrite($Data,GUICtrlRead($Edit1))
		Case $Button3
			ClipPut(GUICtrlRead($Edit1))
			MsgBox(64,"���Ƶ�������","�Ѹ��Ƶ������塣")
	EndSwitch
WEnd
