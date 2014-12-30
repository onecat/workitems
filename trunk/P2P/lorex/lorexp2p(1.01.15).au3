#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\lorexp2p检测工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=lorexp2p
#PRE_Res_Description=lorexp2p
#PRE_Res_Fileversion=3.0.0.0
#PRE_Res_LegalCopyright=lorexp2p SDK 1.01.15
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
$Form1_1 = GUICreate("Lorex ID检测状态", 468, 462, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 209, 21)
$Input2 = GUICtrlCreateInput("", 240, 40, 209, 21)
$Label2 = GUICtrlCreateLabel("请输入端口", 240, 8, 64, 17)
$UID = GUICtrlCreateLabel("请输入lorex ID", 8, 8, 108, 17)
;$Button1 = GUICtrlCreateButton("获取UID状态", 8, 384, 129, 41)
;$Button2 = GUICtrlCreateButton("退出", 168, 384, 129, 41)
$Button3 = GUICtrlCreateButton("显示lorex ID状态", 328, 411, 129, 41,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("显示", 8, 80, 449, 321)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 292)
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
			ShellExecute("p2p.exe","",@ScriptDir,"", @SW_HIDE)
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\P2PClientApp.exe ' & GUICtrlRead($Input1) & " " & GUICtrlRead($Input2) & " " & "0" & " " & ">" & " " & @ScriptDir & '"\P2Plorex.txt"', '', @SW_HIDE)
			Sleep(10*1000)
			SCKH()
			GUICtrlSetData ($Label1,P2PJG())
			FileDelete(@ScriptDir &"\P2P.txt")
		EndSelect
	WEnd


Func SCKH()
$path = @ScriptDir & "\P2Plorex.txt"
$newfile = StringTrimRight($path, 9) & '.txt'
If FileExists($newfile) Then FileDelete($newfile)
FileWrite($newfile, _nochongfu($path))
FileDelete(@ScriptDir &"\P2Plorex.txt")
FileDelete(@ScriptDir &"\version.txt")
EndFunc

Func _nochongfu($path_txt);去除文本空行
	If StringRight($path_txt, 4) <> '.txt' Then $path_txt &= '.txt'
	Local $file = FileOpen($path_txt, 0)
	Local $sTXT = FileRead($file)
	FileClose($file)
	$sTXT = StringRegExp($sTXT, '(?m)(?>\h*\S+)+', 3)
	Local $str_txt = ""
	For $i = 0 To UBound($sTXT) - 1
		If Not $sTXT[$i] = "" Then $str_txt &= $sTXT[$i] & @CRLF
	Next
	Return ($str_txt);去除文本空行
EndFunc   ;==>_nochongfu

Func P2PJG()
	Local $aFiles = @ScriptDir & "\P2P.txt"
	$aFile = FileOpen($aFiles)
	$aFileStrings = FileRead($aFile)
	FileClose($aFile)
	Return $aFileStrings
EndFunc   ;==>



Func _Exit()
        Exit
EndFunc
;~ Func tc()
;~ 	ProcessClose ("cmd.exe")
;~ 	ProcessClose ("OsnClientApp.exe")
;~ EndFunc	