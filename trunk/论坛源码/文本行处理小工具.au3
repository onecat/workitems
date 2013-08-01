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

#region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=AutoIt.ico
#endregion ;**** 参数创建于 ACNWrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$hGUI = GUICreate("Form1", 634, 210, 50, 2, BitOR($WS_POPUP, $WS_BORDER), _
                BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_ACCEPTFILES))
GUISetBkColor(0xE0F0FE)

$ExitLabel = GUICtrlCreateButton("X", 613, -2, 20, 20)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)

$Compare_Replace = GUICtrlCreateButton("处理文本行", 540, 180, 80, 20)

GUICtrlCreateLabel("目标文件", 10, 22, 60, 17)
$01 = GUICtrlCreateInput("拖入目标文本文件", 65, 19, 555, 17)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

GUICtrlCreateLabel("关键字符：", 375, 40, 60, 17)
$02 = GUICtrlCreateInput("", 375, 55, 245, 17)

GUICtrlCreateLabel("替换字符：", 375, 90, 60, 17)
$03 = GUICtrlCreateInput("", 375, 105, 245, 17)

GUICtrlCreateLabel("路径\新文件名.txt：", 375, 140, 140, 17)
$04 = GUICtrlCreateInput("拖放或输入路径\新文件名.txt", 375, 155, 245, 17)
GUICtrlSetState($04, $GUI_DROPACCEPTED)

GUICtrlCreateGroup(" 条件选择: ", 10, 42, 355, 158)
$radio1 = GUICtrlCreateRadio(" 正则表达式替换关键字符.", 20, 58, 160, 16)
$radio2 = GUICtrlCreateRadio(" 关闭正则表达式,直接替换关键字符.", 20, 75, 220, 16)

$radio3 = GUICtrlCreateRadio(" 删除整行为'关键字符' 的所有行.", 20, 105, 200, 17)
$radio4 = GUICtrlCreateRadio(" 删除整行为'关键字符' 的所有行, 写入新文件.", 20, 125, 280, 17)

$radio5 = GUICtrlCreateRadio(" 删除包含'关键字符'的所有行.", 20, 155, 260, 17)
$radio6 = GUICtrlCreateRadio(" 正则表达式删除包含'关键字符'的所有行.", 20, 175, 260, 17)

$radio7 = GUICtrlCreateRadio(" 删除所有空行.", 250, 58, 100, 17)

GUICtrlCreateGroup("", -99, -99, 1, 1)

# 黄色边框:
Local $Pic0 = @ScriptDir & "\gradient_1024x24.jpg"
$Pic1 = GUICtrlCreatePic($Pic0, 0, 0, 613, 5, -1, $GUI_WS_EX_PARENTDRAG)
$Pic2 = GUICtrlCreatePic($Pic0, 0, 5, 5, 205, -1, $GUI_WS_EX_PARENTDRAG)
$Pic3 = GUICtrlCreatePic($Pic0, 0, 205, 633, 5, -1, $GUI_WS_EX_PARENTDRAG)
$Pic4 = GUICtrlCreatePic($Pic0, 628, 15, 5, 205, -1, $GUI_WS_EX_PARENTDRAG)

GUISetState(@SW_SHOW)
Global $radioX = ''
While 1
        $nMsg = GUIGetMsg()
        If $nMsg = 0 Or $nMsg = -11 Or $nMsg = -7 Or $nMsg = -8 Then
                ContinueLoop
        Else
        EndIf
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $ExitLabel ;退出
                        Exit
                Case $GUI_EVENT_DROPPED
                        Local $mouse = GUIGetCursorInfo($hGUI)
                        Local $_str = ControlCommand($hGUI, '', $mouse[4], 'GetSelected', '')
                        If $mouse[4] = 6 Then
                                GUICtrlSetData($01, $_str)
                        ElseIf $mouse[4] = 12 Then
                                GUICtrlSetData($04, $_str)
                        EndIf
                Case $Compare_Replace
                        For $q = 1 To 7
                                If GUICtrlRead(Eval('radio' & $q)) = $GUI_CHECKED Then
                                        $radioX = $q
                                        ExitLoop
                                ElseIf $q = 7 And $radioX = '' Then
                                        MsgBox(16, '错误', '未选择处理条件')
                                        ContinueCase
                                EndIf
                        Next
                        $Path_0 = GUICtrlRead($01)
                        If $Path_0 = '拖入目标文本文件' Or $Path_0 = 0 Then
                                MsgBox(16, '错误', '没有指定目标文件 !')
                                ContinueCase
                        EndIf
                        $Key = GUICtrlRead($02)
                        $displace = GUICtrlRead($03)
                        $New_File = GUICtrlRead($04)
                        If $radioX = 1 Then
                                If $Key = 0 Or $displace = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 或 替换字符 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, $displace);正则替换整行为 '关键\字'的行
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 2 Then
                                If $Key = 0 Or $displace = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 或 替换字符 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, $displace, 0, 0) ;关闭正则,将文件中的所有包含'关键\字'的行替换为'AB\C'
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 3 Then
                                If $Key = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key) ;删除文件中整行为'关键字'的所有行
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 4 Then
                                If $Key = 0 Or $New_File = '拖放或输入路径\新文件名.txt' Or $New_File = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 或 新文件 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 1, 1, 1, $New_File) ;删除文件中的所有整行为'关键字'的行，写入到新 .txt 文件
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 5 Then
                                If $Key = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 0) ;删除文件中的所有包含'关键字'的行
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 5 Then
                                If $Key = 0 Then
                                        MsgBox(16, '错误', '没有指定关键字符 !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 0, 1, 1, '') ;正则删除文件中的所有包含'关键字'的行
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 6 Then
                                _FileSRER2Line($Path_0) ;删除文件中的所有空行
                                _return(@extended)
                        EndIf

        EndSwitch
WEnd

;==========================================================================================
; 说明:　按指定的关键字替换或删除文本行，可选择是否使用正则表达式，是否写新文件等。
; 语法:　_FileSRER2Line('文件路径'[, '搜索字符'[, '替换'[, 匹配标志[, 正则标志[, 回车符[, 写入标志]]]]]])
; 参数:　可选参数：如'搜索字符'字符为空(默认)则删除所有空行。
;　　　　可选参数：如'替换'字符为空(默认)则删除匹配行，且不会留下空行。
;　　　　可选参数：匹配标志 = 1 :整行需完全匹配(默认)；匹配标志 = 0 :行中只需包含关键字。
;　　　　可选参数：使用正则标志 = 1 使用正则(默认)，为 0 不使用正则，使用原始字符串匹配。
;　　　　可选参数：回车符标志 = 1 仅识别有回车符的断行@CRLF(默认,速度快)，为 0 只要有换行符@LF即识别为断行。
;　　　　可选参数：写入标志 = '' 写入原文件(默认)；不为空则写入指定文件；= 0 仅返回不写入。
; 注意:　本函数以行作为操作单位，即不管在一行中含有几处关键字均按一个替换单位操作。
; 返回值:返回替换后的字符串。替换次数保存在@extended宏中。
; 作者:　Afan -- http://www.autoit.net.cn
;=====================================================================================start
Func _FileSRER2Line($File, $pattern = '', $replace = '', $flag = 1, $SRE = 1, $CR = 1, $Write = '')
        Local $sFile = String(FileRead($File)), $strqhz = '', $extended = 0, $sRER, $strZY, $CRF = ''
        If $CR = 0 Then $CRF = '?'
        If $pattern = '' Then
                $sRER = StringRegExpReplace(@CRLF & $sFile, '\r' & $CRF & '\n(?=\r' & $CRF & '\n)|\r' & $CRF & '\n$', '')
        Else
                If $SRE = 0 Then
                        $strZY = '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)'
                        $pattern = StringRegExpReplace($pattern, $strZY, '\\$1')
                        $replace = StringRegExpReplace($replace, $strZY, '\\$1')
                EndIf
                If $flag = 0 Then $strqhz = '\V*'
                Local $patternWZ = $strqhz & $pattern & $strqhz
                $pattern = '(\r' & $CRF & '\n)' & $patternWZ & '(?=\r' & $CRF & '\n)|\r' & $CRF & '\n' & $patternWZ & '$'
                If $replace <> '' Then
                        $sRER = StringRegExpReplace(@CRLF & $sFile, $pattern, '${1}' & $replace)
                Else
                        $sRER = StringRegExpReplace(@CRLF & $sFile, $pattern, '')
                EndIf
        EndIf
        $extended = $extended + @extended
        $sRER = StringRegExpReplace($sRER, '^\r' & $CRF & '\n', '')
        If $Write = '' And $Write <> '0' Then
                $sTmp = FileOpen($File, 2)
                FileWrite($sTmp, $sRER)
                FileClose($sTmp)
        ElseIf $Write <> '' Then
                $sTmp = FileOpen($Write, 2)
                FileWrite($sTmp, $sRER)
                FileClose($sTmp)
        EndIf
        SetExtended($extended)
        Return $sRER
EndFunc   ;==>_FileSRER2Line

Func _return($a)
        If $a = 0 Then
                MsgBox(0, 0, '未找到关键字')
        Else
                MsgBox(64, '完成', '替换行数量：' & $a)
        EndIf
EndFunc   ;==>_return