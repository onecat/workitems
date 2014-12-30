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

#include <GuiEdit.au3>
#include <GUIListView.au3>
#include <GuiStatusBar.au3>
#include <Editconstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>
#include <Misc.au3>

If _Singleton("test", 1) = 0 Then
        MsgBox(4096, "test", "Program is already running!")
        Exit 1
EndIf

Global $msg, $hWnd, $hListview, $hEdit, $hStatus, $progress, $hProgress, $aHit, $hDC, $hBrush
Global $isCreating = 0, $isEnterResp = 0
Global $maxImageNum = 500

Opt("GUIOnEventMode", 1)
Const $width = 280, $height = 320

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("test", $width, $height, (@DesktopWidth - $width) / 2, (@DesktopHeight - $height) / 2)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Main")
$Label = GUICtrlCreateLabel('Fill in image number for each folder and then click Create button.', 6, 12, 268, 32)
GUICtrlSetFont(-1, 10, 400, 0, "Default", 5) ; CLEARTYPE_QUALITY=5
GUICtrlSetColor(-1, 0x000080)
; ===============================================================================
; Listview
$hListview = _GUICtrlListView_Create($Form1, '', 6, 60, 266, 157, BitOR($LVS_EDITLABELS, $LVS_REPORT))
_GUICtrlListView_SetExtendedListViewStyle($hListview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_BORDERSELECT, $LVS_EX_FULLROWSELECT))
; ===============================================================================
$Button1 = GUICtrlCreateButton("Create", 60, 248, 160, 32) ;$BS_DEFPUSHBUTTON
GUICtrlSetOnEvent(-1, "_Main")
GUICtrlSetState(-1, $GUI_FOCUS)
; ===============================================================================
; Status bar - Defaults to 1 part, no text
$hStatus = _GUICtrlStatusBar_Create($Form1)
_GUICtrlStatusBar_SetMinHeight($hStatus, 20)
; ===============================================================================
; Insert column into listview and set width
_GUICtrlListView_InsertColumn($hListview, 0, 'Folder', 50)
_GUICtrlListView_InsertColumn($hListview, 1, 'Image Number', 84)
_GUICtrlListView_InsertColumn($hListview, 2, 'Image index range', 132)
; Set Text-Centered format for all three columns
_GUICtrlListView_JustifyColumn($hListview, 0, 2)
_GUICtrlListView_JustifyColumn($hListview, 1, 2)
_GUICtrlListView_JustifyColumn($hListview, 2, 2)
; Add item/subitem
For $i = 0 To 9
        _GUICtrlListView_AddItem($hListview, $i, $i) ; 1st column
        _GUICtrlListView_AddSubItem($hListview, $i, '0', 1) ; 2nd column
        _GUICtrlListView_AddSubItem($hListview, $i, '-', 2) ; 3rd column
Next
; ===============================================================================

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

; Update status bar
; ===============================================================================
; Initialize parts for status bar
Const $aParts[2] = [170, $width]
_GUICtrlStatusBar_SetParts($hStatus, $aParts)
; Part 1 - Text status information
; Part 2 - Embedded progress bar
If @OSType = "WIN32_WINDOWS" Then
        $progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
        $hProgress = GUICtrlGetHandle($progress)
        _GUICtrlStatusBar_EmbedControl($hStatus, 1, $hProgress)
Else ; Generally Win32_NT
        $progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_MARQUEE) ; marquee works on Win XP and above
        $hProgress = GUICtrlGetHandle($progress)
        _GUICtrlStatusBar_EmbedControl($hStatus, 1, $hProgress)
        _SendMessage($hProgress, $PBM_SETMARQUEE, True, 100) ; marquee works on Win XP and above
EndIf

GUIRegisterMsg($WM_NOTIFY, 'WM_NOTIFY')
GUIRegisterMsg($WM_COMMAND, 'WM_COMMAND')
GUIRegisterMsg($WM_ACTIVATE, 'WM_ACTIVATE')

GUICtrlSetState($progress, $GUI_HIDE)

While 1
        Sleep(10)
WEnd

Func _Main()
        Switch @GUI_CtrlId
                Case -3 ; $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        $isCreating = 1
                        GUICtrlSetState($Button1, $GUI_DISABLE)
                        GUICtrlSetState($progress, $GUI_SHOW)
                        Sleep(20000)
                        GUICtrlSetState($progress, $GUI_HIDE)
                        GUICtrlSetState($Button1, $GUI_ENABLE)
                        $isCreating = 0
        EndSwitch
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
        Local $tNMHDR, $hWndFrom, $iCode
        $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
        $hWndFrom = DllStructGetData($tNMHDR, 'hWndFrom')
        $iCode = DllStructGetData($tNMHDR, 'Code')

        Switch $iCode
                Case $NM_CLICK
                        $aHit = _GUICtrlListView_SubItemHitTest($hListview)
                        If $aHit[1] = 1 And $isCreating = 0 Then
                                Local $aRect = _GUICtrlListView_GetSubItemRect($hListview, $aHit[0], $aHit[1])
                                Local $aPos = ControlGetPos($hWnd, '', $hListview)
                                Local $text = _GUICtrlListView_GetItemText($hListview, $aHit[0], $aHit[1])
                                Local $iStyle = BitOR($WS_CHILD, $WS_VISIBLE, $ES_AUTOHSCROLL, $ES_LEFT, $ES_NUMBER)

                                $hEdit = _GUICtrlEdit_Create($hWnd, $text, $aPos[0] + $aRect[0], $aPos[1] + $aRect[1], _
                                                _GUICtrlListView_GetColumnWidth($hListview, $aHit[1]), 17, $iStyle)
                                _GUICtrlEdit_SetSel($hEdit, 0, -1)
                                _WinAPI_SetFocus($hEdit)
                                $hDC = _WinAPI_GetWindowDC($hEdit)
                                $hBrush = _WinAPI_CreateSolidBrush(0xFF6600)

                                Local $stRect = DllStructCreate('int;int;int;int')
                                DllStructSetData($stRect, 1, 0) ; left
                                DllStructSetData($stRect, 2, 0) ; top
                                DllStructSetData($stRect, 3, _GUICtrlListView_GetColumnWidth($hListview, $aHit[1])) ; width
                                DllStructSetData($stRect, 4, 17) ; height
                                _WinAPI_FrameRect($hDC, DllStructGetPtr($stRect), $hBrush)

                                HotKeySet("{ENTER}", "confirm_listview_input_2")
                                $isEnterResp = 0
                        EndIf
        EndSwitch
EndFunc   ;==>WM_NOTIFY

Func WM_ACTIVATE($hWnd, $msg, $wParam)
        #forceref $hWnd, $msg
        If $wParam = 1 Then _GUICtrlStatusBar_EmbedControl($hStatus, 1, $hProgress)
Endfunc

Func WM_COMMAND($hWnd, $msg, $wParam, $lParam)
        Local $iCode = BitShift($wParam, 16) ; Get hi-word

        Switch $lParam
                Case $hEdit
                        Switch $iCode
                                Case $EN_KILLFOCUS
                                        If Not $isEnterResp Then confirm_listview_input_1()
                                Case $EN_CHANGE
                                        ; Reset the whole "Image index range" column
                                        For $i = 0 To 9
                                                _GUICtrlListView_SetItemText($hListview, $i, "-", 2)
                                        Next
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func confirm_listview_input_2()
        $isEnterResp = 1
        confirm_listview_input_1()
        _GUICtrlListView_SetItemSelected($hListview, $aHit[0])
EndFunc   ;==>confirm_listview_input_2

Func confirm_listview_input_1()
        Local $sum = 0
        HotKeySet("{ENTER}") ; Unset hot key

        Local $iText = _GUICtrlEdit_GetText($hEdit)
        _GUICtrlListView_SetItemText($hListview, $aHit[0], Number($iText), $aHit[1])

        ; Data validation
        For $i = 0 To 9
                $sum += _GUICtrlListView_GetItemText($hListview, $i, 1)
        Next
        If $sum > $maxImageNum Then
                MsgBox(4096, "Warning", "Total image number is limited to " & $maxImageNum & "!", 0, $Form1)
                _GUICtrlListView_SetItemText($hListview, $aHit[0], $maxImageNum - ($sum - Number($iText)), $aHit[1])
        EndIf

        _WinAPI_DeleteObject($hBrush)
        _WinAPI_ReleaseDC($hEdit, $hDC)
        _WinAPI_DestroyWindow($hEdit)
        _GUICtrlEdit_Destroy($hEdit)
EndFunc   ;==>confirm_listview_input_1