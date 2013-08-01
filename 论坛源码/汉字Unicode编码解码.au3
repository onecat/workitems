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
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <string.au3>
#include <Clipboard.au3>
#include <StaticConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("汉字Unicode编码解码", 517, 294, 192, 124)
$about = GUICtrlCreateButton("", 236, 240, 40, 40, BitOR($BS_ICON, $WS_GROUP))
GUICtrlSetImage(-1, "shell32.dll", -222)
$Encrypt = GUICtrlCreateButton("编码 ->", 216, 104, 81, 25, $WS_GROUP)
$Decrypt = GUICtrlCreateButton("<- 解码", 216, 144, 81, 25, $WS_GROUP)
$Edit1 = GUICtrlCreateEdit("", 16, 48, 185, 201, BitOR($ES_LEFT, $ES_WANTRETURN))
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x808080)
$Edit2 = GUICtrlCreateEdit("", 312, 48, 185, 201, BitOR($ES_LEFT, $ES_WANTRETURN))
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x808080)
$Button1 = GUICtrlCreateButton("拷贝", 16, 256, 57, 25, $WS_GROUP)
$Button2 = GUICtrlCreateButton("清除", 144, 256, 57, 25, $WS_GROUP)
$Button3 = GUICtrlCreateButton("拷贝", 312, 256, 57, 25, $WS_GROUP)
$Button4 = GUICtrlCreateButton("清除", 440, 256, 57, 25, $WS_GROUP)
$Button5 = GUICtrlCreateButton("粘贴", 80, 256, 57, 25, $WS_GROUP)
$Button6 = GUICtrlCreateButton("粘贴", 376, 256, 57, 25, $WS_GROUP)
$Label1 = GUICtrlCreateLabel("汉字", 80, 16, 55, 24, $SS_CENTER)
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x000080)
$Label2 = GUICtrlCreateLabel("编码", 384, 16, 46, 24, $SS_CENTER)
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x000080)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
 
                Case $Encrypt
                        $String = GUICtrlRead($Edit1)
                        $Hex = Unicode2Encode($String)
                        GUICtrlSetData($Edit2, $Hex)
 
                Case $Decrypt
                        $Hex = GUICtrlRead($Edit2)
                        $String = Encode2Unicode($Hex)
                        If $String = -1 Then
                                GUICtrlSetData($Edit1, "代码错误")
                        Else
                                GUICtrlSetData($Edit1, $String)
                        EndIf
 
                Case $Button1
                        $clip1 = GUICtrlRead($Edit1)
                        _ClipBoard_SetData($clip1)
 
                Case $Button2
                        GUICtrlSetData($Edit1, "")
 
 
                Case $Button3
                        $clip2 = GUICtrlRead($Edit2)
                        _ClipBoard_SetData($clip2)
 
                Case $Button4
                        GUICtrlSetData($Edit2, "")
 
                Case $Button5
                        $paste1 = _ClipBoard_GetData()
                        GUICtrlSetData($Edit1, $paste1)
 
                Case $Button6
                        $paste2 = _ClipBoard_GetData()
                        GUICtrlSetData($Edit2, $paste2)
 
                Case $about
                        MsgBox(8192 + 262144 + 64, "关于", "说点啥呢?" & @CRLF & "" & @CRLF & "你好，世界")
 
        EndSwitch
 
WEnd
 
Func Unicode2Encode($str)
        Local $EncodedString, $i, $s2d, $sS = StringSplit($str, '')
        For $i = 1 To $sS[0]
                If StringRegExp($sS[$i], '[^\x00-\xff]') Then
                        $EncodedString &= '\u' & Hex(AscW($sS[$i]), 4)
                Else
                        $EncodedString &= $sS[$i]
                EndIf
        Next
        Return $EncodedString
EndFunc   ;==>Unicode2Encode
 
Func Encode2Unicode($str)
        $Temp = StringRegExp($str, '(\\u\w{4})', 3)
        If @error Then Return $str
        For $i = 0 To UBound($Temp) - 1
                $Te = ChrW(Dec(StringReplace($Temp[$i], '\u', '')))
                $unEncode = StringReplace($str, $Temp[$i], $Te, 1)
                $str = $unEncode
        Next
        Return $unEncode
EndFunc   ;==>Encode2Unicode