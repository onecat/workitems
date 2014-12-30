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

#include <Access.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIConstants.au3>
#include <GUIListView.au3>
#include <Array.au3>
#include <GuiEdit.au3>


Opt("GUIOnEventMode", 1)

$FrmConfirm = GUICreate("Confirm", 505, 385, -1, -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "_GUI")
$LstPass = GUICtrlCreateListView("NO|LOC|     Symptom     ", 5, 60, 220, 270)
_GUICtrlListView_SetItemSelected($LstPass,1,True,True)
GUICtrlCreateListViewItem("01|C1|ABC", $LstPass)
GUICtrlCreateListViewItem("03|C3|FEG", $LstPass)
GUICtrlCreateListViewItem("04|D3|DEF", $LstPass)

$LstFail = GUICtrlCreateListView("NO|LOC|     Symptom     ", 280, 60, 220, 270)
$BtnConfirm = GUICtrlCreateButton("Finish", 150, 340, 200, 32)
GUICtrlSetOnEvent(-1, "_GUI")

$Right = GUICtrlCreateButton("->", 230, 140, 46, 50)
GUICtrlSetOnEvent(-1, "_GUI")

$Left = GUICtrlCreateButton("<-", 230, 220, 46, 50)
GUICtrlSetOnEvent(-1, "_GUI")

GUISetState(@SW_SHOW, $FrmConfirm)


While 1
        Sleep(10)
        
WEnd

Func _GUI()

        Switch @GUI_CtrlId

                Case $BtnConfirm, $GUI_EVENT_CLOSE
                        Exit
                Case $Right
                        _GUICtrlListView_CopyItems($LstPass, $LstFail, True)
                Case $Left
                        _GUICtrlListView_CopyItems($LstFail, $LstPass, True)
                        
        EndSwitch
EndFunc   ;==>_GUI