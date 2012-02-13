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
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section 
$Form1 = GUICreate("Form1", 623, 442, 192, 124)
$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", 140, 57, 92, 46)
$Checkbox2 = GUICtrlCreateCheckbox("Checkbox2", 154, 134, 97, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Checkbox3", 171, 180, 97, 17)
$Radio1 = GUICtrlCreateRadio("Radio1", 379, 358, 113, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $a = False

While 1	
$nMsg = GUIGetMsg()	

Select 
	Case $nMsg=$GUI_EVENT_CLOSE	

		Exit		
Case $nMsg=$Radio1			

If $a Then 				
GUICtrlSetState($Checkbox1,$GUI_UNCHECKED)	
GUICtrlSetState($Checkbox2,$GUI_UNCHECKED)	
GUICtrlSetState($Checkbox3,$GUI_UNCHECKED)	
		$a = Not $a		
GUICtrlSetState ( $Radio1, $GUI_UNCHECKED )
		
Else				
GUICtrlSetState($Checkbox1,$GUI_CHECKED)	
GUICtrlSetState($Checkbox2,$GUI_CHECKED)	
GUICtrlSetState($Checkbox3,$GUI_CHECKED)	
	$a = Not $a		





EndIf	
            EndSelect

WEnd
