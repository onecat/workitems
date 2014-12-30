#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\ccleaner.ico
#PRE_Outfile=安联插件删除工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.3
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
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("安联插件删除工具", 368, 146, 192, 124)
$Group1 = GUICtrlCreateGroup("安联最新插件删除工具", 8, 16, 349, 65)
$Checkbox1 = GUICtrlCreateCheckbox("DVR UI1.0+UI2.0", 16, 40, 113, 17)
$Checkbox2 = GUICtrlCreateCheckbox("DVR UI3.0", 136, 40, 73, 17)
$Checkbox3 = GUICtrlCreateCheckbox("NVR", 224, 40, 49, 17)
$Checkbox4 = GUICtrlCreateCheckbox("WebCMS", 280, 40, 65, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("确定", 56, 96, 89, 33)
$Button2 = GUICtrlCreateButton("退出", 224, 96, 89, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			IE()
		Case $Button2
			Exit		
	EndSwitch
WEnd

Func IE()
If ProcessExists("iexplore.exe") Then ; Check if the Notepad process is running.
	$MSGcheck = MsgBox(32 + 1, "检测到IE进程存在", "点击确认关闭进程继续进行删除插件" & @CRLF & "点击取消退出删除插件程序")
	If $MSGcheck = 1 Then
		ProcessClose("iexplore.exe")
		CHBOX()
	Else
		Exit
	EndIf
Else
	CHBOX()
EndIf

EndFunc



Func CHBOX()
If GUICtrlRead($Checkbox1) = $GUI_UNCHECKED And GUICtrlRead($Checkbox2)  = $GUI_UNCHECKED And GUICtrlRead($Checkbox3)  = $GUI_UNCHECKED  And GUICtrlRead($Checkbox4) = $GUI_UNCHECKED Then MsgBox(0,"提示","必须要勾选一个插件删除")  
;If GUICtrlRead($Checkbox1) Or GUICtrlRead($Checkbox2) Or GUICtrlRead($Checkbox3) Or GUICtrlRead($Checkbox4) = $GUI_UNCHECKED Then MsgBox(0,"1","1")  
If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then DVR1()
If GUICtrlRead($Checkbox2) = $GUI_CHECKED Then DVR2()
If GUICtrlRead($Checkbox3) = $GUI_CHECKED Then NVR()
If GUICtrlRead($Checkbox4) = $GUI_CHECKED Then WebCMS()
EndFunc


Func DVR1()
If FileExists(@AppDataDir & "\OCX_DVR1") Then
    DirRemove (@AppDataDir & "\OCX_DVR1",1) 
	DVR1_1()
Else
    MsgBox(4096,"DVR UI1.0+UI2.0", "DVR UI1.0+UI2.0插件不存在")
EndIf
EndFunc

Func DVR2()
If FileExists(@AppDataDir & "\OCX_DVR2") Then
    DirRemove (@AppDataDir & "\OCX_DVR2",1)
	DVR2_1()
Else
    MsgBox(4096,"DVR UI3.0", "DVR UI3.0插件不存在")
EndIf
EndFunc

;~ Func DVR3()
;~ If FileExists(@AppDataDir & "\OCX_DVR3") Then
;~     DirRemove (@AppDataDir & "\OCX_DVR3",1) 
;~ 	DVR3_1()
;~ Else
;~     MsgBox(4096,"DVR3", "DVR3插件不存在")
;~ EndIf
;~ EndFunc

Func NVR()
If FileExists(@AppDataDir & "\OCX_NVR") Then
    DirRemove (@AppDataDir & "\OCX_NVR",1) 
	NVR_1()
Else
    MsgBox(4096,"NVR", "NVR插件不存在")
EndIf
EndFunc

Func WebCMS()
If FileExists(@AppDataDir & "\OCX_WebCMS") Then
    DirRemove (@AppDataDir & "\OCX_WebCMS",1) 
	WebCMS_1()
Else
    MsgBox(4096,"WebCMS", "WebCMS插件不存在")
EndIf
EndFunc

Func DVR1_1()
If FileExists(@AppDataDir & "\OCX_DVR1") Then
	MsgBox(4096,"失败", "DVR UI1.0+UI2.0插件删除失败")
Else
	MsgBox(4096,"成功", "DVR UI1.0+UI2.0插件删除成功")
EndIf
EndFunc

Func DVR2_1()
If FileExists(@AppDataDir & "\OCX_DVR2") Then
    MsgBox(4096,"失败", "DVR UI3.0插件删除失败")
Else
    MsgBox(4096,"成功", "DVR UI3.0插件删除成功")
EndIf
EndFunc


;~ Func DVR3_1()
;~ If FileExists(@AppDataDir & "\OCX_DVR3") Then
;~     MsgBox(4096,"失败", "DVR UI3.0插件删除失败")
;~ Else
;~     MsgBox(4096,"成功", "DVR UI3.0插件删除成功")
;~ EndIf
;~ EndFunc


Func NVR_1()
If FileExists(@AppDataDir & "\OCX_NVR") Then
    MsgBox(4096,"失败", "NVR插件删除失败")
Else
    MsgBox(4096,"成功", "NVR插件删除成功")
EndIf
EndFunc

Func WebCMS_1()
If FileExists(@AppDataDir & "\OCX_WebCMS") Then
    MsgBox(4096,"失败", "WebCMS插件删除失败")
Else
    MsgBox(4096,"成功", "WebCMS插件删除成功")
EndIf
EndFunc


#cs
DirCreate(@AppDataDir & "\OCX_DVR1")
DirCreate(@AppDataDir & "\OCX_DVR2")
DirCreate(@AppDataDir & "\OCX_DVR3")
DirCreate(@AppDataDir & "\OCX_NVR")
#ce