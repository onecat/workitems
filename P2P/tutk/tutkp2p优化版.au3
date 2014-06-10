#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\tutkp2p检测工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=tutkp2p
#PRE_Res_Description=tutkp2p
#PRE_Res_Fileversion=3.0.0.2
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=tutkp2p
#PRE_Res_requestedExecutionLevel=highestAvailable
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
#include <Constants.au3>
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("TUTK UID检测状态", 467, 318, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 449, 21)
$UID = GUICtrlCreateLabel("请输入UID", 8, 8, 60, 17)
$Button1 = GUICtrlCreateButton("显示UID状态", 328, 280, 129, 30,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("显示", 8, 80, 449, 193)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 172)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "请等待，获取TUTK UID状态中..........." 

$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"_Exit")
TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()

While 1
	$msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			tc()
			_Exit()
		Case $msg = $Button1
			GUICtrlSetData ($Label1, $BQ)
			$HQ =_RunEcho(@ScriptDir & "\tutkp2p.exe " & GUICtrlRead($Input1))
			tc()
			GUICtrlSetData ($Label1, $HQ)
	EndSelect
WEnd

;命令行回显返回
;       回显CMD命令执行后的信息
;$var = 命令的参数
;$cmd = 执行的命令 
;by:绿色风 2014.5.2
 Func _RunEcho($cmd,$var = "")  
        Local $foo = Run(@ComSpec & " /c " & $cmd & "  " & $var,  _
                        @ScriptDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
						Sleep(500)
        Local $sDat
        While 1
                $sDat1 = StdoutRead($foo) ;获取数据流
                If @error Then ExitLoop
                $sDat &= $sDat1
        WEnd
        Return $sDat
EndFunc   ;==>_RunEcho
	
Func tc()
	ProcessClose ("cmd.exe")
	ProcessClose ("tutkp2p.exe")
EndFunc	
	

Func _Exit()
        Exit
EndFunc

