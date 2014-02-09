#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
;把它放在scite目录下就可以

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
                MsgBox(262144, "命令", "命令行 = " & $cmdlineraw & @CR & _
                                "工作目录是 " & $SearchFolder & @CR & _
                                "查找 " & $tofind & @CR & _
                                "文件类型 " & $FileTypes & @CR & _
                                "搜索子文件夹 " & $subFolders & @CR & _
                                "区分大小写 " & $CaseSensitive)
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
        ConsoleWrite(">>>搜索文件: " & $Thistype & " 在: " & $SearchFolder)
        If $subFolders Then
                ConsoleWrite(" : 搜索子文件夹 :")
        Else
                ConsoleWrite(": 未找到子文件夹 :")
        EndIf
        If $CaseSensitive Then
                ConsoleWrite(": 区分大小写 :")
        Else
                ConsoleWrite(": 不区分大小写 :")
        EndIf
        ConsoleWrite(@CRLF)
        Global $instr = 'Findstr /i /m ' & $subFolders & ' "' & $tofind & '" "' & $SearchFolder & "\" & $Thistype & '"'
        If $debugging Then MsgBox(262144, "instr = ", $instr)
        ;run command in systemdir so it will find windows findstr.exe first and not this script
        Global $foo = Run(@ComSpec & " /c " & $instr, @SystemDir, @SW_HIDE, 8);$STDIN_CHILD + $STDOUT_CHILD)cmd.exe
        ; Read from child's STDOUT
        Global $stdouttxt, $filecount = 0
        While True
                TraySetToolTip("正在搜索文件,找到 " & $filecount & "({END}=停止搜索)")
                $stdouttxt &= StdoutRead($foo)
                If @error Then ExitLoop
                ScanFile($stdouttxt, $filecount, $tofind)
        WEnd
        ScanFile($stdouttxt, $filecount, $tofind)
        ;read all the files which contain the string
        If Not $filecount Then
                ConsoleWrite('未找到喊关键字的文件: "' & $tofind & '"' & @CRLF)
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
        GUICreate("文件中查找(SciTE辅助工具)", 384, 224, 303, 219)
        GUICtrlCreateLabel("关键字:", 16, 10, 84, 19)
        GUICtrlSetFont(-1, 10, 400, 0, "宋体")
        Local $CmboString = GUICtrlCreateCombo("", 16, 30, 337, 25)
        GUICtrlCreateLabel("要搜索的文件:(不同的类型用(;)隔开)", 16, 68, 315, 17)
        GUICtrlSetFont(-1, 10, 400, 0, "宋体")
        Local $CmboFiles = GUICtrlCreateCombo("", 16, 88, 337, 25)
        GUICtrlCreateLabel("要搜索的文件夹", 16, 133, 101, 18)
        GUICtrlSetFont(-1, 10, 400, 0, "宋体")
        Local $ChkSubFolders = GUICtrlCreateCheckbox("包括子文件夹", 142, 132, 129, 17)
        GUICtrlSetState(-1, $GUI_CHECKED)
        GUICtrlSetFont(-1, 10, 400, 0, "宋体")
        Local $CmboFolders = GUICtrlCreateCombo("", 16, 152, 273, 25)
        Local $BtnSearch = GUICtrlCreateButton("搜索", 40, 192, 75, 25, 0)
        Local $BtnCancel = GUICtrlCreateButton("取消", 232, 192, 75, 25, 0)
        Local $BtnBrowse = GUICtrlCreateButton("浏览", 296, 151, 75, 23, 0)
        Local $ChkCase = GUICtrlCreateCheckbox("列出结果", 142, 10, 97, 17)
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
                                $temp = FileSelectFolder("要搜索的文件夹", "", 6, @ScriptDir)
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
        IniWrite($IniFile, "字符串", "上个字符串", $LastStrings)
        ;save folders searched
        If Not StringInStr('|' & $LastFolders, '|' & $SearchFolder & '|') Then
                $LastStrings = $SearchFolder & '|' & $LastFolders
        EndIf
        While StringInStr($LastFolders, '|', 0, 10)
                $LastFolders = StringLeft($LastFolders, StringInStr($LastFolders, '|', 0, -1) - 1)
        WEnd
        IniWrite($IniFile, "文件夹", "上个文件夹", $LastFolders)
        ;save filetypes
        If Not StringInStr('|' & $LastFiles, '|' & $FileTypes & '|') Then
                $LastFiles = $FileTypes & '|' & $LastFiles
        EndIf
        While StringInStr($LastFiles, '|', 0, 10)
                $LastFiles = StringLeft($LastFiles, StringInStr($LastFiles, '|', 0, -1) - 1)
        WEnd
        IniWrite($IniFile, "文件", "上个类型", $LastFiles)
EndFunc   ;==>UpdateLast
;
Func OnAutoItExit()
        ProgressOff()
        If @exitMethod Then
                ConsoleWrite(@CRLF & "搜索被取消!" & @CRLF)
                Local $aP = ProcessList("Findstr.exe")
                ; Kill all FindStr.exe that are not this programs PID
                For $i = 1 To $aP[0][0]
                        If $aP[$i][1] <> @AutoItPID Then ProcessClose($aP[$i][1])
                Next
        EndIf
        FileDelete(@ScriptDir & "FindStrtMp.Txt");remove temp file
EndFunc   ;==>OnAutoItExit