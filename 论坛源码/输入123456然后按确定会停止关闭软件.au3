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
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $time = 100
Global $Stop = 1
AdlibRegister("time")
$time1 = TimerInit()
$Form1 = GUICreate("Form1", 337, 200, 192, 124)
Global $Progress1 = GUICtrlCreateProgress(32, 40, 241, 65)
$Button1 = GUICtrlCreateButton("确定", 200, 136, 89, 49)
$Input1 = GUICtrlCreateInput("Input1", 32, 144, 153, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        If GUICtrlRead($Input1) = "123456" Then 
						 $Stop = 0
					Else	 
                        Exit
                        ; 如果输入123456 要执行其他的程序，就再这里修改~
					EndIf
                EndSwitch
        
        If $time = 0 Then Exit
WEnd
Func Time()
        If TimerDiff($time1) > 100 Then
                ;GUICtrlSetData($Label1, $time & "秒后将进入主程序!")
                GUICtrlSetData($Progress1, (100 - $time) / 1)
                $time = $time - 1
                $time1 = TimerInit()
				If $Stop = 0 Then AdlibUnRegister()
				If $time1 < 0 Then Exit
        EndIf
EndFunc   ;==>Time

;~ #include <ButtonConstants.au3>
;~ #include <EditConstants.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <ProgressConstants.au3>
;~ #include <WindowsConstants.au3>
;~ #Region ### START Koda GUI section ### Form=
;~ Global $Form1 = GUICreate("Form1", 322, 202, 192, 124)
;~ Global $Progress1 = GUICtrlCreateProgress(8, 24, 305, 17)
;~ Global $Input1 = GUICtrlCreateInput("Input1", 8, 64, 217, 21)
;~ Global $Button1 = GUICtrlCreateButton("确定", 240, 64, 65, 25)
;~ Global $Button2 = GUICtrlCreateButton("开始计时退出", 96, 120, 129, 49)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###

;~ Global $Timer = 60
;~ Global $Stop = 1

;~ _main()

;~ Func _main()
;~         While 1
;~                 $nMsg = GUIGetMsg()
;~                 Switch $nMsg
;~                         Case $GUI_EVENT_CLOSE
;~                                 Exit
;~                         Case $Button1
;~                                 If GUICtrlRead($Input1)="123456" Then $Stop = 0
;~                         Case $Button2
;~                                 AdlibRegister("_TimeExit", 100)
;~                 EndSwitch
;~         WEnd
;~ EndFunc   ;==>_main

;~ Func _TimeExit()
;~         $Timer -= 1
;~         GUICtrlSetData($Progress1, (60 - $Timer) / 60 * 100)
;~         If $Stop = 0 Then AdlibUnRegister()
;~         If $Timer < 0 Then Exit
;~ EndFunc   ;==>_TimeExit