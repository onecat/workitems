#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\lorexp2p检测工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=lorexp2p
#PRE_Res_Description=lorexp2p
#PRE_Res_Fileversion=2.0.0.8
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=lorexp2p SDK 1.01.08
#PRE_Res_SaveSource=y
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
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("Lorex ID检测状态", 467, 438, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 209, 21)
$Input2 = GUICtrlCreateInput("", 240, 40, 209, 21)
$Label2 = GUICtrlCreateLabel("请输入端口", 240, 8, 64, 17)
$UID = GUICtrlCreateLabel("请输入lorex ID", 8, 8, 108, 17)
;$Button1 = GUICtrlCreateButton("获取UID状态", 8, 384, 129, 41)
;$Button2 = GUICtrlCreateButton("退出", 168, 384, 129, 41)
$Button3 = GUICtrlCreateButton("显示lorex ID状态", 328, 384, 129, 41,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("显示", 8, 80, 449, 289)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 268)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "获取lorex ID状态中请等待..........."

$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"_Exit")
TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()

While 1
  $msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			Exit	
;~ 		Case $msg = $Button1
;~ 			
;~ 		Case $msg = $Button2
;~ 			tc()
;~ 			Exit
		Case $msg = $Button3
			GUICtrlSetData ($Label1,$BQ)
			ShellExecute("p2p.exe","",@ScriptDir)
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\OsnClientApp.exe ' & GUICtrlRead($Input1) & " " & GUICtrlRead($Input2) & " " & "0" & " " & ">" & " " & @ScriptDir & '"\lorexp2p.txt"', '', @SW_HIDE)
			line()
			wj()
	EndSelect
WEnd



Func line()
Local $file = FileOpen(@ScriptDir &"\lorexp2p.txt", 0)
Local $j = 1
Local $i = 1
Do
if $j<=15 Then
    Local $line = FileReadLine($file,$j)
	IniWrite(@ScriptDir & "\lorexp2p.ini", "字符", "获取" & $i ,$line)
	$j = $j + 1 
EndIf
   $i = $i + 1
Until $i = 15
FileClose($file)
FileDelete(@ScriptDir & "\lorexp2p.txt")
FileDelete(@ScriptDir & "\version.txt")
EndFunc

Func tutkp2p()
$HQ0 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取1", "")
$HQ1 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取2", "")
$HQ2 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取3", "")
$HQ3 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取4", "")
$HQ4 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取5", "")
$HQ5 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取6", "")
$HQ6 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取7", "")
$HQ7 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取8", "")
$HQ8 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取9", "")
$HQ9 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取10", "")
$HQ10 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取11", "")
$HQ11 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取12", "")
$HQ12 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取13", "")
$HQ13 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取14", "")
$HQ14 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取15", "")
$HQ15 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取16", "")
$HQ16 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取17", "")
;~ $HQ17 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取18", "")
;~ $HQ18 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取19", "")
;~ $HQ19 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取20", "")
;~ $HQ20 = IniRead(@ScriptDir & "\lorexp2p.ini", "字符", "获取21", "")

$HQ = $HQ0 & @CR & $HQ1 & @CR & $HQ2 & @CR & $HQ3 & @CR & $HQ4 & @CR & $HQ5 & @CR & $HQ6 & @CR & $HQ7 & @CR & $HQ8 & @CR & $HQ9 & @CR & $HQ10 & @CR & $HQ11 & @CR & $HQ12 & @CR & $HQ13 & @CR & $HQ14 & @CR & $HQ15 & @CR & $HQ16; & @CR & $HQ17 & @CR & $HQ18 & @CR & $HQ19 & @CR & $HQ20
EndFunc

Func wj()
	If FileExists("lorexp2p.ini") Then
		tutkp2p()
		GUICtrlSetData ($Label1, $HQ)
		FileDelete(@ScriptDir & "\lorexp2p.ini")
		FileDelete(@ScriptDir & "\lorexp2p.txt")
		FileDelete(@ScriptDir & "\version.txt")
	Else
		MsgBox(1,"Lorex ID检测状态","获取Lorex ID检测状态不成功" & @CRLF & "请重新点击获取Lorex ID状态按钮")
EndIf
EndFunc


Func _Exit()
        Exit
EndFunc
;~ Func tc()
;~ 	ProcessClose ("cmd.exe")
;~ 	ProcessClose ("OsnClientApp.exe")
;~ EndFunc	