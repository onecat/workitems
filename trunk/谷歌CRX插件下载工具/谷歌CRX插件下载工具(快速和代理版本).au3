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
$qi = HotKeySet("^3", "yctptb")

Global $Title = "谷歌CRX插件下载工具", $URLClick = 0
Local $size , $get ,$str
 
$oIE = _IECreateEmbedded() 
$Form1 = GUICreate($Title,  560, 126, -1, -1)
GUICtrlCreateLabel("请输入推送ID:", 10, 7, 87, 17)
$Input1 = GUICtrlCreateInput("cfhdojbkjhnklbpkdaibdccddilifddb", 98, 2, 460, 21)
$Label1 = GUICtrlCreateLabel("使用方法：右键复制插件地址，如adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb" & @CRLF & "取出cfhdojbkjhnklbpkdaibdccddilifddb插件ID放到编辑框内" & @CRLF & "点击下载", 96, 56, 500, 49)
$Label2 = GUICtrlCreateLabel("使用国外的地址解析,解析时间长请耐心等待......强制退出程序请按组合键 CTRL+3", 98, 34, 460, 17)
GUICtrlSetColor($Label2, 0xFF00FF)
$Button1 = GUICtrlCreateButton("下载 CRX", 14, 33, 73, 33)
$Button2 = GUICtrlCreateButton("代理下载CRX", 14, 83, 73, 33, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUICtrlCreateObj($oIE, 1, 1, 1,1)
$Progress1 = GUICtrlCreateProgress(104, 96, 377, 25)
$Label3 = GUICtrlCreateLabel("", 486, 96, 68, 17,$SS_CENTER)
GUICtrlSetColor($Label3, 0x0000FF)
GUISetState(@SW_SHOW)
 
 
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
					GUICtrlSetData($Label3,"")
					xz()
					xzhql()
					AdlibUnRegister("_xun");运行过程中可以终止
				Case $Button2	;代理方式
					AdlibRegister("_xun",100);运行过程中可以终止
					GUICtrlSetData($Label3,"")
					xzd()
					xzhql()
					AdlibUnRegister("_xun");运行过程中可以终止
        EndSwitch
	WEnd

Func xz()
		$a = GetSource("http://chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http.+/(.*crx))">here', 3);href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here
			 wjxz($down[0],$down[1])
			 pdxz($down[0],$down[1])
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

Func wjxz($url,$wjmz);$wjmz下载文件名字
	$get = InetGet($url, @DesktopDir & "\" & $wjmz, 1, 1)
	$size = Int(InetGetSize($url) / 1024)
	AdlibRegister("Down")
	Do
		Sleep(250)
	Until InetGetInfo($get, 2)
EndFunc 

Func pdxz($url,$wjmz)
	$size = Int(InetGetSize($url) / 1024)
	$data = Int(FileGetSize(@DesktopDir & "\" & $wjmz) / 1024)
	If $size = $data Then
		GUICtrlSetData($Label3,"下载完成")
	EndIf	
EndFunc	
	

Func Down()
		$newsize = InetGetInfo($get)
        $pro = Int($newsize[0] / 1024) / $size
        GUICtrlSetData($Progress1, $pro * 100)
        GUICtrlSetData($Label3, "已下载 " &  Int($pro * 100) & "%")	
EndFunc 

Func xzhql()
	AdlibUnRegister( "Down" )
	GUICtrlSetData($Progress1,"")
EndFunc		


Func xzd()
		$a = GetSourced("http://chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http.+/(.*crx))">here', 3)
			 wjxz($down[0],$down[1])
			 pdxz($down[0],$down[1])
		Else
			MsgBox(64, "no", "解析失败！",3)
			Exit
		EndIf
EndFunc 

Func GetSourced($url)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.SetProxy(2,getProxy());设置代理
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

;~ Func getProxy()
;~ 	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
;~ 	For $n = 0 To 4
;~ 		ConsoleWrite($urlP[$n] & @CRLF)
;~ 		$iPing = Ping(StringTrimRight($urlP[$n],3), 500)
;~ 		If $iPing Then Return ($urlP[$n])
;~ 		
;~ 	Next
;~ 	Return ("")
;~ 	
;~ EndFunc   ;==>getProxy


 Func getProxy()
$b="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$strb=GetSource1("http://www.xici.net.co/wt/");http://www.xici.net.co/wt/
If Not StringRegExp($strb,$b) Then
	MsgBox(0,"代理","代理网址" & @CRLF & "打开不开稍后在尝试")
EndIf	
$reg=StringRegExp($strb,$b,3)
;_ArrayDisplay($reg)
For $n= 0 To UBound($reg)/2-1
	$ip=$reg[2*$n]&":"&$reg[2*$n+1] ;& "|"
	ConsoleWrite($ip&@CRLF)
	;FileWrite(@ScriptDir & "\22.txt",$ip&@CRLF)
		$iPing = Ping(StringLeft($ip,StringInStr($ip,":")-1), 500)
		;$iPing = Ping(StringRegExp($urlP[$n],'(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5}):\d{2,5}',3)[0], 500)
		If $iPing Then Return ($ip)	
	Next

EndFunc

Func GetSource1($urls)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $urls, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource	


Func _xun();运行过程中可以终止
	Switch GUIGetMsg()
;~ 		Case $GUI_EVENT_CLOSE
;~ 			Exit 
		Case $Form1
			HotKeySet("^3", "yctptb")
	EndSwitch
EndFunc

Func yctptb();隐藏托盘
	Exit 
EndFunc   ;==>yctptb