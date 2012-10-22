#include <GUIConstants.au3>

Global Const $tagTRACKMOUSEEVENT = "dword Size;dword Flags;hwnd hWndTrack;dword HoverTime"

; See http://msdn2.microsoft.com/en-us/library/ms645617.aspx for more info on WM_MOUSEWHEEL

Global Const $WM_LBUTTONDBLCLK = 0x203
Global Const $WM_LBUTTONDOWN = 0x201
Global Const $WM_LBUTTONUP = 0x202
Global Const $WM_MBUTTONDBLCLK = 0x209
Global Const $WM_MBUTTONDOWN = 0x207
Global Const $WM_MBUTTONUP = 0x208
;~ Global Const $WM_MOUSEACTIVATE   = 0x21
Global Const $WM_MOUSEHOVER = 0x2A1
Global Const $WM_MOUSELEAVE = 0x2A3
Global Const $WM_MOUSEMOVE = 0x200
Global Const $WM_MOUSEWHEEL = 0x020A
;~ Global Const $WM_NCHITTEST       = 0x84
;~ Global Const $WM_NCLBUTTONDBLCLK = 0xA3
;~ Global Const $WM_NCLBUTTONDOWN   = 0xA1
;~ Global Const $WM_NCLBUTTONUP     = 0xA2
;~ Global Const $WM_NCMBUTTONDBLCLK = 0xA9
;~ Global Const $WM_NCMBUTTONDOWN   = 0xA7
;~ Global Const $WM_NCMBUTTONUP     = 0xA8
Global Const $WM_NCMOUSEHOVER = 0x2A0
Global Const $WM_NCMOUSELEAVE = 0x2A2
;~ Global Const $WM_NCMOUSEMOVE     = 0xA0
;~ Global Const $WM_NCRBUTTONDBLCLK = 0xA6
;~ Global Const $WM_NCRBUTTONDOWN   = 0xA4
;~ Global Const $WM_NCRBUTTONUP     = 0xA5
Global Const $WM_NCXBUTTONDBLCLK = 0xAD
Global Const $WM_NCXBUTTONDOWN = 0xAB
Global Const $WM_NCXBUTTONUP = 0xAC
Global Const $WM_RBUTTONDBLCLK = 0x206
Global Const $WM_RBUTTONDOWN = 0x204
Global Const $WM_RBUTTONUP = 0x205
Global Const $WM_XBUTTONDBLCLK = 0x20D
Global Const $WM_XBUTTONDOWN = 0x20B
Global Const $WM_XBUTTONUP = 0x20C

Global Const $MK_CONTROL = 0x8
Global Const $MK_LBUTTON = 0x1
Global Const $MK_MBUTTON = 0x10
Global Const $MK_RBUTTON = 0x2
Global Const $MK_SHIFT = 0x4
Global Const $MK_XBUTTON1 = 0x20
Global Const $MK_XBUTTON2 = 0x40


Global Const $TME_CANCEL = 0x80000000
Global Const $TME_HOVER = 0x1
Global Const $TME_LEAVE = 0x2
Global Const $TME_NONCLIENT = 0x10
Global Const $TME_QUERY = 0x40000000

Global Const $HOVER_DEFAULT = 0xFFFFFFFF

Global $X_Prev, $Y_Prev

$hGui = GUICreate("Wheel")
$LabelId = GUICtrlCreateLabel("Try your mouse wheel", 10, 10, 150, 30)
GUISetState()

$hDLL = DllOpen("user32.dll")

If Not _TrackMouseEvent() Then Exit

GUIRegisterMsg($WM_LBUTTONDBLCLK, "WM_LBUTTONDBLCLK")
GUIRegisterMsg($WM_LBUTTONDOWN, "WM_LBUTTONDOWN")
GUIRegisterMsg($WM_LBUTTONUP, "WM_LBUTTONUP")
GUIRegisterMsg($WM_MBUTTONDBLCLK, "WM_MBUTTONDBLCLK")
GUIRegisterMsg($WM_MBUTTONDOWN, "WM_MBUTTONDOWN")
GUIRegisterMsg($WM_MBUTTONUP, "WM_MBUTTONUP")
GUIRegisterMsg($WM_MOUSEWHEEL, "WM_MOUSEWHEEL")
GUIRegisterMsg($WM_MOUSEHOVER, "WM_MOUSEHOVER")
GUIRegisterMsg($WM_MOUSEMOVE, "WM_MOUSEMOVE")
GUIRegisterMsg($WM_RBUTTONDBLCLK, "WM_RBUTTONDBLCLK")
GUIRegisterMsg($WM_RBUTTONDOWN, "WM_RBUTTONDOWN")
GUIRegisterMsg($WM_RBUTTONUP, "WM_RBUTTONUP")
GUIRegisterMsg($WM_XBUTTONDBLCLK, "WM_XBUTTONDBLCLK")
GUIRegisterMsg($WM_XBUTTONDOWN, "WM_XBUTTONDOWN")
GUIRegisterMsg($WM_XBUTTONUP, "WM_XBUTTONUP")

While 1
    $MsgId = GUIGetMsg()
    If $MsgId = $GUI_EVENT_CLOSE Then
        Exit
    EndIf
WEnd
DllClose($hDLL)

Func WM_LBUTTONDBLCLK($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Left Button Double Click: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_LBUTTONDBLCLK

Func WM_LBUTTONDOWN($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Left Button Down: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_LBUTTONDOWN

Func WM_LBUTTONUP($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Left Button Up: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_LBUTTONUP

Func WM_MBUTTONDBLCLK($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Middle Button Double Click: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_MBUTTONDBLCLK

Func WM_MBUTTONDOWN($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Middle Button Down: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_MBUTTONDOWN

Func WM_MBUTTONUP($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Middle Button Up: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_MBUTTONUP

Func WM_MOUSEWHEEL($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Wheel Delta: " & BitShift($WParam, 16) & @LF & "KeysHeld: " & _KeysHeld(BitAND($WParam, 0xFFFF)) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_MOUSEWHEEL

Func WM_MOUSEHOVER($hWndGui, $MsgId, $WParam, $LParam)
    
    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    $X_Prev = $X
    $Y_Prev = $Y
    ToolTip("Hover Delta: " & BitShift($WParam, 16) & @LF & "KeysHeld: " & _KeysHeld(BitAND($WParam, 0xFFFF)) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    If Not _TrackMouseEvent() Then Exit
    Return 0
EndFunc   ;==>WM_MOUSEHOVER

Func WM_MOUSEMOVE($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    If $X <> $X_Prev Or $Y <> $Y_Prev Then
        $X_Prev = $X
        $Y_Prev = $Y
        ToolTip("Move Delta: " & BitShift($WParam, 16) & @LF & "KeysHeld: " & _KeysHeld(BitAND($WParam, 0xFFFF)) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    EndIf
    If Not _TrackMouseEvent() Then Exit
    Return 0
EndFunc   ;==>WM_MOUSEMOVE

Func WM_RBUTTONDBLCLK($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Right Button Double Click: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_RBUTTONDBLCLK

Func WM_RBUTTONDOWN($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Right Button Down: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_RBUTTONDOWN

Func WM_RBUTTONUP($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("Right Button Up: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_RBUTTONUP

Func WM_XBUTTONDBLCLK($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("X Button Double Click: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_XBUTTONDBLCLK

Func WM_XBUTTONDOWN($hWndGui, $MsgId, $WParam, $LParam)

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("X Button Down: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_XBUTTONDOWN

Func WM_XBUTTONUP($hWndGui, $MsgId, $WParam, $LParam)
    Local $sKeyHeld

    $X = BitShift($LParam, 16)
    $Y = BitAND($LParam, 0xFFFF)
    ToolTip("X Button Up: " & @LF & "KeysHeld: " & _KeysHeld($WParam) & @LF & "X: " & $X & @LF & "Y: " & $Y, Default, Default, "Mouse", 1, 1)
    Return 0
EndFunc   ;==>WM_XBUTTONUP

Func _TrackMouseEvent()
    Local $pMouseEvent, $iResult, $iMouseEvent
    Local $tMouseEvent = DllStructCreate($tagTRACKMOUSEEVENT)
    
    $iMouseEvent = DllStructGetSize($tMouseEvent)
    DllStructSetData($tMouseEvent, "Flags", $TME_HOVER)
    DllStructSetData($tMouseEvent, "hWndTrack", $hGui)
    DllStructSetData($tMouseEvent, "HoverTime", $HOVER_DEFAULT) ; 400 milliseconds
    DllStructSetData($tMouseEvent, "Size", $iMouseEvent)
    $ptrMouseEvent = DllStructGetPtr($tMouseEvent)
    $iResult = DllCall($hDLL, "int", "TrackMouseEvent", "ptr", $ptrMouseEvent)
    Return $iResult[0] <> 0
EndFunc   ;==>_TrackMouseEvent

Func _KeysHeld($iKeys)
    Local $sKeyHeld
    If BitAND($iKeys, $MK_CONTROL) Then $sKeyHeld &= 'The CTRL key is down' & @LF
    If BitAND($iKeys, $MK_LBUTTON) Then $sKeyHeld &= 'The left mouse button is down' & @LF
    If BitAND($iKeys, $MK_MBUTTON) Then $sKeyHeld &= 'The middle mouse button is down' & @LF
    If BitAND($iKeys, $MK_RBUTTON) Then $sKeyHeld &= 'The right mouse button is down' & @LF
    If BitAND($iKeys, $MK_SHIFT) Then $sKeyHeld &= 'The SHIFT key is down' & @LF
    If BitAND($iKeys, $MK_XBUTTON1) Then $sKeyHeld &= 'Windows 2000/XP: The first X button is down' & @LF
    If BitAND($iKeys, $MK_XBUTTON2) Then $sKeyHeld &= 'Windows 2000/XP: The second X button is down' & @LF
    Return $sKeyHeld
EndFunc   ;==>_KeysHeld