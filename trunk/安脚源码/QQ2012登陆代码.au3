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

$usr = "马化腾Q号";马化腾Q号
$pwd = "马化腾密码";马化腾密码
#include <Process.au3>
$ExistEdit1=0
Run(StringRegExpReplace(RegRead('HKEY_CLASSES_ROOT\Tencent\DefaultIcon', ''), '[^\\]+$', '') & 'QQ.exe')
WinWait("QQ2012")
$Newusr = StringRegExp($usr, "(.)", 3)
$Newpwd = StringRegExp($pwd, "(.)", 3)
Do 
$list=WinList('[class:TXGuiFoundation]')
For $u=1 To $list[0][0]
$LPID=WinGetProcess($list[$u][1])
If _ProcessGetName($LPID)="QQ.exe" Then
$POS=WinGetPos($list[$u][1])
$ExistEdit1=ControlSend($list[$u][1], "", "Edit1", "+{tab}")
If $ExistEdit1 Then
Local $QQ[5]=[$list[$u][1],$POS[0],$POS[1],$POS[2],$POS[3]]
ExitLoop
EndIf
EndIf
Next
Sleep(300)
Until $ExistEdit1
Do 
Sleep(300)
Until ControlSend($QQ[0], "", "Edit1", "+{tab}")
For $n = 0 To StringLen($usr) - 1
ControlSend($QQ[0], "", "", $Newusr[$n],1)
Next
For $n = 0 To 15
ControlSend($QQ[0], "", "Edit1", "{BS}")
Next
For $n = 0 To StringLen($pwd) - 1
ControlSend($QQ[0], "", "Edit1", $Newpwd[$n],1)
Next
ControlSend($QQ[0], "", "Edit1", "{enter}")