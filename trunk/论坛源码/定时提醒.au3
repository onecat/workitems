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
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <StatusBarConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiStatusBar.au3>
#include <Timers.au3>
Opt("guicloseonesc",0)        ;Opt（）调整各种函数/参数的运作方式
                               ;此处为程序运行时按下ESC不发送消息，否则按下ESC键后，退出程序
#NoTrayIcon                    ;脚本开始执行时不显示托盘的图标
Global $itime_rst,$i
$i=-1

$Form1 = GUICreate("定时提醒", 230, 230, 463, 119)
$Group1 = GUICtrlCreateGroup(" 当前时间 ", 8, 7, 209, 49)
$Lab_now = GUICtrlCreateLabel("   " & @YEAR &"年" & @MON & "月" & @MDAY & "日   "& StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 16,25, 193, 22,$SS_SUNKEN)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup(" 设定时间 ", 8, 59, 209, 87)
$Label1 = GUICtrlCreateLabel("延时", 21, 84, 28, 17)
$Combo_min = GUICtrlCreateCombo("", 51, 81, 57, 25)
GUICtrlSetData($Combo_min,"00|01|03|05|10|15|20|25|30|35|40|45|50|55|60","10")
$Label2 = GUICtrlCreateLabel("分", 113, 84, 16, 17)
$Combo_sec = GUICtrlCreateCombo("", 133, 82, 56, 25)
GUICtrlSetData($Combo_sec,"00|03|05|10|15|20|25|30|35|40|45|50|55|59","00")
$Label3 = GUICtrlCreateLabel("秒", 193, 84, 16, 17)
$Label5 = GUICtrlCreateLabel("剩余时间（秒）", 21, 119, 88, 17)
$Lab_end = GUICtrlCreateLabel("", 112, 115, 97, 21,$SS_SUNKEN)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button_ok = GUICtrlCreateButton("确 定(&O)", 20, 170, 70, 25, 0)
ControlFocus("定时提醒","",$Button_ok)
$Button_exit = GUICtrlCreateButton("退 出(&X)", 129, 170, 70, 25, 0)
$Label4 = GUICtrlCreateLabel("____________________________________", 6, 150, 220, 15)
GUICtrlSetColor(-1, 0x9DB9EB)
;创建状态栏
Local $Form1 
Local $aparts[2]=[150,-1]
$Status = _GUICtrlStatusBar_Create ($Form1)
_GUICtrlStatusBar_SetParts($Status,$aparts)
_GUICtrlStatusBar_SetText($status," 定时提醒 Ver.2.01",0)
_GUICtrlStatusBar_SetText($status," BY小强",1)
GUISetState(@SW_SHOW)

_Timer_SetTimer($Form1, 1000, "_UpdateClock") ; create timer
While 1
$nMsg = GUIGetMsg()
Switch $nMsg
        Case $GUI_EVENT_CLOSE
         Exit
    Case $Button_exit
         Exit
    Case $Button_ok
                 _endtime()
EndSwitch
WEnd
Func _UpdateClock($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    GUICtrlSetData($Lab_now ,"   " & @YEAR &"年" & @MON & "月" & @MDAY & "日   "& StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC))
EndFunc   ;==>_UpdateClock
Func _endtime()
    MsgBox(64,"提示信息","你设定的时间为" & GUICtrlRead($Combo_min) & "分" & GUICtrlRead($Combo_sec) & "秒")
    GUICtrlSetState($button_ok,$gui_disable)
    _Timer_SetTimer($Form1, 1000, "_downClock") ; create timer
EndFunc
;倒计时
Func _downClock($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    $i=$i+1 
    GUICtrlSetData($Lab_end," " & GUICtrlRead($Combo_min)*60+GUICtrlRead($Combo_sec)-$i)
if GUICtrlRead($Lab_end)=0 Then
    GUICtrlSetData($Lab_end," 0 ")
     _Timer_KillAllTimers($Form1)
     _Timer_SetTimer($Form1, 1000, "_UpdateClock") ; create timer
    MsgBox(48,"警告","你设定的时间已到!!!") 
        _Timer_SetTimer($Form1, 10000, "_info") ; create timer
endif
EndFunc   ;==>_DownClock

Func _info($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    MsgBox(48,"警告","你设定的时间已到!!!") 
EndFunc   ;==>
