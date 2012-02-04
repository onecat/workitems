#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=J:\VMware\vmware.exe|-1
#PRE_Outfile=C:\Users\xiaozhan\Desktop\关闭VMware Workstation所有进程.exe
#PRE_Compression=4
#PRE_Res_Comment=汉化时关闭进程
#PRE_Res_Description=汉化时关闭进程
#PRE_Res_Fileversion=1.1.0.0
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站
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

ProcessClose("vmnat.exe")
ProcessClose("vmware-authd.exe")
ProcessClose("vmware-hostd.exe")
ProcessClose("vmware-tray.exe")
ProcessClose("vmware-usbarbitrator.exe")
ProcessClose("vmnetdhcp.exe")
ProcessClose("WmiPrvSE.exe")
ProcessClose("WmiPrvSE.exe")


If Not (ProcessExists("vmnat.exe") Or ProcessExists("vmware-authd.exe") Or ProcessExists("vmware-hostd.exe") Or ProcessExists("vmware-tray.exe") Or ProcessExists("vmware-usbarbitrator.exe") Or ProcessExists("vmnetdhcp.exe") Or ProcessExists("wmiprvse.exe") Or ProcessExists("wmiprvse.exe")) Then
	MsgBox(4096, "虚拟机", "所有进程结束成功")
Else
	If ProcessExists("vmnat.exe") Then MsgBox(4096, "虚拟机", "vmnat结束进程不成功")
	If ProcessExists("vmware-authd.exe") Then MsgBox(4096, "虚拟机", "vmware-authd结束进程不成功")
	If ProcessExists("vmware-hostd.exe") Then MsgBox(4096, "虚拟机", "vmware-hostd结束进程不成功")
	If ProcessExists("vmware-tray.exe") Then MsgBox(4096, "虚拟机", "vmware-tray结束进程不成功")
	If ProcessExists("vmware-usbarbitrator.exe") Then MsgBox(4096, "虚拟机", "vmware-usbarbitrator结束进程不成功")
	If ProcessExists("vmnetdhcp.exe") Then MsgBox(4096, "虚拟机", "vmnetdhcp结束进程不成功")
	If ProcessExists("WmiPrvSE.exe") Then MsgBox(4096, "虚拟机", "WmiPrvSE结束进程不成功")
EndIf