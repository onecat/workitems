#NoTrayIcon
#include <WinHttp_GetRespond.au3>
#include <array.au3>

#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>
Local $ps = 0
#region ### START Koda GUI section ### Form=
Opt("GUIOnEventMode", 1)
$Form1 = GUICreate("众鸟高飞尽，孤云独去闲。By 那袜子 （回车查询）  http://www.gusc365.com", 934, 436, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "_quit")
$input1 = GUICtrlCreateInput("", 8, 80, 441, 21)
$input2 = GUICtrlCreateInput("", 472, 80, 441, 21)
$Combo1 = GUICtrlCreateCombo("", 8, 24, 57, 25)
$Combo2 = GUICtrlCreateCombo("", 72, 24, 57, 25)
$Combo3 = GUICtrlCreateCombo("", 136, 24, 57, 25)
$Combo4 = GUICtrlCreateCombo("", 200, 24, 57, 25)
$Combo5 = GUICtrlCreateCombo("", 264, 24, 57, 25)
$Combo6 = GUICtrlCreateCombo("", 328, 24, 57, 25)
$Combo7 = GUICtrlCreateCombo("", 392, 24, 57, 25)
$Combo8 = GUICtrlCreateCombo("", 472, 24, 57, 25)
$Combo9 = GUICtrlCreateCombo("", 536, 24, 57, 25)
$Combo10 = GUICtrlCreateCombo("", 600, 24, 57, 25)
$Combo11 = GUICtrlCreateCombo("", 664, 24, 57, 25)
$Combo12 = GUICtrlCreateCombo("", 728, 24, 57, 25)
$Combo13 = GUICtrlCreateCombo("", 792, 24, 57, 25)
$Combo14 = GUICtrlCreateCombo("", 856, 24, 57, 25)
$Input3 = GUICtrlCreateInput("", 8, 184, 441, 21)
$Input4 = GUICtrlCreateInput("", 472, 184, 441, 21)
$Combo15 = GUICtrlCreateCombo("", 8, 128, 57, 25)
$Combo16 = GUICtrlCreateCombo("", 72, 128, 57, 25)
$Combo17 = GUICtrlCreateCombo("", 136, 128, 57, 25)
$Combo18 = GUICtrlCreateCombo("", 200, 128, 57, 25)
$Combo19 = GUICtrlCreateCombo("", 264, 128, 57, 25)
$Combo20 = GUICtrlCreateCombo("", 328, 128, 57, 25)
$Combo21 = GUICtrlCreateCombo("", 392, 128, 57, 25)
$Combo22 = GUICtrlCreateCombo("", 472, 128, 57, 25)
$Combo23 = GUICtrlCreateCombo("", 536, 128, 57, 25)
$Combo24 = GUICtrlCreateCombo("", 600, 128, 57, 25)
$Combo25 = GUICtrlCreateCombo("", 664, 128, 57, 25)
$Combo26 = GUICtrlCreateCombo("", 728, 128, 57, 25)
$Combo27 = GUICtrlCreateCombo("", 792, 128, 57, 25)
$Combo28 = GUICtrlCreateCombo("", 856, 128, 57, 25)
$Input5 = GUICtrlCreateInput("", 8, 280, 441, 21)
$Input6 = GUICtrlCreateInput("", 472, 280, 441, 21)
$Combo29 = GUICtrlCreateCombo("", 8, 224, 57, 25)
$Combo30 = GUICtrlCreateCombo("", 72, 224, 57, 25)
$Combo31 = GUICtrlCreateCombo("", 136, 224, 57, 25)
$Combo32 = GUICtrlCreateCombo("", 200, 224, 57, 25)
$Combo33 = GUICtrlCreateCombo("", 264, 224, 57, 25)
$Combo34 = GUICtrlCreateCombo("", 328, 224, 57, 25)
$Combo35 = GUICtrlCreateCombo("", 392, 224, 57, 25)
$Combo36 = GUICtrlCreateCombo("", 472, 224, 57, 25)
$Combo37 = GUICtrlCreateCombo("", 536, 224, 57, 25)
$Combo38 = GUICtrlCreateCombo("", 600, 224, 57, 25)
$Combo39 = GUICtrlCreateCombo("", 664, 224, 57, 25)
$Combo40 = GUICtrlCreateCombo("", 728, 224, 57, 25)
$Combo41 = GUICtrlCreateCombo("", 792, 224, 57, 25)
$Combo42 = GUICtrlCreateCombo("", 856, 224, 57, 25)
$Input7 = GUICtrlCreateInput("", 8, 376, 441, 21)
$Input8 = GUICtrlCreateInput("", 472, 376, 441, 21)
$Combo43 = GUICtrlCreateCombo("", 8, 320, 57, 25)
$Combo44 = GUICtrlCreateCombo("", 72, 320, 57, 25)
$Combo45 = GUICtrlCreateCombo("", 136, 320, 57, 25)
$Combo46 = GUICtrlCreateCombo("", 200, 320, 57, 25)
$Combo47 = GUICtrlCreateCombo("", 264, 320, 57, 25)
$Combo48 = GUICtrlCreateCombo("", 328, 320, 57, 25)
$Combo49 = GUICtrlCreateCombo("", 392, 320, 57, 25)
$Combo50 = GUICtrlCreateCombo("", 472, 320, 57, 25)
$Combo51 = GUICtrlCreateCombo("", 536, 320, 57, 25)
$Combo52 = GUICtrlCreateCombo("", 600, 320, 57, 25)
$Combo53 = GUICtrlCreateCombo("", 664, 320, 57, 25)
$Combo54 = GUICtrlCreateCombo("", 728, 320, 57, 25)
$Combo55 = GUICtrlCreateCombo("", 792, 320, 57, 25)
$Combo56 = GUICtrlCreateCombo("", 856, 320, 57, 25)
$Button1 = GUICtrlCreateButton("query", 160, 90, 40, 20)
GUICtrlSetOnEvent(-1, "_query")
GUICtrlSetCursor(-1, 0)
GUICtrlSetState(-1, $GUI_HIDE)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
Dim $AccelKeys[1][2] = [["{Enter}", $Button1]]
GUISetAccelerators($AccelKeys)
GUISetState(@SW_SHOW)
Local $hCombo[56] = [$Combo1, $Combo2, $Combo3, $Combo4, $Combo5, $Combo6, $Combo7, $Combo8, $Combo9, $Combo10, _
		$Combo11, $Combo12, $Combo13, $Combo14, $Combo15, $Combo16, $Combo17, $Combo18, $Combo19, $Combo20, _
		$Combo21, $Combo22, $Combo23, $Combo24, $Combo25, $Combo26, $Combo27, $Combo28, $Combo29, $Combo30, _
		$Combo31, $Combo32, $Combo33, $Combo34, $Combo35, $Combo36, $Combo37, $Combo38, $Combo39, $Combo40, _
		$Combo41, $Combo42, $Combo43, $Combo44, $Combo45, $Combo46, $Combo47, $Combo48, $Combo49, $Combo50, _
		$Combo51, $Combo52, $Combo53, $Combo54, $Combo55, $Combo56]
#endregion ### END Koda GUI section ###


While 1
	Sleep(1)
	While $ps = 1
		For $i = 0 To 55
			GUICtrlSetData($hCombo[$i], '')
		Next
		_get_str(GUICtrlRead($input1), 0)
		_get_str(GUICtrlRead($input2), 7)
		_get_str(GUICtrlRead($Input3), 14)
		_get_str(GUICtrlRead($Input4), 21)
		_get_str(GUICtrlRead($Input5), 28)
		_get_str(GUICtrlRead($Input6), 35)
		_get_str(GUICtrlRead($Input7), 42)
		_get_str(GUICtrlRead($Input8), 49)
		_query()
	WEnd
WEnd

Func _query()
	If $ps = 0 Then
		$ps = 1
	Else
		$ps = 0
	EndIf
EndFunc   ;==>_query

Func _get_str($str, $x = 0)
	$ss = StringSplit($str, '', 2)
	For $i = 0 To UBound($ss) - 1
		If $ps=0 Then ExitLoop
		$yin = _Get_yin($ss[$i])
		If $yin = -2 Then
			If $i = 0 Then
				$i = 0
			Else
				$i -= 1
			EndIf
		Else
			For $l = 0 To UBound($yin) - 1
				GUICtrlSetData($hCombo[$x + $i], $yin[$l] & "|", $yin[0])
			Next
		EndIf
	Next
EndFunc   ;==>_get_str

Func _Get_yin($str)
	$MyOpen = _WinHttpOpen()
	$url = 'http://dict.baidu.com/s?wd=' & $str
	$rContext = _WinHTTP_GetRespond($MyOpen, $url, 2 + 4)
	If @error Then Return -2
	_WinHttpCloseHandle($MyOpen)
	$tmp = StringRegExp($rContext[0], '(?is)<b>\[(.*?)\]</b>', 3)
	;_ArrayDisplay($tmp)
	If @error Then Return -2
	Return $tmp
	;_Get_sheng($rContext[0])
EndFunc   ;==>_Get_yin

Func _Get_sheng($str)
	$tmp = StringRegExp($str, '(?is)<a.*?/\w+(\d)\.mp3">', 3)
	_ArrayDisplay($tmp)
EndFunc   ;==>_Get_sheng

Func _quit()
	Exit
EndFunc   ;==>_quit
