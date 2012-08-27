#include <GUIConstantsEx.au3>
#include <WinAPIEx.au3>
#include <GuiEdit.au3>
OnAutoItExitRegister("ExitFunc")
 
Global $hover = False
 
$hGui = GUICreate("Input×Ô»æ", 300, 200)
 
GUICtrlCreateInput("ÇëÊäÈëÕËºÅ", 10, 10, 200)
$hInput = GUICtrlGetHandle(-1)
 
GUICtrlCreateInput("text", 10, 50, 200)
$hInput2 = GUICtrlGetHandle(-1)
 
Global $hCallback = DllCallbackRegister("My_InputProc", "int", "hWnd;uint;wparam;lparam")
Global $tCallback = DllCallbackGetPtr($hCallback)
Global $CallProc = _WinAPI_SetWindowLong($hInput, -4, $tCallback)
_WinAPI_SetWindowLong($hInput2, -4, $tCallback)
 
GUIRegisterMsg(0x0111, "WM_COMMAND")
GUISetState()
 
While 1
        $GUIMsg = GUIGetMsg()
        Switch $GUIMsg
                Case -3
                        ExitLoop
        EndSwitch
WEnd
 
 
Func ExitFunc()
        _WinAPI_SetWindowLong($hInput, -4, $CallProc)
        _WinAPI_SetWindowLong($hInput2, -4, $CallProc)
EndFunc   ;==>ExitFunc
 
 
Func My_InputProc($hWnd, $Msg, $wParam, $lParam)
        Switch $Msg
                Case 0x0084;WM_NCHITTEST
                        $hover = $hWnd
                Case 0x02A3;WM_MOUSELEAVE
                        $hover = False
                        Local $tRect = _WinAPI_GetWindowRect($hWnd)
                        Local $Width = DllStructGetData($tRect, 3) - DllStructGetData($tRect, 1)
                        Local $Height = DllStructGetData($tRect, 4) - DllStructGetData($tRect, 2)
                        _WinAPI_ScreenToClient($hGui, $tRect)
                        DllStructSetData($tRect, 3, $Width + DllStructGetData($tRect, 1))
                        DllStructSetData($tRect, 4, $Height + DllStructGetData($tRect, 2))
                        _WinAPI_InflateRect($tRect, 1, 1)
                        _WinAPI_InvalidateRect($hGui, $tRect)
                Case 0x0085;WM_NCPAINT
                        _DrawEditFrame($hWnd)
                        Return 0
        EndSwitch
        Return _WinAPI_CallWindowProc($CallProc, $hWnd, $Msg, $wParam, $lParam)
EndFunc   ;==>My_InputProc
 
Func _DrawEditFrame($hWnd)
        Local $tRect = _WinAPI_GetWindowRect($hWnd)
        Local $Width = DllStructGetData($tRect, 3) - DllStructGetData($tRect, 1)
        Local $Height = DllStructGetData($tRect, 4) - DllStructGetData($tRect, 2)
        _WinAPI_ScreenToClient($hGui, $tRect)
        DllStructSetData($tRect, 3, $Width + DllStructGetData($tRect, 1))
        DllStructSetData($tRect, 4, $Height + DllStructGetData($tRect, 2))
        $hDC = _WinAPI_GetDC($hGui)
        $hBrush = _WinAPI_CreateSolidBrush(0xC08B33)
        _WinAPI_FrameRect($hDC, DllStructGetPtr($tRect), $hBrush)
        _WinAPI_DeleteObject($hBrush)
        If $hover = $hWnd Then
                $hBrush = _WinAPI_CreateSolidBrush(0xFDC860) ;0xC08B33ÉîÀ¶£¬0xFDC860µ­À¶
                _WinAPI_InflateRect($tRect, 1, 1)
                _WinAPI_FrameRect($hDC, DllStructGetPtr($tRect), $hBrush)
                _WinAPI_DeleteObject($hBrush)
        EndIf
        _WinAPI_ReleaseDC($hGui, $hDC)
EndFunc   ;==>_DrawEditFrame
 
Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
        #forceref $hWnd, $iMsg
        Local $hWndFrom, $iIDFrom, $iCode, $hWndEdit
        $hWndFrom = $ilParam
        $iIDFrom = _WinAPI_LoWord($iwParam)
        $iCode = _WinAPI_HiWord($iwParam)
        Switch $hWndFrom
                Case $hInput, $hInput2
                        Switch $iCode
                                Case $EN_ALIGN_LTR_EC ; Sent when the user has changed the edit control direction to left-to-right
                                        
                                Case $EN_ALIGN_RTL_EC ; Sent when the user has changed the edit control direction to right-to-left
                                        
                                Case $EN_CHANGE ; Sent when the user has taken an action that may have altered text in an edit control
                                        GUICtrlSetColor($iIDFrom, 0x000000)
                                Case $EN_ERRSPACE ; Sent when an edit control cannot allocate enough memory to meet a specific request
                                        
                                Case $EN_HSCROLL ; Sent when the user clicks an edit control's horizontal scroll bar
                                        
                                Case $EN_KILLFOCUS ; Sent when an edit control loses the keyboard focus
                                        GUICtrlSetColor($iIDFrom, 0x989898)
                                Case $EN_MAXTEXT ; Sent when the current text insertion has exceeded the specified number of characters for the edit control
                                        
                                Case $EN_SETFOCUS ; Sent when an edit control receives the keyboard focus
                                        GUICtrlSetColor($iIDFrom, 0x000000)
                                Case $EN_UPDATE ; Sent when an edit control is about to redraw itself
                                        
                                Case $EN_VSCROLL ; Sent when the user clicks an edit control's vertical scroll bar or when the user scrolls the mouse wheel over the edit control
                                        
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
