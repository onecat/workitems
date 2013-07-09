#region ACN预处理程序参数(常用参数)
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
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#region ### START Koda GUI section ### Form=

Dim $k = 0

Dim $Circle[18], $pi = 3.14159265358979, $R = 35
$FrmWin8 = GUICreate("Win8 Circle", 280, 220, 492, 250)
GUISetBkColor(0x008080)
For $i = 0 To 14
	$Circle[$i] = GUICtrlCreateLabel("●", 200, 200, 14, 14)
	GUICtrlSetFont(-1, 11, 400, 0, "Tahoma")
	GUICtrlSetColor(-1, 0xFFFFFF)
;~ 	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xffffff, 0xFFFFFF)
;~ 	GUICtrlSetGraphic(-1, $GUI_GR_ELLIPSE, 5, 5, 5, 5)
	$x = 128 + Sin($pi * $i * 25.8 / 180) * $R
	$y = 80 - Cos($pi * $i * 25.8 / 180) * $R
	GUICtrlSetPos($Circle[$i], $x, $y)
Next
$LblText = GUICtrlCreateLabel("Starting Windows...", 55, 160, 180, 29)
GUICtrlSetFont(-1, 14, 500, 0, "微软雅黑")
GUICtrlSetColor(-1, 0xFFFFFF)
;~ GUICtrlSetState($Circle[1],$GUI_HIDE)
;~ GUICtrlSetState($Circle[2],$GUI_HIDE)
GUISetState(@SW_SHOW)
$i = 0
#endregion ### END Koda GUI section ###


;~ AdlibRegister("Turn", "60")
$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")

$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 60, "ptr", DllCallbackGetPtr($Timer))

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			 DllCall ( "user32.dll" , "int" , "KillTimer" , "hwnd" , 0, "uint" , $TimerDLL[0])
			Exit
	EndSwitch
WEnd


Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)
	Turn()
EndFunc   ;==>Timer


Func Turn()
	If Mod($k, 2) = 0 Then
		GUICtrlSetState($Circle[$i], $GUI_HIDE)
	Else
		GUICtrlSetState($Circle[$i], $GUI_show)
	EndIf
	$i += 1
	If $i > 13 Then
		$i = 0
		$k += 1
	EndIf
EndFunc   ;==>Turn
