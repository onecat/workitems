#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\putty.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\服务器升级.exe
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
ShellExecute("putty.exe","","J:\")
WinWait("PuTTY 配置")
ControlClick("PuTTY 配置","","Edit1")
ControlSetText("PuTTY 配置","","Edit1","192.168.2.123")
ControlClick("PuTTY 配置","","Button1")
WinWait("192.168.2.123 - PuTTY")
WinActivate("192.168.2.123 - PuTTY")
 Dim $i=MsgBox(1,"注意","请输入帐号root和密码rayray后在点击确定" & @CR &"点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("putty.exe")
    Exit 
EndIf
 Dim $i=MsgBox(1,"注意","请复制服务器升级文件整个名字后在点击确定" & @CR & "点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("putty.exe")
    Exit 
EndIf
WinWait("root@localhost:~")
WinActivate("root@localhost:~")
Send("cd /home")
Send("{enter}")
WinActivate("root@localhost:/home")
Send("tar zxvf ")
 Dim $i=MsgBox(1,"注意","请在“root@localhost:~”这个窗口上面点击右键后在点击确定" & @CR & "点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("putty.exe")
    Exit 
EndIf
WinActivate("root@localhost:/home")
Send("{enter}");RS_upgrade_pack
Dim $i=MsgBox(1,"注意","请在“root@localhost:~”这个窗口上面等待文件解压完后在点击确定" & @CR & "点击“取消”重新运行本脚本")
    if  $i=2  Then
	ProcessClose("putty.exe")
    Exit 
EndIf

WinActivate("root@localhost:/home")
Send("cd ./RS_upgrade_pack")
Send("{enter}")
Sleep(2000)
Send("./RS_upgrade.sh /home/RS_upgrade_pack /home/RS_CMS_PC64")
Send("{enter}")
MsgBox(0,"注意","请等待服务器升级完成后在点击确定")
ProcessClose("putty.exe")