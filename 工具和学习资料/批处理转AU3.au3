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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=D:\autoit3\Aut2Exe\Icons\apple.ico
#AutoIt3Wrapper_outfile=_BatToAU3ToRun.exe
#AutoIt3Wrapper_Res_Comment=_BatToAU3ToRun
#AutoIt3Wrapper_Res_Description=_BatToAU3ToRun
#AutoIt3Wrapper_Res_Fileversion=1.3.0.0
#AutoIt3Wrapper_Res_LegalCopyright=lixiaolong - http://www.autoitx.com/
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <Misc.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
 
_Singleton(" _BatToAU3 ~To Run~ 1.3 by lixiaolong")
Opt("TrayIconHide", 1)
GUICreate(" _BatToAU3 ~To Run~ 1.3 by lixiaolong", 660, 480)
$RegName = GUICtrlCreateEdit("", 10, 30, 640, 160, BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $ES_WANTRETURN))
GUICtrlCreateLabel('DOS命令:', 10, 10, '', 15)
$RegADD = GUICtrlCreateEdit("", 10, 215, 640, 160, BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $ES_WANTRETURN))
GUICtrlCreateLabel('转换后:', 10, 195, '', 15)
$ying = GUICtrlCreateRadio("隐藏指定窗口", 10, 385, 100)
GUICtrlSetState(-1, $GUI_CHECKED)
$zuida = GUICtrlCreateRadio("最大化指定窗口", 130, 385, 120)
$Run = GUICtrlCreateCheckbox("Run", 270, 385)
$rundos = GUICtrlCreateCheckbox("RunDos", 340, 385)
$rundosIn = GUICtrlCreateCheckbox("RunDos(付加 #include <Process.au3>)", 400, 385)
$btn2 = GUICtrlCreateButton("转换", 10, 415, 640, 20)
$btn3 = GUICtrlCreateButton("复制", 10, 435, 640, 20)
$btn4 = GUICtrlCreateButton("清除", 10, 455, 640, 20)
GUISetState()
WinSetOnTop(" _BatToAU3 -To Run- by lixiaolong", '', 1)
 
While 1
        $msg = GUIGetMsg()
        Select
                Case $msg = $btn2
                        $RegNameRead = GUICtrlRead($RegName)
                        If $RegNameRead <> '' Then
                                If GUICtrlRead($rundos) = $GUI_CHECKED Then
                                        _ToRunDos($RegNameRead, 0)
                                ElseIf GUICtrlRead($rundosIn) = $GUI_CHECKED Then
                                        _ToRunDos($RegNameRead, 1)
                                Else
                                        If GUICtrlRead($ying) = $GUI_CHECKED Then
                                                _BatToAU3($RegNameRead, "@SW_HIDE")
                                        Else
                                                _BatToAU3($RegNameRead, "@SW_MAXIMIZE")
                                        EndIf
                                EndIf
                        EndIf
                Case $msg = $Run
                        CHECKED($Run)
                Case $msg = $rundos
                        CHECKED($rundos)
                Case $msg = $rundosIn
                        CHECKED($rundosIn)
                Case $msg = $btn3
                        If GUICtrlRead($RegADD) <> '' Then ClipPut(GUICtrlRead($RegADD))
                Case $msg = $btn4
                        GUICtrlSetData($RegADD, '')
                        GUICtrlSetData($RegName, '')
                Case $msg = $GUI_EVENT_CLOSE
                        Exit
        EndSelect
WEnd
 
Func CHECKED($CHECKED)
        GUICtrlSetState($Run, $GUI_UNCHECKED)
        GUICtrlSetState($rundos, $GUI_UNCHECKED)
        GUICtrlSetState($rundosIn, $GUI_UNCHECKED)
        GUICtrlSetState($CHECKED, $GUI_CHECKED)
EndFunc   ;==>CHECKED
 
Func _BatToAU3($BatFile, $SW)
        Local $BatToRun, $RunWait = 'RunWait'
        $String = StringSplit($BatFile & @CRLF, @CRLF)
        If GUICtrlRead($Run) = $GUI_CHECKED Then $RunWait = 'Run'
        For $i = 1 To $String[0] - 1
                If $String[$i] Then _
                                $BatToRun &= $RunWait & "(@ComSpec & ' /c ' & '" & StringReplace(StringReplace($String[$i], "'", "'" & _
                                ' & "' & "'" & '" & _' & @CRLF & "'"), "%%", "%") & "', '', " & $SW & ')' & @CRLF
        Next
        GUICtrlSetData($RegADD, $BatToRun)
EndFunc   ;==>_BatToAU3
 
Func _ToRunDos($BatFile, $Frag)
        Local $BatToRunDos, $Include = ""
        $String = StringSplit($BatFile & @CRLF, @CRLF)
 
        For $i = 1 To $String[0] - 1
                If $String[$i] Then
                        $BatToRunDos &= "_RunDos('" & StringReplace(StringReplace($String[$i], "'", "'" & _
                                        ' & "' & "'" & '" & _' & @CRLF & "'"), "%%", "%") & "')" & @CRLF
                EndIf
        Next
        If $Frag Then $Include = "#include <Process.au3>" & @CRLF & @CRLF
        GUICtrlSetData($RegADD, $Include & $BatToRunDos)
EndFunc   ;==>_ToRunDos
