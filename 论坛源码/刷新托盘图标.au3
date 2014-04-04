_RefreshSystemTray()
;=========# _RefreshSystemTray #=====================================================

;Function Name:    _RefreshSystemTray()

;Description:      Removes any dead icons from the notification area.

;Parameters:       $nDealy - IN/OPTIONAL - The delay to wait for the notification area to expand with Windows XP's "Hide Inactive Icons" feature (In milliseconds).

;Return Value(s):  Success - Returns 1

;                  Failure - Returns 0 and sets @error to:

;                        1 - Tray couldn't be found.

;                        2 - DllCall error.

;Autor(s):         Valik

;====================================================================================

Func _RefreshSystemTray($nDelay = 1000)
        Local $hWnd, $hControl, $posStart, $posWin, $posX, $posY, $error = 0
        ; Save Opt settings
        Local $oldChildMode = Opt("WinSearchChildren", 1)
        Local $oldMatchMode = Opt("WinTitleMatchMode", 4)
        Do   ; Pseudo loop
                $hWnd = WinGetHandle("[CLASS:Shell_TrayWnd]")
                If @error Then
                        $error = 1
                        ExitLoop
                EndIf
					$hControl = ControlGetHandle($hWnd, "", "Button2")
                ; We're on XP and the Hide Inactive Icons button is there, so expand it
                If $hControl <> "" AND ControlCommand($hWnd, "", $hControl, "IsVisible") Then
                        ControlClick($hWnd, "", $hControl)
                        Sleep($nDelay)
                EndIf
                $posStart = MouseGetPos()
                $posWin = WinGetPos($hWnd)
                $posY = $posWin[1]
                While $posY < $posWin[1] + $posWin[3]
                        $posX = $posWin[0]
                        While $posX < $posWin[0] + $posWin[2]
                                DllCall("user32.dll", "int", "SetCursorPos", "int", $posX, "int", $posY)
                                If @error Then
                                        $error = 2
                                        ExitLoop 3   ; Jump out of While/While/Do
                                EndIf
                                $posX += 8
                        WEnd
                        $posY += 8
                WEnd
                DllCall("user32.dll", "int", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
                ; We're on XP so we need to hide the inactive icons again.
                If $hControl <> "" AND ControlCommand($hWnd, "", $hControl, "IsVisible") Then
                        ControlClick($hWnd, "", $hControl)
                EndIf
        Until 1
        ; Restore Opt settings
        Opt("WinSearchChildren", $oldChildMode)
        Opt("WinTitleMatchMode", $oldMatchMode)
        If $error Then
                Return SetError($error, 0, 0)
        Else
                Return 1
        EndIf
EndFunc   ;==>_RefreshSystemTray