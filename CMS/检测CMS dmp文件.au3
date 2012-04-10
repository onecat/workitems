#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=C:\Windows\system32\SHELL32.dll|-269
#PRE_Outfile=C:\Users\chtyfox\Desktop\检测CMS dmp文件.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.2.0.0
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作
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
#include <GuiTreeView.au3>
 Local $i = 1
While $i >= 0
    If FileExists ( "C:\Program Files\DVR Soft\DvrClient\RsDvrClient.dmp" ) Then
		FileMove("C:\Program Files\DVR Soft\DvrClient\RsDvrClient.dmp","C:\Users\chty\Desktop\BUG文件\RsDvrClient" & $i & ".dmp")
		FileCopy("C:\Program Files\DVR Soft\DvrClient\DvrClient.exe","C:\Users\chty\Desktop\BUG文件\DvrClient" & $i & ".exe")
			$i= $i+1
			DvrClient()
	EndIf
	Sleep(120*1000)
WEnd

Func DvrClient()
If ProcessExists ("DvrClient.exe") then
	ProcessClose("DvrClient.exe") 
EndIf	
ShellExecute("DvrClient.exe","","C:\Program Files\DVR Soft\DvrClient")
WinWait("User Login")
ControlClick("User Login","","Edit2")
ControlSetText("User Login","","Edit2","1")
ControlClick("User Login","","Button2")
WinWait("Video surveillance client")
WinActivate("Video surveillance client")
$1= ControlGetHandle("Video surveillance client", "", "SysTreeView322");获取树形列表控件句柄
$2=_GUICtrlTreeView_GetText($1)
ControlTreeView ("Video surveillance client", "", "SysTreeView322", "Expand", $2)


$3=_GUICtrlTreeView_GetItemHandle($1,0);返回项目句柄
$4=_GUICtrlTreeView_GetFirstChild($1, $3);检索指定项目的第一个子项
$5=_GUICtrlTreeView_Gettext($1,$4 );检索项目文本
$6 =_GUICtrlTreeView_FindItem($1, $5)

_GUICtrlTreeView_ClickItem($1,$6,"right",True,1,2);点击树形列表项目
Send("{down}")
Sleep(500)
Send("{enter}")
Sleep(500)
_GUICtrlTreeView_ClickItem($1,$6,"right",True,1,2);点击树形列表项目
Send("{down 4}")
Sleep(500)
Send("{enter}")
Sleep(500)

ControlClick("Video surveillance client","","Button7")
$7= ControlGetHandle("Video surveillance client", "", "SysTreeView322");获取树形列表控件句柄
$8=_GUICtrlTreeView_GetText($7)


$9=_GUICtrlTreeView_GetItemHandle($7,0);返回项目句柄
$10=_GUICtrlTreeView_GetFirstChild($7, $9);检索指定项目的第一个子项
$11=_GUICtrlTreeView_Gettext($7,$10 );检索项目文本
$12 =_GUICtrlTreeView_FindItem($7, $11)

_GUICtrlTreeView_ClickItem($7,$12,"right",True,1,2);点击树形列表项目Send("{down}")
Send("{down}")
Sleep(500)
Send("{enter}")
Sleep(500)
EndFunc