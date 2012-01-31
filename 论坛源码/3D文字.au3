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
#Include <File.au3>
GUICreate("3D文字", 650, 550)
GUISetBkColor(0x996600)
$arStyle=StringSplit("u|i|n|u|i|n","|",2)
For $i=0 To 5
    _3DText("3D文字", 10, 20+80*$i, 380, -1, 14 + $i*10, "b", $arStyle[$i])
Next
GUISetState(@SW_SHOW)
While 1
    Sleep(10)
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd
Func _3DText($sText,$iX, $iY, $iW=-1, $iH=-1, $iFontSize = 14, $sWeight="b", $sStyle = "n", $sFont="Arial")
    If $iW = -1 Or $iW = Default Then $iW = Int(StringLen($sText)*$iFontSize/1.2)
    If $iH = -1 Or $iH = Default Then $iH = Int(1.5*$iFontSize)
    If $iFontSize = -1 Or $iFontSize = Default Then $iFontSize = 14
    If $sWeight = -1 Or $sWeight = Default Then $sWeight = "b"
    If $sStyle = -1 Or $sStyle = Default Then $sStyle = "n"
    If $sFont = -1 Or $sFont = Default Then $sFont = "Arial"
    Local $f = 0x111111
    Switch $sWeight
        Case "b"
            $iWeight = 800
        Case "n"
            $iWeight = 400
    EndSwitch
    Switch $sStyle
        Case "n"
            $iStyle = 0
        Case "i"
            $iStyle = 2
        Case "u"
            $iStyle = 4
    EndSwitch
    Local $iZ = $iFontSize/10
    For $i=0 To $iZ Step 0.5
        GUICtrlCreateLabel($sText, $iX-$i, $iY+$i, $iW, $iH)
        GUICtrlSetColor(-1,$f*($i+1)/0.5)
        GUICtrlSetFont(-1, $iFontSize, $iWeight, $iStyle, $sFont)
        GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Next
EndFunc