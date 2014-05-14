#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\deamon.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\奶牛CJX更新提示.exe
#PRE_Compression=4
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=小站制作
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
#include <File.au3>
#Include <WinAPIEx.au3>
#Include <String.au3>
#include <IE.au3>
#include <MSHtml.au3>
#include <IEEX.au3>
If  ProcessExists("AdMunch.exe") Then ; 检查记事本进程是否正在运行.
	bbhdb()
Else
    MsgBox(0, "检测奶牛CJX版本", "奶牛没有运行，请运行奶牛后在运行本工具")
	Exit
EndIf




Func bbhdb();判断网络CJX规则和本地CJX规则 
	$HBD = _StringToHex(BDCJXGZ())
	$HWL = _StringToHex(WLCJXGZ())
	If $HWL <= $HBD Then
		 MsgBox(0,"奶牛CJX规则","奶牛CJX规则已经是最新" & @CRLF & "新版本   ：" & WLCJXGZ() & @CRLF & "本地版本：" & BDCJXGZ())
		 Exit
	Else
		 MsgBox(0,"奶牛CJX规则","奶牛CJX规则有新版本及时更新"& @CRLF & "新版本   ：" & WLCJXGZ() & @CRLF & "本地版本：" & BDCJXGZ())
		 Exit
	EndIf
EndFunc   ;==>bbhdb

Func WLCJXGZ()
	If WLCJXGZ1() =  "" Then
		WLCJXGZ2()
		Return(WLCJXGZ2())
	Else
		Return(WLCJXGZ1())
	EndIf	
EndFunc	

Func WLCJXGZ1()
Local $doc = _MHDocGetObj() ;创建document对象
_MHNavigate($doc, "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat",4) ;网上获取百度源码并加载到mshtml,4 utf8编码转换
Local $su = _IEQuery($doc,"td","class=source") ;id方法对象
Local $sText = _IEPropertyGet($su,"outertext") ;取显示文本
$GZ = StringTrimLeft($sText,14)
Return ($GZ)
EndFunc 

Func WLCJXGZ2()
$a=InetRead ( "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat" , 1)
$array = StringRegExp(BinaryToString($a), '><td class="source">Xlist version (.*?)<br></td></tr', 2)
$GZ = $array[1]
Return ($GZ)
EndFunc 

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