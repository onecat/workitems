#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
;��������sciteĿ¼�¾Ϳ���

#include <File.au3>
#include <string.au3>
#include <GUIConstantsEx.au3>
Global $debugging = False
Global $tofind ;the string to search for
Global $FileTypes ;the filetypes to search
Global $SearchFolder ;the folder to search in
Global $subFolders ;true if we should search subfolders
Global $CaseSensitive;true if we care about the case
Global $IniFile = @ScriptDir & "\Findinfiles.ini"
Global $LastFiles = IniRead($IniFile, "Files", "lasttypes", "")
Global $LastStrings = IniRead($IniFile, "Strings", "laststrings", "")
Global $LastFolders = IniRead($IniFile, "Folders", "lastfolders", "")
If $CmdLine[0] >= 5 Then ; we have been run from SciTE? find.command=findstr /n /s /I $(find.what) $(find.files)
        $tofind = $CmdLine[4]
        $FileTypes = $CmdLine[5]
        $subFolders = $CmdLine[2] = "/s"
        $CaseSensitive = $CmdLine[3] <> "/I"
        $SearchFolder = @WorkingDir
        If $debugging Then
                MsgBox(262144, "����", "������ = " & $cmdlineraw & @CR & _
                                "����Ŀ¼�� " & $SearchFolder & @CR & _
                                "���� " & $tofind & @CR & _
                                "�ļ����� " & $FileTypes & @CR & _
                                "�������ļ��� " & $subFolders & @CR & _
                                "���ִ�Сд " & $CaseSensitive)
        EndIf
        If $tofind = '' Or $FileTypes = '' Or $SearchFolder = '' Then DataFromGui()
Else
        DataFromGui()
EndIf
If $tofind = '' Or $FileTypes = '' Or $SearchFolder = '' Then Exit
If $subFolders Then
        $subFolders = "/s"
Else
        $subFolders = ''
EndIf
;~ ProgressOn("Search in " & $SearchFolder, "for files containg " & $tofind)
; Set traymenu
Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 1) ; Default tray menu items (Script Paused/Exit) will not be shown.
Global $KillSearch = TrayCreateItem("StopSearch")
TrayItemSetOnEvent(-1, "ExitScript")
TraySetState()
HotKeySet("{END}", "ExitScript")
;use the command findstr to search without case sensitivity (/i) in sub folder (/s) and only return the file names (/m)
Global $alltypes = StringSplit($FileTypes, ';')
For $typenumber = 1 To $alltypes[0]
        Global $Thistype = $alltypes[$typenumber]
        ConsoleWrite(">>>�����ļ�: " & $Thistype & " ��: " & $SearchFolder)
        If $subFolders Then
                ConsoleWrite(" : �������ļ��� :")
        Else
                ConsoleWrite(": δ�ҵ����ļ��� :")
        EndIf
        If $CaseSensitive Then
                ConsoleWrite(": ���ִ�Сд :")
        Else
                ConsoleWrite(": �����ִ�Сд :")
        EndIf
        ConsoleWrite(@CRLF)
        Global $instr = 'Findstr /i /m ' & $subFolders & ' "' & $tofind & '" "' & $SearchFolder & "\" & $Thistype & '"'
        If $debugging Then MsgBox(262144, "instr = ", $instr)
        ;run command in systemdir so it will find windows findstr.exe first and not this script
        Global $foo = Run(@ComSpec & " /c " & $instr, @SystemDir, @SW_HIDE, 8);$STDIN_CHILD + $STDOUT_CHILD)cmd.exe
        ; Read from child's STDOUT
        Global $stdouttxt, $filecount = 0
        While True
                TraySetToolTip("���������ļ�,�ҵ� " & $filecount & "({END}=ֹͣ����)")
                $stdouttxt &= StdoutRead($foo)
                If @error Then ExitLoop
                ScanFile($stdouttxt, $filecount, $tofind)
        WEnd
        ScanFile($stdouttxt, $filecount, $tofind)
        ;read all the files which contain the string
        If Not $filecount Then
                ConsoleWrite('δ�ҵ����ؼ��ֵ��ļ�: "' & $tofind & '"' & @CRLF)
        EndIf
Next
;~ ProgressOff()
UpdateLast()
;Exit
;
Func ExitScript()
        Exit
EndFunc   ;==>ExitScript
;
Func ScanFile(ByRef $stdouttxt, ByRef $filecount, $tofind)
        Local $text, $File, $filelines
        $stdouttxt = StringReplace($stdouttxt, @CRLF, @CR)
        $stdouttxt = StringReplace($stdouttxt, @LF, @CR)
        While StringInStr($stdouttxt, @CR)
                ;in the same way split the file text into an array of lines
                $File = StringLeft($stdouttxt, StringInStr($stdouttxt, @CR) - 1)
;~                         ConsoleWrite('!' & $file & @crlf)
                $stdouttxt = StringMid($stdouttxt, StringInStr($stdouttxt, @CR) + 1)
                $filecount += 1
                $text = FileRead($File);
                $text = StringReplace($text, @CRLF, @CR)
                $text = StringReplace($text, @LF, @CR)
                $filelines = StringSplit($text, @CR)
                TraySetToolTip($File)
                For $lines = 1 To $filelines[0]
                        ; only check every 100 lines to see if SearchCancel was clicked in the trayiconmenu
                        If StringInStr($filelines[$lines], $tofind) Then
                                ConsoleWrite($File & ":" & $lines & ":" & $filelines[$lines] & @CR)
                        EndIf
                Next
        WEnd
EndFunc   ;==>ScanFile
;
Func DataFromGui()
        #region ### START Koda GUI section ###
        GUICreate("�ļ��в���(SciTE��������)", 384, 224, 303, 219)
        GUICtrlCreateLabel("�ؼ���:", 16, 10, 84, 19)
        GUICtrlSetFont(-1, 10, 400, 0, "����")
        Local $CmboString = GUICtrlCreateCombo("", 16, 30, 337, 25)
        GUICtrlCreateLabel("Ҫ�������ļ�:(��ͬ��������(;)����)", 16, 68, 315, 17)
        GUICtrlSetFont(-1, 10, 400, 0, "����")
        Local $CmboFiles = GUICtrlCreateCombo("", 16, 88, 337, 25)
        GUICtrlCreateLabel("Ҫ�������ļ���", 16, 133, 101, 18)
        GUICtrlSetFont(-1, 10, 400, 0, "����")
        Local $ChkSubFolders = GUICtrlCreateCheckbox("�������ļ���", 142, 132, 129, 17)
        GUICtrlSetState(-1, $GUI_CHECKED)
        GUICtrlSetFont(-1, 10, 400, 0, "����")
        Local $CmboFolders = GUICtrlCreateCombo("", 16, 152, 273, 25)
        Local $BtnSearch = GUICtrlCreateButton("����", 40, 192, 75, 25, 0)
        Local $BtnCancel = GUICtrlCreateButton("ȡ��", 232, 192, 75, 25, 0)
        Local $BtnBrowse = GUICtrlCreateButton("���", 296, 151, 75, 23, 0)
        Local $ChkCase = GUICtrlCreateCheckbox("�г����", 142, 10, 97, 17)
        GUISetState(@SW_SHOW)
        #endregion ### END Koda GUI section ###
        GUICtrlSetData($CmboFiles, $LastFiles)
        GUICtrlSetData($CmboString, $LastStrings)
        GUICtrlSetData($CmboFolders, $LastFolders)
        Local $nMsg, $temp
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE, $BtnCancel
                                Exit
                        Case $BtnSearch
                                ExitLoop
                        Case $BtnBrowse
                                $temp = FileSelectFolder("Ҫ�������ļ���", "", 6, @ScriptDir)
                                If $temp <> '' Then GUICtrlSetData($CmboFolders, $temp, $temp)
                EndSwitch
        WEnd
        $subFolders = BitAND(GUICtrlRead($ChkSubFolders), $GUI_CHECKED) = $GUI_CHECKED
        $tofind = GUICtrlRead($CmboString)
        $SearchFolder = GUICtrlRead($CmboFolders)
        $FileTypes = GUICtrlRead($CmboFiles)
        If GUICtrlRead($ChkCase) = $GUI_CHECKED Then $CaseSensitive = 1
EndFunc   ;==>DataFromGui
;
Func UpdateLast()
        ;save strings searched for
        If Not StringInStr('|' & $LastStrings, '|' & $tofind & '|') Then
                $LastStrings = $tofind & '|' & $LastStrings
        EndIf
        While StringInStr($LastStrings, '|', 0, 10)
                $LastStrings = StringLeft($LastStrings, StringInStr($LastStrings, '|', 0, -1) - 1)
        WEnd
        IniWrite($IniFile, "�ַ���", "�ϸ��ַ���", $LastStrings)
        ;save folders searched
        If Not StringInStr('|' & $LastFolders, '|' & $SearchFolder & '|') Then
                $LastStrings = $SearchFolder & '|' & $LastFolders
        EndIf
        While StringInStr($LastFolders, '|', 0, 10)
                $LastFolders = StringLeft($LastFolders, StringInStr($LastFolders, '|', 0, -1) - 1)
        WEnd
        IniWrite($IniFile, "�ļ���", "�ϸ��ļ���", $LastFolders)
        ;save filetypes
        If Not StringInStr('|' & $LastFiles, '|' & $FileTypes & '|') Then
                $LastFiles = $FileTypes & '|' & $LastFiles
        EndIf
        While StringInStr($LastFiles, '|', 0, 10)
                $LastFiles = StringLeft($LastFiles, StringInStr($LastFiles, '|', 0, -1) - 1)
        WEnd
        IniWrite($IniFile, "�ļ�", "�ϸ�����", $LastFiles)
EndFunc   ;==>UpdateLast
;
Func OnAutoItExit()
        ProgressOff()
        If @exitMethod Then
                ConsoleWrite(@CRLF & "������ȡ��!" & @CRLF)
                Local $aP = ProcessList("Findstr.exe")
                ; Kill all FindStr.exe that are not this programs PID
                For $i = 1 To $aP[0][0]
                        If $aP[$i][1] <> @AutoItPID Then ProcessClose($aP[$i][1])
                Next
        EndIf
        FileDelete(@ScriptDir & "FindStrtMp.Txt");remove temp file
EndFunc   ;==>OnAutoItExit