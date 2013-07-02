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
 
 
$Form = GUICreate("Form1", 633, 454, 192, 114)
$Inputuser = GUICtrlCreateInput("", 82, 90, 93, 20)
$Label = GUICtrlCreateLabel("", 186, 91, 160, 20)
$Inputpass = GUICtrlCreateInput("", 82, 120, 93, 20)
$ccccc = GUICtrlCreateButton("Check", 100, 150, 75, 25)
GUISetState(@SW_SHOW)
 
While 1
        $msg = GUIGetMsg()
        Select
                Case $msg = $GUI_EVENT_CLOSE
                        Exit
                Case $msg = $Inputuser
                        InputCheck()
        EndSelect
WEnd
 
 
Func InputCheck()
        $user = GUICtrlRead($Inputuser)
        If Not StringRegExp($user, "^[A-Za-z0-9]+$") Then
                GUICtrlSetState($Inputuser, $GUI_FOCUS)
                GUICtrlSetData($Label, "X 只允许输入英文字母和数字.")
                GUICtrlSetColor($Label, 0xFF0000)
                GUICtrlSetFont($Label, 9, 400, 0, "Tahoma")
        Else
                GUICtrlSetData($Label, "√ 输入正确.")
                GUICtrlSetFont($Label, 9, 800, 0, "Tahoma")
                GUICtrlSetColor($Label, 0x008000)
                GUICtrlSetFont($Label, 9, 400, 0, "Tahoma")
        EndIf
EndFunc   ;==>InputCheck
