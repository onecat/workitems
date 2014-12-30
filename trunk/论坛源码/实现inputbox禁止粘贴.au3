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

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 299, 136, 192, 114)
$Label1 = GUICtrlCreateLabel("禁止粘贴", 8, 8, 52, 17)
$Input1 = GUICtrlCreateInput("", 32, 48, 225, 21)
$wProcOld = GUIRegisterMsgEx($Input1, "_MyWindowProc") ;窗口子类化
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        GUIDelete($Form1)
                        Exit
        EndSwitch
WEnd
 
Func GUIRegisterMsgEx($ctrID, $funcName) ;控件id,函数名
        Local $wProcNew = DllCallbackRegister($funcName, "ptr", "hwnd;uint;long;ptr")
        Local $wProcOld = _WinAPI_SetWindowLong(GUICtrlGetHandle($ctrID), $GWL_WNDPROC, DllCallbackGetPtr($wProcNew))
        Return $wProcOld
EndFunc   ;==>GUIRegisterMsgEx
 
Func _MyWindowProc($hWnd, $uiMsg, $wParam, $lParam)
        Switch $uiMsg
                Case $WM_PASTE
                        Return 0 ;不处理这个消息
        EndSwitch
        ;向默认窗口进程传递未处理过的消息
        Return _WinAPI_CallWindowProc($wProcOld, $hWnd, $uiMsg, $wParam, $lParam)
EndFunc   ;==>_MyWindowProc
