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

 #include <GUIConstants.au3>
Opt("traymenumode", 1)
TraySetClick(8)
Opt("TrayAutoPause", 0)
Opt("trayOnEventMode", 1)
$g_szVersion = "��ӡ��������� Beta 1.0 ���ߣ�xrbenbeba"
If WinExists($g_szVersion, "��ǰ��ӡ���б�") Then Exit
AutoItWinSetTitle($g_szVersion)
;���峣��
$TRAY_EVENT_PRIMARYDOUBLE = -13
$TRAY_DISABLE = 128
$TRAY_ENABLE = 64
;$LBS_STANDARD = 0xA00003
;$BS_FLAT = 0x8000
;$WS_CHILD = 0x40000000
$mainwindow = GUICreate("��ӡ��������� Beta 1.0 ���ߣ�xrbenbeba ", 500, 370, @DesktopWidth / 2 - 500 / 2, @DesktopHeight / 2 - 370 / 2)

;����GUI
;GUI��ǰ��ӡ���б�
;MsgBox(0, "ע��", "1.����������ڵ�ǰ��������." & @CRLF & "2.�������������ҵ��;�Լ�����������Ϊ." & @CRLF & "3.�������������ӱ�׼TCP/IP�˿ڵĴ�ӡ��." & @CRLF & "5.��������ṩɾ����ӡ���Ĺ���." & @CRLF & "6.δ������������,��Ҫ�������޸Ĵ����." & @CRLF & "7.���н������������ϵ����.")
$InputInfo = "����ȷ�����������IP!"
$strComputer = InputBox("������", "��ʾ:" & @CRLF & @CRLF & "1.����ȷ������Ҫ����Ļ�����IP���߻�" & @CRLF & "  ����." & @CRLF & @CRLF & "2.��Ҫ����127.0.0.1��IP�����ᵼ�³���" & @CRLF & "  �޷�����ѡ�������Ĵ���!" & @CRLF & @CRLF & "3.������������Ϊ��Ĭ��Ϊ����." & @CRLF & @CRLF & "4.ȡ�����˳�.", $InputInfo, "", -1, 235)
If @error = 0 Then
 If $strComputer = "" Or $strComputer = $InputInfo Then
  $objSWbemServices = ObjGet("winmgmts:\\.\root\cimv2") ;��ȡĬ�ϻ�����
  $colSWbemObjectSet = $objSWbemServices.ExecQuery("Select * from Win32_ComputerSystem")
  For $objSWbemObject In $colSWbemObjectSet
   $strComputer = $objSWbemObject.Name
  Next
 EndIf
Else
 Exit
EndIf
FileCopy(@HomeDrive & "\WINDOWS\inf\ntprint.inf", @ScriptDir & "\ntprint.ini", 1)
$group1 = GUICtrlCreateGroup("��ǰ��ӡ���б�:", 10, 15, 255, 165)
$List1 = GUICtrlCreateList("", 92, 35, 161, 135, $LBS_STANDARD)
_PrinterCount()
$DelPrinter = GUICtrlCreateButton("ɾ    ��", 20, 35, 68, 30, $BS_FLAT)
$Findconfig = GUICtrlCreateButton("�쿴����", 20, 68, 68, 30, $BS_FLAT)
$CancelAllJobs = GUICtrlCreateButton("�����ҵ", 20, 101, 68, 30, $BS_FLAT)
$Refresh = GUICtrlCreateButton("ˢ���б�", 20, 134, 68, 30, $BS_FLAT)
;GUI��ǰ��ӡ������Ϣ
$group2 = GUICtrlCreateGroup("��ǰ��ӡ������Ϣ", 280, 15, 210, 165)
GUICtrlCreateLabel("��ӡ��IP:", 295, 35, 60, 15)
$currentPrinterName = GUICtrlCreateInput("", 355, 32, 125, 20)
GUICtrlCreateLabel("�����ͺ�:", 295, 63, 60, 15)
$DriverName = GUICtrlCreateInput("", 355, 60, 125, 20)
GUICtrlCreateLabel("�Ƿ�Ĭ��:", 295, 91, 60, 15)
$IsDefultPrinter = GUICtrlCreateInput("", 355, 88, 125, 20)
GUICtrlCreateLabel("�ӿ�����:", 295, 119, 60, 15)
$InterfaceType = GUICtrlCreateInput("", 355, 115, 125, 20)
$PrintTestPage = GUICtrlCreateButton("��ӡ����ҳ", 295, 147, 68, 28, $BS_FLAT)
$ResetIP = GUICtrlCreateButton("����IP", 410, 147, 68, 28, $BS_FLAT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUI��Ӵ�ӡ��
$group3 = GUICtrlCreateGroup("��Ӵ�ӡ��", 10, 190, 255, 165)
GUICtrlCreateLabel("��ӡ����:", 40, 220, 60, 15)
$PrinterName = GUICtrlCreateInput("", 115, 215, 125, 20)
GUICtrlCreateLabel("��ӡ��IP:", 40, 245, 60, 15)
$PrinterIP = GUICtrlCreateInput("", 115, 240, 125, 20)
GUICtrlCreateLabel("�����ͺ�:", 40, 270, 60, 15)
$HP = GUICtrlCreateRadio("HP", 115, 270, 50, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
$Xerox = GUICtrlCreateRadio("Xerox", 190, 270, 50, 20)
$FujiXerox = GUICtrlCreateRadio("Fuji Xerox", 115, 290, 60, 20)
$AddPrinter = GUICtrlCreateButton("���", 25, 320, 60, 30, $BS_FLAT)
$Other = GUICtrlCreateButton("�����", 105, 320, 60, 30, $BS_FLAT)
$Reset = GUICtrlCreateButton("���", 185, 320, 60, 30, $BS_FLAT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUI��ӡ������
$group4 = GUICtrlCreateGroup("��ѡ���ӡ������", 280, 190, 210, 165)
$List2 = GUICtrlCreateList("", 285, 215, 200, 95, $LBS_STANDARD)
_ReadIniHP()
GUICtrlCreateLabel("��ϵ����:", 290, 315, 195, 15)
$label_url = GUICtrlCreateLabel("", 290, 330, 175, 20)
GUICtrlSetFont(-1, 9, -1, 4)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

;����������Ϣ
TraySetToolTip("��ӡ��������� Beta 1.0 ���ߣ�xrbenbeba")
$Helpitem = TrayCreateItem("����")
TrayItemSetOnEvent($Helpitem, "_Helpitem")
TrayCreateItem("")
$aboutitem = TrayCreateItem("����")
TrayItemSetOnEvent($aboutitem, "_Aboutitem")
TrayCreateItem("")
$exititem = TrayCreateItem("�˳�")
TrayItemSetOnEvent($exititem, "_Exit")
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "_Restore")
TraySetState()

$mouseon = 0 ;��꾭���ؼ��ı��
While 1
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE ;�رճ���
   DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $mainwindow, "int", 500, "long", 0x00090000)
   Exit
   
  Case $DelPrinter ;ɾ��
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _DelPrinter($SetDefultPrinterName)
   _PrinterCount()
  Case $Findconfig ;�쿴����
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _FindConfig($SetDefultPrinterName)
  Case $ResetIP
   ;_SetIP()
   $strComputerNew = InputBox("������", "��ʾ:" & @CRLF & @CRLF & "1.����ȷ������Ҫ����Ļ�����IP���߻�" & @CRLF & "  ����." & @CRLF & @CRLF & "2.��Ҫ����127.0.0.1��IP�����ᵼ�³���" & @CRLF & " �޷�����ѡ�������Ĵ���!" & @CRLF & @CRLF & "3.����������Ϊ��,Ĭ��Ϊ����." & @CRLF & @CRLF & "4.ȡ�����ı䵱ǰ����.", $InputInfo, "", -1, 235)
   If @error = 0 Then
    $strComputer = $strComputerNew
    If $strComputerNew = "" Or $strComputerNew = $InputInfo Then
     $objSWbemServices = ObjGet("winmgmts:\\.\root\cimv2") ;��ȡĬ�ϻ�����
     $colSWbemObjectSet = $objSWbemServices.ExecQuery("Select * from Win32_ComputerSystem")
     For $objSWbemObject In $colSWbemObjectSet
      $strComputer = $objSWbemObject.Name
     Next
    EndIf
   EndIf
   _PrinterCount()
  Case $CancelAllJobs ;���������ҵ
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _CancelAllJobs($SetDefultPrinterName)
  Case $Reset ;����(�������)
   GUICtrlSetData($PrinterName, "")
   GUICtrlSetData($PrinterIP, "")
  Case $HP
   _ReadIniHP()
  Case $Xerox
   _ReadIniXerox()
  Case $FujiXerox
   _ReadIniFujiXerox()
  Case $Other
   GUICtrlSetData($PrinterName, "")
   GUICtrlSetData($PrinterIP, "")
   _AddOther()
   _PrinterCount()
  Case $AddPrinter ;��Ӵ�ӡ��
   $SetPrinterDriver = GUICtrlRead($List2)
   $SetPrinterName = GUICtrlRead($PrinterName)
   $SetPrinterIP = GUICtrlRead($PrinterIP)
   If $SetPrinterDriver <> "" And $SetPrinterName <> "" And $SetPrinterIP <> "" Then
    $Flag = MsgBox(1, "��ʾ", "��ӡ����Ϊ:" & $SetPrinterName & @CRLF & "��ӡ��IPΪ:" & $SetPrinterIP & @CRLF & "��ӡ����Ϊ:" & $SetPrinterDriver & @CRLF & @CRLF & "ȷ�����?")
    If $Flag = 1 Then
     _AddPrinter()
     _PrinterCount()
    EndIf
   Else
    MsgBox(0, "����", "IP,����,��������Ϊ��!" & @CRLF & "����������!")
   EndIf
  Case $Refresh
   _PrinterCount()
  Case $PrintTestPage
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _PrintTestPage($SetDefultPrinterName)
 EndSwitch
 
 $mousepos = GUIGetCursorInfo($mainwindow)
 If $mousepos[4] == $label_url Then
  If $mouseon Then
   $mouseon = 0
   GUICtrlSetPos($label_url, 292, 328, 175, 20)
   GUICtrlSetColor($label_url, 0x0000FF)
  EndIf
  If $mousepos[2] Then
   RunWait(@ComSpec & ' /c Adviceforyou.msg', "", @SW_HIDE)
   Sleep(100)
  EndIf
 Else
  If Not $mouseon Then
   $mouseon = 1
   GUICtrlSetPos($label_url, 290, 330, 175, 20)
   GUICtrlSetColor($label_url, 0x000000)
  EndIf
 EndIf
WEnd

Func _DelPrinter($SetDefultPrinterName)
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer Where DeviceID = " & $SetDefultPrinterName)
 For $objNetAdapter In $colItems
  $objNetAdapter.Delete_
  MsgBox(0, "��ʾ", "ɾ���ɹ�!")
 Next
EndFunc   ;==>_DelPrinter
Func _FindConfig($SetDefultPrinterName)
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer Where DeviceID = " & $SetDefultPrinterName)
 For $objNetAdapter In $colItems
  GUICtrlSetData($DriverName, $objNetAdapter.DriverName)
  If $objNetAdapter.Default = 0 Then
   GUICtrlSetData($IsDefultPrinter, "True")
  Else
   GUICtrlSetData($IsDefultPrinter, "False")
  EndIf
  If $InterfaceType = $objNetAdapter.Network Then
   GUICtrlSetData($InterfaceType, "Network Printer")
  Else
   GUICtrlSetData($InterfaceType, "Local Standard Interface")
  EndIf
  If StringUpper(StringLeft($objNetAdapter.PortName, 3)) = "IP_" Then
   GUICtrlSetData($currentPrinterName, StringTrimLeft($objNetAdapter.PortName, 3))
  Else
   GUICtrlSetData($currentPrinterName, "Local Printer")
  EndIf
 Next
EndFunc   ;==>_FindConfig
Func _CancelAllJobs($SetDefultPrinterName)
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer Where DeviceID = " & $SetDefultPrinterName)
 For $objNetAdapter In $colItems
  $objNetAdapter.CancelAllJobs()
  MsgBox(0, "��ʾ", "�����ҵ�ɹ�")
 Next
EndFunc   ;==>_CancelAllJobs
Func _ReadIniHP()
 GUICtrlSetData($List2, "")
 $SectionNames = IniReadSection(@ScriptDir & "\ntprint.ini", "HP")
 If @error Then
  MsgBox(0, "", "��������,ȱ�ٱ�׼��INI�ļ�.")
 Else
  For $i = 1 To $SectionNames[0][0]
   $Temp1 = StringTrimLeft($SectionNames[$i][0], 1)
   $Temp2 = StringTrimRight($Temp1, 1)
   $Temp3 = StringUpper($Temp2)
   If StringLeft($Temp3, 11) = "HP LASERJET" And Not StringIsAlpha(StringMid($Temp3, 13, 1)) And StringMid($Temp3, 13, 1) <> "" Then
    GUICtrlSetData($List2, $Temp3)
   EndIf
  Next
 EndIf
EndFunc   ;==>_ReadIniHP
Func _ReadIniXerox()
 GUICtrlSetData($List2, "")
 $SectionNames = IniReadSection(@ScriptDir & "\ntprint.ini", "Xerox")
 If @error Then
  MsgBox(0, "", "��������,ȱ�ٱ�׼��INI�ļ�.")
 Else
  For $i = 1 To $SectionNames[0][0]
   $Temp1 = StringTrimLeft($SectionNames[$i][0], 1)
   $Temp2 = StringTrimRight($Temp1, 1)
   $Temp3 = StringUpper($Temp2)
   GUICtrlSetData($List2, $Temp3)
  Next
 EndIf
EndFunc   ;==>_ReadIniXerox
Func _ReadIniFujiXerox()
 GUICtrlSetData($List2, "")
 $SectionNames = IniReadSection(@ScriptDir & "\ntprint.ini", "Fuji_Xerox")
 If @error Then
  MsgBox(0, "", "��������,ȱ�ٱ�׼��INI�ļ�.")
 Else
  For $i = 1 To $SectionNames[0][0]
   $Temp1 = StringTrimLeft($SectionNames[$i][0], 1)
   $Temp2 = StringTrimRight($Temp1, 1)
   $Temp3 = StringUpper($Temp2)
   GUICtrlSetData($List2, $Temp3)
  Next
 EndIf
EndFunc   ;==>_ReadIniFujiXerox
Func _PrinterCount()
 GUICtrlSetData($List1, "")
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer")
 For $objNetAdapter In $colItems
  GUICtrlSetData($List1, $objNetAdapter.DeviceID)
 Next
EndFunc   ;==>_PrinterCount
Func _AddPrinter()
 ProgressOn("������,���Ժ�...", "", "", -1, -1, 2 + 16)
 ProgressSet(0, "����� 0%", "���ڴ�������...")
 Sleep(300)
 $Patch = "\\" & $strComputer & "\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
 $Patch001 = "\\" & $strComputer & "\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
 $i = 1
 $s = ""
 ProgressSet(10, "����� 10%", "���ڼ��˿���Ϣ...")
 Sleep(300)
 Do
  $Var = RegEnumKey($Patch, $i)
  $i = $i + 1
  $s = $s & $Var & "/"
  ProgressSet(10 + $i, "����� " & 10 + $i & "%", "���ڼ��˿���Ϣ...")
  Sleep(300)
 Until StringLeft($Var, 3) <> "IP_"
 $x = StringInStr($s, "IP_" & $SetPrinterIP)
 $PortName = "IP_" & $SetPrinterIP
 $NewPatch = $Patch & $PortName
 $NewPatch001 = $Patch001 & $PortName
 ProgressSet(30, "����� 30%", "���ڼ��˿��Ƿ����...")
 Sleep(300)
 If $x = 0 Then
  ProgressSet(40, "����� 40%", "�˿ڲ�����,�����ڴ����˿�...")
  Sleep(300)
  RegWrite($NewPatch)
  RegWrite($NewPatch, "Protocol", "REG_DWORD", "00000001")
  RegWrite($NewPatch, "Version", "REG_DWORD", "00000001")
  RegWrite($NewPatch, "HostName", "REG_SZ", "")
  RegWrite($NewPatch, "IPAddress", "REG_SZ", $SetPrinterIP)
  RegWrite($NewPatch, "HWAddress", "REG_SZ", "")
  RegWrite($NewPatch, "PortNumber", "REG_DWORD", "9100")
  RegWrite($NewPatch, "SNMP Community", "REG_SZ", "public")
  RegWrite($NewPatch, "SNMP Enabled", "REG_DWORD", "00000001")
  RegWrite($NewPatch, "SNMP Index", "REG_DWORD", "00000001")
  ProgressSet(60, "����� 60%", "�˿ڲ�����,���ڴ����˿�...")
  Sleep(300)
  RegWrite($NewPatch001)
  RegWrite($NewPatch001, "Protocol", "REG_DWORD", "00000001")
  RegWrite($NewPatch001, "Version", "REG_DWORD", "00000001")
  RegWrite($NewPatch001, "HostName", "REG_SZ", "")
  RegWrite($NewPatch001, "IPAddress", "REG_SZ", $SetPrinterIP)
  RegWrite($NewPatch001, "HWAddress", "REG_SZ", "")
  RegWrite($NewPatch001, "PortNumber", "REG_DWORD", "9100")
  RegWrite($NewPatch001, "SNMP Community", "REG_SZ", "public")
  RegWrite($NewPatch001, "SNMP Enabled", "REG_DWORD", "00000001")
  RegWrite($NewPatch001, "SNMP Index", "REG_DWORD", "00000001")
  ProgressSet(70, "����� 70%", "����ֹͣ��ӡ����...")
  RunWait(@ComSpec & " /c sc \\" & $strComputer & " stop spooler", "", @SW_HIDE)
  ProgressSet(75, "����� 80%", "����������ӡ����...")
  RunWait(@ComSpec & " /c sc \\" & $strComputer & " start spooler", "", @SW_HIDE)
  ProgressSet(80, "����� 80%", "׼����Ӵ�ӡ��...")
  Sleep(300)
 Else
  ProgressSet(60, "����� 60%", "�˿��Ѿ�����,׼����Ӵ�ӡ��...")
  Sleep(300)
 EndIf
 ProgressSet(90, "����� 90%", "������Ӵ�ӡ��...")
 RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /if /b "' & $SetPrinterName & '" /c \\'& $strComputer & ' /f %windir%\inf\ntprint.inf /r "' & $PortName & '" /m "' & $SetPrinterDriver & '"', "", @SW_HIDE)
 ;MsgBox (0,"ע��","��Ӵ�ӡ�����!")
 Sleep(300)
 ProgressSet(100, "����� 100%", "��Ӵ�ӡ�����!")
 ProgressOff()
 MsgBox(0, "", "������!")
EndFunc   ;==>_AddPrinter
Func _PrintTestPage($SetDefultPrinterName)
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer Where DeviceID = " & $SetDefultPrinterName)
 For $objNetAdapter In $colItems
  $objNetAdapter.PrintTestPage()
  MsgBox(0, "��ʾ", "�����Ƿ��ӡ�ɹ�!")
 Next
EndFunc   ;==>_PrintTestPage

Func _AddOther()
 RunWait(@ComSpec & " /c rundll32 printui.dll,PrintUIEntry /il /c \\" & $strComputer, "", @SW_HIDE)
EndFunc   ;==>_AddOther
Func _Exit() ;�����˳��¼�
 DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $mainwindow, "int", 500, "long", 0x00090000)
 Exit
EndFunc   ;==>_Exit
Func _Helpitem() ;���̰����¼�
 ShellExecute(@ScriptDir & "\readme.txt", @SW_MAXIMIZE)
EndFunc   ;==>_Helpitem
Func _Aboutitem() ;���̹����¼�
 MsgBox(0, "����", "xrbenbeba����" & @CRLF & @CRLF & "")
EndFunc   ;==>_Aboutitem
Func _Restore() ;����˫���¼�
 WinSetState($mainwindow, "", @SW_SHOW)
 WinSetState($mainwindow, "", @SW_RESTORE)
EndFunc   ;==>_Restore