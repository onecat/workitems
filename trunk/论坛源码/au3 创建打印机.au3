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

 #include <GUIConstants.au3>
Opt("traymenumode", 1)
TraySetClick(8)
Opt("TrayAutoPause", 0)
Opt("trayOnEventMode", 1)
$g_szVersion = "打印机添加助手 Beta 1.0 作者：xrbenbeba"
If WinExists($g_szVersion, "当前打印机列表") Then Exit
AutoItWinSetTitle($g_szVersion)
;定义常量
$TRAY_EVENT_PRIMARYDOUBLE = -13
$TRAY_DISABLE = 128
$TRAY_ENABLE = 64
;$LBS_STANDARD = 0xA00003
;$BS_FLAT = 0x8000
;$WS_CHILD = 0x40000000
$mainwindow = GUICreate("打印机添加助手 Beta 1.0 作者：xrbenbeba ", 500, 370, @DesktopWidth / 2 - 500 / 2, @DesktopHeight / 2 - 370 / 2)

;创建GUI
;GUI当前打印机列表
;MsgBox(0, "注意", "1.此软件仅用于当前工作环境." & @CRLF & "2.此软件不作于商业用途以及其他不良行为." & @CRLF & "3.此软件仅用于添加标准TCP/IP端口的打印机." & @CRLF & "5.此软件不提供删除打印机的功能." & @CRLF & "6.未经制作者允许,不要传播和修改此软件." & @CRLF & "7.如有建议和问题请联系我们.")
$InputInfo = "请正确输入机器名或IP!"
$strComputer = InputBox("请输入", "提示:" & @CRLF & @CRLF & "1.请正确输入需要管理的机器的IP或者机" & @CRLF & "  器名." & @CRLF & @CRLF & "2.不要输入127.0.0.1的IP这样会导致出现" & @CRLF & "  无法正常选择驱动的错误!" & @CRLF & @CRLF & "3.如果不输入或者为空默认为本机." & @CRLF & @CRLF & "4.取消则退出.", $InputInfo, "", -1, 235)
If @error = 0 Then
 If $strComputer = "" Or $strComputer = $InputInfo Then
  $objSWbemServices = ObjGet("winmgmts:\\.\root\cimv2") ;获取默认机器名
  $colSWbemObjectSet = $objSWbemServices.ExecQuery("Select * from Win32_ComputerSystem")
  For $objSWbemObject In $colSWbemObjectSet
   $strComputer = $objSWbemObject.Name
  Next
 EndIf
Else
 Exit
EndIf
FileCopy(@HomeDrive & "\WINDOWS\inf\ntprint.inf", @ScriptDir & "\ntprint.ini", 1)
$group1 = GUICtrlCreateGroup("当前打印机列表:", 10, 15, 255, 165)
$List1 = GUICtrlCreateList("", 92, 35, 161, 135, $LBS_STANDARD)
_PrinterCount()
$DelPrinter = GUICtrlCreateButton("删    除", 20, 35, 68, 30, $BS_FLAT)
$Findconfig = GUICtrlCreateButton("察看配置", 20, 68, 68, 30, $BS_FLAT)
$CancelAllJobs = GUICtrlCreateButton("清除作业", 20, 101, 68, 30, $BS_FLAT)
$Refresh = GUICtrlCreateButton("刷新列表", 20, 134, 68, 30, $BS_FLAT)
;GUI当前打印机器信息
$group2 = GUICtrlCreateGroup("当前打印机器信息", 280, 15, 210, 165)
GUICtrlCreateLabel("打印机IP:", 295, 35, 60, 15)
$currentPrinterName = GUICtrlCreateInput("", 355, 32, 125, 20)
GUICtrlCreateLabel("驱动型号:", 295, 63, 60, 15)
$DriverName = GUICtrlCreateInput("", 355, 60, 125, 20)
GUICtrlCreateLabel("是否默认:", 295, 91, 60, 15)
$IsDefultPrinter = GUICtrlCreateInput("", 355, 88, 125, 20)
GUICtrlCreateLabel("接口类型:", 295, 119, 60, 15)
$InterfaceType = GUICtrlCreateInput("", 355, 115, 125, 20)
$PrintTestPage = GUICtrlCreateButton("打印测试页", 295, 147, 68, 28, $BS_FLAT)
$ResetIP = GUICtrlCreateButton("重置IP", 410, 147, 68, 28, $BS_FLAT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUI添加打印机
$group3 = GUICtrlCreateGroup("添加打印机", 10, 190, 255, 165)
GUICtrlCreateLabel("打印机名:", 40, 220, 60, 15)
$PrinterName = GUICtrlCreateInput("", 115, 215, 125, 20)
GUICtrlCreateLabel("打印机IP:", 40, 245, 60, 15)
$PrinterIP = GUICtrlCreateInput("", 115, 240, 125, 20)
GUICtrlCreateLabel("驱动型号:", 40, 270, 60, 15)
$HP = GUICtrlCreateRadio("HP", 115, 270, 50, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
$Xerox = GUICtrlCreateRadio("Xerox", 190, 270, 50, 20)
$FujiXerox = GUICtrlCreateRadio("Fuji Xerox", 115, 290, 60, 20)
$AddPrinter = GUICtrlCreateButton("添加", 25, 320, 60, 30, $BS_FLAT)
$Other = GUICtrlCreateButton("添加向导", 105, 320, 60, 30, $BS_FLAT)
$Reset = GUICtrlCreateButton("清空", 185, 320, 60, 30, $BS_FLAT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
;GUI打印机驱动
$group4 = GUICtrlCreateGroup("请选择打印机驱动", 280, 190, 210, 165)
$List2 = GUICtrlCreateList("", 285, 215, 200, 95, $LBS_STANDARD)
_ReadIniHP()
GUICtrlCreateLabel("联系我们:", 290, 315, 195, 15)
$label_url = GUICtrlCreateLabel("", 290, 330, 175, 20)
GUICtrlSetFont(-1, 9, -1, 4)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

;建立托盘信息
TraySetToolTip("打印机添加助手 Beta 1.0 作者：xrbenbeba")
$Helpitem = TrayCreateItem("帮助")
TrayItemSetOnEvent($Helpitem, "_Helpitem")
TrayCreateItem("")
$aboutitem = TrayCreateItem("关于")
TrayItemSetOnEvent($aboutitem, "_Aboutitem")
TrayCreateItem("")
$exititem = TrayCreateItem("退出")
TrayItemSetOnEvent($exititem, "_Exit")
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "_Restore")
TraySetState()

$mouseon = 0 ;鼠标经过控件的标记
While 1
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE ;关闭程序
   DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $mainwindow, "int", 500, "long", 0x00090000)
   Exit
   
  Case $DelPrinter ;删除
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _DelPrinter($SetDefultPrinterName)
   _PrinterCount()
  Case $Findconfig ;察看配置
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _FindConfig($SetDefultPrinterName)
  Case $ResetIP
   ;_SetIP()
   $strComputerNew = InputBox("请输入", "提示:" & @CRLF & @CRLF & "1.请正确输入需要管理的机器的IP或者机" & @CRLF & "  器名." & @CRLF & @CRLF & "2.不要输入127.0.0.1的IP这样会导致出现" & @CRLF & " 无法正常选择驱动的错误!" & @CRLF & @CRLF & "3.如果不输入或为空,默认为本机." & @CRLF & @CRLF & "4.取消不改变当前设置.", $InputInfo, "", -1, 235)
   If @error = 0 Then
    $strComputer = $strComputerNew
    If $strComputerNew = "" Or $strComputerNew = $InputInfo Then
     $objSWbemServices = ObjGet("winmgmts:\\.\root\cimv2") ;获取默认机器名
     $colSWbemObjectSet = $objSWbemServices.ExecQuery("Select * from Win32_ComputerSystem")
     For $objSWbemObject In $colSWbemObjectSet
      $strComputer = $objSWbemObject.Name
     Next
    EndIf
   EndIf
   _PrinterCount()
  Case $CancelAllJobs ;清除所有作业
   $SetDefultPrinterName = "'" & GUICtrlRead($List1) & "'"
   _CancelAllJobs($SetDefultPrinterName)
  Case $Reset ;重置(清空输入)
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
  Case $AddPrinter ;添加打印机
   $SetPrinterDriver = GUICtrlRead($List2)
   $SetPrinterName = GUICtrlRead($PrinterName)
   $SetPrinterIP = GUICtrlRead($PrinterIP)
   If $SetPrinterDriver <> "" And $SetPrinterName <> "" And $SetPrinterIP <> "" Then
    $Flag = MsgBox(1, "提示", "打印机名为:" & $SetPrinterName & @CRLF & "打印机IP为:" & $SetPrinterIP & @CRLF & "打印驱动为:" & $SetPrinterDriver & @CRLF & @CRLF & "确认添加?")
    If $Flag = 1 Then
     _AddPrinter()
     _PrinterCount()
    EndIf
   Else
    MsgBox(0, "警告", "IP,名称,驱动不能为空!" & @CRLF & "请重新输入!")
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
  MsgBox(0, "提示", "删除成功!")
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
  MsgBox(0, "提示", "清除作业成功")
 Next
EndFunc   ;==>_CancelAllJobs
Func _ReadIniHP()
 GUICtrlSetData($List2, "")
 $SectionNames = IniReadSection(@ScriptDir & "\ntprint.ini", "HP")
 If @error Then
  MsgBox(0, "", "发生错误,缺少标准的INI文件.")
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
  MsgBox(0, "", "发生错误,缺少标准的INI文件.")
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
  MsgBox(0, "", "发生错误,缺少标准的INI文件.")
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
 ProgressOn("处理中,请稍候...", "", "", -1, -1, 2 + 16)
 ProgressSet(0, "已完成 0%", "正在创建变量...")
 Sleep(300)
 $Patch = "\\" & $strComputer & "\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
 $Patch001 = "\\" & $strComputer & "\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
 $i = 1
 $s = ""
 ProgressSet(10, "已完成 10%", "正在检测端口信息...")
 Sleep(300)
 Do
  $Var = RegEnumKey($Patch, $i)
  $i = $i + 1
  $s = $s & $Var & "/"
  ProgressSet(10 + $i, "已完成 " & 10 + $i & "%", "正在检测端口信息...")
  Sleep(300)
 Until StringLeft($Var, 3) <> "IP_"
 $x = StringInStr($s, "IP_" & $SetPrinterIP)
 $PortName = "IP_" & $SetPrinterIP
 $NewPatch = $Patch & $PortName
 $NewPatch001 = $Patch001 & $PortName
 ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")
 Sleep(300)
 If $x = 0 Then
  ProgressSet(40, "已完成 40%", "端口不存在,在正在创建端口...")
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
  ProgressSet(60, "已完成 60%", "端口不存在,正在创建端口...")
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
  ProgressSet(70, "已完成 70%", "正在停止打印服务...")
  RunWait(@ComSpec & " /c sc \\" & $strComputer & " stop spooler", "", @SW_HIDE)
  ProgressSet(75, "已完成 80%", "正在启动打印服务...")
  RunWait(@ComSpec & " /c sc \\" & $strComputer & " start spooler", "", @SW_HIDE)
  ProgressSet(80, "已完成 80%", "准备添加打印机...")
  Sleep(300)
 Else
  ProgressSet(60, "已完成 60%", "端口已经存在,准备添加打印机...")
  Sleep(300)
 EndIf
 ProgressSet(90, "已完成 90%", "正在添加打印机...")
 RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /if /b "' & $SetPrinterName & '" /c \\'& $strComputer & ' /f %windir%\inf\ntprint.inf /r "' & $PortName & '" /m "' & $SetPrinterDriver & '"', "", @SW_HIDE)
 ;MsgBox (0,"注意","添加打印机完毕!")
 Sleep(300)
 ProgressSet(100, "已完成 100%", "添加打印机完毕!")
 ProgressOff()
 MsgBox(0, "", "添加完毕!")
EndFunc   ;==>_AddPrinter
Func _PrintTestPage($SetDefultPrinterName)
 $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
 $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Printer Where DeviceID = " & $SetDefultPrinterName)
 For $objNetAdapter In $colItems
  $objNetAdapter.PrintTestPage()
  MsgBox(0, "提示", "请检查是否打印成功!")
 Next
EndFunc   ;==>_PrintTestPage

Func _AddOther()
 RunWait(@ComSpec & " /c rundll32 printui.dll,PrintUIEntry /il /c \\" & $strComputer, "", @SW_HIDE)
EndFunc   ;==>_AddOther
Func _Exit() ;托盘退出事件
 DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $mainwindow, "int", 500, "long", 0x00090000)
 Exit
EndFunc   ;==>_Exit
Func _Helpitem() ;托盘帮助事件
 ShellExecute(@ScriptDir & "\readme.txt", @SW_MAXIMIZE)
EndFunc   ;==>_Helpitem
Func _Aboutitem() ;托盘关于事件
 MsgBox(0, "关于", "xrbenbeba制作" & @CRLF & @CRLF & "")
EndFunc   ;==>_Aboutitem
Func _Restore() ;托盘双击事件
 WinSetState($mainwindow, "", @SW_SHOW)
 WinSetState($mainwindow, "", @SW_RESTORE)
EndFunc   ;==>_Restore