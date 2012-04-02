#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\WinSCP\WinSCP.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\服务器升级文件传送.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=3.1.0.0
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <Process.au3>
#include <WindowsConstants.au3>
#Include <GuiTreeView.au3>
$GUI_1 = GUICreate("服务器升级文件传送", 257, 153, 953, 410)
$Label1 = GUICtrlCreateLabel("注意!运行本脚本请不要做其他操作谢谢", 16, 8, 228, 17)
$Button1 = GUICtrlCreateButton("确定", 26, 98, 78, 35,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("取消", 146, 98, 78, 35)
$IPAddress1 = _GUICtrlIpAddress_Create($GUI_1, 32, 50, 185, 25)
_GUICtrlIpAddress_Set($IPAddress1, "192.168.2.0")
GUISetState(@SW_SHOW)


While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			  Exit
		  Case $nMsg = $Button1
			GUISetState(@SW_HIDE,$GUI_1)
			$IP = _GUICtrlIpAddress_Get($IPAddress1)
			_filesend()
			Exit 
		Case $nMsg = $Button2
			Exit
	EndSelect
WEnd



Func _filesend()
 Local $iPing = Ping($IP)
If $iPing = 0 Then
	WinClose($GUI_1)
	MsgBox(0,"警告","此IP地址连接不通")
	Exit
EndIf	
ShellExecute("WinSCP.exe","","J:\WinSCP")
WinWait("WinSCP 登录")
ControlClick("WinSCP 登录", "新建(&N)", "TButton6")
WinWait("WinSCP 登录","保存(&S)...")
ControlClick("WinSCP 登录", "", "TEdit3")
ControlSetText("WinSCP 登录","","TEdit3",$IP)
ControlClick("WinSCP 登录", "", "TEdit2")
ControlSetText("WinSCP 登录","","TEdit2","root")
ControlClick("WinSCP 登录", "", "TPasswordEdit1")
ControlSetText("WinSCP 登录","","TPasswordEdit1","rayray")
ControlClick("WinSCP 登录", "登录", "TButton14")
WinWait("root - root@" & $IP & " - WinSCP")
WinActivate("root - root@192.168.2.123 - WinSCP")
Send("^o")
WinWait("打开目录")
ControlClick("打开目录", "", "Edit1")
ControlSetText("打开目录", "", "Edit1","/home")
ControlClick("打开目录", "", "TButton7")
;~ Send("{enter}")
;~ WinWait("/ - root@" & $IP & " - WinSCP")
;~ WinActivate("/ - root@" & $IP & " - WinSCP")
;~ Send("h")
;~ Send("{enter}")
 Dim $i=MsgBox(1,"注意","请把要升级的文件包复制一下后点击确定" & @CR &"点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("WinSCP.exe")
    Exit 
EndIf
WinActivate("home - root@" & $IP & " - WinSCP")
ControlClick("home - root@" & $IP & " - WinSCP","","TPanel3")
Send("^v")
WinWait("复制")
ControlClick("复制","","TButton4")
MsgBox(0,"注意","请等待文件传送完成后在点击确定")
ProcessClose("WinSCP.exe")
EndFunc	

#cs
ShellExecute("WinSCP.exe","","J:\WinSCP")
WinWait("WinSCP 登录")
ControlClick("WinSCP 登录", "", "TButton6")
$1= ControlGetHandle("WinSCP 登录", "", "TTreeView2");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "root@192.168.2.123")
_GUICtrlTreeView_ClickItem($1,$2,"left",True);点击树形列表项目
Sleep(500)
ControlClick("WinSCP 登录","登录","TButton14")
#ce