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

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
$lab1 = "这是一个可以自由伸长的lable"
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 623, 442, 192, 124)
$lablel1 = _GUICtrlCreateLabel($lab1, 0, 0, -1, -1, 18)
GUICtrlSetBkColor(-1, "0xFF0000")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
        EndSwitch
WEnd
 ;_GUICtrlCreateLabel("文本",左侧, 顶部[, 样式 [, 扩展样式[,字体大小,[权值[,属性[,字体名[,质量]]]]]]] );具体查看GUICtrlCreateLabel帮助与GUICtrlSetFont帮助
Func _GUICtrlCreateLabel($text, $left, $top, $yangshi = -1, $kuozhang = -1, $size = 8.5, $quanzhi = 400, $shuxing = "", $fontmane = "", $zhiliang = 2)
        If Not $text Then Return GUICtrlCreateLabel($text, $left, $top, -1, -1, $yangshi, $kuozhang)
        $lable_single = StringRegExp($text, '[\x00-\xff]', 3)
        If @error Then
                $lable_double = StringLen($text)
                $lable_single = 0
        Else
                $lable_single = UBound($lable_single)
        EndIf
        $lable_double = StringLen($text) - $lable_single
        $lable_width = $lable_double * ($size / 3 * 4) + $lable_single * ($size / 3 * 2)
        $label_ret = GUICtrlCreateLabel($text, $left, $top, $lable_width, $size * 4 / 3, $yangshi, $kuozhang)
        GUICtrlSetFont(-1, $size, $quanzhi, $shuxing, $fontmane, $zhiliang)
        Return $label_ret
        ;作者：www.autobatch.org - 大海
EndFunc   ;==>_GUICtrlCreateLabel