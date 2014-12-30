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
#EndRegion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#Region ### START Koda GUI section ### Form=
$path =@ScriptDir &  "\11.txt"
$Form1 = GUICreate("正则", 615, 438, 192, 124)
$Input1 = GUICtrlCreateInput("4.+8", 120, 340, 305, 21)
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 280)
GUICtrlSetData(-1, bb($path))
$Button1 = GUICtrlCreateButton("正则", 160, 384, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			MsgBox(0,"正则问号和加号结果",zz())
	EndSwitch
WEnd

Func bb($iDIR)
	$sFile = FileOpen($iDIR,0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc	

Func zz()
	Local $str1 = bb ($path), $str2 = GUICtrlRead($Input1)
			If StringRegExp($str1, $str2) Then;加个判断 防止不匹配时直接退出
				$h = StringRegExp($str1, $str2, 3);第三个参数选择3 是全局匹配  返回的是数组
				;_ArrayDisplay($h);列表视图查看数组 便于调试
				;ConsoleWrite($h[0]);输出调试文本  便于调试
				;MsgBox(0, "", $h[0])
				Return $h[0]
			Else
				MsgBox(0, "", "不匹配")
			EndIf
EndFunc			