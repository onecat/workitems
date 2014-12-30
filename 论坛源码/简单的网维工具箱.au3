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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Outfile=C:\Users\Administrator\Desktop\xx\xxTools.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Smallan工具箱
#AutoIt3Wrapper_Res_Description=Smallan
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Smallan
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Administrator\Desktop\Form1.kxf
$Form1 = GUICreate("xx工具箱", 437, 470, 410, 171)
GUISetFont(9, 400, 0, "黑体")
$Button1 = GUICtrlCreateButton("打开注册表", 24, 40, 97, 33)
$Button2 = GUICtrlCreateButton("打开控制面板", 24, 80, 97, 33)
$Button3 = GUICtrlCreateButton("打开任务管理器", 24, 120, 97, 33)
$Button4 = GUICtrlCreateButton("打开命令行", 24, 160, 97, 33)
$Button5 = GUICtrlCreateButton("打开设备管理器", 24, 200, 97, 33)
$Button6 = GUICtrlCreateButton("打开磁盘管理器", 24, 240, 97, 33)
$Button7 = GUICtrlCreateButton("打开服务管理", 24, 280, 97, 33)
$Button8 = GUICtrlCreateButton("打开记事本", 24, 320, 97, 33)
$Button9 = GUICtrlCreateButton("打开画图", 24, 360, 97, 33)
$Group1 = GUICtrlCreateGroup("工作相关", 304, 16, 124, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("软件相关", 152, 16, 137, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("系统相关", 8, 16, 129, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button10 = GUICtrlCreateButton("OA办公系统", 320, 40, 92, 33)
$Button11 = GUICtrlCreateButton("技术论坛", 320, 80, 92, 33)
$Button12 = GUICtrlCreateButton("网吧留言板", 320, 120, 92, 33)
$Button13 = GUICtrlCreateButton("游戏更新查询", 320, 160, 92, 33)
$Button14 = GUICtrlCreateButton("网维大师官网", 320, 200, 92, 33)
$Button15 = GUICtrlCreateButton("死性不改's Blog", 320, 240, 92, 33)
$Button16 = GUICtrlCreateButton("网维大师论坛", 320, 280, 92, 33)
$Button17 = GUICtrlCreateButton("净网先锋下载", 320, 320, 92, 33)
$Button18 = GUICtrlCreateButton("XX官网", 320, 360, 92, 33)
$Button19 = GUICtrlCreateButton("卸载净网先锋", 168, 40, 105, 33)
$Button21 = GUICtrlCreateButton("GHOST32", 168, 80, 105, 33)
$Button22 = GUICtrlCreateButton("Mstsc远程工具", 168, 120, 105, 33)
$Button23 = GUICtrlCreateButton("Radmin远程工具", 168, 160, 105, 33)
$Button24 = GUICtrlCreateButton("VNC远程工具", 168, 200, 105, 33)
$Button25 = GUICtrlCreateButton("引导分区修复", 168, 240, 105, 33)
$Button26 = GUICtrlCreateButton("CMOS密码清除", 168, 280, 105, 33)
$Button27 = GUICtrlCreateButton("HDTunes硬盘监测", 168, 320, 105, 33)
$Button28 = GUICtrlCreateButton("OA办公插件", 168, 360, 105, 33)
$Input1 = GUICtrlCreateInput("ping 202.102.192.68", 8, 416, 281, 24)
$Button29 = GUICtrlCreateButton("运行命令", 304, 416, 121, 25)
$Label1 = GUICtrlCreateLabel("版权所有 ◎ Smallan", 100, 448, 240, 20)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        Run(@WindowsDir &"\regedit.exe");打开注册表
                Case $Button2
                        Run(@SystemDir &"\control.exe");打开控制面板
                Case $Button3
                        Run(@SystemDir &"\taskmgr.exe");打开任务管理器       
                Case $Button4
                        Run(@SystemDir &"\cmd.exe");打开命令行      
                Case $Button5
                        _RunDOS(@SystemDir &"\devmgmt.msc");打开设备管理器
                Case $Button6
                        _RunDOS(@SystemDir &"\diskmgmt.msc");打开磁盘管理器
                Case $Button7
                        _RunDOS(@SystemDir &"\services.msc");打开服务管理器
                Case $Button8
                        Run(@SystemDir &"\notepad.exe");打开音量控制程序
                Case $Button9
                        Run(@SystemDir &"\mspaint.exe");打开画图程序
                Case $Button29
                        Run(@ComSpec &" /c"&GUICtrlRead($input1));读取文本框里的内容然后运行
                Case $Button10
                        ShellExecute("http://xx.xx.xx.xx")
                Case $Button11
                        ShellExecute("http://xx.xx.xx.xx")
                Case $Button12
                        ShellExecute("http://xxx.xxx.xxx")
                Case $Button13
                        ShellExecute("http://www.icafe8.com/frontEnd/prod_game_update.html")
                Case $Button14
                        ShellExecute("http://www.icafe8.com")
                Case $Button15
                        ShellExecute("http://www.clxp.net.cn")
                Case $Button16
                        ShellExecute("http://bbs.icafe8.com")
                Case $Button17
                        ShellExecute("http://www.ah-netbar.com/sylt.asp")
                Case $Button19
                        ShellExecute("C:\YTOOLS\CleanMainPro.exe")  
                Case $Button21
                        ShellExecute("C:\YTOOLS\Ghost32.exe") 
                Case $Button22
                        ShellExecute("C:\YTOOLS\mstsc.exe") 
                Case $Button23
                        ShellExecute("C:\YTOOLS\RadminClient\Radmin.exe") 
                Case $Button24
                        ShellExecute("C:\YTOOLS\vnc.exe") 
                Case $Button25
                        ShellExecute("C:\YTOOLS\NTBOOTautofix.exe") 
                Case $Button26
                        ShellExecute("C:\YTOOLS\cmos.exe") 
                Case $Button27
                        ShellExecute("C:\YTOOLS\HDTunePro.exe") 
                Case $Button28
                        ShellExecute("http://xx.xx.xx.xx") 
                Case $Label1
        EndSwitch
WEnd