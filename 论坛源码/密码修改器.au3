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
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <process.au3>
Opt("GUIOnEventMode", 1)

$MainForm = GUICreate("密码修改器", 250, 176, 192, 114)
GUISetIcon("user.ico", -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "MainFormClose")
$Label1 = GUICtrlCreateLabel("当前用户名:", 32, 21, 67, 17)
$Input1 = GUICtrlCreateInput("", 104, 16, 113, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label2 = GUICtrlCreateLabel("输入密码:", 32, 53, 55, 17)
$Input2 = GUICtrlCreateInput("", 104, 48, 113, 21, BitOR($ES_PASSWORD,$ES_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Input2Change")
$Label3 = GUICtrlCreateLabel("确认密码:", 32, 85, 55, 17)
$Input3 = GUICtrlCreateInput("", 104, 80, 113, 21, BitOR($ES_PASSWORD,$ES_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "Input3Change")
$Button1 = GUICtrlCreateButton("修改", 32, 128, 75, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$Button2 = GUICtrlCreateButton("取消", 144, 128, 75, 25)
GUICtrlSetOnEvent(-1, "Button2Click")

GUICtrlSetData($Input1, GetLogonUserName())

GUISetState(@SW_SHOW)

While 1
        Sleep(100)
WEnd

Func Button1Click()
        Local $strUser = GUICtrlRead($Input1)
        Local $strPass1 = GUICtrlRead($Input2)
        Local $strPass2 = GUICtrlRead($Input3)
        If $strPass1 == $strPass2 Then
                If $strPass1 == "" Then
                        MsgBox(64, "消息", "密码不能为空")
                       GUICtrlSetState($Input2, $GUI_FOCUS)
                Else
                        _RunDOS("net user %username% " & $strPass1)
                        MsgBox(64, "消息", "密码修改成功")
                EndIf
        Else
                MsgBox(64, "消息", "两次输入的密码不一致, 请重新输入")
                GUICtrlSetState($Input2, $GUI_FOCUS)
        EndIf
EndFunc

Func Button2Click()
        GUICtrlSetData($Input2, "")
        GUICtrlSetData($Input3, "")
EndFunc

Func Input2Change()

EndFunc

Func Input3Change()

EndFunc

Func MainFormClose()
        DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $MainForm, "int", 500, "long", 0x00090000)
        Exit
EndFunc

Func GetLogonUserName()
        Local $strKeyPath = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer"
        Local $strValueName = "Logon User Name"

        Return RegRead($strKeyPath, $strValueName)
EndFunc