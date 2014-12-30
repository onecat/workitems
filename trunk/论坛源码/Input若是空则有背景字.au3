#include <GuiConstants.au3>

Global $MARk_1     = 0
Global $DEFAULTINPUTDATA_1   = "���������������"

Global $MARK_2     = 0
Global $DEFAULTINPUTDATA_2   = "AU3���������̳"

Global $MARK_3     = 0
Global $DEFAULTINPUTDATA_3   = "http://www.autoitx.com"

Global $NONEAACTIVECOLOR    = 0x989898



$GUI = GUICreate("����������ʾ����", 280, 150)

$Input_1 = GUICtrlCreateInput($DEFAULTINPUTDATA_1, 15, 20, 250, 20)
GUICtrlSetColor(-1, $NONEAACTIVECOLOR)

$Input_2 = GUICtrlCreateInput($DEFAULTINPUTDATA_2, 15, 60, 250, 20)
GUICtrlSetColor(-1, $NONEAACTIVECOLOR)

$Input_3 = GUICtrlCreateInput($DEFAULTINPUTDATA_3, 15, 100, 250, 20)
GUICtrlSetColor(-1, $NONEAACTIVECOLOR)

$aboutButton = GUICtrlCreateButton("������̳", 100, 125, 60, 20)
$ExitButton = GUICtrlCreateButton("�˳�", 200, 125, 60, 20)
GUICtrlSetState(-1, $GUI_DEFBUTTON)

GUISetState()

ControlFocus($Gui, "", $ExitButton)


While 1
    _CheckInput($GUI, $Input_1, "���������������", $DEFAULTINPUTDATA_1, $MARK_1)
     _CheckInput($GUI, $Input_2, "AU3���������̳", $DEFAULTINPUTDATA_2, $MARK_2)
    _CheckInput($GUI, $Input_3, "http://www.autoitx.com", $DEFAULTINPUTDATA_3, $MARK_3)
    Switch GUIGetMsg()
		Case $aboutButton
	      ShellExecute("http://www.autoitx.com")
        Case $ExitButton, -3
            Exit
    EndSwitch
WEnd

Func _CheckInput($hWnd, $ID, $InputDefText, ByRef $DefaultInputData, ByRef $Mark)
    If $Mark = 0 And _IsFocused($hWnd, $ID) And $DefaultInputData = $InputDefText Then
        $Mark = 1
        GUICtrlSetData($ID, "")
        GUICtrlSetColor($ID, 0x000000)
        $DefaultInputData = ""
    ElseIf $Mark = 1 And Not _IsFocused($hWnd, $ID) And $DefaultInputData = "" And GUICtrlRead($ID) = "" Then
        $Mark = 0
        $DefaultInputData = $InputDefText
        GUICtrlSetData($ID, $DefaultInputData)
        GUICtrlSetColor($ID, $NONEAACTIVECOLOR)
    EndIf
EndFunc

Func _IsFocused($hWnd, $nCID)
    Return ControlGetHandle($hWnd, '', $nCID) = ControlGetHandle($hWnd, '', ControlGetFocus($hWnd))
EndFunc
