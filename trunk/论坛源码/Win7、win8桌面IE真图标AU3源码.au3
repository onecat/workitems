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
#EndRegion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <GUIConstantsEx.au3>
Opt("GUIOnEventMode", 1) ; 切换为 OnEvent 模式
Opt("TrayMenuMode", 1)
Select
	Case @OSBuild = 2600
		$mainwindow = GUICreate("WinXP桌面IE图标设置", 340, 120) ;创建窗口并返回窗口句柄
		GUICtrlCreateLabel("WinXP桌面IE图标“显示/隐藏”设置工具", 65, 15)
		$showbutton = GUICtrlCreateButton("显示WinXP桌面IE图标", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("隐藏WinXP桌面IE图标", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "XHideButton")
		GUICtrlSetOnEvent($showbutton, "XShowButton")
	Case @OSBuild = 7601
		$mainwindow = GUICreate("WIN7桌面IE图标设置", 340, 120) ;创建窗口并返回窗口句柄
		GUICtrlCreateLabel("WIN7桌面IE图标“恢复/删除”设置工具", 65, 15)
		$showbutton = GUICtrlCreateButton("恢复WIN7桌面IE图标", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("删除WIN7桌面IE图标", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "HideButton")
		GUICtrlSetOnEvent($showbutton, "ShowButton")
	Case @OSBuild > 2600 And @OSBuild < 7601 Or @OSBuild < 2600 Or @OSBuild > 7601
		$mainwindow = GUICreate("桌面IE图标设置", 340, 120) ; 创建窗口并返回窗口句柄
		GUICtrlCreateLabel("桌面IE图标“恢复/删除”设置工具", 65, 15)
		$showbutton = GUICtrlCreateButton("恢复桌面IE图标", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("删除桌面IE图标", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "HideButton")
		GUICtrlSetOnEvent($showbutton, "ShowButton")
EndSelect
		GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked") ;设置窗口关闭事件Show And hide
		GUISetState(@SW_SHOW)
While 1
	Sleep(1000) ; 不做任何事
WEnd
;### Tidy Error: Func statement without parentheses ().
Func ShowButton()
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "", "REG_SZ", "Internet Explorer")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "InfoTip", "REG_SZ", "@C:\Windows\system32\ieframe.dll,-881")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "LocalizedString", "REG_SZ", "@C:\WINDOWS\system32\ieframe.dll.mui,-880")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\DefaultIcon", "", "REG_SZ", "C:\Windows\system32\ieframe.dll,-190")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\InProcServer32", "", "REG_SZ", "C:\Windows\system32\ieframe.dll")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\InProcServer32", "ThreadingModel", "REG_SZ", "Apartment")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell", "", "REG_SZ", "OpenHomePage")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\NoAddOns", "", "REG_SZ", "在没有加载项的情况下启动(&N)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\NoAddOns\Command", "", "REG_SZ", "C:\ProgramFiles\Internet Explorer\iexplore.exeabout : NoAdd - ons")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\OpenHomePage", "", "REG_SZ", "打开主页(&H)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\OpenHomePage\Command", "", "REG_SZ", "C:\ProgramFiles\Internet Explorer\iexplore.exe")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties", "", "REG_SZ", "属性(&R)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties", "Position", "REG_SZ", "bottom")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties\command", "", "REG_SZ", "Rundll32.exe Shell32.dll, Control_RunDLLInetcpl.cpl")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\ContextMenuHandlers", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\ContextMenuHandlers\ieframe", "", "REG_SZ", "{871C5380-42A0-1069-A2EA-08002B30309D}")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\MayChangeDefaultMenu", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "", "REG_SZ", "C:\Windows\system32\ieframe.dll,-190")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideAsDeletePerUser", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideFolderVerbs", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "WantsParseDisplayName", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideOnDesktopPerUser", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "Attributes", "REG_DWORD", "0x00000030")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30308D}", "", "REG_SZ", "")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30308D}", "REG_DWORD", "0x00000000")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func HideButton()
RegDelete("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30308D}")
RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30308D}")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000001")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func XShowButton()
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000000")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func XHideButton()
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000001")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
Func CLOSEClicked()
	Exit
EndFunc   ;==>CLOSEClicked
