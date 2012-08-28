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
#include <ButtonConstants.au3>
 
Local Const $web_troubleshooting = "http://msdn.microsoft.com/en-us/library/aa394603.aspx"
Local Const $web_download = "http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=7684"
Local $hErrInfo, $website1, $website2, $Button
 
Opt("TrayMenuMode", 1)
Opt("GUIOnEventMode",1)
ShowWMIDialog()
 
 
Func ShowWMIDialog()
        ;[url]http://www.autoitx.com/viewthread.php?tid=1131&highlight=%B6%D4%BB%B0%BF%F2%2B%C1%B4%BD%D3[/url]
        $hErrInfo = GUICreate("WMI Troubleshooting", 500, 150, -1, -1, BitOR($WS_POPUPWINDOW, $WS_CAPTION), $WS_EX_TOPMOST, WinGetHandle("[CLASS:Progman]"))
        GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit" )
        GUICtrlCreateIcon(@AutoItExe, -1, 11, 11)
        GUICtrlCreateLabel("Connection not detected due to WMI problem of your computer!", 59, 11, 480, -1)
        GUICtrlSetFont (-1,10, 800, 0, "Arial") ; bold
        GUICtrlCreateLabel("You may consider WMI troubleshooting:", 59, 40, -1, -1)
        $website1 = GUICtrlCreateLabel ($web_troubleshooting, 59, 58, -1, -1)
        GuiCtrlSetFont($website1, 8.5, -1, 4) ; underlined
        GuiCtrlSetColor($website1, 0x0000ff)
        GuiCtrlSetCursor($website1, 0)
        GUICtrlSetOnEvent(-1, "OnClick")
        GUICtrlCreateLabel(@CRLF, 59, 74, -1, -1)       ; Blank line
        GUICtrlCreateLabel("and specifically try WMI Diagnosis Utility and check output:", 60, 76, -1, -1)
        $website2 = GUICtrlCreateLabel ($web_download, 59, 90, -1, -1)
        GuiCtrlSetFont($website2, 8.5, -1, 4) ; underlined
        GuiCtrlSetColor($website2, 0x0000ff)
        GuiCtrlSetCursor($website2, 0)
        GUICtrlSetOnEvent(-1, "OnClick")
        $Button = GUICtrlCreateButton ("OK", 200, 120, 75, 23, BitOR($GUI_SS_DEFAULT_BUTTON, $BS_DEFPUSHBUTTON))
        GUICtrlSetState (-1, $GUI_FOCUS)
        GUICtrlSetOnEvent(-1, "OnClick")
        GUISetState()
        While 1
                Sleep(100)
        WEnd
EndFunc
 
Func OnClick()
        Switch @GUI_CtrlId
                Case $website1
                        Run(@ComSpec & " /c " & 'start ' & $web_troubleshooting, "", @SW_HIDE)
                Case $website2
                        Run(@ComSpec & " /c " & 'start ' & $web_download, "", @SW_HIDE)
                Case $Button
                        Exit
        EndSwitch       
EndFunc
 
Func _Exit()
        Exit
EndFunc
