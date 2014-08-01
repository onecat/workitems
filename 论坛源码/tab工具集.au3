
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=..\..\..\WINDOWS\system32\SHELL32.dll

#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>

#region ### START Koda GUI section ### Form=
$Form1 = GUICreate("专用工具", 539, 337, 192, 114)
$Tab1 = GUICtrlCreateTab(18, 8, 500, 322)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$TabSheet1 = GUICtrlCreateTabItem("安装")
$Button1 = GUICtrlCreateButton("", 24, 36, 91, 25)
$Button2 = GUICtrlCreateButton("", 124, 36, 91, 25)
$Button3 = GUICtrlCreateButton("", 224, 36, 91, 25)
$Button4 = GUICtrlCreateButton("", 324, 36, 91, 25)
$Button5 = GUICtrlCreateButton("", 424, 36, 91, 25)
$Button6 = GUICtrlCreateButton("", 24, 66, 91, 25)
$Button7 = GUICtrlCreateButton("", 124, 66, 91, 25)
$Button8 = GUICtrlCreateButton("", 224, 66, 91, 25)
$Button9 = GUICtrlCreateButton("", 324, 66, 91, 25)
$Button10 = GUICtrlCreateButton("", 424, 66, 91, 25)
$Button11 = GUICtrlCreateButton("", 24, 96, 91, 25)
$Button12 = GUICtrlCreateButton("", 124, 96, 91, 25)
$Button13 = GUICtrlCreateButton("", 224, 96, 91, 25)
$Button14 = GUICtrlCreateButton("", 324, 96, 91, 25)
$Button15 = GUICtrlCreateButton("", 424, 96, 91, 25)
$Button16 = GUICtrlCreateButton("", 24, 126, 91, 25)
$Button17 = GUICtrlCreateButton("", 124, 126, 91, 25)
$Button18 = GUICtrlCreateButton("", 224, 126, 91, 25)
$Button19 = GUICtrlCreateButton("", 324, 126, 91, 25)
$Button20 = GUICtrlCreateButton("", 424, 126, 91, 25)
$TabSheet2 = GUICtrlCreateTabItem("系统安装优化")
$Button21 = GUICtrlCreateButton("系统注册表优化", 24, 36, 91, 25)
$Button22 = GUICtrlCreateButton("只读移动盘", 124, 36, 91, 25)
$Button23 = GUICtrlCreateButton("开启移动盘", 224, 36, 91, 25)
$Button24 = GUICtrlCreateButton("显示用户账户", 324, 36, 91, 25)
$Button25 = GUICtrlCreateButton("系统自动登陆管理", 424, 36, 91, 25)
$Button26 = GUICtrlCreateButton("加速开关机", 24, 66, 91, 25)
$Button27 = GUICtrlCreateButton("组策略", 124, 66, 91, 25)
$Button28 = GUICtrlCreateButton("系统配置实用程序", 224, 66, 91, 25)
$Button29 = GUICtrlCreateButton("恢复IE空白页", 324, 66, 91, 25)
$Button30 = GUICtrlCreateButton("", 424, 66, 91, 25)
$Button51 = GUICtrlCreateButton("", 24, 96, 91, 25)
$Button52 = GUICtrlCreateButton("", 124, 96, 91, 25)
$Button53 = GUICtrlCreateButton("", 224, 96, 91, 25)
$Button54 = GUICtrlCreateButton("", 324, 96, 91, 25)
$Button55 = GUICtrlCreateButton("", 424, 96, 91, 25)
$Button56 = GUICtrlCreateButton("", 24, 126, 91, 25)
$Button57 = GUICtrlCreateButton("", 124, 126, 91, 25)
$Button58 = GUICtrlCreateButton("", 224, 126, 91, 25)
$Button59 = GUICtrlCreateButton("", 324, 126, 91, 25)
$Button60 = GUICtrlCreateButton("", 424, 126, 91, 25)
$Button61 = GUICtrlCreateButton("", 24, 156, 91, 25)
$Button62 = GUICtrlCreateButton("", 124, 156, 91, 25)
$Button63 = GUICtrlCreateButton("", 224, 156, 91, 25)
$Button64 = GUICtrlCreateButton("", 324, 156, 91, 25)
$Button65 = GUICtrlCreateButton("", 424, 156, 91, 25)
$Button66 = GUICtrlCreateButton("", 24, 186, 91, 25)
$Button67 = GUICtrlCreateButton("", 124, 186, 91, 25)
$Button68 = GUICtrlCreateButton("", 224, 186, 91, 25)
$Button69 = GUICtrlCreateButton("", 324, 186, 91, 25)
$Button70 = GUICtrlCreateButton("", 424, 186, 91, 25)
$Button71 = GUICtrlCreateButton("", 24, 216, 91, 25)
$Button72 = GUICtrlCreateButton("", 124, 216, 91, 25)
$Button73 = GUICtrlCreateButton("", 224, 216, 91, 25)
$Button74 = GUICtrlCreateButton("", 324, 216, 91, 25)
$Button75 = GUICtrlCreateButton("", 424, 216, 91, 25)
$Button76 = GUICtrlCreateButton("", 24, 246, 91, 25)
$Button77 = GUICtrlCreateButton("", 124, 246, 91, 25)
$Button78 = GUICtrlCreateButton("", 224, 246, 91, 25)
$Button79 = GUICtrlCreateButton("", 324, 246, 91, 25)
$Button80 = GUICtrlCreateButton("", 424, 246, 91, 25)
$TabSheet3 = GUICtrlCreateTabItem("")
$Button31 = GUICtrlCreateButton("", 24, 36, 91, 25)
$Button32 = GUICtrlCreateButton("", 124, 36, 91, 25)
$Button33 = GUICtrlCreateButton("", 224, 36, 91, 25)
$Button34 = GUICtrlCreateButton("", 324, 36, 91, 25)
$Button35 = GUICtrlCreateButton("", 424, 36, 91, 25)
$Button36 = GUICtrlCreateButton("", 24, 66, 91, 25)
$Button37 = GUICtrlCreateButton("", 124, 66, 91, 25)
$Button38 = GUICtrlCreateButton("", 224, 66, 91, 25)
$Button39 = GUICtrlCreateButton("重启计算机", 324, 66, 91, 25)
$Button40 = GUICtrlCreateButton("退出", 424, 66, 91, 25)
$TabSheet4 = GUICtrlCreateTabItem("软件全自动化安装")
$Button41 = GUICtrlCreateButton("", 24, 36, 91, 25)
$Button42 = GUICtrlCreateButton("", 124, 36, 91, 25)
$Button43 = GUICtrlCreateButton("", 224, 36, 91, 25)
$Button44 = GUICtrlCreateButton("", 324, 36, 91, 25)
$Button45 = GUICtrlCreateButton("", 424, 36, 91, 25)
$Button46 = GUICtrlCreateButton("", 24, 66, 91, 25)
$Button47 = GUICtrlCreateButton("", 124, 66, 91, 25)
$Button48 = GUICtrlCreateButton("", 224, 66, 91, 25)
$Button49 = GUICtrlCreateButton("", 324, 66, 91, 25)
$Button50 = GUICtrlCreateButton("", 424, 66, 91, 25)
$Button81 = GUICtrlCreateButton("", 24, 96, 91, 25)
$Button82 = GUICtrlCreateButton("", 124, 96, 91, 25)
$Button83 = GUICtrlCreateButton("", 224, 96, 91, 25)
$Button84 = GUICtrlCreateButton("", 324, 96, 91, 25)
$Button85 = GUICtrlCreateButton("", 424, 96, 91, 25)
$Button86 = GUICtrlCreateButton("", 24, 126, 91, 25)
$Button87 = GUICtrlCreateButton("", 124, 126, 91, 25)
$Button88 = GUICtrlCreateButton("", 224, 126, 91, 25)
$Button89 = GUICtrlCreateButton("", 324, 126, 91, 25)
$Button90 = GUICtrlCreateButton("", 424, 126, 91, 25)
$Button91 = GUICtrlCreateButton("", 24, 156, 91, 25)
$Button92 = GUICtrlCreateButton("", 124, 156, 91, 25)
$Button93 = GUICtrlCreateButton("", 224, 156, 91, 25)
$Button94 = GUICtrlCreateButton("", 324, 156, 91, 25)
$Button95 = GUICtrlCreateButton("", 424, 156, 91, 25)
$Button96 = GUICtrlCreateButton("", 24, 186, 91, 25)
$Button97 = GUICtrlCreateButton("", 124, 186, 91, 25)
$Button98 = GUICtrlCreateButton("", 224, 186, 91, 25)
$Button99 = GUICtrlCreateButton("", 324, 186, 91, 25)
$Button100 = GUICtrlCreateButton("", 424, 186, 91, 25)
$Button101 = GUICtrlCreateButton("", 24, 216, 91, 25)
$Button102 = GUICtrlCreateButton("", 124, 216, 91, 25)
$Button103 = GUICtrlCreateButton("", 224, 216, 91, 25)
$Button104 = GUICtrlCreateButton("", 324, 216, 91, 25)
$Button105 = GUICtrlCreateButton("", 424, 216, 91, 25)
$Button106 = GUICtrlCreateButton("", 24, 246, 91, 25)
$Button107 = GUICtrlCreateButton("", 124, 246, 91, 25)
$Button108 = GUICtrlCreateButton("", 224, 246, 91, 25)
$Button109 = GUICtrlCreateButton("", 324, 246, 91, 25)
$Button110 = GUICtrlCreateButton("", 424, 246, 91, 25)
$TabSheet5 = GUICtrlCreateTabItem("常见问题解决")
$Button111 = GUICtrlCreateButton("清理系统垃圾", 24, 36, 91, 25)
$Button112 = GUICtrlCreateButton("", 124, 36, 91, 25)
$Button113 = GUICtrlCreateButton("", 224, 36, 91, 25)
$Button114 = GUICtrlCreateButton("", 324, 36, 91, 25)
$Button115 = GUICtrlCreateButton("", 424, 36, 91, 25)
$Button116 = GUICtrlCreateButton("", 24, 66, 91, 25)
$Button117 = GUICtrlCreateButton("", 124, 66, 91, 25)
$Button118 = GUICtrlCreateButton("", 224, 66, 91, 25)
$Button119 = GUICtrlCreateButton("", 324, 66, 91, 25)
$Button120 = GUICtrlCreateButton("", 424, 66, 91, 25)
$Button121 = GUICtrlCreateButton("", 24, 96, 91, 25)
$Button122 = GUICtrlCreateButton("", 124, 96, 91, 25)
$Button123 = GUICtrlCreateButton("", 224, 96, 91, 25)
$Button124 = GUICtrlCreateButton("", 324, 96, 91, 25)
$Button125 = GUICtrlCreateButton("", 424, 96, 91, 25)
$Button126 = GUICtrlCreateButton("", 24, 126, 91, 25)
$Button127 = GUICtrlCreateButton("", 124, 126, 91, 25)
$Button128 = GUICtrlCreateButton("", 224, 126, 91, 25)
$Button129 = GUICtrlCreateButton("", 324, 126, 91, 25)
$Button130 = GUICtrlCreateButton("", 424, 126, 91, 25)
$Button131 = GUICtrlCreateButton("", 24, 156, 91, 25)
$Button132 = GUICtrlCreateButton("", 124, 156, 91, 25)
$Button133 = GUICtrlCreateButton("", 224, 156, 91, 25)
$Button134 = GUICtrlCreateButton("", 324, 156, 91, 25)
$Button135 = GUICtrlCreateButton("", 424, 156, 91, 25)
$Button136 = GUICtrlCreateButton("", 24, 186, 91, 25)
$Button137 = GUICtrlCreateButton("", 124, 186, 91, 25)
$Button138 = GUICtrlCreateButton("", 224, 186, 91, 25)
$Button139 = GUICtrlCreateButton("", 324, 186, 91, 25)
$Button140 = GUICtrlCreateButton("", 424, 186, 91, 25)
$Button141 = GUICtrlCreateButton("", 24, 216, 91, 25)
$Button142 = GUICtrlCreateButton("", 124, 216, 91, 25)
$Button143 = GUICtrlCreateButton("", 224, 216, 91, 25)
$Button144 = GUICtrlCreateButton("", 324, 216, 91, 25)
$Button145 = GUICtrlCreateButton("", 424, 216, 91, 25)
$Button146 = GUICtrlCreateButton("", 24, 246, 91, 25)
$Button147 = GUICtrlCreateButton("", 124, 246, 91, 25)
$Button148 = GUICtrlCreateButton("", 224, 246, 91, 25)
$Button149 = GUICtrlCreateButton("", 324, 246, 91, 25)
$Button150 = GUICtrlCreateButton("", 424, 246, 91, 25)
GUICtrlSetState(-1, $GUI_SHOW)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			;Case $Tab1

		Case $Button1
				
		Case $Button2
			
		Case $Button3

			
		Case $Button4

			
		Case $Button5

				
		Case $Button6

			
		Case $Button7
			
		Case $Button8
			
		Case $Button9
			
		Case $Button10
			
		Case $Button11
			
		Case $Button12
			
		Case $Button13
			
		Case $Button14
			
		Case $Button15

		Case $Button16
			
		Case $Button17
			
		Case $Button18
			
		Case $Button19
			
		Case $Button20
		Case $Button21
			;系统注册表优化
			; 2禁用桌面清理向导
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz', 'NoRun', 'REG_DWORD', '0x00000001')

			; 3禁用错误报告，但在发生严重错误时通知我
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting', 'DoReport', 'REG_DWORD', '0x00000000')

			; 4禁止Windows漫游气球提醒
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Applets\Tour')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Applets\Tour', 'RunCount', 'REG_DWORD', '0x00000000')

			; 5减少开机滚动条滚动次数
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters', 'EnablePrefetcher', 'REG_DWORD', '0x00000001')

			; 6缩短XP的开关机的等待时间
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '500')

			; 7让欢迎窗口更清晰
			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop')
			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'FontSmoothing', 'REG_SZ', '2')
			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'FontSmoothingType', 'REG_DWORD', '0x00000002')


			; 9加快局域网访问速度
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}', '', 'REG_SZ', 'Printers')

			; 10加快程序运行速度
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem', 'ConfigFileAllocSize', 'REG_DWORD', '0x000001f4')

			; 11加快菜单显示速度
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'MenuShowDelay', 'REG_SZ', '0')

			; 12彻底关闭Dr_Warson
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug', 'Auto', 'REG_SZ', '0')

			; 15加速zip文件的拷贝和移动(禁用windows自带的zip功能)
			RegDelete('HKEY_CLASSES_ROOT\.zip\CompressedFolder')
			RegDelete('HKEY_CLASSES_ROOT\CLSID\{E88DCCE0-B7B3-11d1-A9F0-00AA0060FA31}')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CompressedFolder')

			; 16关闭"压缩旧文件"功能
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files')

			; 17关闭分组相似任务栏按钮
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarGlomming', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarGlomming', 'REG_DWORD', '0x00000000')

			; 18系统失败
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl')
			; 不将事件写入系统日志
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl', 'LogEvent', 'REG_DWORD', '0x00000000')
			; 不发送管理警报
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl', 'SendAlert', 'REG_DWORD', '0x00000000')
			; 禁用自动重启动
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl', 'AutoReboot', 'REG_DWORD', '0x00000000')
			; 不写入调试信息
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl', 'CrashDumpEnabled', 'REG_DWORD', '0x00000000')

			; 21禁止远程修改注册表
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg', 'RemoteRegAccess', 'REG_DWORD', '0x00000001')

			; 22开启 IE 自动缩图功能
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'Enable AutoImageResize', 'REG_SZ', 'yes')

			; 24在所有windows窗口显示状态栏
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'StatusBarOther', 'REG_DWORD', '0x00000001')

			; 25去掉右键“新建”中的公文包、BMP、WAV等
			RegDelete('HKEY_CLASSES_ROOT\.bfc\ShellNew')
			RegDelete('HKEY_CLASSES_ROOT\.doc\ShellNew')
			RegDelete('HKEY_CLASSES_ROOT\.rtf\ShellNew')
			RegDelete('HKEY_CLASSES_ROOT\.wav\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.bfc\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.doc\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.rar\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.rtf\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.zip\ShellNew')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\FlashFXP.exe')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\moviemk.exe')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\mspaint.exe')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\shimgvw.dll')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\wordpad.exe')
			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\zipfldr.dll')


			; 27删除WinXP磁盘分区的默认共享
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters', 'AutoShareServer', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters', 'AutoShareWks', 'REG_DWORD', '0x00000000')

			; 28改变最大图标缓冲
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer', 'Max Cached Icons', 'REG_SZ', '7500')

			; 29自动检测硬盘等待时间
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager', 'AutoChkTimeOut', 'REG_DWORD', '0x0')

			; 30禁止启动时弹出错误信息
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows', 'NoPopUpsOnBoot', 'REG_SZ', '1')

			; 31菜单显示速度(0,最快)
			RegWrite('HKEY_CURRENT_USER\Control Panel\desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\desktop', 'MenuShowDelay', 'REG_SZ', '0')


			; 33禁止在开始菜单显示"打印机和传真"
			; [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
			; "Start_ShowPrinters"=dword:0

			; 34禁止在开始菜单显示"帮助"
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Start_ShowHelp', 'REG_DWORD', '0x0')

			; 35禁止在开始菜单显示"设定程序访问和默认值"
			; [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
			; "Start_ShowSetProgramAccessAndDefaults"=dword:0

			; 36自动终止无响应程序
			RegWrite('HKEY_CURRENT_USER\Control Panel\desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\desktop', 'AutoEndTasks', 'REG_SZ', '1')

			; 43打开快速启动
			RegWrite('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop')
			RegWrite('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop', 'TaskbarWinXP', 'REG_BINARY', _
					'0c000000080000000200000000000000b0e22bd86457d011a96e00c04fd705a222001c000a0100001a000000010000000000' & _
					'000000000000000000004c0000000114020000000000c0000000000000468300000010000000a0b0485e898dbd0100d89ee4' & _
					'2a8dbd010045fe5e898dbd01000000000000000001000000000000000000000000000000130114001f0fe04fd020ea3a6910' & _
					'a2d808002b30309d190023443a5c0000000000000000000000000000000000cd971500310000000000af245cb9108057696e' & _
					'6e7400002000310000000000af24a3b9100050726f66696c65730050524f46494c4553001900310000000000c12408921000' & _
					'69653530302e30303000002800310000000000c124089210004170706c69636174696f6e2044617461004150504c49437e31' & _
					'002100310000000000c5229d9110004d6963726f736f6674004d4943524f537e31002900310000000000d32232a61000496e' & _
					'7465726e6574204578706c6f72657200494e5445524e7e31002400310000000000db2276ba1000517569636b204c61756e63' & _
					'6800515549434b4c7e310000008d0000001c000000010000001c000000360000000df0adba8c0000001a00000003000000e7' & _
					'182d231000000049453530305f58314300433a5c57494e4e545c50726f66696c65735c49453530302e3030305c4170706c69' & _
					'636174696f6e20446174615c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e' & _
					'6368000010000000050000a01a000000a3000000000000000800000002000000cc00000001000000030000004a0000000100' & _
					'000040003200e6010000c424159f20004c61756e636820496e7465726e6574204578706c6f7265722042726f777365722e6c' & _
					'6e6b004c41554e43487e322e4c4e4b00000040000000020000003600320048020000c424159f20004c61756e6368204f7574' & _
					'6c6f6f6b20457870726573732e6c6e6b004c41554e43487e312e4c4e4b00000036000000000000002c00320051000000ec22' & _
					'4639200053686f77204465736b746f702e7363660053484f5744457e312e53434600000052000000e0000000000000001600' & _
					'0000000000000000000016000000000000000100000001000000aa4f2868486ad0118c7800c04fd918b437020000e0000000' & _
					'00000000160000000000000000000000160000000000000001000000')

			; 44安装驱动时不搜索Windows Update(检测新的HW认证时)
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching', 'DontSearchWindowsUpdate', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching', 'DontPromptForWindowsUpdate', 'REG_DWORD', '0x00000001')

			; 45当文件没有关联的打开程序时，禁止从网络上去搜索打开类型
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'NoInternetOpenWith', 'REG_DWORD', '0x00000001')

			; 46下载完成后自动关闭
			; [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
			; "NotifyDownloadComplete"="no"

			; 47设置记事本默认为自动换行方式
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\NotePad')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\NotePad', 'fwrap', 'REG_DWORD', '0x1')

			; 48用记事本打开nfo文件
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo', 'Application', 'REG_SZ', 'NOTEPAD.EXE')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo\OpenWithList')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo\OpenWithList', 'a', 'REG_SZ', 'Explorer.exe')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo\OpenWithList', 'MRUList', 'REG_SZ', 'ba')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo\OpenWithList', 'b', 'REG_SZ', 'NOTEPAD.EXE')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.nfo\OpenWithProgids')
			; Error - "MSInfo.Document"=hex(0):

			; 48显示桌面系统图标
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons')

			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu', '{450D8FBA-AD25-11D0-98A8-0800361B1103}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu', '{20D04FE0-3AEA-1069-A2D8-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu', '{208D2C60-3AEA-1069-A2D7-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu', '{871C5380-42A0-1069-A2EA-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu', '{645FF040-5081-101B-9F08-00AA002F954E}', 'REG_DWORD', '0x00000000')

			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel', '{450D8FBA-AD25-11D0-98A8-0800361B1103}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel', '{20D04FE0-3AEA-1069-A2D8-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel', '{208D2C60-3AEA-1069-A2D7-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel', '{871C5380-42A0-1069-A2EA-08002B30309D}', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel', '{645FF040-5081-101B-9F08-00AA002F954E}', 'REG_DWORD', '0x00000000')

			; 49有可用下载时通知我但不要自动下载
			; [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update]
			; "AUOptions"=dword:00000002

			; 51不加载多余的DLL文件
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer', 'AlwaysUnloadDLL', 'REG_DWORD', '0x00000001')

			; 52关闭程序仅等待1秒_程序出错时等待0.5秒
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'HungAppTimeout', 'REG_SZ', '200')

			; 55清除共享文件夹
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\DelegateFolders')

			; 56删除图标快捷方式的字样
			RegWrite('HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer')
			RegWrite('HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer', 'Link', 'REG_BINARY', '00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer', 'Link', 'REG_BINARY', '000000')

			; 57禁用杀毒软件提醒
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center', 'AntiVirusDisableNotify', 'REG_DWORD', '0x00000001')

			; 58禁用防火墙提醒
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center', 'FirewallDisableNotify', 'REG_DWORD', '0x00000001')

			; 59禁用自动更新提醒
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center', 'UpdatesDisableNotify', 'REG_DWORD', '0x00000001')


			; 61关闭系统还原
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\srservice')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\srservice', 'Start', 'REG_DWORD', '0x00000004')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore', 'DisableSR', 'REG_DWORD', '0x00000001')


			; 63禁止分组相似任务栏按钮
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarGlomming', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarGlomming', 'REG_DWORD', '0x00000000')

			; 64用于windows不能自动设置硬盘或者光驱为DMA模式时，打开DMA模式
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0001')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0001', 'MasterDeviceTimingModeAllowed', 'REG_DWORD', '0xffffffff')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0001', 'SlaveDeviceTimingModeAllowed', 'REG_DWORD', '0xffffffff')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0002')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0002', 'MasterDeviceTimingModeAllowed', 'REG_DWORD', '0xffffffff')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\0002', 'SlaveDeviceTimingModeAllowed', 'REG_DWORD', '0xffffffff')

			; 65加速打开我的电脑和资源管理器
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc', 'Start', 'REG_DWORD', '0x00000004')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer', 'NoSaveSettings', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'NoNetCrawling', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer', 'NoRemoteRecursiveEvents', 'REG_DWORD', '0x00000001')

			; 66禁止IE“发送信息到Internet”提示
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3', '1601', 'REG_DWORD', '0x00000000')

			; 67当你第一次运行IE6时跳过Internet连接向导
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Connection Wizard')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Connection Wizard', 'Completed', 'REG_DWORD', '0x00000001')

			; 68自动接受Windows Media Player用户协议(EULA)(针对XPSP2第一次运行时)
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer', 'GroupPrivacyAcceptance', 'REG_DWORD', '0x00000001')

			; 69在任务栏显示音量图标
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\SysTray')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\SysTray', 'Services', 'REG_DWORD', '0x0000001f')

			; 70Messenger不随Outlook启动
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express')
			RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express', 'Hide Messenger', 'REG_DWORD', '0x00000002')


			; 78激活屏幕截图功能
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectDraw')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectDraw', 'EnablePrintScreen', 'REG_DWORD', '0x1')

			; 79禁止“搜索狗”、使用高级搜索
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Search Assistant')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Search Assistant', 'Actor', 'REG_SZ', '')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Search Assistant', 'SocialUI', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Search Assistant', 'UsageCount', 'REG_DWORD', '0x00000000')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Search Assistant', 'UseAdvancedSearchAlways', 'REG_DWORD', '0x00000001')

			; 80搜索所有文件类型
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ContentIndex')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ContentIndex', 'FilterFilesWithUnknownExtensions', 'REG_DWORD', '0x00000001')

			; 81在DOS中支持长文件名
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor', 'CompletionChar', 'REG_DWORD', '0x00000009')

			; 82当文件没有关联的打开程序时，禁止从网络上去搜索打开类型
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'NoInternetOpenWith', 'REG_DWORD', '0x00000001')

			; 83设置主页为空白页
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'NoUpdateCheck', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'NoJITSetup', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'Start Page', 'REG_SZ', 'about:blank')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'StatusBarOther', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main', 'StatusBarWeb', 'REG_DWORD', '0x00000001')

			; 84启用蜂鸣(打开开机音乐)
			RegWrite('HKEY_CURRENT_USER\Control Panel\Sound')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Sound', 'Beep', 'REG_SZ', 'yes')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Sound', 'ExtendedSounds', 'REG_SZ', 'yes')

			; 87加上复制和移动键
			; Error - Windows Registry Editor Version 5.00
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To', '', 'REG_SZ', '{C2FBB630-2971-11D1-A18C-00C04FD75D13}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To', '', 'REG_SZ', '{C2FBB631-2971-11D1-A18C-00C04FD75D13}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Send To')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Send To', '', 'REG_SZ', '{7BA4C740-9E81-11CF-99D3-00AA004AE837}')

			; Error - cmd中不能输入中文

			RegWrite('HKEY_CURRENT_USER\Console')

			RegWrite('HKEY_CURRENT_USER\Console', 'LoadConIme', 'REG_DWORD', '0x00000000')


			; Error - 不加载多余的DLL文件.reg
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer', 'AlwaysUnloadDLL', 'REG_DWORD', '0x00000001')

			; Error - 关闭程序仅等待1秒_程序出错时等待0.5秒.reg
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'HungAppTimeout', 'REG_SZ', '200')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'WaitToKillAppTimeout', 'REG_SZ', '1000')

			; Error - 加快菜单显示速度.reg
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'MenuShowDelay', 'REG_SZ', '0')

			; Error - 加快局域网访问速度.reg
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}', '', 'REG_SZ', 'Printers')

			; Error - 减少开机滚动条滚动次数.reg
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters', 'EnablePrefetcher', 'REG_DWORD', '0x00000001')

			; Error - 清除共享文件夹.reg
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\DelegateFolders')

			; Error - 取消快捷方式的箭头.reg
			RegWrite('HKEY_CLASSES_ROOT\lnkfile')
			RegWrite('HKEY_CLASSES_ROOT\lnkfile', '', 'REG_SZ', '快捷方式')
			RegWrite('HKEY_CLASSES_ROOT\lnkfile', 'EditFlags', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_CLASSES_ROOT\lnkfile', 'NeverShowExt', 'REG_SZ', '')

			; Error - 缩短XP的开关机的等待时间.reg
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '500')

			; Error - 自动关闭停止响应的程序.reg
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'AutoEndTasks', 'REG_DWORD', '0x00000001')

			; Error - WinXP 优化补丁.reg
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'AutoEndTasks', 'REG_SZ', '1')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'HungAppTimeout', 'REG_SZ', '50')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'WaitToKillAppTimeout', 'REG_SZ', '200')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters', 'EnablePrefetcher', 'REG_DWORD', '0x00000001')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer', 'AlwaysUnloadDLL', 'REG_DWORD', '0x00000001')

			; Error - XP开关机加速.REG
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'AutoEndTasks', 'REG_SZ', '1')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'HungAppTimeout', 'REG_SZ', '100')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'WaitToKillAppTimeout', 'REG_SZ', '500')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '500')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters', 'EnablePrefetcher', 'REG_DWORD', '0x00000005')

			; Error - 关机时自动清除开始菜单的文档记录.reg
			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer')

			RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer', 'ClearRecentDocsOnEixt', 'REG_BINARY', '01000000')

			; Error - 加快菜单显示速度.reg
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')

			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'MenuShowDelay', 'REG_SZ', '0')

			; Error - 加快程序运行速度.reg

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem', 'ConfigFileAllocSize', 'REG_DWORD', '0x000001f4')

			; Error - 加快开关机机速度,自动关闭停止响应.reg
			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop')

			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'AutoEndTasks', 'REG_SZ', '1')

			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'HungAppTimeout', 'REG_SZ', '200')

			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'WaitToKillAppTimeout', 'REG_SZ', '1000')

			; Error - 删除图标快捷方式的字样.reg
			RegWrite('HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer')

			; Error - 让欢迎窗口更清晰.reg
			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop')

			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'FontSmoothing', 'REG_SZ', '2')

			RegWrite('HKEY_USERS\.DEFAULT\Control Panel\Desktop', 'FontSmoothingType', 'REG_DWORD', '0x00000002')

			; Error - 禁止远程修改注册表.reg
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg', 'RemoteRegAccess', 'REG_DWORD', '0x00000001')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg', 'Link', 'REG_BINARY', '00000000')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C22D6D40-47D8-40FE-825A-CC7F4D88B3B8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C22D6D40-47D8-40FE-825A-CC7F4D88B3B8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4EA20CD0-BF89-4666-9DB1-B5410D27DA54}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4EA20CD0-BF89-4666-9DB1-B5410D27DA54}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7CA83CF1-3AEA-42D0-A4E3-1594FC6E48B2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7CA83CF1-3AEA-42D0-A4E3-1594FC6E48B2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8D898B17-976D-44c1-84E6-AF38842AC9EC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8D898B17-976D-44c1-84E6-AF38842AC9EC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1B0E7716-898E-48CC-9690-4E338E8DE1D3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1B0E7716-898E-48CC-9690-4E338E8DE1D3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4522DBFE-14CD-4A59-AC2A-54BADFDD6D53}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4522DBFE-14CD-4A59-AC2A-54BADFDD6D53}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\winxp')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\winxp', 'xp', 'REG_SZ', 'winxp')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B83FC273-3522-4CC6-92EC-75CC86678DA4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B83FC273-3522-4CC6-92EC-75CC86678DA4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4EDBBAEA-F509-49F6-94D1-ECEC4BE5B686}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4EDBBAEA-F509-49F6-94D1-ECEC4BE5B686}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AE02E1C-8859-4F57-9097-5A55A56A4CAF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AE02E1C-8859-4F57-9097-5A55A56A4CAF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2B8AE92B-1B55-4F37-8AB7-C6D384E4581B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2B8AE92B-1B55-4F37-8AB7-C6D384E4581B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E2F2B9D0-96B9-4B25-B90C-636ECB207D18}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E2F2B9D0-96B9-4B25-B90C-636ECB207D18}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A578C98-3C2F-4630-890B-FC04196EF420}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A578C98-3C2F-4630-890B-FC04196EF420}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF9F1C48-1A63-495A-9317-B7B71B34A9CF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF9F1C48-1A63-495A-9317-B7B71B34A9CF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8135EF31-FE8C-4C6E-A18A-F59944C3A488}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8135EF31-FE8C-4C6E-A18A-F59944C3A488}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79E0C1C0-316D-11D5-A72A-006097BFA1AC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79E0C1C0-316D-11D5-A72A-006097BFA1AC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DD7DBEA0-DDF5-49DE-85A3-215FF52E09F2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DD7DBEA0-DDF5-49DE-85A3-215FF52E09F2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1663ed61-23eb-11d2-b92f-008048fdd814}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1663ed61-23eb-11d2-b92f-008048fdd814}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41563D23-91B6-4B96-8966-B5642A1809E3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41563D23-91B6-4B96-8966-B5642A1809E3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8CC55BB0-E742-4206-8DC9-EEF6A690B73E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8CC55BB0-E742-4206-8DC9-EEF6A690B73E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5932517A-3326-4439-A708-1C98EDB5C549}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5932517A-3326-4439-A708-1C98EDB5C549}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{18F57D30-EF36-4C0E-9343-7BFA6DF79B4A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{18F57D30-EF36-4C0E-9343-7BFA6DF79B4A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{05C1004E-2596-48E5-8E26-39362985EEB9}')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{68E69AD6-1A5D-4355-9B58-FEF6E9E223BF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{68E69AD6-1A5D-4355-9B58-FEF6E9E223BF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F138084D-84D7-48CD-BEA8-04772457516E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F138084D-84D7-48CD-BEA8-04772457516E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B225B89D-5E95-4194-98E8-149993071B31}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B225B89D-5E95-4194-98E8-149993071B31}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59CCB4A0-727D-11CF-AC36-00AA00A47DD2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59CCB4A0-727D-11CF-AC36-00AA00A47DD2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92F02779-6D88-4958-8AD3-83C12D86ADC7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92F02779-6D88-4958-8AD3-83C12D86ADC7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{972566B2-93BF-41AA-B06D-5F81DB7E38E1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{972566B2-93BF-41AA-B06D-5F81DB7E38E1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{850B69E4-90DB-4F45-8621-891BF35A5B53}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{850B69E4-90DB-4F45-8621-891BF35A5B53}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8601658B-9360-00C1-AE00-00C03EA25D91}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8601658B-9360-00C1-AE00-00C03EA25D91}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{09F59435-7814-48ED-A73A-96FF861A91EB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{09F59435-7814-48ED-A73A-96FF861A91EB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5FCEA0BA-123B-469A-A27B-8EFF96FEA71D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5FCEA0BA-123B-469A-A27B-8EFF96FEA71D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9BBC1154-218D-453C-97F6-A06582224D81}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9BBC1154-218D-453C-97F6-A06582224D81}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC207F7D-3E63-4ACA-99B5-FB5F8428200C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC207F7D-3E63-4ACA-99B5-FB5F8428200C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{77FBF9B8-1D37-4FF2-9CED-192D8E3ABA6F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{77FBF9B8-1D37-4FF2-9CED-192D8E3ABA6F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{002BC4A5-C3AE-4AE1-9430-90DB2F506A58}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{002BC4A5-C3AE-4AE1-9430-90DB2F506A58}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC309509-9C51-44DC-9AB8-F2322C80D7F2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC309509-9C51-44DC-9AB8-F2322C80D7F2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{29F25158-4933-4C2F-A8C1-A7BC3A87DF3A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{29F25158-4933-4C2F-A8C1-A7BC3A87DF3A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{36CB6B28-FC08-4373-8F54-1A02E3C15B7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{36CB6B28-FC08-4373-8F54-1A02E3C15B7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5337320A-D3AF-4E46-87D8-69317CEEA5AB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5337320A-D3AF-4E46-87D8-69317CEEA5AB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{83AEDED7-3418-3A09-AECD-134A43C12CD3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{83AEDED7-3418-3A09-AECD-134A43C12CD3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CF85459D-DFA7-4028-A065-3C6D1356DCC8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CF85459D-DFA7-4028-A065-3C6D1356DCC8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF248BC9-F17D-4024-8868-71A5D22C667C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF248BC9-F17D-4024-8868-71A5D22C667C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{616D4040-5712-4F0F-BCF1-5C6420A99E14}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{616D4040-5712-4F0F-BCF1-5C6420A99E14}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{28E0FA88-ABA8-4937-A247-3031F1A11165}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{28E0FA88-ABA8-4937-A247-3031F1A11165}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{58CDB34C-B4D7-418B-A0FB-C4C8A01C2F0E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{58CDB34C-B4D7-418B-A0FB-C4C8A01C2F0E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{594BE7B2-23B0-4FAE-A2B9-0C21CC1417CE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{594BE7B2-23B0-4FAE-A2B9-0C21CC1417CE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4D33A2B3-CBFF-42C5-9A0E-4369FCE093E8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4D33A2B3-CBFF-42C5-9A0E-4369FCE093E8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52DF16E3-6C4F-4B22-8BAF-09263E463B48}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52DF16E3-6C4F-4B22-8BAF-09263E463B48}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3E3DB7F8-B26E-4A20-9749-CD3A92544108}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3E3DB7F8-B26E-4A20-9749-CD3A92544108}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A48BC95-B995-4F03-AC14-E69F0FB0B272}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A48BC95-B995-4F03-AC14-E69F0FB0B272}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D53ADB7-6AD5-4A59-BFE4-7B57D2F4AA89}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D53ADB7-6AD5-4A59-BFE4-7B57D2F4AA89}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C14D003A-DA41-4FEE-8204-62A94EAA29D1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C14D003A-DA41-4FEE-8204-62A94EAA29D1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52B88AFD-33DA-4E17-BE89-1029DE44DED6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52B88AFD-33DA-4E17-BE89-1029DE44DED6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{32B88AFD-33DA-4E17-BE89-1029DE44DED6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{32B88AFD-33DA-4E17-BE89-1029DE44DED6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{834944D2-3264-4FF8-9594-7F09F7ACBDF8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{834944D2-3264-4FF8-9594-7F09F7ACBDF8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F4B47EEA-5D5D-4055-A6B5-ED59CC3C5BB3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F4B47EEA-5D5D-4055-A6B5-ED59CC3C5BB3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C50341E9-CDC1-4377-AB88-3486CCD0FDA1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C50341E9-CDC1-4377-AB88-3486CCD0FDA1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79926508-C134-485E-B17D-8F89B52275DD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79926508-C134-485E-B17D-8F89B52275DD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2A9D94EA-33E2-4E0F-AD52-9A6B614CE1A0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2A9D94EA-33E2-4E0F-AD52-9A6B614CE1A0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{98A62E3F-A8C5-4EF0-8A00-C70CF9D18A89}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{98A62E3F-A8C5-4EF0-8A00-C70CF9D18A89}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CE7C3CF0-4B15-11D1-ABED-709549C10000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CE7C3CF0-4B15-11D1-ABED-709549C10000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{484FF54A-CC44-467E-9C31-5B89FC753007}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{484FF54A-CC44-467E-9C31-5B89FC753007}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{86BC8440-8693-4076-A144-6BAF942B40B0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{86BC8440-8693-4076-A144-6BAF942B40B0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A2A63268-7BBE-48DC-B462-7AB5812DB159}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A2A63268-7BBE-48DC-B462-7AB5812DB159}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{48038521-20FB-11D8-BC64-00B0D07A8A19}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{48038521-20FB-11D8-BC64-00B0D07A8A19}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59B92D91-8B8D-7649-BD31-951134ADB423}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59B92D91-8B8D-7649-BD31-951134ADB423}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{514D739F-3E09-436A-ABB7-783F445B2B3B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{514D739F-3E09-436A-ABB7-783F445B2B3B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{56A7DC70-E102-4408-A34A-AE06FEF01586}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{56A7DC70-E102-4408-A34A-AE06FEF01586}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{39852EFE-325B-45ef-9A60-3DBECD2DDDD5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{39852EFE-325B-45ef-9A60-3DBECD2DDDD5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F43BD772-ABDD-43b7-A96A-3E9E61946EC0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F43BD772-ABDD-43b7-A96A-3E9E61946EC0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A8739816-022C-11D6-A85D-00C04F9AEAFB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A8739816-022C-11D6-A85D-00C04F9AEAFB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{466FE5FE-9B04-4BD8-9993-C4FBDAEB7122}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{466FE5FE-9B04-4BD8-9993-C4FBDAEB7122}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CF051549-EDE1-40F5-B440-BCD646CF2C25}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CF051549-EDE1-40F5-B440-BCD646CF2C25}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5E0BC253-045F-4E78-B490-E62D6C91FED7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5E0BC253-045F-4E78-B490-E62D6C91FED7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43A8AFD1-5C9C-4ADB-BABB-407254BC0F34}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43A8AFD1-5C9C-4ADB-BABB-407254BC0F34}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{98FA5667-513F-4F15-8A15-C171477B8847}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{98FA5667-513F-4F15-8A15-C171477B8847}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15DDE989-CD45-4561-BF99-D22C0D5C2B85}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15DDE989-CD45-4561-BF99-D22C0D5C2B85}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15DDE989-CD45-4561-BF99-D22C0D5C2B74}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15DDE989-CD45-4561-BF99-D22C0D5C2B74}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F504CF55-2AA9-4752-B2DD-01D06A81D93E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F504CF55-2AA9-4752-B2DD-01D06A81D93E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D8E8710-88F8-4d6e-AD7C-1437937E82A9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D8E8710-88F8-4d6e-AD7C-1437937E82A9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{406F94F0-504F-4a40-8DFD-58B0666ABEBD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{406F94F0-504F-4a40-8DFD-58B0666ABEBD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{57421194-58FB-49ae-9B4F-FD48869B9AD4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{57421194-58FB-49ae-9B4F-FD48869B9AD4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{67A1E287-07CD-476b-AE1F-694939AB8589}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{67A1E287-07CD-476b-AE1F-694939AB8589}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7EB333-2374-4699-92C2-AA5D7F5556EB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7EB333-2374-4699-92C2-AA5D7F5556EB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{954F618B-0DEC-4D1A-9317-E0FC96F87865}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{954F618B-0DEC-4D1A-9317-E0FC96F87865}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A23817F2-733B-4BC5-8DED-C1B9B4BBF93C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A23817F2-733B-4BC5-8DED-C1B9B4BBF93C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1DF3A074-022B-4C74-8E47-3CA2B0E7E1BB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1DF3A074-022B-4C74-8E47-3CA2B0E7E1BB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-0007-5041-4354-0020E48020AF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-0007-5041-4354-0020E48020AF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D593DE91-7B41-45C2-830E-E9A99AB142AA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D593DE91-7B41-45C2-830E-E9A99AB142AA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2ECB7FB2-0333-416F-92FD-4904AD49252B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2ECB7FB2-0333-416F-92FD-4904AD49252B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{669695BC-A811-4A9D-8CDF-BA8C795F261E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{669695BC-A811-4A9D-8CDF-BA8C795F261E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{06DFEDAA-6196-11D5-BFC8-00508B4A487D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{06DFEDAA-6196-11D5-BFC8-00508B4A487D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BFC32E1D-EE75-4A48-BC60-104E11EE2431}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BFC32E1D-EE75-4A48-BC60-104E11EE2431}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EE9DD090-902D-4623-9360-FB7D8666202B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EE9DD090-902D-4623-9360-FB7D8666202B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A23B8A4-C6C9-4A68-8FA6-5F905DC8FF80}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A23B8A4-C6C9-4A68-8FA6-5F905DC8FF80}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E0C6AAD-A8E3-4E49-9DBD-786099B599A4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E0C6AAD-A8E3-4E49-9DBD-786099B599A4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ABC861A-31E7-4d91-B43B-D3C98F22A5C0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ABC861A-31E7-4d91-B43B-D3C98F22A5C0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F7B040B5-307B-4FAC-BB93-556A08156BAC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F7B040B5-307B-4FAC-BB93-556A08156BAC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A4A435CF-3583-11D4-91BD-0048546A1450}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A4A435CF-3583-11D4-91BD-0048546A1450}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D898C55-74CC-4B7C-B5F1-45913F368388}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D898C55-74CC-4B7C-B5F1-45913F368388}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C4CA6559-2CF1-48B6-96B2-8340A06FD129}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C4CA6559-2CF1-48B6-96B2-8340A06FD129}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60D3AAEB-AA39-4AE0-B2F9-E4AF0613A2A3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60D3AAEB-AA39-4AE0-B2F9-E4AF0613A2A3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4CEBBC6B-5CEE-4644-80CF-38980BAE93F6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4CEBBC6B-5CEE-4644-80CF-38980BAE93F6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9EEE0111-E81A-11D6-B1B2-444553540000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9EEE0111-E81A-11D6-B1B2-444553540000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC2D89DE-6936-4CB3-A641-94DB2CAAF67F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC2D89DE-6936-4CB3-A641-94DB2CAAF67F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3FF41DB4-33EA-4D77-9D24-180754FF76F2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3FF41DB4-33EA-4D77-9D24-180754FF76F2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A8E16533-7A2A-43F1-9EE9-901136EBA5D8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A8E16533-7A2A-43F1-9EE9-901136EBA5D8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{459CAF0F-CA9F-4d69-A1A9-B0699D07AB8A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{459CAF0F-CA9F-4d69-A1A9-B0699D07AB8A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{47833539-D0C5-4125-9FA8-0819E2EAAC93}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{47833539-D0C5-4125-9FA8-0819E2EAAC93}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4B106874-DD36-11D0-8B44-00A024DD9EFF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4B106874-DD36-11D0-8B44-00A024DD9EFF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000566-0000-0010-8000-00AA006D2EA4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000566-0000-0010-8000-00AA006D2EA4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C109664B-CEB1-420b-B353-D55A561536DD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C109664B-CEB1-420b-B353-D55A561536DD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60381D4B-8129-449A-A5F2-5417AD0571CC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60381D4B-8129-449A-A5F2-5417AD0571CC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8522F9B3-38C5-4aa4-AE40-7401F1BBC851}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8522F9B3-38C5-4aa4-AE40-7401F1BBC851}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E75B287F-2D04-11D5-BBE0-0050047AA3D1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E75B287F-2D04-11D5-BBE0-0050047AA3D1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1f0c8547-2639-4c91-b8aa-c7eca24c3163}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1f0c8547-2639-4c91-b8aa-c7eca24c3163}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DF73DF8-41E2-4fc2-8CBF-4B9407433755}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DF73DF8-41E2-4fc2-8CBF-4B9407433755}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AF9BC61-3CC5-42A7-82D1-FFC2562A7289}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AF9BC61-3CC5-42A7-82D1-FFC2562A7289}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69A72A8A-84ED-4a75-8CE7-263DBEF3E5D3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69A72A8A-84ED-4a75-8CE7-263DBEF3E5D3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A1375E1-56C2-11D6-8E45-8933A0FB5235}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A1375E1-56C2-11D6-8E45-8933A0FB5235}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{46832FF5-95B5-4654-88F4-7F5F37AD1FC2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{46832FF5-95B5-4654-88F4-7F5F37AD1FC2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C2614DA1-D197-11D3-9765-ED762A928249}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C2614DA1-D197-11D3-9765-ED762A928249}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-92EA-EC65A294AE31}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-92EA-EC65A294AE31}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{106E49CF-797A-11D2-81A2-00E02C015623}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{106E49CF-797A-11D2-81A2-00E02C015623}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{397D7D63-816E-4ECF-8761-775C932C5CF1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{397D7D63-816E-4ECF-8761-775C932C5CF1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C14DC52F-B4D9-11D5-B1E6-0050DAD7AF62}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C14DC52F-B4D9-11D5-B1E6-0050DAD7AF62}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5BBFC00A-312C-4777-A5DF-DDA65C67120C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5BBFC00A-312C-4777-A5DF-DDA65C67120C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4982D40A-C53B-4615-B15B-B5B5E98D167C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4982D40A-C53B-4615-B15B-B5B5E98D167C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C298fb42-e3e2-11d3-adcd-0050dac24e8f}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C298fb42-e3e2-11d3-adcd-0050dac24e8f}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08E1C8E1-E565-44fc-A766-C9539BB3ABB7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08E1C8E1-E565-44fc-A766-C9539BB3ABB7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9C813B33-52A2-466D-8C51-EB4189C1FF98}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9C813B33-52A2-466D-8C51-EB4189C1FF98}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2EEB4C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2EEB4C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D9B10E0-E90C-11D7-A399-B7BAC8911A3F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D9B10E0-E90C-11D7-A399-B7BAC8911A3F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92CBA277-292B-461F-9DEA-67A5C834E101}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92CBA277-292B-461F-9DEA-67A5C834E101}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{499DB658-1909-420B-931A-4A8CAEFD232F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{499DB658-1909-420B-931A-4A8CAEFD232F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{474264BC-9571-47C1-85B9-780F756DC9CE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{474264BC-9571-47C1-85B9-780F756DC9CE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000178-CD4A-447a-BCF9-6FD0096B5527}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000178-CD4A-447a-BCF9-6FD0096B5527}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C079AD60-CD4A-447a-BCF9-6FD0096B5527}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C079AD60-CD4A-447a-BCF9-6FD0096B5527}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0F660F64-F4C9-477F-8529-44181B717472}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0F660F64-F4C9-477F-8529-44181B717472}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DE88907-3E38-11D4-BEB2-CBE76C0598DD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DE88907-3E38-11D4-BEB2-CBE76C0598DD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41353F8B-78CE-48A5-BE44-153ED293D192}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41353F8B-78CE-48A5-BE44-153ED293D192}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{058FC709-D5CD-4A95-92DB-59E6488ECDA4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{058FC709-D5CD-4A95-92DB-59E6488ECDA4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{51958169-d5e3-11d1-aa42-0000e842e40a}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{51958169-d5e3-11d1-aa42-0000e842e40a}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B50FCD28-C2CC-4f3b-B755-62B086EDE4D5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B50FCD28-C2CC-4f3b-B755-62B086EDE4D5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{36A59337-6EEF-40AE-94B1-ED443A0C4740}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{36A59337-6EEF-40AE-94B1-ED443A0C4740}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{13707362-08A2-11D3-A26D-0060976E9E6A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{13707362-08A2-11D3-A26D-0060976E9E6A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C5941EE5-6DFA-11D8-86B0-0002441A9695}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C5941EE5-6DFA-11D8-86B0-0002441A9695}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FBED6A02-71FB-11D8-86B0-0002441A9695}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FBED6A02-71FB-11D8-86B0-0002441A9695}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7FDA31E-A16D-47F9-B374-78A866AC813D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7FDA31E-A16D-47F9-B374-78A866AC813D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A28C2A31-3AB0-4118-922F-F6B3184F5495}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A28C2A31-3AB0-4118-922F-F6B3184F5495}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{392BE62B-E7DE-430A-8859-0AFE677DE6E1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{392BE62B-E7DE-430A-8859-0AFE677DE6E1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3EC-FE6EB89AB529}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3EC-FE6EB89AB529}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6165D324-3AAF-4C63-B545-C7D2285BEA1C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6165D324-3AAF-4C63-B545-C7D2285BEA1C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D55490C-1BD4-4790-BA31-84D261316E28}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D55490C-1BD4-4790-BA31-84D261316E28}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0DDBB570-0396-44C9-986A-8F6F61A51C2F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0DDBB570-0396-44C9-986A-8F6F61A51C2F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D34F641F-5210-4EB0-8ED5-9179F47E15B7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D34F641F-5210-4EB0-8ED5-9179F47E15B7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5F5564AC-DE7A-4DCD-9296-32E71A35DCB7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5F5564AC-DE7A-4DCD-9296-32E71A35DCB7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3A6514CD-A457-11D4-8AF3-000102686B79}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3A6514CD-A457-11D4-8AF3-000102686B79}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3E8A1971-45A5-45EE-828B-8C78431C0BD4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3E8A1971-45A5-45EE-828B-8C78431C0BD4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{769a6fad-c100-4af9-9bf9-439e05ba1542}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{769a6fad-c100-4af9-9bf9-439e05ba1542}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0D4312E2-5E4D-4A27-A9D8-043E43904277}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0D4312E2-5E4D-4A27-A9D8-043E43904277}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A1DC3241-B122-195F-B21A-000000000000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A1DC3241-B122-195F-B21A-000000000000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9B35A850-66AB-4C6D-8A66-136ECADCD904}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9B35A850-66AB-4C6D-8A66-136ECADCD904}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EAD0B31D-9DAE-42CE-9821-EF9794AEC515}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EAD0B31D-9DAE-42CE-9821-EF9794AEC515}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{327C2873-E90D-4c37-AA9D-10AC9BABA46C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{327C2873-E90D-4c37-AA9D-10AC9BABA46C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F20AE630-6DE2-43CA-A988-7CD40C36EF0B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F20AE630-6DE2-43CA-A988-7CD40C36EF0B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF905E0C-CFE9-4A90-AFFF-C13AF5D908F0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF905E0C-CFE9-4A90-AFFF-C13AF5D908F0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-8633-1405-0B53-2C8830E9FAEC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-8633-1405-0B53-2C8830E9FAEC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D854FC15-D3EA-496A-B2A0-A772A3DE1D09}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D854FC15-D3EA-496A-B2A0-A772A3DE1D09}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{387EDF53-1CF2-4523-BC2F-13462651BE8C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{387EDF53-1CF2-4523-BC2F-13462651BE8C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A097840A-61F8-4B89-8693-F68F641CC838}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A097840A-61F8-4B89-8693-F68F641CC838}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D157330A-9EF3-49F8-9A67-4141AC41ADD4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D157330A-9EF3-49F8-9A67-4141AC41ADD4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D8F256B-6AB8-4398-8F86-1E56207DB77A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D8F256B-6AB8-4398-8F86-1E56207DB77A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49E0E0F0-5C30-11D4-945D-010002000012}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49E0E0F0-5C30-11D4-945D-010002000012}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E1089BC-1AE8-4685-8D77-6721E5C318A8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E1089BC-1AE8-4685-8D77-6721E5C318A8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6596829B-37D4-40ad-971B-1E9041725C52}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6596829B-37D4-40ad-971B-1E9041725C52}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{29F7B7FA-ADC8-48ea-9E1C-EA87A05AE642}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{29F7B7FA-ADC8-48ea-9E1C-EA87A05AE642}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6656B666-992F-4D74-8588-8CAC9E79D90C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6656B666-992F-4D74-8588-8CAC9E79D90C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6656B666-992F-4D74-8588-8CA69E97D90C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6656B666-992F-4D74-8588-8CA69E97D90C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3E3F04C-F98C-4295-95EF-41C57425B077}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3E3F04C-F98C-4295-95EF-41C57425B077}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{093CAF40-3BA6-4071-A050-E830CBDC6480}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{093CAF40-3BA6-4071-A050-E830CBDC6480}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4178A354-348B-11D3-9AB2-00805F1A0ADB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4178A354-348B-11D3-9AB2-00805F1A0ADB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E6B64F67-B100-4636-8D51-D113E1F5FF93}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E6B64F67-B100-4636-8D51-D113E1F5FF93}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52D9BB0E-07DF-11D5-AE44-444553540000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52D9BB0E-07DF-11D5-AE44-444553540000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E7AFFF2A-1B57-49C7-BF6B-E5123394C970}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E7AFFF2A-1B57-49C7-BF6B-E5123394C970}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{30192F8D-0958-44E6-B54D-331FD39AC959}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{30192F8D-0958-44E6-B54D-331FD39AC959}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFB2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFB2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFB1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFB1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FD9BC004-8331-4457-B830-4759FF704C22}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FD9BC004-8331-4457-B830-4759FF704C22}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF1BF4C7-4E08-4A28-A43F-9D60A9F7A880}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF1BF4C7-4E08-4A28-A43F-9D60A9F7A880}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC97B254-B2B9-4D40-971D-78E0978F5F26}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC97B254-B2B9-4D40-971D-78E0978F5F26}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DC99E960-6594-45E3-9D5D-141D825B8096}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DC99E960-6594-45E3-9D5D-141D825B8096}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F79AD27F-8140-4E33-8B1D-C4FC6B663CCA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F79AD27F-8140-4E33-8B1D-C4FC6B663CCA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{38D2A281-0444-433C-9ED6-A2851795F32A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{38D2A281-0444-433C-9ED6-A2851795F32A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FB986A68-EAE4-11D4-9BD1-0080C6F60B6A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FB986A68-EAE4-11D4-9BD1-0080C6F60B6A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{10954C80-4F0F-11d3-B17C-00C0DFE39736}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{10954C80-4F0F-11d3-B17C-00C0DFE39736}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D8FA0364-7866-40A7-B340-A6069265AD9F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D8FA0364-7866-40A7-B340-A6069265AD9F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C81B5180-AFD1-41A3-97E1-99E8D254DB98}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C81B5180-AFD1-41A3-97E1-99E8D254DB98}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{31B7EB4E-8B4B-11D1-A789-00A0CC6651A8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{31B7EB4E-8B4B-11D1-A789-00A0CC6651A8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A7532940-DB22-4B10-BE6A-B467E5330745}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A7532940-DB22-4B10-BE6A-B467E5330745}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{21301D69-B8F1-46AA-B0B5-09EE2285914C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{21301D69-B8F1-46AA-B0B5-09EE2285914C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8333C319-0669-4893-A418-F56D9249FCA6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8333C319-0669-4893-A418-F56D9249FCA6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D4003A01-9B2C-4e24-9CD2-8D7DB1BDE096}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D4003A01-9B2C-4e24-9CD2-8D7DB1BDE096}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0FC817C2-3B45-11D4-8340-0050DA825906}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0FC817C2-3B45-11D4-8340-0050DA825906}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{45AD732C-2CE2-4666-B366-B2214AD57A49}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{45AD732C-2CE2-4666-B366-B2214AD57A49}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6986A6CF-9D58-11D6-91C2-00E02964E8E3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6986A6CF-9D58-11D6-91C2-00E02964E8E3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9B4AA442-9EBF-11D5-8C11-0050DA4957F5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9B4AA442-9EBF-11D5-8C11-0050DA4957F5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{72EFCEB7-436E-11D3-93ED-0008C7396667}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{72EFCEB7-436E-11D3-93ED-0008C7396667}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B3269F9A-6521-4793-A951-3E9A9B2E55E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B3269F9A-6521-4793-A951-3E9A9B2E55E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{777D0B4C-75C9-4874-ABFF-80B4BE8DC532}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{777D0B4C-75C9-4874-ABFF-80B4BE8DC532}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49A69FA0-2678-45CD-A069-6ACC372B20F8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49A69FA0-2678-45CD-A069-6ACC372B20F8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EBB03E3E-020A-418D-B322-761B730CA860}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EBB03E3E-020A-418D-B322-761B730CA860}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ACD11BD-4CA0-4283-A8D8-872B9BA289B6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ACD11BD-4CA0-4283-A8D8-872B9BA289B6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D319662B-D5BF-4538-ADF3-8D3E36362608}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D319662B-D5BF-4538-ADF3-8D3E36362608}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D7F30B62-8269-41AF-9539-B2697FA7D77E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D7F30B62-8269-41AF-9539-B2697FA7D77E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4B5F2E08-6F39-479A-B547-B2026E4C7EDF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4B5F2E08-6F39-479A-B547-B2026E4C7EDF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C77E900A-FF55-400E-9BAA-E042C8212898}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C77E900A-FF55-400E-9BAA-E042C8212898}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{46AE04C0-BCFA-4728-90E7-00EB4A8B3863}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{46AE04C0-BCFA-4728-90E7-00EB4A8B3863}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{001F2570-5DF5-11d3-B991-00A0C9BB0874}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{001F2570-5DF5-11d3-B991-00A0C9BB0874}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4401FDC3-7996-4774-8D2B-C1AE9CD6CC25}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4401FDC3-7996-4774-8D2B-C1AE9CD6CC25}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2EED3B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2EED3B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EA4587EB-3106-448a-8B31-F1572E981765}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EA4587EB-3106-448a-8B31-F1572E981765}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FB-FA62BD92B438}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FB-FA62BD92B438}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F264E777-7AB7-4BEB-8A42-5C37C8F4B6B4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F264E777-7AB7-4BEB-8A42-5C37C8F4B6B4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F57D17AE-CE37-4bc8-B232-EA57747BE5E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F57D17AE-CE37-4bc8-B232-EA57747BE5E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E9147A0A-A866-4214-B47C-DA821891240F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E9147A0A-A866-4214-B47C-DA821891240F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD63B399BC7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD63B399BC7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD63B29BB37D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD63B29BB37D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3CEFF6CD-6F08-4E4D-BCCD-FF7415288C3B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3CEFF6CD-6F08-4E4D-BCCD-FF7415288C3B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DBAFCCF-592F-FFFF-FFFF-00608CEC297B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DBAFCCF-592F-FFFF-FFFF-00608CEC297B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{04719991-296F-4958-AA0F-FA25FFA5008B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{04719991-296F-4958-AA0F-FA25FFA5008B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3F01312-8A3D-4D41-A4FA-FB61D295CB6B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3F01312-8A3D-4D41-A4FA-FB61D295CB6B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B6598677-4B54-42A9-BA67-8B64E3FCD92D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B6598677-4B54-42A9-BA67-8B64E3FCD92D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B418B139-414D-4374-820F-EE74520C5A0D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B418B139-414D-4374-820F-EE74520C5A0D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DB0018A2-F7D9-4B71-9651-640143DF23F9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DB0018A2-F7D9-4B71-9651-640143DF23F9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4580026C-022A-4FDA-87BC-EDA848D0B7A6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4580026C-022A-4FDA-87BC-EDA848D0B7A6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A041B850-57AD-493F-8FDC-4F1B15C0D16F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A041B850-57AD-493F-8FDC-4F1B15C0D16F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{55910916-8B4E-4C1E-9253-CCE296EA71EB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{55910916-8B4E-4C1E-9253-CCE296EA71EB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3d7247e8-5db8-11d4-8a72-0050da2ee1be}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3d7247e8-5db8-11d4-8a72-0050da2ee1be}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D7247DE-5DB8-11D4-8A72-0050DA2EE1BE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D7247DE-5DB8-11D4-8A72-0050DA2EE1BE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4CC0FAF8-6048-421C-9FE2-261A9ECE5F80}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4CC0FAF8-6048-421C-9FE2-261A9ECE5F80}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{337D0C1D-4053-4FAB-AF2B-45C2F7B0FAA6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{337D0C1D-4053-4FAB-AF2B-45C2F7B0FAA6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{665ACD90-4541-4836-9FE4-062386BB8F05}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{665ACD90-4541-4836-9FE4-062386BB8F05}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1402DF89-8043-44E9-AFE8-CB3DB644EF7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1402DF89-8043-44E9-AFE8-CB3DB644EF7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DDF45E0-9271-11D5-B1C2-000255705902}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3DDF45E0-9271-11D5-B1C2-000255705902}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{47CC4DCD-BBC9-47A3-A677-44DB2559E0D8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{47CC4DCD-BBC9-47A3-A677-44DB2559E0D8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8B68564D-53FD-4293-B80C-993A9F3988EE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8B68564D-53FD-4293-B80C-993A9F3988EE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08DBDE36-DF28-11D5-8CA5-0050DA44A764}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08DBDE36-DF28-11D5-8CA5-0050DA44A764}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D4DB7D2-6EC9-47A3-BD87-1E41684E07BB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1D4DB7D2-6EC9-47A3-BD87-1E41684E07BB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E5F0222-96B9-11D3-8997-00104BD12D94}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E5F0222-96B9-11D3-8997-00104BD12D94}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{54E7E082-1DA6-412E-96B5-C290FCEF5329}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{54E7E082-1DA6-412E-96B5-C290FCEF5329}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4006E7B2-0FB2-4345-B388-083B138E80AF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4006E7B2-0FB2-4345-B388-083B138E80AF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C41A1C0E-EA6C-11D4-B1B8-444553540000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C41A1C0E-EA6C-11D4-B1B8-444553540000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1FEA39D6-46B3-4F66-BC38-4839CFE198EA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1FEA39D6-46B3-4F66-BC38-4839CFE198EA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41C098D1-A36B-11d4-9F8C-00E07D02355A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41C098D1-A36B-11d4-9F8C-00E07D02355A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DE614603-6320-4046-A7A7-6A69CEC26F14}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DE614603-6320-4046-A7A7-6A69CEC26F14}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{20E5DE3E-3D2C-4E4F-969E-6C3F00354BC7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{20E5DE3E-3D2C-4E4F-969E-6C3F00354BC7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6CB5E471-C305-11D3-99A8-000086395495}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6CB5E471-C305-11D3-99A8-000086395495}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22941A26-7033-432C-94C7-6371DE343822}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22941A26-7033-432C-94C7-6371DE343822}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{AA58ED58-01DD-4d91-8333-CF10577473F7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{AA58ED58-01DD-4d91-8333-CF10577473F7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{165EAF06-A068-4BE1-8418-D92B2A196878}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{165EAF06-A068-4BE1-8418-D92B2A196878}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E06E2E99-0AA1-11D4-ABA6-0060082AA75C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E06E2E99-0AA1-11D4-ABA6-0060082AA75C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F326B8F-CE7F-4C98-96A1-AC7A2B61D742}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F326B8F-CE7F-4C98-96A1-AC7A2B61D742}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F326B8F-CE7F-4C98-96A1-AC7A2B61D742}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F326B8F-CE7F-4C98-96A1-AC7A2B61D742}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{04047354-D353-11D2-B3EB-0060B03C5581}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{04047354-D353-11D2-B3EB-0060B03C5581}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C733AE47-6AC0-4837-93DA-70278E88E7B2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C733AE47-6AC0-4837-93DA-70278E88E7B2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{37C8204D-97C3-4127-BB28-1BFF3FA2F7DA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{37C8204D-97C3-4127-BB28-1BFF3FA2F7DA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{316AEF8D-3C37-423E-9E6E-13820A9DC37A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{316AEF8D-3C37-423E-9E6E-13820A9DC37A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02DCA195-602B-4B1F-83FF-381B7E804BDB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02DCA195-602B-4B1F-83FF-381B7E804BDB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC4C5EAE-66EE-11D4-BC67-0000E8E582D2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC4C5EAE-66EE-11D4-BC67-0000E8E582D2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{03C543A1-C090-418F-A1D0-FB96380D601D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{03C543A1-C090-418F-A1D0-FB96380D601D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69FD62B1-0216-4C31-8D55-840ED86B7C8F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69FD62B1-0216-4C31-8D55-840ED86B7C8F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{204F937E-519E-4597-96FA-8F1F59F3CB6D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{204F937E-519E-4597-96FA-8F1F59F3CB6D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B2847E28-5D7D-4DEB-8B67-05D28BCF79F5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B2847E28-5D7D-4DEB-8B67-05D28BCF79F5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A5483501-070C-41DD-AF44-9BD8864B3015}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A5483501-070C-41DD-AF44-9BD8864B3015}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6A85D97D-665D-4825-8341-9501AD9F56A3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6A85D97D-665D-4825-8341-9501AD9F56A3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{63B78BC1-A711-4D46-AD2F-C581AC420D41}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{63B78BC1-A711-4D46-AD2F-C581AC420D41}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{339BB23F-A864-48C0-A59F-29EA915965EC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{339BB23F-A864-48C0-A59F-29EA915965EC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A5CF411-F0BF-4AF8-A2A4-8233F3109BED}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A5CF411-F0BF-4AF8-A2A4-8233F3109BED}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{123249EB-F891-44C4-946F-450064F9080E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{123249EB-F891-44C4-946F-450064F9080E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60C718BD-2471-44E4-AFCF-6625BEB620BF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60C718BD-2471-44E4-AFCF-6625BEB620BF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69135BDE-5FDC-4B61-98AA-82AD2091BCCC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69135BDE-5FDC-4B61-98AA-82AD2091BCCC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{556DDE35-E955-11D0-A707-000000521958}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{556DDE35-E955-11D0-A707-000000521958}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B24BA06E-FB7B-4757-95C2-DC01125F750E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B24BA06E-FB7B-4757-95C2-DC01125F750E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49E0E0F0-5C30-11D4-945D-000000000000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{49E0E0F0-5C30-11D4-945D-000000000000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{447160CD-ECF5-4EA2-8A8A-1F70CA363F85}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{447160CD-ECF5-4EA2-8A8A-1F70CA363F85}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BD51AEC6-7991-4A60-94D6-D5FEBB655D10}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BD51AEC6-7991-4A60-94D6-D5FEBB655D10}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A114D52B-870C-4F15-8021-B6D7F91A054B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A114D52B-870C-4F15-8021-B6D7F91A054B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60E78CAC-E9A7-4302-B9EE-8582EDE22FBF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{60E78CAC-E9A7-4302-B9EE-8582EDE22FBF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{676058E4-89BD-11D6-8A8C-0050BA8452C0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{676058E4-89BD-11D6-8A8C-0050BA8452C0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{61D029AC-972B-49FE-A155-962DFA0A37BB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{61D029AC-972B-49FE-A155-962DFA0A37BB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C82B55F0-60E0-478C-BC55-E4E22F11301D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C82B55F0-60E0-478C-BC55-E4E22F11301D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{54A85A38-A699-4AEC-8F88-AB542210C93B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{54A85A38-A699-4AEC-8F88-AB542210C93B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C759EC6-96BD-4551-A320-E61A1D68437F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C759EC6-96BD-4551-A320-E61A1D68437F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{382AA497-20D7-4EBB-A188-74660465940D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{382AA497-20D7-4EBB-A188-74660465940D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{423BD222-52BE-471A-BE01-75FCCEB3D48F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{423BD222-52BE-471A-BE01-75FCCEB3D48F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EDFB8B62-59EE-11d5-86C2-00E02975242F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EDFB8B62-59EE-11d5-86C2-00E02975242F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2BDEC2E4-819F-11D5-8846-006097B89050}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2BDEC2E4-819F-11D5-8846-006097B89050}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4845C240-1DFD-11D3-97DE-00104B873412}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4845C240-1DFD-11D3-97DE-00104B873412}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D8073790-84C7-4602-BF77-C6ACBF1612E4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D8073790-84C7-4602-BF77-C6ACBF1612E4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6B12DABB-0B7C-44FA-B0B3-4BAFF3790256}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6B12DABB-0B7C-44FA-B0B3-4BAFF3790256}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{39AF31DD-EAFC-45EA-A56C-385B52E25CC0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{39AF31DD-EAFC-45EA-A56C-385B52E25CC0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{388D7EBB-CBB9-4126-8DB2-86DC6863A206}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{388D7EBB-CBB9-4126-8DB2-86DC6863A206}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C8847EEA-72D6-11D4-AB4F-00B0D02332EE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C8847EEA-72D6-11D4-AB4F-00B0D02332EE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{40D61F04-59E4-4C8D-BF6E-697AB9C21F43}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{40D61F04-59E4-4C8D-BF6E-697AB9C21F43}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA25708B-154D-4D40-8607-67AA5190C395}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA25708B-154D-4D40-8607-67AA5190C395}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{21C32A07-0176-4FFE-BCDA-65D4A24F4303}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{21C32A07-0176-4FFE-BCDA-65D4A24F4303}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4647E382-520B-11D2-A0D0-004033D0645D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4647E382-520B-11D2-A0D0-004033D0645D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{421A63BA-4632-43E0-A942-3B4AB645BE51}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{421A63BA-4632-43E0-A942-3B4AB645BE51}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43872F3D-F7C8-4fa6-BE94-B3C263C1E2A9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43872F3D-F7C8-4fa6-BE94-B3C263C1E2A9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1C78AB3F-A857-482e-80C0-3A1E5238A565}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1C78AB3F-A857-482e-80C0-3A1E5238A565}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02336F51-24CA-4422-AB63-18841ADF35E6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02336F51-24CA-4422-AB63-18841ADF35E6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{018B7EC3-EECA-11D3-8E71-0000E82C6C0D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{018B7EC3-EECA-11D3-8E71-0000E82C6C0D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CA0B9B71-C2AF-11D3-B376-0800460222F0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CA0B9B71-C2AF-11D3-B376-0800460222F0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CA0B9B6D-C2AF-11D3-B376-0800460222F0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CA0B9B6D-C2AF-11D3-B376-0800460222F0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E5BD40E-6287-11D6-9772-0002A5DD2483}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E5BD40E-6287-11D6-9772-0002A5DD2483}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A3BA17E-A5C6-4889-8A78-80A3C3382118}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A3BA17E-A5C6-4889-8A78-80A3C3382118}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A44CBB0B-C77D-4BF5-87CC-B4EE79AD1B7E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A44CBB0B-C77D-4BF5-87CC-B4EE79AD1B7E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43D9E6F0-1776-4897-AE14-ECEDECBAFEC0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43D9E6F0-1776-4897-AE14-ECEDECBAFEC0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{663C7429-E454-11D3-B9AE-0000B4C32B4D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{663C7429-E454-11D3-B9AE-0000B4C32B4D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{42A7CE31-CEE7-4CCE-A060-A44A7E52E062}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{42A7CE31-CEE7-4CCE-A060-A44A7E52E062}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{029CA12C-89C1-46a7-A3C7-82F2F98635CB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{029CA12C-89C1-46a7-A3C7-82F2F98635CB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9FD12933-810D-4526-B7C4-0914E098D384}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9FD12933-810D-4526-B7C4-0914E098D384}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F9B9480F-8BE3-4117-985D-350ACEF1897A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F9B9480F-8BE3-4117-985D-350ACEF1897A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CECFF8DE-C145-4570-B030-10105AA82920}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CECFF8DE-C145-4570-B030-10105AA82920}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{11359F4A-B191-42D7-905A-594F8CF0387B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{11359F4A-B191-42D7-905A-594F8CF0387B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CBAA6F21-985C-11D4-A02B-00B0D073E889}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CBAA6F21-985C-11D4-A02B-00B0D073E889}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2005F7BA-6189-4607-BF8B-667679251CC0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2005F7BA-6189-4607-BF8B-667679251CC0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{66993893-61B8-47DC-B10D-21E0C86DD9C8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{66993893-61B8-47DC-B10D-21E0C86DD9C8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9F633F6-EA44-45F4-91EB-FABFC65A0634}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9F633F6-EA44-45F4-91EB-FABFC65A0634}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E720B458-B65A-438C-9FF3-B1DF65D7DB3F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E720B458-B65A-438C-9FF3-B1DF65D7DB3F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E720B458-B65A-438C-9FF3-B1DF65D7DB3E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E720B458-B65A-438C-9FF3-B1DF65D7DB3E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C10A16B7-70FE-4CE3-A261-6FBA7CC3DD5B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C10A16B7-70FE-4CE3-A261-6FBA7CC3DD5B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43FA5935-E36E-4937-8127-A90191B2EC68}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43FA5935-E36E-4937-8127-A90191B2EC68}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-FFFFAC95951F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-FFFFAC95951F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{516E2306-7ADF-47EC-AEA8-ACB6B51899F1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{516E2306-7ADF-47EC-AEA8-ACB6B51899F1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DEDEDE03-0000-0000-C000-00A300000043}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DEDEDE03-0000-0000-C000-00A300000043}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DB96792F-834A-40FC-97CD-9A8ECDF484FE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DB96792F-834A-40FC-97CD-9A8ECDF484FE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ED24BB32-17E8-422E-993F-159800A392E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ED24BB32-17E8-422E-993F-159800A392E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{05BBB56A-2A69-4A5C-BFDA-43295DD67434}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{05BBB56A-2A69-4A5C-BFDA-43295DD67434}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3E02B37-8608-4f57-AD58-AB91F32BA4F4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3E02B37-8608-4f57-AD58-AB91F32BA4F4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{333F6B96-3992-4D58-A499-145A10FE48C3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{333F6B96-3992-4D58-A499-145A10FE48C3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E7DC02F7-A213-4866-B800-FDCB4555FB79}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E7DC02F7-A213-4866-B800-FDCB4555FB79}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8FCDF9D9-A28B-480F-8C3D-581F119A8AB8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8FCDF9D9-A28B-480F-8C3D-581F119A8AB8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{340166BC-786B-401F-96AC-7C8821EFA9CD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{340166BC-786B-401F-96AC-7C8821EFA9CD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7B76DD6-B6F0-4443-AF81-6A3ECF12A57D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7B76DD6-B6F0-4443-AF81-6A3ECF12A57D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5ADA9CAC-04F9-4DD2-ABFD-74D673BE8624}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5ADA9CAC-04F9-4DD2-ABFD-74D673BE8624}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E1128F1-53FA-11d5-8490-0048548030CA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9E1128F1-53FA-11d5-8490-0048548030CA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C09C9904-FD44-11D6-A711-00105AC8F168}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C09C9904-FD44-11D6-A711-00105AC8F168}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59131903-4A33-40D5-80C2-5242DD365AB3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59131903-4A33-40D5-80C2-5242DD365AB3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC246652-868E-11d5-9C62-000102117FC3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BC246652-868E-11d5-9C62-000102117FC3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5F6293C0-8686-11d5-9C62-000102117FC3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5F6293C0-8686-11d5-9C62-000102117FC3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7D0B40-F575-4A29-9710-4675EAF4686A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7D0B40-F575-4A29-9710-4675EAF4686A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A4CB73C-64DF-4155-9EFA-57F86560245E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A4CB73C-64DF-4155-9EFA-57F86560245E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{120FF052-1C61-4C14-8F54-BBBC4A988590}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{120FF052-1C61-4C14-8F54-BBBC4A988590}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{405FD721-04EF-4EF2-AB96-FB31D32D4643}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{405FD721-04EF-4EF2-AB96-FB31D32D4643}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD78A087B530}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD78A087B530}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FFFFFFFF-FFFF-FFFF-FFFF-5F8507C5F4E9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FFFFFFFF-FFFF-FFFF-FFFF-5F8507C5F4E9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44A23DAB-8D31-43AE-9F68-5AC24CF7CE8C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44A23DAB-8D31-43AE-9F68-5AC24CF7CE8C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DD4258A-7138-49C4-8D34-587879A5C7A4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DD4258A-7138-49C4-8D34-587879A5C7A4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BDAD1DAD-C946-4A17-ADC1-64B5B4FF55D0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BDAD1DAD-C946-4A17-ADC1-64B5B4FF55D0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9394EDE7-C8B5-483E-8773-474BF36AF6E4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9394EDE7-C8B5-483E-8773-474BF36AF6E4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC87A650-207D-4392-A6A1-82ADBC56FA64}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC87A650-207D-4392-A6A1-82ADBC56FA64}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E8EDB60C-951E-4130-93DC-FAF1AD25F8E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E8EDB60C-951E-4130-93DC-FAF1AD25F8E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6BC013D0-77D9-11d5-AB95-0050DA664D35}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6BC013D0-77D9-11d5-AB95-0050DA664D35}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0494D0D9-F8E0-41ad-92A3-14154ECE70AC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0494D0D9-F8E0-41ad-92A3-14154ECE70AC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4D25F921-B9FE-4682-BF72-8AB8210D6D75}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4D25F921-B9FE-4682-BF72-8AB8210D6D75}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79B96C72-C0D0-4DC8-BC7E-9F314A918228}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79B96C72-C0D0-4DC8-BC7E-9F314A918228}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0494D0D1-F8E0-41ad-92A3-14154ECE70AC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0494D0D1-F8E0-41ad-92A3-14154ECE70AC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{442599A9-EB41-4F1F-B999-737BC587F314}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{442599A9-EB41-4F1F-B999-737BC587F314}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C3FF-FB7FB59BFA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C3FF-FB7FB59BFA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C1E58A84-95B3-4630-B8C2-D06B77B7A0FC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C1E58A84-95B3-4630-B8C2-D06B77B7A0FC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6EB5B540-1E74-4D91-A7F0-5B758D333702}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6EB5B540-1E74-4D91-A7F0-5B758D333702}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F585D290-1BF4-480A-AEC2-4182593F1E32}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F585D290-1BF4-480A-AEC2-4182593F1E32}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92E82FBB-DA00-41E0-ABFE-95482E21A4F6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{92E82FBB-DA00-41E0-ABFE-95482E21A4F6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001015-A15C-11D4-97A4-0050BF0FBE67}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001015-A15C-11D4-97A4-0050BF0FBE67}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001022-A15C-11D4-97A4-0050BF0FBE67}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001022-A15C-11D4-97A4-0050BF0FBE67}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001023-A15C-11D4-97A4-0050BF0FBE67}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00001023-A15C-11D4-97A4-0050BF0FBE67}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A6A6F79-BBE3-4A8B-8A64-9D1D1100A347}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0A6A6F79-BBE3-4A8B-8A64-9D1D1100A347}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D7EE-FE6FA781BF33}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D7EE-FE6FA781BF33}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{856D6A8E-A24C-498A-A55A-2B25C606A6B4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{856D6A8E-A24C-498A-A55A-2B25C606A6B4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E18F3FD-82DA-46EE-944C-CBEC9071D2F7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E18F3FD-82DA-46EE-944C-CBEC9071D2F7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F5735C15-1FB2-41FE-BA12-242757E69DDE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F5735C15-1FB2-41FE-BA12-242757E69DDE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52706EF7-D7A2-49AD-A615-E903858CF284}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52706EF7-D7A2-49AD-A615-E903858CF284}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6F8ADBE2-8C92-4362-B0E6-7321AA49EE46}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6F8ADBE2-8C92-4362-B0E6-7321AA49EE46}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E1E80F3-A3F0-41d4-BAA7-470442CFC906}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E1E80F3-A3F0-41d4-BAA7-470442CFC906}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A0BD4FF5-D828-11D3-9EB5-00600837E6EE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A0BD4FF5-D828-11D3-9EB5-00600837E6EE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A19966F-AE0E-4699-8CCE-9B6F5F1C352C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A19966F-AE0E-4699-8CCE-9B6F5F1C352C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C52149CE-7962-4C8D-95A4-8733F63199BF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C52149CE-7962-4C8D-95A4-8733F63199BF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7BA7B95F-9B92-4132-8012-E19B585CAF21}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7BA7B95F-9B92-4132-8012-E19B585CAF21}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4F92B827-1E56-4E30-A978-A17A7861A606}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4F92B827-1E56-4E30-A978-A17A7861A606}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6754A456-BAD9-11D4-93D3-00B0D03A2F91}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6754A456-BAD9-11D4-93D3-00B0D03A2F91}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D2000F80-ABC6-11D3-9794-0090274D4CCA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D2000F80-ABC6-11D3-9794-0090274D4CCA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{30A56549-9D5B-4D34-AFA7-440A7F0538A9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{30A56549-9D5B-4D34-AFA7-440A7F0538A9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6607C683-AE7C-11D4-ACD7-0050DAC291A2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6607C683-AE7C-11D4-ACD7-0050DAC291A2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC97972F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC97972F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ED657BAF-1EE5-4A07-9D2E-6D0525EFC69B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ED657BAF-1EE5-4A07-9D2E-6D0525EFC69B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA7270AE-5636-4618-BAF3-F86ADA39F036}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA7270AE-5636-4618-BAF3-F86ADA39F036}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B57F2FF0-F338-4ED0-BD82-FB074FEFAA1F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B57F2FF0-F338-4ED0-BD82-FB074FEFAA1F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5B2AD7D7-81E3-4B74-8B74-4600A67BBB8A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5B2AD7D7-81E3-4B74-8B74-4600A67BBB8A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0CF0B8EE-6596-11D5-A98E-0003470BB48E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0CF0B8EE-6596-11D5-A98E-0003470BB48E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0D245396-8535-11D3-B3F9-00A0C9424626}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0D245396-8535-11D3-B3F9-00A0C9424626}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A586BE00-52AC-11D3-A075-E51A86A6C62B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A586BE00-52AC-11D3-A075-E51A86A6C62B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4DF1DB24-A57C-11d3-A180-00A0C90AE44B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4DF1DB24-A57C-11d3-A180-00A0C90AE44B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F5528ECB-D64C-479D-AFEB-89C90FA191A3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F5528ECB-D64C-479D-AFEB-89C90FA191A3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{65C8C1F5-230E-4DC9-9A0D-F3159A5E7778}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{65C8C1F5-230E-4DC9-9A0D-F3159A5E7778}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{645FD3BC-C314-4F7A-9D2E-64D62A0FDD78}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{645FD3BC-C314-4F7A-9D2E-64D62A0FDD78}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7EED2A74-002E-481F-A283-D96B81EA244B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7EED2A74-002E-481F-A283-D96B81EA244B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D3-8D96-D7ACAC95951F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D3-8D96-D7ACAC95951F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A47693D1-7E2A-4DE3-9907-310C5D310B5F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A47693D1-7E2A-4DE3-9907-310C5D310B5F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43D29D14-460E-4F3A-9037-E60F11EF12F0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43D29D14-460E-4F3A-9037-E60F11EF12F0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E929F51-5914-11D6-971F-0050FC3F9161}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E929F51-5914-11D6-971F-0050FC3F9161}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0549E6CB-9985-42F6-8FD6-4EC017E6AAE1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0549E6CB-9985-42F6-8FD6-4EC017E6AAE1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4209B4C1-1295-4908-9312-A53C036EB3CD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4209B4C1-1295-4908-9312-A53C036EB3CD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B0000209-50CF-11D1-A140-0000F802C250}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B0000209-50CF-11D1-A140-0000F802C250}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08E74C67-99A6-45C7-94DA-A397A8FD8082}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08E74C67-99A6-45C7-94DA-A397A8FD8082}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6F91A936-734D-4EE7-9320-50718870285D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6F91A936-734D-4EE7-9320-50718870285D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D2C1DA4-BCD3-4317-9548-2E08BD222FF0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D2C1DA4-BCD3-4317-9548-2E08BD222FF0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C68AE9C0-0909-4DDC-B661-C1AFB9F5AE53}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C68AE9C0-0909-4DDC-B661-C1AFB9F5AE53}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4115122B-85FF-4DD3-9515-F075BEDE5EB5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4115122B-85FF-4DD3-9515-F075BEDE5EB5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D4D505DF-D582-400c-91B6-84921012AFE3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D4D505DF-D582-400c-91B6-84921012AFE3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D6862A22-1DD6-11D3-BB7C-444553540000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D6862A22-1DD6-11D3-BB7C-444553540000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{437434D2-065E-499D-A337-59657DF3342F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{437434D2-065E-499D-A337-59657DF3342F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D6223CBC-A263-4CB1-B35E-1AE40FEF3B3B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D6223CBC-A263-4CB1-B35E-1AE40FEF3B3B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6172E460-FAE3-11D2-B494-004005A47AAA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6172E460-FAE3-11D2-B494-004005A47AAA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-DFF7-EC7DA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-DFF7-EC7DA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-DBFC-ED1CA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-DBFC-ED1CA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D6F5-F66EA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D6F5-F66EA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D4F3-F66DA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D4F3-F66DA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3FA-F27BA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3FA-F27BA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D1F0-E56FA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D1F0-E56FA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-AA8E-8E1CA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-AA8E-8E1CA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A68E-8E1CA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A68E-8E1CA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A1E4-EA6FA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A1E4-EA6FA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A08E-8E1CA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A08E-8E1CA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A08D-8F6FA787AD2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A08D-8F6FA787AD2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A3FA-F363B384B77D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A3FA-F363B384B77D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C6335B00-E8D9-423e-A691-48D17CBB6C5A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C6335B00-E8D9-423e-A691-48D17CBB6C5A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DBAE7000-01EC-4162-8FEB-8A27AC937CA0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DBAE7000-01EC-4162-8FEB-8A27AC937CA0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7B64270B-1216-47CE-9708-DE9D2D628CC5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7B64270B-1216-47CE-9708-DE9D2D628CC5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3789CBF0-C4CA-4e98-B93B-22ACF0587FBA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3789CBF0-C4CA-4e98-B93B-22ACF0587FBA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A0E8-F76FA694BF2E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A0E8-F76FA694BF2E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD6DB787FA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD6DB787FA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F0AA2376-F073-4E57-86E8-0238F99087C7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F0AA2376-F073-4E57-86E8-0238F99087C7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD60B590A87D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FF-FD60B590A87D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9C777253-3E17-42D6-897A-11B8617A8F7C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9C777253-3E17-42D6-897A-11B8617A8F7C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{38AAF321-C5B4-11D1-B75E-400000000000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{38AAF321-C5B4-11D1-B75E-400000000000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D7258ABE-571F-4DC2-ABD1-8393B13B1269}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D7258ABE-571F-4DC2-ABD1-8393B13B1269}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3FC-F363BB81A82F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D3FC-F363BB81A82F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4DF5B116-4FD9-4039-B377-1130953A980F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4DF5B116-4FD9-4039-B377-1130953A980F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{488D8EF4-DF87-4086-92DF-86220D5AD846}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{488D8EF4-DF87-4086-92DF-86220D5AD846}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{99C7B1B6-C556-4BA2-BBF6-4E19394A260B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{99C7B1B6-C556-4BA2-BBF6-4E19394A260B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BCF96FB4-5F1B-497B-AECC-910304A55011}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BCF96FB4-5F1B-497B-AECC-910304A55011}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B824E7B0-E8E3-4D75-895E-2C309EA4CC5D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B824E7B0-E8E3-4D75-895E-2C309EA4CC5D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E947A403-B614-4FA8-B9E7-E790F0BDC87E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E947A403-B614-4FA8-B9E7-E790F0BDC87E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ED16EFF-3B18-11D6-9139-00E02964E8E3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6ED16EFF-3B18-11D6-9139-00E02964E8E3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8940E28E-3125-441C-87C6-E3D97D03F4B4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8940E28E-3125-441C-87C6-E3D97D03F4B4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C1EB-ED65B786FA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C1EB-ED65B786FA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{96BBDFE1-2951-4F81-811E-31DF6436A329}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{96BBDFE1-2951-4F81-811E-31DF6436A329}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF982A6F-FB83-42FE-B4BD-1941C499F194}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF982A6F-FB83-42FE-B4BD-1941C499F194}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{76EC9B95-D244-41F9-A5BE-6896EFFB40CF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{76EC9B95-D244-41F9-A5BE-6896EFFB40CF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC788B03-A743-4274-AC9E-DB4F2A03F515}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC788B03-A743-4274-AC9E-DB4F2A03F515}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E2B1672A-DA31-4F7D-A2BF-C18C50BF8F6F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E2B1672A-DA31-4F7D-A2BF-C18C50BF8F6F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D7E4-F660B597BF2A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D7E4-F660B597BF2A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A116A5C1-AD77-446C-992A-F56200B112DB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A116A5C1-AD77-446C-992A-F56200B112DB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3717DF55-0396-463D-98B7-647C7DC6898A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3717DF55-0396-463D-98B7-647C7DC6898A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2E0099}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0E1230F8-EA50-42A9-983C-D22ABC2E0099}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3717DF57-0396-463d-98B7-647C7DC6898A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3717DF57-0396-463d-98B7-647C7DC6898A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6C413541-29A1-4FFE-894C-9D68313C9F73}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6C413541-29A1-4FFE-894C-9D68313C9F73}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D9FB-FA6BAD98FA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-D9FB-FA6BAD98FA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FD7D6851-616E-48DE-AF55-EE2E34F389B0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FD7D6851-616E-48DE-AF55-EE2E34F389B0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E97DAE80-0305-427e-ABA1-BDD775EF53B0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E97DAE80-0305-427e-ABA1-BDD775EF53B0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6CC1C918-AE8B-4373-A5B4-28BA1851E39A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6CC1C918-AE8B-4373-A5B4-28BA1851E39A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22998D24-B789-4CA2-A7FC-CD7CE7DEB14C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22998D24-B789-4CA2-A7FC-CD7CE7DEB14C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7C24A476-8B03-46ed-8CCF-CE8AE7213C99}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7C24A476-8B03-46ed-8CCF-CE8AE7213C99}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7EB2A76C-97AE-4cf3-9C6A-EA0F61F137E1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7EB2A76C-97AE-4cf3-9C6A-EA0F61F137E1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0EEDB912-C5FA-486F-8334-57288578C627}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0EEDB912-C5FA-486F-8334-57288578C627}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A3F3-E96FF4D5FA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-A3F3-E96FF4D5FA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0837121A-6472-43BD-8A40-D9221FF1C4CE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0837121A-6472-43BD-8A40-D9221FF1C4CE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08351226-6472-43BD-8A40-D9221FF1C4CE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{08351226-6472-43BD-8A40-D9221FF1C4CE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9EF6526C-82BA-4CDA-B3F2-29FF365A1D42}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9EF6526C-82BA-4CDA-B3F2-29FF365A1D42}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E15D681-1D20-11D4-8B72-000021DA1956}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E15D681-1D20-11D4-8B72-000021DA1956}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A09790E7-DD00-4A83-B632-5B563423CFBB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A09790E7-DD00-4A83-B632-5B563423CFBB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E0000C3F-8DE9-4FCB-9294-22FC06851B37}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E0000C3F-8DE9-4FCB-9294-22FC06851B37}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FFFF0003-0001-101A-A3C9-08002B2F49FB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FFFF0003-0001-101A-A3C9-08002B2F49FB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6427806D-3820-11D5-9939-00B0D0522EB5}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6427806D-3820-11D5-9939-00B0D0522EB5}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{496756A6-05E2-4646-96B5-071EC0394E9C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{496756A6-05E2-4646-96B5-071EC0394E9C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53707962-6F74-2D53-2644-206D7942484F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53707962-6F74-2D53-2644-206D7942484F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4A368E80-174F-4872-96B5-0B27DDD11DB2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4A368E80-174F-4872-96B5-0B27DDD11DB2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79049BCB-7C3A-467B-BFA9-0B8C1CD44463}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{79049BCB-7C3A-467B-BFA9-0B8C1CD44463}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D44BBB61-E17F-4AE6-A502-8D7E0B29E616}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D44BBB61-E17F-4AE6-A502-8D7E0B29E616}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53E10C2C-43B2-4657-BA29-AAE179E7D35C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53E10C2C-43B2-4657-BA29-AAE179E7D35C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C4871FD-30F6-4430-8834-BC75D58F1529}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C4871FD-30F6-4430-8834-BC75D58F1529}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D97287B6-4018-4060-948D-54D2122FC5C3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D97287B6-4018-4060-948D-54D2122FC5C3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BD0BA5CD-7C8E-47ED-935E-1ABBAC9B29E0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BD0BA5CD-7C8E-47ED-935E-1ABBAC9B29E0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FB2961FD-DD24-4F8A-8A92-6F9325FF6F11}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FB2961FD-DD24-4F8A-8A92-6F9325FF6F11}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF7FD490-34E7-4FA1-927A-F5799E6AAD7B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FF7FD490-34E7-4FA1-927A-F5799E6AAD7B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A096A159-4E58-45A9-8EE6-B11466851181}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A096A159-4E58-45A9-8EE6-B11466851181}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C2FCEF52-ACE9-11D3-BEBD-00105AA9B6AE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C2FCEF52-ACE9-11D3-BEBD-00105AA9B6AE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C7967580-5F17-11D4-AAC2-0000B4936E0C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C7967580-5F17-11D4-AAC2-0000B4936E0C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3919E1A-D6A5-11D6-AC3E-00B0D094B576}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3919E1A-D6A5-11D6-AC3E-00B0D094B576}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CFB25594-4D5F-11D6-AB7B-00B0D094B576}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CFB25594-4D5F-11D6-AB7B-00B0D094B576}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1C960AA3-FAEE-11D0-9262-00A0243D2412}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1C960AA3-FAEE-11D0-9262-00A0243D2412}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A431EC4-CC21-4DF7-9DB1-A2CF74C4CC98}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A431EC4-CC21-4DF7-9DB1-A2CF74C4CC98}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C7B6DE1-99A4-4CF1-8B44-68889900E1D0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4C7B6DE1-99A4-4CF1-8B44-68889900E1D0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4194307F-65BB-454A-81D4-9E8A9D7CBAEA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4194307F-65BB-454A-81D4-9E8A9D7CBAEA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C08DF07A-3E49-4E25-9AB0-D3882835F153}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C08DF07A-3E49-4E25-9AB0-D3882835F153}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B10031B2-F184-4803-9A88-D239C0641D70}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B10031B2-F184-4803-9A88-D239C0641D70}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{50A28604-52F2-11D6-8F0F-5254AB11D5C2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{50A28604-52F2-11D6-8F0F-5254AB11D5C2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69555BE2-9A78-11D2-BA91-00600827878D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69555BE2-9A78-11D2-BA91-00600827878D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69550BE2-9A78-11D2-BA91-00600827878D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69550BE2-9A78-11D2-BA91-00600827878D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFAF}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFAF}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1F48AA48-C53A-4E21-85E7-AC7CC6B5FFA7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0352960F-47BE-11D5-AB93-00D0B760B4EB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0352960F-47BE-11D5-AB93-00D0B760B4EB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{05CE4481-8015-11D3-9811-C4DA9F000000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{05CE4481-8015-11D3-9811-C4DA9F000000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5886A6DC-AAF4-45E9-979A-8E5E6DEE30E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5886A6DC-AAF4-45E9-979A-8E5E6DEE30E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{71AAABE5-1F0F-11d7-BD6F-004854603DCE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{71AAABE5-1F0F-11d7-BD6F-004854603DCE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FB-FB6DA681FA7D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4E7BD74F-2B8D-469E-C0FB-FB6DA681FA7D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9D90B27-AD4A-413a-88CB-3E6DDC10DC2D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9D90B27-AD4A-413a-88CB-3E6DDC10DC2D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53cbee82-d747-11d3-9ed0-005004189684}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53cbee82-d747-11d3-9ed0-005004189684}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44BE0690-5429-47f0-85BB-3FFD8020233E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44BE0690-5429-47f0-85BB-3FFD8020233E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{71CC3BD4-6217-44AB-B8D0-96AEAF9A8678}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{71CC3BD4-6217-44AB-B8D0-96AEAF9A8678}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22D003CE-6952-46C5-80B9-D19B479620AB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{22D003CE-6952-46C5-80B9-D19B479620AB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D879A0F1-2B3B-4409-8879-FAD6E49E1EA9}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D879A0F1-2B3B-4409-8879-FAD6E49E1EA9}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{76D92AF6-2C25-4667-A54F-F75012BCB7B1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{76D92AF6-2C25-4667-A54F-F75012BCB7B1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-623A-11D4-BCDB-005004131771}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-623A-11D4-BCDB-005004131771}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3F753E5A-DF80-4850-801C-35880F80756C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3F753E5A-DF80-4850-801C-35880F80756C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{35EB9C91-1CA6-11d5-8B2B-00C04F779127}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{35EB9C91-1CA6-11d5-8B2B-00C04F779127}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02C20140-76F8-4763-83D5-B660107B7A90}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02C20140-76F8-4763-83D5-B660107B7A90}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A0F0D762-D1DE-43af-B70E-D87864743EB3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A0F0D762-D1DE-43af-B70E-D87864743EB3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6085FB5B-C281-4B9C-8E5D-D2792EA30D2F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6085FB5B-C281-4B9C-8E5D-D2792EA30D2F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-5eb9-11d5-9d45-009027c14662}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000000-5eb9-11d5-9d45-009027c14662}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{000000F1-34E3-4633-87C6-1AA7A44296DA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{000000F1-34E3-4633-87C6-1AA7A44296DA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{059B2FC0-741D-40F8-AEFA-D2C919EB9217}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{059B2FC0-741D-40F8-AEFA-D2C919EB9217}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C1D458F1-B97C-11D5-B3DF-00B0D0A5B433}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C1D458F1-B97C-11D5-B3DF-00B0D0A5B433}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC327B3F-377B-4CB7-8B61-27CD69816BC3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FC327B3F-377B-4CB7-8B61-27CD69816BC3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{87067F04-DE4C-4688-BC3C-4FCF39D609E7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{87067F04-DE4C-4688-BC3C-4FCF39D609E7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9677F3F1-E994-451F-805F-7148CC8AE040}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9677F3F1-E994-451F-805F-7148CC8AE040}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AC15BAC-8AE7-11D3-A458-0000C07BA55F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6AC15BAC-8AE7-11D3-A458-0000C07BA55F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{66F67511-2665-4C34-9E20-FAC2C0954EF2}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{66F67511-2665-4C34-9E20-FAC2C0954EF2}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44AF5221-A43E-224E-56BA-ABCD43C344D1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44AF5221-A43E-224E-56BA-ABCD43C344D1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15AD4789-CDB4-47E1-A9DA-992EE8E6BAD6}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15AD4789-CDB4-47E1-A9DA-992EE8E6BAD6}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B5B57F4F-EFA5-11D4-A971-444553540000}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B5B57F4F-EFA5-11D4-A971-444553540000}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F2A84794-EE6D-447B-8C21-3BA1DC77C5B4}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F2A84794-EE6D-447B-8C21-3BA1DC77C5B4}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{371C6960-302C-45D0-9504-50B820247439}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{371C6960-302C-45D0-9504-50B820247439}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7DB7E5A-81FD-11D1-8B75-0080C83788F7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B7DB7E5A-81FD-11D1-8B75-0080C83788F7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E915E62E-41DA-40D0-8106-3438B4D24394}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E915E62E-41DA-40D0-8106-3438B4D24394}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{348FE907-249E-4C65-A838-F34A193FE1D1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{348FE907-249E-4C65-A838-F34A193FE1D1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3AA90BC2-58C0-4F4D-A87C-2C6F3D3CD5FE}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3AA90BC2-58C0-4F4D-A87C-2C6F3D3CD5FE}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{87B1E57C-FF70-4C69-9CE8-57CB8F67ABA8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{87B1E57C-FF70-4C69-9CE8-57CB8F67ABA8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D6DDF37-B491-49D3-8733-600FA16940A0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6D6DDF37-B491-49D3-8733-600FA16940A0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DDC8F6D-BC51-46CB-B185-EBF34D52A175}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9DDC8F6D-BC51-46CB-B185-EBF34D52A175}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0F5B6A38-B470-4446-B453-C248D8FB3A4B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0F5B6A38-B470-4446-B453-C248D8FB3A4B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4708D1EF-3800-4E4E-9948-360BA9164264}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4708D1EF-3800-4E4E-9948-360BA9164264}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{601ED020-FB6C-11D3-87D8-0050DA59922B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{601ED020-FB6C-11D3-87D8-0050DA59922B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6270DFC1-EDFB-4BC4-BE8C-842740BA290B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6270DFC1-EDFB-4BC4-BE8C-842740BA290B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{525BBD23-1863-46C6-86D6-5F9A3715D44E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{525BBD23-1863-46C6-86D6-5F9A3715D44E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3A279869-C6B6-4410-A041-0435DE6AD916}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3A279869-C6B6-4410-A041-0435DE6AD916}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{40ac4d2d-491d-11d4-aaf2-0008c75dcd2b}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{40ac4d2d-491d-11d4-aaf2-0008c75dcd2b}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{99AFC088-C0DD-40ED-92D8-0C53E8997510}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{99AFC088-C0DD-40ED-92D8-0C53E8997510}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69A4F9FF-E915-11D5-A9F1-009099104002}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{69A4F9FF-E915-11D5-A9F1-009099104002}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3EA3B57-9A3E-4E80-BFF0-595F7A91D55E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D3EA3B57-9A3E-4E80-BFF0-595F7A91D55E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{051299DE-2CFD-4EA8-A432-F0429B4E7A5D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{051299DE-2CFD-4EA8-A432-F0429B4E7A5D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A27CFCAE-9351-4D74-BFFC-21EB19693D8C}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A27CFCAE-9351-4D74-BFFC-21EB19693D8C}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3C5BA506-6C30-4738-9CED-797ACADEA8DC}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3C5BA506-6C30-4738-9CED-797ACADEA8DC}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E6DD93E-1FC3-4F43-8AFB-1B7B90C9D3EB}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E6DD93E-1FC3-4F43-8AFB-1B7B90C9D3EB}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF86873F-04C2-4a95-A373-5703C08EFC7B}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF86873F-04C2-4a95-A373-5703C08EFC7B}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{018B7EC3-EECA-11D3-8E71-0000E82C6C0D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{018B7EC3-EECA-11D3-8E71-0000E82C6C0D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{12398DD6-40AA-4c40-A4EC-A42CFC0DE797}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{12398DD6-40AA-4c40-A4EC-A42CFC0DE797}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02478D38-C3F9-4EFB-9B51-7695ECA05670}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02478D38-C3F9-4EFB-9B51-7695ECA05670}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02478D28-C3F9-4efb-9B51-7695ECA05670}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02478D28-C3F9-4efb-9B51-7695ECA05670}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF99BD32-C1FB-11D2-892F-0090271D4F88}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF99BD32-C1FB-11D2-892F-0090271D4F88}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9191F79-5613-4C76-AA2A-398534BB8999}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B9191F79-5613-4C76-AA2A-398534BB8999}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E09B2CC-C2A0-4786-B099-0B9101E92CA1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E09B2CC-C2A0-4786-B099-0B9101E92CA1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{56071E0D-C61B-11D3-B41C-00E02927A304}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{56071E0D-C61B-11D3-B41C-00E02927A304}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FA91B828-F937-4568-82C1-843627E63ED7}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FA91B828-F937-4568-82C1-843627E63ED7}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3C060EA2-E6A9-4E49-A530-D4657B8C449A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3C060EA2-E6A9-4E49-A530-D4657B8C449A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E01D96AB-DBBD-451D-BDCB-0EE420BC91B1}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E01D96AB-DBBD-451D-BDCB-0EE420BC91B1}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{319A68DB-06D0-46DA-9F93-A810D5A70836}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{319A68DB-06D0-46DA-9F93-A810D5A70836}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{19E41A2D-BD9D-48bb-9576-27B2CF0877C0}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{19E41A2D-BD9D-48bb-9576-27B2CF0877C0}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{81766E08-CE68-4F23-95C4-C1468FDE68AA}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{81766E08-CE68-4F23-95C4-C1468FDE68AA}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F0DC0CFE-D11A-489B-84C0-63748AFAABF3}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F0DC0CFE-D11A-489B-84C0-63748AFAABF3}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7FC751A9-492D-41B1-9F8D-D2C8809D8907}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{02BF25D5-8C17-4B23-BC80-D3488ABDDC6B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CD5DB70E-9969-45A5-9E45-5BAC1B2154F8}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3308C4F5-55A7-44CB-8211-EEF8D44A6EA7}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{AD0CB4E1-37FB-44A9-A42B-0B084491FB73}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D4BD4AF6-0CEC-4E22-AD44-ECBCE0233620}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000162-9980-0010-8000-00AA00389B71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000161-0000-0010-8000-00AA00389B71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000160-0000-0010-8000-00AA00389B71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000075-9980-0010-8000-00AA00389B71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00000075-0000-0010-8000-00AA00389B71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{87CCFDB0-C4BE-4BC2-A78C-9EAA7CF96667}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FEE1002D-90A5-4A5D-AABE-01803FFBCF7A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{53AF6E02-F18F-4228-AC13-3E79773FBE50}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{991EB39C-C4B8-466E-99C1-ECCC44E2CED8}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FEE1002D-90A5-4A5D-AABE-01803FFBCF7A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5EC7C511-CD0F-42E6-830C-1BD9882F3458}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{20C2C286-BDE8-441B-B73D-AFA22D914DA5}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2761225D-F0F2-44E8-A2C9-476FB6A3316A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{AC3A36A8-9BFF-410A-A33D-2279FFEB69D2}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4AF6677A-373A-4BB9-BD9F-6196B6FC35B3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{41F17733-B041-4099-A042-B518BB6A408C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{56336BCB-3D8A-11D6-A00B-0050DA18DE71}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E3F7205F-2AE0-4BF0-816B-2D24A5F20EC7}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E6F1D6A-1F20-11D4-8859-00A0CCE26836}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8F9E8A28-C296-4C6F-9A57-8FE4374135A1}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{36F46B1E-11B7-4221-B4F7-F1FC9687E7F6}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2354A44B-3CEB-4829-9940-545B03103538}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F553811C-C2CE-4A33-90B4-A6D333FDF794}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2D0C7226-747E-11D6-83F0-00E04C4A2F90}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{43E839C5-E10F-443A-BC1F-F09CFD2ABC77}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{00B71CFB-6864-4346-A978-C0A14556272C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F6BF0D00-0B2A-4A75-BF7B-F385591623AF}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2917297F-F02B-4B9D-81DF-494B6333150B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DF780F87-FF2B-4DF8-92D0-73DB16A1543A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B8BE5E93-A60C-4D26-A2DC-220313175592}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8E0D4DE5-3180-4024-A327-4DFAD1796A8D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7B6FE245-928D-47FC-81EA-01DBDAC5C1B2}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7623BE59-D4CF-4379-ABC4-B39E11854D66}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3D8F74EE-8692-4F8F-B8D2-7522E732519E}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C0C13879-6A17-429E-80F1-60B23FC1F720}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{354D8461-5490-4294-B155-CA6B886ACB6F}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D8B23265-10CA-4844-B2E3-E2840DF7EEF3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ABA7CC7F-019D-47DB-A0D2-B3C2B3AC1B44}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2D4851FD-0BFE-11D4-9260-9AF666D52059}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{99888952-AC62-437C-AFC6-7B5CF05A7F2F}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{76146408-A665-4BCD-B536-04EEAAFF2545}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CD1A82F2-3770-4509-8355-0D2F45158F21}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D7F0CC2E-FB09-4B38-B9A7-6807CBCD4859}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A9E58728-1FA7-46CE-845D-44694EB11602}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{48FE89A0-486C-48DF-9DEC-BED22BDC6057}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{260B15BC-BFA6-4673-A5B7-DADCCF81A874}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{73ACCC7C-1E56-4AED-8CCD-71B2C4585C27}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8CC55BB0-E742-4206-8DC9-EEF6A690B73E}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{AC036CB4-328D-4DB4-A707-4147B6C20266}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E4EF3635-F86D-4371-8F09-5DFC66B8BF20}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{867EB72F-811B-4A72-BE80-2D56A5F91739}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E22BFF56-39F3-11D8-A0C7-000C6E7BB5AB}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{54F8C0E2-34F9-474F-B47F-2CFCFE2300A2}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A0527C1-4D5F-4E45-9D28-6257F75EDDB1}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7A32634B-029C-4836-A023-528983982A49}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{29C13B62-B9F7-4CD3-8CEF-0A58A1A99441}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E87A6788-1D0F-4444-8898-1D25829B6755}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F58E1CEF-A068-4C15-BA5E-587CAF3EE8C6}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B38870E4-7ECB-40DA-8C6A-595F0A5519FF}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FA463B6E-93D5-4E02-B7F2-E0BA98DA73FC}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6EC14D77-72E0-436D-8C04-3BEE5D75B2F1}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2B323CD9-50E3-11D3-9466-00A0C9700498}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7D1E9C49-BD6A-11D3-87A8-009027A35D73}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{30528230-99f7-4bb4-88d8-fa1d4f56a2ab}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{278C005A-65AC-4705-876D-84CAEB35997A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A9E9602-D8BD-4401-9191-44A7C0D76F0C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6924091F-CD97-41E1-B1D4-D9079409D413}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{159E5866-28A6-11D7-972D-00E04CE44D74}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6CF97BBD-55EC-4D30-B470-C8EE5D687217}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7253A666-8D4A-11D7-A4DC-00E04C504779}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{88734439-46D0-42C0-A13F-7E881EE550CF}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA0F088C-72C1-475A-92F8-42391DEF6961}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7005341F-8E42-47E3-987B-3DBE6288048C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2EA6D939-4445-43F1-A12B-8CB3DDA8B855}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{991481A7-4669-4E15-8C24-100404E1F5CB}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0400AC1C-EEF0-4638-A501-31D5A0DC2002}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6924091F-CD97-41E1-B1D4-D9079409D413}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FEEC6798-0E56-4037-829E-FD18E5BADE8C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C07405FD-84D1-4A25-94E8-68609EA8335B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{73BF47F8-04F4-4857-9F04-A1FF670CB5EA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{84D82DA6-C022-11D7-938F-00E04C3020A8}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{59324688-BAB1-4EC0-999A-BFA50D3D4F1D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4AD3FE72-3D70-5837-8C28-86B2A6B8D507}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CF051549-EDE1-40F5-B440-BCD646CF2C25}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{448A5F6B-8C03-4B54-A338-F00237C508AD}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{61A68EA1-BA1B-461F-BFCB-57718190834D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7253A666-8D4A-11D7-A4DC-00E04C504779}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{91141BA1-C977-433C-8B1B-14B3BFBC2AE9}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{045ADB92-9635-45CE-B25B-F19F825B0E39}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{06849E9F-C8D7-4D59-B87D-784B7D6BE0B3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{072039AB-2117-4ED5-A85F-9B9EB903E021}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{04E214E5-63AF-4236-83C6-A7ADCBF9BD02}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B5A34A93-D538-43A7-8371-864CB6148D12}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0EB0E74A-2A76-4AB3-A7FB-9BD8C29F7F75}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EF6205C1-3F17-4829-BCB5-1336ED89E356}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0C568603-D79D-11D2-87A7-00C04FF158BB}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BA52B914-B692-46c4-B683-905236F6F655}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7260569F-1D40-4E7F-B95B-2E68D35668B9}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E3489C0D-D07D-4281-A4A7-ADA8E9A0893F}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4F1E5B1A-2A80-42CA-8532-2D05CB959537}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4F1E5B1A-2A80-42ca-8532-2D05CB959537}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{42CDD1BF-3FFB-4238-8AD1-7859DF00B1D6}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9A9307A0-7DA4-4DAF-B042-5009F29E09E1}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0AE0F5F9-8233-49A4-A3C8-004CE190787B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E87F6C8E-16C0-11D3-BEF7-009027438003}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{37775067-8350-11D4-A7DA-00C04F14FB69}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{ACFE8232-03C5-4AEC-AF5E-42B806724096}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A96C48EA-AA88-4BBD-B58C-7B41146A6EAC}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BF8C499A-AC6E-4F58-82EA-9E5FCC41C34B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3451DEDE-631F-421C-8127-FD793AFC6CC8}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2BC66F54-93A8-11D3-BEB6-00105AA9B6AE}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{644E432F-49D3-41A1-8DD5-E099162EEEC5}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44990301-3C9D-426D-81DF-AAB636FA4345}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{44990200-3C9D-426D-81DF-AAB636FA4345}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C661F36D-DF85-4EF4-83C7-E107B83D04B1}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{72C73565-4297-4835-9306-E750A2B0DDA4}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6F101641-AFFE-4E1F-9BF1-E8976A646549}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{74D05D43-3236-11D4-BDCD-00C04F9A3B61}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E5A37BF-FD42-463A-877C-4EB7002E68AE}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E4F500BF-C1A3-11D6-9697-0090961B771E}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C3D49491-F2CA-4E14-A2FA-A15A8721EE61}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0150EB11-5FB4-4D9E-85EA-0F155705227E}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2359626E-7524-4F87-B04E-22CD38A0C88C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9BDBC41E-C335-4263-83C0-ECE78EE28A33}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5DD731E6-D4F0-11D3-BE3F-00105A6FDA50}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3359C0B1-2363-40B3-AFCA-1ABC799AC486}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B4FE8160-76DB-48C4-9803-68ED6278CA2B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E689D735-1487-420D-9049-16ED198FE411}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E75D308D-B903-11D4-BD46-0050BA6E0CA5}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8C9D5912-EED6-4488-B778-2D74EF9B859D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{21CEEC1E-4187-4B9B-915C-2BBD96E7E1F9}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9BBD100C-E820-4930-9937-E8F3AA40E584}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C8BD9ACB-F7EC-48E6-BB2F-DAADC6789E9A}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DDA166FA-B3EA-4A3B-8EE2-4F552CDEEE81}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DA984A6D-508E-11D6-AA49-0050FF3C628D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E4E2F180-CB8B-4DE9-ACBB-DA745D3BA153}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7FC22A16-79E6-4787-9C96-B6359BB1106D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{C5D0DFF5-6D39-4F98-88CD-12E8430A6300}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{169B0044-1CD6-4EFE-A5D8-AEC69797A953}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6BB0C189-3676-4711-AA75-E2801D6B0E27}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EC53936E-6D4A-4307-9092-A2FC48EAFC56}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{52FF336D-A05D-4A14-A3A1-7B6B4B427F88}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A984ED9F-E8DA-44E5-BC18-C14B9ABEF79D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DE3496D2-AFB9-47EB-A8C2-C3B330222513}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{40CFEA79-ED5B-4B2B-8B8D-B567E40AF812}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{339C1EE2-1029-46B8-81F1-360217F26FC4}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{220ED87A-CB03-45A8-A81E-1C5597E11186}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0F7C23A0-233A-4D9E-915B-E7EA2E0C873D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8D9E0B29-563C-4226-86C1-5FF2AE77E1D2}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{73E4740C-08EB-4133-896B-8D0A7C9EE3CD}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{017767CF-2834-11D4-98F9-00C0DF242218}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3CD7F74-93C9-4BC4-B892-CCDF1514F714}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{EBD84F58-8D2B-4C66-85F1-73BC8125709D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5467862B-C477-437F-886E-EC5006B37DCA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{62B938C4-4190-4F37-8CF0-A92B0A91CC77}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8819C261-5B61-4628-908C-9BE795EABEC3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{098A3F72-3110-4004-B954-2F9DC44934B4}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E787FD25-8D7C-4693-AE67-9406BC6E22E0}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E787FD25-8D7C-4693-AE67-9406BC6E22DF}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D1056C7C-E30B-4234-9A4B-7E1038B167A7}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3FB2A3BC-F243-43D1-B6BC-CA863C9A9B0E}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{DA7780B0-0535-11D8-967A-5254ABDE0617}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{2BFAA61B-5C83-4865-8281-D8BDBF863061}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{0CA54D3F-CEAE-48AF-9A2B-31909CB9515D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F2EB8999-766E-4BF6-AAAD-188D398C0D0B}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{488A4255-3236-44B3-8F27-FA1AECAA8844}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{20F1BA6D-D3F5-4089-A651-106A3DB5A7BA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{73FFAC43-9801-49B0-9550-57F2D7816171}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F281A59C-7B65-11D3-8617-0010830243BD}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{238F6F83-B8B4-11CF-8771-00A024541EE3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8123E390-5EF7-11D5-A72E-006097BFA1AC}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{8AD9C840-044E-11D1-B3E9-00805F499D93}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CAFEEFAC-0014-0002-0004-ABCDEFFEDCBA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CAFEEFAC-0014-0002-0001-ABCDEFFEDCBA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{15B782AF-55D8-11D1-B477-006097098764}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{46B9D770-1B7D-45D1-81B4-AC07B2F127EF}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D27CDB6E-AE6D-11CF-96B8-444553540000}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{166B1BCA-3F9C-11CF-8075-444553540000}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3A2B370C-BA0A-11D1-B137-0000F8753F5D}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{F9043C85-F6F2-101A-A3C9-08002B2F49FB}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3E68E405-C6DE-49FF-83AE-41EE9F4C36CE}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{7584c670-2274-4efb-b00b-d6aaba6d3850}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{9F1C11AA-197B-4942-BA54-47A8489BB47F}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6414512B-B978-451D-A0D8-FCFDF33E833C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6E32070A-766D-4EE6-879C-DC1FA91D2FC3}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{17492023-C23A-453E-A040-C7C580BBF700}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{5ED80217-570B-4DA9-BF44-BE107C0EC166}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D2517915-48CE-4286-970F-921E881B8C5C}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{6BF52A52-394A-11D3-B153-00C04F79FAA6}')

			RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{13EC55CF-D993-475B-9ACA-F4A384957956}')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FAC6E0E1-5D45-4907-BC00-302D702DCC73}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{FAC6E0E1-5D45-4907-BC00-302D702DCC73}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BDF6CE3D-F5C5-4462-9814-3C8EAC330CA8}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BDF6CE3D-F5C5-4462-9814-3C8EAC330CA8}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3A3043D-749E-433F-A26E-6227D5E9BFCD}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{A3A3043D-749E-433F-A26E-6227D5E9BFCD}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B549456D-F5D0-4641-BCED-8648A0C13D83}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{B549456D-F5D0-4641-BCED-8648A0C13D83}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC95951A}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC95951A}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-000000000004}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-000000000004}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-000000000003}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-000000000003}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E8B4F3AA-9509-4081-9A85-914D5E9BEC81}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{E8B4F3AA-9509-4081-9A85-914D5E9BEC81}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-123457123457}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-123457123457}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D848A3CA-0BFB-4DE0-BA9E-A57F0CCA1C13}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{D848A3CA-0BFB-4DE0-BA9E-A57F0CCA1C13}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3611204F-4B3C-11D4-B416-E159A5067F41}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{3611204F-4B3C-11D4-B416-E159A5067F41}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4A2AACF3-ADF6-11D5-98A9-00E018981B9E}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{4A2AACF3-ADF6-11D5-98A9-00E018981B9E}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BEBF337B-9073-4574-9FC1-E0175BB25292}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BEBF337B-9073-4574-9FC1-E0175BB25292}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BEBF337B-9073-4574-9FC1-E0175BB25292}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{BEBF337B-9073-4574-9FC1-E0175BB25292}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC31337F}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{1E1B2879-88FF-11D2-8D96-D7ACAC31337F}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{33414365-E6C7-460d-880A-A163BD69E84D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{33414365-E6C7-460d-880A-A163BD69E84D}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{657B9354-BB3B-4500-A9B0-109B4FA64815}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{657B9354-BB3B-4500-A9B0-109B4FA64815}', 'Compatibility Flags', 'REG_DWORD', '0x00000400')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\E0030804')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\E0030804', 'Layout File', 'REG_SZ', 'KBDUS.DLL')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\E0030804', 'Layout Text', 'REG_SZ', '中文 (简体) - 五笔')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\E0030804', 'IME File', 'REG_SZ', 'winwb86.ime')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\E0030804', 'Layout Display Name', 'REG_SZ', '@%SystemRoot%\system32\input.dll,-0578')

			; 加快等待
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '500')


			; 加快连接
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}')
			RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}', '', 'REG_SZ', 'Printers')

			; 更快的读取网页
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider', 'DnsPriority', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider', 'HostsPriority', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider', 'LocalPriority', 'REG_DWORD', '0x00000001')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider', 'NetbtPriority', 'REG_DWORD', '0x00000001')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '500')



			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\spooler')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\spooler', 'Start', 'REG_DWORD', '0x00000004')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Shellhwdetection')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Shellhwdetection', 'Start', 'REG_DWORD', '0x00000004')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\dhcp')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\dhcp', 'Start', 'REG_DWORD', '0x00000004')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\nla')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\nla', 'Start', 'REG_DWORD', '0x00000004')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control', 'CurrentUser', 'REG_SZ', 'USERNAME')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '200')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control', 'SystemStartOptions', 'REG_SZ', 'NODETECT NOSERIALMICE ')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control', 'RegistrySizeLimit', 'REG_DWORD', '0x01e00000')

			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control', 'CurrentUser', 'REG_SZ', 'USERNAME')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control', 'WaitToKillServiceTimeout', 'REG_SZ', '200')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control', 'SystemStartOptions', 'REG_SZ', 'NODETECT NOSERIALMICE ')
			RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control', 'RegistrySizeLimit', 'REG_DWORD', '0x01e00000')


			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'MenuShowDelay', 'REG_SZ', '400')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'ForegroundLockTimeout', 'REG_SZ', '0')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'UserPreferencesMask', 'REG_BINARY', 'B0120380')
			RegWrite('HKEY_CURRENT_USER\Control Panel\Desktop', 'SmoothScroll', 'REG_DWORD', '0x00000000')
			MsgBox(64, "提示", "优化成功!", 3)


		Case $Button22
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies", "WriteProtect", "REG_DWORD", "00000001")
			MsgBox(64, "提示", "只允许读取!")
			
		Case $Button23
			RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies", "WriteProtect")
			MsgBox(64, "提示", "U盘解锁成功!")
			
		Case $Button24
			RegDelete("HKEY_CURRENT_USER\Control Panel\don't load", "nusrmgr.cpl")
			MsgBox(64, "提示", "用户帐户显示成功!")
			
		Case $Button25
			Run("control userpasswords2");系统自动登陆
		Case $Button26
			RegWrite("HKEY_USERS\.DEFAULT\Control Panel\Desktop", "AutoEndTasks", "REG_SZ", "1")
			RegWrite("HKEY_USERS\.DEFAULT\Control Panel\Desktop", "HungAppTimeout", "REG_SZ", "50")
			RegWrite("HKEY_USERS\.DEFAULT\Control Panel\Desktop", "MenuShowDelay", "REG_SZ", "0")
			RegWrite("HKEY_USERS\.DEFAULT\Control Panel\Desktop", "WaitToKillAppTimeout", "REG_SZ", "100")
			RegWrite("HKEY_CURRENT_USER\Control Panel\Desktop", "AutoEndTasks", "REG_SZ", "1")
			RegWrite("HKEY_CURRENT_USER\Control Panel\Desktop", "HungAppTimeout", "REG_SZ", "50")
			RegWrite("HKEY_CURRENT_USER\Control Panel\Desktop", "MenuShowDelay", "REG_SZ", "0")
			RegWrite("HKEY_CURRENT_USER\Control Panel\Desktop", "WaitToKillAppTimeout", "REG_SZ", "100")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control", "WaitToKillServiceTimeout", "REG_SZ", "1000")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Shutdown", "FastReboot", "REG_SZ", "1")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Memory Management", "ClearPageFileAtShutdown", "REG_DWORD", "00000000")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management", "ClearPageFileAtShutdown", "REG_DWORD", "00000000")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters", "EnablePrefetcher", "REG_DWORD", "00000001")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lanmanserver\parameters", "autosharewks", "REG_DWORD", "00000000")
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem", "aConfigFileAllocSize", "REG_DWORD", "000001f4")
			MsgBox(64, "提示", "加速成功!")
		Case $Button27
			_RunDos(@SystemDir & "\gpedit.msc");打开组策略
			
		Case $Button28
			Run(@SystemDir & "\msconfig.exe");打开系统配置实用程序
			
		Case $Button29
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "about:blank")
			RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "about:blank")
			RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "HomePage", "REG_DWORD", "00000000")
			MsgBox(64, "提示", "IE已恢复空白页!")
			
		Case $Button30
		Case $Button51
		Case $Button52
		Case $Button53
		Case $Button54
		Case $Button55
		Case $Button56
		Case $Button57
		Case $Button58
		Case $Button59
		Case $Button60
		Case $Button61
		Case $Button62
		Case $Button63
		Case $Button64
		Case $Button65
		Case $Button66
		Case $Button67
		Case $Button68
		Case $Button69
		Case $Button70
		Case $Button71
		Case $Button72
		Case $Button73
		Case $Button74
		Case $Button75
		Case $Button76
		Case $Button77
		Case $Button78
		Case $Button79
		Case $Button80
			
			
			
		Case $Button31
			RunWait(@ComSpec & ' /c ' & 'netsh winsock reset', '', @SW_HIDE)
			MsgBox(0, "winsock!", "运行etsh winsock reset完成!需要重启计算机.", 10)
			
			
		Case $Button32

			Case $Button112
			Case $Button113
			Case $Button114
			Case $Button115
			Case $Button116
			Case $Button117
			Case $Button118
			Case $Button119
			Case $Button120
			Case $Button121
			Case $Button122
			Case $Button123
			Case $Button124
			Case $Button125
			Case $Button126
			Case $Button127
			Case $Button128
			Case $Button129
			Case $Button130
			Case $Button131
			Case $Button132
			Case $Button133
			Case $Button134
			Case $Button135
			Case $Button136
			Case $Button137
			Case $Button138
			Case $Button139
			Case $Button140
			Case $Button141
			Case $Button142
			Case $Button143
			Case $Button144
			Case $Button145
			Case $Button146
			Case $Button147
			Case $Button148
			Case $Button149
			Case $Button150


				;		EndSwitch
				
				;	WEnd
;### Tidy Error -> "endswitch" is closing previous "case" on line 179
		EndSwitch
;### Tidy Error -> "wend" is closing previous "switch" on line 178
	WEnd






;### Tidy Error -> while is never closed in your script.
