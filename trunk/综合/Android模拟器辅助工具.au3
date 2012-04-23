#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\chtyfox\Desktop\11.exe
#PRE_Compression=4
#PRE_Res_Fileversion=0.0.0.0
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

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <WinapiEX.au3>
#Region ### START Koda GUI section ### Form=
$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
$WJM = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名","")
$DNLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "电脑保存路径","")
$AVDLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "修改AVD存储路径","")

$Form = GUICreate("Android模拟器工具", 433, 526, 304, 145)
$Checkbox1 = GUICtrlCreateCheckbox("Android模拟器安装APK", 96, 64, 169, 17)
$Checkbox2 = GUICtrlCreateCheckbox("复制文件到Android模拟器", 96, 97, 169, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Android模拟器复制到电脑", 96, 232, 249, 17)
$Checkbox4 = GUICtrlCreateCheckbox("创建Android系统存放路径", 96, 384, 161, 17)
$Label1 = GUICtrlCreateLabel("Android模拟器安装和复制APK文件", 88, 8, 180, 17)
$Label2 = GUICtrlCreateLabel("创建Android模拟器时必须创建SD卡", 88, 40, 188, 17)
$Label3 = GUICtrlCreateLabel("SDK-platform-tools路径", 12, 132, 132, 17)
$Label4 = GUICtrlCreateLabel("安装和复制的APK文件路径", 12, 172, 138, 17)
$Label5 = GUICtrlCreateLabel("Android模拟器APK文件名", 12, 270, 136, 17)
$Label6 = GUICtrlCreateLabel("注意:APK文件不能用" & @CRLF & "中文只能用数字和字" & @CRLF & "母如QQ.apk。如QQ版" & @CRLF & "本为1.1已安装,想安" & @CRLF & "装QQ1.2必须先删除" & @CRLF & "QQ1.1" , 304, 32, 174, 75)
$Label7 = GUICtrlCreateLabel("电脑保存路径", 12, 308, 138, 17)
$Label8 = GUICtrlCreateLabel("创建Android系统存放路径", 16, 428, 144, 17)
$Input1 = GUICtrlCreateInput($SDK, 160, 128, 169, 21)
$Input2 = GUICtrlCreateInput($APKLJ, 160, 168, 169, 21)
$Input3 = GUICtrlCreateInput($WJM, 160, 266, 169, 21)
$Input4 = GUICtrlCreateInput($DNLJ, 160, 304, 169, 21)
$Input5 = GUICtrlCreateInput($AVDLJ, 160, 424, 169, 21)
$Button1 = GUICtrlCreateButton("确定", 72, 482, 105, 25,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("取消", 253, 482, 105, 25)
$Button3 = GUICtrlCreateButton("手动设置路径", 336, 126, 81, 25)
$Button4 = GUICtrlCreateButton("手动设置路径", 336, 166, 81, 25)
$Button5 = GUICtrlCreateButton("手动设置路径", 336, 302, 81, 25)
$Button6 = GUICtrlCreateButton("手动设置路径", 336, 422, 81, 25)
$Group1 = GUICtrlCreateGroup("Android模拟器复制到电脑", 8, 208, 417, 137)
$Group2 = GUICtrlCreateGroup("修改AVD存储路径(创建Android系统存放路径)", 8, 360, 417, 105)
$Edit1 = GUICtrlCreateEdit(" 建议使用Android-AVD文件夹", 255, 383, 161, 17, $ES_READONLY)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Select 
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button2
			Exit
		Case $nMsg = $Button6
			sdAVDLJT()
		Case $nMsg = $Button5
			sdDNLJ()
		Case $nMsg = $Button4
			sdAPK()
		Case $nMsg = $Button3
			sdSDK()
		Case $nMsg = $Button1
			GUISetState(@SW_HIDE,$Form)
			csh()
			Exit
	EndSelect
WEnd

Func csh()
	If BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) Then
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径", GUICtrlRead ($Input1)) 
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径",GUICtrlRead ($Input2))
		Sleep(1000)
		_SDK()
	ElseIf BitAND(GUICtrlRead($Checkbox2), $GUI_CHECKED) Then
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径", GUICtrlRead ($Input1)) 
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径",GUICtrlRead ($Input2))
		Sleep(1000)
		_APKFZ()
	EndIf
	If BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) And BitAND(GUICtrlRead($Checkbox2), $GUI_CHECKED) Then ;BitAnd 比较前后两个值
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径", GUICtrlRead ($Input1))
		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径",GUICtrlRead ($Input2))
		Sleep(1000)
		_APKFZ()
	EndIf
	If BitAND(GUICtrlRead($Checkbox3), $GUI_CHECKED) Then ;BitAnd 比较前后两个值	
 		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名",GUICtrlRead ($Input3))	
 		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "电脑保存路径",GUICtrlRead ($Input4))
 		Sleep(1000)
 		_DNLJ()
 	EndIf
	If BitAND(GUICtrlRead($Checkbox4), $GUI_CHECKED) Then ;BitAnd 比较前后两个值	
 		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "修改AVD存储路径",GUICtrlRead ($Input5))	
		DirCreate(GUICtrlRead ($Input5))
 		Sleep(1000)
 		_AVDLJT()
 	EndIf
EndFunc


Func _SDK()
	$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
	$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
	RunWait(@ComSpec & ' /c ' & StringLeft($SDK, StringInStr($SDK, '\')), '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'cd ' & $SDK, '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'adb install ' & $APKLJ, '', @SW_HIDE)
	MsgBox(0,"APK文件","安装成功")
EndFunc	
		
Func _APKFZ()
	$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
	$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
	$array = StringSplit($APKLJ, '\')
    $num = $array[0]
	RunWait(@ComSpec & ' /c ' & StringLeft($SDK, StringInStr($SDK, '\')), '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'cd ' & $SDK, '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'adb push '& $APKLJ &  ' /sdcard/' & $array[$num], '', @SW_HIDE)
	MsgBox(0,"APK文件复制","复制成功")
EndFunc	

Func _DNLJ()
	$WJM = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名","")
	$DNLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "电脑保存路径","")
	RunWait(@ComSpec & ' /c ' & 'adb pull /sdcard/' & $WJM & ' ' & $DNLJ & $WJM, '', @SW_HIDE)
	MsgBox(0,"APK文件复制","复制成功")
EndFunc	

Func _AVDLJT()
	$AVDLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "修改AVD存储路径","")
	_EnvCreate("ANDROID_SDK_HOME",$AVDLJ)
	EnvUpdate()
	MsgBox(0,"修改存储路径","修改AVD存储路径成功")
EndFunc	

Func sdSDK();手动设置路径 SDK文件路径
		$SDKT  = FileSelectFolder("请指定Android模拟器所在路径", "")
		If @error Then
			MsgBox(4096,"","没有选择文件夹!")
		Else
			GUICtrlSetData($Input1, _WinAPI_PathAddBackslash($SDKT))
		EndIf
		
	EndFunc
	
Func sdAPK();手动设置路径 APK文件名路径
		$APKT  = FileOpenDialog("请指定APK文件所在路径", "", "可执行文件(*.apk)|所有文件(*.*)", 3, "")
		If @error Then
			MsgBox(4096,"","没有选择文件!")
		Else
			GUICtrlSetData($Input2, $APKT)
		EndIf
		
	EndFunc
	
Func sdDNLJ();手动设置路径 电脑保存路径
		$DNLJT  = FileSelectFolder("请指定Android模拟器所在路径", "")
		If @error Then
			MsgBox(4096,"","没有选择文件夹!")
		Else
			GUICtrlSetData($Input4, _WinAPI_PathAddBackslash($DNLJT))
		EndIf
		
	EndFunc
	
Func sdAVDLJT();手动设置路径 修改AVD存储路径(创建Android系统存放路径)
		$AVDLJT  = FileSelectFolder("请指定Android模拟器所在路径", "")
		If @error Then
			MsgBox(4096,"","没有选择文件夹!")
		Else
			;GUICtrlSetData($Input5, _WinAPI_PathAddBackslash($AVDLJT)); & "Android-AVD")
			GUICtrlSetData($Input5, $AVDLJT)
		EndIf
		
	EndFunc
	
;系统环境变量写入
#cs===========================================
;_EnvCreate(名称,值)
_EnvCreate("test","This is test")
;_EnvSet(名称,值)
_EnvSet("test","is trim")
;_EnvDel(名称)
_EnvSet("test")
#ce===========================================
Func _EnvCreate($_EnvName,$_EnvValue)
$strComputer = "."
$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\cimv2")
$objVariable = $objWMIService.Get("Win32_Environment").SpawnInstance_   ;使用spawninstance_方法，创建空白环境变量
;设置环境变量属性
$objVariable.Name = $_EnvName
$objVariable.UserName = "<System>"
$objVariable.VariableValue = $_EnvValue
$objVariable.Put_  ;提交完成
Return SetError(-1)
EndFunc

Func _EnvSet($_EnvName,$_EnvValue)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment",$_EnvName,"REG_SZ",$_EnvValue)
Return SetError(@error)
EndFunc

Func _EnvDel($_EnvName)
RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment",$_EnvName)
Return SetError(@error)
EndFunc
#cs	
安装文件
k:
cd k:\android-sdk-windows\platform-tools

adb install d:\b.apk


pause

RunWait(@ComSpec & ' /c ' & 'k:', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'cd k:\android-sdk-windows\platform-tools', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'adb install d:\a.apk', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'pause', '', @SW_HIDE)

复制文件 模拟器
k:
cd k:\android-sdk-windows\platform-tools

adb push d:\b.apk /sdcard/b.apk

pause


RunWait(@ComSpec & ' /c ' & 'k:', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'cd k:\android-sdk-windows\platform-tools', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'adb push d:\b.apk /sdcard/b.apk', '', @SW_HIDE)
RunWait(@ComSpec & ' /c ' & 'pause', '', @SW_HIDE)

模拟器复制到电脑
adb pull /sdcard/b.apk k:\b.apk
RunWait(@ComSpec & ' /c ' & 'adb pull /sdcard/b.apk k:\b.apk', '', @SW_HIDE)

获取D盘的方法
$path='D:\11'

$path='D:\11'
MsgBox(0, '', StringLeft($path, StringInStr($path, '\')))

获取D盘的方法11.exe
$path = 'D:\11\11.exe'
$array = StringSplit($path, '\')
$num = $array[0] ;第一个元素($array[0])保存拆分后子串的数量
MsgBox(0, '', $array[$num])

#ce		