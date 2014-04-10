#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Outfile=N:\脚源包\workitems\P2P\lorex\p2p.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.14
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
#NoTrayIcon
;~ #include 'msgboxDJS_UDF.au3'
;~ $msg = MsgBoxDJS(0 + 48 + 4, '等待读取lorex ID状态', '等待读取lorex ID状态，' & @CRLF & '请不要做其他操作' & @CRLF & '如果不能自动关闭请手动点“是”', 9, 2)
;~ If $msg = 6 Then 
	Sleep(9000)
	ProcessClose ("cmd.exe")
	ProcessClose ("OsnClientApp.exe")
;~ EndIf

	