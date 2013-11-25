#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\chtyfox\Desktop\au3如何判断系统是WIN8.1.exe
#PRE_Compression=4
#PRE_UseX64=y
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
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
$Kpath = "C:\WINDOWS\system32\kernel32.dll"
                        If FileExists($Kpath) Then
                                $Version = StringLeft(FileGetVersion($Kpath), 3)
                                Switch $Version
                                        Case "5.0"
                                                $Ver = "Win2000"
                                        Case "5.1"
                                                $Ver = "WinXP"
                                        Case "5.2"
                                                $Ver = "Win2003"
                                        Case "6.0"
                                                $Ver = "Vista"
                                        Case "6.1"
                                                $Ver = "Win7"
                                        Case "6.2"
                                                $Ver = "Win8"
                                        Case "6.3"
                                                $Ver = "Win8.1"
                                EndSwitch
                        EndIf


MsgBox(1,"1",$Version)
MsgBox(1,"1",$Ver)