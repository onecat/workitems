#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\ADMuncher最终汉化版\奶牛CJX更新提示.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\奶牛CJX更新提示.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.0.0.6
#PRE_Res_LegalCopyright=小站制作
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
;#PRE_Outfile=C:\Users\xiaozhan\Desktop\奶牛CJX更新提示.exe
;#PRE_Icon=N:\工具\QQ\3D风格ICO图标\deamon.ico
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
#include <File.au3>
#Include <WinAPIEx.au3>
#Include <String.au3>
#include <IE.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;~ #include <MSHtml.au3>
;~ #include <IEEX.au3>
If  ProcessExists("AdMunch.exe") Then ; 检查记事本进程是否正在运行.
	bbhdb()
Else
    MsgBox(0, "检测奶牛CJX版本", "奶牛没有运行，请运行奶牛后在运行本工具")
	;Exit
EndIf




Func bbhdb();判断网络CJX规则和本地CJX规则 
	$HBD = _StringToHex(BDCJXGZ())
	$HWL = _StringToHex(WLCJXGZ())
	If $HWL <= $HBD Then
		 MsgBox(0,"奶牛CJX规则","奶牛CJX规则已经是最新" & @CRLF & "新版本   ：" & WLCJXGZ() & @CRLF & "本地版本：" & BDCJXGZ())
		 Exit
	 Else
		 gxgz()
		 ;MsgBox(0,"奶牛CJX规则","奶牛CJX规则有新版本请及时更新"& @CRLF & "新版本   ：" & WLCJXGZ() & @CRLF & "本地版本：" & BDCJXGZ())
		 ;Exit
	EndIf
EndFunc   ;==>bbhdb


Func gxgz()
$Form1_1 = GUICreate("奶牛CJX规则", 230, 147, -1, -1)
$Label1 = GUICtrlCreateLabel("网络规则版本号：", 8, 40, 96, 17)
GUICtrlSetColor(-1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("", 128, 40, 88, 17)
GUICtrlSetData($Label2, WLCJXGZ())
GUICtrlSetColor($Label2, 0x3399FF)
$Label3 = GUICtrlCreateLabel("本地规则版本号：", 8, 72, 100, 17)
GUICtrlSetColor(-1, 0x6633CC)
$Label4 = GUICtrlCreateLabel("", 128, 72, 88, 17)
GUICtrlSetData($Label4, BDCJXGZ())
GUICtrlSetColor($Label4, 0x9932CC)
$Label5 = GUICtrlCreateLabel("奶牛CJX规则有新版本请及时更新", 24, 8, 179, 17)
GUICtrlSetColor($Label5, 0xFF00FF)
$Button1 = GUICtrlCreateButton("确定", 40, 104, 137, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUISetState(@SW_SHOW)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Exit
	EndSwitch
WEnd

EndFunc 


Func WLCJXGZ()
		$a = GetSourced("http://cjxlist.googlecode.com/svn/CustomStrings.dat")
		If StringRegExp($a, 'Xlist version (.*)') Then
			$down = StringRegExp($a, 'Xlist version (.*)', 3)
			 Return $down[0]
		Else
			MsgBox(64, "对不起", "解析失败！",5)
			Exit
		EndIf
EndFunc 


Func GetSourced($url)
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxy());设置代理
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		MsgBox(64, "对不起", "代理或者解析失败！",5)
		Exit
	EndIf	
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

Func getProxy()
	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
	For $n = 0 To UBound($urlP)-1 ;无限值
		ConsoleWrite($urlP[$n] & @CRLF)
		$iPing = Ping(StringLeft($urlP[$n],StringInStr($urlP[$n],":")-1), 500)
		;$iPing = Ping(StringRegExp($urlP[$n],'(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5}):\d{2,5}',3)[0], 500)
		If $iPing Then Return ($urlP[$n])
		
	Next
	Return ("")
	
EndFunc   ;==>getProxy

;~ Func getProxy()
;~ 	$IniFile = @ScriptDir & "\代理.txt" ;文本路径
;~ 	$Lines = _FileCountLines($IniFile) ;读取文本行数
;~ 	For $i = 1 To $Lines - 1 ;循环
;~ 		$ReadFile = FileReadLine($IniFile, $i) ;第1行开始读取
;~ 		ConsoleWrite($ReadFile & @CRLF)
;~ 		$iPing = Ping(StringLeft($ReadFile,StringInStr($ReadFile,":")-1), 500)
;~ 		If $iPing Then Return ($ReadFile)
;~ 		If $ReadFile = '' Then ExitLoop ;文本空退出
;~ 	Next	
;~ 	Return ("")
;~ 	
;~ EndFunc   ;==>getProxy

;文本方式------------------------------------------------------
#cs
186.92.188.215:9064
181.74.165.181:9064
186.94.81.250:9064
36.84.18.195:9064
36.83.138.220:3128
36.82.219.148:3128
#ce
;文本方式------------------------------------------------------

;~ Func getProxy()
;~ 	Local $urlP = StringSplit(IniRead(@ScriptDir & "\proxy.user.ini", "iplist", "google_cn", ""),"|")
;~ 	For $n = 1 To $urlP[0] ;无限值
;~ 		ConsoleWrite($n & " " & $urlP[$n] & @CRLF)
;~ 		$iPing = Ping($urlP[$n], 500)
;~ 		If $iPing Then Return ($urlP[$n])    
;~ 	Next
;~ 	Return ("")	
;~ EndFunc   ;==>getProxy

;INI方式-----------------------------------------------------
#cs
[iplist]
google_cn = 210.242.125.24|203.66.124.152|203.66.124.212|60.199.175.53|106.162.192.177
#ce
;INI方式-----------------------------------------------------

Func BDCJXGZ();获取本地CJX规则
	$iPid=ProcessExists("AdMunch.exe")
	$w = _GetModuleFileNameEx($iPid)
	$s = StringTrimRight ( $w, 11 )
	$IniFile = $s & "\CustomStrings.dat" ;文本路径
	$Lines = _FileCountLines($IniFile) ;读取文本行数
	For $i = 1 To $Lines - 1 ;循环
		$ReadFile = FileReadLine($IniFile, $i) ;第1行开始读取
		If $ReadFile = '' Then ExitLoop ;文本空退出
		If StringInStr($ReadFile, "Xlist version") Then ;返回带‘：’号的字符串
			Local $BDCJXGZ = StringTrimLeft($ReadFile, 14)
			Return ($BDCJXGZ)
			ExitLoop
			;MsgBox(4096, "最右边三个字符为:", $GZ)

		EndIf

	Next
EndFunc 

Func _GetModuleFileNameEx($_Pid)
        $_Hwnd=DllCall("Kernel32.dll","hwnd","OpenProcess","dword",0x0400+0x0010,"int",0,"dword",$_Pid)        
        $_Return=DllCall("Psapi.dll","long","GetModuleFileNameEx","hwnd",$_Hwnd[0],"long",0,"str",0,"long",255)        
        DllCall("Kernel32.dll","int","CloseHandle","hwnd",$_Hwnd[0])        
        If StringInStr($_Return[3],"\") Then Return $_Return[3]
        Return ""
EndFunc
	
;~ Func WLCJXGZ()
;~ 	$urlP="203.208.46.170:80"
;~ 	$urlP1="203.208.46.200:80"
;~ 	$urlP2="203.208.46.202:80"
;~ 	$urlP3="203.208.46.207:80"
;~ 	$urlP4="203.208.46.222:80"
;~ 	Local $iPing = Ping(StringTrimRight($urlP,3), 250)
;~ 	Local $iPing1 = Ping(StringTrimRight($urlP1,3), 250)
;~ 	Local $iPing2 = Ping(StringTrimRight($urlP2,3), 250)
;~ 	Local $iPing3 = Ping(StringTrimRight($urlP3,3), 250)
;~ 	Local $iPing4 = Ping(StringTrimRight($urlP4,3), 250)
;~     If $iPing Then ; 如果返回值大于 0，则显示下面的消息.
;~        $gz = SetProxyget($urlP)
;~ 	ElseIf $iPing1 Then
;~ 		 $gz = SetProxyget($urlP1)
;~ 	 ElseIf $iPing2 Then
;~ 		 $gz = SetProxyget($urlP2)
;~ 	 ElseIf $iPing3 Then
;~ 		 $gz = SetProxyget($urlP3)
;~ 	 ElseIf $iPing4 Then
;~ 		 $gz = SetProxyget($urlP4)
;~     EndIf
;~ 	Return $gz
;~ EndFunc 	

;~ ;Func SetProxyget()
;~ Func WLCJXGZ()
;~ $oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
;~ $oHTTP.SetProxy(2,getProxy());设置代理
;~ $oHTTP.Open("GET",'http://cjxlist.googlecode.com/svn/CustomStrings.dat') ;发送
;~ $oHTTP.Send()
;~ $return = $oHTTP.responsetext
;~ $oHTTP=0
;~ $array = StringRegExp($return, 'Xlist version (.*)', 3)
;~ $CJXGZ = $array[0]
;~ If $return<>"" Then 
;~ FileWrite("CustomStrings.dat",$return);注意先删除原来的
;~ EndIf
;~ Return $CJXGZ
;~ EndFunc
