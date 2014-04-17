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
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Timers.au3>
;~ Global $time = 30
;~ #Region ### START Koda GUI section ### Form=
;~ $Form1 = GUICreate("倒计时测试窗口", 350, 172, -1, -1)
;~ $Label1 = GUICtrlCreateLabel("30秒后将进入主程序!", 56, 32, 232, 28)
;~ GUICtrlSetFont(-1, 18, 400, 0, "楷体_GB2312")
;~ $Progress1 = GUICtrlCreateProgress(8, 88, 333, 17)
;~ $Button1 = GUICtrlCreateButton("确定(&Y)", 63, 128, 73, 25, 0)
;~ $Button2 = GUICtrlCreateButton("退出(&X)", 210, 128, 73, 25, 0)
;~ GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###
;~ TrayTip("^_^ pcbar提示", "移动键盘或鼠标将停止倒计时！", 10, 1)
;~ AdlibRegister("_timer", 1000)
;~ $timer1 = _Timer_Init()
;~ While 1
;~         $nMsg = GUIGetMsg()
;~         Switch $nMsg
;~                 Case $GUI_EVENT_CLOSE, $Button2
;~                         Exit
;~                 Case $Button1
;~                         main()
;~         EndSwitch
;~         If $time <= 0 Then
;~                 AdlibUnRegister()
;~                 main()
;~         EndIf
;~         If _Timer_GetIdleTime() <= _Timer_Diff($timer1) Then AdlibUnRegister()
;~ WEnd
;~ AdlibUnRegister()
;~ Exit
;~  
;~ Func _timer()
;~         $time -= 1
;~         GUICtrlSetData($Label1, $time & "秒后将进入主程序!")
;~         GUICtrlSetData($Progress1, (30 - $time) / 0.3)
;~         If $time <= 0 Then AdlibUnRegister()
;~ EndFunc   ;==>_timer
;~  
;~ Func main()
;~         MsgBox(0, 'test', '倒计时结束,进入主程序.', 10)
;~         ;以下为主程序
;~         Exit
;~ EndFunc   ;==>main


 
Global $time = 30
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("倒计时测试窗口", 350, 172, 193, 125)
$Label1 = GUICtrlCreateLabel("30秒后将进入主程序!", 56, 32, 232, 28)
GUICtrlSetFont(-1, 18, 400, 0, "楷体_GB2312")
$Progress1 = GUICtrlCreateProgress(8, 88, 333, 17)
$Button1 = GUICtrlCreateButton("确定(&Y)", 53, 128, 73, 25, 0)
$Button2 = GUICtrlCreateButton("退出(&X)", 210, 128, 73, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;AdlibRegister("_timer", 1000)
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE, $Button2
                        Exit
					Case $Button1
						AdlibRegister("timer",1000)
                      ; ExitLoop
        EndSwitch
        If $time <= 0 Then ExitLoop
WEnd
main()
Exit
 
Func timer()
        $time -= 1
        GUICtrlSetData($Label1, $time & "秒后将进入主程序!")
        GUICtrlSetData($Progress1, (30 - $time) / 0.3)
       If $time <= 0 Then AdlibUnRegister()
EndFunc   ;==>_timer
 
Func main()
        MsgBox(0, 'test', '倒计时结束,进入主程序.', 10)
        ;以下为主程序
EndFunc   ;==>main
