#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\ADMuncher最终汉化版\奶牛CJX更新提示.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\奶牛CJX更新提示.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.0.1.0
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
$Form1_1 = GUICreate("奶牛CJX规则", 219, 162, -1, -1)
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
GUICtrlSetColor(-1, 0xFF00FF)
$Button1 = GUICtrlCreateButton("确定升级", 16, 120, 81, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Radio1 = GUICtrlCreateRadio("ADMU", 8, 96, 65, 17)
$Radio2 = GUICtrlCreateRadio("CJX规则更新小助手", 80, 96, 129, 17)
GUICtrlSetState($Radio2, $GUI_CHECKED)
$Button2 = GUICtrlCreateButton("取消升级", 120, 120, 81, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			If  BitAnd(GUICtrlRead($Radio1), $GUI_CHECKED) Then 
				GUISetState($Radio2, $GUI_UNCHECKED)
				$iPid=ProcessExists("AdMunch.exe")
				$w = _GetModuleFileNameEx($iPid)
				$s = StringTrimRight ( $w, 11 )
				ShellExecute($s & "ADMU(CJX).exe")
				Exit
			Else	
				GUISetState($Radio1, $GUI_UNCHECKED)
				GUISetState($Radio2, $GUI_CHECKED)
			EndIf	
		
			If  BitAnd(GUICtrlRead($Radio2), $GUI_CHECKED) Then 
				GUISetState($Radio1, $GUI_UNCHECKED)
				GUISetState($Radio2, $GUI_UNCHECKED)
				$iPid=ProcessExists("AdMunch.exe")
				$w = _GetModuleFileNameEx($iPid)
				$s = StringTrimRight ( $w, 11 )
				ShellExecute($s & "CJX规则更新小助手.exe")
				Exit
			Else	
				GUISetState($Radio2, $GUI_UNCHECKED)
				GUISetState($Radio1, $GUI_CHECKED)
			EndIf	
				
		Case $Button2
			Exit
	EndSwitch
WEnd

EndFunc 


Func  WLCJXGZ()
		If StringRegExp(GetSourced(), 'Xlist version (.*)') Then
			$down = StringRegExp(GetSourced(), 'Xlist version (.*)', 3)
			Return $down[0]
		EndIf
		If StringRegExp(GetSourcedzx(), 'Xlist version (.*)') Then
			 $down = StringRegExp(GetSourcedzx(), 'Xlist version (.*)', 3)
			 Return $down[0]
		EndIf	 
EndFunc		

Func GetSourced()
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxy());设置代理
	$oHTTP.Open("get", "http://cjxlist.googlecode.com/svn/CustomStrings.dat", False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		;MsgBox(64, "对不起", "固定IP地址代理失败！",3)
	Else	
		$oHTTP = 0
		Return $return
	EndIf	
EndFunc   ;==>GetSource


Func getProxy()
	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
	For $n = 0 To UBound($urlP)-1 ;无限值
		ConsoleWrite($urlP[$n] & @CRLF)
		$iPing = Ping(StringLeft($urlP[$n],StringInStr($urlP[$n],":")-1), 500)
		If $iPing Then Return ($urlP[$n])
	Next
	Return ("")
	
EndFunc   ;==>getProxy

Func GetSourcedzx()
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxyzx());设置代理
	$oHTTP.Open("get", "http://cjxlist.googlecode.com/svn/CustomStrings.dat", False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		;MsgBox(64, "对不起", "解析地址失败！",3)
		Exit
	Else	
		$oHTTP = 0
		Return $return
	EndIf	
EndFunc   ;==>GetSource
	
 Func getProxyzx()
$azz="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$strgz=GetSourcezx("http://www.xici.net.co/wn/");http://www.xici.net.co/wt/
If Not StringRegExp($strgz,$azz) Then;检测代理问题
		MsgBox(64, "对不起", "在线代理网址失效！",3)
Else
		$reg=StringRegExp($strgz,$azz,3)
	For $n= 0 To UBound($reg)/2-1
		$ip=$reg[2*$n]&":"&$reg[2*$n+1] ;& "|"
		ConsoleWrite($ip&@CRLF)
		$iPing = Ping(StringLeft($ip,StringInStr($ip,":")-1), 500)
		If $iPing Then Return ($ip)	
	Next
EndIf
EndFunc

Func GetSourcezx($urls)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $urls, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource	
		

Func BDCJXGZ();获取本地CJX规则
	$iPid=ProcessExists("AdMunch.exe")
	$w = _GetModuleFileNameEx($iPid)
	$s = StringTrimRight ( $w, 11 )
	$IniFile = $s & "CustomStrings.dat" ;文本路径
	$aFile = FileOpen($IniFile)
	$aFileStrings = FileRead($aFile)
	If StringRegExp($aFileStrings, 'Xlist version (.*)') Then
			$down = StringRegExp($aFileStrings, 'Xlist version (.*)', 3)
			FileClose($aFile)
			 Return $down[0]
		Else
			MsgBox(64, "对不起", "本地没有规则文件！",5)
			FileClose($aFile)
			Exit
		EndIf
	FileClose($aFile)	
EndFunc 

Func _GetModuleFileNameEx($_Pid)
        $_Hwnd=DllCall("Kernel32.dll","hwnd","OpenProcess","dword",0x0400+0x0010,"int",0,"dword",$_Pid)        
        $_Return=DllCall("Psapi.dll","long","GetModuleFileNameEx","hwnd",$_Hwnd[0],"long",0,"str",0,"long",255)        
        DllCall("Kernel32.dll","int","CloseHandle","hwnd",$_Hwnd[0])        
        If StringInStr($_Return[3],"\") Then Return $_Return[3]
        Return ""
EndFunc


