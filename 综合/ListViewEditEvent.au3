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
#include <Array.au3>
#include <GUIListView.au3>
#include <GUIConstants.au3>
#include <WindowsConstants.au3>

; #### Variables for ListView edit notifications ####
; ===============================================================================================
Global $a_ListViewEditControls[1][4] = [[0]]
Global $h_ListViewEditDefProcedure = DllCallbackRegister("__ListViewEditDefProcedure", "int", "hWnd;uint;wparam;lparam")
Global $p_ListViewEditDefProcedure = DllCallbackGetPtr($h_ListViewEditDefProcedure)
Global $h_ListViewEditDefCall
Global $i_ListViewEditItem
Global $i_ListViewEditSubItem
Global $i_ListViewEditCounter
Global $f_ListViewMsgIsSending
Global $f_ListViewEditMsgIsSending


Global $h_ListViewDefProcedure = DllCallbackRegister("__ListViewDefProcedureeee", "int", "hWnd;uint;wparam;lparam")
Global $p_ListViewDefProcedure = DllCallbackGetPtr($h_ListViewDefProcedure)
Global $h_ListViewDefCall
; ===============================================================================================

; #### Structures for ListView edit notifications ####
; ===============================================================================================
Const $tagNMLISTVIEWHDR = "hWnd hWndFrom;int IDFrom;int Code"
Const $tagLISTVIEW_EDITBEGIN = $tagNMLISTVIEWHDR & ";int Item;int SubItem;int Show"
Const $tagLISTVIEW_EDITEND = $tagNMLISTVIEWHDR & ";int Item;int SubItem;int EndFlags;dword Length;ptr Text;int AutoComplete"
Const $tagLISTVIEW_SELCHANGING = $tagNMLISTVIEWHDR & ";int CurrentItem;int NewItem;dword ChangeFlags;int AllowChange"
Const $tagLISTVIEW_SELCHANGED = $tagNMLISTVIEWHDR & ";int PreviousItem;int CurrentItem;dword ChangeFlags;int Reserved"
Const $tagLISTVIEW_ITEMCHECKING = $tagNMLISTVIEWHDR & ";int Item;int CurrentChecked;int NewChecked;int Flags;int AllowCheck"
Const $tagLISTVIEW_ITEMCHECKED = $tagNMLISTVIEWHDR & ";int Item;int CurrentChecked;int PreviousChecked;int Flags"
; ===============================================================================================



; #### Flags for LISTVIEW_SELCHANGING.ChangeFlags ####
; ===============================================================================================


Const $LVCF_UPARROW = 1
Const $LVCF_DOWNARROW = 2
Const $LVCF_LBUTTON = 3
Const $LVCF_RBUTTON = 4
Const $LVCF_INTERNAL = 5
Const $LVCF_SPACE = 6
; ===============================================================================================


; #### Flags for LISTVIEW_ITEMCHECKING.Flags ####
; ===============================================================================================

Const $LVICF_SPACE = 1
Const $LVICF_LBUTTON = 2
Const $LVICF_RBUTTON = 3
Const $LVICF_INTERNAL = 4
Const $LVICF_EXTERNAL = 5
; ===============================================================================================


; #### Notifications for ListView ####
; ===============================================================================================
Const $LVN_EDITBEGIN = $LVN_FIRST - 777
Const $LVN_EDITEND = $LVN_FIRST - 7777
Const $LVN_SELCHANGING = $LVN_FIRST - 77777
Const $LVN_SELCHANGED = $LVN_FIRST - 777777
Const $LVN_ITEMCHECKING = $LVN_FIRST - 7777777
Const $LVN_ITEMCHECKED = $LVN_FIRST - 77777777
; ===============================================================================================

; #### Flags for LISTVIEW_EDIT.EndFlags ####
; ===============================================================================================
Const $LVEF_ENTER = 1
Const $LVEF_ESC = 2
Const $LVEF_LOSEFOCUS = 3
Const $LVEF_CANCEL = 4
Const $LVEF_FORCECLOSE = 5
; ===============================================================================================

; #### Default procedure for ListView controls ####
; ===============================================================================================


Func __ListViewDefProcedureeee($hWnd, $iMsg, $iwParam, $ilParam)

        Switch $iMsg
        Case $WM_VSCROLL, $WM_HSCROLL
                Local $iEditId = _GUICtrlListView_GetEditId($hWnd)
                If bitAnd(GUICtrlGetState($iEditId), $GUI_SHOW) Then Return 1
        Case $LVM_HITTEST
                Local $tBuffer, $iListView, $hParent, $iItem, $iFlags, $fChecked, $vDefReturn

                $vDefReturn = _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                $tBuffer = DllStructCreate("long X;long Y;uint Flags;int Item;int SubItem", $ilParam)

                If (DllStructGetData($tBuffer, "Flags") <> 8) Then
                        $tBuffer = 0
                        Return $vDefReturn
                EndIf
                $iItem = DllStructGetData($tBuffer, "Item")
                $fChecked = _GUICtrlListView_GetItemChecked($hWnd, $iItem)
                $tBuffer = 0
                $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                $hParent = _WinAPI_GetParent($hWnd)
                $tBuffer = DllStructCreate($tagLISTVIEW_ITEMCHECKING)
                DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                DllStructSetData($tBuffer, "IDFrom", $iListView)
                DllStructSetData($tBuffer, "Code", $LVN_ITEMCHECKING)
                DllStructSetData($tBuffer, "Item", $iItem)
                DllStructSetData($tBuffer, "CurrentChecked", $fChecked)
                DllStructSetData($tBuffer, "NewChecked", Not $fChecked)
                DllStructSetData($tBuffer, "AllowCheck", 1)

                $iFlags = DllCall("User32.dll", "short", "GetAsyncKeyState", "int", 1)
                If bitAnd($iFlags[0], 0x8000) Then
                        DllStructSetData($tBuffer, "Flags", $LVICF_LBUTTON)
                Else
                        $iFlags = DllCall("User32.dll", "short", "GetAsyncKeyState", "int", 2)
                        If bitAnd($iFlags[0], 0x8000) Then
                                DllStructSetData($tBuffer, "Flags", $LVICF_RBUTTON)
                        Else
                                DllStructSetData($tBuffer, "Flags", $LVICF_EXTERNAL)
                        EndIf
                EndIf
                _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tBuffer))
                If (DllStructGetData($tBuffer, "AllowCheck") = 0) Then
                        $tBuffer = 0
                        _GUICtrlListView_SetItemChecked($hWnd, $iItem, Not $fChecked)
                        Return 1
                EndIf
                $iFlags = DllStructGetData($tBuffer, "Flags")
                $tBuffer = 0
                $vDefReturn = _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                $tBuffer = DllStructCreate($tagLISTVIEW_ITEMCHECKED)
                DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                DllStructSetData($tBuffer, "IDFrom", $iListView)
                DllStructSetData($tBuffer, "Code", $LVN_ITEMCHECKED)
                DllStructSetData($tBuffer, "Item", $iItem)
                DllStructSetData($tBuffer, "CurrentChecked", Not $fChecked)
                DllStructSetData($tBuffer, "PreviousChecked", $fChecked)
                DllStructSetData($tBuffer, "Flags", $iFlags)
                _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tBuffer))
                $tBuffer = 0
                Return $vDefReturn
        Case $WM_NOTIFY
                Local $tBuffer, $iCode, $iEditId, $iCol

                $tBuffer = DllStructCreate($tagNMHDR & ";int Column", $ilParam)
                $iCode = DllStructGetData($tBuffer, "Code")
                $iCol = DllStructGetData($tBuffer, "Column")
                $tBuffer = 0

                If ($iCode = -328) Or ($iCode = -308) Then
                        If ($iCol = $i_ListViewEditSubItem) Or ($iCol = ($i_ListViewEditSubItem - 1)) Then
                                $iEditId = _GUICtrlListView_GetEditId($hWnd)
                                If bitAND(GUICtrlGetState($iEditId), $GUI_SHOW) Then Return 1
                        EndIf
                EndIf
        Case $WM_LBUTTONDBLCLK
                Local $iX, $iY, $aInfo, $tBuffer, $pBuffer, $iListView

                $iX = bitAnd($ilParam, 0xFFFF)
                $iY = bitShift($ilParam, 0x10)
                $aInfo = _GUICtrlListView_SubItemHitTest($hWnd, $iX, $iY)

;                _Arraydisplay($aInfo)

                If (Not $aInfo[2]) And (Not $aInfo[3]) And (Not $aInfo[4]) _
                And ($aInfo[5]) And ($aInfo[6]) And ($aInfo[7]) _
                And (Not $aInfo[8]) And (Not $aInfo[9]) And (Not $aInfo[10]) Then
                        Return 1
                EndIf

                If ($aInfo[0] <> -1) Then
                        $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                        $tBuffer = DllStructCreate($tagLISTVIEW_EDITBEGIN)
                        $pBuffer = DllStructGetPtr($tBuffer)
                        DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                        DllStructSetData($tBuffer, "IDFrom", $iListView)
                        DllStructSetData($tBuffer, "Code", $LVN_EDITBEGIN)
                        DllStructSetData($tBuffer, "Item", $aInfo[0])
                        DllStructSetData($tBuffer, "SubItem", $aInfo[1])
                        DllStructSetData($tBuffer, "Show", 1)
                        _WinAPI_PostMessage(_WinAPI_GetParent($hWnd), $WM_NOTIFY, $iListView, $pBuffer)
                        If (DllStructGetData($tBuffer, "Show") <> 0) Then
                                _GUICtrlListView_EditItem($hWnd, $aInfo[0], $aInfo[1])
                        EndIf
                        $tBuffer = 0
                EndIf
                $aInfo = 0
        Case $WM_RBUTTONDOWN, $WM_LBUTTONDOWN, $WM_KEYDOWN
                _WinAPI_SetFocus($hWnd)
                Local $aIndices, $iItem = -1, $iNewItem = -1, $iX, $iY, $tXY, $aInfo, $tBuffer, $iListView


                If ($iMsg = $WM_KEYDOWN) And ($iwParam = 32) Then
                        Local $aIndices = _GUICtrlListView_GetSelectedIndices($hWnd, 1)
                        If ($aIndices[0] = 0) Then
                                For $i = 0 To _GUICtrlListView_GetItemCount($hWnd) - 1
                                        If _GUICtrlListView_GetItemFocused($hWnd, $i) = 0 Then ContinueLoop
                                        $iItem = $i
                                        ExitLoop
                                Next
                        Else
                                $iItem = $aIndices[1]
                        EndIf
                        $aIndices = 0
                        If ($iItem = -1) Then
                                Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                        EndIf
                        $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                        $hParent = _WinAPI_GetParent($hWnd)
                        Local $fChecked = _GUICtrlListView_GetItemChecked($hWnd, $iItem)
                        $tBuffer = DllStructCreate($tagLISTVIEW_ITEMCHECKING)
                        DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                        DllStructSetData($tBuffer, "IDFrom", $iListView)
                        DllStructSetData($tBuffer, "Code", $LVN_ITEMCHECKING)
                        DllStructSetData($tBuffer, "Item", $iItem)
                        DllStructSetData($tBuffer, "CurrentChecked", $fChecked)
                        DllStructSetData($tBuffer, "NewChecked", Not $fChecked)
                        DllStructSetData($tBuffer, "Flags", $LVICF_SPACE)
                        DllStructSetData($tBuffer, "AllowCheck", 1)
                        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tBuffer))

                        If (DllStructGetData($tBuffer, "AllowCheck") = 0) Then
                                $tBuffer = 0
                                Return 1
                        EndIf
                        $tBuffer = 0
                        Local $vDefReturn
                        $vDefReturn = _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                        $tBuffer = DllStructCreate($tagLISTVIEW_ITEMCHECKED)
                        DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                        DllStructSetData($tBuffer, "IDFrom", $iListView)
                        DllStructSetData($tBuffer, "Code", $LVN_ITEMCHECKED)
                        DllStructSetData($tBuffer, "Item", $iItem)
                        DllStructSetData($tBuffer, "Flags", $LVICF_SPACE)
                        DllStructSetData($tBuffer, "CurrentChecked", Not $fChecked)
                        DllStructSetData($tBuffer, "PreviousChecked", $fChecked)

                        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tBuffer))
                        $tBuffer = 0
                        Return $vDefReturn
                EndIf

                If ($iMsg = $WM_KEYDOWN) And (($iwParam <> 38) And ($iwParam <> 40)) Then
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf

                $aIndices = _GUICtrlListView_GetSelectedIndices($hWnd, True)
                If ($aIndices[0] <> 0) And ($iMsg = $WM_KEYDOWN) Then
                        If ($iwParam = 38) Then
                                $iItem = $aIndices[1]
                                $iNewItem = $iItem - 1
                        Else
                                $iItem = $aIndices[$aIndices[0]]
                                $iNewItem = $iItem + 1
                        EndIf
                ElseIf ($aIndices[0] = 0) Then
                        For $i = 0 To _GUICtrlListView_GetItemCount($hWnd) - 1
                                If (_GUICtrlListView_GetItemFocused($hWnd, $i) = 0) Then ContinueLoop
                                $iItem = $i
                                ExitLoop
                        Next
                        If ($iItem = -1) Then
                                Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                        ElseIf ($iMsg = $WM_KEYDOWN) Then
                                If ($iwParam = 38) Then
                                        $iNewItem = $iItem - 1
                                Else
                                        $iNewItem = $iItem + 1
                                EndIf
                        EndIf
                EndIf
                If ($iMsg = $WM_LBUTTONDOWN) Or ($iMsg = $WM_RBUTTONDOWN) Then
                        $iX = bitAnd($ilParam, 0xFFFF)
                        $iY = bitShift($ilParam, 0x10)

                        Local $fOnCbx = _GUICtrlListView_PointIsHoverCheckBox($hWnd, $iX, $iY)
                        If ($fOnCbx) Then
                                $iItem = _GUICtrlListView_GetSelectedIndices($hWnd, 1)
                                If ($iItem[0] = 0) Then
                                        $iItem = -1
                                Else
                                        $iItem = $iItem[1]
                                EndIf
                                $iNewItem = $iItem
                        Else
                                $aInfo = _GUICtrlListView_SubItemHitTest($hWnd, $iX, $iY)
                                If ($aIndices[0] = 0) Then
                                        $iItem = -1
                                Else
                                        $iItem = $aIndices[1]
                                EndIf
                                $iNewItem = $aInfo[0]
                        EndIf
                EndIf
                If ($iNewItem = $iItem) Then
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf

                If (($iMsg = $WM_LBUTTONDOWN) Or ($iMsg = $WM_RBUTTONDOWN)) And ($iItem <> $iNewItem) Then
                        $tBuffer = DllStructCreate($tagLISTVIEW_SELCHANGING)
                        $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                        DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                        DllStructSetData($tBuffer, "IDFrom", $iListView)
                        DllStructSetData($tBuffer, "Code", $LVN_SELCHANGING)
                        DllStructSetData($tBuffer, "CurrentItem", $iItem)
                        DllStructSetData($tBuffer, "NewItem", $iNewItem)
                        DllStructSetData($tBuffer, "AllowChange", 1)
                        If ($iMsg = $WM_LBUTTONDOWN) Then
                                DllStructSetData($tBuffer, "ChangeFlags", $LVCF_LBUTTON)
                        Else

                                DllStructSetData($tBuffer, "ChangeFlags", $LVCF_RBUTTON)


                        EndIf
                        Local $pBuffer = DllStructGetPtr($tBuffer)
                        Local $hParent = _WinAPI_GetParent($hWnd)
                        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, $pBuffer)
                        If DllStructGetData($tBuffer, "AllowChange") = 0 Then
                                $tBuffer = 0
                                Return 1
                        EndIf
                        Local $vDefReturn, $tChanged
                        $vDefReturn = _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                        $tChanged = DllStructCreate($tagLISTVIEW_SELCHANGED)
                        DllStructSetData($tChanged, "hWndFrom", $hWnd)
                        DllStructSetData($tChanged, "IDFrom", $iListView)
                        DllStructSetData($tChanged, "Code", $LVN_SELCHANGED)
                        DllStructSetData($tChanged, "PreviousItem", $iItem)
                        DllStructSetData($tChanged, "CurrentItem", $iNewItem)
                        DllStructSetData($tChanged, "ChangeFlags", DllStructGetData($tBuffer, "ChangeFlags"))
                        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tChanged))
                        $tBuffer = 0
                        $tChanged = 0
                        Return $vDefReturn
                EndIf

                If ($iwParam = 38) Then
                        If ($iNewItem < 0) Then $iNewItem = 0
                Else
                        Local $iMax = _GUICtrlListView_GetItemCount($hWnd)
                        If ($iNewItem >= $iMax) Then $iNewItem = $iMax - 1
                EndIf
                If ($iNewItem = $iItem) Then
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf
                $tBuffer = DllStructCreate($tagLISTVIEW_SELCHANGING)
                $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                DllStructSetData($tBuffer, "hWndFrom", $hWnd)
                DllStructSetData($tBuffer, "IDFrom", $iListView)
                DllStructSetData($tBuffer, "Code", $LVN_SELCHANGING)
                DllStructSetData($tBuffer, "CurrentItem", $iItem)
                DllStructSetData($tBuffer, "NewItem", $iNewItem)
                DllStructSetData($tBuffer, "AllowChange", 1)
                If ($iwParam = 38) Then
                        DllStructSetData($tBuffer, "ChangeFlags", $LVCF_UPARROW)
                Else

                        DllStructSetData($tBuffer, "ChangeFlags", $LVCF_DOWNARROW)
                EndIf
                Local $pBuffer = DllStructGetPtr($tBuffer)
                _WinAPI_PostMessage(_WinAPI_GetParent($hWnd), $WM_NOTIFY, $iListView, $pBuffer)
                If DllStructGetData($tBuffer, "AllowChange") = 0 Then
                        $tBuffer = 0
                        Return 1
                EndIf
                $tBuffer = 0
        Case $LVM_SETITEMSTATE
                Local $tBuffer, $iMask, $iState, $iItem, $iNewItem, $tChange, $iListView, $hParent

                $tBuffer = DllStructCreate($tagLVITEM, $ilParam)
                $iMask = DllStructGetData($tBuffer, "Mask")
                If bitAnd($iMask, $LVIF_STATE) <> $LVIF_STATE Then
                        $tBuffer = 0
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf

                $iState = DllStructGetData($tBuffer, "State")
                If bitAnd($iState, $LVIS_SELECTED) <> $LVIS_SELECTED Then
                        $tBuffer = 0
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf
                $iNewItem = DllStructGetData($tBuffer, "Item")
                $iItem = _GUICtrlListView_GetSelectedIndices($hWnd, 1)
                If ($iItem[0] = 0) Then
                        $iItem = -1
                Else
                        $iItem = $iItem[1]
                EndIf

                $tBuffer = 0
                If ($iNewItem = $iItem) Then
                        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                EndIf

                $iListView = _WinAPI_GetDlgCtrlID($hWnd)
                $hParent = _WinAPI_GetParent($hWnd)
                $tChange = DllStructCreate($tagLISTVIEW_SELCHANGING)
                DllStructSetData($tChange, "hWndFrom", $hWnd)
                DllStructSetData($tChange, "IDFrom", $iListView)
                DllStructSetData($tChange, "Code", $LVN_SELCHANGING)
                DllStructSetData($tChange, "CurrentItem", $iItem)
                DllStructSetData($tChange, "NewItem", $iNewItem)
                DllStructSetData($tChange, "ChangeFlags", $LVCF_INTERNAL)
                DllStructSetData($tChange, "AllowChange", 1)

                _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tChange))
                If (DllStructGetData($tChange, "AllowChange") = 0) Then
                        $tChange = 0
                        Return 1
                EndIf
                $tChange = 0
                Local $vDefReturn
                $vDefReturn = _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
                $tChange = DllStructCreate($tagLISTVIEW_SELCHANGED)
                DllStructSetData($tChange, "hWndFrom", $hWnd)
                DllStructSetData($tChange, "IDFrom", $iListView)
                DllStructSetData($tChange, "Code", $LVN_SELCHANGED)
                DllStructSetData($tChange, "PreviousItem", $iItem)
                DllStructSetData($tChange, "CurrentItem", $iNewItem)
                DllStructSetData($tChange, "ChangeFlags", $LVCF_INTERNAL)
                DllStructSetData($tChange, "Reserved", 0)
                _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, DllStructGetPtr($tChange))
                $tChange = 0
                Return $vDefReturn
        EndSwitch
        Return _WinAPI_CallWindowProc($h_ListViewDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc        ;==>__ListViewDefProcedureeee

Func _GUICtrlListView_PointIsHoverCheckbox($hListView, $iX, $iY)
        Local $aInfo, $fHover = 0

        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle($hListView)

        $aInfo = _GUICtrlListView_SubItemHittest($hListView, $iX, $iY)
        If (Not $aInfo[2]) And (Not $aInfo[3]) And (Not $aInfo[4]) _
        And ($aInfo[5]) And ($aInfo[6]) And ($aInfo[7]) _
        And (Not $aInfo[8]) And (Not $aInfo[9]) And (Not $aInfo[10]) Then
                $fHover = 1
        EndIf

        $aInfo = 0
        Return $fHover
EndFunc        ;==>_GUICtrlListView_PointIsHoverCheckbox


; #### Default procedure for ListView Edit controls ####
; ===============================================================================================


Func __ListViewEditDefProcedure($hWnd, $iMsg, $iwParam, $ilParam)
        If ($f_ListViewEditMsgIsSending = 1) Then
                Return _WinAPI_CallWindowProc($h_ListViewEditDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
        EndIf

        If ($iMsg <> $WM_KILLFOCUS) And ($iMsg <> $WM_KEYUP) And ($iMsg <> $WM_DESTROY) Then
                Return _WinAPI_CallWindowProc($h_ListViewEditDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
        EndIf

        If ($iMsg = $WM_DESTROY) Then $iwParam = 27
        If ($iMsg = $WM_KILLFOCUS) Then $iwParam = 13

        If ($iwParam <> 13) And ($iwParam <> 27) Then
                Return _WinAPI_CallWindowProc($h_ListViewEditDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
        EndIf

        Local $tBuffer, $pBuffer, $hParent, $hListView, $iLength
        Local $pText, $tText, $sText, $iListView, $iIndex, $aLVE

        $hListView = _WinAPI_GetParent($hWnd)
        $iIndex = _GUICtrlListView_GetEditArrayIndex($hListView)
        If ($iIndex = 0) Then
                Return _WinAPI_CallWindowProc($h_ListViewEditDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
        EndIf
        $iListView = _WinAPI_GetDlgCtrlID($hListView)
        $hParent = _WinAPI_GetParent($hListView)

        $aLVE = $a_ListViewEditControls
        $sText = GUICtrlRead($a_ListViewEditControls[$iIndex][1])
        $iLength = StringLen($sText) + 2

        $tText = DllStructCreate("wchar Text[" & $iLength & "]")
        $pText = DllStructGetPtr($tText)
        $tBuffer = DllStructCreate($tagLISTVIEW_EDITEND)
        $pBuffer = DllStructGetPtr($tBuffer)

        DllStructSetData($tText, "Text", $sText)
        DllStructSetData($tBuffer, "hWndFrom", $hListView)
        DllStructSetData($tBuffer, "IDFrom", $iListView)
        DllStructSetData($tBuffer, "Code", $LVN_EDITEND)
        DllStructSetData($tBuffer, "Item", $i_ListViewEditItem)
        DllStructSetData($tBuffer, "SubItem", $i_ListViewEditSubItem)
        DllStructSetData($tBuffer, "Length", DllStructGetSize($tText))
        DllStructSetData($tBuffer, "Text", $pText)
        DllStructSetData($tBuffer, "AutoComplete", $a_ListViewEditControls[$iIndex][3])

        Select
        Case $iMsg = $WM_KILLFOCUS
                DllStructSetData($tBuffer, "EndFlags", $LVEF_LOSEFOCUS)
        Case $iMsg = $WM_DESTROY
                DllStructSetData($tBuffer, "EndFlags", $LVEF_FORCECLOSE)
        Case $iwParam = 13
                DllStructSetData($tBuffer, "EndFlags", $LVEF_ENTER)
        Case $iwParam = 27
                DllStructSetData($tBuffer, "EndFlags", $LVEF_ESC)
        EndSelect

        $f_ListViewEditMsgIsSending = 1
        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, $pBuffer)
        If (DllStructGetData($tBuffer, "AutoComplete") <> 0) Then
                Local $tTextReturn

                $iLength = DllStructGetData($tBuffer, "Length")
                $pText = DllStructGetData($tBuffer, "Text")
                $tTextReturn = DllStructCreate("wchar Text[" & ($iLength / 2)& "]", $pText)
                $sText = DllStructGetData($tTextReturn, "Text")
                $tTextReturn = 0
                _GUICtrlListView_SetItemText($hListView, $i_ListViewEditItem, $sText, $i_ListViewEditSubItem)
        EndIf
        GUICtrlSetState($iListView, $GUI_FOCUS)
        GUICtrlSetState($a_ListViewEditControls[$iIndex][1], $GUI_HIDE)
        $f_ListViewEditMsgIsSending = 0
        $aLVE = 0
        $tText = 0
        $tBuffer = 0
        Return _WinAPI_CallWindowProc($h_ListViewEditDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc        ;==>_ListViewEditDefProcedure

; #### FUNCTION ####
; ===============================================================================================


; Name        : _GUICtrlListView_GetEditArrayIndex
; Description        : Retrieves the index of the edit control in ListView edit control array.
; Parameter(s)        : $hListView        - Handle to the window.
; Return values        : Returns 1-based value if succeeds, otherwise 0.
; Author        : Pusofalse
; ===============================================================================================


Func _GUICtrlListView_GetEditArrayIndex($hListView)
        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle(-1)

        For $i = 1 To $a_ListViewEditControls[0][0]
                If ($hListView = $a_ListViewEditControls[$i][0]) Then Return $i
        Next
        Return 0
EndFunc        ;==>_GUICtrlListView_GetEditArrayIndex

; #### FUNCTION ####
; ===============================================================================================


; Name        : _GUICtrlListView_RegisterEditEvent
; Description        : Register Edit notification for a ListView Window.
; Parameter(s)        : $hListView        - Handle to the window.
;                : $fAutoComplete        - A BOOL value indicates that whether save the result automatically when finishing the input.
; Return values        : True is returned if succeeds, else False.
; Author        : Pusofalse
; ===============================================================================================


Func _GUICtrlListView_RegisterEditEvent($hListView, $fAutoComplete = 1)
        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle($hListView)

        If (_GUICtrlListView_GetEditArrayIndex($hListView)) Then Return 1

        $a_ListViewEditControls[0][0] += 1
        Redim $a_ListViewEditControls[$a_ListViewEditControls[0][0] + 1][4]
        $a_ListViewEditControls[$a_ListViewEditControls[0][0]][0] = $hListView
        $a_ListViewEditControls[$a_ListViewEditControls[0][0]][1] = GUICtrlCreateInput("", 0, 0, 20, 18)
        $a_ListViewEditControls[$a_ListViewEditControls[0][0]][2] = GUICtrlGetHandle(-1)
        $a_ListViewEditControls[$a_ListViewEditControls[0][0]][3] = $fAutoComplete

        GUICtrlSetState(-1, $GUI_HIDE)
        GUICtrlSetFont(-1, 8.8, 400, 0, "Verdana")
        _WinAPI_SetParent($a_ListViewEditControls[$a_ListViewEditControls[0][0]][2], $hListView)

        Local $aAccelerator[1][2] = [["{enter}", $a_ListViewEditControls[$a_ListViewEditControls[0][0]][1]]]
        GUISetAccelerators($aAccelerator)

        If ($a_ListViewEditControls[0][0] = 1) Then
                $h_ListViewEditDefCall = _WinAPI_SetWindowLong( _
                $a_ListViewEditControls[$a_ListViewEditControls[0][0]][2], -4, $p_ListViewEditDefProcedure)

                $h_ListViewDefCall = _WinAPI_SetWindowLong($hListView, -4, $p_ListViewDefProcedure)
        Else
                _WinAPI_SetWindowLong( _
                $a_ListViewEditControls[$a_ListViewEditControls[0][0]][2], -4, $p_ListViewEditDefProcedure)

                _WinAPI_SetWindowLong($hListView, -4, $p_ListViewDefProcedure)
        EndIf
        Return 1
EndFunc        ;==>_GUICtrlListView_RegisterEditEvent

Func _GUICtrlListView_EditItem($hListView, $iItem, $iSubItem = 0)
        Local $aRect, $iLeft, $iTop, $iWidth, $iHeight, $iEditId, $hEdit, $sText

        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle($hListView)
        $i_ListViewEditItem = -1
        $i_ListViewEditSubItem = -1

        For $i = 1 To $a_ListViewEditControls[0][0]
                If ($a_ListViewEditControls[$i][0] = $hListView) Then
                        $iEditId = $a_ListViewEditControls[$i][1]
                        $hEdit = $a_ListViewEditControls[$i][2]
                        ExitLoop
                EndIf
        Next
        If ($iEditId = 0) Then Return SetError(1, 0, 0)

        $aRect = _GUICtrlListView_GetItemRect($hListView, $iItem)
        If (IsArray($aRect) = 0) Then Return SetError(1, 0, 0)

        $iLeft = $aRect[0]
        $iTop = $aRect[1]
        $iHeight = $aRect[3] - $iTop
        For $i = 0 To $iSubItem - 1
                $iLeft += _GUICtrlListView_GetColumnWidth($hListView, $i)
        Next
        $iWidth = _GUICtrlListView_GetColumnWidth($hListView, $iSubItem)

        $i_ListViewEditItem = $iItem
        $i_ListViewEditSubItem = $iSubItem

        $sText = _GUICtrlListView_GetItemText($hListView, $iItem, $iSubItem)

        GUICtrlSetData($iEditId, $sText)
        GUICtrlSetPos($iEditId, $iLeft, $iTop, $iWidth, $iHeight)
        Return GUICtrlSetState($iEditId, bitOR($GUI_SHOW, $GUI_FOCUS))
EndFunc        ;==>_GUICtrlListView_EditItem

Func _GUICtrlListView_UnregisterEditEvent($hListView)
        Local $iIndex

        $iIndex = _GUICtrlListView_GetEditArrayIndex($hListView)
        If ($iIndex = 0) Then Return 0

        GUICtrlDelete($a_ListViewEditControls[$iIndex][1])
        $a_ListViewEditControls[$iIndex][0] = 0
        $a_ListViewEditControls[$iIndex][1] = 0
        $a_ListViewEditControls[$iIndex][2] = 0
        $a_ListViewEditControls[$iIndex][3] = 0
        Return 1
EndFunc        ;==>_GUICtrlListView_UnregisterEditEvent

Func _GUICtrlListView_GetEditId($hListView)
        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle($hListView)

        Local $iIndex = _GUICtrlListView_GetEditArrayIndex($hListView)
        If ($iIndex = 0) Then Return 0
        Return $a_ListViewEditControls[$iIndex][1]
EndFunc        ;==>_GUICtrlListView_GetEditId

Func _GUICtrlListView_GetEditData($hListView)
        If Not IsHWnd($hListView) Then $hListView = GUICtrlGetHandle($hListView)

        Local $iEditId = _GUICtrlListView_GetEditID($hListView)
        If ($iEditId = 0) Then Return SetError(1, 0, "")
        Return GUICtrlRead($iEditId)
EndFunc        ;==>_GUICtrlListView_GetEditData

Func _GUICtrlListView_SetEditData($hListView, $vData = "", $fAppend = 0)
        Local $iEditID

        $iEditID = _GUICtrlListView_GetEditID($hListView)
        Return GUICtrlSetData($iEditID, $vData, $fAppend)
EndFunc        ;==>_GUICtrlListView_SetEditData

Func _GUICtrlListView_CancelEdit($hListView)
        Local $iIndex, $sText, $tText, $pText, $tBuffer, $pBuffer, $iLength, $hParent, $iListView

        $iIndex = _GUICtrlListView_GetEditArrayIndex($hListView)
        If ($iIndex = 0) Then Return SetError(1, 0, 0)

        $iEditId = $a_ListViewEditControls[$iIndex][1]
        If ($iEditId = 0) Then Return SetError(1, 0, 0)

        If bitAND(GUICtrlGetState($iEditId), $GUI_HIDE) = $GUI_HIDE Then Return 0

        $iListView = _WinAPI_GetDlgCtrlID($hListView)
        $hParent = _WinAPI_GetParent($hListView)

        $sText = GUICtrlRead($iEditId)
        $iLength = StringLen($sText) + 2

        $tText = DllStructCreate("wchar Text[" & $iLength & "]")
        $pText = DllStructGetPtr($tText)
        $tBuffer = DllStructCreate($tagLISTVIEW_EDITEND)
        $pBuffer = DllStructGetPtr($tBuffer)

        DllStructSetData($tText, "Text", $sText)
        DllStructSetData($tBuffer, "hWndFrom", $hListView)
        DllStructSetData($tBuffer, "IDFrom", $iListView)
        DllStructSetData($tBuffer, "Code", $LVN_EDITEND)
        DllStructSetData($tBuffer, "Item", $i_ListViewEditItem)
        DllStructSetData($tBuffer, "SubItem", $i_ListViewEditSubItem)
        DllStructSetData($tBuffer, "EndFlags", $LVEF_CANCEL)
        DllStructSetData($tBuffer, "Length", $iLength)
        DllStructSetData($tBuffer, "Text", $pText)
        DllStructSetData($tBuffer, "AutoComplete", $a_ListViewEditControls[$iIndex][3])

        $f_ListViewEditMsgIsSending = 1
        _WinAPI_PostMessage($hParent, $WM_NOTIFY, $iListView, $pBuffer)
        If (DllStructGetData($tBuffer, "AutoComplete") <> 0) Then
                Local $tTextReturn
                $iLength = DllStructGetData($tBuffer, "Length")
                $pText = DllStructGetData($tBuffer, "Text")
                $tTextReturn = DllStructCreate("wchar Text[" & $iLength & "]", $pText)
                $sText = DllStructGetData($tTextReturn, "Text")
                $tTextReturn = 0
                _GUICtrlListView_SetItemText($hListView, $i_ListViewEditItem, $sText, $i_ListViewEditSubItem)
        EndIf
        $tText = 0
        GUICtrlSetState($iListView, $GUI_FOCUS)
        GUICtrlSetState($iEditId, $GUI_HIDE)
        $f_ListViewEditMsgIsSending = 0
        Return 1
EndFunc        ;==>_GUICtrlListView_CancelEdit

Func _GUICtrlListView_SetEditAutoComplete($hListView, $fAutoComplete = 1)
        Local $iIndex = _GUICtrlListView_GetEditArrayIndex($hListView)
        If ($iIndex = 0) Then Return SetError(1, 0, 0)
        $a_ListViewEditControls[$iIndex][3] = $fAutoComplete
        Return 1
EndFunc        ;_GUICtrlListView_SetEditAutoComplete