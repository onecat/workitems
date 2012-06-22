#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\综合软件\3D风格ICO图标\limewirexx.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\RVMS.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=3.3.2.0
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作
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
 Local $i = 1
While $i >= 0
    If ProcessExists ( "CuClient.exe" ) Then
		Sleep(10*1000)
		ProcessClose("CuClient.exe") 
		DvrClient()
	EndIf
	
WEnd

Func DvrClient()
ShellExecute("CuClient.exe","","j:\CuClient")
WinWait("RVMS平台-监控客户端")
WinActivate("RVMS平台-监控客户端")
BlockInput(1)
Send("{enter}")
BlockInput(0)
IniWrite(@ScriptDir & "\RVMS.ini", "次数", "运行次数", $i)
 IniWrite(@ScriptDir & "\RVMS.ini", "保存时间", "时间",  @year & "/" & @MON & "/"   & @mday & " " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF)
$i=$i+1
 EndFunc


