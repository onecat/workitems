#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\Windows\System32\shell32.dll
#AutoIt3Wrapper_outfile=����.exe
#AutoIt3Wrapper_Res_Comment=ģ��ϵͳ�Դ��ġ����С�
#AutoIt3Wrapper_Res_Description=ģ��ϵͳ�Դ��ġ����С�
#AutoIt3Wrapper_Res_Fileversion=1.0.0.3
#AutoIt3Wrapper_Res_LegalCopyright=Lixiaolong
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiComboBoxEx.au3>
#include <file.au3>
#include <GUIListBox.au3>

GetUrl();��ȡURL��ʷ
$Titol = " ģ��ϵͳ�Դ�������"

HotKeySet("!b", "liulan"); �������ť.

If @OSVersion = 'WIN_XP' Or @OSVersion = 'WIN_VISTA' Or @OSVersion = 'WIN_7' Then
Else
	Exit
EndIf

If @OSVersion = 'WIN_XP' Then; ����λ��.
	$hGUI = GUICreate($Titol, 411, 252, 8, 343, 0x00080000, 0x00000018)
Else
	$hGUI = GUICreate($Titol, 411, 252, 8, 473, 0x00080000, 0x00000018)
EndIf

GUISetBkColor(0xffffff)
GUISetFont(9, 400, '', '΢���ź�')
GUICtrlCreateIcon("shell32.dll", -77, 12, 23, 32, 32)
GUICtrlCreateLabel("Windows ������������������ƣ�Ϊ������Ӧ�ĳ����ļ��С��ĵ��� Internet ��Դ��", _
		63, 23, 319, 47)
GUICtrlCreateLabel("��(&O):", 12, 83, 47, 21)
$file = GUICtrlCreateCombo("", 63, 79, 320)
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
GUICtrlSetState($file, $GUI_DROPACCEPTED)
GUICtrlCreateIcon("user32.dll", -7, 63, 111, 16, 16)
GUICtrlCreateLabel("ʹ�ù���Ȩ�޴���������", 88, 113, 333, 23)
$btn = GUICtrlCreateButton("ȷ��", 109, 174, 88, 30, 0x0001)
GUICtrlSetState(-1, $GUI_DISABLE)
$btn2 = GUICtrlCreateButton("ȡ��", 203, 174, 88, 30)
$btn3 = GUICtrlCreateButton("���(&B)...", 298, 174, 88, 30)
GUISetState()
$Timer = DllCallbackRegister("_WinCenter", "int", "hwnd;uint;uint;dword")
$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 10, "ptr", DllCallbackGetPtr($Timer))

AdlibRegister("check", 100); ��������״̬.
AdlibRegister("ListBoxCheck", 100)
GUICtrlSetData($file, RegRead("HKEY_CURRENT_USER\Software\����", "key")); �޸Ŀؼ����ݣ�������ʷ��.

$hListGUI = GUICreate("Internet Explorer", 292, 316, 78, 232, 0x80000000, 0x0000008C, $hGUI)
$hListBox = _GUICtrlListBox_Create($hListGUI, "", 0, 0, 292, 338, BitOR($LBS_SORT, $LBS_DISABLENOSCROLL, $WS_VSCROLL))
ControlClick($Titol, '', 'Edit1')

$msg = 0
While $msg <> $GUI_EVENT_CLOSE
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_DROPPED
			GUICtrlSetData($file, @GUI_DragFile, @GUI_DragFile)
		Case $msg = $btn
			$error = yunxing(StringStripWS(GUICtrlRead($file), 3))
			If Not $error Then Exit
		Case $msg = $btn2
			ExitLoop
		Case $msg = $btn3
			$var = FileOpenDialog('���', @UserProfileDir & "\", "���� (*.exe;*.pif;*.com;*.bat;*.cmd)")
			If $var Then GUICtrlSetData($file, $var, $var)
		Case $msg = $GUI_EVENT_PRIMARYDOWN
			$a = GUIGetCursorInfo($hGUI)
			If $a[0] < 60 Or $a[0] > 361 Or $a[1] > 103 Then
				WinSetState('Internet Explorer', '', @SW_HIDE)
			EndIf
	EndSelect
WEnd

Func liulan(); �������ť.
	ControlClick($Titol, "", "Button3")
EndFunc   ;==>liulan

Func check(); ��������״̬.
	If GUICtrlRead($file) <> '' Then
		GUICtrlSetState($btn, $GUI_ENABLE); Button1 ����.
	Else
		GUICtrlSetState($btn, $GUI_DISABLE); Button1 ������.
	EndIf
EndFunc   ;==>check

Func ListBoxCheck(); listbox ����ѡ��.
	$aPos = GUIGetCursorInfo($hListGUI)
	$x = _GUICtrlListBox_GetCurSel($hListBox)
	$x_Point = _GUICtrlListBox_ItemFromPoint($hListBox, 0, $aPos[1])
	If $x <> $x_Point Then _GUICtrlListBox_SetCurSel($hListBox, $x_Point)
EndFunc   ;==>ListBoxCheck

Func GetUrl(); ��ȡURL��ʷ.
	Local $WshShell, $Shell, $FileSystem, $History_Url, $History_Txt
	Local Const $strPath = @TempDir & "\urllist.txt"
	$WshShell = ObjCreate("WScript.Shell")
	$Shell = ObjCreate("Shell.Application")
	$FileSystem = ObjCreate("Scripting.FileSystemObject")
	$History_Url = $Shell.Namespace($WshShell.RegRead _
			("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\history"))
	$History_Txt = $FileSystem.CreateTextFile($strPath, True)
	RecSrch($History_Url, $History_Txt)
	$History_Txt.Close()
	Local $UrlTxt = StringReplace(RegRead("HKEY_CURRENT_USER\Software\����", "key"), _
			'|', @CRLF); ������ʷ.
	FileWrite(FileOpen($strPath, 1), $UrlTxt)
	FileClose($strPath)
	_RemoveDuplicateSourceLines($strPath, @TempDir & '\tmp.txt')
EndFunc   ;==>GetUrl

Func RecSrch($obj, $Txt)
	For $objItem In $obj.Items()
		If $objItem.IsFolder() Then
			$objSubFolder = $objItem.GetFolder
			For $objSubItem In $objSubFolder.Items()
				If $objSubItem.IsFolder = False Then
					If StringLeft($objSubFolder.GetDetailsOf($objSubItem, 0), 4) = 'http' Then _
							$Txt.WriteLine($objSubFolder.GetDetailsOf($objSubItem, 0))
				EndIf
			Next
			RecSrch($objSubFolder, $Txt)
		EndIf
	Next
EndFunc   ;==>RecSrch

Func _RemoveDuplicateSourceLines($Source_File, $Out_File); ɾ���ظ���
	Local $Old_File, $New_File[1]
	_FileReadToArray($Source_File, $Old_File)
	For $i = 1 To $Old_File;[0]; ���������ԭʼ�ļ�
		$line = $Old_File[$i]
		$count = 0
		For $x = 1 To $i; �����Ƿ�ǰ����ԭ�ļ��д���
			If $line = $Old_File[$x] Then $count += 1
		Next
		If $count = 1 Then; ���ֻ��һ����ʾ������������ӵ�һ���µ�����
			$New_File[0] = UBound($New_File)
			ReDim $New_File[$New_File[0] + 1]
			$New_File[$New_File[0]] = $line
		EndIf
	Next
	FileDelete($Out_File)
	_FileWriteFromArray($Out_File, $New_File, 1)
EndFunc   ;==>_RemoveDuplicateSourceLines

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndCombo, $hWndListBox, $sItems, $aItems
	If Not IsHWnd($hListBox) Then $hWndListBox = GUICtrlGetHandle($hListBox)
	If Not IsHWnd($file) Then $hWndCombo = GUICtrlGetHandle($file)

	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
	$iCode = BitShift($iwParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $file, $hWndCombo
			Switch $iCode
				Case $CBN_EDITCHANGE ; �༭�����ָı�
					Dim $list
					$last = GUICtrlRead($file)
					_FileReadToArray(@TempDir & '\tmp.txt', $list)
					If Not @error Then
						$ReadLen = StringLen(GUICtrlRead($file))
						_GUICtrlListBox_ResetContent($hListBox); �Ƴ��б��������Ŀ
						_GUICtrlListBox_BeginUpdate($hListBox)
						For $i = 1 To $list[0]
							$ListLen = StringLen($list[$i])
							If StringInStr(StringLeft($list[$i], $ReadLen), StringLeft($last, $ReadLen)) <> 0 Or _
									StringInStr($list[$i], 'http://' & StringLeft($last, $ReadLen)) <> 0 Or _
									StringInStr($list[$i], 'http://www.' & StringLeft($last, $ReadLen)) <> 0 Then _
									_GUICtrlListBox_AddString($hListBox, $list[$i])
						Next
						_GUICtrlListBox_EndUpdate($hListBox)
					EndIf

					_GUICtrlComboBox_SetEditText($file, $last)

					If $last = '' Or _GUICtrlListBox_GetCount($hListBox) = 0 Then
						GUISetState(@SW_HIDE)
						_GUICtrlListBox_ResetContent($hListBox)
					Else
						GUISetState()
						ControlClick($Titol, '', 'Edit1')
						Send("{END}")
					EndIf
			EndSwitch
		Case $hListBox, $hWndListBox
			Switch $iCode
				Case $LBS_NOTIFY
					$index = _GUICtrlListBox_GetCurSel($hListBox)
					$aItems = _GUICtrlListBox_GetText($hListBox, $index)
					If $aItems Then
						Sleep(250)
						_GUICtrlComboBox_SetEditText($file, $aItems)
						GUISetState(@SW_HIDE)
					EndIf
			EndSwitch
	EndSwitch
EndFunc   ;==>WM_COMMAND

Func yunxing($set)
	Local $test, $test2, $Right4 = StringRight($set, 4)
	$error = 0
	While 1
		If $set = "" Then
			ExitLoop
		Else
			If StringLeft($set, 7) = 'http://' Or StringLeft($set, 4) = 'www.' Then
				$frag = ShellExecute($set)
				If Not $frag Then $error = 1
				ExitLoop
			ElseIf StringInStr($set, '%') <> 0 Then
				$a = _ShellExecute($set)
				$error = $a
				ExitLoop
			ElseIf $set = "cmd" Then
				$frag = ShellExecute($set, '', @UserProfileDir)
				If Not $frag Then $error = 1
				ExitLoop
			Else
				If StringInStr($set, ' ') <> 0 Then
					$a = _ShellExecuteW($set)
					$error = $a
					ExitLoop
				Else
					$frag = ShellExecute($set)
					If Not $frag Then $error = 1
					ExitLoop
				EndIf
			EndIf
		EndIf
	WEnd
	If Not $error Then reg($set)
	Return $error
EndFunc   ;==>yunxing

Func _ShellExecuteW($Str)
	Local $left = StringRegExp($Str, '.+?(?=\s)', 1)
	Local $Right = StringRegExp($Str, '(?<=\s).+', 1)
	$error = 0
	If StringInStr($Str, '\') <> 0 Then
		$frag = ShellExecute($Str)
		If Not $frag Then $error = 1
	Else
		$frag = ShellExecute($left[0], $Right[0])
		If Not $frag Then $error = 1
	EndIf
	If Not $error Then reg($Str)
	Return $error
EndFunc   ;==>_ShellExecuteW

Func _ShellExecute($run)
	Local $Percent = StringRegExp($run, '([^%]+)', 3)
	$error = 0
	For $i = 0 To UBound($Percent) - 2
	Next
	If $i Then
		$frag = ShellExecute(EnvGet($Percent[0]) & $Percent[1])
		If Not $frag Then $error = 1
	Else
		$frag = ShellExecute(EnvGet($Percent[0]))
		If Not $frag Then $error = 1
	EndIf

	If Not $error Then reg($run)
	Return $error
EndFunc   ;==>_ShellExecute

Func reg($Tong)
	$s = 0
	$REG = RegRead("HKEY_CURRENT_USER\Software\����", "key")
	$key = $REG
	If $REG = '' Then
		RegWrite("HKEY_CURRENT_USER\Software\����", "key", "REG_SZ", $Tong)
	Else
		$key = StringSplit($key, '|')
		For $i = 1 To UBound($key) - 1
			If $key[$i] = $Tong Then
				$s = 1
				ExitLoop
			EndIf
		Next
		If Not $s Then RegWrite("HKEY_CURRENT_USER\Software\����", "key", "REG_SZ", $REG & '|' & $Tong)
	EndIf
	$REG = RegRead("HKEY_CURRENT_USER\Software\����", "key")
	GUICtrlSetData($file, '')
	GUICtrlSetData($file, $REG, $Tong)
EndFunc   ;==>reg

Func _WinCenter($hWnd, $uiMsg, $idEvent, $dwTime)
	If $idEvent = $TimerDLL[0] Then
		$pos = WinGetPos($Titol)
		If Not @error Then _
				WinMove("Internet Explorer", "", $pos[0] + 70, $pos[1] - 209)
	EndIf
EndFunc   ;==>_WinCenter
