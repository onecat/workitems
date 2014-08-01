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
If FileExists(@DesktopDir & "\结果.au3") = 1 Then FileDelete(@DesktopDir & "\结果.au3")
$FILE1 = FileSelectFolder("选择待装入目录", "", 2)
If @error = 1 Then Exit
$FILE2 = StringRight($FILE1, StringLen($FILE1) - StringInStr($FILE1, "\", 1, -1))
$CDU = StringLen ($FILE1)


$TEMP = ""
$FORM1 = GUICreate("释放路径设定", 343, 275, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP))
$INPUT1 = GUICtrlCreateInput("", 16, 48, 241, 21)
$LABEL1 = GUICtrlCreateLabel("输入释放路径(可以为宏或绝对路径)或浏览", 16, 16, 246, 17)
$BUTTON1 = GUICtrlCreateButton("浏览", 272, 46, 51, 25)
$BUTTON2 = GUICtrlCreateButton("生成", 200, 192, 67, 25)
$BUTTON4 = GUICtrlCreateButton("退出", 272, 192, 67, 25)
$LABEL2 = GUICtrlCreateLabel("常用目录宏", 16, 112, 72, 17)
$LIST1 = GUICtrlCreateList("", 16, 136, 180, 97, BitOR($WS_HSCROLL, $WS_VSCROLL, $WS_BORDER))
$LABEL3 = GUICtrlCreateLabel("BY： 风雪夜归人", 224, 144, 108, 17)
$LABEL4 = GUICtrlCreateLabel("QQ群：12467473", 224, 176, 108, 17)
$RADIO1 = GUICtrlCreateRadio("覆盖", 144, 80, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RADIO2 = GUICtrlCreateRadio("不覆盖", 208, 80, 61, 17)
GUICtrlCreateGroup("", -99, -99, -99, -99)
$RADIO3 = GUICtrlCreateRadio("根目录", 8, 80, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RADIO4 = GUICtrlCreateRadio("原目录", 75, 80, 57, 17)
GUICtrlCreateGroup("", -99, -99, -99, -99)
$Checkbox1 = GUICtrlCreateCheckbox("任意目录", 272, 80, 65, 17)
$BUTTON3 = GUICtrlCreateButton("帮助", 88, 106, 43, 25)
GUICtrlSetData($LIST1, "@TempDir|@ProgramFilesDir|@WindowsDir|@ScriptDir|@SystemDir|@HomeDrive|@HomePath", "@TempDir")
GUICtrlSetData($LIST1, "@AppDataDir|@DesktopDir|@MyDocumentsDir|@FavoritesDir|@ProgramsDir|@StartMenuDir|@StartupDir|@UserProfileDir")
GUICtrlSetData($LIST1, "@AppDataCommonDir|@DesktopCommonDir|@DocumentsCommonDir|@FavoritesCommonDir|@ProgramsCommonDir|@StartMenuCommonDir|@StartupCommonDir")
GUIRegisterMsg($WM_COMMAND, "MY_WM_COMMAND")
$LABEL5 = GUICtrlCreateLabel("生成进度提示", 20, 244, 140, 20)
$PROGRESS1 = GUICtrlCreateProgress(165, 242, 158, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$NMSG = GUIGetMsg()
	Switch $NMSG
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $BUTTON1
			$FILEXZ = FileSelectFolder("选择释放目录", "", 2)
			GUICtrlSetData($INPUT1, $FILEXZ)
		Case $BUTTON3
			FileDelete(@ScriptDir & "\目录宏帮助.txt")
			FileWriteLine("目录宏帮助.txt", "宏为 Window Xp 的 C:\Documents and Settings\All Users 目录数据." & @CRLF & "@AppDataCommonDir [Application Data] 文件夹路径" & @CRLF & "@DesktopCommonDir [桌面] 文件夹路径" & @CRLF & "@DocumentsCommonDir [Documents] 文件夹路径" & @CRLF & "@FavoritesCommonDir [Favorites] 文件夹路径" & @CRLF & "@ProgramsCommonDir [开始菜单\程序] 文件夹路径" & @CRLF & "@StartMenuCommonDir [开始菜单] 文件夹路径" & @CRLF & "@StartupCommonDir [开始 菜单\程序\启动] 文件夹路径" & @CRLF & "宏为 Window Xp 的 'C:\Documents and Settings\Administrator 目录数据.'" & @CRLF & "@AppDataDir [Application Data] 文件夹路径" & @CRLF & "@DesktopDir [桌面] 文件夹路径" & @CRLF & "@MyDocumentsDir [我的文档] 文件夹路径" & @CRLF & "@FavoritesDir [收藏夹] 文件夹路径" & @CRLF & "@ProgramsDir [开始 菜单\程序] 文件夹路径" & @CRLF & "@StartMenuDir [开始 菜单] 文件夹路径" & @CRLF & "@StartupDir [开始 菜单\程序\启动] 文件夹路径" & @CRLF & "@UserProfileDir 'C:\Documents and Settings\Administrator' 文件夹路径" & @CRLF & "计算机系统的其他宏:" & @CRLF & "@ScriptDir 当前运行脚本的目录 [不包含尾随反斜杠]" & @CRLF & "@HomeDrive 当前用户主目录所在驱动器号.例如 C:" & @CRLF & "@HomePath 当前用户的主目录.如 Documents and Settings\Administrator" & @CRLF & "结合 @HomeDrive 宏可获取其完整路径." & @CRLF & "@HomeShare 包含当前用户主目录的服务器和共享名." & @CRLF & "@LogonDNSDomain 登陆 DNS 域." & @CRLF & "@LogonDomain 登陆域." & @CRLF & "@LogonServer 登陆服务器." & @CRLF & "@ProgramFilesDir [Program Files] 文件夹路径.如 C:\Program Files" & @CRLF & "@CommonFilesDir [Common Files] 文件夹路径.如 C:\Program Files\Common Files" & @CRLF & "@WindowsDir [Windows] 文件夹路径.如 C:\Windows" & @CRLF & "@SystemDir [System] 或 [System32] 文件夹路径.如 C:\Windows\System32" & @CRLF & "@TempDir [Temp] 文件夹路径.如 C:\DOCUME~1\ADMINI~1\LOCALS~\Temp")
			ShellExecute("notepad.exe", @ScriptDir & "\目录宏帮助.txt")
		Case $BUTTON2
				If _IsChecked($Checkbox1) Then
                    fxg();任意目录
                Else
                    lj();获取选择的目录
                EndIf
				Exit
		Case $BUTTON4
				Exit	
	EndSwitch
WEnd

Func fxg()
		_FILELIST($FILE1)
		$TXT = GUICtrlRead($INPUT1)
			$TXT1 = StringLeft($TXT, 3)
			If StringRight($TXT1, 2) = ":\" Then
				$TXT = '"' & $TXT & '"'
			ElseIf $TXT = "" Then
				MsgBox(0, "提示", "释放目录不能为空!")
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
					FileWriteLine(@DesktopDir & "\结果.au3", $3)
					$0 = $0 + 1
					GUICtrlSetData($LABEL5, "已生成 " & $0 & " 行代码.")
					GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
					Sleep(10)
				Next
				FileWriteLine(@DesktopDir & "\结果.au3", ";本脚本由风雪FileInstall函数自动装入工具生成！QQ:61703250，技术群：12467473")
				$VAR = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\SciTE.exe", "")
				FileDelete(@ScriptDir & "\目录宏帮助.txt")
				ShellExecute($VAR, @DesktopDir & "\结果.au3")
				;ExitLoop
			EndIf
EndFunc	

Func lj()
		_FILELIST($FILE1)
		$TXT = GUICtrlRead($INPUT1)
			$TXT1 = StringLeft($TXT, 3)
			If StringRight($TXT1, 2) = ":\" Then
				$TXT = '"' & $TXT & '"'
			ElseIf $TXT = "" Then
				MsgBox(0, "提示", "释放目录不能为空!")
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
					FileWriteLine(@DesktopDir & "\结果.au3", $3)
					$0 = $0 + 1
					GUICtrlSetData($LABEL5, "已生成 " & $0 & " 行代码.")
					GUICtrlSetData($PROGRESS1, (($I + 1) / (UBound($AFILE) - 2)) * 100)
					Sleep(10)
				Next
				FileWriteLine(@DesktopDir & "\结果.au3", ";本脚本由风雪FileInstall函数自动装入工具生成！QQ:61703250，技术群：12467473")
				$VAR = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\SciTE.exe", "")
				FileDelete(@ScriptDir & "\目录宏帮助.txt")
				ShellExecute($VAR, @DesktopDir & "\结果.au3")
				;ExitLoop
			EndIf
EndFunc


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
EndFunc   ;==>直接在根目录下

Func _IsChecked($Checkbox1)
    Return BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked


Func _SSTRINGFUNCTIONNAME1($S_SOURCESTRING, $S_DESTINATIONSTRING)
	Return StringRight($S_SOURCESTRING, StringLen($S_SOURCESTRING) - StringInStr($S_SOURCESTRING, $S_DESTINATIONSTRING, 1, 1) + 2)
EndFunc   ;==>原目录