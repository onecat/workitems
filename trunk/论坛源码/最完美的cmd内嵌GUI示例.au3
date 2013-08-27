#include <GuiConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <GUIEdit.au3>
$Form1 = GUICreate("ÍêÃÀ»ØÏÔCMDÐÞ¶©°æ by lynfr8", 634, 453, 193, 115)
HotKeySet("{ENTER}", "Testt")
$Edit1 = GUICtrlCreateEdit("", 0, 0, 633, 449)
GUICtrlSetData(-1,@SystemDir & ">")
;GUICtrlSetFont(-1, 8, 400, 0, "Lucida Console")
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
GUISetState(@SW_SHOW)
Global $array,$array2,$sLastLine = _GUICtrlEdit_GetTextLen($Edit1)

While 1
    Sleep(10)
    _GUICTrlEdit_SetSel($Edit1, _GUICtrlEdit_GetTextLen($Edit1)+1, _GUICtrlEdit_GetTextLen($Edit1)+1)
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd

Func Testt ()
    Local $sCmd = StringMid(GUICtrlRead($Edit1), $sLastLine+1)
    _GUICtrlEdit_BeginUpdate($Edit1)
    recall_command($sCmd)
    _GUICtrlEdit_EndUpdate($Edit1)
    _GUICtrlEdit_AppendText($Edit1, @CRLF &@SystemDir & ">")
    Global $sLastLine = _GUICtrlEdit_GetTextLen($Edit1)-UBound($array)-UBound($array2)
EndFunc
    

Func recall_command($info)
    $cmdinfo = Run(@ComSpec & " /c " & $info,  @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD + $STDIN_CHILD)
    While 1
        $line = StdoutRead($cmdinfo)
        If @error Then Return
        If $line = "" Then ContinueLoop
		$array=StringRegExp(GUICtrlRead($Edit1),'[^\x00-\xff]',3)
		$array2=StringRegExp($line,'[^\x00-\xff]',3)
        GUICtrlSetData($Edit1, GUICtrlRead($Edit1)& @CRLF & $line);
    WEnd
EndFunc   ;==>recall_command
