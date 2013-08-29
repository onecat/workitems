#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\QQ\3D风格ICO图标\quitime.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\QQ解决不显示手机在线图标.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=1.0.0.4
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
#include <WinAPI.au3>

If ProcessExists("QQ.exe") Then ; Check if the Notepad process is running.
    $ms = MsgBox(1, "QQ显示手机在线图标", "请关闭QQ进程才使用本工具")
	ms()
Else
    QQ()
EndIf

Func ms()
	If $ms=1 Then
		QQ()
	Else
		Exit
	EndIf
EndFunc	

Func QQ()
$QQpach=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\TENCENT\QQ2009", "Install") & "\Misc\CSC\2052\9"
$QQTEP=@AppDataDir & "\Tencent\QQ\Misc\CSC\2052\9"
$QQWJ= @AppDataDir & "\Tencent\QQ\Misc\CSC\2052\9\18"
FileInstall("C:\Users\chtyfox\Desktop\18" , $QQpach & "\18",1)
FileDelete($QQTEP & "\18")
_WinAPI_CreateFile($QQWJ,1, "","",4)
EndFunc