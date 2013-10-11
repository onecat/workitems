#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Version=beta
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\SHELL32.dll|-22
#AutoIt3Wrapper_outfile=注册表权限设置工具.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <process.au3>
Opt("GUIOnEventMode", 1)
FileInstall("logo.jpg",@TempDir &"\regdit_set_logo.jpg",1)
#Region ### START Koda GUI section ### Form=I:\注册表权限设置工具\Form1.kxf
$Form1 = GUICreate("注册表权限设置工具    By hzxymkb", 455, 185, -1, -1);,$WS_SYSMENU)
GUISetOnEvent($GUI_EVENT_CLOSE, "Close1")
$Pic1 = GUICtrlCreatePic(@TempDir &"\regdit_set_logo.jpg", 0, 0, 455, 80)
$Group1 = GUICtrlCreateGroup("", 0, 78, 455, 106)
$Input1 = GUICtrlCreateInput("", 47, 94, 401, 21)
$Radio1 = GUICtrlCreateRadio("设置为只读访问", 127, 126, 113, 17)
$Radio2 = GUICtrlCreateRadio("设置完全访问", 239, 126, 105, 17)
$Radio3 = GUICtrlCreateRadio("设置无法访问", 343, 126, 105, 17)
$Label1 = GUICtrlCreateLabel("Everyone访问设置：", 7, 128, 109, 17)
$Button1 = GUICtrlCreateButton("设置权限", 255, 150, 75, 25)
GUICtrlSetOnEvent(-1, "setupClick")
$Button2 = GUICtrlCreateButton("定向注册表", 359, 150, 75, 25)
GUICtrlSetOnEvent(-1, "regeditClick")
$Label2 = GUICtrlCreateLabel("技术支持：AU3中文论坛", 7, 158, 176, 17)
GUICtrlSetOnEvent(-1, "Click")
$Label3 = GUICtrlCreateLabel("位置：", 7, 99, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	Sleep(100)
WEnd
Func setupClick()
	Select
		Case GUICtrlRead($Radio1) = $GUI_CHECKED ;完全控制
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[7]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "提示", "注册表权限更改成功!  ")
		Case GUICtrlRead($Radio2) = $GUI_CHECKED ;只读
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[8]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "提示", "注册表权限更改成功!  ")
		Case GUICtrlRead($Radio3) = $GUI_CHECKED ;拒绝
			FileWrite(@TempDir & "\regini.ini", GUICtrlRead($Input1) & "[]")
			_RunDOS("regini %temp%\regini.ini")
			FileDelete(@TempDir & "\regini.ini")
			MsgBox(64, "提示", "注册表权限更改成功!  ")
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
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit", "LastKey", "REG_SZ", "我的电脑\" & GUICtrlRead($Input1))
	Run("regedit.exe")
EndFunc   ;==>regeditClick
