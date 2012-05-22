#NoTrayIcon
#RequireAdmin
#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=..\..\..\..\autoit3\Aut2Exe\Icons\apple.ico
#PRE_Outfile=D:\autoit3\SciTEAddInclude.exe
#PRE_Res_Comment=SciTE排错辅助工具
#PRE_Res_Description=SciTE排错辅助工具
#PRE_Res_Fileversion=2.5.0.0
#PRE_Res_LegalCopyright=lixiaolong - [url]http://www.autoitx.com/[/url]
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GuiEdit.au3>
#include <File.au3>
#include <WindowsConstants.au3>
 
_PreventRepeatOperation()
 
$begin = TimerInit()
 
Global Const $InstallDir = RegRead("HKLM\SOFTWARE\AutoIt v3\AutoIt", "InstallDir")
If @error Then Exit
 
Global Const $Title = "[CLASS:SciTEWindow]"
If Not WinExists($Title) Then Exit
 
Global Const $Const = $InstallDir & '\SciTEAddInclude.const'
Global Const $IncludeDir = $InstallDir & '\include'
Global Const $SciTEAddIncludeConfig = $InstallDir & '\SciTEAddIncludeConfig.ini'
 
;检查Include文件有没有改动.                                    ;创建SciTEAddInclude.const文件.
If CheckFileChange($IncludeDir) == 1 Or FileExists($Const) = 0 Then _SciTEAddIncludeConst($IncludeDir)
 
Global Const $hsEdit = ControlGetHandle($Title, "", "Scintilla1")
Global Const $hsEditText = GetSciteText($hsEdit)
 
Global Const $Scintilla2 = ControlGetHandle($Title, "", "Scintilla2")
Global Const $variable = _FileRead($Const)
Global $var, $include
 
Global $ErrorText = StringRegExp(GetSciteText($Scintilla2), ':\s.*?:\s(\$?\w+)[(:]', 3)
If @error Then Exit
 
For $s = 0 To UBound($ErrorText) - 1
        $var = StringRegExp($variable, '(?mi)^([\w+\.]+\.au3)\|\' & $ErrorText[$s], 1)
        
        If Not @error Then
                StringRegExp($hsEditText & @CRLF & $include, '(?mi)^\s*#include\s*[<"]' & $var[0] & '[>"]', 1)
                If @error Then
                        $include &= '#include <' & $var[0] & '>' & @CRLF
                EndIf
        EndIf
Next
 
_GUICtrlEdit_SetSel($hsEdit, 0, 0)
_SendMessage($hsEdit, $EM_REPLACESEL, True, $include, 0, "wparam", "str")
Ex()
 
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
        Local $Len = _SendMessage($Scintilla2, $WM_GETTEXTLENGTH)
        _GUICtrlEdit_SetSel($Scintilla2, $Len, $Len)
        _SendMessage($Scintilla2, $EM_REPLACESEL, True, _
                        '>SciTEAddInclude: 运行时间: ' & Round(TimerDiff($begin) / 1000, 3) & ' 秒' & @CRLF, 0, "wparam", "str")
        Exit
EndFunc   ;==>Ex
 
Func _SciTEAddIncludeConst($_dir)
        Local $FileList = _FileListToArray($_dir, "*.au3", 1)
        Local $f
 
        For $i = 1 To $FileList[0]
                Local $str = _FileRead($_dir & '\' & $FileList[$i])
                Local $b = StringRegExp($str, '(?mi)^\s*(?:global|func)\s*(?:const)?\s*(\$\w+|\w+(?=\())', 3)
 
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
 
Func CheckFileChange($_dir)
        Local $time = FindFile($_dir, "*.au3")
 
        IniWrite($SciTEAddIncludeConfig, 'time', 'new', $time)
        If Not IniRead($SciTEAddIncludeConfig, 'time', 'old', '') Then IniWrite($SciTEAddIncludeConfig, 'time', 'old', $time)
        If IniRead($SciTEAddIncludeConfig, 'time', 'old', '') == IniRead($SciTEAddIncludeConfig, 'time', 'new', '') Then
                IniWrite($SciTEAddIncludeConfig, 'change', 'change', 0)
        Else
                IniWrite($SciTEAddIncludeConfig, 'change', 'change', 1)
                IniWrite($SciTEAddIncludeConfig, 'time', 'old', $time)
        EndIf
        Return IniRead($SciTEAddIncludeConfig, 'change', 'change', '')
EndFunc   ;==>CheckFileChange
 
Func FindFile($_dir, $_file)
        Local $time, $search, $file
        
        $search = FileFindFirstFile($_dir & '\' & $_file)
        If $search = -1 Then
                MsgBox(0, "错误", "没有匹配搜索的文件/目录")
                Exit
        EndIf
 
        While 1
                $file = FileFindNextFile($search)
                If @error Then ExitLoop
                If $time < FileGetTime($_dir & '\' & $file, 0, 1) Then
                        $time = FileGetTime($_dir & '\' & $file, 0, 1)
                EndIf
                If $time < FileGetTime($_dir & '\' & $file, 1, 1) Then
                        $time = FileGetTime($_dir & '\' & $file, 1, 1)
                EndIf
        WEnd
 
        ; 关闭搜索句柄
        FileClose($search)
        Return $time
EndFunc   ;==>FindFile
 
Func _PreventRepeatOperation()
        Local $_ProcessList = ProcessList(@ScriptName)
        If $_ProcessList[0][0] > 1 Then Exit
EndFunc   ;==>_PreventRepeatOperation
