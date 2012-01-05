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
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
$WJM = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名","")
$DNLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "电脑保存路径","")

$Form = GUICreate("Android模拟器工具", 430, 403, 900, 276)
$Label1 = GUICtrlCreateLabel("Android模拟器安装和复制APK文件", 88, 8, 180, 17)
$Label2 = GUICtrlCreateLabel("创建Android模拟器时必须创建SD卡", 88, 40, 188, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Android模拟器安装APK", 96, 64, 169, 17)
$Checkbox2 = GUICtrlCreateCheckbox("复制文件到Android模拟器", 96, 97, 169, 17)
$Label3 = GUICtrlCreateLabel("SDK-platform-tools路径",  12, 172, 132, 17)
$Label4 = GUICtrlCreateLabel("安装和复制的APK文件路径",  12, 212, 138, 17 )
$Label5 = GUICtrlCreateLabel("Android模拟器APK文件名", 12, 260, 136, 17)
$Label6 = GUICtrlCreateLabel("注意:APK文件不能用" & @CRLF & "中文只能用数字和字" & @CRLF & "母如QQ.apk" , 304, 32, 174, 75)
$Label7 = GUICtrlCreateLabel("电脑保存路径", 12, 300, 138, 17)
$Input1 = GUICtrlCreateInput($SDK, 160, 168, 169, 21)
$Input2 = GUICtrlCreateInput($APKLJ, 160, 208, 169, 21)
$Input3 = GUICtrlCreateInput($WJM, 160, 256, 169, 21)
$Input4 = GUICtrlCreateInput($DNLJ, 160, 296, 169, 21)
$Button1 = GUICtrlCreateButton("确定", 72, 360, 105, 25,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("取消", 253, 360, 105, 25)
$Button3 = GUICtrlCreateButton("手动设置路径", 336, 166, 81, 25)
$Button4 = GUICtrlCreateButton("手动设置路径", 336, 206, 81, 25)
$Button5 = GUICtrlCreateButton("手动设置路径", 336, 294, 81, 25)
$Radio1 = GUICtrlCreateRadio("Android模拟器复制到电脑", 96, 128, 161, 17)
$Group1 = GUICtrlCreateGroup("Android模拟器复制到电脑", 8, 232, 417, 113)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Select 
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button2
			Exit
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
		Case $nMsg = $Radio1
			GUICtrlSetState($Radio1, BitAND(BitOR($gui_checked, $gui_unchecked), BitNOT(GUICtrlRead($Radio1))))
			consolewrite(GUICtrlRead($Radio1)&@cr)
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
 	If BitAND(GUICtrlRead($Radio1), $GUI_CHECKED) Then ;BitAnd 比较前后两个值	
 		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名",GUICtrlRead ($Input3))	
 		IniWrite(@ScriptDir & "\Android模拟器.ini", "Android", "电脑保存路径",GUICtrlRead ($Input4))
 		Sleep(1000)
 		_DNLJ()
 	EndIf	
EndFunc


Func _SDK()
	$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
	$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
	RunWait(@ComSpec & ' /c ' & StringLeft($SDK, StringInStr($SDK, '\')), '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'cd ' & $SDK & '\platform-tools', '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'adb install ' & $APKLJ, '', @SW_HIDE)
	MsgBox(0,0,"SDK")
EndFunc	
		
Func _APKFZ()
	$SDK = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "SDK-platform-tools路径","")
	$APKLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "安装和复制的APK文件路径","")
	$array = StringSplit($APKLJ, '\')
    $num = $array[0]
	RunWait(@ComSpec & ' /c ' & StringLeft($SDK, StringInStr($SDK, '\')), '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'cd ' & $SDK & '\platform-tools', '', @SW_HIDE)
	RunWait(@ComSpec & ' /c ' & 'adb push '& $APKLJ &  ' /sdcard/' & $array[$num], '', @SW_HIDE)
	MsgBox(0,0,"APK")
EndFunc	

Func _DNLJ()
	$WJM = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "Android模拟器APK文件名","")
	$DNLJ = IniRead(@scriptdir & "\Android模拟器.ini", "Android", "电脑保存路径","")
	RunWait(@ComSpec & ' /c ' & 'adb pull /sdcard/' & $WJM & ' ' & $DNLJ & $WJM, '', @SW_HIDE)
	;RunWait(@ComSpec & ' /c ' & 'adb pull /sdcard/b.apk k:\b.apk', '', @SW_HIDE)
	MsgBox(0,0,'DNLJ')
EndFunc	


Func sdSDK();手动设置路径 SDK文件路径
		$SDKT  = FileSelectFolder("请指定Android模拟器所在路径", "")
		If @error Then
			MsgBox(4096,"","没有选择文件夹!")
		Else
			GUICtrlSetData($Input1, $SDKT  & "\")
		EndIf
		
	EndFunc
	
Func sdAPK();手动设置路径 APK文件路径
		$APKT  = FileOpenDialog("请指定FT-200W文件所在路径", "", "可执行文件(*.apk)|所有文件(*.*)", 3, "")
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
			GUICtrlSetData($Input4, $DNLJT  & "\")
;~ 			#Include <WinAPIEx.au3>
;~ _WinAPI_PathSearchAndQualify
;~ 这是api的方法
;~ 			$2 = stringreplace($DNLJT,'\\','\')
;~ 			MsgBox(0,0,$2)
;~ 			GUICtrlSetData($Input4,$2)
		EndIf
		
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