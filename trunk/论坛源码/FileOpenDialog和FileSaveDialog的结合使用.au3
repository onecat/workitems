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

Opt('MustDeclareVars', 1)

Global $gu_Form1 = GUICreate('复制文件', 382, 156, -1, -1)
Global $gu_Label1 = GUICtrlCreateLabel('源文件', 24, 24 + 2, 40, 17)
Global $gu_Label2 = GUICtrlCreateLabel('目标文件', 24, 48 + 2, 52, 17)
Global $gu_Input1 = GUICtrlCreateInput('', 80, 24, 225, 21)
Global $gu_Input2 = GUICtrlCreateInput('', 80, 48, 225, 21)
Global $gu_Button1 = GUICtrlCreateButton('..', 312, 24 - 2, 33, 25)
Global $gu_Button2 = GUICtrlCreateButton('..', 312, 48 - 2, 33, 25)
Global $gu_Button3 = GUICtrlCreateButton('复制', 288, 88, 57, 33)

_Main()
Exit

Func _Main()
        GUISetState(@SW_SHOW)

        Local $ScrFile, $DestFile
        Local $r

        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_Button1
                                $r = FileOpenDialog('源文件', '', '所有文件 (*.*)')
                                If $r <> '' And FileExists($r) And $r <> GUICtrlRead($gu_Input1) Then
                                        $ScrFile = $r
                                        GUICtrlSetData($gu_Input1, $ScrFile)
                                EndIf
                        Case $gu_Button2
                                $r = FileSaveDialog('目标文件', '', '所有文件 (*.*)', 16)
                                If $r <> '' And $r <> GUICtrlRead($gu_Input2) Then
                                        $DestFile = $r
                                        GUICtrlSetData($gu_Input2, $DestFile)
                                EndIf
                        Case $gu_Button3
                                If $ScrFile <> '' And $DestFile <> '' Then
                                        TrayTip('复制', '正在复制, 请稍候...', 0, 1)
                                        FileCopy($ScrFile, $DestFile)
                                        TrayTip('复制', '完成！', 3, 1)
                                EndIf
                EndSwitch
        WEnd

EndFunc   ;==>_Main
