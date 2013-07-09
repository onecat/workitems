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
#include <GuiIPAddress.au3>

Example()

Func Example()
    Local $hGUI, $hGUI_Child
    Local $tab, $tab0, $tab1
    Local $hIPAddress, $aMsg

    $hGUI = GUICreate("IP Iab", 250, 180)

    $hGUI_Child = GUICreate("", 180, 70, 15, 35, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI)
    GUISetBkColor(0xFFffff, $hGUI_Child)
    $hIPAddress = _GUICtrlIpAddress_Create($hGUI_Child, 10, 10)
    GUISetState(@SW_HIDE)

    GUISwitch($hGUI)

    $tab = GUICtrlCreateTab(10, 10, 200, 100)

    $tab0 = GUICtrlCreateTabItem("tab0")
    GUICtrlCreateButton("OK", 20, 50, 50, 20)
    GUICtrlCreateInput("", 80, 50, 70, 20)

    $tab1 = GUICtrlCreateTabItem("tab1")

    GUICtrlCreateTabItem("")


    GUISetState()

    While 1

        $aMsg = GUIGetMsg(1)
        Switch $aMsg[0]
            Case $GUI_EVENT_CLOSE
                Exit
            Case $tab
                Switch GUICtrlRead($tab)
                    Case 0
                        GUISetState(@SW_HIDE, $hGUI_Child)
                    Case 1
                        GUISetState(@SW_SHOW, $hGUI_Child)
                EndSwitch
        EndSwitch
    WEnd
EndFunc 