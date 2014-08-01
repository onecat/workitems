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

#NoTrayIcon
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
$Form1 = GUICreate("转帖工具图片提取工具", 586, 589, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Edit1 = GUICtrlCreateEdit("", 10, 10, 565, 229)
$Edit2 = GUICtrlCreateEdit("", 10, 290, 555, 289)
$Button1 = GUICtrlCreateButton("只要图片", 90, 250, 75, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$Button2 = GUICtrlCreateButton("复制结果", 370, 250, 75, 25)
GUICtrlSetOnEvent(-1, "Button2Click")
GUISetState(@SW_SHOW)
While 1
        Sleep(100)
WEnd
Func Button1Click()
        $sss = StringRegExp(GUICtrlRead ($Edit1), '(?s)\[img\].*?\[\/img\]', 3)
        GUICtrlSetData ($Edit2,_ArrayToString ($sss,@CRLF&@CRLF))
EndFunc   ;==>Button1Click
Func Button2Click()
        ClipPut (GUICtrlRead ($Edit2))
EndFunc   ;==>Button2Click
Func Form1Close()
        Exit
EndFunc   ;==>Form1Close

