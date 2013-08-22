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
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiImageList.au3>
#include <GuiComboBoxEx.au3>

Global $rVar

#Region ### START Koda GUI section ### Form=
$GUI = GUICreate("GUI 4 ComboBox", 205, 240)
$rComboBox = _GUICtrlComboBoxEx_Create($GUI, "", 10, 8, 185, 425, $CBS_DROPDOWNLIST)
$rButton = GUICtrlCreateButton("查 看", 20, 210, 205 - 40 ,27)
GUISetState()

$hImage = _GUIImageList_Create(16, 16, 5, 3)
_GUIImageList_AddIcon($hImage, "shell32.dll", 3)        ;关闭的文件夹
_GUIImageList_AddIcon($hImage, "shell32.dll", 4)        ;打开的文件夹
_GUIImageList_AddIcon($hImage, "shell32.dll", 126)        ;我的文档
_GUIImageList_AddIcon($hImage, "shell32.dll", 127)        ;图片收藏
_GUIImageList_AddIcon($hImage, "shell32.dll", 128)        ;我的音乐
_GUIImageList_AddIcon($hImage, "shell32.dll", 7)        ;移动存储
_GUIImageList_AddIcon($hImage, "shell32.dll", 8)        ;硬盘
_GUIImageList_AddIcon($hImage, "shell32.dll", 11)        ;ROM
_GUIImageList_AddIcon($hImage, "shell32.dll", 15)        ;我的电脑
_GUIImageList_AddIcon($hImage, "shell32.dll", 34)        ;桌面
_GUIImageList_AddIcon($hImage, "shell32.dll", 23)        ;帮助
_GUIImageList_AddIcon($hImage, "shell32.dll", 22)        ;搜索
_GUICtrlComboBoxEx_SetImageList($rComboBox, $hImage)

_GUICtrlComboBoxEx_BeginUpdate ($rComboBox)
_GUICtrlComboBoxEx_AddString($rComboBox, "我的文档", 2, 2)
_GUICtrlComboBoxEx_AddString($rComboBox, "图片收藏", 3, 3)
_GUICtrlComboBoxEx_AddString($rComboBox, "我的音乐", 4, 4)
_GUICtrlComboBoxEx_AddString($rComboBox, "桌面", 9, 9)
_GUICtrlComboBoxEx_AddString($rComboBox, "我的电脑", 8, 8)
;~ _GUICtrlComboBoxEx_SetItemIndent ($rComboBox, 2, 2)
$rFixed = DriveGetDrive("FIXED")
If Not @error Then
        For $rFix = 1 To $rFixed[0]
                $rVar = $rVar & ";" &$rFixed[$rFix]
        Next
        $rVar = StringTrimLeft(StringUpper($rVar),1)
        $a = _GUICtrlComboBoxEx_AddString($rComboBox, "本地硬盘(" & $rVar & ")", 6, 6, 6 ,1)
EndIf
$var = DriveGetDrive("All")
If Not @error Then
        For $i = 1 To $var[0]
                $Type = DriveGetType($var[$i])
                $rVar = StringUpper($var[$i])
                If Not @error Then
                        If $Type = "CDROM" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "CD 驱动器(" & $rVar & ")", 7, 7, 7, 1)
                        ElseIf $Type = "FIXED" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "本地硬盘(" & $rVar & ")", 6, 6, 6 , 1)
                        ElseIf $Type = "REMOVABLE" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "移动存储(" & $rVar & ")", 5, 5, 5 , 1)
                        Else
                                _GUICtrlComboBoxEx_AddString($rComboBox, "未知类型(" & $rVar & ")", 10, 10,10,1)
                        EndIf
                EndIf
        Next
EndIf
_GUICtrlComboBoxEx_EndUpdate ($rComboBox)

_GUICtrlComboBoxEx_AddString($rComboBox, "浏览 ...", 11, 11)
_GUICtrlComboBoxEx_SetCurSel($rComboBox, 5)
_GUICtrlComboBoxEx_ShowDropDown($rComboBox, True)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $rButton
                        $sAr = ComboBoxEx_GUICtrlRead($rComboBox)
                        MsgBox(0,"选中项目",$sAr)
        EndSwitch
WEnd

Func ComboBoxEx_GUICtrlRead($hWnd)
        $sAr = _GUICtrlComboBoxEx_GetCurSel($rComboBox)
        $rAr = _GUICtrlComboBoxEx_GetListArray($rComboBox)
        Return $rAr[$sAr + 1]
EndFunc