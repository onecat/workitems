#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=N:\翻墙\谷歌浏览器\GoogleChromePortable\ChromePortable.exe|-1
#PRE_Outfile=C:\Users\chtyfox\Desktop\谷歌CRX插件下载工具.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.0
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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <IE.au3>
;~ Opt("TrayIconHide", 0)
;~ Opt("TrayMenuMode", 3) ;没有默认的（暂停脚本和退出）菜单. 
;~ Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘.

Global $Title = "谷歌CRX插件下载工具", $URLClick = 0
 
$oIE = _IECreateEmbedded() 
$Form1 = GUICreate($Title,  560, 98, -1, -1)
GUICtrlCreateLabel("请输入推送ID:", 10, 7, 87, 17)
$Input1 = GUICtrlCreateInput("", 98, 2, 460, 21)
$Label1 = GUICtrlCreateLabel("使用方法：右键复制插件地址，如adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb" & @CRLF & "取出cfhdojbkjhnklbpkdaibdccddilifddb插件ID放到编辑框内" & @CRLF & "点击下载", 96, 56, 500, 49)
$Label2 = GUICtrlCreateLabel("使用国外的地址解析所以解析时间长请耐心等待......", 98, 34, 460, 17)
GUICtrlSetColor($Label2, 0xFF00FF)
$Button1 = GUICtrlCreateButton("下载 CRX", 14, 37, 73, 49, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUICtrlCreateObj($oIE, 1, 1, 1,1)
GUISetState(@SW_SHOW)
 
;~ $ttc = TrayCreateItem("退出")
;~ TrayItemSetOnEvent($ttc, "ExitScript") ;退 出程序
;~ TraySetClick(8) 
 
While 1
        $MouseInfo = GUIGetCursorInfo($Form1)
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] = $Input1 Then $URLClick = 1
        EndIf
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] <> $Input1 And $MouseInfo[4] <> $Button1 Then $URLClick = 0
        EndIf
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
                     Exit
				 Case $Button1 
					AdlibRegister("_xun",100);运行过程中可以终止
					xz()
					AdlibUnRegister("_xun");运行过程中可以终止
        EndSwitch
	WEnd
	
Func xz()
		$a = GetSource("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here', 3)
;~ 			ConsoleWrite($down[0] & @CRLF);下载地址
;~ 			MsgBox(0,"",$down[0])
			 _IENavigate($oIE, $down[0])
			$URLClick = 0
;~ 			ConsoleWrite($down[1]);文件名
		Else
			MsgBox(64, "no", "解析失败！",3)
			Exit
		EndIf
EndFunc 
 
Func GetSource($url)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

Func _xun();运行过程中可以终止
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit 
	EndSwitch
EndFunc