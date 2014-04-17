#include <GUIConstantsEx.au3>

$Form = GUICreate("5分钟倒计时", 280, 230, 195, 125)
GUISetState(@SW_SHOW)

Global $sec = 0
Global $min = 5

$Label5 = GUICtrlCreateLabel(StringFormat('%02s', $sec), 145, 50, 90, 80)
GUICtrlSetFont(-1, 72, 400, 0, "楷体_GB2312")
$Label6 = GUICtrlCreateLabel(StringFormat('%02s', $min) & ":", 30, 50, 120, 80)
GUICtrlSetFont(-1, 72, 400, 0, "楷体_GB2312")
$Button1 = GUICtrlCreateButton("开始", 50, 180, 73, 25, 0)
$Button2 = GUICtrlCreateButton("重新开始", 150, 180, 73, 25, 0)
GUISetState(@SW_SHOW)

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case - 3
                        DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $Form, "int", 500, "long", 0x00090000)
                        Exit
                Case $Button1
                        AdlibRegister("_timer", 1000)
						;MsgBox(0,"",'')
                Case $Button2
                        AdlibUnRegister()
                        $sec = 0
                        $min = 5
                        GUICtrlSetData($Label5, StringFormat('%02s', $sec))
                        GUICtrlSetData($Label6, StringFormat('%02s', $min) & ":")
        EndSwitch
WEnd

Func _timer()
        If $sec = 0 And $min = 0 then
                AdlibUnRegister()
        Else
                If $sec <= 0 Then
                        $sec = 60 + $sec
                        $min -= 1
                EndIf
                $sec -= 1
                GUICtrlSetData($Label5, StringFormat('%02s', $sec))
                GUICtrlSetData($Label6, StringFormat('%02s', $min) & ":")
        Endif
EndFunc   ;==>_timer