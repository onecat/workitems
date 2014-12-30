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

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <Array.au3>
Global Const $gc_formName = "配置文件"
#Region ### START Koda GUI section ###
Global $gu_PzForm = GUICreate($gc_formName, 402, 288, 340, 128)
Global $gu_PzGroup1 = GUICtrlCreateGroup("[1]配置文件", 13, 6, 374, 60)
Global $gu_PzInput1 = GUICtrlCreateInput("", 25, 32, 260, 21)
Global $gu_PzButton1 = GUICtrlCreateButton("随机写入(O)", 288, 30, 86, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_PzButton2 = GUICtrlCreateButton("关于(A)", 13, 250, 59, 25)
Global $gu_PzButton3 = GUICtrlCreateButton("输出", 264, 250, 59, 25)
Global $gu_PzButton4 = GUICtrlCreateButton("退出(X)", 328, 250, 59, 25)
GUISetState(@SW_SHOW)
 
_Main() ;主函数开始
Exit
 
Func _Main()
        Local $ini = @ScriptDir & "\*.ini"
        GUICtrlSetData($gu_PzInput1, $ini)
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_PzButton1
                                
                                Local $path = FileSaveDialog("打开配置文件位置", _
                                                @ScriptDir, "配置文件.ini (*.ini)|所有文件(*.*)", 1 + 8, _
                                                "*.ini", $gu_PzForm)
                                GUICtrlSetData($gu_PzInput1, $path)
                                $gc_IniFile = GUICtrlRead($gu_PzInput1)
                                If $gc_IniFile = "" Then
                                        MsgBox(16, "", "错误, 读取INI文件失败.")
                                        Exit
                                EndIf
                                
                                Local $a_SectionName[101], $a_Pzname1 = "aa", $a_Pzname2 = "bb"
                                Local $I
                                For $I = 1 To 100 Step 1
                                        $a_SectionName[0] = UBound($a_SectionName) - 1
                                        $a_SectionName[$I] = "a" & $I
                                        IniWrite($gc_IniFile, $a_SectionName[$I], $a_Pzname1, 123)
                                        IniWrite($gc_IniFile, $a_SectionName[$I], $a_Pzname2, 1)
                                Next
                               MsgBox(0, "提示:", "成功写入配置文件" & @CRLF & "请在当前程序目录查看")                          
                        Case $gu_PzButton3
                                Local $gc_IniFile =GUICtrlRead($gu_PzInput1)
                                Local $sSection = IniReadSectionNames($gc_IniFile)
                                   If @error Then 
                                         MsgBox(0,"提示","请选择要创建后再输出查看")
                                        ExitLoop
                                    EndIf
                                Local $ArraySecName[101][5], $I
                                For $I = 1 To 100
                                        
                                        Local $pz_array = IniReadSection($gc_IniFile, $sSection[$I])
                                        $ArraySecName[0][0] = "字段名"
                                        $ArraySecName[0][1] = "第一关键字"
                                        $ArraySecName[0][2] = "第一关键字的值"
                                        $ArraySecName[0][3] = "第二关键字"
                                        $ArraySecName[0][4] = "第二关键字的值"
                                        
                                        $ArraySecName[$I][0] = $sSection[$I]
                                        $ArraySecName[$I][1] = $pz_array[1][0]
                                        $ArraySecName[$I][2] = $pz_array[1][1]
                                        $ArraySecName[$I][3] = $pz_array[2][0]
                                        $ArraySecName[$I][4] = $pz_array[2][1]
                                        ;If $ArraySecName[$I][4] = 1 Then
                                        ;MsgBox (0,"提示","字段"& $sSection[$I]&"中关健字bb值为1")
                                        ;EndIf
                                Next
                                _ArrayDisplay($ArraySecName, "$Array")
                                
                   Case $gu_PzButton2
                                MsgBox(0 + 64, $gc_formName, "作者：#####")
                                
                   Case $gu_PzButton4
                                Exit
                EndSwitch
        WEnd
EndFunc   ;==>_Main
