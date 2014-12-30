#Region ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#AccAu3Wrapper_Icon=C:\Documents and Settings\Administrator\桌面\FTP.ico
#AccAu3Wrapper_OutFile=ftp.exe
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=None
#EndRegion ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("网吧存储系统", 275, 150, 771, 497)
$Button1 = GUICtrlCreateButton("注册账号", 48, 16, 75, 25)
$Button2 = GUICtrlCreateButton("修改密码", 160, 16, 75, 25)
$Label1 = GUICtrlCreateLabel("账号：", 24, 64, 52, 25)
$User = GUICtrlCreateInput("", 80, 56, 89, 21)
$Label2 = GUICtrlCreateLabel("密码：", 24, 96, 44, 25)
$Pass = GUICtrlCreateInput("", 80, 88, 89, 21)
$bLogin = GUICtrlCreateButton("登 陆", 176, 72, 75, 25)
$Label3 = GUICtrlCreateLabel("请勿上传违法内容！打不开请多点几次！", 24, 120, 236, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $bLogin;点击登录按钮
			$username = GUICtrlRead ($User)
			$password = GUICtrlRead ($Pass);密码
			LOGIN($username,$password);登陆函数
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
Func LOGIN($username,$password);登陆函数
	;定义登录FTP
	$Url="ftp://" & $Username & ":" & $password & "@192.168.0.250:8888"
	;打开FTP
	$oIE = Run("C:\WINDOWS\explorer.exe " & $Url & "")
EndFunc