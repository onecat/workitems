#NoTrayIcon
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Version=beta
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\SHELL32.dll|-22
#AutoIt3Wrapper_outfile=ע���Ȩ�����ù���.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <process.au3>
Opt("GUIOnEventMode", 1)
FileInstall("logo.jpg",@TempDir &"\regdit_set_logo.jpg",1)
#Region ### START Koda GUI section ### Form=I:\ע���Ȩ�����ù���\Form1.kxf
$Form1 = GUICreate("ע���Ȩ�����ù���    By hzxymkb", 455, 185, -1, -1);,$WS_SYSMENU)
GUISetOnEvent($GUI_EVENT_CLOSE, "Close1")
$Pic1 = GUICtrlCreatePic(@TempDir &"\regdit_set_logo.jpg", 0, 0, 455, 80)
$Group1 = GUICtrlCreateGroup("", 0, 78, 455, 106)
$Input1 = GUICtrlCreateInput("", 47, 94, 401, 21)
$Radio1 = GUICtrlCreateRadio("����Ϊֻ������", 127, 126, 113, 17)
$Radio2 = GUICtrlCreateRadio("������ȫ����", 239, 126, 105, 17)
$Radio3 = GUICtrlCreateRadio("�����޷�����", 343, 126, 105, 17)
$Label1 = GUICtrlCreateLabel("Everyone�������ã�", 7, 128, 109, 17)
$Button1 = GUICtrlCreateButton("����Ȩ��", 255, 150, 75, 25)
GUICtrlSetOnEvent(-1, "setupClick")
$Button2 = GUICtrlCreateButton("����ע���", 359, 150, 75, 25)
GUICtrlSetOnEvent(-1, "regeditClick")
$Label2 = GUICtrlCreateLabel("����֧�֣�AU3������̳", 7, 158, 176, 17)
GUICtrlSetOnEvent(-1, "Click")
$Label3 = GUICtrlCreateLabel("λ�ã�", 7, 99, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	Sleep(100)
WEnd
Func setupClick()
	Select
		Case GUICtrlRead($Radio1) = $GUI_CHECKED ;��ȫ����
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[7]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "��ʾ", "ע���Ȩ�޸��ĳɹ�!  ")
		Case GUICtrlRead($Radio2) = $GUI_CHECKED ;ֻ��
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[8]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "��ʾ", "ע���Ȩ�޸��ĳɹ�!  ")
		Case GUICtrlRead($Radio3) = $GUI_CHECKED ;�ܾ�
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "��ʾ", "ע���Ȩ�޸��ĳɹ�!  ")
	EndSelect
EndFunc   ;==>setupClick
Func Close1()
	FileDelete(@TempDir &"\regdit_set_logo.jpg")
	Exit
EndFunc   ;==>Close1
Func click()
	ShellExecute("http://www.autoitx.com")
EndFunc   ;==>click
Func regeditClick()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit", "LastKey", "REG_SZ", "�ҵĵ���\" & GUICtrlRead($Input1))
	Run("regedit.exe")
EndFunc   ;==>regeditClick
