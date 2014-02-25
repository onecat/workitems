#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
;Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘.
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("CJX规则更新小助手", 347, 188, 197, 124)
$MenuItem = GUICtrlCreateMenu("选项")
$kjqd = GUICtrlCreateMenuItem("开机启动", $MenuItem)
$zdgx = GUICtrlCreateMenuItem("自动更新", $MenuItem)
$ljgx = GUICtrlCreateMenuItem("立即更新", $MenuItem)
$yctptb = GUICtrlCreateMenuItem("隐藏托盘图标", $MenuItem)
$gy = GUICtrlCreateMenuItem("关于", $MenuItem)
$tc = GUICtrlCreateMenuItem("退出", $MenuItem)
$Label1 = GUICtrlCreateLabel("规则更新状态：", 8, 24, 88, 17)
$Label2 = GUICtrlCreateLabel("Label1", 120, 24, 36, 17)
$Label3 = GUICtrlCreateLabel("本地规则版本号：", 8, 56, 100, 17)
$Label4 = GUICtrlCreateLabel("Label1", 120, 56, 36, 17)
$Button1 = GUICtrlCreateButton("立即更新", 8, 120, 73, 33)
$Button2 = GUICtrlCreateButton("代理更新", 104, 120, 73, 33)

TrayCreateItem("开机启动") ;创建第一个菜单项
TrayItemSetOnEvent(-1,"kjqd") ;注册第一个菜单项的（被点下）事件  
TrayCreateItem("自动更新") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"zdgx") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("立即更新") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ljgx") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("隐藏托盘图标") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"yctptb") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("关于") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"guanyu") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ExitScript") ;注册第二个菜单项的（被点下）事件
TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Local $str = 'CJX规则更新小助手 程序制作 by xiaozhan\n\n致谢：奶牛开发者 规则维护者\n以及做出相关贡献的朋！'

While 1
	 	Switch GUIGetMsg()

;~ 		If $msg = $fileitem Then
;~ 			$file = FileOpenDialog("Choose file...", @TempDir, "All (*.*)")
;~ 			If @error <> 1 Then GUICtrlCreateMenuItem($file, $recentfilesmenu)
;~ 		EndIf
	Case $GUI_EVENT_CLOSE,$tc 
				Exit		
	Case $gy 
			guanyu()
	Case $kjqd
            kjqd()
	Case $zdgx
			zdgx()
	Case $yctptb
			yctptb()
	Case $ljgx
			ljgx()
	Case $Button1
			ljgx()
	Case $Button2
			
	EndSwitch	
WEnd

Func kjqd()
	If BitAND(GUICtrlRead($kjqd), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		MsgBox(0,"","选中")
;~      IniWrite(@ScriptDir & "\myfile.ini", "设置", "坏人人数", "12345")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		MsgBox(0,"","没选中")
;~      IniWrite(@ScriptDir & "\myfile.ini", "设置", "坏人人数", "54321")
	EndIf
EndFunc

Func zdgx()
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		MsgBox(0,"","选中")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		MsgBox(0,"","没选中")
	EndIf	
EndFunc	

Func yctptb()
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		MsgBox(0,"","选中")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		MsgBox(0,"","没选中")
	EndIf		
EndFunc	

Func ljgx()
	MsgBox(0,"未完成的功能","功能未完成")
EndFunc

Func guanyu()
	MsgBox(0, '关于', StringFormat($str))
EndFunc	

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>退出
