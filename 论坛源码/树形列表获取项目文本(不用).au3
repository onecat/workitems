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
;#include<MsgBoxDJS.au3>
#Include <GuiTreeView.au3>
HotKeySet("{ESC}", "Terminate")
HotKeySet("{F2}", "Togglepause")

Local $Paused ,$h

WinActivate("RVMS平台-车载客户端")
$1= ControlGetHandle("RVMS平台-车载客户端", "", "SysTreeView322");获取树形列表控件句柄
$hItem = _GUICtrlTreeView_FindItem($1, '珠海市',True)
msgbox(0,0,_GUICtrlTreeView_Gettext($1, $hItem))
;$index = _GUICtrlTreeView_Index($1, $hItem)
;msgbox(0,0,$index)

$2=_GUICtrlTreeView_GetText($1)
$3=_GUICtrlTreeView_GetTree($1,$2)
;$3=ControlTreeView ("RVMS平台-车载客户端", "", "SysTreeView322","Getcount",'universice|item1')
;$3=ControlTreeView ("RVMS平台-车载客户端", "", "SysTreeView322","Gettext",1)
;MsgBox(0,0,$3)
;~ ControlTreeView ("RVMS平台-车载客户端", "", "SysTreeView322", "Expand", $2)
;~ ControlTreeView ("RVMS平台-车载客户端", "", "SysTreeView322", "Expand", $2 & "|181")
;~ ControlTreeView ("RVMS平台-车载客户端", "", "SysTreeView322", "Check",  $2 & "|181" & "|CH02")

 
Func Terminate()
	Exit 0
EndFunc

Func Togglepause()
    $Paused = NOT $Paused 
	
   While $Paused 
	tooltip("暂停一会",0,0)
	sleep(100)
   tooltip("")
   WEnd
EndFunc



