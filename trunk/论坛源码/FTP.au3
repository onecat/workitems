#Region ;**** �� AccAu3Wrapper_GUI ����ָ�� ****
#AccAu3Wrapper_Icon=C:\Documents and Settings\Administrator\����\FTP.ico
#AccAu3Wrapper_OutFile=ftp.exe
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=None
#EndRegion ;**** �� AccAu3Wrapper_GUI ����ָ�� ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("���ɴ洢ϵͳ", 275, 150, 771, 497)
$Button1 = GUICtrlCreateButton("ע���˺�", 48, 16, 75, 25)
$Button2 = GUICtrlCreateButton("�޸�����", 160, 16, 75, 25)
$Label1 = GUICtrlCreateLabel("�˺ţ�", 24, 64, 52, 25)
$User = GUICtrlCreateInput("", 80, 56, 89, 21)
$Label2 = GUICtrlCreateLabel("���룺", 24, 96, 44, 25)
$Pass = GUICtrlCreateInput("", 80, 88, 89, 21)
$bLogin = GUICtrlCreateButton("�� ½", 176, 72, 75, 25)
$Label3 = GUICtrlCreateLabel("�����ϴ�Υ�����ݣ��򲻿����㼸�Σ�", 24, 120, 236, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $bLogin;�����¼��ť
			$username = GUICtrlRead ($User)
			$password = GUICtrlRead ($Pass);����
			LOGIN($username,$password);��½����
	EndSwitch
	Switch $nMsg

                Case $GUI_EVENT_CLOSE

                        Exit

                Case $Button1

                        ShellExecute("http://192.168.0.250:88/reg.asp")



        EndSwitch


	Switch $nMsg

                Case $GUI_EVENT_CLOSE

                        Exit

                Case $Button2

                        ShellExecute("http://192.168.0.250:88/")



        EndSwitch
WEnd
Func LOGIN($username,$password);��½����
	;�����¼FTP
	$Url="ftp://" & $Username & ":" & $password & "@192.168.0.250:8888"
	;��FTP
	$oIE = Run("C:\WINDOWS\explorer.exe " & $Url & "")
EndFunc