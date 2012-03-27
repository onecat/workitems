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

#NoTrayIcon
#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=..\..\..\..\autoit3\Aut2Exe\Icons\apple.ico
#PRE_Outfile=D:\autoit3\SciTEAddInclude.exe
#PRE_Res_Comment=SciTE排错辅助工具
#PRE_Res_Description=SciTE排错辅助工具
#PRE_Res_Fileversion=2.0.0.0
#PRE_Res_LegalCopyright=lixiaolong - [url]http://www.autoitx.com/[/url]
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GuiEdit.au3>
#include <File.au3>
#include <WindowsConstants.au3>
 
$begin = TimerInit()
 
Global Const $InstallDir = RegRead("HKLM\SOFTWARE\AutoIt v3\AutoIt", "InstallDir")
If @error Then Exit
 
Global Const $Title = "[CLASS:SciTEWindow]"
If Not WinExists($Title) Then Exit
 
Global Const $Const = $InstallDir & '\SciTEAddInclude.const'
If Not FileExists($Const) Then _SciTEAddIncludeConst()
 
Global Const $hsEdit = ControlGetHandle($Title, "", "Scintilla1")
Global Const $Scintilla2 = ControlGetHandle($Title, "", "Scintilla2")
Global Const $au3api = $InstallDir & '\SciTe\api\au3.api'
Global Const $Function = _FileRead($au3api)
Global Const $variable = _FileRead($Const)
Global $var, $func
 
Global $ErrorText = StringRegExp(GetSciteText($Scintilla2), ':\s*([$_][^:(\s]+)', 3)
If @error Then Exit
 
For $s = 0 To UBound($ErrorText) - 1
        $hsEditText = GetSciteText($hsEdit)
        If StringLeft($ErrorText[$s], 1) == '_' Then
                $func = StringRegExpReplace($Function, '(?si)(.+' & $ErrorText[$s] & '.*?)(#[^>)]+>)(.+)', '\2')
                StringRegExp(EditTxt(), '(?mi)^\s*#include\s*[<"]' & StringRegExpReplace($func, '.+<(.*?)>', '\1') & '[>"]', 3)
                If @error Then
                        _GUICtrlEdit_SetSel($hsEdit, 0, 0)
                        _SendMessage($hsEdit, $EM_REPLACESEL, True, $func & @CRLF, 0, "wparam", "str")
                EndIf
        ElseIf StringLeft($ErrorText[$s], 1) == '$' Then
                $var = StringRegExp($variable, '(?mi)^(.*?)\|\' & $ErrorText[$s] & '\r', 1)
                If Not @error Then
                        StringRegExp(EditTxt(), '(?mi)^\s*#include\s*[<"]' & $var[0] & '[>"]', 3)
                        If @error Then
                                _GUICtrlEdit_SetSel($hsEdit, 0, 0)
                                _SendMessage($hsEdit, $EM_REPLACESEL, True, '#include <' & $var[0] & '>' & @CRLF, 0, "wparam", "str")
                        EndIf
                EndIf
        EndIf
Next
 
Ex()
 
Func EditTxt()
        Local $string = StringRegExpReplace(GetSciteText($hsEdit), _
                        '(".*?"|' & "'" & '.*?' & "'" & ')|\s*;.*|(?si)\s?#cs\s*[\r\n]*.*?#ce[^\r]*[\r\n]?', '\1\2')
        Return $string
EndFunc   ;==>EditTxt
 
Func _FileRead($file)
        Local $openfile = FileOpen($file)
        Local $readfile = FileRead($openfile)
        FileClose($openfile)
        Return $readfile
EndFunc   ;==>_FileRead
 
Func GetSciteText($hwd)
        Local $Len = _SendMessage($hwd, $WM_GETTEXTLENGTH)
        Local $str = DllStructCreate("char[" & $Len * 2 & "]")
        _SendMessage($hwd, $WM_GETTEXT, $Len, DllStructGetPtr($str))
        Return DllStructGetData($str, 1)
EndFunc   ;==>GetSciteText
 
Func Ex()
        $Len = _GUICtrlEdit_GetTextLen($Scintilla2)
        _GUICtrlEdit_SetSel($Scintilla2, $Len, $Len)
        _SendMessage($Scintilla2, $EM_REPLACESEL, True, _
                        '>SciTEAddInclude: 运行时间: ' & Round(TimerDiff($begin) / 1000, 3) & ' 秒' & @CRLF, 0, "wparam", "str")
        Exit
EndFunc   ;==>Ex
 
Func _SciTEAddIncludeConst()
        $FileList = _FileListToArray($InstallDir & '\Include', "*.au3", 1)
        Local $f
 
        For $i = 1 To $FileList[0]
                ConsoleWrite($FileList[$i] & @CRLF)
                Local $str = _FileRead($InstallDir & '\Include\' & $FileList[$i])
                Local $b = StringRegExp($str, '(?mi)^(?<!;)Global\s*Const\s*(\$.*?)\s*\=[^;\r]+', 3)
                If Not @error Then
                        For $s = 0 To UBound($b) - 1
                                $f &= $FileList[$i] & '|' & $b[$s] & @CRLF
                        Next
                EndIf
        Next
 
        $d = FileOpen($Const, 2)
        FileWrite($d, $f)
        FileClose($d)
EndFunc   ;==>_SciTEAddIncludeConst