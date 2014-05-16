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
#include <WinAPI.au3>
#include <GUIEdit.au3>
#include <GUIConstants.au3>
#include <StaticConstants.au3>

#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Local $input, $btn, $msg, $dat, $len, $ctrlhandle

GUICreate("input", 130, 80)
$input = GUICtrlCreateInput("", 10, 5, 110, 20)
GUICtrlSetLimit(-1, 17)
$btn = GUICtrlCreateButton("Ok", 35, 45, 60, 20)
GUISetState()
While $msg <> $GUI_EVENT_CLOSE
        $msg = GUIGetMsg()
        Switch $msg
                Case $btn
                        MsgBox(4096, "", GUICtrlRead($input))
        EndSwitch
        reinput($input)
WEnd

Func reinput($ctrlhandle)
        $dat = GUICtrlRead($ctrlhandle)
        $len = StringLen($dat)
        If $len = 2 Or $len = 5 Or $len = 8 Or $len = 11 Or $len = 14 Then
                GUICtrlSetData($ctrlhandle, $dat & "-")
        EndIf
EndFunc   ;==>reinput





;~ If Not IsDeclared("WM_CHAR") Then $WM_CHAR = 0x102

;~ $hGUI = GUICreate("Test", 180, 100)

;~ GUICtrlCreateLabel("", 20, 20, 140, 20, $SS_SUNKEN)
;~ $hParent = GUICtrlGetHandle(-1)
;~ GUICtrlSetBkColor(-1, 0xFFFFFF)

;~ $hCall = DllCallbackRegister("_IptProc", "int", "hWnd;uint;wparam;lparam")
;~ $pCall = DllCallbackGetPtr($hCall)

;~ Dim $iPos = 0
;~ For $i = 0 to 5
;~         GUICtrlCreateInput("00", $iPos, 3, 20, 17, 1, 4)
;~         GUICtrlSetLimit(-1, 2)
;~         GUICtrlSetFont(-1, 10, 800, "", "Garamond")
;~         _WinAPI_SetParent(GUICtrlGetHandle(-1), $hParent)
;~         If $i = 0 Then
;~                 $hOldC = _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pCall)
;~         Else
;~                 _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pCall)
;~         EndIf
;~         GUICtrlCreateLabel("-", $iPos + 41, 30, 4, 2, $SS_SUNKEN)
;~         GUICtrlSetFont(-1, 10, 800, "", "Garamond")
;~         $iPos += 23
;~ Next


;~ GUICtrlDelete(-1)
;~ $iBtnRead = GUICtrlCreateButton("Read", 20, 60, 140, 20)
;~ GUISetState()
;~ GUIRegisterMsg(0x111, "_WMCOMMAND")

;~ Do
;~         $iMsg = guiGetMsg()
;~         Switch $iMsg
;~         Case $iBtnRead
;~                 Dim $sData = ""
;~                 For $i = 4 to 14 Step 2
;~                         $sData &= GUICtrlRead($i) & "-"
;~                 Next
;~                 Msgbox(0, '', StringTrimRight($sData, 1))
;~         EndSwitch
;~ Until $iMsg = -3

;~ Func _IptProc($hWnd, $iMsg, $wparam, $lparam)
;~         If $iMsg = $WM_CHAR Then
;~                 If StringIsXDigit(Chr($wparam)) = 0 And $wparam <> 8 Then Return 0
;~         EndIf
;~         Return _WinAPI_CallWindowProc($hOldC, $hWnd, $iMsg, $wparam, $lparam)
;~ EndFunc        ;==>_IptProc

;~ Func _WMCOMMAND($hWnd, $iMsg, $wparam, $lparam)
;~         Local $nID, $iNotifyCode
;~         $nID = bitAND($wparam, 0xFFFF)
;~         $iNotifyCode = bitShift($wparam, 0x10)
;~         If $iNotifyCode = $EN_CHANGE Then
;~                 If StringLen(GUICtrlRead($nID)) >= 2 Then
;~                         GUICtrlSetState($nID + 2, $GUI_FOCUS)
;~                         _GUICtrlEdit_SetSel($nID + 2, 1, 2)
;~                 EndIf
;~         EndIf
;~ EndFunc        ;==>_WMCOMMAND
