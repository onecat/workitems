#include-once
#include <WinAPI.au3>

Func _GetLanguage($sData, $sDefault, $iEnvironmentVariables = 1)
	Local $sCurrentLanguage
	$sCurrentLanguage = _GetLanguageCurrent()
	$sData = IniRead(@ScriptDir & "\Languages\" & $sCurrentLanguage & ".lng", "Language", $sData, $sDefault)
	If $iEnvironmentVariables = 1 Then
		$sData = _WinAPI_ExpandEnvironmentStrings($sData)
		If @error = 1 Then
			$sData = _WinAPI_ExpandEnvironmentStrings($sDefault)
		EndIf
	EndIf
	$sData = StringReplace($sData, "@NL", " @CRLF ")
	$sData = StringReplace($sData, "@TAB", " @TAB ")
	$sData = StringStripWS($sData, 4)
	$sData = StringReplace($sData, "@CRLF ", @CRLF)
	$sData = StringReplace($sData, "@TAB ", @TAB)
	Return $sData
EndFunc   ;==>_GetLanguage

Func _GetLanguageAuthor($sKey, $sData)
	_SetLanguageVariables()
	Return _GetLanguage($sKey, $sData)
EndFunc   ;==>_GetLanguageAuthor

Func _GetLanguageCode($sLanguage = -1)
	Local $sCode = "unknown"
	If $sLanguage = -1 Then
		$sLanguage = _GetLanguageCurrent()
	EndIf
	If $sLanguage == "English" Then
		$sCode = "gb"
	EndIf
	Return StringLower(IniRead(@ScriptDir & "\Languages\" & $sLanguage & ".lng", "Country", "CODE", $sCode))
EndFunc   ;==>_GetLanguageCode

Func _GetLanguageCurrent()
	Local $sData
	$sData = IniRead(@ScriptDir & "\Settings.ini", "General", "Language", -1)
	If $sData = -1 Then
		$sData = _SetLanguageCurrent(_GetLanguageOS())
	EndIf
	If FileExists(@ScriptDir & "\Languages\" & $sData & ".lng") = 0 Then
		$sData = "English"
	EndIf
	Return $sData
EndFunc   ;==>_GetLanguageCurrent

Func _GetLanguageList($iString)
	Local $aDefault[2] = [1, @ScriptDir & "\Languages\" & "English.lng"], $aReturn, $sReturn

	$aReturn = _FileListToArrayEx(@ScriptDir & "\Languages\", "*.lng")
	If @error Then
		$aReturn = $aDefault
	EndIf
	For $A = 1 To $aReturn[0]
		Switch $iString
			Case 0
				$aReturn[$A] = StringRegExpReplace($aReturn[$A], "^.*\\|\..*$", "")

			Case 1
				$sReturn = $aReturn[$A] & "|"

		EndSwitch
	Next
	If $iString Then
		Return $sReturn
	EndIf
	Return $aReturn
EndFunc   ;==>_GetLanguageList

Func _GetLanguageOS()
	Local $aString[21] = [20, "0409 0809 0c09 1009 1409 1809 1c09 2009 2409 2809 2c09 3009 3409", "0404 0804 0c04 1004 0406", "0406", "0413 0813", "0425", _
			"040b", "040c 080c 0c0c 100c 140c 180c", "0407 0807 0c07 1007 1407", "040e", "0410 0810", _
			"0411", "0414 0814", "0415", "0816", "0416", "0418", _
			"0419", "081a 0c1a", "040a 080a 0c0a 100a 140a 180a 1c0a 200a 240a 280a 2c0a 300a 340a 380a 3c0a 400a 440a 480a 4c0a 500a", "041d 081d"]

	Local $aLanguage[21] = [20, "English", "Chinese", "Danish", "Dutch", "Estonian", "Finnish", "French", "German", "Hungarian", "Italian", _
			"Japanese", "Norwegian", "Polish", "Portuguese", "Brazilian Portuguese", "Romanian", "Russian", "Serbian", "Spanish", "Swedish"]
	For $A = 1 To $aString[0]
		If StringInStr($aString[$A], @OSLang) Then
			Return $aLanguage[$A]
		EndIf
	Next
	Return $aLanguage[1]
EndFunc   ;==>_GetLanguageOS

Func _SetLanguageCurrent($sLanguage)
	IniWrite(@ScriptDir & "\Settings.ini", "General", "Language", $sLanguage)
	Return $sLanguage
EndFunc   ;==>_SetLanguageCurrent

Func _SetLanguageVariables()
	Local $sLanguage = _GetLanguageCurrent()
	Local $aArray[5][3] = [[4, 3], _
			["LANGUAGE", $sLanguage, $sLanguage], _
			["LANGUAGEAUTHOR", "AUTHOR", "SoftwareSpot"], _
			["LANGUAGEUPDATED", "UPDATED", StringRegExpReplace(FileGetTime(@ScriptFullPath, 1, 1), "^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$", "$3/$2/$1")], _
			["LANGUAGEVERSION", "VERSION", FileGetVersion(@ScriptFullPath)]], $sFileName

	$sFileName = @ScriptDir & "\Languages\" & $sLanguage & ".lng"
	For $A = 1 To $aArray[0][0]
		EnvSet($aArray[$A][0], IniRead($sFileName, "Author", $aArray[$A][1], $aArray[$A][2]))
	Next
	Return $aArray
EndFunc   ;==>_SetLanguageVariables

Func _ProgramName()
	Return _WinAPI_ExpandEnvironmentStrings("%PROGRAMNAME%")
EndFunc   ;==>_ProgramName

Func _SetCustomVariable($iIndex = -1, $sString = -1)
	Local $aArray[3][2] = [[2, 2], _
			["TOTALNUMBER", 0], _
			["CREATIONDATE", 0]]
	If $iIndex = -1 Then
		For $A = 1 To $aArray[0][0]
			EnvSet($aArray[$A][0], $aArray[$A][1])
		Next
		Return $aArray
	EndIf
	Return EnvSet($aArray[$iIndex][0], $sString)
EndFunc   ;==>_SetCustomVariable

Func _SetVariables()
	Local $iStartYear = 2011
	If Number($iStartYear) <> @YEAR Then
		$iStartYear = $iStartYear & "-" & @YEAR
	EndIf
	Local $aArray[6][2] = [[5, 2], _
			["COPYRIGHT", "SoftwareSpot " & Chr(169) & " " & $iStartYear], _
			["LICENSE", "GPLv3"], _
			["PROGRAMNAME", "SciTE Jump"], _
			["VERSION", FileGetVersion(@ScriptFullPath)], _
			["WEBSITE", "http://softwarespot.wordpress.com"]]

	For $A = 1 To $aArray[0][0]
		EnvSet($aArray[$A][0], $aArray[$A][1])
	Next
	Return $aArray
EndFunc   ;==>_SetVariables

Func _FileListToArrayEx($sFilePath, $sFilter = "*") ; Taken From: _FileListToArray() & Optimised By guinness For Increase In Speed (Reduction Of 0.50ms.)
	Local $aError[1] = [0], $hSearch, $sFile, $sReturn = ""

	If FileExists($sFilePath) = 0 Then
		Return SetError(1, 0, $aError)
	EndIf
	$hSearch = FileFindFirstFile($sFilePath & $sFilter)
	If $hSearch = -1 Then
		Return SetError(2, 0, $aError)
	EndIf

	While 1
		$sFile = FileFindNextFile($hSearch)
		If @error Then
			ExitLoop
		EndIf
		$sReturn &= $sFilePath & $sFile & "*"
	WEnd
	FileClose($hSearch)
	If $sReturn = "" Then
		Return SetError(3, 0, $aError)
	EndIf
	Return StringSplit(StringTrimRight($sReturn, 1), "*")
EndFunc   ;==>_FileListToArrayEx