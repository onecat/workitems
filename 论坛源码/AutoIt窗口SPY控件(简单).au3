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
#include <WindowsConstants.au3>
#include <APIConstants.au3>
#include <WinAPI.au3>
#include "SpyControl.au3"

$Form1 = GUICreate("窗口SPY - 自定义消息演示", 419, 97, -1, -1)
$Label1 = GUICtrlCreateLabel("句柄：", 65, 10, 40, 17)
$Input1 = GUICtrlCreateInput("", 110, 8, 296, 21)
$Label2 = GUICtrlCreateLabel("标题：", 65, 40, 40, 17)
$Input2 = GUICtrlCreateInput("", 110, 38, 296, 21)
$Label3 = GUICtrlCreateLabel("鼠标：", 65, 70, 40, 17)
$Input3 = GUICtrlCreateInput("", 110, 68, 296, 21)
 
$Spy1 = GUICtrlCreateSpy($Form1, 15, 15, 32, 32)
GUIRegisterMsg($WM_MYSPYMSG, "WM_MYSPYMSG")
 
GUISetState(@SW_SHOW)
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
 
        EndSwitch
WEnd
 
Func WM_MYSPYMSG($hWnd, $nMsg, $wParam, $lParam)
        If $wParam <> 0 Then
                GUICtrlSetData($Input1, $wParam)
                GUICtrlSetData($Input2, WinGetTitle($wParam))
                Local $iX = _WinAPI_LoWord($lParam)
                Local $iY = _WinAPI_HiWord($lParam)
                GUICtrlSetData($Input3, $iX & "," & $iY)
        EndIf
EndFunc



