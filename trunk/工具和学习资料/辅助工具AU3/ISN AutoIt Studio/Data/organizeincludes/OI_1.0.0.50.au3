#include <Array.au3>
#include <ButtonConstants.au3>
#include <File.au3>
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <ListViewConstants.au3>
#include <Misc.au3>
#include <String.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Comment=Organize Includes for AutoIt
#AutoIt3Wrapper_Res_Description=Organize Includes for AutoIt
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Thorsten Meger (Xenobiologist)
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/striponly
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
Opt('MustDeclareVars', 1)
Opt('WinSearchChildren', 1)
Opt("TrayIconDebug", 1)

If _Singleton('OrganizeIncludes', 1) = 0 Then
	MsgBox(16, 'Warning', 'An occurence of "Organize Includes" is already running', 5)
	Exit (0)
EndIf

; **************************************************************
; Searchpath for Includes
; ToDo : Silent Mode 	(alle Parameter und scriptdir immer neu machen!																-TODO
; ToDo : Adding includes from ScriptDir with " " 																					-TODO
; 		 Extra Object.Möglichkeit erst Scriptdir prüfen, oder erst AutoitDir.
; ToDo : Includes in includes einbauen ???																							-TODO
; ToDo : Rekursion im ScriptDir einbauen und den relativen Pfad einbinden															-TODO
; GUI
; ToDo : ??? Sprachauswahl
; ToDo : ??? Obfuscator einfügen /striponly ; #Obfuscator_Parameters=/sf /sv /om /cs=0 /cn=0
; Language
; ToDo : Sprachauswahl ermöglichen (inkl. Standard in ini speichern und auslesen)													-TODO
; Installer :
; ToDo : Install umschreiben, SciterUser.properties nicht überschreiben, sondern wenn vorhanden - ergänzen
; ToDo : Insert beta as default when exist while install
; ToDo : Sprache setzen StringRight(@OSLang,2) = 07 Then Deutsch
; **************************************************************

Global $start_T = TimerInit()
; ScriptVersion
Global $scriptVersion = 'Version 1.0.0.50', $date = '13.March.2010'
; ReleaseVersion
Global $RegKey = 'HKEY_LOCAL_MACHINE64\SOFTWARE\'
If @OSArch <> 'X86' Then $RegKey &= 'Wow6432Node\'
Global $InstallPath = RegRead($RegKey & 'AutoIt v3\AutoIt', 'InstallDir')
Global $InstallVersion = RegRead($RegKey & 'AutoIt v3\AutoIt', 'Version')
; BetaVersion
Global $betaInstallPath = RegRead($RegKey & 'AutoIt v3\AutoIt', 'betaInstallDir')
Global $betaInstallVersion = RegRead($RegKey & 'AutoIt v3\AutoIt', 'betaVersion')
; Ini files for includes and settings
Global $includesIni_Release = @ScriptDir & '\includes_Release.ini'
Global $includesIni_Beta = @ScriptDir & '\includes_Beta.ini'
Global $includesIni_UDF = @ScriptDir & '\includes_UDF.ini'
Global $includesIni_ScriptDir = @ScriptDir & '\includes_'
Global $settingsINI = @ScriptDir & '\settings.ini'
Global $IconsDLLPath = @ScriptDir & '\OI_Icons.dll'
; Objects
Global $objV_Includes = _ObjDictCreate(1) ; Object for the includes
Global $objV_ALL = _ObjDictCreate(1) ; Object for all funtions and constants
; Read global information from settings.in like colours
Global $colour_GREEN = IniRead($settingsINI, 'Options', 'Green', '0x80FF80')
Global $colour_YELLOW = IniRead($settingsINI, 'Options', ' Yellow', '0xFFFF80')
Global $colour_RED = IniRead($settingsINI, 'Options', ' Red', '0xEF3D4A')
Global $sort = IniRead($settingsINI, 'Options', ' Sort', '0')
; Scite variable
Global $SciTECmd = 0
; Other global varibales
Global $filename ; the full path of the script
Global $scriptDirPath, $keyword_I, $original_source
Global $green_A[1], $yellow_A[1], $red_A[1]
Global $removeALL_R, $removeUnneeded_R, $removeNothing_R, $insertTop_R, $insertAfterKeyword_R
Global $releaseV_I, $betaV_I, $filename_I, $status_SB, $includes_LV, $releaseV_R, $betaV_R, $UDFsDir_CHB, $scriptDir_CHB
Global $silentMode_CHB, $autoRestart_CHB, $copyToClipboard_CHB, $keyword_L
Global $scriptDirFunctions

GUIRegisterMsg($WM_COPYDATA, 'MY_WM_COPYDATA')
GUIRegisterMsg($WM_COMMAND, 'MY_WM_COMMAND')

; clear Output
;~ SendSciTE_Command('menucommand:420')
; OI headline
ConsoleWrite('"Organize Includes" for AutoIt3 | ' & $scriptVersion & ' | ' & Chr(169) & ' Th.Meger' & Chr(153) & ' | ' & $date & @CRLF)

#cs
	S T A R T
#ce

_main()

Func _main()

	Local $nMsg

	If Not FileExists($settingsINI) Then _initialSettings() ; first start - write settings.ini with the initial settings

	Local $text_SB[3] = [@TAB & $scriptVersion, @TAB & 'Organize Includes', '']
	Local $parts_SB[3] = [100, 680, -1]
	Local $status_A[3] = ['correctly included', 'needed include', 'not needed'] ; the strings for status of includes
	Local $r, $b, $u, $s ; Release, Beta, UDF, ScriptDir
	Local $GUI
	; Standard path (installDir/include)
	Local $includesFormatStart = IniRead($settingsINI, 'Options', 'IncludesFormatStart', '#include<') ; beginning of include ', ", <
	Local $includesFormatEnd = IniRead($settingsINI, 'Options', 'IncludesFormatEnd', '>') ; end of include ', ", >
	; ScriptDir
	; ### Next Version
;~ 	Local $includesFormatScriptDirStart = IniRead($settingsINI, 'Options', 'IncludesFormatScriptDirStart', '#include "') ; end of include ', ", >
;~ 	Local $includesFormatScriptDirEnd = IniRead($settingsINI, 'Options', 'IncludesFormatScriptDirEnd', '"') ; end of include ', ", >
	#region ### GUI section ###
	$GUI = GUICreate('Organize Includes', 775, 601, (@DesktopWidth - 775) / 2, ((@DesktopHeight - 601) / 2) - 50)
	GUICtrlCreateGroup('Settings', 0, 45, 289, 103)
	; Release Version
	GUICtrlCreateIcon($IconsDLLPath, -10, 8, 66, 16, 16)
	GUICtrlCreateLabel('Autoit Release Version', 28, 68, 186, 21)
	GUICtrlSetFont(-1, 9.5, 700)
	$releaseV_I = GUICtrlCreateInput($InstallVersion, 175, 64, 105, 21)
	GUICtrlSetFont(-1, 9.5, 700)
	; Beta Version
	GUICtrlCreateIcon($IconsDLLPath, -1, 8, 90, 16, 16)
	GUICtrlCreateLabel('Autoit Beta Version', 28, 92, 169, 17)
	GUICtrlSetFont(-1, 9.5, 700)
	$betaV_I = GUICtrlCreateInput($betaInstallVersion, 175, 88, 105, 21)
	GUICtrlSetFont(-1, 9.5, 700)
	; Filename
	GUICtrlCreateIcon($IconsDLLPath, -6, 8, 114, 16, 16)
	GUICtrlCreateLabel('Filename', 28, 116, 166, 21)
	GUICtrlSetFont(-1, 9.5, 700)
	$filename_I = GUICtrlCreateInput('', 96, 112, 185, 21)
	GUICtrlSetFont(-1, 9.5, 700)

	GUICtrlCreateGroup('', -99, -99, 1, 1)
	$status_SB = _GUICtrlStatusBar_Create($GUI, $parts_SB, $text_SB)
	$includes_LV = GUICtrlCreateListView('Includes|Status', 290, 45, 481, 530, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
	GUICtrlSendMsg($includes_LV, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_GRIDLINES, $LVS_EX_GRIDLINES)
	GUICtrlSendMsg($includes_LV, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_FULLROWSELECT, $LVS_EX_FULLROWSELECT)
	GUICtrlSetFont($includes_LV, 10, 600, '', 'Trebuchet MS')
	_GUICtrlListView_SetColumnWidth($includes_LV, 0, 300)
	_GUICtrlListView_SetColumnWidth($includes_LV, 1, $LVSCW_AUTOSIZE_USEHEADER)

	Local $organizeIncludes_B = GUICtrlCreateButton('&Organize Includes', 1, 0, 110, 40, BitOR($BS_MULTILINE, $BS_DEFPUSHBUTTON))
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($organizeIncludes_B, _GetImageListHandle($IconsDLLPath, 1, True))
	Local $settings_B = GUICtrlCreateButton('&Settings', 111, 0, 110, 40)
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($settings_B, _GetImageListHandle($IconsDLLPath, 2, True))
	Local $restart_B = GUICtrlCreateButton('&Restart ', 221, 0, 110, 40)

	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($restart_B, _GetImageListHandle($IconsDLLPath, 8, True))
	Local $renewINI_B = GUICtrlCreateButton('Renew &INI ', 331, 0, 110, 40)
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($renewINI_B, _GetImageListHandle($IconsDLLPath, 6, True))
	Local $help_B = GUICtrlCreateButton('&Help ', 441, 0, 110, 40)
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($help_B, _GetImageListHandle($IconsDLLPath, 7, True))
	Local $thread_B = GUICtrlCreateButton('&OI Thread ', 551, 0, 110, 40)
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($thread_B, _GetImageListHandle($IconsDLLPath, 3, True))
	Local $exit_B = GUICtrlCreateButton('E&xit ', 661, 0, 110, 40)
	GUICtrlSetFont(-1, 9, 800)
	_GUICtrlButton_SetImageList($exit_B, _GetImageListHandle($IconsDLLPath, 4, True))

	GUICtrlCreateGroup('Includes Search', 0, 150, 289, 73)
	GUIStartGroup()
	$releaseV_R = GUICtrlCreateRadio('Release Version', 16, 166, 113, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$betaV_R = GUICtrlCreateRadio('Beta Version', 16, 190, 113, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUIStartGroup()
	$UDFsDir_CHB = GUICtrlCreateCheckbox('Includes Directory', 160, 166, 121, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$scriptDir_CHB = GUICtrlCreateCheckbox('Script Directory', 160, 190, 121, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUICtrlCreateGroup('', -99, -99, 1, 1)
	GUICtrlCreateGroup('Includes Options', 0, 225, 289, 97)
	GUIStartGroup()
	$removeALL_R = GUICtrlCreateRadio('Remove all includes', 16, 249, 257, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$removeUnneeded_R = GUICtrlCreateRadio('Remove only unneeded includes', 16, 273, 257, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$removeNothing_R = GUICtrlCreateRadio('Remove nothing', 16, 297, 257, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUIStartGroup()
	GUICtrlCreateGroup('', -99, -99, 1, 1)
	GUICtrlCreateGroup('Inlcudes Placement', 0, 325, 289, 97)
	GUIStartGroup()
	$insertTop_R = GUICtrlCreateRadio('Insert at top of script', 16, 341, 257, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$insertAfterKeyword_R = GUICtrlCreateRadio('Insert after keyword', 16, 365, 213, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUIStartGroup()
	$keyword_I = GUICtrlCreateInput(IniRead($settingsINI, 'Options', 'Keyword', ''), 96, 389, 185, 21)
	GUICtrlSetFont(-1, 9.5, 700)

	$keyword_L = GUICtrlCreateLabel('Keyword  : ', 16, 393, 75, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUICtrlCreateGroup('', -99, -99, 1, 1)

	GUICtrlCreateGroup('Start Options', 0, 425, 289, 97)
	$silentMode_CHB = GUICtrlCreateCheckbox('SilentMode', 16, 441, 257, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$autoRestart_CHB = GUICtrlCreateCheckbox('AutoRestart', 16, 465, 213, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	$copyToClipboard_CHB = GUICtrlCreateCheckbox('Copy includes to clipboard', 16, 489, 213, 17)
	GUICtrlSetFont(-1, 9.5, 700)

	GUICtrlCreateGroup('', -99, -99, 1, 1)
	#endregion ### GUI section ###

	$original_source = _getSource() ; read source code
	Local $stripped_source = _stripSourceCode($original_source) ; strip source code (comments and empty lines)
;~ 	ConsoleWrite($stripped_source & @CRLF)

	$includesIni_ScriptDir &= StringRegExpReplace($scriptDirPath, '\W', '') & '.ini'

	#region ### Search Release or Beta Version (settings the controls) ###
	Switch IniRead($settingsINI, 'Options', 'searchBeta', 0)
		Case 0
			GUICtrlSetState($releaseV_R, $GUI_CHECKED)
			GUICtrlSetState($betaV_R, $GUI_UNCHECKED)
		Case 1
			GUICtrlSetState($releaseV_R, $GUI_UNCHECKED)
			GUICtrlSetState($betaV_R, $GUI_CHECKED)
	EndSwitch
	If $betaInstallPath = '' Then
		GUICtrlSetState($releaseV_R, $GUI_CHECKED)
		GUICtrlSetState($betaV_R, $GUI_DISABLE)
		GUICtrlSetState($betaV_I, $GUI_DISABLE)
	EndIf
	; Search also in UDFsDir and ScriptDir?
	If RegRead('HKCU\Software\AutoIt v3\Autoit', 'Include') = '' Then
		GUICtrlSetState($UDFsDir_CHB, $GUI_UNCHECKED)
		GUICtrlSetState($UDFsDir_CHB, $GUI_DISABLE)
	Else
		If IniRead($settingsINI, 'Options', 'SearchUDFsDir', 0) = 1 Then GUICtrlSetState($UDFsDir_CHB, $GUI_CHECKED)
	EndIf

	If IniRead($settingsINI, 'Options', 'SearchScriptDir', 1) = 1 Then GUICtrlSetState($scriptDir_CHB, $GUI_CHECKED)
	; What should be removend by OI? (all includes, all unneeded, nothing)
	Switch IniRead($settingsINI, 'Options', 'Remove', 0)
		Case 0
			GUICtrlSetState($removeALL_R, $GUI_CHECKED)
		Case 1
			GUICtrlSetState($removeUnneeded_R, $GUI_CHECKED)
		Case 2
			GUICtrlSetState($removeNothing_R, $GUI_CHECKED)
	EndSwitch
	; Where should the includes be inserted? (at top of the script, or after a given keyword)
	If IniRead($settingsINI, 'Options', 'InsertIncludes', 0) = 1 Then
		GUICtrlSetState($insertTop_R, $GUI_CHECKED)
		GUICtrlSetState($keyword_I, $GUI_HIDE)
		GUICtrlSetState($keyword_L, $GUI_HIDE)
	Else
		GUICtrlSetState($insertAfterKeyword_R, $GUI_CHECKED)
		GUICtrlSetState($keyword_I, $GUI_SHOW)
		GUICtrlSetState($keyword_L, $GUI_SHOW)
	EndIf
	#endregion ### Search Release or Beta Version (settings the controls) ###
	; Get the status for searching from settings.ini
	$r = IniRead($settingsINI, 'Options', 'SearchRelease', 1)
	$b = IniRead($settingsINI, 'Options', 'SearchBeta', 0)
	$u = IniRead($settingsINI, 'Options', 'searchUDFsDir', 0)
	$s = IniRead($settingsINI, 'Options', 'searchScriptDir', 1)

	_prepareINI($r, $b, $u, $s)

	; filling the object ($objV_ALL) with the functions and stuff from the 4 different pathes
	If $r = 1 Then _setHash($objV_ALL, $includesIni_Release)
	If $b = 1 Then _setHash($objV_ALL, $includesIni_Beta)
	If $u = 1 Then _setHash($objV_ALL, $includesIni_UDF)
	If $s = 1 Then _setHash($objV_ALL, $includesIni_ScriptDir)

;~ 	_ObjDictList($objV_ALL, 'Elemente: Objekt Dictionary')

	#region workflow, description
	;===============================================================================
	; 1) Searching for the called functions in source code
	; 2) Remove not relevant functions from the used functions
	;	a) remove functions which are declared in the script itself
	;	b) remove Autoit3 build-in functions
	;	c) remove Autoit3 build-in keywords, because the regex catches somthing like
	;	if $b and($bla +10) ... as a function call [and(]
	;
	; Searching for the declared includes
	; Checking the includes against each other
	; If declared then set green else set yellow
	;===============================================================================
	#endregion workflow, description
	Local $usedFunctions_A = _getFunctionCallsFromSource($stripped_source)
;~ 	_ArrayDisplay($usedFunctions_A, 'USED functions')
	If $usedFunctions_A <> -1 Then
		$usedFunctions_A = _stripUsedFunctions($stripped_source, $usedFunctions_A)
;~ 		_ArrayDisplay($usedFunctions_A, 'USED functions after all :-)')
		_checkFunctions($objV_ALL, $usedFunctions_A)
	EndIf
	Local $usedVariables_A = _getVariablesFromSource($stripped_source)

	If $usedVariables_A <> -1 Then
		$usedVariables_A = __ArrayUnique($usedVariables_A)
		If @error Then ConsoleWrite('!_getVariablesFromSource _ArrayUnique' & @CRLF)
		_checkVariables($objV_ALL, $usedVariables_A)
	EndIf

	;===============================================================================
	; Searching for the needed includes
	; Searching for the declared includes
	; Checking the includes against each other
	; If declared then set green else set yellow
	;===============================================================================
	Local $declaredIncludes_A = _getDeclaredIncludes($stripped_source)
;~ 	_ArrayDisplay($declaredIncludes_A, '$declaredIncludes_A')
	If $declaredIncludes_A <> -1 Then
		$declaredIncludes_A = _ArrayUnique($declaredIncludes_A)
;~ 		_ArrayDisplay($declaredIncludes_A, '$declaredIncludes_A')
		If @error Then ConsoleWrite('!_getDeclaredIncludes _ArrayUnique' & @CRLF)
		_checkIncludes($objV_Includes, $declaredIncludes_A)
	EndIf

	_checkSQLLite($objV_Includes, $declaredIncludes_A, $stripped_source)

;~ 	_ObjDictList($objV_Includes, 'Zustand der Includes')

	Local $keyArray = $objV_Includes.Keys
	If UBound($keyArray) Then
		Switch $sort
			Case 1
				_ArraySort($keyArray, 0, 0, 0, 0)
			Case 2
				_ArraySortLen($keyArray)
			Case Else ; no sorting (just the colours)
		EndSwitch

		Local $colour
		For $key In $keyArray
			$colour = _ObjDictGetValue($objV_Includes, $key)
			Switch $colour
				Case $colour_GREEN
					GUICtrlCreateListViewItem($includesFormatStart & $key & $includesFormatEnd & '|' & $status_A[0], $includes_LV)
					_ArrayAdd($green_A, $includesFormatStart & $key & $includesFormatEnd)
				Case $colour_YELLOW
					GUICtrlCreateListViewItem($includesFormatStart & $key & $includesFormatEnd & '|' & $status_A[1], $includes_LV)
					_ArrayAdd($yellow_A, $includesFormatStart & $key & $includesFormatEnd)
				Case $colour_RED
					GUICtrlCreateListViewItem($includesFormatStart & $key & $includesFormatEnd & '|' & $status_A[2], $includes_LV)
					_ArrayAdd($red_A, $key)
			EndSwitch
			GUICtrlSetBkColor(-1, $colour)
		Next
	EndIf

	_GUICtrlStatusBar_SetText($status_SB, @TAB & StringFormat('%06.4f', Round(TimerDiff($start_T) / 1000, 4)) & ' sec', 2) ; set time

	; Check silent mode
	If IniRead($settingsINI, 'Options', 'SilentMode', '0') = 1 Then
		; ###
		$original_source = _deleteIncludes($original_source)
		_insertIncludes($original_source)
		SendSciTE_Command('menucommand:104')
		Exit (0)
	Else
;~ 		If Not @Compiled Then
		GUISetState(@SW_SHOW)
	EndIf

	#region main-while
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $organizeIncludes_B
;~ 				SendSciTE_Command('menucommand:106')
				$original_source = _deleteIncludes($original_source)
				_insertIncludes($original_source)
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Includes organized', 1)
				SendSciTE_Command('menucommand:104')
				If _getCheckboxState($autoRestart_CHB) Then _restart()
			Case $GUI_EVENT_CLOSE
				Exit (0)
			Case $insertAfterKeyword_R
				GUICtrlSetState($keyword_L, $GUI_SHOW)
				GUICtrlSetState($keyword_I, $GUI_SHOW)
				GUICtrlSetState($keyword_I, $GUI_FOCUS)
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Inserting afer keyword', 1)
			Case $insertTop_R
				GUICtrlSetState($keyword_L, $GUI_HIDE)
				GUICtrlSetState($keyword_I, $GUI_HIDE)
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Inserting at top of script', 1)
			Case $releaseV_R
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Using Release version', 1)
			Case $betaV_R
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Using Beta version', 1)
			Case $includes_LV
				ConsoleWrite('listview clicked' & @CRLF)
			Case $settings_B
				_settings($GUI)
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Openenig settings ... ', 1)
			Case $exit_B
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'exiting ...', 1)
				_saveOptions()
				Exit (0)
			Case $restart_B
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Restarting ...', 1)
				_saveOptions()
				Sleep(100)
				_restart()
			Case $renewINI_B
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Recreating selected ini files ... ', 1)
				_saveOptions()
				$r = IniRead($settingsINI, 'Options', 'SearchRelease', 1)
				$b = IniRead($settingsINI, 'Options', 'SearchBeta', 0)
				$u = IniRead($settingsINI, 'Options', 'searchUDFsDir', 0)
				$s = IniRead($settingsINI, 'Options', 'searchScriptDir', 1)
				If $r = 1 Then $r = 2
				If $b = 1 Then $b = 2
				If $u = 1 Then $u = 2
				If $s = 1 Then $s = 2
				_prepareINI($r, $b, $u, $s)
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'All Ini-files created', 1)
			Case $help_B
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Opening helpfile ...', 1)
				ShellExecute(@ScriptDir & '\OI_help.pdf')
			Case $thread_B
				_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Starting thread in Autoit forum ...', 1)
				ShellExecute('http://www.autoitscript.com/forum/index.php?showtopic=111554')
			Case $UDFsDir_CHB
				If _getCheckboxState($UDFsDir_CHB) Then
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Searching in UDFsDir activ', 1)
				Else
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Searching in UDFsDir inactiv', 1)
				EndIf
			Case $scriptDir_CHB
				If _getCheckboxState($scriptDir_CHB) Then
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Searching in ScriptDir activ', 1)
				Else
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'Searching in ScriptDir inactiv', 1)
				EndIf
			Case $silentMode_CHB
				If _getCheckboxState($silentMode_CHB) Then
					GUICtrlSetState($autoRestart_CHB, $GUI_DISABLE)
					GUICtrlSetState($autoRestart_CHB, $GUI_UNCHECKED)
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'SilentMode activ', 1)
				Else
					GUICtrlSetState($autoRestart_CHB, $GUI_ENABLE)
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'SilentMode inactiv', 1)
				EndIf
			Case $autoRestart_CHB
				If _getCheckboxState($autoRestart_CHB) Then
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'AutoRestart activ', 1)
				Else
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'AutoRestart inactiv', 1)
				EndIf
			Case $copyToClipboard_CHB
				If _getCheckboxState($copyToClipboard_CHB) Then
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'CopyToClipboard activ', 1)
				Else
					_GUICtrlStatusBar_SetText($status_SB, @TAB & 'CopyToClipboard inactiv', 1)
				EndIf
		EndSwitch
	WEnd
	Exit
EndFunc   ;==>_main
#endregion main-while

;===============================================================================
; Description: If a declared include is found in the object (holding the needed includes)
; then set colour green else set colour
;===============================================================================
Func _checkIncludes(ByRef $objV, ByRef $declaredIncludes_A)
	For $i = 1 To $declaredIncludes_A[0]
		If _ObjDictSearch($objV, $declaredIncludes_A[$i]) Then
			_ObjDictSetValue($objV_Includes, $declaredIncludes_A[$i], $colour_GREEN)
		Else
			_ObjDictAdd($objV_Includes, $declaredIncludes_A[$i], $colour_RED)
		EndIf
	Next
EndFunc   ;==>_checkIncludes

;===============================================================================
; Description: Checking the used functions against the object holding all functions
; if a used-function is found, then add the include file to the object(holding the includes with colours)
;===============================================================================
Func _checkFunctions(ByRef $objV, ByRef $usedFuncs_A)
	Local $includeFile = 0
	For $i = 1 To UBound($usedFuncs_A) - 1
		If _ObjDictSearch($objV, $usedFuncs_A[$i]) Then
			$includeFile = _ObjDictGetValue($objV, $usedFuncs_A[$i])
			_ObjDictAdd($objV_Includes, $includeFile, $colour_YELLOW)
;~ 		 		 		 		 ConsoleWrite('!' & $usedFuncs_A[$i] & " needs == " & $objValue & @CRLF)
			ConsoleWrite('+> ' & $usedFuncs_A[$i] & _
					_StringRepeat(' ', 50 - StringLen($usedFuncs_A[$i])) & Chr(151) & '> ' & $includeFile & '' & @CRLF)
		Else
;~ 			ConsoleWrite($usedFuncs_A[$i] & ' nicht vorhanden' & @CRLF)
		EndIf
	Next
EndFunc   ;==>_checkFunctions

;===============================================================================
; Description: Checking the used variables against the object holding all functions and variables
; if a used-variable is found, then add the include file to the object(holding the includes with colours)
; with colour yellow and write to Scite console.
;===============================================================================
Func _checkVariables(ByRef $objV, ByRef $usedVars_A)
	Local $objValue = 0, $includeFile = 0

	For $i = 1 To UBound($usedVars_A) - 1
		If _ObjDictSearch($objV, $usedVars_A[$i]) Then
			$includeFile = _ObjDictGetValue($objV, $usedVars_A[$i])
			_ObjDictAdd($objV_Includes, $includeFile, $colour_YELLOW)
			ConsoleWrite('+> ' & $usedVars_A[$i] & _
					_StringRepeat(' ', 50 - StringLen($usedVars_A[$i])) & Chr(151) & '> ' & $includeFile & '' & @CRLF)
		Else
;~ 			ConsoleWrite($usedVars_A[$i] & ' nicht vorhanden' & @CRLF)
		EndIf
	Next
EndFunc   ;==>_checkVariables

; ---------------------------------------------------------- getSource ---------------------------------------------------------
;===============================================================================
; Description: Get the source from the actual script opened in SciTE.
; Get the path to the script and the scriptname.
; Set the scriptname to $filename_I in the GUI
; Returning the source code. On error exit(0).
;===============================================================================
Func _getSource()
	If @Compiled Then
		If Not $cmdline[0] > 0 Then
			_showParameterHelp()
		ElseIf $cmdline[1] = 'silentOff' Then
			GUICtrlSetState($autoRestart_CHB, $GUI_UNCHECKED)
			IniWrite($settingsINI, 'Options', 'SilentMode', 0)
		ElseIf $cmdline[1] = '-?' Or $cmdline[1] = '/?' Then
			_showParameterHelp()
		Else
			$filename = $cmdline[1]
			$scriptDirPath = StringLeft($filename, StringInStr($filename, '\', Default, -1))
			GUICtrlSetData($filename_I, StringMid($filename, StringInStr($filename, '\', 2, -1) + 1, 100))
		EndIf
	Else
		If Not ProcessExists('SciTE.exe') Then Exit (0)
		Local $opt = Opt('WinTitleMatchMode', 4)
		SendSciTE_Command('askfilename:')
		$SciTECmd = StringReplace($SciTECmd, '\\', '\')
		$filename = StringTrimLeft($SciTECmd, StringInStr($SciTECmd, ':', Default, 3))
		$scriptDirPath = StringLeft($filename, StringInStr($filename, '\', Default, -1))
		GUICtrlSetData($filename_I, StringMid($filename, StringInStr($filename, '\', 2, -1) + 1, 100))
		SendSciTE_Command('menucommand:106')
		Opt('WinTitleMatchMode', $opt)
	EndIf

	; Open File
	Local $h_file = FileOpen($filename, 0)
	If $h_file = -1 Then
		MsgBox(16, 'Error', 'Could not open file : ' & $filename, 5)
		Exit (0)
	EndIf
	; Read file
	$original_source = FileRead($h_file)
	If @error Then
		MsgBox(16, 'Error', 'Could not read file : ' & $filename, 5)
		Exit (0)
	EndIf
	FileClose($h_file)
;~ 	MsgBox(0, $filename, $original_source) ; Ausgabe des Quellcodes
	Return $original_source
EndFunc   ;==>_getSource
; ---------------------------------------------------------- getSource ---------------------------------------------------------
; ---------------------------------------------------------- WriteINI ----------------------------------------------------------
;===============================================================================
; Description: Searching the file for Global Const variables and functions
; Writing them into an ini file.
;===============================================================================
; Create new includes.ini with funcs and settings/options
Func _writeIniFile($path, $sectionName, $iniPath)
	Local $debug = False
	Local $functions, $FileList

	$FileList = _FileListToArray($path, '*.au3', 1)
	If @error = 1 Or @error = 4 Then
		ConsoleWrite($path & ' not found' & @CRLF)
		Return 1
	EndIf

	For $i = 1 To $FileList[0]
		If StringInStr($FileList[$i], 'Constants') = 0 Then
			; Search for functions
			If $debug Then ConsoleWrite($i & ' : ' & $path & $FileList[$i] & @CRLF)
			$functions = StringRegExp(FileRead(FileOpen($path & '\' & $FileList[$i], 0)), '(?i)(?<=Func )[0-9a-zA-Z_]+[ ]*(?=\()', 3)
			If IsArray($functions) And UBound($functions) > 1 Then
				IniWrite($iniPath, $sectionName & ' Functions', $FileList[$i], _ArrayToString($functions, ';'))
			ElseIf IsArray($functions) Then
				IniWrite($iniPath, $sectionName & ' Functions', $FileList[$i], $functions[0])
			EndIf
		Else
			; Search for constants
			If $debug Then ConsoleWrite($i & ' x: ' & $path & $FileList[$i] & @CRLF)
			$functions = StringRegExp(FileRead(FileOpen($path & '\' & $FileList[$i], 0)), '(?i)Global Const (\$\w*)', 3) ; maybe (?i) for case-insensitive flag
			If IsArray($functions) And UBound($functions) > 1 Then
				IniWrite($iniPath, $sectionName & ' Constants', $FileList[$i], _ArrayToString($functions, ';'))
			ElseIf IsArray($functions) Then
				IniWrite($iniPath, $sectionName & ' Constants', $FileList[$i], $functions[0])
			EndIf
		EndIf
	Next

	IniWrite($iniPath, 'Options', 'Created', @YEAR & '/' & @MON & '/' & @MDAY & ' - ' & @HOUR & ':' & @MIN & ':' & @SEC)
	Return 1
EndFunc   ;==>_writeIniFile
;===============================================================================
; Description: Getting all includes pathes from the registry key.
;===============================================================================
Func _getUDFPathes(ByRef $reg)
	Local $splitted = 0
	If StringInStr($reg, ';') Then
		$splitted = StringSplit($reg, ';', 2)
		$splitted = _ArrayUnique($splitted)
		Return $splitted
	Else
		Local $re[1]
		$re[0] = $reg
		Return $re
	EndIf
EndFunc   ;==>_getUDFPathes
; ---------------------------------------------------------- WriteINI ----------------------------------------------------------
;===============================================================================
; Description: Sending commands to SciTE interface
;===============================================================================
Func SendSciTE_Command($sCmd, $Wait_For_Return_Info = 0)
	Local $WM_COPYDATA = 74
	Local $WM_GETTEXT = 0x000D
	Local $WM_GETTEXTLENGTH = 0x000E224
	Local Const $SCI_GETLINE = 2153
	Local $Scite_hwnd = WinGetHandle('DirectorExtension') ; Get SciTE DIrector Handle
	Local $My_Hwnd = GUICreate('AutoIt3-SciTE interface') ; Create GUI to receive SciTE info
	Local $My_Dec_Hwnd = Dec(StringTrimLeft($My_Hwnd, 2)) ; Convert my Gui Handle to decimal
	$sCmd = ':' & $My_Dec_Hwnd & ':' & $sCmd ; Add dec my gui handle to commandline to tell SciTE where to send the return info
;~ 	ConsoleWrite('SciTE Command  --> ' & $sCmd & @LF)
	Local $CmdStruct = DllStructCreate('Char[' & StringLen($sCmd) + 1 & ']')
	DllStructSetData($CmdStruct, 1, $sCmd)
	Local $COPYDATA = DllStructCreate('Ptr;DWord;Ptr')
	DllStructSetData($COPYDATA, 1, 1)
	DllStructSetData($COPYDATA, 2, StringLen($sCmd) + 1)
	DllStructSetData($COPYDATA, 3, DllStructGetPtr($CmdStruct))
	DllCall('User32.dll', 'None', 'SendMessage', 'HWnd', $Scite_hwnd, _
			'Int', $WM_COPYDATA, 'HWnd', $My_Hwnd, _
			'Ptr', DllStructGetPtr($COPYDATA))
	GUIDelete($My_Hwnd)
EndFunc   ;==>SendSciTE_Command
;===============================================================================
; Description: Sending commands to SciTE interface
;===============================================================================
Func MY_WM_COPYDATA($hWnd, $msg, $wParam, $lParam)
	Local $COPYDATA = DllStructCreate('Ptr;DWord;Ptr', $lParam)
	Local $SciTECmdLen = DllStructGetData($COPYDATA, 2)
	Local $CmdStruct = DllStructCreate('Char[255]', DllStructGetData($COPYDATA, 3))
	$SciTECmd = StringLeft(DllStructGetData($CmdStruct, 1), $SciTECmdLen)
EndFunc   ;==>MY_WM_COPYDATA

; ---------------------------------------------------------- Scite commands ----------------------------------------------------------
;===============================================================================
; Description:
;===============================================================================
Func _stripSourceCode(ByRef $source)
	Local $noComment_source = $source
	_stripComments($noComment_source)
	$noComment_source = StringStripWS($noComment_source, 7) ; dopeelte Leerzeichen/Umbrüche entfernen
	Return $noComment_source
EndFunc   ;==>_stripSourceCode

Func _stripComments(ByRef $string)
	;Author: Prog@ndy
	$string = StringReplace(StringReplace($string, "#comments-start", "#cs", 0, 2), "#comments-end", "#ce", 0, 2)
	$string = StringRegExpReplace($string, "(?m)(?s)(?i)^\h*#cs\b([^#]|#[^c]|#c[^s])*?\v\h*#ce\b", '') ; remove simple block comments
	#region remove nested block-comments
	Local $match, $depth, $offset, $start, $CommentsAfterce
	While 1
		$depth = 0
		$match = StringRegExp($string, "(?i)(?m)^\h*#cs\b", 1)
		$start = @extended
		If @error Then ExitLoop
		Do
			$match = StringRegExp($string, "(?i)(?m)^\h*#c([se])\b", 1, $offset)
			$offset = @extended
			Select
				Case @error
					Return False
				Case $match[0] = "e"
					$depth -= 1
				Case Else
					$depth += 1
			EndSelect
		Until $depth < 1

		$string = StringLeft($string, $start - 4) & StringRegExpReplace(StringMid($string, $offset), ".*", '', 1)
;~         $string = StringLeft($string, $start-4) & StringMid($string, $offset)
	WEnd
	#endregion remove nested block-comments
	$string = StringRegExpReplace($string, '(?m)^((?:[^''";]*([''"]).*?\2)*[^;]*);.*$', '\1') ; remove one-line comments
	Return True
EndFunc   ;==>_stripComments

;===============================================================================
; Description: Get all variabels from source code. Return as array
;===============================================================================
Func _getVariablesFromSource(ByRef $source)
	Local $allVars_A
	$allVars_A = StringRegExp($source, '\$\w+', 3)
	If IsArray($allVars_A) Then Return $allVars_A
	Return -1
EndFunc   ;==>_getVariablesFromSource
;===============================================================================
; Description: Get all functions called in source code.
; First extra step for functions called via Call(...)
; Second extra step for functions called via GUIRegisterMsg(...)
; Maybe I add extra step for functions called via Execute(...)
;===============================================================================
Func _getFunctionCallsFromSource(ByRef $source)
	Local $usedFunctions_A, $call_A, $GUIRegisterMsg_A
;~ 	$usedFunctions_A = StringRegExp($source, '(?i)(?<!\.)\b(\w+)[ ]*\(\h*[\(\)|\w|\$]', 3) ;best
;~ 	$usedFunctions_A = StringRegExp($source, '(?i)(?<!\.|\\|\$|Func\s*)\b(\w+?)[ \t]*\(', 3) ; test
;~ 	$usedFunctions_A = StringRegExp($source, '(?<!\.|\\)\b(\w+)[ \t]*\(.*?\)', 3) ; geht auch
	$usedFunctions_A = StringRegExp($source, '(?<!\.|\\|\$)\b(\w+?)[ \t]*\(', 3) ; test

	If StringInStr($source, 'call', 2) Then
		$call_A = StringRegExp($source, '(?i)call\s*\(\s*[\x22\x27](\w+)', 3) ; ggf. umstellen auf Stringfunktionen
		If IsArray($call_A) Then _ArrayConcatenate($usedFunctions_A, $call_A)
	EndIf

	If StringInStr($source, 'GUIRegisterMsg', 2) Then
		$GUIRegisterMsg_A = StringRegExp($source, '(?i)GUIRegisterMsg\s*\(\s*\$\w+\s*,\s*[\x22\x27](\w+)', 3) ; ggf. umstellen auf Stringfunktionen
		If IsArray($GUIRegisterMsg_A) Then _ArrayConcatenate($usedFunctions_A, $GUIRegisterMsg_A)
	EndIf
	If IsArray($usedFunctions_A) Then Return $usedFunctions_A
	Return -1
EndFunc   ;==>_getFunctionCallsFromSource
;===============================================================================
; Description: Get all functions declared in source code.
;===============================================================================
Func _getDeclaredFunctions(ByRef $source)
	Local $declaredFunctions_A
;~ 		 $declaredFunctions_A = StringRegExp($source, '(?:[Ff]unc\s+)(\w*)(?:\s*\()', 3) ; ggf. speed
	$declaredFunctions_A = StringRegExp($source, '(?i)(?:Func\s+)(\w*)(?:\s*\()', 3)
	If IsArray($declaredFunctions_A) Then Return $declaredFunctions_A
	Return -1
EndFunc   ;==>_getDeclaredFunctions
;===============================================================================
; Description: Get Autoit functions for checking them later against the used ones
;===============================================================================
Func _getAutoitFuncs(ByRef $InstallPath, $FilePath = '..\Au3Defs\au3.keywords.properties')
	$FilePath = FileGetLongName('..\Au3Defs\au3.keywords.properties', 1)
	Local $file, $fileContent, $Au3Functions_A, $sArray, $onlyKeyWords_A
	$file = FileOpen($FilePath, 0)
	If $file = -1 Then
		MsgBox(16, 'ERROR', 'Could not read the au3.keywords.properties', 5)
		Return 0
	EndIf
	$fileContent = FileRead($file)
	FileClose($file)

	$Au3Functions_A = StringRegExp($fileContent, '\w+', 3)
	$sArray = _ArrayToString($Au3Functions_A, '|')
	$onlyKeyWords_A = StringRegExp($sArray, '(?s)functions\|(.*?)(?=\|au3)', 3)
	$onlyKeyWords_A = StringSplit($onlyKeyWords_A[0], '|', 2)
	Return $onlyKeyWords_A
EndFunc   ;==>_getAutoitFuncs
;===============================================================================
; Description: Get the Autoit keywords for checking them later against the used functions
;===============================================================================
Func _getAutoitKeywords(ByRef $InstallPath, $FilePath = '..\Au3Defs\au3.keywords.properties')
	$FilePath = FileGetLongName('..\Au3Defs\au3.keywords.properties', 1)
	Local $file, $fileContent, $au3Keywords_A
	$file = FileOpen($FilePath, 0)
	If $file = -1 Then
		MsgBox(16, 'ERROR', 'Could not read the au3.keywords.properties', 5)
		Return 0
	EndIf

	$fileContent = FileRead($file)
	FileClose($file)

	$au3Keywords_A = _StringBetween($fileContent, 'keywords=', 'au3')
	$au3Keywords_A = StringRegExp($au3Keywords_A[0], '\w+', 3)
	Return $au3Keywords_A
EndFunc   ;==>_getAutoitKeywords
;===============================================================================
; Description:
;===============================================================================
Func _prepareINI($release = 1, $beta = 0, $UDFDir = 0, $scriptDir = 0)
	If $release = 1 And $beta = 1 Then $beta = 0 ; Make sure only one version is used

	; Release version

	If FileExists($includesIni_Release) = 0 Or (IniRead($settingsINI, 'Version', 'Release', 0) <> $InstallVersion) Or $release = 2 Then
		Switch $release
			Case -1
				FileDelete($includesIni_Release)
			Case 1, 2
				; getInfo for Autoit Release Version
				FileDelete($includesIni_Release)
				_writeIniFile($InstallPath & '\Include', 'Release', $includesIni_Release)
		EndSwitch
		Local $Au3Functions_A = _getAutoitFuncs($InstallPath)
		IniWrite($includesIni_Release, 'AU3', 'Functions', _ArrayToString($Au3Functions_A, ';'))
		Local $au3Keywords_A = _getAutoitKeywords($InstallPath)
		IniWrite($includesIni_Release, 'AU3', 'Keywords', _ArrayToString($au3Keywords_A, ';'))
	EndIf

	; Beta version

	If FileExists($includesIni_Beta) = 0 Or (IniRead($settingsINI, 'Version', 'Beta', 0) <> $betaInstallVersion) Or $beta = 2 Then
		; Beta version
		Switch $beta
			Case 1, 2
				If $betaInstallPath <> '' Then
					; getInfo for Autoit Release Version
					FileDelete($includesIni_Beta)
					_writeIniFile($betaInstallPath & '\Include', 'Beta', $includesIni_Beta)
				EndIf
			Case -1
				FileDelete($includesIni_Beta)
		EndSwitch
	EndIf

	; UDF directory

	If FileExists($includesIni_UDF) = 0 Or $UDFDir = 2 Then
		Local $regValue = RegRead('HKCU\Software\AutoIt v3\Autoit', 'Include')
		If $regValue <> '' Then
			; UDF path
			Switch $UDFDir
				Case 1, 2
					FileDelete($includesIni_UDF)
					; getInfo for for all UDF pathes
					Local $udf_Pathes_A = _getUDFPathes($regValue)
					If IsArray($udf_Pathes_A) Then
						For $i = 0 To UBound($udf_Pathes_A) - 1
							_writeIniFile($udf_Pathes_A[$i], 'UDF', $includesIni_UDF)
						Next
					Else
						ConsoleWrite('No UDF PATH Array!' & @CRLF)
					EndIf
				Case -1
					FileDelete($includesIni_UDF)
			EndSwitch
		Else
;~ 			ConsoleWrite('!' & 'No udf path found : RegRead("HKCU\Software\AutoIt v3\Autoit", "Include")' & @CRLF)
		EndIf
	EndIf

	; Script directory

	If FileExists($includesIni_ScriptDir) = 0 Or $scriptDir = 2 Then
		; ScriptDir
		Switch $scriptDir
			Case 1, 2
				FileDelete($includesIni_ScriptDir)
				_writeIniFile($scriptDirPath, 'ScriptDir', $includesIni_ScriptDir)
				IniWrite($includesIni_ScriptDir, 'Options', 'Path', $scriptDirPath)
			Case -1
				FileDelete($includesIni_ScriptDir)
		EndSwitch
	EndIf
	Return 1
EndFunc   ;==>_prepareINI
;===============================================================================
; Description: Filling the object(holding all variables and functions) with the values read from the ini files
;===============================================================================
Func _setHash(ByRef $objV, ByRef $iniPath)
	Local $lines_A, $re, $v

	If Not _FileReadToArray($iniPath, $lines_A) Then
		MsgBox(4096, 'setHash', 'Error occurred, probably no ini file: ' & @CRLF & $iniPath)
		Exit (0)
	EndIf
;~ 		 _ArrayDisplay($lines_A)
	For $i = 1 To $lines_A[0]
		If StringInStr(StringLeft($lines_A[$i], 50), '.au3', 2) <> 0 Then
			$re = StringSplit($lines_A[$i], '=', 2)
			If StringInStr($re[1], ';') Then
				$v = StringSplit($re[1], ';', 2)
				For $y = 0 To UBound($v) - 1
;~ 		 		 	 ConsoleWrite($v[$y] & ' - ' & $re[0] & @CRLF)
					_ObjDictAdd($objV, $v[$y], $re[0])
				Next
			Else
				_ObjDictAdd($objV, $re[1], $re[0])
			EndIf
		EndIf
	Next
EndFunc   ;==>_setHash
;===============================================================================
; Description: Get the used functions
;		1 delete all functions used double
;		2 delete all Autoit key functions which do NOT need an include
;		3 delete all functions declared in the script
;===============================================================================
Func _stripUsedFunctions(ByRef $stripped_source, ByRef $usedFunctions_A)
	Local $index
	; Now - delete the doubled used functions
;~ 	$usedFunctions_A = _ArrayUnique($usedFunctions_A)
	$usedFunctions_A = __ArrayUnique($usedFunctions_A)
	Local $declaredFunctions_A = _getDeclaredFunctions($stripped_source)
	; Now - delete the declared functions
	If $declaredFunctions_A <> -1 Then
		For $i = UBound($usedFunctions_A) - 1 To 1 Step -1
			$index = _ArraySearch($declaredFunctions_A, $usedFunctions_A[$i])
			If $index <> -1 Then _ArrayDelete($usedFunctions_A, $i)
		Next
;~ 		_ArrayDisplay($usedFunctions_A, 'USED functions 2')
	EndIf

	Local $Au3Functions_A = StringSplit(IniRead($includesIni_Release, 'AU3', 'Functions', 0), ';', 2)

	; Now - delete the Autoit functions
	For $i = UBound($usedFunctions_A) - 1 To 1 Step -1
		$index = _ArraySearch($Au3Functions_A, $usedFunctions_A[$i])
		If $index <> -1 Then _ArrayDelete($usedFunctions_A, $i)
	Next
;~ _ArrayDisplay($usedFunctions_A, 'USED functions 3')
	Local $au3Keywords_A = StringSplit(IniRead($includesIni_Release, 'AU3', 'Keywords', 0), ';', 2)

	; Now - delete the Autoit keywords
	For $i = UBound($usedFunctions_A) - 1 To 1 Step -1
		$index = _ArraySearch($au3Keywords_A, $usedFunctions_A[$i])
		If $index <> -1 Then _ArrayDelete($usedFunctions_A, $i)
	Next
;~ 		 _ArrayDisplay($usedFunctions_A, 'USED functions 4')
	If IsArray($usedFunctions_A) Then Return $usedFunctions_A
	Return -1
EndFunc   ;==>_stripUsedFunctions
;===============================================================================
; Description: Get all declared includes in the source code.
; Attention : Till now, there is no check for includes in includes!!!
;===============================================================================
Func _getDeclaredIncludes(ByRef $source)
	; ggf. Rekursivität einbauen für includes in inludes
	Local $declaredIncludes_A
;~ 	$declaredIncludes_A = StringRegExp($source, '(?i)(?=\A|\s)\s*#include\s*[\x3c\x22\x27]*(.*?\.au3)', 3) ; Autoit bug?
	$declaredIncludes_A = StringRegExp($source, '(?i)(?=\A|\s)\s*#include\s*[\x3c\x22\x27]*([^\r\n]+?\.au3)', 3)
	If IsArray($declaredIncludes_A) Then Return $declaredIncludes_A
	Return -1
EndFunc   ;==>_getDeclaredIncludes
;===============================================================================
; Description: Extra step for sqllite, because there a two includes for one AU3-library
;===============================================================================
Func _checkSQLLite(ByRef $objV_Includes, ByRef $declaredIncludes_A, ByRef $stripped_source)
	; Extra step for <SQLite.au3>, <sqllite.dll.au3>
	If StringRegExp($stripped_source, '_SQLite_Startup[ ]*\(', 0) = 1 Then
		If _ArraySearch($declaredIncludes_A, 'SQLite.au3') <> -1 Then
			_ObjDictSetValue($objV_Includes, 'SQLite.au3', $colour_GREEN)
		Else
			_ObjDictAdd($objV_Includes, 'SQLite.au3', $colour_YELLOW)
		EndIf
;~ 		_ArrayDisplay($declaredIncludes_A)
		If _ArraySearch($declaredIncludes_A, 'SQLite.dll.au3') <> -1 Then
			_ObjDictSetValue($objV_Includes, 'SQLite.dll.au3', $colour_GREEN)
		Else
			_ObjDictAdd($objV_Includes, 'SQLite.dll.au3', $colour_YELLOW)
		EndIf
	EndIf
EndFunc   ;==>_checkSQLLite
;===============================================================================
; Description: Writing the initial settings to settings.ini
;===============================================================================
Func _initialSettings()
	; Version info
	IniWrite($settingsINI, 'Version', 'Beta', $betaInstallVersion)
	IniWrite($settingsINI, 'Version', 'Release', $InstallVersion)
	; Options
	IniWrite($settingsINI, 'Options', 'SearchRelease', 1)
	IniWrite($settingsINI, 'Options', 'SearchBeta', 0)
	IniWrite($settingsINI, 'Options', 'SearchUDFsDir', 0)
	IniWrite($settingsINI, 'Options', 'SearchScriptDir', 1)
	IniWrite($settingsINI, 'Options', 'Green', '0x80FF80')
	IniWrite($settingsINI, 'Options', 'Yellow', '0xFFFF80')
	IniWrite($settingsINI, 'Options', 'Red', '0xEF3D4A')
	IniWrite($settingsINI, 'Options', 'Keyword', '') ; could be #Region Includes
	IniWrite($settingsINI, 'Options', 'Remove', 0)
	IniWrite($settingsINI, 'Options', 'InsertIncludes', 1)
	IniWrite($settingsINI, 'Options', 'IncludesFormatStart', '#include <')
	IniWrite($settingsINI, 'Options', 'IncludesFormatEnd', '>')
	; ### Next Version
;~ 	IniWrite($settingsINI, 'Options', 'IncludesFormatScriptDirStart', '#include "')
;~ 	IniWrite($settingsINI, 'Options', 'IncludesFormatScriptDirEnd', '"')
	IniWrite($settingsINI, 'Options', 'SilentMode', 0)
	IniWrite($settingsINI, 'Options', 'AutoRestart', 0)
	IniWrite($settingsINI, 'Options', 'CopyToClipboard', 0)
	IniWrite($settingsINI, 'Options', 'Sort', 1)
;~ 	IniWrite($settingsINI, 'Options', 'LastRUN', 'Release')
;~ 	IniWrite($settingsINI, 'Language', 'Language', 'English')
;~ 	IniWrite($settingsINI, 'Language', 'LanguageIniPath', 'language.ini')
	IniWrite($settingsINI, 'Options', 'Created', @YEAR & '/' & @MON & '/' & @MDAY & ' - ' & @HOUR & ':' & @MIN & ':' & @SEC)
EndFunc   ;==>_initialSettings
;===============================================================================
; Description: Saving the settings to settings.ini when OI exits via exit Button
;===============================================================================
; Save settings before exit
Func _saveOptions()
	If _getCheckboxState($removeALL_R) Then
		IniWrite($settingsINI, 'Options', 'Remove', 0)
	ElseIf _getCheckboxState($removeUnneeded_R) Then
		IniWrite($settingsINI, 'Options', 'Remove', 1)
	ElseIf _getCheckboxState($removeNothing_R) Then
		IniWrite($settingsINI, 'Options', 'Remove', 2)
	EndIf

	If _getCheckboxState($insertAfterKeyword_R) Then
		IniWrite($settingsINI, 'Options', 'InsertIncludes', 0)
	Else
		IniWrite($settingsINI, 'Options', 'InsertIncludes', 1)
	EndIf

	IniWrite($settingsINI, 'Version', 'Release', $InstallVersion)
	IniWrite($settingsINI, 'Version', 'Beta', $betaInstallVersion)

	If _getCheckboxState($releaseV_R) Then
		IniWrite($settingsINI, 'Options', 'SearchRelease', 1)
		IniWrite($settingsINI, 'Options', 'SearchBeta', 0)
	Else
		IniWrite($settingsINI, 'Options', 'SearchRelease', 0)
		IniWrite($settingsINI, 'Options', 'SearchBeta', 1)
	EndIf

	If _getCheckboxState($insertAfterKeyword_R) Then IniWrite($settingsINI, 'Options', 'Keyword', GUICtrlRead($keyword_I))

	If _getCheckboxState($UDFsDir_CHB) Then
		IniWrite($settingsINI, 'Options', 'SearchUDFsDir', 1)
	Else
		IniWrite($settingsINI, 'Options', 'SearchUDFsDir', 0)
	EndIf

	If _getCheckboxState($scriptDir_CHB) Then
		IniWrite($settingsINI, 'Options', 'SearchScriptDir', 1)
	Else
		IniWrite($settingsINI, 'Options', 'SearchScriptDir', 0)
	EndIf

	If _getCheckboxState($silentMode_CHB) Then
		IniWrite($settingsINI, 'Options', 'SilentMode', 1)
	Else
		IniWrite($settingsINI, 'Options', 'SilentMode', 0)
	EndIf

	If _getCheckboxState($autoRestart_CHB) Then
		IniWrite($settingsINI, 'Options', 'AutoRestart', 1)
	Else
		IniWrite($settingsINI, 'Options', 'AutoRestart', 0)
	EndIf

	If _getCheckboxState($copyToClipboard_CHB) Then
		IniWrite($settingsINI, 'Options', 'CopyToClipboard', 1)
	Else
		IniWrite($settingsINI, 'Options', 'CopyToClipboard', 0)
	EndIf
EndFunc   ;==>_saveOptions

;===============================================================================
; Description:
;===============================================================================
; using image list to set 1 image and have text on button
Func _GetImageListHandle($sFile, $nIconID = 0, $fLarge = False)
	Local $iSize = 16
	If $fLarge Then $iSize = 32

	Local $hImage = _GUIImageList_Create($iSize, $iSize, 5, 3)
	If StringUpper(StringMid($sFile, StringLen($sFile) - 2)) = 'BMP' Then
		_GUIImageList_AddBitmap($hImage, $sFile)
	Else
		_GUIImageList_AddIcon($hImage, $sFile, $nIconID, $fLarge)
	EndIf
	Return $hImage
EndFunc   ;==>_GetImageListHandle
;===============================================================================
; Description: Open a dialog to view the ini files
;===============================================================================
Func _settings(ByRef $GUI)
	Local $file = FileOpenDialog('Choose the ini', @ScriptDir, 'INI files (*.ini)', 3, 'settings.ini', $GUI)
	If Not @error Then ShellExecute($file)
EndFunc   ;==>_settings
;===============================================================================
; Function Name: _restart()
; Description: Restarting the script
;===============================================================================
Func _restart()
	SendSciTE_Command('menucommand:420')
	Run('"' & @AutoItExe & '" ' & '/AutoIt3ExecuteScript "' & @ScriptFullPath & '"', '', @SW_HIDE)
	Exit (0)
EndFunc   ;==>_restart
;===============================================================================
; Description: Setting the keywords Input control background colour to red
; if the string isn't found in the source code
;===============================================================================
Func MY_WM_COMMAND($hWnd, $msg, $wParam, $lParam)
	Local $controlID = _WinAPI_LoWord($wParam)
	If $controlID = $keyword_I Then
		If Not StringInStr($original_source, GUICtrlRead($keyword_I), 2) Or StringLen(GUICtrlRead($keyword_I)) < 3 Then
			GUICtrlSetBkColor($keyword_I, 0xFF0000)
		Else
			GUICtrlSetBkColor($keyword_I, 0xFFFFFF)
		EndIf
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_WM_COMMAND
;===============================================================================
; Description: Delete the includes
; a) all
; b) only unnedded includes are deleted
;===============================================================================
Func _deleteIncludes(ByRef $original_source)
	;all
	If _getCheckboxState($removeALL_R) Then
		If StringLeft($original_source, 2) <> @CRLF Then $original_source = @CRLF & $original_source
		Return StringReplace(StringRegExpReplace($original_source, '(?i)(\v\h*#include\s*[\x3c\x22\x27].*?\v)', ''), @CRLF, '', 1)
	ElseIf _getCheckboxState($removeUnneeded_R) Then
		; unneded
		; alle roten bekommen und dann die zeilen löschen
		For $i = 1 To UBound($red_A) - 1
			$original_source = StringRegExpReplace($original_source, '(?i)\s*#include\s*[\x3c\x22\x27]' & $red_A[$i] & '[\x3e\x22\x27]', '')
		Next
	EndIf
	Return $original_source
EndFunc   ;==>_deleteIncludes
;==============================================================================
; Description: Inserting all includes
; Copying includes to clipboard if checkbox is checked
;===============================================================================
Func _insertIncludes(ByRef $original_source)
	Local $includes, $kw = GUICtrlRead($keyword_I), $hfile = 0
	$includes = _ArrayToString($green_A, '|', 1)
	$includes &= '|' & _ArrayToString($yellow_A, '|', 1)
	If $includes = '' Then Return 1

	Local $includes_A = StringSplit($includes, '|', 2)
	Switch $sort
		Case 1
			_ArraySort($includes_A, 0)
		Case 2
			_ArraySortLen($includes_A)
		Case Else
	EndSwitch

	$includes = _ArrayToString($includes_A, @CRLF)
	$includes = StringStripWS($includes, 3)

	If _getCheckboxState($insertAfterKeyword_R) And $kw <> '' Then
		If StringInStr($original_source, $kw, 2) <> 0 Then
			Local $before = StringRegExp($original_source, '(?s)(\A.*?' & $kw & '.*?\r\n)', 3)
			If @error Then SetError(1)
			Local $after = StringRegExp($original_source, $kw & '(?s)(.*)', 3)
			If @error Then SetError(2)

			If IsArray($before) And IsArray($after) Then
				$hfile = FileOpen($filename, 2)
				; Check if file opened for reading OK
				If $hfile = -1 Then
					MsgBox(0, 'Error', 'Unable to open file: ' & $filename & ' in write mode 1', 5)
					Exit (0)
				EndIf
				FileWrite($hfile, $before[0])
				FileWrite($hfile, $includes)
				FileWrite($hfile, $after[0])
				FileClose($hfile)
			Else
				ConsoleWrite('Insert Regex  _insertIncludes() error' & @CRLF)
				Return 0
			EndIf
		Else
			MsgBox(16, '_insertIncludes function', 'Insert after keyword error, because the keyword was not found!' & @CRLF)
			Exit (0)
		EndIf
	Else
		$hfile = FileOpen($filename, 2)
		; Check if file opened for reading OK
		If $hfile = -1 Then
			MsgBox(0, 'Error', 'Unable to open file: ' & $filename & ' in write mode 2', 5)
			Exit (0)
		EndIf
		If FileWrite($hfile, $includes & @CRLF & $original_source) <> 1 Then
			MsgBox(16, 'Error', 'Source has not been changed!', 5)
		EndIf
		FileClose($hfile)
	EndIf
	If _getCheckboxState($copyToClipboard_CHB) Then
		ClipPut('')
		ClipPut($includes)
	EndIf
EndFunc   ;==>_insertIncludes
;===============================================================================
; Description: Show the parameter for use of OI without SciTE
;===============================================================================
Func _showParameterHelp()
	MsgBox(64, 'Parameter help', 'Parameter: ' & @CRLF & '==========' & @CRLF & @CRLF & _
			'To start "Organize Includes" via commandline use ' & @CRLF & @CRLF & _
			'1. parameter' & @TAB & ': full path to the AutoIt script file ' & @CRLF & @CRLF & _
			'Example: ' & @CRLF & '==========' & @CRLF & _
			'OrganizeIncludes.exe "C:\folder\yourScript.au3"' & @CRLF & @CRLF & _
			'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' & @CRLF & _
			'To switch off silent mode use : OrganizeIncludes.exe silentOff', 30)
	Exit (0)
EndFunc   ;==>_showParameterHelp
;===============================================================================
; Description:
;===============================================================================
Func _getIncludesOfIncludes()
	; #### TO DO
EndFunc   ;==>_getIncludesOfIncludes

;==================================================================================================
; Parameter: $MODE
;                  0 Binär (default)
;                  1 Text
; Return:    Objekt Handle
;==================================================================================================
Func _ObjDictCreate($MODE = 0)
	Local $oDICT = ObjCreate('Scripting.Dictionary')
	If $MODE <> 0 Then $oDICT.CompareMode = 1
	Return $oDICT
EndFunc   ;==>_ObjDictCreate

;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
;            $KEY   - Schlüssel
;            $VALUE - Wert
; Return:    Erfolg:   0
;            Fehler:  -1
;        Fehlerwert:   1  Objekt existiert nicht
;                      2  Schlüssel ohne Inhalt übergeben
;                      3  Wert hat keinen Inhalt
;                      4  Schlüssel bereits vorhanden
;==================================================================================================
Func _ObjDictAdd(ByRef $oDICT, $key, $VALUE)
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	ElseIf $key = '' Then
		SetError(2)
		Return -1
	ElseIf $VALUE = '' Then
		SetError(3)
		Return -1
	ElseIf $oDICT.Exists($key) Then
		SetError(4)
		Return -1
	EndIf
	$oDICT.Add($key, $VALUE)
	Return 0
EndFunc   ;==>_ObjDictAdd

;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
;            $KEY   - Schlüssel
; Return:    Erfolg:  Wert des Schlüssels
;            Fehler:  -1
;        Fehlerwert:   1  Objekt existiert nicht
;                      2  Schlüssel ohne Inhalt übergeben
;                      5  Schlüssel nicht vorhanden
;==================================================================================================
Func _ObjDictGetValue(ByRef $oDICT, $key)
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	ElseIf $key = '' Then
		SetError(2)
		Return -1
	ElseIf Not $oDICT.Exists($key) Then
		SetError(5)
		Return -1
	EndIf
	Return $oDICT.Item($key)
EndFunc   ;==>_ObjDictGetValue

;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
;            $KEY   - Schlüssel
;            $VALUE - Wert
; Return:    Erfolg:   0
;            Fehler:  -1
;        Fehlerwert:   1  Objekt existiert nicht
;                      2  Schlüssel ohne Inhalt übergeben
;                      3  Wert hat keinen Inhalt
;                      5  Schlüssel nicht vorhanden
;==================================================================================================
Func _ObjDictSetValue(ByRef $oDICT, $key, $VALUE)
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	ElseIf $key = '' Then
		SetError(2)
		Return -1
	ElseIf $VALUE = '' Then
		SetError(3)
		Return -1
	ElseIf Not $oDICT.Exists($key) Then
		SetError(5)
		Return -1
	EndIf
	$oDICT.Item($key) = $VALUE
	Return 0
EndFunc   ;==>_ObjDictSetValue

;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
; Return:    Erfolg:  Anzahl der Schlüssel-Wert Paare
;            Fehler:   -1
;        Fehlerwert:   1  Objekt existiert nicht
;==================================================================================================
Func _ObjDictCount(ByRef $oDICT)
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	EndIf
	Return $oDICT.Count
EndFunc   ;==>_ObjDictCount

;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
;            $KEY   - Schlüssel
; Return:    Erfolg:  TRUE    Schlüssel vorhanden
;                     FALSE   Schlüssel nicht vorhanden
;            Fehler:  -1
;        Fehlerwert:   1  Objekt existiert nicht
;                      2  Schlüssel ohne Inhalt übergeben
;==================================================================================================
Func _ObjDictSearch(ByRef $oDICT, $key)
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	ElseIf $key = '' Then
		SetError(2)
		Return -1
	ElseIf Not $oDICT.Exists($key) Then
		Return False
	Else
		Return True
	EndIf
EndFunc   ;==>_ObjDictSearch
;==================================================================================================
; Parameter: $oDICT - Handle des Dictionary-Objektes
;            $TITLE - Fenstertitel (optional)
; Return:    Erfolg:   GUI mit ListView
;            Fehler:  -1
;        Fehlerwert:   1  Objekt existiert nicht
; Requirements:       #include <GuiConstants.au3>
;                     #include <GuiListView.au3>
;==================================================================================================
Func _ObjDictList(ByRef $oDICT, $TITLE = 'Elemente: Objekt Dictionary')
	If Not IsObj($oDICT) Then
		SetError(1)
		Return -1
	EndIf
	Local $count = $oDICT.Count
	Local $SaveMode = Opt("GUIOnEventMode", 0), $ListGUI, $oDictLV, $btnClose, $msg
	$ListGUI = GUICreate($TITLE, 600, 400, (@DesktopWidth - 600) / 2, (@DesktopHeight - 400) / 2)
	$btnClose = GUICtrlCreateButton('&Ende', 40, 360, 70, 22)
	GUICtrlSetResizing($btnClose, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlDelete($oDictLV)
	$oDictLV = GUICtrlCreateListView('Schlüssel|Wert', 10, 10, 580, 340, BitOR($LVS_SHOWSELALWAYS, _
			$LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
	If $count > 0 Then
		Local $strKey, $colKeys = $oDICT.Keys
		For $strKey In $colKeys
			GUICtrlCreateListViewItem($strKey & '|' & $oDICT.Item($strKey), $oDictLV)
		Next
	Else
		WinSetTitle($ListGUI, '', 'Das Objekt Dictionary enthält keine Elemente!')
	EndIf
	GUISetState(@SW_SHOW, $ListGUI)
	While 1
		$msg = GUIGetMsg(1)
		If $msg[1] = $ListGUI And _
				($msg[0] = $GUI_EVENT_CLOSE Or $msg[0] = $btnClose) Then ExitLoop
	WEnd
	GUIDelete($ListGUI)
	Opt("GUIOnEventMode", $SaveMode)
EndFunc   ;==>_ObjDictList

Func _ArraySortLen(ByRef $ar_A)
	If Not IsArray($ar_A) Then Return 0
	Local $helper_A[UBound($ar_A)][2]
	For $i = 0 To UBound($ar_A) - 1
		$helper_A[$i][0] = $ar_A[$i]
		$helper_A[$i][1] = StringLen($ar_A[$i])
	Next
	_ArraySort($helper_A, 0, 0, 0, 1)
	For $y = 0 To UBound($helper_A) - 1
		$ar_A[$y] = $helper_A[$y][0]
	Next
EndFunc   ;==>_ArraySortLen

Func __ArrayUnique(ByRef $aArray, $vDelim = '', $iBase = 0, $iUnique = 1)
	If $vDelim = '' Then $vDelim = Chr(01)
	Local $sHold
	For $iCC = $iBase To UBound($aArray) - 1
		If Not StringInStr($vDelim & $sHold, $vDelim & $aArray[$iCC] & $vDelim, $iUnique) Then _
				$sHold &= $aArray[$iCC] & $vDelim
	Next
	Return StringSplit(StringTrimRight($sHold, StringLen($vDelim)), $vDelim)
EndFunc   ;==>__ArrayUnique

Func _getCheckboxState($controlID)
	Return BitAND(GUICtrlRead($controlID), $GUI_CHECKED)
EndFunc   ;==>_getCheckboxState
