#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w 7
#cs
	Program Created By:				          	SoftwareSpot
	Last Textual Changes In This Script:		7th April 2012
	The Program Can Be Run By Selecting: 		<SciTE Jump.exe>

	Thanks To The Following...

	Icon --> http://icons.mysitemyway.com/category/yellow-road-sign-icons/
	Help --> http://www.scintilla.org/SciTEDirector.html
	Additional --> Based on the original idea's from...
	Ashalshaikh/wakillon: http://www.autoitscript.com/forum/topic/119544-scite-Jump-01-jump-to-any-line-by-one-click/
	Melba23: http://www.autoitscript.com/forum/topic/109558-new-scite4autoit3-available-with-scite-v179/page__view__findpost__p__901838

	License:
	Quickly navigate between functions and regions in an AutoIt script.
	Copyright (C) 2011-2012 SoftwareSpot

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	Idea:
	_SciTE_Send_Command($__SciTEDummy[1], $__SciTEDummy[4], "menucommand:235") ; IDM_EXPAND
	_SciTE_Send_Command($__SciTEDummy[1], $__SciTEDummy[4], "menucommand:409") ; IDM_TOGGLEOUTPUT
	_SciTE_Output("Output to Console" & @CRLF)
#ce
#NoTrayIcon

#AutoIt3Wrapper_Icon=Bin\ICON_1.ico
#AutoIt3Wrapper_Outfile=SciTE Jump.exe
#AutoIt3Wrapper_UseUpx=N
#AutoIt3Wrapper_Res_Description=Quickly navigate between functions and regions in an AutoIt script.
#AutoIt3Wrapper_Res_Fileversion=1.13.36.40
#AutoIt3Wrapper_Res_LegalCopyright=SoftwareSpot (C) 2011-2012
#AutoIt3Wrapper_Res_Language=2057
#AutoIt3Wrapper_Res_Field=Website|
#AutoIt3Wrapper_Res_Field=E-Mail|comment at the website
#AutoIt3Wrapper_UseX64=Y
#AutoIt3Wrapper_Run_Obfuscator=Y
#Obfuscator_Parameters=/SF /SV /OM /CS=0 /CN=0
#AutoIt3Wrapper_res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Outfile_Type=exe
#AutoIt3Wrapper_Compile_Both=Y

#include <GUIButton.au3>
#include <GUIComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GUIEdit.au3>
#include <GUIMenu.au3>
#include <GUITreeView.au3>
#include <WinAPIEx.au3> ; Download From http://www.autoitscript.com/forum/topic/98712-winapiex-udf/ by Yashied.

#include "Includes\_CRC32ForFile.au3"
#include "Includes\_Language.au3"

Global $__SciTEDummy[6] = [5, -1, -1, -1, WinGetHandle("DirectorExtension"), WinGetHandle("[CLASS:SciTEWindow]")] ; GUI Handle, Returned Data, Dec Handle, Director Handle, SciTE Window.
Global $__SingletonEx = "63AB7D4A-D7E3-4E4D-85B1-393CBF5A0441" ; Main GUI handle & _SingletonEx.
Local $__DummyVariable = ""

_INIUnicode(@ScriptDir & "\Settings.ini")
_SetVariables()

_IsRestarted() ; Check the application wasn't restarted.
_IsX64() ; Run the x64 version of SciTE Jump.

If _IsSciTEActive() = 0 Then
	$__DummyVariable = _GetFullPath(IniRead(@ScriptDir & "\Settings.ini", "General", "SciTE", ""), @ScriptDir)
	If FileExists($__DummyVariable) Then
		Run($__DummyVariable)
		_WinWait("DirectorExtension", 5)
	EndIf

	_GetHandles()
	If _IsSciTEActive() = 0 Then
		Exit MsgBox(16, _GetLanguage('ERROR', 'An unexpected error occurred.'), _GetLanguage('SCITE_ERROR', 'SciTE needs to be running for %PROGRAMNAME% to function correctly.'))
	EndIf
EndIf

_Update()

$__SingletonEx = _SingletonEx($__SingletonEx)
If @error Then
	$__DummyVariable = Number(IniRead(@ScriptDir & "\Settings.ini", "General", "FailCount", 0))
	If $__DummyVariable >= 3 Then
		$__DummyVariable = _OSArch()
		ProcessClose("SciTE Jump" & $__DummyVariable & ".exe")
		Exit Run("SciTE Jump" & $__DummyVariable & ".exe", @ScriptDir & "/", @SW_SHOW)
	EndIf
	IniWrite(@ScriptDir & "\Settings.ini", "General", "FailCount", $__DummyVariable + 1)
	$__DummyVariable = _SingletonEx_Get()
	WinActivate($__DummyVariable)
	_GUIInBounds($__DummyVariable)
	Exit
EndIf

OnAutoItExitRegister("_Exit")

Global $__CurrentFile[5] = [4, -1, -1, -1, -1], $__Combo, $__GUI, $__Height, $__HeightMinimum, $__LanguageItems[8][5] = [[7, 5]], _
		$__LanguageRefresh, $__Width, $__WidthMinimum ; GUI.
Global $__FindItems[2][4] = [[0, 4, 0, -1],[-1, -1, -1, -1]], $__SearchItems[2][4] = [[0, 4, 0, -1],[-1, -1, -1, -1]], $__TreeViewItems[2][4] = [[0, 4, 0, -1],[-1, -1, -1, -1]] ; TreeView.
Global $__About, $__Add, $__AddHeader = 0, $__Animate = 1, $__FindInFile = 0, $__FindInput, $__FunctionSnippet = 0, $__Help, $__IsGUIRegister = 0, $__IsSort = _Is("Sort", 0), $__LineInput, _
		$__Refresh, $__Restart, $__ToggleFold = 0 ; Misc.
Global $__SearchInput, $__SearchText ; Search.
Global $__TreeView, $__TreeViewCurrent, $__TreeViewFind, $__TreeViewSearch ; TreeView.

Global $__ContextMenu, $__ContextSubMenu, $__Language[25], $__ContextMenuLanguage[3], $__ExportDummy[6] = [5] ; System ContextMenu.
Global Enum $__ContextMenu1, $__ContextMenu2, $__ContextMenu3, $__ContextMenu4, $__ContextMenu5
_EnumArray($__Language, 5, 1)

$__DummyVariable = 0 ; Empty the dummy variable.

_Main()

Func _Main()
	Local $hFind ; Handles.
	Local $iClear, $iExport, $iExportContext, $iExportContextItem1, $iExportContextItem2, $iExportContextItem3, $iExportContextItem4, $iExportContextItem5, _
			$iExportContextMenu, $iFolder ; ControlID's.
	Local $aControl, $aHistory, $aLanguage[1][5] = [[0, 5, 0]], $bGreen = 0x00FF00, $bRed = 0xFF0000, $iCount, $iMsg, $sFolder, $sIcon, $sHelpPath = @ScriptDir & "\HelpFile.chm::/html", $sReturn, $sSciTEPath
	$__Height = @DesktopHeight - 215
	$__Width = 215
	Local $iLeft = @DesktopWidth - $__Width - 25, $iTop = (@DesktopHeight / 2) - ($__Height / 2)

	IniWrite(@ScriptDir & "\Settings.ini", "General", "FailCount", 0) ; Reset Fail count.

	$aControl = ControlGetPos($__SciTEDummy[5], "", "[CLASS:Scintilla; INSTANCE:1]")
	If @error = 0 Then
		$__Width = 215
		$__Height = $aControl[3] - 50
		$iLeft = @DesktopWidth - $__Width - 25
		$iTop = $aControl[1] + 50
	EndIf

	$__WidthMinimum = $__Width
	$__HeightMinimum = $__Height

	$sSciTEPath = _SaveSciTEPath()

	$__GUI = GUICreate(_GetTitle(), $__Width, $__Height, $iLeft, $iTop, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_SIZEBOX), $WS_EX_ACCEPTFILES, $__SciTEDummy[5])

	If $sSciTEPath <> "" Then
		If FileExists(_WinAPI_PathRemoveFileSpec($sSciTEPath) & '\Scite4AutoIt3.chm') Then
			$sHelpPath = _WinAPI_PathRemoveFileSpec($sSciTEPath) & '\Scite4AutoIt3.chm' & "::"
		EndIf
	EndIf
	If FileExists($sHelpPath) Then
		GUISetHelp('"' & @WindowsDir & '\hh.exe" "' & $sHelpPath & '/SciTEJump_Doc.htm"', $__GUI)
	EndIf

	_SciTE_SetInternal($__GUI)
	_SingletonEx_Set($__GUI)

	$__Refresh = GUICtrlCreateButton("&" & _GetLanguage('REFRESH', 'Refresh'), $__Width - 90, 5, 85, 25)
	GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKSIZE + $GUI_DOCKTOP)
	_LanguageAdd($aLanguage, -1, $__Refresh, 'REFRESH', 'Refresh', "&")

	$__SearchInput = GUICtrlCreateInput("", 10, 40, $__Width - 60, 20)
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT + $GUI_DOCKTOP)
	GUICtrlSendMsg($__SearchInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_3', 'Search Functions'))

	$__LineInput = GUICtrlCreateInput("", $__Width - 50, 40, 40, 20)
	GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKSIZE + $GUI_DOCKTOP)
	GUICtrlSendMsg($__LineInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_4', 'Line'))

	$__FindInput = GUICtrlCreateInput("", 10, $__Height - 50, $__Width - 45, 20)
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT + $GUI_DOCKBOTTOM)
	$hFind = GUICtrlGetHandle(-1)
	GUICtrlSendMsg($__FindInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_5', 'Search in Scripts'))

	$iFolder = GUICtrlCreateButton(" ", $__Width - 32.5, $__Height - 50, 30, 20, $BS_ICON)
	GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKSIZE + $GUI_DOCKBOTTOM)
	_GUICtrlButton_SetImage(GUICtrlGetHandle(-1), @SystemDir & "\shell32.dll", "4") ; Folder Icon.

	$__Combo = _GUICtrlComboBoxEx_Create($__GUI, "", 10, $__Height - 25, $__Width - 45, 260, $CBS_DROPDOWNLIST)
	$iClear = GUICtrlCreateButton(" ", $__Width - 32.5, $__Height - 25, 30, 20, $BS_ICON)
	GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKSIZE + $GUI_DOCKBOTTOM)
	If _IsWindowsVersion() Then ; Windows Vista+.
		$sIcon = "238"
		_GUICtrlComboBox_SetCueBanner($__Combo, _GetLanguage('TIP_SEARCH_6', 'Folder to Search'))
	Else
		$sIcon = -240
	EndIf
	_GUICtrlButton_SetImage(GUICtrlGetHandle(-1), @SystemDir & "\shell32.dll", $sIcon) ; Refresh Icon.

	$iExport = GUICtrlCreateButton("&" & _GetLanguage('EXPORT', 'Export'), $__Width - 180, 5, 85, 25)
	GUICtrlSetResizing(-1, $GUI_DOCKRIGHT + $GUI_DOCKSIZE + $GUI_DOCKTOP)
	_LanguageAdd($aLanguage, -1, $iExport, 'EXPORT', 'Export', "&")
	$iExportContext = GUICtrlCreateDummy()
	$iExportContextMenu = GUICtrlCreateContextMenu($iExportContext)
	$iExportContextItem1 = GUICtrlCreateMenuItem(_GetLanguage('HTML', 'HTML'), $iExportContextMenu)
	$iExportContextItem2 = GUICtrlCreateMenuItem(_GetLanguage('LATEX', 'LATEX'), $iExportContextMenu)
	$iExportContextItem3 = GUICtrlCreateMenuItem(_GetLanguage('PDF', 'PDF'), $iExportContextMenu)
	$iExportContextItem4 = GUICtrlCreateMenuItem(_GetLanguage('RTF', 'RTF'), $iExportContextMenu)
	GUICtrlCreateMenuItem("", $iExportContextMenu)
	$iExportContextItem5 = GUICtrlCreateMenuItem(_GetLanguage('FUNCTION_LIST', 'Function and Region list'), $iExportContextMenu)

	_LanguageAdd($aLanguage, -1, $iExportContextItem1, 'HTML', 'HTML')
	_LanguageAdd($aLanguage, -1, $iExportContextItem3, 'LATEX', 'LATEX')
	_LanguageAdd($aLanguage, -1, $iExportContextItem3, 'PDF', 'PDF')
	_LanguageAdd($aLanguage, -1, $iExportContextItem4, 'RTF', 'RTF')
	_LanguageAdd($aLanguage, -1, $iExportContextItem5, 'FUNCTION_LIST', 'Function and Region list')

	Local $iEnter = GUICtrlCreateDummy(), $iSearch = GUICtrlCreateDummy()
	$__About = GUICtrlCreateDummy()
	$__Add = GUICtrlCreateDummy()
	$__Help = GUICtrlCreateDummy()
	$__LanguageRefresh = GUICtrlCreateDummy()
	$__Restart = GUICtrlCreateDummy()

	For $A = 1 To $__ExportDummy[0]
		$__ExportDummy[$A] = GUICtrlCreateDummy()
	Next

	$aHistory = StringSplit(IniRead(@ScriptDir & "\Settings.ini", "General", "History", ""), "|")
	If @error = 0 Then
		For $A = 1 To $aHistory[0] - 1
			_GUICtrlComboBoxEx_AddString($__Combo, $aHistory[$A], $A - 1, $A - 1)
		Next
		_GUICtrlComboBoxEx_SetCurSel($__Combo, $aHistory[$aHistory[0]])
	EndIf

	_System_ContextMenu($__GUI)
	_System_ContextMenuEx()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUIRegisterMsg($WM_COPYDATA, "WM_COPYDATA")
	GUIRegisterMsg($WM_GETMINMAXINFO, "WM_GETMINMAXINFO")
	GUIRegisterMsg($WM_SIZE, "WM_SIZE")
	GUIRegisterMsg($WM_SYSCOMMAND, "WM_SYSCOMMAND")
	_GUIRegisterMsg(1)

	GUISetState(@SW_SHOW, $__GUI)

	Local $aAcceleratorKeys[2][2] = [["{ENTER}", $iEnter],["^f", $iSearch]]
	GUISetAccelerators($aAcceleratorKeys, $__GUI)

	_SciTE_Monitor()
	AdlibRegister("_SciTE_Monitor", 500)

	_WinAPI_EmptyWorkingSet()
	While 1
		$iMsg = GUIGetMsg()
		Switch $iMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $GUI_EVENT_DROPPED
				If _WinAPI_PathIsDirectory(@GUI_DragFile) Then
					_HistoryAdd($__Combo, StringReplace(@GUI_DragFile, "\\", "\"))
					_Flash($__GUI, $bGreen)
				ElseIf _IsValidFileType(@GUI_DragFile, "au3;nsi;vbs") Then
					_SciTE_Open(@GUI_DragFile)
					_Flash($__GUI, $bGreen)
				Else
					_Flash($__GUI, $bRed)
				EndIf

			Case $__About
				MsgBox(64, _ProgramName() & " - V" & _WinAPI_ExpandEnvironmentStrings("%VERSION%"), _GetLanguage("ABOUT", "%PROGRAMNAME% is an application that allows you to jump quickly between functions and regions in an AutoIt script. Works with only the full version of SciTE. @NL @NL The application has been created by %COPYRIGHT%.") & _
						@CRLF & @CRLF & _
						_GetLanguageAuthor('LANGUAGE_AUTHOR', 'Thanks to %LANGUAGEAUTHOR% for the %LANGUAGE% translation. The translation was created on the %LANGUAGEUPDATED%.'), 0, $__GUI)

			Case $__Add
				_AddSciTEJump()
				If @error Then
					ContinueLoop
				EndIf
				_GUICtrlMenu_RemoveMenu($__ContextMenu, $__ContextMenuLanguage[0])

			Case $iClear
				_GUICtrlComboBoxEx_ResetContent($__Combo)

			Case $iEnter
				Switch _WinAPI_GetFocus()
					Case $hFind
						_GUICtrlComboBoxEx_GetItemText($__Combo, _GUICtrlComboBoxEx_GetCurSel($__Combo), $sFolder)
						If $sFolder = "" Then
							$sFolder = @ScriptDir & "\"
						EndIf
						$__FindInFile = 1
						GUICtrlSetData($__Refresh, "&" & _GetLanguage('CANCEL', 'Cancel'))
						GUICtrlSetState($__TreeView, $GUI_HIDE)
						_Find(GUICtrlRead($__FindInput), $sFolder)
						If @error = 1 Then
							ControlClick($__GUI, "", $__Refresh)
						EndIf
						GUICtrlSetData($__Refresh, "&" & _GetLanguage('REFRESH', 'Refresh'))

				EndSwitch

			Case $iExport
				_GUICtrlButton_ContextMenuEx($__GUI, $iExport, $iExportContextMenu)

			Case $iExportContextItem1, $__ExportDummy[1]
				_SciTE_ExportToHtml()
				If @error Then
					_Flash($__GUI, $bRed)
				Else
					_Flash($__GUI, $bGreen)
				EndIf

			Case $iExportContextItem2, $__ExportDummy[2]
				_SciTE_ExportToLatex()
				If @error Then
					_Flash($__GUI, $bRed)
				Else
					_Flash($__GUI, $bGreen)
				EndIf

			Case $iExportContextItem3, $__ExportDummy[3]
				_SciTE_ExportToPDF()
				If @error Then
					_Flash($__GUI, $bRed)
				Else
					_Flash($__GUI, $bGreen)
				EndIf

			Case $iExportContextItem4, $__ExportDummy[4]
				_SciTE_ExportToRTF()
				If @error Then
					_Flash($__GUI, $bRed)
				Else
					_Flash($__GUI, $bGreen)
				EndIf

			Case $iExportContextItem5, $__ExportDummy[5]
				_Export_FunctionRegionList()
				If @error Then
					_Flash($__GUI, $bRed)
				Else
					_Flash($__GUI, $bGreen)
				EndIf

			Case $iFolder
				$sFolder = FileSelectFolder(_GetLanguage('FOLDER_SELECT', 'Select a folder to search for a specific keyword.'), "", 2, @ScriptDir & "\", $__GUI) & "\"
				If @error Then
					ContinueLoop
				EndIf
				_HistoryAdd($__Combo, StringReplace($sFolder, "\\", "\"))

			Case $__Help
				If $sHelpPath <> "" Then
					Run('"' & @WindowsDir & '\hh.exe" "' & $sHelpPath & '\Scite4AutoIt3.chm::/SciTEJump_Doc.htm"')
				EndIf

			Case $__LanguageRefresh
				_LanguageUpdate($aLanguage)
				_LanguageUpdate($__LanguageItems)
				GUICtrlSendMsg($__SearchInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_3', 'Search Functions'))
				GUICtrlSendMsg($__LineInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_4', 'Line'))
				GUICtrlSendMsg($__FindInput, $EM_SETCUEBANNER, False, _GetLanguage('TIP_SEARCH_5', 'Search in Scripts'))
				If _IsWindowsVersion() Then ; Windows Vista+.
					_GUICtrlComboBox_SetCueBanner($__Combo, _GetLanguage('TIP_SEARCH_6', 'Folder to Search'))
				EndIf
				_GUICtrlMenu_SetItemText($__ContextMenu, 0, _GetLanguage('MENU_RESTART', 'Restart'))
				_GUICtrlMenu_SetItemText($__ContextMenu, 1, _GetLanguage('MENU_SORT', 'Sort functions'))
				_GUICtrlMenu_SetItemText($__ContextMenu, 2, _GetLanguage('MENU_LANGUAGE', 'Language'))
				_GUICtrlMenu_SetItemText($__ContextMenu, $__ContextMenuLanguage[0], _GetLanguage('MENU_ADD', 'Add to SciTE'))
				_GUICtrlMenu_SetItemText($__ContextMenu, $__ContextMenuLanguage[1], _GetLanguage('MENU_ABOUT', 'About'))
				_GUICtrlMenu_SetItemText($__ContextMenu, $__ContextMenuLanguage[2], _GetLanguage('MENU_HELP', 'Help file'))

			Case $__Refresh
				$__FindInFile = 0
				$__FindItems[0][0] = 0
				$__SearchItems[0][0] = 0

				$__TreeViewCurrent = $__TreeView
				GUICtrlSetState($__TreeView, $GUI_SHOW)

				GUICtrlSetData($__SearchInput, "")

				GUICtrlSetState($__TreeViewFind, $GUI_HIDE)
				GUICtrlDelete($__TreeViewFind)
				GUICtrlSetState($__TreeViewSearch, $GUI_HIDE)
				GUICtrlDelete($__TreeViewSearch)

				_GUIRegisterMsg(1)
				_ArrayEmpty($__CurrentFile)
				_SciTE_Monitor()

			Case $__Restart
				OnAutoItExitUnRegister("_Exit")
				_SciTE_SaveSession(@ScriptDir & "\session.dat")
				_SciTE_Quit()
				Exit Run('"' & @ScriptFullPath & '"' & ' /Restart "' & $sSciTEPath & '"', @ScriptDir & "\", @SW_SHOW)

			Case $iSearch
				ControlClick($__GUI, "", $__SearchInput)

			Case $__TreeViewItems[0][3]
				_SciTE_GoToLine(0)

			Case $__FindItems[1][0] To $__FindItems[$__FindItems[0][0]][0]
				For $A = 1 To $__FindItems[0][0]
					If $iMsg = $__FindItems[$A][0] Then
						_SciTE_Open($__FindItems[$A][2])
						ExitLoop
					EndIf
				Next

			Case $__SearchItems[1][0] To $__SearchItems[$__SearchItems[0][0]][0]
				For $A = 1 To $__SearchItems[0][0]
					If $iMsg = $__SearchItems[$A][0] Then
						If $__FindInFile Then
							_SciTE_Open($__SearchItems[$A][2])
						Else
							_SciTE_Find($__SearchItems[$A][2])
							_LineUp()
						EndIf
						ExitLoop
					EndIf
				Next

			Case $__TreeViewItems[1][0] To $__TreeViewItems[$__TreeViewItems[0][0]][0]
				For $A = 1 To $__TreeViewItems[0][0]
					If $iMsg = $__TreeViewItems[$A][0] Then
						If $__AddHeader Then
							$__AddHeader = 0
							_SciTE_Find($__TreeViewItems[$A][2])
							_SciTE_Send_Command($__SciTEDummy[1], $__SciTEDummy[4], "menucommand:1134") ; Run Header Function.
						ElseIf $__FunctionSnippet Then
							$__FunctionSnippet = 0
							If ClipPut(_GetFunctionSnippet(_SciTE_GetText(), $__TreeViewItems[$A][1])) = 0 Then ; Retrieve Function Snippet.
								_Flash($__GUI, $bRed)
							Else
								_Flash($__GUI, $bGreen)
							EndIf
						ElseIf $__ToggleFold Then
							$__ToggleFold = 0
							_SciTE_Find($__TreeViewItems[$A][2])
							_SciTE_Send_Command($__SciTEDummy[1], $__SciTEDummy[4], "menucommand:235") ; IDM_EXPAND
						Else
							_SciTE_Find($__TreeViewItems[$A][2])
							_LineUp()
						EndIf
						ExitLoop
					EndIf
				Next

		EndSwitch
	WEnd
	_SaveSciTEPath()

	$iCount = _GUICtrlComboBoxEx_GetCount($__Combo)
	If $iCount > 0 Then
		For $A = 0 To $iCount - 1
			_GUICtrlComboBoxEx_GetItemText($__Combo, $A, $sFolder)
			$sReturn &= $sFolder & "|"
		Next
		$sReturn &= _GUICtrlComboBoxEx_GetCurSel($__Combo)
	Else
		$sReturn = ""
	EndIf
	IniWrite(@ScriptDir & "\Settings.ini", "General", "History", $sReturn)
EndFunc   ;==>_Main

Func _AddSciTEJump($iWrite = 1)
	Local $sScriptDir = _SciTE_GetSciTEDefaultHome() & "\"
	Local $sSciTEUser = $sScriptDir
	If _IsInstalled() Then
		$sSciTEUser = @UserProfileDir & "\"
	EndIf
	Local $aArray[3] = [2, $sSciTEUser & "SciTEUser.properties", $sScriptDir & "properties\au3.properties"], $iNumber, $sWrite = -1

	For $A = 1 To $aArray[0]
		$iNumber = _CommandNumber($aArray[$A])
		If $iNumber = -1 Then
			ExitLoop
		EndIf
		$sWrite = _CommandWrite($iNumber)
		If @error = 0 Then
			ExitLoop
		EndIf
	Next
	If $sWrite = -1 Then
		Return SetError(1, 0, 0)
	EndIf
	If $iWrite Then
		FileCopy(@ScriptFullPath, $sScriptDir & "SciTEJump\" & @ScriptName, 9)
		Return _SetFile($sWrite, $aArray[1])
	EndIf
	Return 1
EndFunc   ;==>_AddSciTEJump

Func _ArrayEmpty(ByRef $aArray)
	For $A = 1 To $aArray[0]
		$aArray[$A] = 0
	Next
EndFunc   ;==>_ArrayEmpty

Func _ByteSuffix($iBytes, $iRound = 2) ; By Spiff59
	Local $A, $aArray[9] = [" bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB"]
	While $iBytes > 1023
		$A += 1
		$iBytes /= 1024
	WEnd
	Return Round($iBytes, $iRound) & $aArray[$A]
EndFunc   ;==>_ByteSuffix

Func _ClientToScreen($hHandle, ByRef $iX, ByRef $iY)
	Local $tPoint = DllStructCreate("int X;int Y")
	DllStructSetData($tPoint, 1, $iX)
	DllStructSetData($tPoint, 2, $iY)
	_WinAPI_ClientToScreen($hHandle, $tPoint)
	$iX = DllStructGetData($tPoint, 1)
	$iY = DllStructGetData($tPoint, 2)
EndFunc   ;==>_ClientToScreen

Func _CommandNumber($sFilePath)
	Local $sData = _GetFile($sFilePath)
	If StringInStr($sData, _ProgramName()) Then
		Return SetError(2, 0, -1)
	EndIf
	Local $aReturn = StringRegExp(_GetFile($sFilePath), '(?s)(?i)command\.name\.(.*?)\.', 3)
	If @error Then
		Return SetError(1, 0, "")
	EndIf
	Return StringRegExpReplace($aReturn[UBound($aReturn) - 1], "[^0-9]", "") + 1
EndFunc   ;==>_CommandNumber

Func _CommandWrite($iNumber)
	If $iNumber = "" Then
		Return SetError(1, 0, -1)
	EndIf
	Return '# ' & $iNumber & ' guinness SciTEJump' & @CRLF & _
			'command.' & $iNumber & '.$(au3)="$(SciteDefaultHome)\SciTEJump\SciTE Jump.exe"' & @CRLF & _
			'command.name.' & $iNumber & '.$(au3)=SciTE Jump' & @CRLF & _
			'command.shortcut.' & $iNumber & '.$(au3)=Ctrl+Alt+J' & @CRLF & _
			'command.subsystem.' & $iNumber & '.$(au3)=2' & @CRLF & _
			'command.save.before.' & $iNumber & '.$(au3)=2' & @CRLF & _
			'command.replace.selection.' & $iNumber & '.$(au3)=0' & @CRLF & _
			'command.quiet.' & $iNumber & '.$(au3)=1' & @CRLF
EndFunc   ;==>_CommandWrite

Func _CreateJumpArray($sData)
	Local $aAllAnchors[1][3] = [[0, 3, 0]]

	_GetComments($sData, $aAllAnchors)
	_GetFunctions($sData, $aAllAnchors)
	_GetRegions($sData, $aAllAnchors)
	Return $aAllAnchors
EndFunc   ;==>_CreateJumpArray

Func _EnumArray(ByRef $aArray, $iBefore = 3, $iStart = 1)
	$iStart = $iBefore + $iStart
	For $A = 0 To UBound($aArray, 1) - 1
		$aArray[$A] = $iStart
		$iStart += 1
	Next
	Return $iStart - 1
EndFunc   ;==>_EnumArray

Func _EnumArray2D(ByRef $aArray, $iBefore = 3, $iStart = 1)
	$iStart = $iBefore + $iStart
	For $A = 0 To UBound($aArray, 1) - 1
		For $B = 0 To UBound($aArray, 2) - 1
			$aArray[$A][$B] = $iStart
		Next
		$iStart += 1
	Next
	Return $iStart - 1
EndFunc   ;==>_EnumArray2D

Func _Exit()
	AdlibUnRegister("_SciTE_Monitor")
	Exit
EndFunc   ;==>_Exit

Func _Export_FunctionRegionList()
	Local $iCountFunctions = 0, $iCountFunctionsUnUsed = 0, $iCountRegions = 0, _
			$sAdditionalInformation, $sEnd, $sEndFunctions, $sEndRegions, $sFileRead, $sStart, $sStartFunctions, $sStartRegions, $sUnUsedFunctions
	If _IsEmpty($__CurrentFile[1]) Then
		Return SetError(1, 0, 0)
	EndIf
	Local $aFunctions[$__TreeViewItems[0][0] + 1]

	$sUnUsedFunctions = '# ' & StringUpper(_GetLanguage("TIP_EXPORT_3", "Functions UnUsed")) & ' #' & @CRLF
	$sFileRead = _GetFile($__CurrentFile[1])
	For $A = 1 To $__TreeViewItems[0][0]
		If $__TreeViewItems[$A][3] = 1 Then
			$iCountFunctions += 1
			$sEndFunctions &= "> " & $__TreeViewItems[$A][1] & " => " & @CRLF
			$sFileRead = StringReplace($sFileRead, ";==>" & $__TreeViewItems[$A][1], "")
			StringReplace($sFileRead, $__TreeViewItems[$A][1], $__TreeViewItems[$A][1])
			If @extended <= 1 Then
				$iCountFunctionsUnUsed += 1
				$sUnUsedFunctions &= $__TreeViewItems[$A][1] & @CRLF
			EndIf
			$aFunctions[0] += 1
			$aFunctions[$aFunctions[0]] = $__TreeViewItems[$A][1]
		EndIf
		If $__TreeViewItems[$A][3] = 2 Then
			$iCountRegions += 1
			$sEndRegions &= "> " & $__TreeViewItems[$A][1] & " => " & @CRLF
		EndIf
	Next

	If $iCountFunctions > 0 Then
		_SetCustomVariable(1, $iCountFunctions)
		$sStartFunctions = '# ' & StringUpper(_GetLanguage('TIP_EXPORT_1', 'Total number of functions - %TOTALNUMBER%')) & ' #' & @CRLF
		$sEndFunctions &= @CRLF
	Else
		$sStartFunctions = ""
		$sEndFunctions = ""
	EndIf

	If $iCountFunctionsUnUsed > 0 Then
		$sUnUsedFunctions &= @CRLF
	Else
		$sUnUsedFunctions = ""
	EndIf

	If $iCountRegions > 0 Then
		_SetCustomVariable(1, $iCountRegions)
		$sStartRegions = '# ' & StringUpper(_GetLanguage('TIP_EXPORT_4', 'Total number of regions - %TOTALNUMBER%')) & ' #' & @CRLF
		$sEndRegions &= @CRLF
	Else
		$sStartRegions = ""
		$sEndRegions = ""
	EndIf

	$sStart = '# -------------------------------- #' & @CRLF & _
			@TAB & StringUpper(_GetLanguage('NAME', 'Name')) & ': ' & $__CurrentFile[4] & @CRLF & _
			@TAB & StringUpper(_GetLanguage('PATH', 'Path')) & ': ' & $__CurrentFile[1] & @CRLF & _
			@TAB & StringUpper(_GetLanguage('SIZE', 'Size')) & ': ' & _ByteSuffix($__CurrentFile[3], 0) & @CRLF & _
			@TAB & StringUpper(_GetLanguage('LINE_COUNT', 'Line Count')) & ': ' & _SciTE_GetLineCount() & @CRLF & _
			@TAB & StringUpper(_GetLanguage('CRC32', 'CRC32')) & ': ' & StringRight(_CRC32ForFile($__CurrentFile[1]), 8) & @CRLF & _
			'# -------------------------------- #' & @CRLF & @CRLF

	$sAdditionalInformation = _GetFileInfo($aFunctions, $sFileRead)
	_SetCustomVariable(2, @MDAY & "/" & @MON & "/" & @YEAR)
	$sEnd = '# ' & StringUpper(_GetLanguage('TIP_EXPORT_2', 'Created on the %CREATIONDATE%')) & ' #' & @CRLF

	Return _SetFile($sStart & $sStartFunctions & $sEndFunctions & $sUnUsedFunctions & $sStartRegions & $sEndRegions & $sAdditionalInformation & $sEnd, $__CurrentFile[2] & "\FunctionList.txt", 1)
EndFunc   ;==>_Export_FunctionRegionList

Func _Find($sFindText, $sDirectory)
	Local $aArray, $iItem, $iResults, $sFileName
	$__FindItems[0][0] = 0

	GUICtrlDelete($__TreeViewFind)
	$__TreeViewFind = _TreeView_Create()
	$__TreeViewCurrent = $__TreeViewFind

	$iResults = GUICtrlCreateTreeViewItem(_GetLanguage('TIP_SEARCH_1', 'Search results'), $__TreeViewFind)
	_LanguageAdd($__LanguageItems, 6, $iResults, 'TIP_SEARCH_1', 'Search results')
	$aArray = _FindInFile($sFindText, $sDirectory, "*.au3", 1, 0)
	If @error Then
		If @extended Then
			Return SetError(1, 0, $aArray)
		Else
			GUICtrlSetState($iResults, BitOR($GUI_EXPAND, $GUI_DEFBUTTON))
			$iItem = GUICtrlCreateTreeViewItem(_GetLanguage('TIP_SEARCH_2', 'No search results'), $__TreeViewFind)
			_LanguageAdd($__LanguageItems, 7, $iItem, 'TIP_SEARCH_2', 'No search results')
			Return SetError(2, 0, $aArray)
		EndIf
	Else
		_LanguageAdd($__LanguageItems, 7, "", "", "")
	EndIf
	ReDim $__FindItems[$aArray[0] + 1][$__FindItems[0][1]]
	For $A = 1 To $aArray[0]
		If $aArray[$A] = "" Then
			ContinueLoop
		EndIf
		$sFileName = _WinAPI_PathStripPath($aArray[$A])
		$__FindItems[0][0] += 1
		$__FindItems[$__FindItems[0][0]][0] = GUICtrlCreateTreeViewItem($sFileName, $iResults)
		$__FindItems[$__FindItems[0][0]][1] = $sFileName
		$__FindItems[$__FindItems[0][0]][2] = $aArray[$A]
	Next
	GUICtrlSetState($iResults, BitOR($GUI_EXPAND, $GUI_DEFBUTTON))
	Return $aArray
EndFunc   ;==>_Find

Func _FindInFile($sSearch, $sFilePath, $sMask = "*", $iRecursive = 1, $iLiteral = 0, $iCaseSensitive = 0, $iDetail = 0)
	Local $aError[1] = [0], $aMask, $aReturn, $iError = 0, $iPID, $sCaseSensitive = "/i", $sDetail = "/m", $sRecursive = "", $sStdoutRead = ""

	If $iCaseSensitive Then
		$sCaseSensitive = ""
	EndIf
	If $iDetail Then
		$sDetail = "/n"
	EndIf
	If $iLiteral Then
		$sSearch = " /c:" & $sSearch
	EndIf
	If $iRecursive Then
		$sRecursive = "/s"
	EndIf

	$sFilePath = StringRegExpReplace($sFilePath, "[\\/]+\z", "") & "\"
	$aMask = StringSplit($sMask, ";")

	For $A = 1 To $aMask[0]
		$iPID = Run(@ComSpec & ' /c ' & 'findstr ' & $sCaseSensitive & ' ' & $sDetail & ' ' & $sRecursive & ' "' & $sSearch & '" "' & $sFilePath & $aMask[$A] & '"', @SystemDir, @SW_HIDE, 6)
		While 1
			$sStdoutRead &= StdoutRead($iPID)
			If @error Then
				ExitLoop
			EndIf
			Switch GUIGetMsg()
				Case $GUI_EVENT_CLOSE
					Exit

				Case $__Refresh
					Return SetError(2, 1, $aError)

			EndSwitch
		WEnd
	Next
	$aReturn = StringRegExp(@CRLF & StringStripCR($sStdoutRead), '[^\n]+', 3)
	If @error Then
		Return SetError(1, 0, $aError)
	EndIf
	$aReturn[0] = UBound($aReturn) - 1
	If $aReturn[0] = 0 Then
		$iError = 1
	EndIf
	Return SetError($iError, 0, $aReturn)
EndFunc   ;==>_FindInFile

Func _Flash($hHandle, $bColor)
	For $A = 1 To 2
		If Mod($A, 2) Then ; Odd.
			GUISetBkColor($bColor, $hHandle)
		Else ; Even.
			GUISetBkColor(_WinAPI_GetSysColor($COLOR_MENU), $hHandle)
		EndIf
		Sleep(100)
	Next
EndFunc   ;==>_Flash

Func _GetComments($sData, ByRef $aArray)
	Local $aReturn, $aSRE[4][2] = [[1, 2], _
			['(?ims)^\s*;~\s(.*?)\r\n', ';~ '], _
			['(?ims)^\s*;\s(.*?)\r\n', '; '], _
			['(?ims)^\s*;(.*?)\r\n', ';']], $iUbound

	For $A = 1 To $aSRE[0][0]
		$aReturn = StringRegExp($sData, $aSRE[$A][0], 3)
		If @error Then
			ContinueLoop
		EndIf
		$iUbound = UBound($aReturn)
		ReDim $aArray[$aArray[0][0] + $iUbound + 1][$aArray[0][1]]
		For $B = $aArray[0][0] To $aArray[0][0] + $iUbound - 1
			$aArray[$B + 1][0] = $aReturn[$B - $aArray[0][0]]
			$aArray[$B + 1][1] = 0
			$aArray[$B + 1][2] = $aSRE[$A][1] & $aArray[$B + 1][0]
			$aArray[0][2] = BitOR($aArray[0][2], 1)
		Next
		$aArray[0][0] += $iUbound
	Next
	Return $aReturn
EndFunc   ;==>_GetComments

Func _GetFile($sFile, $sFormat = 0)
	Local $hFileOpen = FileOpen($sFile, $sFormat)
	If $hFileOpen = -1 Then
		Return SetError(1, 0, "")
	EndIf
	Local $sData = FileRead($hFileOpen)
	FileClose($hFileOpen)
	Return $sData
EndFunc   ;==>_GetFile

Func _GetFullPath($sRelativePath, $sBasePath = @WorkingDir)
	Local $sWorkingDir = @WorkingDir
	FileChangeDir($sBasePath)
	$sRelativePath = _WinAPI_GetFullPathName($sRelativePath)
	FileChangeDir($sWorkingDir)
	Return $sRelativePath
EndFunc   ;==>_GetFullPath

Func _GetFunctions($sData, ByRef $aArray)
	Local $sEnd = "(", $sMiddle = " ", $sStart = "Func"

	_GetFunctionStrings($sStart, $sMiddle, $sEnd)
	Local $aReturn = StringRegExp($sData, '(?ims)^\s*' & $sStart & '\s(.*?)\' & $sEnd, 3) ; StringRegExp($sData, '(?i)(?:' & $sStart & '[\s]+)([\w]{1,})(?:[\s]*\' & $sEnd & ')', 3)
	If @error Then
		Return SetError(1, 0, 0)
	EndIf
	Local $iUbound = UBound($aReturn)
	If $__IsSort Then
		_Sort($aReturn, 0, 0, $iUbound - 1, 2)
	EndIf
	$iUbound = UBound($aReturn)
	ReDim $aArray[$aArray[0][0] + $iUbound + 1][$aArray[0][1]]
	For $A = $aArray[0][0] To $aArray[0][0] + $iUbound - 1
		$aArray[$A + 1][0] = $aReturn[$A - $aArray[0][0]]
		$aArray[$A + 1][1] = 1
		$aArray[$A + 1][2] = $sStart & $sMiddle & $aArray[$A + 1][0] & $sEnd
		$aArray[0][2] = BitOR($aArray[0][2], 2)
	Next
	$aArray[0][0] += $iUbound
	Return $aReturn
EndFunc   ;==>_GetFunctions

Func _GetFunctionSnippet($sData, $sFunction) ; By James1337 And Modified By softwarespot.
	Local $aError[1] = [0], $bString_1 = BinaryToString('0x0101010101'), $bString_2 = BinaryToString('0x1010101010')
	$sData = StringRegExpReplace($sData, '(?i)\n[\s]*Func[\s]+' & $sFunction & '[\s]*\(', $bString_1, 0)
	$sData = StringRegExpReplace($sData, '(?i)\n[\s]*EndFunc', $bString_2, 0)
	Local $iPos_1 = StringInStr($sData, $bString_1, 2, 1)
	Local $iPos_2 = StringInStr($sData, $bString_2, 2, 1, $iPos_1)
	If Not (($iPos_1 > 0) And ($iPos_2 > $iPos_1)) Then
		Return SetError(1, 0, $aError)
	EndIf

	$sData = StringMid($sData, $iPos_1, $iPos_2 - $iPos_1 + StringLen($bString_1))
	$sData = StringReplace($sData, $bString_1, "Func " & $sFunction & "(")
	$sData = StringReplace($sData, $bString_2, "EndFunc" & @TAB & ";==>" & $sFunction)
	Return $sData
EndFunc   ;==>_GetFunctionSnippet

Func _GetFunctionStrings(ByRef $sStart, ByRef $sMiddle, ByRef $sEnd)
	Switch StringTrimLeft(_WinAPI_PathFindExtension($__CurrentFile[4]), 1)
		Case "vbs"
			$sStart = "Function"
			$sMiddle = " "
			$sEnd = "("

		Case "nsi"
			$sStart = "Function"
			$sMiddle = " "
			$sEnd = @CRLF

	EndSwitch
EndFunc   ;==>_GetFunctionStrings

Func _GetHandles()
	$__SciTEDummy[4] = WinGetHandle("DirectorExtension")
	$__SciTEDummy[5] = WinGetHandle("[CLASS:SciTEWindow]")
EndFunc   ;==>_GetHandles

Func _GetRegions($sData, ByRef $aArray)
	Local $aReturn = StringRegExp($sData, '(?ims)^\s*#region\s(.*?)\r\n', 3)
	If @error Then
		Return SetError(1, 0, 0)
	EndIf
	Local $iUbound = UBound($aReturn)
	ReDim $aArray[$aArray[0][0] + $iUbound + 1][$aArray[0][1]]
	For $A = $aArray[0][0] To $aArray[0][0] + $iUbound - 1
		$aArray[$A + 1][0] = $aReturn[$A - $aArray[0][0]]
		$aArray[$A + 1][1] = 2
		$aArray[$A + 1][2] = "#region " & $aArray[$A + 1][0] & @CRLF
		$aArray[0][2] = BitOR($aArray[0][2], 4)
	Next
	$aArray[0][0] += $iUbound
	Return $aReturn
EndFunc   ;==>_GetRegions

Func _GetRelativePath($sFilePath, $iIsFolder = 1)
	If $iIsFolder Then
		$sFilePath = _WinAPI_PathAddBackslash($sFilePath)
	EndIf
	Local $sRelativePath = _WinAPI_PathRelativePathTo(@ScriptDir & "\", 1, $sFilePath, $iIsFolder)
	If @error Then
		Return SetError(1, 0, $sFilePath)
	EndIf
	If $sRelativePath = "." Then
		$sRelativePath &= "\"
	EndIf
	Return $sRelativePath
EndFunc   ;==>_GetRelativePath

Func _GetTitle()
	Local $aOSArch[2] = ["", " (64-bit)"], $aPortable[2] = [" (Portable)", ""]
	Return _ProgramName() & $aOSArch[@AutoItX64] & $aPortable[_IsInstalled()]
EndFunc   ;==>_GetTitle

Func _GUICtrlButton_ContextMenuEx($hHandle, $iControlID, $iContextMenu)
	Local $aControlGetPos, $hMenu, $iX, $iY
	$hMenu = GUICtrlGetHandle($iContextMenu)
	$aControlGetPos = ControlGetPos($hHandle, "", $iControlID)
	$iX = $aControlGetPos[0]
	$iY = $aControlGetPos[1] + $aControlGetPos[3]
	_ClientToScreen($hHandle, $iX, $iY)
	_GUICtrlMenu_TrackPopupMenu($hMenu, $hHandle, $iX, $iY)
EndFunc   ;==>_GUICtrlButton_ContextMenuEx

Func _GUICtrlTreeView_ContextMenu($hGUI, $iIndex, $iSubItem)
	Local Enum $iContextItem1 = 1000, $iContextItem2, $iContextItem3, $iContextItem4, $iContextItem5
	Local $hContextMenu, $hContextSubMenu, $iControlID, $iError = 1
	Local $aContextMenuExport[6][3], $aExport[6][3] = [['HTML', 'HTML', 1],['LATEX', 'LATEX', 2],['PDF', 'PDF', 3],['RTF', 'RTF', 4],["", "", ""],['FUNCTION_LIST', 'Function and Region list', 5]], _
			$iExportUbound = 5

	_EnumArray2D($aContextMenuExport, 1005, 1)
	For $A = 0 To $iExportUbound
		$aContextMenuExport[$A][1] = _GetLanguage($aExport[$A][0], $aExport[$A][1])
		$aContextMenuExport[$A][2] = $aExport[$A][2]
	Next

	$hContextMenu = _GUICtrlMenu_CreatePopup()
	_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('REFRESH', 'Refresh'), $iContextItem1) ; Will Show These MenuItem(s) Regardless.

	If $iIndex <> -1 And $iSubItem <> -1 Then ; Won't Show These MenuItem(s) Unless An Item Is Selected.
		_GUICtrlMenu_AddMenuItem($hContextMenu, "")
		_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('MENU_FIND', 'Find'), $iContextItem2)
		_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('MENU_HEADER', 'Add Header'), $iContextItem3)
		_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('MENU_SNIPPET', 'Function Snippet'), $iContextItem4)
		_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('MENU_TOGGLE', 'Toggle Fold'), $iContextItem5)
		_GUICtrlMenu_AddMenuItem($hContextMenu, "")
	EndIf

	If $iIndex = -1 And $iSubItem <> -1 Then ; Will Show These MenuItem(s) If No Item Is Selected.
	EndIf

	$hContextSubMenu = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hContextMenu, _GetLanguage('EXPORT', 'Export'), 0, $hContextSubMenu)
	For $A = 0 To $iExportUbound
		_GUICtrlMenu_AddMenuItem($hContextSubMenu, $aContextMenuExport[$A][1], $aContextMenuExport[$A][0])
	Next

	$iControlID = _GUICtrlMenu_TrackPopupMenu($hContextMenu, $hGUI, -1, -1, 1, 1, 2)
	Switch $iControlID
		Case $iContextItem1
			ControlClick($__GUI, "", $__Refresh)

		Case $iContextItem2
			$iError = 0

		Case $iContextItem3
			$__AddHeader = 1
			$iError = 0

		Case $iContextItem4
			$__FunctionSnippet = 1
			$iError = 0

		Case $iContextItem5
			$__ToggleFold = 1
			$iError = 0

		Case $aContextMenuExport[0][0] To $aContextMenuExport[$iExportUbound][0]
			For $A = 0 To $iExportUbound
				If $iControlID = $aContextMenuExport[$A][0] Then
					$iIndex = $A
					ExitLoop
				EndIf
			Next
			GUICtrlSendToDummy($__ExportDummy[$aContextMenuExport[$iIndex][2]], $aContextMenuExport[$iIndex][2])

	EndSwitch
	Return SetError($iError, 0, _GUICtrlMenu_DestroyMenu($hContextMenu))
EndFunc   ;==>_GUICtrlTreeView_ContextMenu

Func _GUIInBounds($hHandle) ; Original idea by wraithdu, modified by guinness.
	Local $iXPos = 5, $iYPos = 5, $tWorkArea = DllStructCreate($tagRECT)
	_WinAPI_SystemParametersInfo($SPI_GETWORKAREA, 0, DllStructGetPtr($tWorkArea))

	Local $iLeft = DllStructGetData($tWorkArea, "Left"), $iTop = DllStructGetData($tWorkArea, "Top")
	Local $iWidth = DllStructGetData($tWorkArea, "Right") - $iLeft
	If  _WinAPI_GetSystemMetrics($SM_CYVIRTUALSCREEN) > $iWidth Then
		 $iWidth = _WinAPI_GetSystemMetrics($SM_CYVIRTUALSCREEN)
	EndIf
	$iWidth -= $iLeft
	Local $iHeight = DllStructGetData($tWorkArea, "Bottom") - $iTop
	Local $aWinGetPos = WinGetPos($hHandle)
	If @error Then
		Return SetError(1, 0, WinMove($hHandle, "", $iXPos, $iYPos))
	EndIf

	If $aWinGetPos[0] < $iLeft Then
		$iXPos = $iLeft
	ElseIf ($aWinGetPos[0] + $aWinGetPos[2]) > $iWidth Then
		$iXPos = $iWidth - $aWinGetPos[2]
	Else
		$iXPos = $aWinGetPos[0]
	EndIF

	If $aWinGetPos[1] < $iTop Then
		$iYPos = $iTop
	ElseIf ($aWinGetPos[1] + $aWinGetPos[3]) > $iHeight Then
		$iYPos = $iHeight - $aWinGetPos[3]
	Else
		$iYPos = $aWinGetPos[1]
	EndIf
	Return WinMove($hHandle, "", $iXPos, $iYPos)
EndFunc   ;==>_GUIInBounds

Func _GUIRegisterMsg($iFlag = 1)
	Switch $iFlag
		Case 0
			If $__IsGUIRegister Then
				GUIRegisterMsg($WM_NOTIFY, "")
				$__IsGUIRegister = 0
			EndIf

		Case 1
			If $__IsGUIRegister = 0 Then
				GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
				$__IsGUIRegister = 1
			EndIf

	EndSwitch
EndFunc   ;==>_GUIRegisterMsg

Func _HistoryAdd($hCombo, $sText)
	Return _GUICtrlComboBoxEx_SetCurSel($hCombo, _GUICtrlComboBoxEx_AddString($hCombo, $sText))
EndFunc   ;==>_HistoryAdd

Func _INIUnicode($sINI)
	If FileExists($sINI) = 0 Then
		Return FileClose(FileOpen($sINI, 2 + 32))
	Else
		Local $iEncoding = FileGetEncoding($sINI)
		If $iEncoding <> $FO_UNICODE Then
			Local $sData = _GetFile($sINI, $iEncoding)
			If @error Then
				Return SetError(@error, @extended, 0)
			EndIf
			Return _SetFile($sData, $sINI, 1 + 32)
		EndIf
	EndIf
EndFunc   ;==>_INIUnicode

Func _Is($sData, $sDefault = 0, $sSection = "General")
	Return Number(IniRead(@ScriptDir & "\Settings.ini", $sSection, $sData, $sDefault))
EndFunc   ;==>_Is

Func _IsEmpty($sFilePath)
	If StringStripWS($sFilePath, 8) = "" Then
		Return 0
	EndIf
	Return StringRegExp($sFilePath, '(?i)\(Untitled\)|\(NoFile\)|\(NoWindow\)') = 1
EndFunc   ;==>_IsEmpty

Func _IsInstalled()
	Local $sWow6432Node = ""
	If @AutoItX64 Then
		$sWow6432Node = "Wow6432Node\"
	EndIf
	RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\" & $sWow6432Node & "AutoIt v3\AutoIt\", "InstallDir")
	If @error Then
		Return SetError(@error, 0, 0)
	EndIf
	Return FileExists(@UserProfileDir & "\abbrev.properties")
EndFunc   ;==>_IsInstalled

Func _IsMinimized($hHandle)
	Return BitAND(WinGetState($hHandle), 16) = 16
EndFunc   ;==>_IsMinimized

Func _IsRestarted()
	If $CmdLine[0] = 2 Then
		If $CmdLine[1] = "/Restart" Then
			Local $iPID = Run('"' & $CmdLine[2] & '"', @ScriptDir & "\", @SW_SHOW)

			_WinWait("DirectorExtension", 5)
			_GetHandles()

			_SciTE_LoadSession(@ScriptDir & "\session.dat")
			FileDelete(@ScriptDir & "\session.dat")
			Return $iPID > 0
		EndIf
	EndIf
	Return SetError(1, 0, 0)
EndFunc   ;==>_IsRestarted

Func _IsSciTEActive()
	Return (WinExists($__SciTEDummy[4]) = 0 Or ProcessExists("SciTE.exe") = 0) = 0
EndFunc   ;==>_IsSciTEActive

Func _IsX64()
	Local $iOSArch = _OSArch(), $sCommandLine = $CmdLineRaw, $sProgramName = "SciTE Jump"
	If @OSArch = "X64" And @AutoItX64 = 0 And FileExists(@ScriptDir & "\" & $sProgramName & $iOSArch & ".exe") = 1 Then
		If StringStripWS($sCommandLine, 8) <> "" Then
			$sCommandLine = " " & $sCommandLine
		EndIf
		Exit Run('"' & @ScriptDir & '\' & $sProgramName & $iOSArch & '.exe"' & $sCommandLine)
	EndIf
EndFunc   ;==>_IsX64

Func _IsUpdate($sFilePath)
	Local $iBefore = Number(StringRegExpReplace(FileGetVersion($sFilePath), "\A(\d*).(\d*).(\d*).(\d*)", "$1$2$3"))
	Local $iAfter = Number(StringRegExpReplace(_WinAPI_ExpandEnvironmentStrings("%VERSION%"), "\A(\d*).(\d*).(\d*).(\d*)", "$1$2$3"))
	If Number(IniRead(@ScriptDir & "\Settings.ini", "General", "UpdateKey", $iBefore)) = $iAfter Then
		Return 0
	EndIf
	IniWrite(@ScriptDir & "\Settings.ini", "General", "UpdateKey", $iAfter)
	Return Number($iAfter > $iBefore)
EndFunc   ;==>_IsUpdate

Func _IsValidFileType($sFilePath, $sList = "bat;cmd;exe", $iOpFast = 1)
	Return StringRegExp($sFilePath, "\.(?i:\Q" & StringReplace($sList, ";", "\E|\Q", 0, $iOpFast * 2) & "\E)\z")
EndFunc   ;==>_IsValidFileType

Func _IsWindowsVersion()
	Return RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\", "CurrentVersion") >= 6.0
EndFunc   ;==>_IsWindowsVersion

Func _LanguageAdd(ByRef $aArray, $iIndex, $iControlID, $sData, $sDefault, $sBefore = "", $sAfter = "")
	If $iControlID = -1 Then
		$iControlID = _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($iControlID))
	EndIf
	If $iIndex = -1 Then
		_ReDim($aArray, $aArray[0][2])
		$aArray[0][0] += 1
		$iIndex = $aArray[0][0]
	EndIf
	$aArray[$iIndex][0] = $iControlID
	$aArray[$iIndex][1] = $sData
	$aArray[$iIndex][2] = $sDefault
	$aArray[$iIndex][3] = $sBefore
	$aArray[$iIndex][4] = $sAfter
	GUICtrlSetData($iControlID, $sBefore & _GetLanguage($sData, $sDefault) & $sAfter)
EndFunc   ;==>_LanguageAdd

Func _LanguageUpdate($aArray)
	For $A = 1 To $aArray[0][0]
		GUICtrlSetData($aArray[$A][0], $aArray[$A][3] & _GetLanguage($aArray[$A][1], $aArray[$A][2]) & $aArray[$A][4])
	Next
EndFunc   ;==>_LanguageUpdate

Func _LineUp()
	Local $iLine = _SciTE_GetSelectionStartLine()
	_SciTE_GoToLine($iLine + 10)
	_SciTE_GoToLine($iLine - 10)
EndFunc   ;==>_LineUp

Func _OSArch()
	Return "_x" & StringRegExpReplace(@OSArch, "\D|\d[2-3]", "") ; Thanks to wraithdu.
EndFunc   ;==>_OSArch

Func _ReDim(ByRef $aArray, ByRef $iDimension)
	If ($aArray[0][0] + 1) >= $iDimension Then
		$iDimension = ($aArray[0][0] + 1) * 2
		ReDim $aArray[$iDimension][$aArray[0][1]]
	EndIf
EndFunc   ;==>_ReDim

Func _SaveSciTEPath()
	Local $sFilePath = _SciTE_GetSciTEDefaultHome() & "\" & "SciTE.exe"
	If FileExists($sFilePath) Then
		FileChangeDir(@ScriptDir & "\")
		IniWrite(@ScriptDir & "\Settings.ini", "General", "SciTE", _GetRelativePath($sFilePath, 0))
	Else
		$sFilePath = ""
	EndIf
	Return $sFilePath
EndFunc   ;==>_SaveSciTEPath

Func _SciTE_AskProperty($sString)
	_SciTE_Send_Command($__SciTEDummy[1], $__SciTEDummy[4], "askproperty:" & $sString)
	Return _SciTE_ParseReturnString(_SciTE_ReturnString(), 4)
EndFunc   ;==>_SciTE_AskProperty

Func _SciTE_ChangeWorkingDirectory($sFilePath)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "cwd:" & StringReplace($sFilePath, "\", "\\"))
EndFunc   ;==>_SciTE_ChangeWorkingDirectory

Func _SciTE_ExportToHTML()
	If _IsEmpty($__CurrentFile[1]) Then
		Return SetError(2, 0, 0)
	EndIf
	Local $sFilePath = _WinAPI_PathRemoveExtension(StringReplace($__CurrentFile[1], "\", "\\")) & ".html"
	_SciTE_Send_Command(0, $__SciTEDummy[4], "exportashtml:" & $sFilePath)
	If FileExists($sFilePath) Then
		Return $sFilePath
	EndIf
	Return SetError(1, 0, $sFilePath)
EndFunc   ;==>_SciTE_ExportToHTML

Func _SciTE_ExportToLatex()
	If _IsEmpty($__CurrentFile[1]) Then
		Return SetError(2, 0, 0)
	EndIf
	Local $sFilePath = _WinAPI_PathRemoveExtension(StringReplace($__CurrentFile[1], "\", "\\")) & ".latex"
	_SciTE_Send_Command(0, $__SciTEDummy[4], "exportaslatex:" & $sFilePath)
	If FileExists($sFilePath) Then
		Return $sFilePath
	EndIf
	Return SetError(1, 0, $sFilePath)
EndFunc   ;==>_SciTE_ExportToLatex

Func _SciTE_ExportToPDF()
	If _IsEmpty($__CurrentFile[1]) Then
		Return SetError(2, 0, 0)
	EndIf
	Local $sFilePath = _WinAPI_PathRemoveExtension(StringReplace($__CurrentFile[1], "\", "\\")) & ".pdf"
	_SciTE_Send_Command(0, $__SciTEDummy[4], "exportaspdf:" & $sFilePath)
	If FileExists($sFilePath) Then
		Return $sFilePath
	EndIf
	Return SetError(1, 0, $sFilePath)
EndFunc   ;==>_SciTE_ExportToPDF

Func _SciTE_ExportToRTF()
	If _IsEmpty($__CurrentFile[1]) Then
		Return SetError(2, 0, 0)
	EndIf
	Local $sFilePath = _WinAPI_PathRemoveExtension(StringReplace($__CurrentFile[1], "\", "\\")) & ".rtf"
	_SciTE_Send_Command(0, $__SciTEDummy[4], "exportasrtf:" & $sFilePath)
	If FileExists($sFilePath) Then
		Return $sFilePath
	EndIf
	Return SetError(1, 0, $sFilePath)
EndFunc   ;==>_SciTE_ExportToRTF

Func _SciTE_Find($sString, $sAdd = "")
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "find:" & StringReplace($sString, "\", "\\") & $sAdd)
EndFunc   ;==>_SciTE_Find

Func _SciTE_GetCurrentFile()
	Local $sTitle = WinGetTitle($__SciTEDummy[5])
	If @error Then ; No Window
		Return SetError(1, 0, 0)
	EndIf
	If _IsEmpty($sTitle) Then ; New File.
		Return SetError(3, 0, 0)
	EndIf
	Local $sFilePath = StringRegExpReplace($sTitle, "(.*)\x20[-|*]\x20.*\z", "$1") ; Extract File Name, by Melba23
	If FileExists($sFilePath) Then
		If _IsValidFileType($sFilePath, "au3;nsi;vbs") Then
			Return $sFilePath
		Else
			Return SetError(4, 0, 0) ; File Is Not Supported.
		EndIf
	EndIf
	Return SetError(2, 0, 0) ; File Does Not Exist.
EndFunc   ;==>_SciTE_GetCurrentFile

Func _SciTE_GetFilePath()
	Return StringReplace(_SciTE_AskProperty("FilePath"), "\\", "\")
EndFunc   ;==>_SciTE_GetFilePath

Func _SciTE_GetLineCount()
	Return ControlCommand($__SciTEDummy[5], "", "[CLASS:Scintilla; INSTANCE:1]", "GetLineCount", "")
EndFunc   ;==>_SciTE_GetLineCount

Func _SciTE_GetSciTEDefaultHome()
	Return _WinAPI_PathRemoveFileSpec(_WinAPI_GetProcessFileName(ProcessExists("SciTE.exe")))
EndFunc   ;==>_SciTE_GetSciTEDefaultHome

Func _SciTE_GetSelectionStartLine()
	Return _SciTE_AskProperty("SelectionStartLine")
EndFunc   ;==>_SciTE_GetSelectionStartLine

Func _SciTE_GetText() ; Thanks To Jos: http://www.autoitscript.com/forum/topic/130437-new-scite4autoit3-available-with-scite-v227/page__view__findpost__p__907702
	Local $sReturn = StringToBinary(ControlGetText($__SciTEDummy[5], "", "[CLASS:Scintilla; INSTANCE:1]"), 2)
;~ 	Translate Back To ANSI Text
	$sReturn = BinaryToString($sReturn, 1)
;~ 	Strip Ending 00 Plus Extra Characters.
	$sReturn = String($sReturn)
	Return $sReturn
EndFunc   ;==>_SciTE_GetText

Func _SciTE_GoToLine($iLineNumber)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "goto:" & $iLineNumber)
EndFunc   ;==>_SciTE_GoToLine

Func _SciTE_LoadSession($sFilePath)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "loadsession:" & StringReplace($sFilePath, "\", "\\"))
EndFunc   ;==>_SciTE_LoadSession

Func _SciTE_Monitor()
	If _IsSciTEActive() = 0 Then
		Exit
	EndIf

	If _IsMinimized($__SciTEDummy[1]) Or $__FindInFile Then
		Return SetError(1, 0, 0)
	EndIf

	Local $sFilePath = _SciTE_GetCurrentFile()
	If @error Then
		Switch @error
			Case 1 ; No Window.
				If $__CurrentFile[1] <> "(NoWindow)" Then
					$__CurrentFile[1] = "(NoWindow)"
					_TreeView_Refresh(1, 'TIP_ERROR_4', 'SciTE seems to be closed.')
				EndIf

			Case 2 ; File Does Not Exist.
				If $__CurrentFile[1] <> "(NoFile)" Then
					$__CurrentFile[1] = "(NoFile)"
					_TreeView_Refresh(1, "TIP_ERROR_3", "File doesn't exist.")
				EndIf

			Case 3 ; New File.
				If $__CurrentFile[1] <> "(Untitled)" Then
					$__CurrentFile[1] = "(Untitled)"
					_TreeView_Refresh(1)
					WinActivate($__SciTEDummy[5])
				EndIf

		EndSwitch
		_SciTE_ChangeWorkingDirectory(@ScriptDir & "\")
		Return FileChangeDir(@ScriptDir & "\")
	EndIf

	If $__CurrentFile[1] = $sFilePath And $__CurrentFile[3] = FileGetSize($sFilePath) Then
		Return 0
	EndIf

	$__CurrentFile[1] = $sFilePath
	$__CurrentFile[2] = _WinAPI_PathRemoveFileSpec($sFilePath)
	$__CurrentFile[3] = FileGetSize($sFilePath)
	$__CurrentFile[4] = _WinAPI_PathStripPath($__CurrentFile[1])
	If $__CurrentFile[3] = 0 Then
		_TreeView_Refresh(1)
		Return WinActivate($__SciTEDummy[5])
	EndIf
	_TreeView_Refresh()
	_SciTE_ChangeWorkingDirectory($__CurrentFile[2] & "\")
	FileChangeDir($__CurrentFile[2] & "\")
	Return WinActivate($__SciTEDummy[5])
EndFunc   ;==>_SciTE_Monitor

Func _SciTE_Open($sFilePath)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "open:" & StringReplace($sFilePath, "\", "\\"))
EndFunc   ;==>_SciTE_Open

Func _SciTE_Output($sString)
	$sString = StringReplace($sString, "\", "\\")
	_SciTE_ReplaceMarcos($sString)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "output:" & $sString)
EndFunc   ;==>_SciTE_Output

Func _SciTE_Quit()
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "quit:")
EndFunc   ;==>_SciTE_Quit

Func _SciTE_ReplaceMarcos(ByRef $sString)
	$sString = StringReplace($sString, @TAB, "\t")
	$sString = StringReplace($sString, @CR, "\r")
	$sString = StringReplace($sString, @LF, "\n")
	Return $sString
EndFunc   ;==>_SciTE_ReplaceMarcos

Func _SciTE_ReturnString()
	Local $sReturn = $__SciTEDummy[2]
	$__SciTEDummy[2] = ""
	Return $sReturn
EndFunc   ;==>_SciTE_ReturnString

Func _SciTE_ParseReturnString($sString, $iCount = 3)
;~ 	Return StringRegExpReplace($sReceive, '(?::\d+:macro:stringinfo:)', "")
	Return StringTrimLeft($sString, StringInStr($sString, ":", Default, $iCount)) ; By Xenobiologist.
EndFunc   ;==>_SciTE_ParseReturnString

Func _SciTE_Save()
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "saveas:" & StringReplace($__CurrentFile[1], "\", "\\"))
EndFunc   ;==>_SciTE_Save

Func _SciTE_SaveSession($sFilePath)
	Return _SciTE_Send_Command(0, $__SciTEDummy[4], "savesession:" & StringReplace($sFilePath, "\", "\\"))
EndFunc   ;==>_SciTE_SaveSession

Func _SciTE_Send_Command($hHandle, $hSciTE, $sString)
	If StringStripWS($sString, 8) = "" Then
		Return SetError(2, 0, 0) ; String is blank.
	EndIf
	$sString = ":" & Dec(StringTrimLeft($hHandle, 2)) & ":" & $sString
	Local $tData = DllStructCreate("char[" & StringLen($sString) + 1 & "]") ; wchar
	DllStructSetData($tData, 1, $sString)

	Local $ilParam = DllStructCreate("ptr;dword;ptr") ; ulong_ptr;dword;ptr
	DllStructSetData($ilParam, 1, 1) ; $ilParam, 1, 1
	DllStructSetData($ilParam, 2, DllStructGetSize($tData))
	DllStructSetData($ilParam, 3, DllStructGetPtr($tData))
	_SendMessage($hSciTE, $WM_COPYDATA, $hHandle, DllStructGetPtr($ilParam))
	Return Number(Not @error)
EndFunc   ;==>_SciTE_Send_Command

Func _SciTE_SetInternal($hHandle)
	$__SciTEDummy[1] = $hHandle
	Return $__SciTEDummy[1]
EndFunc   ;==>_SciTE_SetInternal

Func _Search($sSearchText, $aArray)
	$__SearchItems = $aArray
	$__SearchItems[0][0] = 0

	GUICtrlDelete($__TreeViewSearch)
	$__TreeViewSearch = _TreeView_Create()
	$__TreeViewCurrent = $__TreeViewSearch

	Local $iResults = GUICtrlCreateTreeViewItem(_GetLanguage('TIP_SEARCH_1', 'Search results'), $__TreeViewSearch)
	_LanguageAdd($__LanguageItems, 4, $iResults, 'TIP_SEARCH_1', 'Search results')
	For $A = 1 To $aArray[0][0]
		If StringInStr($aArray[$A][1], $sSearchText) Then
			$__SearchItems[0][0] += 1
			$__SearchItems[$__SearchItems[0][0]][0] = GUICtrlCreateTreeViewItem($aArray[$A][1], $iResults)
			$__SearchItems[$__SearchItems[0][0]][1] = $aArray[$A][1]
			$__SearchItems[$__SearchItems[0][0]][2] = $aArray[$A][2]
			$__SearchItems[$__SearchItems[0][0]][3] = $aArray[$A][3]
		EndIf
	Next
	If $__SearchItems[0][0] = 0 Then
		Local $iItem = GUICtrlCreateTreeViewItem(_GetLanguage('TIP_SEARCH_2', 'No search results'), $__TreeViewSearch)
		_LanguageAdd($__LanguageItems, 5, $iItem, 'TIP_SEARCH_2', 'No search results')
	Else
		_LanguageAdd($__LanguageItems, 5, "", "", "")
	EndIf
	GUICtrlSetState($iResults, BitOR($GUI_EXPAND, $GUI_DEFBUTTON))
	ControlClick($__SciTEDummy[1], "", $__SearchInput)
	Sleep(25)
EndFunc   ;==>_Search

Func _SetFile($sString, $sFile, $iOverwrite = 0)
	Local $hFileOpen = FileOpen($sFile, 1 + $iOverwrite)
	FileWrite($hFileOpen, $sString)
	FileClose($hFileOpen)
	If @error Then
		Return SetError(1, 0, $sString)
	EndIf
	Return $sString
EndFunc   ;==>_SetFile

Func _SingletonEx($sTitleID) ; By KaFu.
	Local $hWnd = WinGetHandle($sTitleID)
	If IsHWnd($hWnd) Then
		Return SetError(1, 0, $hWnd)
	EndIf
	AutoItWinSetTitle($sTitleID)
	Return WinGetHandle($sTitleID)
EndFunc   ;==>_SingletonEx

Func _SingletonEx_Get()
	Local $hWnd = HWnd($__SingletonEx)
	Return HWnd(ControlGetText($hWnd, '', ControlGetHandle($hWnd, '', 'Edit1')))
EndFunc   ;==>_SingletonEx_Get

Func _SingletonEx_Set($hHandle)
	Local $hWnd = HWnd($__SingletonEx)
	Return ControlSetText($hWnd, "", ControlGetHandle($hWnd, "", 'Edit1'), $hHandle)
EndFunc   ;==>_SingletonEx_Set

Func _System_ContextMenu($hHandle, $iControlID = -1)
	Local $sDefault = _GetLanguageCurrent()
	Switch $iControlID
		Case -1
			Local $aArray = _GetLanguageList(0)
			If $aArray[0] > 24 Then
				$aArray[0] = 24
			EndIf
			$__ContextMenu = _GUICtrlMenu_GetSystemMenu($hHandle)

			$__ContextSubMenu = _GUICtrlMenu_CreateMenu()
			For $A = 0 To $aArray[0] - 1
				_GUICtrlMenu_AddMenuItem($__ContextSubMenu, $aArray[$A + 1], $__Language[$A])
				If $sDefault == $aArray[$A + 1] Then
					_GUICtrlMenu_CheckRadioItem($__ContextSubMenu, $__Language[0], $__Language[24], $__Language[$A], False)
				EndIf
			Next

			_GUICtrlMenu_InsertMenuItem($__ContextMenu, 0, _GetLanguage('MENU_RESTART', 'Restart'), $__ContextMenu1)
			_GUICtrlMenu_InsertMenuItem($__ContextMenu, 1, _GetLanguage('MENU_SORT', 'Sort functions'), $__ContextMenu2)
			_GUICtrlMenu_InsertMenuItem($__ContextMenu, 2, _GetLanguage('MENU_LANGUAGE', 'Language'), 0, $__ContextSubMenu)
			_GUICtrlMenu_InsertMenuItem($__ContextMenu, 3, "")
			_GUICtrlMenu_AppendMenu($__ContextMenu, $MF_SEPARATOR, 0, "")
			If _AddSciTEJump(0) Then
				_GUICtrlMenu_AppendMenu($__ContextMenu, $MF_STRING, $__ContextMenu3, _GetLanguage('MENU_ADD', 'Add to SciTE'))
			EndIf
			_GUICtrlMenu_AppendMenu($__ContextMenu, $MF_STRING, $__ContextMenu4, _GetLanguage('MENU_ABOUT', 'About'))
			_GUICtrlMenu_AppendMenu($__ContextMenu, $MF_STRING, $__ContextMenu5, _GetLanguage('MENU_HELP', 'Help file'))

			$__ContextMenuLanguage[0] = _GUICtrlMenu_FindItem($__ContextMenu, _GetLanguage('MENU_ADD', 'Add to SciTE'))
			$__ContextMenuLanguage[1] = _GUICtrlMenu_FindItem($__ContextMenu, _GetLanguage('MENU_ABOUT', 'About'))
			$__ContextMenuLanguage[2] = _GUICtrlMenu_FindItem($__ContextMenu, _GetLanguage('MENU_HELP', 'Help file'))

		Case Else
			Switch $iControlID
				Case $__ContextMenu1
					GUICtrlSendToDummy($__Restart)

				Case $__ContextMenu2
					If _GUICtrlMenu_GetItemState($__ContextMenu, $__ContextMenu2, False) Then
						$__IsSort = 0
					Else
						$__IsSort = 1
					EndIf
					_GUICtrlMenu_SetItemChecked($__ContextMenu, $__ContextMenu2, $__IsSort)
					IniWrite(@ScriptDir & "\Settings.ini", "General", "Sort", $__IsSort)
					ControlClick($__GUI, "", $__Refresh)

				Case $__ContextMenu3
					GUICtrlSendToDummy($__Add)

				Case $__ContextMenu4
					GUICtrlSendToDummy($__About)

				Case $__ContextMenu5
					GUICtrlSendToDummy($__Help)

				Case $__Language[0] To $__Language[24]
					Local $iSelect = _GUICtrlMenu_GetItemText($__ContextSubMenu, $iControlID, False)
					If $sDefault == $iSelect Then
						Return 1
					EndIf
					_GUICtrlMenu_CheckRadioItem($__ContextSubMenu, $__Language[0], $__Language[24], $iControlID, False)
					_SetLanguageCurrent($iSelect)
					GUICtrlSendToDummy($__LanguageRefresh)

			EndSwitch
	EndSwitch
EndFunc   ;==>_System_ContextMenu

Func _System_ContextMenuEx()
	Local $aArray[3] = [2, "NotUsed", "Sort"]
	For $A = 1 To $aArray[0]
		If _Is($aArray[$A]) Then
			_GUICtrlMenu_SetItemChecked($__ContextMenu, $A - 1, 1)
		EndIf
	Next
	Return 1
EndFunc   ;==>_System_ContextMenuEx

Func _TempDir()
	Return FileGetLongName(@TempDir)
EndFunc   ;==>_TempDir

Func _TreeView_Create()
	Local $iTreeView = GUICtrlCreateTreeView(10, 70, $__Width - 20, $__Height - 125, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE)
	GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)
	GUICtrlSetState(-1, $GUI_DROPACCEPTED)
	Return $iTreeView
EndFunc   ;==>_TreeView_Create

Func _TreeView_Refresh($iEmpty = 0, $sData = 'TIP_ERROR_1', $sDefault = 'Empty file.')
	Local $aAllAnchors, $iFuncItem = -1, $iRegionItem = -1, $iUserItem = -1, $sFileData

	GUICtrlDelete($__TreeView)
	$__TreeView = _TreeView_Create()
	$__TreeViewCurrent = $__TreeView

	$__TreeViewItems[0][0] = 0

	If $iEmpty Then
		$iUserItem = GUICtrlCreateTreeViewItem(_GetLanguage($sData, $sDefault), $__TreeView)
		_LanguageAdd($__LanguageItems, 1, $iUserItem, $sData, $sDefault)
		GUICtrlSetData($__LineInput, "") ; Need to Comment!
		GUICtrlSetData($__SearchInput, "") ; Need to Comment!
		Return 0
	EndIf

	$sFileData = _GetFile($__CurrentFile[1])
	If @error Then
		$__TreeViewItems[0][2] = 1
		ReDim $__TreeViewItems[2][$__TreeViewItems[0][1]]
		For $A = 0 To $__TreeViewItems[0][1] - 1
			$__TreeViewItems[1][$A] = -1
		Next
	EndIf

	$aAllAnchors = _CreateJumpArray($sFileData)
	If $aAllAnchors[0][0] = 0 Then
		$iUserItem = GUICtrlCreateTreeViewItem(_GetLanguage('TIP_ERROR_2', 'No jump data found.'), $__TreeView)
		_LanguageAdd($__LanguageItems, 1, $iUserItem, 'TIP_ERROR_2', 'No jump data found.')
		Return SetError(1, 0, $aAllAnchors)
	EndIf

	If ($aAllAnchors[0][0] + 1) >= $__TreeViewItems[0][2] Then
		$__TreeViewItems[0][2] = $aAllAnchors[0][0] + 1
		ReDim $__TreeViewItems[$__TreeViewItems[0][2]][$__TreeViewItems[0][1]]
	EndIf

	If BitAND($aAllAnchors[0][2], 1) Then
		$iUserItem = GUICtrlCreateTreeViewItem(_GetLanguage('COMMENTS', 'User comments'), $__TreeView)
		_LanguageAdd($__LanguageItems, 1, $iUserItem, 'COMMENTS', 'User comments')
	EndIf

	If BitAND($aAllAnchors[0][2], 2) Then
		$iFuncItem = GUICtrlCreateTreeViewItem(_GetLanguage('FUNCTIONS', 'Functions'), $__TreeView)
		_LanguageAdd($__LanguageItems, 2, $iFuncItem, 'FUNCTIONS', 'Functions')
	EndIf

	If BitAND($aAllAnchors[0][2], 4) Then
		$iRegionItem = GUICtrlCreateTreeViewItem(_GetLanguage('REGIONS', 'Regions'), $__TreeView)
		_LanguageAdd($__LanguageItems, 3, $iRegionItem, 'REGIONS', 'Regions')
	EndIf

	For $A = 1 To $aAllAnchors[0][0]
		Switch $aAllAnchors[$A][1]
			Case 0
				$__TreeViewItems[0][0] += 1
				$__TreeViewItems[$__TreeViewItems[0][0]][0] = GUICtrlCreateTreeViewItem($aAllAnchors[$A][0], $iUserItem)
				$__TreeViewItems[$__TreeViewItems[0][0]][1] = $aAllAnchors[$A][0]
				$__TreeViewItems[$__TreeViewItems[0][0]][2] = $aAllAnchors[$A][2]
				$__TreeViewItems[$__TreeViewItems[0][0]][3] = 0
			Case 1
				$__TreeViewItems[0][0] += 1
				$__TreeViewItems[$__TreeViewItems[0][0]][0] = GUICtrlCreateTreeViewItem($aAllAnchors[$A][0], $iFuncItem)
				$__TreeViewItems[$__TreeViewItems[0][0]][1] = $aAllAnchors[$A][0]
				$__TreeViewItems[$__TreeViewItems[0][0]][2] = $aAllAnchors[$A][2]
				$__TreeViewItems[$__TreeViewItems[0][0]][3] = 1
			Case 2
				$__TreeViewItems[0][0] += 1
				$__TreeViewItems[$__TreeViewItems[0][0]][0] = GUICtrlCreateTreeViewItem($aAllAnchors[$A][0], $iRegionItem)
				$__TreeViewItems[$__TreeViewItems[0][0]][1] = $aAllAnchors[$A][0]
				$__TreeViewItems[$__TreeViewItems[0][0]][2] = $aAllAnchors[$A][2]
				$__TreeViewItems[$__TreeViewItems[0][0]][3] = 2
		EndSwitch
	Next
	If $iFuncItem > -1 Then
		GUICtrlSetState($iFuncItem, BitOR($GUI_EXPAND, $GUI_DEFBUTTON))
	EndIf
	GUICtrlSetData($__LineInput, "") ; Need to Comment!
	GUICtrlSetData($__SearchInput, "") ; Need to Comment!
	$__TreeViewItems[0][3] = $iFuncItem
EndFunc   ;==>_TreeView_Refresh

Func _Update()
	Local $aArray, $aProcess[3] = [2, "SciTE Jump.exe", "SciTE Jump_x64.exe"], $iDelay = 5, $iInternalDelay = 1, $sData, $sFile, $sFilePath, $sFilePathX64, $sSciTEJump, _
			$sScriptDir, $sScriptFullPath, $sScriptFullPathX64, $sTempDir = _TempDir() & "\"

	If @Compiled = 0 Then
		Return SetError(1, 0, 0)
	EndIf

	$sScriptDir = _SciTE_GetSciTEDefaultHome() & "\" & "SciTEJump\"
	$sSciTEJump = $sScriptDir & $aProcess[1]
	If FileExists($sSciTEJump) = 0 Then
		Return SetError(2, 0, 0)
	EndIf

	If _IsUpdate($sSciTEJump) = 0 Then
		Return SetError(4, 0, 0)
	EndIf

	If MsgBox(4, _ProgramName(), _GetLanguage('UPDATE', 'Would you like to update %PROGRAMNAME%?')) = 7 Then
		Return SetError(4, 0, 0)
	EndIf

	For $A = 1 To $aProcess[0]
		$aArray = ProcessList($aProcess[$A])
		For $B = 1 To $aArray[0][0]
			If $aArray[$B][1] == @AutoItPID Then
				ContinueLoop
			EndIf
			ProcessClose($aArray[$B][1])
		Next
	Next

	$sFile = $sTempDir & _WinAPI_PathRemoveExtension(@ScriptName) & ".bat"
	$sScriptFullPath = @ScriptDir & "\" & _ProgramName() & ".exe"
	$sScriptFullPathX64 = @ScriptDir & "\" & _ProgramName() & "_x64.exe"

	$sFilePath = $sScriptDir & _WinAPI_PathStripPath($sScriptFullPath)
	$sFilePathX64 = $sScriptDir & _WinAPI_PathStripPath($sScriptFullPathX64)
	DirRemove($sScriptDir & "Language\")
	FileMove(@ScriptDir & "\Languages\*.*", $sScriptDir & "Languages\", 9)
	FileMove(@ScriptDir & "\Source\*.*", $sScriptDir & "Source\", 9)
	FileMove(@ScriptDir & "\HelpFile.chm", $sScriptDir & "HelpFile.chm", 9)
	FileCopy(@ScriptDir & "\License.txt", $sScriptDir & "License.txt", 9)
	FileCopy(@ScriptDir & "\Readme.txt", $sScriptDir & "Readme.txt", 9)
	FileCopy($sScriptFullPath, $sFilePath, 9)
	FileCopy($sScriptFullPathX64, $sFilePathX64, 9)

	DirRemove(@ScriptDir & "\Language\", 1)
	DirRemove(@ScriptDir & "\Source\", 1)
	FileSetAttrib(@ScriptDir & "\License.txt", "-R")
	FileDelete(@ScriptDir & "\License.txt")
	FileDelete(@ScriptDir & "\Readme.txt")

	$sData = 'SET TIMER=0' & @CRLF _
			 & ':START' & @CRLF _
			 & 'PING -n ' & $iInternalDelay & ' 127.0.0.1 > nul' & @CRLF _
			 & 'IF %TIMER% GTR ' & $iDelay & ' GOTO END' & @CRLF _
			 & 'SET /A TIMER+=1' & @CRLF _
			 & 'GOTO START' & @CRLF _
			 & @CRLF _
			 & ':END' & @CRLF _
			 & 'RD /S /Q  "' & @ScriptDir & '\Languages\"' & @CRLF _
			 & 'DEL /Q  "' & @ScriptDir & '\Settings.ini"' & @CRLF _
			 & 'DEL /Q "' & $sScriptFullPath & '"' & @CRLF _
			 & 'DEL /Q "' & $sScriptFullPathX64 & '"' & @CRLF _
			 & 'DEL /Q "' & $sFile & '"'

	_SetFile($sData, $sFile, 1)
	Run($sFile, $sTempDir, @SW_HIDE)
	Exit Run('"' & $sFilePath & '"', $sScriptDir)
EndFunc   ;==>_Update

Func _WinWait($sTitle, $iTime)
	Local $iWinExists

	$iTime *= 1000
	Local $iTimer = TimerInit()

	While 1
		$iWinExists = WinExists($sTitle)
		If $iWinExists Or TimerDiff($iTimer) > $iTime Then
			ExitLoop
		EndIf
		Sleep(10)
	WEnd
	Return $iWinExists
EndFunc   ;==>_WinWait

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $ilParam
	Local $iHiWord, $iLoWord, $sInput

	$iHiWord = _WinAPI_HiWord($iwParam)
	$iLoWord = _WinAPI_LoWord($iwParam)

	Switch $iHiWord
		Case $EN_CHANGE
			Switch $iLoWord
				Case $__FindInput
					$sInput = GUICtrlRead($__FindInput)
					Switch StringLen($sInput)
						Case 0
							$__FindItems[0][0] = 0
							$__FindInFile = 0

							$__TreeViewCurrent = $__TreeView
							GUICtrlSetState($__TreeView, $GUI_SHOW)
							GUICtrlDelete($__TreeViewFind)

						Case Else
							GUICtrlSetData($__SearchInput, "") ; Need to Comment!

					EndSwitch

				Case $__LineInput
					$sInput = GUICtrlRead($__LineInput)
					If StringRegExp($sInput, '[^\d]') Then
						$sInput = StringRegExpReplace($sInput, '[^\d]', '')
					EndIf
					If $sInput <> "" Then
						_SciTE_GoToLine($sInput)
					EndIf
					GUICtrlSetData($__LineInput, $sInput)

				Case $__SearchInput
					$sInput = GUICtrlRead($__SearchInput)
					If StringLen($sInput) > 0 And $__SearchText <> $sInput And ($__TreeViewItems[0][0] > 0 Or $__FindItems[0][0] > 0) Then
						_GUIRegisterMsg(0)
						$__SearchText = $sInput
						If $__FindInFile Then
							GUICtrlSetState($__TreeViewFind, $GUI_HIDE)
							_Search($sInput, $__FindItems)
						Else
							GUICtrlSetState($__TreeView, $GUI_HIDE)
							_Search($sInput, $__TreeViewItems)
						EndIf
					ElseIf StringLen($sInput) = 0 Then
						_GUIRegisterMsg(1)
						$__SearchItems[0][0] = 0
						Switch $__FindInFile
							Case 0
								$__TreeViewCurrent = $__TreeView
							Case 1
								_GUIRegisterMsg(1)
								$__TreeViewCurrent = $__TreeViewFind
						EndSwitch
						GUICtrlSetState($__TreeViewCurrent, $GUI_SHOW)
						GUICtrlDelete($__TreeViewSearch)
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func WM_COPYDATA($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $sString, $tData, $tParam, $tString
	$tParam = DllStructCreate("ptr;dword;ptr", $ilParam) ; ulong_ptr;dword;ptr
	$tData = DllStructCreate("char[" & DllStructGetData($tParam, 2) + 1 & "]", DllStructGetData($tParam, 3)) ; wchar
	$tString = DllStructGetData($tData, 1)
	$sString = StringLeft($tString, DllStructGetData($tParam, 2))
	$__SciTEDummy[2] = $sString
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COPYDATA

Func WM_GETMINMAXINFO($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $aControl, $tStructure

	$aControl = ControlGetPos($__SciTEDummy[5], "", "[CLASS:Scintilla; INSTANCE:1]")
	If @error = 0 Then
		If $aControl[3] - 50 < $__HeightMinimum Then
			$__HeightMinimum = $aControl[3] - 50
		EndIf
	EndIf
	$tStructure = DllStructCreate("int;int;int;int;int;int;int;int;int;int", $ilParam)
	DllStructSetData($tStructure, 7, $__WidthMinimum + 16)
	DllStructSetData($tStructure, 8, $__HeightMinimum + 38)
	DllStructSetData($tStructure, 9, @DesktopWidth)
	DllStructSetData($tStructure, 10, @DesktopHeight)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_GETMINMAXINFO

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iCode, $iIDFrom, $iItem, $tHitTest, $tNMHDR, $tPoint

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = DllStructGetData($tNMHDR, "hWndFrom")
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")

	Switch $iIDFrom
		Case $__TreeView
			Switch $iCode
				Case $NM_RCLICK
					$tPoint = _WinAPI_GetMousePos(True, $hWndFrom)
					$tHitTest = _GUICtrlTreeView_HitTestEx($hWndFrom, DllStructGetData($tPoint, 1), DllStructGetData($tPoint, 2))
					If BitAND(DllStructGetData($tHitTest, "Flags"), $TVHT_ONITEM) Then
						$iItem = DllStructGetData($tHitTest, 'Item')
						_GUICtrlTreeView_ContextMenu($__GUI, $iItem, 1)
						If @error = 0 Then
							_GUICtrlTreeView_SelectItem($hWndFrom, $iItem)
						EndIf
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	$__Width = BitAND($ilParam, 0xFFFF)
	$__Height = BitShift($ilParam, 16)
	_WinAPI_MoveWindow($__Combo, 10, $__Height - 25, $__Width - 45, 20, True)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE

Func WM_SYSCOMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $ilParam
	$iwParam = Number($iwParam)
	Switch $iwParam
		Case $__ContextMenu1 To $__Language[24]
			_System_ContextMenu(-1, $iwParam)

	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SYSCOMMAND

#region Start >>>>> ExtendedInfo Code From http://autoit.de/index.php?page=Thread&threadID=30305 <<<<<
Func _GetFileInfo($aFunctions, $sData)
	Local $aFunctionVariables, $aIncludes, $aVariables, $sReturn

	$aIncludes = _GetIncludeInfo($sData)
	If @error = 0 Then
		_Sort($aIncludes, 1, 1, $aIncludes[0], 0)

		_SetCustomVariable(1, $aIncludes[0])
		$sReturn &= '# ' & StringUpper(_GetLanguage('TIP_EXPORT_5', 'Total number of includes - %TOTALNUMBER%')) & ' #' & @CRLF
		For $A = 1 To $aIncludes[0]
			$sReturn &= '> ' & $aIncludes[$A] & @CRLF
		Next
		$sReturn &= @CRLF
	EndIf

	$aVariables = _GetVariablesOutsideFunction($sData, $aFunctions)
	If @error = 0 Then
		_Sort($aVariables, 1, 1, $aVariables[0], 0)

		_SetCustomVariable(1, $aVariables[0])
		$sReturn &= '# ' & StringUpper(_GetLanguage('TIP_EXPORT_6', 'Total number of Global variables - %TOTALNUMBER%')) & ' #' & @CRLF
		For $A = 1 To $aVariables[0]
			$sReturn &= '> $' & $aVariables[$A] & @CRLF
		Next
		$sReturn &= @CRLF
	EndIf


	If $aFunctions[0] > 0 Then
		_Sort($aFunctions, 0, 1, $aFunctions[0], 0)

		_SetCustomVariable(1, $aFunctions[0])
		$sReturn &= '# ' & StringUpper(_GetLanguage('TIP_EXPORT_1', 'Total number of functions - %TOTALNUMBER%')) & ' #' & @CRLF
		For $A = 1 To $aFunctions[0]
			$aFunctionVariables = _GetVariablesInFunction($sData, $aFunctions[$A])
			If @error = 0 Then
				_Sort($aFunctionVariables, 1, 1, $aFunctionVariables[0], 0)

				$sReturn &= '> ' & $aFunctions[$A] & ' [' & $aFunctionVariables[0] & ']:' & @CRLF
				For $B = 1 To $aFunctionVariables[0]
					$sReturn &= @TAB & "$" & $aFunctionVariables[$B] & @CRLF
				Next
				If ($A < $aFunctions[0]) Then
					$sReturn &= @CRLF
				EndIf
			EndIf
		Next
		$sReturn &= @CRLF
	EndIf
	Return $sReturn
EndFunc   ;==>_GetFileInfo

Func _GetFunctionInfo($sData) ; Not Used: By James1337 And Modified By softwarespot.
	Local $aReturn, $aError[1] = [0]

	$aReturn = StringRegExp("Func _GetFunctionInfo()" & @CRLF & "EndFunc" & @CRLF & $sData, '(?i)(?:Func[\s]+)([\w]{1,})(?:[\s]*\()', 3)
	If @error Then
		Return SetError(1, 0, $aError)
	EndIf
	$aReturn[0] = UBound($aReturn) - 1
	If $aReturn[0] = 0 Then
		Return SetError(2, 0, $aReturn)
	EndIf
	Return $aReturn
EndFunc   ;==>_GetFunctionInfo

Func _GetIncludeInfo($sData) ; By James1337 And Modified By softwarespot.
	Local $aArray, $aError[1] = [0], $iUbound

	$aArray = StringRegExp($sData, '(?i)(?:\#include [\<\"\''])([\w\. ]{1,})(?:[\>\"\''])', 3)
	If @error Then
		Return SetError(1, 0, $aError)
	EndIf
	$iUbound = UBound($aArray)
	Local $aReturn[$iUbound + 1] = [0]
	For $A = 0 To $iUbound - 1
		$aReturn[0] += 1
		$aReturn[$aReturn[0]] = $aArray[$A]
	Next
	If $aReturn[0] = 0 Then
		Return SetError(2, 0, $aReturn)
	EndIf
	Return $aReturn
EndFunc   ;==>_GetIncludeInfo

Func _GetVariableInfo($sData) ; By James1337 And Modified By softwarespot.
	Local $aReturn, $aError[1] = [0]

	$aReturn = StringRegExp("$_GetVariables" & @CRLF & $sData, '(?:\$)([\w]{1,})(?:[\s\[\.\=\+\-\*\/\^\,\)])', 3)
	If @error Then
		Return SetError(1, 0, $aError)
	EndIf
	$aReturn[0] = UBound($aReturn) - 1
	If $aReturn[0] = 0 Then
		Return SetError(2, 0, $aReturn)
	EndIf
	Return $aReturn
EndFunc   ;==>_GetVariableInfo

Func _GetVariablesInFunction($sData, $sFunction) ; By James1337 And Modified By softwarespot.
	Local $aError[1] = [0], $bString_1 = BinaryToString('0x0101010101'), $bString_2 = BinaryToString('0x1010101010')
	$sData = StringRegExpReplace($sData, '(?i)\n[\s]*Func[\s]+' & $sFunction & '[\s]*\(', $bString_1, 0)
	$sData = StringRegExpReplace($sData, '(?i)\n[\s]*EndFunc', $bString_2, 0)
	Local $iPos_1 = StringInStr($sData, $bString_1, 2, 1)
	Local $iPos_2 = StringInStr($sData, $bString_2, 2, 1, $iPos_1)
	If Not (($iPos_1 > 0) And ($iPos_2 > $iPos_1)) Then
		Return SetError(1, 0, $aError)
	EndIf

	$sData = StringMid($sData, $iPos_1, $iPos_2 - $iPos_1 + StringLen($bString_1))
	Local $aReturn = _GetVariableInfo($sData)
	Return SetError(@error, 0, $aReturn)
EndFunc   ;==>_GetVariablesInFunction

Func _GetVariablesOutsideFunction($sData, $aFunctions) ; By James1337 And Modified By softwarespot.
	Local $bString_1 = BinaryToString('0x0101010101'), $bString_2 = BinaryToString('0x1010101010'), $iPos_1, $iPos_2
	If @error = 0 Then
		For $A = 1 To $aFunctions[0]
			$sData = StringRegExpReplace($sData, '(?i)\n[\s]*Func[\s]+' & $aFunctions[$A] & '[\s]*\(', $bString_1, 0)
			$sData = StringRegExpReplace($sData, '(?i)\n[\s]*EndFunc', $bString_2, 0)
			$iPos_1 = StringInStr($sData, $bString_1, 2, 1)
			$iPos_2 = StringInStr($sData, $bString_2, 2, 1, $iPos_1)
			If (($iPos_1 > 0) And ($iPos_2 > $iPos_1)) Then
				$sData = StringReplace($sData, StringMid($sData, $iPos_1, $iPos_2 - $iPos_1 + StringLen($bString_1)), '', 0, 1)
			EndIf
		Next
	EndIf
	Local $aReturn = _GetVariableInfo($sData)
	Return SetError(@error, 0, $aReturn)
EndFunc   ;==>_GetVariablesOutsideFunction

Func _Sort(ByRef $aArray, $iUnique, $iStart, $iEnd, $iReturn)
	Local $sOutput = ""

	If $iUnique Then
		For $A = $iStart To $iEnd
			If StringInStr(@CRLF & $sOutput, @CRLF & $aArray[$A] & @CRLF, 2) = 0 Then
				$sOutput &= $aArray[$A] & @CRLF
			EndIf
		Next
	Else
		For $A = $iStart To $iEnd
			$sOutput &= $aArray[$A] & @CRLF
		Next
	EndIf
	Local $iPID = Run("sort.exe", @SystemDir, @SW_HIDE, $STDIN_CHILD + $STDOUT_CHILD)
	StdinWrite($iPID, $sOutput)
	StdinWrite($iPID)
	$sOutput = ""
	While 1
		$sOutput &= StdoutRead($iPID)
		If @error Then
			ExitLoop
		EndIf
	WEnd
	$aArray = StringSplit(StringStripWS($sOutput, 3), @LF, $iReturn)
EndFunc   ;==>_Sort
#region End >>>>> ExtendedInfo Code From http://autoit.de/index.php?page=Thread&threadID=30305 <<<<<

#region Start >>>>> Additional Language Strings <<<<<
#cs
	_GetLanguage('LANGUAGE_AUTHOR', 'Thanks to %LANGUAGEAUTHOR% for the %LANGUAGE% translation. The translation was created on the %LANGUAGEUPDATED%.')
	_GetLanguage('TIP_ERROR_1', 'Empty file.')
	_GetLanguage("TIP_ERROR_3", "File doesn't exist.")
	_GetLanguage('TIP_ERROR_4', 'SciTE seems to be closed.')
#ce
#region End >>>>> Additional Language Strings <<<<<
