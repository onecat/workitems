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
#Include <GuiListView.au3>
Dim $h=MsgBox(1, "请注意", "确定你已经右键添加自定义组才能运行本程序")
    if  $h<>1  Then
    Exit 0
EndIf 
WinActivate("自定义组设置")
ControlClick("自定义组设置","","Edit1","left",2)
ControlSetText ( "自定义组设置", "", "Edit1", "常联系") 
Sleep(500)
ControlClick("自定义组设置","","Button3")
 WinWaitActive("选择联系人")
WinActivate("选择联系人","")  ;激活指定的窗口(设置焦点到该窗口,使其成为活动窗口)
ControlClick("选择联系人","","Button2")

;~ edit()
;~ Send("20172");曾慧
;~ Sleep(500)
;~ b7()
;~ b8()
;~ Sleep(500)
;~ edit()
;~ Send("20118");陈春举
;~ Sleep(500)
;~ b7()
;~ b8()
;~ Sleep(500)
edit()
Send("20027");邓波
sl()
b7()
b8()
sl()

edit()
Send("20128");何伟
sl()
b7()
b8()
sl()

edit()
Send("20017");黄超
sl()
b7()
b8()
sl()

edit()
Send("20026");李金彪
sl()
b7()
b8()
sl()

edit()
Send("20136");庞继锋
sl()
b7()
b8()
sl()

edit()
Send("20022");邱利
sl()
b7()
b8()
sl()

edit()
Send("20306");孙会军
sl()
b7()
b8()
sl()

edit()
Send("20305");王浩
sl()
b7()
b8()
sl()

edit()
Send("20350");吴昕
sl()
b7()
b8()
sl()

edit()
Send("20220");杨大均
sl()
b7()
b8()
sl()

edit()
Send("20097");杨运红
sl()
b7()
b8()
sl()

edit()
Send("20334");李铿
sl()
b7()
b8()
sl()

edit()
Send("20360");刘晓林
sl()
b7()
b8()
sl()

edit()
Send("20184");杨燕
sl()
b7()
b8()
ControlClick("选择联系人","","Button12")

Sleep(500)
ControlClick("自定义组设置","","Button1")

Func sl()
	Sleep(800)
EndFunc

Func edit()
	ControlClick("选择联系人","","Edit1")
EndFunc

Func b7()
	ControlClick("选择联系人","","Button7")
EndFunc	

Func b8()
	ControlClick("选择联系人","","Button8")
EndFunc	
