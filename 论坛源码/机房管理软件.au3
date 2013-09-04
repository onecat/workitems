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
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <GuiTab.au3>
#Region ### START Koda GUI section ### Form=机房管理软件.kxf
$Form1_1 = GUICreate("机房管理软件", 438, 309, 221, 163,BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SYSMENU,$WS_GROUP,$WS_TABSTOP))
$Tab1 = GUICtrlCreateTab(0, 0, 433, 305)
_GUICtrlTab_SetItemSize($Tab1, 66, 28)
$TabSheet1 = GUICtrlCreateTabItem("机房考试前准备工作软件")
$Button1 = GUICtrlCreateButton("同步专家网吧版", 24, 40, 161, 41)
$Button2 = GUICtrlCreateButton("局域网时间同步", 24, 101, 161, 41)
$Button3 = GUICtrlCreateButton("窗口移动工具 V.01", 24, 163, 161, 41)
$Button4 = GUICtrlCreateButton("窗口移动精灵1.91", 24, 224, 161, 41)
$Button5 = GUICtrlCreateButton("更改IP地址", 246, 40, 161, 41)
$Button6 = GUICtrlCreateButton("更改计算机名与IP地址", 246, 101, 161, 41)
$Button7 = GUICtrlCreateButton("阻止U盘加载", 246, 163, 161, 41)
$Button8 = GUICtrlCreateButton("更改计算机名", 246, 224, 161, 41)
$TabSheet2 = GUICtrlCreateTabItem("系统相关软件")
$Button9 = GUICtrlCreateButton("CMD", 25, 39, 161, 41)
$Button10 = GUICtrlCreateButton("计算机管理", 25, 100, 161, 41)
$Button11 = GUICtrlCreateButton("添加或删除程序", 25, 162, 161, 41)
$Button12 = GUICtrlCreateButton("设备管理器", 25, 223, 161, 41)
$Button13 = GUICtrlCreateButton("注册表", 247, 39, 161, 41)
$Button14 = GUICtrlCreateButton("注销计算机", 247, 100, 161, 41)
$Button15 = GUICtrlCreateButton("重启计算机", 247, 162, 161, 41)
$Button16 = GUICtrlCreateButton("关闭计算机", 247, 223, 161, 41)
$TabSheet3 = GUICtrlCreateTabItem("软件破解相关软件")
$Button17 = GUICtrlCreateButton("3D不能注册的解决方法", 19, 43, 161, 41)
$Button18 = GUICtrlCreateButton("3dsmax8.0破解器", 19, 104, 161, 41)
$Button19 = GUICtrlCreateButton("CAD2006破解器", 19, 166, 161, 41)
$Button20 = GUICtrlCreateButton("天正7.5破解器", 19, 227, 161, 41)
$Button21 = GUICtrlCreateButton("序列号输入机", 241, 43, 161, 41)
$Button22 = GUICtrlCreateButton("Photoshop CS2破解器", 241, 104, 161, 41)
$Button23 = GUICtrlCreateButton("Premiere Pro 2.0破解器", 241, 166, 161, 41)
$Button24 = GUICtrlCreateButton(" Dreamweaver MX 2004破解器", 241, 227, 161, 41)
$TabSheet4 = GUICtrlCreateTabItem("网络相关软件")
$Button25 = GUICtrlCreateButton("飞鸽传书2007", 20, 41, 161, 41)
$Button26 = GUICtrlCreateButton("解决局域网共享", 20, 101, 161, 41)
$Button27 = GUICtrlCreateButton("GHOST生IP修改工具", 20, 161, 161, 41)
$Button28 = GUICtrlCreateButton("Internet属性", 20, 221, 161, 41)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                        Case $Button1
                        runwait(@ScriptDir & "\机房考试前准备工作软件\同步专家网吧版\SEBarSvr.exe")
                        Case $Button2
                        runwait(@ScriptDir & "\机房考试前准备工作软件\局域网时间同步\局域网时间同步软件.exe")
                        Case $Button3
                        runwait(@ScriptDir & "\机房考试前准备工作软件\窗口移动工具\窗口移动工具 V.01\mode.exe")
                        Case $Button4
                        runwait(@ScriptDir & "\机房考试前准备工作软件\窗口移动工具\窗口移动精灵1.91\MoveWizard.EXE")
                        Case $Button5
                        runwait(@ScriptDir & "\机房考试前准备工作软件\更改IP地址\更改IP地址.exe")
                        Case $Button6
                        runwait(@ScriptDir & "\机房考试前准备工作软件\更改计算机名与IP地址\更改计算机名与IP地址.EXE")
                        Case $Button7
                        runwait(@ScriptDir & "\机房考试前准备工作软件\阻止U盘加载\阻止U盘加载.EXE")
                        Case $Button8
                        runwait(@ScriptDir & "\机房考试前准备工作软件\更改计算机名\更改计算机名.EXE")
                        Case $Button9
                        ShellExecute("cmd.exe");CMD
                        Case $Button10
                        ShellExecute("compmgmt.msc");计算机管理
                        Case $Button11
                        ShellExecute("appwiz.cpl");添加或删除程序
                        Case $Button12
                        ShellExecute("devmgmt.msc");设备管理器
                        Case $Button13
                        runwait(@ScriptDir & "\系统相关软件\注册表\RegShortCut.exe")
                        Case $Button14
                        ShellExecute("logoff");注销计算机
                        Case $Button15
                        Shutdown(2);重启计算机
                        Case $Button16
                        ShellExecute("shutdown");关闭计算机
                        Case $Button17
                        ShellExecute("3D不能注册的解决方法.txt", "","软件破解相关软件\3ds max 8.0破解")
                        Case $Button18
                        runwait(@ScriptDir & "\软件破解相关软件\3ds max 8.0破解\3dsmax8.0破解器.exe")
                        Case $Button19
                        runwait(@ScriptDir & "\软件破解相关软件\CAD2006破解器\CAD2006破解器.exe")
                        Case $Button20
                        runwait(@ScriptDir & "\软件破解相关软件\天正7.5破解器\天正7.5破解器.exe")
                        Case $Button21
                        runwait(@ScriptDir & "\软件破解相关软件\序列号输入机\序列号输入机.exe")
                        Case $Button22
                        runwait(@ScriptDir & "\软件破解相关软件\Photoshop CS2破解器\Photoshop CS2破解器.exe")
                        Case $Button23
                        runwait(@ScriptDir & "\软件破解相关软件\Premiere Pro 2.0破解器\Premiere Pro 2.0破解器.exe")
                        Case $Button24
                        runwait(@ScriptDir & "\软件破解相关软件\Dreamweaver MX 2004破解器\Dreamweaver MX 2004破解器.exe")
                        Case $Button25
                        runwait(@ScriptDir & "\网络相关软件\飞鸽传书2007\飞鸽传书2007.exe")
                        Case $Button26
                        ShellExecute("开通局域网共享(访问本机无需验证即可进入).cmd", "","网络相关软件\解决局域网共享")
                        Case $Button27
                        runwait(@ScriptDir & "\网络相关软件\GHOST生IP修改工具\GHOST生IP修改工具.exe")
                        Case $Button28
                        ShellExecute("inetcpl.cpl");Internet属性
                        


        EndSwitch
WEnd
;control userpasswords2--------用户帐户设置