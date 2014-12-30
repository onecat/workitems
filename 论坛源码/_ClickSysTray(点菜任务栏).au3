#Include <GuiToolBar.au3>
#include <SendMessage.au3>
#include <GuiMenu.au3>



Global $hSysTray_Hide_Handle
Global $iSystrayHide_ButtonNumber
Global $hSysTray_Handle

;ClickSysTrayIcon("QQ","Right")
;----------------------------------------------------------------------------------------------------------------------------------------
;Function Name	:	ClickSysTrayIcon
;Description	:	ClickSysTray Icon , Such as QQ,and other icon at systray area.
;Syntax			:	ClickSysTrayIcon($sToolTipTitle,$Button)
;Parameter(s)									$sToolTipTitle ----- "Icon tool tips"
;													$Button ----- "Right" or "Left" , means : Right click or left click
;Author(s)		:	GDDL PA SW Automation		(Chris Hong)

;----------------------------------------------------------------------------------------------------------------------------------------

Func _ClickSysTrayIcon($sToolTipTitle,$Button)			; ClickSysTrayIcon("SysTrayIcon's tool tips, Click Button")

	$iSystray_ButtonNumber = Get_Systray_Index($sToolTipTitle)
	;the SysTray is Hidden : condition 1 : not exist the Viem Management in the SysTray         condition 2: exist the Class:Shell_TrayWnd
	If ControlCommand("[class:Shell_TrayWnd]","","Button1","IsVisible","") And $iSystray_ButtonNumber = -1  Then
		ClickHideIcon($sToolTipTitle,$Button)
	Else
		ClickDisplayIcon($sToolTipTitle,$Button)
	EndIf

EndFunc


Func ClickDisplayIcon($sToolTipTitle,$Button)

	$iSystray_ButtonNumber = Get_Systray_Index($sToolTipTitle)
	If $iSystray_ButtonNumber = -1 Then
		MsgBox(16, "Error", "Icon not found in system tray")
		Exit
	Else
		Sleep(500)
		_GUICtrlToolbar_ClickButton($hSysTray_Handle, $iSystray_ButtonNumber, $Button, True, 1, 20)
	EndIf
EndFunc


Func ClickHideIcon($sToolTipTitle,$Button)
	$hSysTray_Hide_Handle1 = ControlGetHandle('[Class:Shell_TrayWnd]', '', '[Class:Button;Instance:1]')
	_GUICtrlToolbar_ClickButton($hSysTray_Hide_Handle1, "Button1", "Left", True, 1, 20)      ; Display the Icon
	Sleep(500)
	$iSystray_ButtonNumber = Get_Hide_Systray_Index($sToolTipTitle)

	If $iSystray_ButtonNumber = -1 Then
		MsgBox(16, "Error", "Icon not found in system tray")
		Exit
	Else
		Sleep(500)
		_GUICtrlToolbar_ClickButton($hSysTray_Hide_Handle, $iSystray_ButtonNumber, $Button, True, 1, 20)	;Click the Icon
	EndIf

	$iSystray_ButtonNumber = Get_Hide_Systray_Index($sToolTipTitle)
EndFunc



Func Get_Hide_Systray_Index($sToolTipTitle)

    ; Find systray handle
    $hSysTray_Hide_Handle = ControlGetHandle('[Class:NotifyIconOverflowWindow]', '', '[Class:ToolbarWindow32;Instance:1]')
    If @error Then
        MsgBox(16, "Error", "System tray not found")
        Exit
    EndIf

    ; Get systray item count
    Local $iSystray_ButCount = _GUICtrlToolbar_ButtonCount($hSysTray_Hide_Handle)

    If $iSystray_ButCount = 0 Then
        MsgBox(16, "Error", "No items found in system tray")
        Exit
    EndIf

    ; Look for wanted tooltip
    For $iSystray_ButtonNumber = 0 To $iSystray_ButCount - 1
		;ConsoleWrite( _GUICtrlToolbar_GetButtonText($hSysTray_Hide_Handle, $iSystray_ButtonNumber) & @CRLF )
        If StringInStr(_GUICtrlToolbar_GetButtonText($hSysTray_Hide_Handle, $iSystray_ButtonNumber),$sToolTipTitle)  Then ExitLoop
	Next

    If $iSystray_ButtonNumber = $iSystray_ButCount Then
        Return -1 ; Not found
    Else
        Return $iSystray_ButtonNumber  ; Found
    EndIf

EndFunc



Func Get_Systray_Index($sToolTipTitle)

    ; Find systray handle
    $hSysTray_Handle = ControlGetHandle('[Class:Shell_TrayWnd]', '', '[Class:ToolbarWindow32;Instance:1]')
    If @error Then
        MsgBox(16, "Error", "System tray not found")
        Exit
    EndIf

    ; Get systray item count
    Local $iSystray_ButCount = _GUICtrlToolbar_ButtonCount($hSysTray_Handle)
    If $iSystray_ButCount = 0 Then
        MsgBox(16, "Error", "No items found in system tray")
        Exit
    EndIf

    ; Look for wanted tooltip
    For $iSystray_ButtonNumber = 0 To $iSystray_ButCount - 1
		;ConsoleWrite( _GUICtrlToolbar_GetButtonText($hSysTray_Hide_Handle, $iSystray_ButtonNumber) & @CRLF)
        If StringInStr(_GUICtrlToolbar_GetButtonText($hSysTray_Handle, $iSystray_ButtonNumber), $sToolTipTitle) = 1 Then ExitLoop
    Next

    If $iSystray_ButtonNumber = $iSystray_ButCount Then
        Return  -1; Not found
    Else
        Return $iSystray_ButtonNumber ; Found
    EndIf

EndFunc