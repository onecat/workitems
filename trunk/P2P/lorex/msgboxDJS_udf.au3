;==========================================================================================
; ˵��:���޸�MsgBox������ʽ����̬��ʾ����ʱ��ʾ���֡�
; �﷨:��MsgBoxDJS(msgbox��ʽ��־, '����', '��ʾ�ı�'[, ����ʱ��(��)[, ��̬�ؼ��ı�־[, ���]]])
; ����:��msgbox��ʽ��־��'����'��'��ʾ�ı�'����� ��ͬMsgBox���������������MsgBox()����˵����
;������������ʱʱ��(��) - [��ѡ]��λΪ�룬Ĭ��Ϊ10��
;����������̬�ؼ��ı�־ - [��ѡ] 0 = ��̬"����", 1 = ��̬"��ʾ�ı�"(Ĭ��), 2 = ��̬"��ť"��
; ע��:���ڱ������Ϣ��̬��ʾ��ʱ��Ĭ����ʾ���ַ���ǰ�棬�������������Ҫ��λ�ñ�� %s ��
; ����ֵ:(ͬMsgBox����) �ɹ� = ���ذ��°�ť�� ID�� ʧ�� = ���� -1 (��Ϣ���û�����)��
; ����:��Afan -- http://www.autoit.net.cn ����udf������ guland ��˼·��THX ~��
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