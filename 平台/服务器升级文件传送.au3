#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\WinSCP\WinSCP.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\服务器升级文件传送.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.1.1.0
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
MsgBox(0,"注意","运行本脚本请不要做其他操作谢谢")
#Include <GuiTreeView.au3>
ShellExecute("WinSCP.exe","","J:\WinSCP")
WinWait("WinSCP 登录")
$1= ControlGetHandle("WinSCP 登录", "", "TTreeView2");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "root@192.168.2.123")
_GUICtrlTreeView_ClickItem($1,$2,"left",True);点击树形列表项目
Sleep(500)
ControlClick("WinSCP 登录","登录","TButton14")
WinWait("root - root@192.168.2.123 - WinSCP")
WinActivate("root - root@192.168.2.123 - WinSCP")
Send("{enter}")
WinWait("/ - root@192.168.2.123 - WinSCP")
WinActivate("/ - root@192.168.2.123 - WinSCP")
Send("h")
Send("{enter}")
 Dim $i=MsgBox(1,"注意","请把要升级的文件包复制一下后点击确定" & @CR &"点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("WinSCP.exe")
    Exit 
EndIf
WinActivate("home - root@192.168.2.123 - WinSCP")
ControlClick("home - root@192.168.2.123 - WinSCP","","TPanel3")
Send("^v")
WinWait("复制")
ControlClick("复制","","TButton5")
MsgBox(0,"注意","请等待文件传送完成后在点击确定")
ProcessClose("WinSCP.exe")