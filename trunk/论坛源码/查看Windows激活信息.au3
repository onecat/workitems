#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\chtyfox\Desktop\新建 AutoIt v3 脚本.exe
#PRE_Compression=4
#PRE_UseX64=y
#PRE_Res_Fileversion=0.0.0.1
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
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
#include <WindowsConstants.au3>
#include <Process.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("查看Windows激活信息", 256, 114, 192, 124)
$Button1 = GUICtrlCreateButton("详细激活信息", 24, 16, 91, 25)
$Button2 = GUICtrlCreateButton("许可证信息", 152, 16, 75, 25)
$Button3 = GUICtrlCreateButton("是否彻底激活", 24, 72, 91, 25)
$Button4 = GUICtrlCreateButton("版本信息", 152, 72, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button1
			 _RunDOS("slmgr.vbs -dlv")
		Case $nMsg = $Button2
			_RunDOS("slmgr.vbs -dli")
		Case $nMsg = $Button3
			_RunDOS("slmgr.vbs -xpr")
		Case $nMsg = $Button4
			_RunDOS("Winver")
	EndSelect
WEnd

