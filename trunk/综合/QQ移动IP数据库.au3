#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\综合软件\3D风格ICO图标\paint.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\QQ移动IP数据库.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.0.0.0
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
#region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:3.9.9.0
	脚本作者:小站
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

FileInstall("ip.exe", @ScriptDir & "\")
FileInstall("RunToKillQQAdIP.exe", @ScriptDir & "\")
FileDelete(@ScriptDir & "\QQWry.DAT")
FileDelete(@ScriptDir & "\CoralWry.dat")
ShellExecute("ip.exe", "", @ScriptDir)
WinWait("错误", "确定", 5)
ControlClick("错误", "确定", "Button1")
ControlClick("纯真IP地址数据库 （CZ88.NET）", "在线升级", "TBitBtn1")
WinWait("错误", "确定", 5)
ControlClick("错误", "确定", "Button1")
WinWait("纯真版IP数据库（CZ88.NET）", "升级")
ControlClick("纯真版IP数据库（CZ88.NET）", "升级", "TButton2")
WinWait("信息", "确定")
ControlClick("信息", "确定", "Button1")
ControlClick("纯真版IP数据库（CZ88.NET）", "退出", "TButton1")
ControlClick("纯真IP地址数据库 （CZ88.NET）", "退出", "TBitBtn3")
FileDelete(@ScriptDir & "\IPwry.exe")
ShellExecute("RunToKillQQAdIP.exe", "", @ScriptDir)
WinWait("管理员:  纯真IP数据库转换为KillQQAd适用IP数据库")
For $i = 5000 To 1 Step -1
	If ProcessExists("RunToKillQQAdIP.exe") Then ; Check if the Notepad process is running.
		WinActivate("管理员:  纯真IP数据库转换为KillQQAd适用IP数据库")
		Send("{enter}")
	Else
		FileMove("CoralWry.dat", RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Tencent\QQ2009", "Install") & "\Bin\HKDlls", 1);CoralWry.dat
		ExitLoop
	EndIf

Next

FileDelete(@ScriptDir & "\ip.exe")
FileDelete(@ScriptDir & "\RunToKillQQAdIP.exe")
FileDelete(@ScriptDir & "\QQWry.DAT")

$t = FileGetTime(RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Tencent\QQ2009", "Install") & "\Bin\HKDlls" & "\CoralWry.dat", 0)
If Not @error Then
	Local $yyyymd = $t[0] & "/" & $t[1] & "/" & $t[2]
	MsgBox(4096, "CoralWry:", "CoralWry修改日期:" & $yyyymd)
EndIf



