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

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListBoxConstants.au3>
#include <ProgressConstants.au3>
#Include <Constants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
 
Opt("TrayMenuMode", 1)
TraySetToolTip("�Զ��������س���")
 
$Name_U = "�Զ��������س���"
If WinExists($Name_U) Then Exit
AutoItWinSetTitle($Name_U)
 
FileInstall("MD5.dll", @TempDir & "\MD5.dll")
FileInstall("Server.ini", @ScriptDir & "\Server.ini")
 
$Dir = @ScriptDir & "\Server.ini"
 
$I_1 = @HOUR * 60 * 60
$S_1 = @MIN * 60
$X_1 = @SEC
 
$C_1 = $I_1 + $S_1 + $X_1
 
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "ʱ��", "REG_SZ", $C_1)
 
If FileExists($Dir) = 0 Then
        IniWrite($Dir, "��������", "���ص�ַ", "")
        IniWrite($Dir, "��������", "�����ַ", "")
        IniWrite($Dir, "��������", "��������", "")
        IniWrite($Dir, "��������", "��������", "60000")
EndIf
 
$Down_0 = IniRead($Dir, "��������", "���ص�ַ", "")
$Disk_0 = IniRead($Dir, "��������", "�����ַ", "")
$Time_0 = IniRead($Dir, "��������", "��������", "")
$Name_0 = IniRead($Dir, "��������", "��������", "")
 
If $Down_0 = "" Then
        MsgBox(0, "��ʾ:", "��δ�������ص�ַ,�˳���δ����������,�밴��ʾ��ȷ��д!")
        $Input_Down = InputBox("���ص�ַ", "�����������ļ������ص�ַ:", "", " M", 250, 80, -1, -1, 20)
        If $Input_Down = "" Then
                MsgBox(0, "��ʾ:", "δ��������,�����˳�!")
                Exit
        EndIf
        IniWrite($Dir, "��������", "���ص�ַ", $Input_Down)
EndIf
 
If $Disk_0 = "" Then IniWrite($Dir, "��������", "�����ַ", @ScriptDir)
If $Time_0 = "" Then IniWrite($Dir, "��������", "��������", "1800")
If $Name_0 = "" Then
        MsgBox(0, "��ʾ:", "��δ�������س��������,�����³���������ʹ��!")
        $Input_Name = InputBox("��������:", "���Զ��������ļ��ĳ�������,�����׺��.", "", " M", 280, 80, -1, -1, 20)
        If $Input_Name = "" Then
                MsgBox(0, "��ʾ:", "δ��������,�����˳�!")
                Exit
        EndIf
        IniWrite($Dir, "��������", "��������", $Input_Name)
EndIf
 
$Down = IniRead($Dir, "��������", "���ص�ַ", "")
$Disk = IniRead($Dir, "��������", "�����ַ", "")
$Time = IniRead($Dir, "��������", "��������", "")
$Name = IniRead($Dir, "��������", "��������", "")
 
$Reate = GUICreate("�ٵ������Զ����ظ��³��� V1.0", 350, 410, -1, -1)
 
$Input1 = GUICtrlCreateInput("", 150, 24, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input2 = GUICtrlCreateInput("", 150, 56, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input3 = GUICtrlCreateInput("", 150, 120, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input4 = GUICtrlCreateLabel(@YEAR & "��" & @MON & "��" & @MDAY & "�� " & @HOUR & ":" & @MIN & ":" & @SEC, 10, 382, 327, 20)
$List_0 = GUICtrlCreateLabel("", 265, 382, 100, 20)
 
$List = GUICtrlCreateList("", 10, 208, 329, 123)
 
$Progress1 = GUICtrlCreateProgress(150, 88, 180, 18)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
GUICtrlSetTip(-1, "���ص�ַ: " & $Down & "")
$Progress2 = GUICtrlCreateProgress(150, 152, 180, 18)
 
$Label1 = GUICtrlCreateLabel("���س���Ч��MD5ֵ:", 18, 28, 110, 17)
$Label2 = GUICtrlCreateLabel("Զ�̳���Ч��MD5ֵ:", 18, 59, 110, 17)
$Label3 = GUICtrlCreateLabel("���ؽ���:", 18, 92, 110, 17)
$Label4 = GUICtrlCreateLabel("�����С/ʣ��ʱ��:", 18, 123, 110, 17)
$Label5 = GUICtrlCreateLabel("�����Զ�����ʣ��ʱ��:", 18, 155, 130, 17)
 
$Button1 = GUICtrlCreateButton("˵��", 10, 344, 65, 25)
$Button2 = GUICtrlCreateButton("���", 84, 344, 65, 25)
$Button3 = GUICtrlCreateButton("�ֶ�����", 264, 344, 73, 25)
 
$Group1 = GUICtrlCreateGroup("", 10, 0, 329, 193)
 
GUISetState(@SW_HIDE)
 
$T1 = ""
$T2 = ""
 
$downsize = InetGetSize($Down)
Dim $File_2, $File
 
GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "�״�����,���ڼ��Զ�̳���MD5ֵ!|")
 
IF_Down()
 
While 1
        $tmsg = TrayGetMsg()
        $msg = GUIGetMsg()
        If $msg = $GUI_EVENT_CLOSE Then
                RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\TIME")
                FileDelete(@TempDir & "\MD5.dll")
                Exit
        EndIf
        If $msg = $Button3 Then
                Reate($Down, $Name, $downsize)
                GUICtrlSetData($Input1, _FileHash($Disk & "\" & $Name))
                Time_REG()
        EndIf
        If $msg = $Button2 Then GUICtrlSetData($List, "")
        If $msg = $GUI_EVENT_MINIMIZE Then
                opt("TrayIconHide",0)
                Opt("TrayMenuMode",1)
                GUISetState(@SW_HIDE, $Reate)
                TrayTip("��ʱ�Զ����¹���", "�Ѿ���С��������,���������Ի�ԭ!", 10, 1)
        EndIf
        If $msg = $Button1 Then
                $Box = MsgBox(0, "˵��:", "����һ���ܶ�ʱ�Զ����������ϵ��ļ������صĳ���."& @CRLF & _
                                                   "���˷���������Ҫ��ʱ���µ��鷳,����һЩ����������."& @CRLF & _
                                                   "��ǰ���������ļ��ϵĵ�ַ��Ҫ�̶�..."& @CRLF & _
                                                   ""& @CRLF & _
                                                   "����:��ñ����"& @CRLF & _
                                                   "QQ:780095"& @CRLF & _
                                                   "E-mail:maxxp@vip.qq.com"& @CRLF & _
                                                   ""& @CRLF & _
                                                   "��ӭ�Ȱ�AU3�����Ѽ���QQȺ:43194697,һ����ѧϰ!")
                If $Box = 1 Then Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE 780095.qzone.qq.com")
        EndIf
        If $tmsg = $TRAY_EVENT_PRIMARYDOWN Then
                GUISetState(@SW_SHOW, $Reate)
        EndIf
        $T1 = @YEAR & "��" & @MON & "��" & @MDAY & "�� " & @HOUR & ":" & @MIN & ":" & @SEC
        If $T1 <> $T2 Then
                $T2 = $T1
                GUICtrlSetData($Input4, @YEAR & "��" & @MON & "��" & @MDAY & "�� " & @HOUR & ":" & @MIN & ":" & @SEC)
        EndIf
        Time_REG()
WEnd
 
Func Time_REG()
        $REG_C1 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "ʱ��")
        $Time_REG = $Time + $REG_C1
        $I_2 = @HOUR * 60 * 60
        $S_2 = @MIN * 60
        $X_2 = @SEC
        $C_2 = $I_2 + $S_2 + $X_2
        $C_3 = $Time_REG - $C_2
;~      $C_4 = $C_3 / 60
;~      $C_5 = StringSplit($C_4, ".")
;~      GUICtrlSetData($List_0, "ʣ��" & $C_5[1] & "�ָ���")
        $P_0 = $Time / 10
        If $C_2 = $REG_C1 Then
                GUICtrlSetData($Progress2, 1)
        ElseIf $C_2 = $REG_C1 + $P_0 Then
                GUICtrlSetData($Progress2, 10)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 20)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 30)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 40)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 50)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 70)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 80)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 90)
        ElseIf $C_2 = $REG_C1 + $Time Then
                GUICtrlSetData($Progress2, 100)
        EndIf
        If $C_3 < 30 Then
                TrayTip("", "���ڻ�ʣ��" & $C_3 & "�뼴����ʼִ�и�������.....", 10, 1)
        EndIf
        If $Time_REG = $C_2 Then
                RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "ʱ��", "REG_SZ", $C_2)
                IF_Down()
        EndIf
EndFunc
 
Func IF_Down()
        If FileExists($Disk & "\" & $Name) = 0 Then
                GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "δ�ҵ������ļ�!|")
                GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "�����������ظ�����!|")
                GUICtrlSetData($Input1, "��ȡ�����ļ�MD5ʧ��")
                Reate_Down($Down, $Name, $downsize)
                FileCopy(@WindowsDir & "\" & $Name, $Disk & "\" & $Name, 1)
                FileDelete(@WindowsDir & "\" & $Name)
                GUICtrlSetData($Input1, _FileHash($Disk & "\" & $Name))
        Else
                $File = _FileHash($Disk & "\" & $Name)
                GUICtrlSetData($Input1, $File)
                Reate_Down($Down, $Name, $downsize)
                If $File = $File_2 Then
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "MD5ֵ��ͬ,��ʱ����Ҫ����!|")
                        FileDelete(@WindowsDir & "\" & $Name)
                Else
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "MD5ֵ�ԱȲ���,���ڸ���!|")
                        FileCopy(@WindowsDir & "\" & $Name, $Disk & "\" & $Name, 1)
                        FileDelete(@WindowsDir & "\" & $Name)
                        GUICtrlSetData($Input1, $File_2)
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "����������!|")
                        GUICtrlSetData($Progress2, 0)
                EndIf
        EndIf
EndFunc
 
Func Reate($Down, $Name, $upd_Size)
        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "�����ֶ�������!|")
        InetGet($Down, $Disk & "\" & $Name, 1, 1)
        TraySetState(4)
        While 1
                $DnPercent = Int(InetRead  / $upd_Size * 100)
                $DnBytes = Round(InetRead  / 1024) & ' KB'
                $DnSize = Round($upd_Size / 1024) & ' KB'
                GUICtrlSetData($Progress1, $DnPercent)
                GUICtrlSetData($Input3, $DnSize & " / " & $DnPercent & "%")
                TrayTip("�������:", "���½���:" & $DnPercent & "% (��ǰ����:" & $DnBytes & "/�ļ���С:" & $DnSize & ")", 1)
                Sleep(250)
        WEnd
        GUICtrlSetData($Input3, $DnSize & " / " & "100%")
        TraySetState(8)
        $File_3 = _FileHash($Disk & "\" & $Name)
        GUICtrlSetData($Input2, $File_3)
        GUICtrlSetData($Progress1, 0)
        TrayTip("�������:", "���½���:100% (��ǰ����:" & $DnBytes & "/�ļ���С:" & $DnBytes & ")", 1)
        TrayTip("", "", 1)
        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "���������!|")
EndFunc
 
Func _FileHash($sFile, $iRunErrorsFatal = -1, $vEXEPath = -1)
        Local $sEXEPath, $hPID, $sLine, $iFileNameLen, $sHash, $iOPT, $iHashLen
        If Not FileExists($sFile) Or StringInStr(FileGetAttrib($sFile), "D") _
                        Or StringInStr($sFile, "*") _
                        Or StringInStr($sFile, "?") _
                        Or Not StringInStr($sFile, "\") Then
                SetError(1)
                Return ""
        EndIf
        $sEXEPath = @TempDir & "\MD5.dll"
        $iHashLen = 32
        If Not ($iRunErrorsFatal = 0 _
                        Or $iRunErrorsFatal = 1 _
                        Or $iRunErrorsFatal = -1) Then
                SetError(3)
                Return ""
        EndIf
        If $vEXEPath <> -1 Then
                $sEXEPath = $vEXEPath
        EndIf
        If (Not FileExists($sEXEPath)) _
                        Or StringInStr($sEXEPath, "*") _
                        Or StringInStr($sEXEPath, "?") Then
                SetError(4)
                Return ""
        EndIf
        $hPID = Run('"' & $sEXEPath & '" "' & $sFile & '"', @SystemDir, @SW_HIDE, 2)
        $iError = @error
        If $iError Then
                SetError(5)
                Return ""
        EndIf
        ProcessWaitClose($hPID)
        $sLine = StdoutRead($hPID)
        $iFileNameLen = StringLen($sFile)
        $sLine = StringTrimRight($sLine, 2)
        If Not StringLen($sLine) = $iHashLen + 1 + $iFileNameLen Then
                SetError(6)
                Return ""
        EndIf
        If StringRight($sLine, $iFileNameLen) <> $sFile Then
                SetError(6)
                Return ""
        EndIf
        $sHash = StringLeft($sLine, $iHashLen)
        If Not StringIsXDigit($sHash) Then
                SetError(6)
                Return ""
        EndIf
        SetError(0)
        Return $sHash
EndFunc
 
Func Reate_Down($Down, $Name, $upd_Size)
        InetGet($Down, @WindowsDir & "\" & $Name, 1, 1)
        TraySetState(4)
        While 1
                $DnPercent = Int(InetRead  / $upd_Size * 100)
                $DnBytes = Round(InetRead  / 1024) & ' KB'
                $DnSize = Round($upd_Size / 1024) & ' KB'
                GUICtrlSetData($Progress1, $DnPercent)
                GUICtrlSetData($Input3, $DnSize & " / " & $DnPercent & "%")
                TrayTip("�������:", "���½���:" & $DnPercent & "% (��ǰ����:" & $DnBytes & "/�ļ���С:" & $DnSize & ")", 1)
                Sleep(250)
        WEnd
        GUICtrlSetData($Input3, $DnSize & " / " & "100%")
        TraySetState(8)
        $File_2 = _FileHash(@WindowsDir & "\" & $Name)
        GUICtrlSetData($Input2, $File_2)
        GUICtrlSetData($Progress1, 0)
        TrayTip("�������:", "���½���:100% (��ǰ����:" & $DnBytes & "/�ļ���С:" & $DnBytes & ")", 1)
        Sleep(250)
        TrayTip("", "", 1)
        GUICtrlSetData($Progress2, 0)
EndFunc
