#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=G:\Autoit3\��������AU3\FileInstall_Aid.exe
#PRE_Outfile=FileInstall_Aid.exe
#PRE_Res_Comment=Сվ�޸�
#PRE_Res_Description=Сվ�޸�
#PRE_Res_Fileversion=2.0.0.0
#PRE_Res_LegalCopyright=Сվ�޸�
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#Region ### START Koda GUI section ### Form=
;~ Global $G_SZVERSION = "askldjfasl;dfja;slkdfjasf;"
;~ If WinExists($G_SZVERSION) Then Exit
;~ AutoItWinSetTitle($G_SZVERSION)
OPT("GUIDataSeparatorChar")
OPT("TrayAutoPause", 0)
OPT("GUICloseOnESC", 0)



Dim $AFILE[1], $AFILE1[1], $NUM, $0 = 0  
Global Const $STN_DBLCLK = 2
$NUM = 0
If FileExists(@DesktopDir & "\���.au3") = 1 Then FileDelete(@DesktopDir & "\���.au3")
$FILE1 = FileSelectFolder("ѡ���װ��Ŀ¼", "", 2)
If @error = 1 Then Exit
$FILE2 = StringRight($FILE1, StringLen($FILE1) - StringInStr($FILE1, "\", 1, -1))
$CDU = StringLen ($FILE1)
$wjs = StringLen($FILE2)


$TEMP = ""
$FORM1 = GUICreate("�ͷ�·���趨", 343, 275, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP))
$INPUT1 = GUICtrlCreateInput("", 16, 48, 241, 21)
$LABEL1 = GUICtrlCreateLabel("�����ͷ�·��(����Ϊ������·��)�����", 16, 16, 246, 17)
$BUTTON1 = GUICtrlCreateButton("���", 272, 46, 51, 25)
$BUTTON2 = GUICtrlCreateButton("����", 200, 192, 67, 25)
$BUTTON4 = GUICtrlCreateButton("�˳�", 272, 192, 67, 25)
$LABEL2 = GUICtrlCreateLabel("����Ŀ¼��", 16, 112, 72, 17)
$LIST1 = GUICtrlCreateList("", 16, 136, 180, 97, BitOR($WS_HSCROLL, $WS_VSCROLL, $WS_BORDER))
$LABEL3 = GUICtrlCreateLabel("BY�� ��ѩҹ����", 224, 144, 108, 17)
$LABEL4 = GUICtrlCreateLabel("QQȺ��12467473", 224, 176, 108, 17)
$RADIO1 = GUICtrlCreateRadio("����", 144, 80, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RADIO2 = GUICtrlCreateRadio("������", 208, 80, 61, 17)
GUICtrlCreateGroup("", -99, -99, -99, -99)
$RADIO3 = GUICtrlCreateRadio("��Ŀ¼", 8, 80, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RADIO4 = GUICtrlCreateRadio("ԭĿ¼", 75, 80, 57, 17)
GUICtrlCreateGroup("", -99, -99, -99, -99)
$Checkbox1 = GUICtrlCreateCheckbox("����Ŀ¼", 272, 80, 65, 17)
$BUTTON3 = GUICtrlCreateButton("����", 88, 106, 43, 25)
GUICtrlSetData($LIST1, "@TempDir|@ProgramFilesDir|@WindowsDir|@ScriptDir|@SystemDir|@HomeDrive|@HomePath", "@TempDir")
GUICtrlSetData($LIST1, "@AppDataDir|@DesktopDir|@MyDocumentsDir|@FavoritesDir|@ProgramsDir|@StartMenuDir|@StartupDir|@UserProfileDir")
GUICtrlSetData($LIST1, "@AppDataCommonDir|@DesktopCommonDir|@DocumentsCommonDir|@FavoritesCommonDir|@ProgramsCommonDir|@StartMenuCommonDir|@StartupCommonDir")
GUIRegisterMsg($WM_COMMAND, "MY_WM_COMMAND")
$LABEL5 = GUICtrlCreateLabel("���ɽ�����ʾ", 20, 244, 140, 20)
$PROGRESS1 = GUICtrlCreateProgress(165, 242, 158, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$NMSG = GUIGetMsg()
	Switch $NMSG
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $BUTTON1
			$FILEXZ = FileSelectFolder("ѡ���ͷ�Ŀ¼", "", 2)
			GUICtrlSetData($INPUT1, $FILEXZ)
		Case $BUTTON3
			FileDelete(@ScriptDir & "\Ŀ¼�����.txt")
			FileWriteLine("Ŀ¼�����.txt", "��Ϊ Window Xp �� C:\Documents and Settings\All Users Ŀ¼����." & @CRLF & "@AppDataCommonDir [Application Data] �ļ���·��" & @CRLF & "@DesktopCommonDir [����] �ļ���·��" & @CRLF & "@DocumentsCommonDir [Documents] �ļ���·��" & @CRLF & "@FavoritesCommonDir [Favorites] �ļ���·��" & @CRLF & "@ProgramsCommonDir [��ʼ�˵�\����] �ļ���·��" & @CRLF & "@StartMenuCommonDir [��ʼ�˵�] �ļ���·��" & @CRLF & "@StartupCommonDir [��ʼ �˵�\����\����] �ļ���·��" & @CRLF & "��Ϊ Window Xp �� 'C:\Documents and Settings\Administrator Ŀ¼����.'" & @CRLF & "@AppDataDir [Application Data] �ļ���·��" & @CRLF & "@DesktopDir [����] �ļ���·��" & @CRLF & "@MyDocumentsDir [�ҵ��ĵ�] �ļ���·��" & @CRLF & "@FavoritesDir [�ղؼ�] �ļ���·��" & @CRLF & "@ProgramsDir [��ʼ �˵�\����] �ļ���·��" & @CRLF & "@StartMenuDir [��ʼ �˵�] �ļ���·��" & @CRLF & "@StartupDir [��ʼ �˵�\����\����] �ļ���·��" & @CRLF & "@UserProfileDir 'C:\Documents and Settings\Administrator' �ļ���·��" & @CRLF & "�����ϵͳ��������:" & @CRLF & "@ScriptDir ��ǰ���нű���Ŀ¼ [������β�淴б��]" & @CRLF & "@HomeDrive ��ǰ�û���Ŀ¼������������.���� C:" & @CRLF & "@HomePath ��ǰ�û�����Ŀ¼.�� Documents and Settings\Administrator" & @CRLF & "��� @HomeDrive ��ɻ�ȡ������·��." & @CRLF & "@HomeShare ������ǰ�û���Ŀ¼�ķ������͹�����." & @CRLF & "@LogonDNSDomain ��½ DNS ��." & @CRLF & "@LogonDomain ��½��." & @CRLF & "@LogonServer ��½������." & @CRLF & "@ProgramFilesDir [Program Files] �ļ���·��.�� C:\Program Files" & @CRLF & "@CommonFilesDir [Common Files] �ļ���·��.�� C:\Program Files\Common Files" & @CRLF & "@WindowsDir [Windows] �ļ���·��.�� C:\Windows" & @CRLF & "@SystemDir [System] �� [System32] �ļ���·��.�� C:\Windows\System32" & @CRLF & "@TempDir [Temp] �ļ���·��.�� C:\DOCUME~1\ADMINI~1\LOCALS~\Temp")
			ShellExecute("notepad.exe", @ScriptDir & "\Ŀ¼�����.txt")
		Case $BUTTON2
				If _IsChecked($Checkbox1) Then
                    fxg();����Ŀ¼
					PLSC()
                Else
                    lj();��ȡѡ���Ŀ¼
					PLSC()
                EndIf
				Exit
		Case $BUTTON4
				Exit	
	EndSwitch
WEnd


;����Ŀ¼
Func fxg()
		_FILELIST($FILE1)
		$TXT = GUICtrlRead($INPUT1)
			$TXT1 = StringLeft($TXT, 3)
			If StringRight($TXT1, 2) = ":\" Then
				$TXT = '"' & $TXT & '"'
			ElseIf $TXT = "" Then
				MsgBox(0, "��ʾ", "�ͷ�Ŀ¼����Ϊ��!")
				Exit
			EndIf
			If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
				$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE, $FILE2)
				$aLine = _FileFinDir($FILE1)
			For $i = 0 To UBound($aLine) - 1
				$cj = 'DirCreate ('
				$wjj = GUICtrlRead($INPUT1) & ' & ' & '"' & StringTrimLeft($aLine[$i],$wjs) & '")'
				$CJMU = $cj & $wjj
				FileWriteLine(@DesktopDir & "\���.au3", $CJMU)
				$0 = $0 + 1
			Next
			
			Else
				$AFILEXD = _SSTRINGFUNCTIONNAME1($AFILE, $FILE2)
				$aLine = _FileFinDir($FILE1)
			For $i = 0 To UBound($aLine) - 1
				$cj = 'DirCreate ('
				$wjj = GUICtrlRead($INPUT1) & ' & ' & '"\' & $aLine[$i] & '")'
				$CJMU = $cj & $wjj 
				FileWriteLine(@DesktopDir & "\���.au3", $CJMU)
				$0 = $0 + 1
			Next
			
			EndIf
			
			If GUICtrlRead($RADIO1) = $GUI_CHECKED Then
				$FG = 1
			Else
				$FG = 0
			EndIf

			If $TXT <> "" Then
				For $I = 0 To UBound($AFILE) - 2
					$TEMP &= $AFILE[$I] & @CRLF
				If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
					$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE[$I], $FILE2)
				Else
					$AFILEXD = _SSTRINGFUNCTIONNAME1($AFILE[$I], $FILE2)
				EndIf
					$1 = 'FileInstall(".'
					$2 = $1 & StringMid($AFILE[$I],$CDU+1) & '",' & $TXT & " & " & '"'
					$3 = $2 & $AFILEXD & '",' & $FG & ")"
					FileWriteLine(@DesktopDir & "\���.au3", $3)
					$0 = $0 + 1
					GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
					GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
					Sleep(10)
				Next
					FileWriteLine(@DesktopDir & "\���.au3", ";���ű��ɷ�ѩFileInstall�����Զ�װ�빤������(��лafan�ļ���֧��)��QQ:61703250������Ⱥ��12467473")
;~ 				$VAR = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\SciTE.exe", "")
;~ 				FileDelete(@ScriptDir & "\Ŀ¼�����.txt")
;~ 				ShellExecute($VAR, @DesktopDir & "\���.au3")
				;ExitLoop
			EndIf
EndFunc	

Func lj();��ȡѡ���Ŀ¼
		_FILELIST($FILE1)
		$TXT = GUICtrlRead($INPUT1)
			$TXT1 = StringLeft($TXT, 3)
			If StringRight($TXT1, 2) = ":\" Then
				$TXT = '"' & $TXT & '"'
			ElseIf $TXT = "" Then
				MsgBox(0, "��ʾ", "�ͷ�Ŀ¼����Ϊ��!")
				Exit
			EndIf
				If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
				$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE, $FILE2)
				$aLine = _FileFinDir($FILE1)
			For $i = 0 To UBound($aLine) - 1
				$cj = 'DirCreate ('
				$wjj = GUICtrlRead($INPUT1) & ' & ' & '"' & StringTrimLeft($aLine[$i],$wjs) & '")'
				$CJMU = $cj & $wjj
				FileWriteLine(@DesktopDir & "\���.au3", $CJMU)
				$0 = $0 + 1
				GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
				GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
			Next
			
			Else
				$AFILEXD = _SSTRINGFUNCTIONNAME1($AFILE, $FILE2)
				$aLine = _FileFinDir($FILE1)
			For $i = 0 To UBound($aLine) - 1
				$cj = 'DirCreate ('
				$wjj = GUICtrlRead($INPUT1) & ' & ' & '"\' & $aLine[$i] & '")'
				$CJMU = $cj & $wjj 
				FileWriteLine(@DesktopDir & "\���.au3", $CJMU)
				$0 = $0 + 1
				GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
				GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
			Next
			
			EndIf
		
			If GUICtrlRead($RADIO1) = $GUI_CHECKED Then
				$FG = 1
			Else
				$FG = 0
			EndIf

			If $TXT <> "" Then
				For $I = 0 To UBound($AFILE) - 2
					$TEMP &= $AFILE[$I] & @CRLF
				If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
					$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE[$I], $FILE2)
				Else
					$AFILEXD = _SSTRINGFUNCTIONNAME1($AFILE[$I], $FILE2)
				EndIf
					$1 = 'FileInstall("'
					$2 = $1 & $AFILE[$I] & '",' & $TXT & " & " & '"'
					$3 = $2 & $AFILEXD & '",' & $FG & ")"
					FileWriteLine(@DesktopDir & "\���.au3", $3)
					$0 = $0 + 1
					GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
					GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
					Sleep(10)
				Next
				FileWriteLine(@DesktopDir & "\���.au3", ";���ű��ɷ�ѩFileInstall�����Զ�װ�빤������(��лafan�ļ���֧��)��QQ:61703250������Ⱥ��12467473")
;~ 				$VAR = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\SciTE.exe", "")
;~ 				FileDelete(@ScriptDir & "\Ŀ¼�����.txt")
;~ 				ShellExecute($VAR, @DesktopDir & "\���.au3")
				;ExitLoop
			EndIf
EndFunc


Func PLSC()
		$TXT = GUICtrlRead($INPUT1)
				If $TXT <> "" Then
				For $I = 0 To UBound($AFILE) - 2
					$TEMP &= $AFILE[$I] & @CRLF 
				If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
					$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE[$I], $FILE2)
						$10 = 'FileDelete('
						$11 = $10 & $TXT & " & " & '"'
						$12 = $11 & $AFILEXD & '"' & ")"
						FileWriteLine(@DesktopDir & "\���.au3", $12)
						$0 = $0 + 1
						GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
						GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
						Sleep(10)
				Else
					If 	$I = 0 Then ;���ļ��б�����һ���ļ��ſ���
						$AFILEXD = _SSTRINGFUNCTIONNAME1($AFILE[$I], $FILE2)
						$10 = 'DirRemove('
						$11 = $10 & $TXT & " & " & '"\'
						$12 = $11 & $FILE2 & '",' & "1" & ")"
						FileWriteLine(@DesktopDir & "\���.au3", $12)
						$0 = $0 + 1
						GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
						GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
					EndIf	
						Sleep(10)
						;ExitLoop;���������ֹ���½���������s
					EndIf					
				Next
			
				If GUICtrlRead($RADIO3) = $GUI_CHECKED Then
						$AFILEXD = _SSTRINGFUNCTIONNAME($AFILE, $FILE2)
						$aLine = _FileFinDir($FILE1)
				For $i = 0 To UBound($aLine) - 1
						$cj = 'DirRemove ('
						$wjj = GUICtrlRead($INPUT1) & ' & ' & '"' & StringTrimLeft($aLine[$i],$wjs) & '")'
						$CJMU = $cj & $wjj
						FileWriteLine(@DesktopDir & "\���.au3", $CJMU)
						$0 = $0 + 1
				Next
				EndIf
				GUICtrlSetData($LABEL5, "������ " & $0 & " �д���.")
				GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
				FileWriteLine(@DesktopDir & "\���.au3", ";���ű��ɷ�ѩFileInstall�����Զ�װ�빤�����ɣ�QQ:61703250������Ⱥ��12467473")
				$VAR = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\SciTE.exe", "")
				FileDelete(@ScriptDir & "\Ŀ¼�����.txt")
				ShellExecute($VAR, @DesktopDir & "\���.au3")
				;ExitLoop
			EndIf
EndFunc
		
Func _FileFinDir($_Path)
        $_Path = StringRegExpReplace($_Path, '^\s+|\\+$|\s+$', '')
        Local $sFiles
        __FileFinda($_Path, $sFiles)
        Local $iLen = StringLen($_Path) - $wjs
        $sFiles = StringRegExpReplace($sFiles, '(?m)^.{' & $iLen & '}', '')
        Local $aLine = StringRegExp($sFiles, '\V+', 3)
        If @error Then Return SetError(1)
        Return $aLine
EndFunc   ;==>_FileFinDir

Func __FileFinda($sDir, ByRef $sOut)
        Local $hSearch = FileFindFirstFile($sDir & '\*')
        If $hSearch = -1 Then Return
        While 1
                Local $sFile = FileFindNextFile($hSearch)
                If @error Then ExitLoop
                If Not @extended Then ContinueLoop
                __FileFinda($sDir & '\' & $sFile, $sOut)
                $sOut &= $sDir & '\' & $sFile & @CRLF
        WEnd
        FileClose($hSearch)
EndFunc   ;==>__FileFinda		

Func MY_WM_COMMAND($HWND, $MSG, $WPARAM, $LPARAM)
	Local $NNOTIFYCODE = BitShift($WPARAM, 16)
	Local $NID = BitAND($WPARAM, 65535)
	Local $HCTRL = $LPARAM
	Switch $NID
		Case $LIST1
			Switch $NNOTIFYCODE
				Case $STN_DBLCLK
					GUICtrlSetData($INPUT1, _GUICtrlListBox_GetText($LIST1, _GUICtrlListBox_GetCurSel($LIST1)), "")
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_WM_COMMAND

Func _FILELIST($SEARCHDIR)
	$SEARCH = FileFindFirstFile($SEARCHDIR & "\*")
	If $SEARCH = -1 Then Return -1
	While 1
		$FILE = FileFindNextFile($SEARCH)
		If @error Then
			FileClose($SEARCH)
			Return
		ElseIf $FILE = "." Or $FILE = ".." Then
			ContinueLoop
		ElseIf StringInStr(FileGetAttrib($SEARCHDIR & "\" & $FILE), "D") Then
			_FILELIST($SEARCHDIR & "\" & $FILE)
			ContinueLoop
		EndIf
		$AFILE[$NUM] = $SEARCHDIR & "\" & $FILE
		$NUM += 1
		ReDim $AFILE[UBound($AFILE) + 1]
	WEnd
EndFunc   ;==>_FILELIST


Func _SSTRINGFUNCTIONNAME($S_SOURCESTRING, $S_DESTINATIONSTRING)
	Return StringRight($S_SOURCESTRING, StringLen($S_SOURCESTRING)  - StringInStr($S_SOURCESTRING, $S_DESTINATIONSTRING, 1, 1) -StringLen($S_DESTINATIONSTRING) -1 + 2)
EndFunc   ;==>ֱ���ڸ�Ŀ¼��

Func _IsChecked($Checkbox1)
    Return BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked


Func _SSTRINGFUNCTIONNAME1($S_SOURCESTRING, $S_DESTINATIONSTRING)
	Return StringRight($S_SOURCESTRING, StringLen($S_SOURCESTRING) - StringInStr($S_SOURCESTRING, $S_DESTINATIONSTRING, 1, 1) + 2)
EndFunc   ;==>ԭĿ¼