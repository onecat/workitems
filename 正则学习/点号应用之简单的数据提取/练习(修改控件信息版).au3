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
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("正则", 615, 438, 192, 124)
$Edit1 = GUICtrlCreateEdit(bb(), 40, 48, 513, 313)
GUICtrlSetData(-1,bb())
$Button1 = GUICtrlCreateButton("正则", 160, 384, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			;MsgBox(0,"正则点号结果",GUICtrlRead($Edit1))
			MsgBox(0,"正则点号结果",zz())
	EndSwitch
WEnd

Func zz()
	 	If StringRegExp (GUICtrlRead($Edit1),"4.......8") then;加个判断 防止不匹配时直接退出
			$h = StringRegExp (GUICtrlRead($Edit1),"4.......8",3);第三个参数选择3 是全局匹配  返回的是数组
			Return $h[0]
			EndIf
;~ 	
EndFunc	

Func bb()
$string = _ 
'</table>' & @CRLF & _
'<table cellpadding="0" cellpadding="0" class="formtable">' & @CRLF & _
'<tr>' & @CRLF & _
'<th>MSN:</th>' & @CRLF & _
'<td></td>' & @CRLF & _
'</tr>' & @CRLF & _
'<tr>' & @CRLF & _
'<th><font color=red>绑定QQ</font>:</th>' & @CRLF & _
'<td>' & @CRLF & _
'413188828&nbsp;' & @CRLF & _
'</td>' & @CRLF & _
'</tr><tr>' & @CRLF & _
'<th><font color=green>绑定YY号</font>:</th>' & @CRLF & _
'<td>' & @CRLF & _
'71082718&nbsp;' & @CRLF & _
'</td>' & @CRLF & _
'</tr></table>' & @CRLF & _
'</div>'
Return $string
EndFunc
