; ===============================================================================================================================
; isnautoitstudio_plugin.au3 for ISN AUTOIT STUDIO PLUGINS
; v.0.4 by ISI360
; ===============================================================================================================================
#include-once
#include <MailSlot.au3> ;Es wird ZWINGEND die MailSlot.au3 benötigt!!!

; ====== Umgebungsvariablen ======
;Einige dieser Variablen werden erst befüllt wenn das ISN AutoIt Studio die Umgebungsvariablen zum Plugin sendet!
;Um einige dieser Variablen zu aktualisieren kann mit "_ISNPlugin_Nachricht_senden("askforenvironmentvariables")" der aktuellste Inhalt angefordert werden

Global $Mailslot_Name_ISN_AutoIt_Studio = "" ;Mailboxpfad der ISN Session (NICHT VERÄNDERN!)
Global $ISN_Plugin_Warte_auf_Nachricht = 0 ;Ist 1 wenn gerade auf eine bestimmte Nachricht gewartet wird (sperrt zb. die Func "_ISNPlugin_bekannte_Nachrichten_verarbeiten")
Global $ISN_AutoIt_Studio_Projektpfad = "" ;Pfad des aktuell geöffneten Projektes
Global $ISN_AutoIt_Studio_Konfigurationsdatei_Pfad = "" ;Pfad zur config.ini des ISN AutoIt Studios
Global $ISN_AutoIt_Studio_Fensterhandle = "" ;Handle zum ISN AutoIt Studio Fenster


#cs
	Available functions:
	_ISNPlugin_Get_langstring
	_ISNPlugin_erstelle_Mailslot
	_ISNPlugin_beende_Mailslot
	_ISNPlugin_pruefe_auf_neue_Nachrichten
	_ISNPlugin_Nachricht_lesen
	_ISNPlugin_Starte_Funktion_im_ISN
	_ISNPlugin_Execute_im_ISN
	_ISNPlugin_Nachricht_senden
	_ISNPlugin_Warte_auf_Nachricht
	_ISNPlugin_Warte_auf_ISN_und_initialisiere_Kommunikation
	_ISNPlugin_bekannte_Nachrichten_verarbeiten
	_ISNPlugin_Studio_Set_Statusbartext
	_ISNPlugin_Studio_Get_Statusbartext
	_ISNPlugin_Get_Variable
	_ISNPlugin_Set_Variable
	
	INTERNAL USE ONLY:
	_Pluginstring_get_element
#ce





; #FUNCTION# ====================================================================================================================
; Name...........: _ISNPlugin_Get_langstring($id)
; Description ...: Gibt einen String (ID) in der jewailigen Sprache zurück
; Syntax.........: $id		- ID des Strings (in der Sprachdatei)
; Return Value(s): Text string
; Author ........: ISI360
; ===============================================================================================================================
Func _ISNPlugin_Get_langstring($id)
	If FileExists(@ScriptDir & "\plugin.ini") Then
		If FileExists(@ScriptDir & "\language\" & IniRead(@ScriptDir & "\plugin.ini", "plugin", "language", "#error#")) Then
			$get = IniRead(@ScriptDir & "\language\" & IniRead(@ScriptDir & "\plugin.ini", "plugin", "language", "#error#"), "plugin", "str" & $id, "#error#")
			;falls string nicht gefunden...fallback zur englischen sprache
			If $get = "#error#" Then
				$get = IniRead(@ScriptDir & "\language\english.lng", "plugin", "str" & $id, "#LANGUAGE_ERROR#ID#" & $id)
			EndIf
			$get = StringReplace($get, "[BREAK]", @CRLF)
			Return $get
		Else
			;fallback to english
			If FileExists(@ScriptDir & "\language\english.lng") Then
				$get = IniRead(@ScriptDir & "\language\english.lng", "plugin", "str" & $id, "#LANGUAGE_ERROR#ID#" & $id)
				$get = StringReplace($get, "[BREAK]", @CRLF)
				Return $get
			Else
				Return ("#ERROR#LANGUAGEFILE NOT FOUND!#")
			EndIf
		EndIf
	Else
		Return ("#ERROR#NO PLUGIN.INI!#")
	EndIf
EndFunc   ;==>_ISNPlugin_Get_langstring

;==========================================================================================
;
; Name...........: _ISNPlugin_erstelle_Mailslot
; Description ...: Erstellt für das Plugin einen Mailslot wodurch das Plugin mit dem ISN kommunizieren kann.
; Syntax.........: _ISNPlugin_erstelle_Mailslot()
; Parameters ....: None
; Return values .: Handle des Mailslots
; Author ........: ISI360
; Modified.......:
; Remarks .......: Der Slotname ist wie folgt aufgebaut: \\.\mailslot\ISNPLUGIN_PID
;
;==========================================================================================
Func _ISNPlugin_erstelle_Mailslot()
	$hMailSlot = _MailSlotCreate("\\.\mailslot\ISNPLUGIN_" & @AutoItPID)
	Return $hMailSlot
EndFunc   ;==>_ISNPlugin_erstelle_Mailslot

;==========================================================================================
;
; Name...........: _ISNPlugin_beende_Mailslot
; Description ...: Schließt einen Mailslot und löscht alle darin enthaltenen Nachrichten.
; Syntax.........: _ISNPlugin_beende_Mailslot($hMailSlot)
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
; Return values .: Success - Returns 1
;                          - Sets @error to 0
;                  Failure - Returns 0 and sets @error:
;                  |1 - CloseHandle function or call to it failed.
; Author ........: ISI360
; Modified.......:
; Remarks .......:
;
;==========================================================================================
Func _ISNPlugin_beende_Mailslot($hMailSlot = "")
	If $hMailSlot = "" Then Return 0
	Return _MailSlotClose($hMailSlot)
EndFunc   ;==>_ISNPlugin_beende_Mailslot

;==========================================================================================
;
; Name...........: _ISNPlugin_pruefe_auf_neue_Nachrichten
; Description ...: Prüft ob vom ISN neue Nachrichten eingelangt sind
; Syntax.........: _ISNPlugin_pruefe_auf_neue_Nachrichten($hMailSlot)
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
; Return values .: Success - Returns the number of the messages in the mailslot waiting to be read.
;                          - Sets @error to 0
;                  Failure - Returns 0 and sets @error:
;                  |1 - GetMailslotInfo function or call to it failed.
; Author ........: ISI360
; Modified.......:
; Remarks .......:
;
;==========================================================================================
Func _ISNPlugin_pruefe_auf_neue_Nachrichten($hMailSlot = "")
	If $hMailSlot = "" Then Return 0
	Return _MailSlotGetMessageCount($hMailSlot)
EndFunc   ;==>_ISNPlugin_pruefe_auf_neue_Nachrichten

;==========================================================================================
;
; Name...........: _ISNPlugin_Nachricht_lesen
; Description ...: Liest den Text der eingegangenen Nachricht aus dem Mailslot
; Syntax.........: _ISNPlugin_Nachricht_lesen($hMailSlot)
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
; Return values .: Text der Nachricht
;                  ""         - Fehler
; Author ........: ISI360
; Modified.......:
; Remarks .......: Es wird immer nur eine Nachricht ausgelesen! Um zur nächsten zu gelangen einfach nochmal "_ISNPlugin_Nachricht_lesen" ausführen.
;                  Eine gelesene Nachricht wird automatisch gelöscht!
;
;==========================================================================================
Func _ISNPlugin_Nachricht_lesen($hMailSlot = "")
	If $hMailSlot = "" Then Return ""
	If _ISNPlugin_pruefe_auf_neue_Nachrichten($hMailSlot) = 0 Then Return ""
	Local $iSize = _MailSlotCheckForNextMessage($hMailSlot)
	If $iSize Then
		Local $sData = _MailSlotRead($hMailSlot, $iSize, 1)
	EndIf
	Return $sData
EndFunc   ;==>_ISNPlugin_Nachricht_lesen


;==========================================================================================
;
; Name...........: _ISNPlugin_Starte_Funktion_im_ISN
; Description ...: Startet eine angegebene Funktion im ISN AutoIt Studio
; Syntax.........: _ISNPlugin_Starte_Funktion_im_ISN($funcname [,$param1,$param2,$param3,$param4,$param5,,$param6,$param7])
; Parameters ....: $funcname - Name der Funktion die ausgeführt werden soll (zb. "_exit")
; Return values .: 0 - Kein $Funcname angegeben!
;                  1 - Erfolg
; Author ........: ISI360
; Modified.......:
; Remarks .......: Es können bis zu 4 Paramenter angegeben werden! [optional]
;
;==========================================================================================
Func _ISNPlugin_Starte_Funktion_im_ISN($funcname = "", $param1 = "", $param2 = "", $param3 = "", $param4 = "", $param5 = "", $param6 = "", $param7 = "")
	If $funcname = "" Then Return 0
	$Parameter = ""
	If $param1 <> "" Then $Parameter = $Parameter & $param1 & "|"
	If $param2 <> "" Then $Parameter = $Parameter & $param2 & "|"
	If $param3 <> "" Then $Parameter = $Parameter & $param3 & "|"
	If $param4 <> "" Then $Parameter = $Parameter & $param4 & "|"
	If $param5 <> "" Then $Parameter = $Parameter & $param5 & "|"
	If $param6 <> "" Then $Parameter = $Parameter & $param6 & "|"
	If $param7 <> "" Then $Parameter = $Parameter & $param7
	If $Parameter <> "" Then $Parameter = "|" & $Parameter
	_ISNPlugin_Nachricht_senden("callfunc|" & $funcname & $Parameter)
	Return 1
EndFunc   ;==>_ISNPlugin_Starte_Funktion_im_ISN

;==========================================================================================
;
; Name...........: _ISNPlugin_Execute_im_ISN
; Description ...: Startet eine Befehl mittels Execute im ISN AutoIt Studio
; Syntax.........: _ISNPlugin_Execute_im_ISN($befehl)
; Parameters ....: $befehl - Befehl der ausgeführt werden soll
; Return values .: none
; Author ........: ISI360
; Modified.......:
; Remarks .......: 
;
;==========================================================================================
Func _ISNPlugin_Execute_im_ISN($befehl = "")
	If $befehl = "" Then Return
	_ISNPlugin_Nachricht_senden("execute|" & $befehl)
EndFunc   ;==>_ISNPlugin_Execute_im_ISN


;==========================================================================================
;
; Name...........: _ISNPlugin_Nachricht_senden
; Description ...: Sendet eine Nachricht zurück an das ISN
; Syntax.........: _ISNPlugin_beende_Mailslot($hMailSlot)
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
; Return values .: 0 - Nachricht erfolgreich übertragen
;                  1 - $Mailslot_Name_ISN_AutoIt_Studio ist leer -> Kein Mailslotpfad zum ISN verfügbar!!!
;                  2 - Kein Text angegeben
;                  3 - Account that you try to send to likely doesn't exist!
;                  4 - Message is blocked!
;                  5 - Message is send but there is an open handle left.
;                  6 - All is fucked up!
; Author ........: ISI360
; Modified.......:
; Remarks .......:
;
;==========================================================================================
Func _ISNPlugin_Nachricht_senden($Text = "")
	If $Mailslot_Name_ISN_AutoIt_Studio = "" Then Return 1
	If $Text = "" Then Return 2
	_MailSlotWrite($Mailslot_Name_ISN_AutoIt_Studio, @AutoItPID & "|" & $Text)
	Switch @error
		Case 1
			Return 3
		Case 2
			Return 4
		Case 3
			Return 5
		Case 4
			Return 6
		Case Else
			Return 0
	EndSwitch
EndFunc   ;==>_ISNPlugin_Nachricht_senden

;==========================================================================================
;
; Name...........: _ISNPlugin_Warte_auf_Nachricht
; Description ...: Wartet auf eine Nachricht mit dem angegebenen Inhalt
; Syntax.........: _ISNPlugin_Warte_auf_Nachricht($hMailSlot,$Zu_erwartende_Nachricht,$Timeout)
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
;                  $Zu_erwartende_Nachricht - Nachricht auf die gewartet werden soll
;                  $Timeout - Timeout in ms
; Return values .: 0 - Timeout
;                  1 - Komplette empfangene Nachricht
;                  2 - $hMailSlot ist leer
;                  3 - $Zu_erwartende_Nachricht ist leer
; Author ........: ISI360
; Modified.......:
; Remarks .......: Diese Funktion pausiert das Skript so lange bis die benötigte Nachricht eingetroffen oder das Timout ausläuft
;
;==========================================================================================
Func _ISNPlugin_Warte_auf_Nachricht($hMailSlot = "", $Zu_erwartende_Nachricht = "", $Timeout = 5000)
	If $ISN_Plugin_Warte_auf_Nachricht = 1 Then Return
	If $hMailSlot = "" Then Return 2
	If $Zu_erwartende_Nachricht = "" Then Return 3
	Local $Gelesene_Nachricht = ""
	$ISN_Plugin_Warte_auf_Nachricht = 1
	While 1
		If _ISNPlugin_pruefe_auf_neue_Nachrichten($hMailSlot) <> 0 Then
			$Gelesene_Nachricht = _ISNPlugin_Nachricht_lesen($hMailSlot)
			If StringInStr($Gelesene_Nachricht, $Zu_erwartende_Nachricht) Then ExitLoop
		EndIf
		$Timeout = $Timeout - 100
		If $Timeout < 0 Then ExitLoop
		Sleep(100)
	WEnd
	$ISN_Plugin_Warte_auf_Nachricht = 0
	If $Timeout < 0 Then Return 0
	Return $Gelesene_Nachricht
EndFunc   ;==>_ISNPlugin_Warte_auf_Nachricht


;==========================================================================================
;
; Name...........: _ISNPlugin_Warte_auf_ISN_und_initialisiere_Kommunikation
; Description ...: Wartet auf das "ok" des ISN AutoIt Studios. Diese Funktion sollte direkt am Anfang deines Skriptes und NACH _ISNPlugin_erstelle_Mailslot() ausgeführt werden!
; Syntax.........: _ISNPlugin_Warte_auf_ISN_und_initialisiere_Kommunikation($hMailSlot [, $hgui])
; Parameters ....: $hMailSlot - Handle des zuvor erstellten Mailslots
;                  $hgui - GUI Handle das zum ISN übertragen wird und in das Fenster des ISN eingebettet wird
; Return values .: 0 - Keine Antwort
;                  1 - Antwort erhalten
; Author ........: ISI360
; Modified.......:
; Remarks .......: Darf nicht VOR _ISNPlugin_erstelle_Mailslot() ausgeführt werden!
;                  Durch diese Funktion wird die Variable $Mailslot_Name_ISN_AutoIt_Studio befüllt! Damit weiß das Plugin den Mailslot-Pfad zum ISN.
;                  Die in $hgui angegebene GUI wird zum ISN übertragen und in das Fenster des ISN AutoIt Studios eingebettet
;==========================================================================================
Func _ISNPlugin_Warte_auf_ISN_und_initialisiere_Kommunikation($hMailSlot = "", $hgui = "")
	Local $Nachricht = _ISNPlugin_Warte_auf_Nachricht($hMailSlot, "hello")
	If $Nachricht = "0" Then ;Warte bis das ISN "hello" zu uns sagt
		$Mailslot_Name_ISN_AutoIt_Studio = ""
		Return 0 ;Das ISN antwortet nicht...ich werde nicht mehr gebraucht :(
	Else
		;ISN hat uns "hello" und den seinen MailSlot Pfad gesendet!
		$Mailslot_Name_ISN_AutoIt_Studio = StringReplace($Nachricht, "|hello", "")
		If $hgui <> "" Then
			_ISNPlugin_Nachricht_senden("setparent|" & $hgui)
		EndIf
		Return 1
	EndIf
EndFunc   ;==>_ISNPlugin_Warte_auf_ISN_und_initialisiere_Kommunikation

;==========================================================================================
;
; Name...........: _Pluginstring_get_element
; Description ...: Gibt das gewünschte Element aus einem Plugin Nachrichtenstring zurück
; Syntax.........: _Pluginstring_get_element($string,$Element)
; Parameters ....: $string - Nachricht aus dem Plugin
;                  $Element - Welches Element zurückgegeben werden soll (zero based index)
; Return values .: Text
;                  ""         - Fehler
; Author ........: ISI360
; Modified.......:
; Remarks .......: zb. _Pluginstring_get_element("123|test|xyz",1) würde "test" zurückgeben
;                 [0] = Absende PID des Plugins
;                 [1] = Befehl
;                 [2] = Data
;==========================================================================================
Func _Pluginstring_get_element($string = "", $Element = 0)
	If $string = "" Then Return ""
	$Split = StringSplit($string, "|", 2)
	If Not IsArray($Split) Then Return ""
	If $Element > UBound($Split) - 1 Then Return ""
	Return $Split[$Element]
EndFunc   ;==>_Pluginstring_get_element


; #FUNCTION# ====================================================================================================================
; Name...........: _ISNPlugin_Studio_Set_Statusbartext($text)
; Description ...: Sendet einen Text vom Plugin in die Statusbar des ISN Studios
; Syntax.........: $text		- Text der gesendet werden soll
; Return Value(s): True			- Erfolg
; 				   False		- Fehler
; Author ........: ISI360
; ===============================================================================================================================
Func _ISNPlugin_Studio_Set_Statusbartext($Text = "")
	If $Text = "" Then Return False
	If $ISN_AutoIt_Studio_Fensterhandle = "" Then Return False
	Local $ControlHandle = ControlGetHandle($ISN_AutoIt_Studio_Fensterhandle, "", "[CLASS:msctls_statusbar32]")
	Return _GUICtrlStatusBar_SetText(ControlGetHandle($ISN_AutoIt_Studio_Fensterhandle, "", $ControlHandle), $Text)
EndFunc   ;==>_ISNPlugin_Studio_Set_Statusbartext


; #FUNCTION# ====================================================================================================================
; Name...........: _ISNPlugin_Studio_Get_Statusbartext($part)
; Description ...: Liest den Text der Statusbar im ISN Studio
; Syntax.........: $part 		- Zero based part index of the statusbar [optional]
; Return Value(s): Text string
; Author ........: ISI360
; ===============================================================================================================================
Func _ISNPlugin_Studio_Get_Statusbartext($part = 0)
	If $ISN_AutoIt_Studio_Fensterhandle = "" Then Return False
;~ $handle_plugin_inside = _WinAPI_GetAncestor($ISN_AutoIt_Studio_Fensterhandle, $GA_PARENT)
;~ $handle_Studio = _WinAPI_GetAncestor($handle_plugin_inside, $GA_ROOTOWNER)
	Local $ControlHandle = ControlGetHandle($ISN_AutoIt_Studio_Fensterhandle, "", "[CLASS:msctls_statusbar32]")
	Return _GUICtrlStatusBar_GetText(ControlGetHandle($ISN_AutoIt_Studio_Fensterhandle, "", $ControlHandle), $part)
EndFunc   ;==>_ISNPlugin_Studio_Get_Statusbartext

;==========================================================================================
;
; Name...........: _ISNPlugin_Get_Variable
; Description ...: Hohlt den Inhalt einer Variable aus dem ISN in das Plugin
; Syntax.........: _ISNPlugin_Get_Variable($Zielvariable, $Varname [, $hMailSlot])
; Parameters ....: $Zielvariable = Zielvariable in die der Wert aus $Varname gepsichert wird (aus dem ISN) (Angabe mit oder ohne $-Zeichen)
;                  $Varname - Name der Variable die aus dem ISN geholt werden soll (Unbedingt MIT $-Zeichen)
;                  $hMailSlot - Handle des zuvor erstellten Mailslots. Wird benötigt um auf die Antwort zu warten (Falls nicht angegeben wird nicht auf eine Antwort gewartet!)
; Return values .: none
; Author ........: ISI360
; Modified.......:
; Remarks .......: Falls $hMailSlot angegeben ist wird max 2 sek gewartet bis die Variable in der Zielvariable eintrifft!
;==========================================================================================
Func _ISNPlugin_Get_Variable($Zielvariable = "",$Varname = "",$hMailSlot = "")
	If $Zielvariable = "" Then Return ""
	If $Varname = "" Then Return ""
	_ISNPlugin_Nachricht_senden("getvar|" & $Varname & "|" &$Zielvariable )
	If $hMailSlot <> "" Then 
	Local $Antwort = _ISNPlugin_Warte_auf_Nachricht($hMailSlot, "setvar",2000)
	Assign(StringReplace(_Pluginstring_get_element($Antwort, 2),"$",""), _Pluginstring_get_element($Antwort, 3))
	endif
EndFunc   ;==>_ISNPlugin_Get_Variable

;==========================================================================================
;
; Name...........: _ISNPlugin_Set_Variable
; Description ...: Setzt eine Variable im ISN AutoIt Studio auf einen bestimmten Wert
; Syntax.........: _ISNPlugin_Set_Variable($Varname,$Wert)
; Parameters ....: $Varname = Name der Variable die im ISN gesetzt werden soll (Angabe mit oder ohne $-Zeichen)
;                  $Wert = Wert der Variable
; Return values .: none
; Author ........: ISI360
; Modified.......:
; Remarks .......: Es dauert einige ms bis die Variable im ISN eintrifft!
;==========================================================================================
Func _ISNPlugin_Set_Variable($Varname = "", $Wert = "")
	If $Wert = "" Then Return ""
	If $Varname = "" Then Return ""
	_ISNPlugin_Nachricht_senden("setvar|" & $Varname & "|" & $Wert)
EndFunc   ;==>_ISNPlugin_Set_Variable


;==========================================================================================
;
; Name...........: _ISNPlugin_bekannte_Nachrichten_verarbeiten
; Description ...: Verarbeitet eine Empfangene Nachricht
; Syntax.........: _ISNPlugin_bekannte_Nachrichten_verarbeiten($Nachricht)
; Parameters ....: $Nachricht- Nachricht aus dem Plugin
; Return values .: true - Befehl ist bekannt und wurde verarbeitet
;                  false - Befehl ist unbekannt (zb. bei Benutzerdefinierten Befehlen wie "save")
; Author ........: ISI360
; Modified.......:
; Remarks .......: Kann in einer AdlibRegister oder einer while Schleife verwendet werden
;==========================================================================================
Func _ISNPlugin_bekannte_Nachrichten_verarbeiten($Nachricht = "")
	If $Nachricht = "" Then Return
	If $ISN_Plugin_Warte_auf_Nachricht = 1 Then Return

	Switch _Pluginstring_get_element($Nachricht, 1)		

		Case "environmentvar" ;Umgebungsvariablen
			Switch _Pluginstring_get_element($Nachricht, 2)
				
				Case "projectdir" ;Bitte nicht ändern!
					$ISN_AutoIt_Studio_Projektpfad = _Pluginstring_get_element($Nachricht, 3)
					return true

				Case "configfile" ;Bitte nicht ändern!
					$ISN_AutoIt_Studio_Konfigurationsdatei_Pfad = _Pluginstring_get_element($Nachricht, 3)
					return true
					
				Case "autoitstudiowindow" ;Bitte nicht ändern!
					$ISN_AutoIt_Studio_Fensterhandle = Ptr(_Pluginstring_get_element($Nachricht, 3))
					return true
			EndSwitch
			
			
		Case "callfunc" ;Bitte nicht ändern!
			Call(_Pluginstring_get_element($Nachricht, 2), _Pluginstring_get_element($Nachricht, 3), _Pluginstring_get_element($Nachricht, 4), _Pluginstring_get_element($Nachricht, 5), _Pluginstring_get_element($Nachricht, 6))
			return true
			
		Case "setvar" ;Bitte nicht ändern!
			Assign(StringReplace(_Pluginstring_get_element($Nachricht, 2),"$",""), _Pluginstring_get_element($Nachricht, 3))
			return true
			
		Case "getvar" ;Bitte nicht ändern!
			_ISNPlugin_Nachricht_senden("setvar|" & _Pluginstring_get_element($Nachricht, 2) & "|" & Execute(_Pluginstring_get_element($Nachricht, 3)))
			return true
			
		EndSwitch
		
	return false ;Nachricht ist nicht bekannt
EndFunc   ;==>_ISNPlugin_bekannte_Nachrichten_verarbeiten

