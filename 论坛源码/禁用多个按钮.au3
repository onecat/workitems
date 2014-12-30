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

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $gu_Form1 = GUICreate("Form1", 378, 208, -1, -1)

Global $gu_Button[4]
$gu_Button[1] = GUICtrlCreateButton("Button1", 32, 16, 129, 41)
$gu_Button[2] = GUICtrlCreateButton("Button2", 32, 64, 129, 41)
$gu_Button[3] = GUICtrlCreateButton("Button3", 32, 112, 129, 41)

Global $gu_Radio1 = GUICtrlCreateRadio("禁用按钮", 248, 112, 65, 17)
Global $gu_Radio2 = GUICtrlCreateRadio("启用按钮", 248, 136, 65, 17)

_Main()
Exit

Func _Main()
        
        GUISetState(@SW_SHOW)
        
        Local $i
        
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_Radio1
                                For $i = 1 To UBound($gu_Button, 1) - 1
                                        GUICtrlSetState($gu_Button[$i], $GUI_DISABLE)
                                Next
                        Case $gu_Radio2
                                For $i = 1 To UBound($gu_Button, 1) - 1
                                        GUICtrlSetState($gu_Button[$i], $GUI_ENABLE)
                                Next
                EndSwitch
        WEnd

EndFunc   ;==>_Main
