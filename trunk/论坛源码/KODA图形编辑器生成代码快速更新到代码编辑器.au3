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
#include <Array.au3>
;#include <Debug.au3>
Opt("MustDeclareVars", 1)
Opt("SendKeyDelay", 50)

;_DebugSetup ("Quick copy Koda GUI code")

HotKeySet("^!k", "QuickCopyKodaGUICode"); Main()
While 1
        Sleep(100)
WEnd

Func QuickCopyKodaGUICode()
        ;查找设计器窗口并复制窗体代码
        Local $kodaTitle = "Koda 设计器"
        If Not WinExists($kodaTitle) Then Return
        WinActivate($kodaTitle)
        WinWaitActive($kodaTitle)
        Send("{F9}")
        Sleep(500)
        Send("!c")
        ;查找代码编辑器
        Local $sciteTitle = "[REGEXPTITLE:.+SciTE\(ACN\).+]"
        If Not WinExists($sciteTitle) Then Return
        ;截取窗体代码
        Local $text = ClipGet()
        Local $startTag = "#Region ### START Koda GUI section ###"
        Local $start = StringInStr($text, $startTag)
        If ($start <= 0) Then Return
        Local $endTag = "#EndRegion ### END Koda GUI section ###"
        Local $end = StringInStr($text, $endTag)
        If ($end <= 0) Then Return
        Local $formCode = StringMid($text, $start, $end - $start + StringLen($endTag))
        ;获取文件名
        Local $formName = ""
        Local $items = StringRegExp($formCode, StringReplace($startTag, " ", "\s") & "\sForm=(.+kxf?)\r\n", 1)
        If @error = 0 Then
                $formName = $items[0]
        EndIf
        ;复制编辑器代码
        WinActivate($sciteTitle)
        WinWaitActive($sciteTitle)
        ;_DebugOut("窗体已经激活")
        ;ControlClick($sciteTitle, "", "[CLASS:Scintilla; INSTANCE:1]", "left", 120, 20)
        Send("^a^c")
        Local $code = ClipGet()
        ;_DebugOut("code:" & $code)
        If $formName <> "" Then
                $start = StringInStr($code, $startTag & " Form=" & $formName)
        Else
                $start = StringInStr($code, $startTag)
        EndIf
        If ($start <= 0) Then Return
        $end = StringInStr($code, $endTag)
        If ($end <= 0) Then Return
        ;_DebugOut("start:"&$start & ",end:"&$end)
        ;提取窗体变量
        Local $varsContent = "Local "
        Local $arrVars = StringRegExp($formCode, "(\$[\w]+)\s", 3)
        If @error = 0 Then
                For $i = 0 To UBound($arrVars) - 1
                        If StringInStr($varsContent, $arrVars[$i] & ", ") <= 0 Then
                                $varsContent = $varsContent & $arrVars[$i] & ", "
                        EndIf
                Next
        EndIf
        $varsContent = StringTrimRight($varsContent, 2)
        ;拼接新的代码
        $startTag = $startTag & " Form=" & $formName
        Local $newCode = StringLeft($code, $start - 1) & $startTag & @CRLF _
                & $varsContent _
                & StringTrimLeft($formCode, StringLen($startTag)) _
                & StringRight($code, StringLen($code) - $end - StringLen($endTag))
        ClipPut($newCode)
        Send("^v")
EndFunc


#Region ### START Koda GUI section ### Form=d:\autoit\myapp\mytool.kxf
;test
#EndRegion ### END Koda GUI section ###
