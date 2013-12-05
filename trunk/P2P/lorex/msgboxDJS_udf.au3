;==========================================================================================
; 说明:　修改MsgBox窗口样式，动态显示倒计时提示文字。
; 语法:　MsgBoxDJS(msgbox样式标志, '标题', '提示文本'[, 倒计时长(秒)[, 动态控件的标志[, 句柄]]])
; 参数:　msgbox样式标志、'标题'、'提示文本'、句柄 均同MsgBox函数，详情请参阅MsgBox()函数说明。
;　　　　倒计时时长(秒) - [可选]单位为秒，默认为10。
;　　　　动态控件的标志 - [可选] 0 = 动态"标题", 1 = 动态"提示文本"(默认), 2 = 动态"按钮"。
; 注意:　在标题或消息框动态显示的时间默认显示在字符串前面，如需调整可在需要的位置标记 %s 。
; 返回值:(同MsgBox函数) 成功 = 返回按下按钮的 ID。 失败 = 返回 -1 (消息框被用户忽略)。
; 作者:　Afan -- http://www.autoit.net.cn （本udf借用了 guland 的思路，THX ~）
;=====================================================================================start
Func MsgBoxDJS($flag, $title, $text, $timeout = 10, $Cflag = 1, $hwnd = '')
	Global $Timer = DllCallbackRegister('Timer', 'int', 'hwnd;uint;uint;dword')
	If $timeout = '' Or $timeout = -1 Then $timeout = 10
	Global $_title = $title, $_text = $text, $_Cflag = $Cflag, $_ibj = 1, $_ttc = $timeout, $bttxtbj = 0
	Global $TimerDLL = DllCall('user32.dll', 'uint', 'SetTimer', 'hwnd', 0, 'uint', 0, 'int', 1000, 'ptr', DllCallbackGetPtr($Timer))
	Local $Mkmsg
	If $Cflag = 0 Then
		If StringRegExp($title, '%s') = 0 Then
			$title = '%s' & $title
			$_title = $title
		EndIf
		$title = StringRegExpReplace($title, "%s", StringFormat('%03s', $_ttc), 1)
	EndIf
	If $Cflag = 1 Then
		If StringRegExp($text, '%s') = 0 Then
			$text = '%s' & $text
			$_text = $text
		EndIf
		$text = StringRegExpReplace($text, "%s", StringFormat('%03s', $_ttc), 1)
	EndIf
	$Mkmsg = MsgBox($flag, $title, $text)
	DllClose($TimerDLL)
	DllCallbackFree($Timer)
	Return $Mkmsg
EndFunc   ;==>MsgBoxDJS
Func Timer($hwnd, $uiMsg, $idEvent, $dwTime)
	Global $TimerDLL, $bttxtbj, $_Cflag, $_title, $_ttc, $_text, $_ibj, $Timer
	If $idEvent = $TimerDLL[0] Then
		Global $bttxt, $CtrlF, $Static
		If $bttxtbj = 0 Then
			If $_Cflag = 0 Then $CtrlF = ControlGetFocus(StringRegExpReplace($_title, "%s", StringFormat('%03s', $_ttc), 1))
			If $_Cflag = 1 Or $_Cflag = 2 Then $CtrlF = ControlGetFocus($_title)
			$bttxt = ControlGetText($_title, $_text, $CtrlF)
			If $_Cflag = 1 Then
				$Static = 'Static1'
				ControlGetText($_title, StringRegExpReplace($_text, "%s", StringFormat('%03s', $_ttc), 1), 'Static1')
				If @error Then $Static = 'Static2'
			EndIf
			$bttxtbj = 1
		EndIf
		If $_Cflag = 0 Then
			$_title1 = StringRegExpReplace($_title, "%s", StringFormat('%03s', $_ttc - $_ibj + 1), 1)
			$_title2 = StringRegExpReplace($_title, "%s", StringFormat('%03s', $_ttc - $_ibj), 1)
			WinSetTitle($_title1, $_text, $_title2)
		ElseIf $_Cflag = 1 Then
			$_text1 = StringRegExpReplace($_text, "%s", StringFormat('%03s', $_ttc - $_ibj + 1), 1)
			$_text2 = StringRegExpReplace($_text, "%s", StringFormat('%03s', $_ttc - $_ibj), 1)
			ControlSetText($_title, $_text1, $Static, $_text2)
		ElseIf $_Cflag = 2 Then
			ControlSetText($_title, $_text, $CtrlF, $bttxt & StringFormat(' %03s', $_ttc - $_ibj))
		EndIf
		If $_ibj = $_ttc Then
			If $_Cflag = 0 Then $_title = $_title2
			If $_Cflag = 1 Then $_text = $_text2
			DllClose($TimerDLL)
			DllCallbackFree($Timer)
			ControlClick($_title, $_text, $CtrlF, '', 2)
		EndIf
		$_ibj += 1
	EndIf
EndFunc   ;==>Timer
;=========================================================================================end