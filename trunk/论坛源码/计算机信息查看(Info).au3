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

#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=prog.ico
#AutoIt3Wrapper_Outfile=Computer-Info.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Constants.au3>
#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <Inet.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>

Opt('GUIOnEventMode', 1)
Opt('MustDeclareVars', 1)

Global $sTitle = 'Form1'
Global $hGUI, $hTab, $hStatus, $iWidth
Global $aTabNames[16] = [ _
                '操作系统', '驱动器', '硬盘驱动器', '光驱', '网络', _
                '网络适配器', '处理器', 'RAM', '显卡信息', '监视器', _
                '打印机', '声卡', '主板', '插槽', '报告', '关于']
Global $ahTabIDs[UBound($aTabNames)], $ahContent[UBound($aTabNames)], $ahContext[UBound($aTabNames)]

If @OSType <> 'WIN32_NT' Then Exit MsgBox(48, $sTitle, 'Das Programm funktioniert erst ab Windows 2000')

If (Not @Compiled) And (@AutoItVersion < '3.3.0.0') Then
        Global $Msg = 'Dieses Script benigt min. die AutoIt-Version: 3.3.0.0 ' & @CRLF & @CRLF
        $Msg &= 'Gestartet wurde es mit AutoIt-Version: ' & @AutoItVersion
        Exit MsgBox(48, $sTitle, $Msg)
EndIf
$iWidth = @DesktopWidth - 20
If $iWidth > 1000 Then $iWidth = 1000

$hGUI = GUICreate($sTitle, $iWidth, 520, Default, 120, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_SIZEBOX))
GUISetOnEvent($GUI_EVENT_CLOSE, '_End')
If FileExists(@ScriptDir & '\prog.ico') Then
        GUISetIcon(@ScriptDir & '\prog.ico', -1)
Else
        GUISetIcon('shell32.dll', -13)
EndIf
$hTab = GUICtrlCreateTab(10, 10, $iWidth - 20, 475)
GUICtrlSetOnEvent(-1, '_TabClick')
GUICtrlSetResizing(-1, 2 + 4 + 32 + 64)
For $i = 0 To UBound($aTabNames) - 1
        $ahTabIDs[$i] = GUICtrlCreateTabItem($aTabNames[$i])
        $ahContent[$i] = GUICtrlCreateListView(' | ', 22, 42, $iWidth - 45, 430, $LVS_NOCOLUMNHEADER, $LVS_EX_DOUBLEBUFFER + $WS_EX_CLIENTEDGE + $LVS_EX_FULLROWSELECT)
        GUICtrlSetResizing(-1, 2 + 4 + 32 + 64)
        GUICtrlSetBkColor(-1, 0xffffcc)
        $ahContext[$i] = GUICtrlCreateContextMenu($ahContent[$i])
        GUICtrlCreateMenuItem('复制选中内容到剪贴板', $ahContext[$i])
        GUICtrlSetOnEvent(-1, '_CopySelItemsToClip')
        GUICtrlCreateMenuItem('复制所有到剪贴板', $ahContext[$i])
        GUICtrlSetOnEvent(-1, '_CopyAllItemsToClip')
Next
GUICtrlCreateTabItem('')
$hStatus = _GUICtrlStatusBar_Create($hGUI)
GUIRegisterMsg($WM_SIZE, 'WM_SIZE')
GUIRegisterMsg($WM_GETMINMAXINFO, 'MY_WM_GETMINMAXINFO')
_CallFunction(0)
GUISetState()

While Sleep(1000)
WEnd

Func _End()
        Exit
EndFunc   ;==>_End

Func _CopyAllItemsToClip()
        Local $iFunctionNr, $sContent, $iCount, $aItem
        $iFunctionNr = GUICtrlRead($hTab)
        $iCount = _GUICtrlListView_GetItemCount($ahContent[$iFunctionNr])
        If $iCount = 0 Then Return
        For $i = 0 To $iCount - 1
                $aItem = _GUICtrlListView_GetItemTextArray($ahContent[$iFunctionNr], $i)
                If StringRegExp($aItem[1], '\w+') Then $sContent &= StringFormat('%-24s %s', $aItem[1], $aItem[2]) & @CRLF
        Next
        ClipPut($sContent)
EndFunc

Func _CopySelItemsToClip()
        Local $iFunctionNr, $sContent, $aSelItems, $aItem
        $iFunctionNr = GUICtrlRead($hTab)
        $aSelItems = _GUICtrlListView_GetSelectedIndices($ahContent[$iFunctionNr], True)
        If $aSelItems[0] = 0 Then Return
        For $i = 1 To $aSelItems[0]
                $aItem = _GUICtrlListView_GetItemTextArray($ahContent[$iFunctionNr], $aSelItems[$i])
                If StringRegExp($aItem[1], '\w+') Then $sContent &= StringFormat('%-24s %s', $aItem[1], $aItem[2]) & @CRLF
        Next
        ClipPut($sContent)
EndFunc

Func _TabClick()
        Local $iFunctionNr, $sContent, $iCount, $aItem
        $iFunctionNr = GUICtrlRead($hTab)
        If $iFunctionNr = 14 Then
                _GUICtrlListView_DeleteAllItems($ahContent[$iFunctionNr])
                For $i = 0 To 13
                        _GUICtrlStatusBar_SetText($hStatus, StringFormat('正在创建 (%s / 13) 的报告. 请稍候...', $i))
                        _CallFunction($i, False)
                        $iCount = _GUICtrlListView_GetItemCount($ahContent[$i])
                        If $iCount > 0 Then
                                $sContent &= $aTabNames[$i] & @CRLF & '======================================' & @CRLF
                                For $j = 0 To $iCount - 1
                                        $aItem = _GUICtrlListView_GetItemTextArray($ahContent[$i], $j)
                                        If StringRegExp($aItem[1], '\w+') Then $sContent &= StringFormat('%-24s %s', $aItem[1], $aItem[2]) & @CRLF
                                Next
                                $sContent &= @CRLF
                        EndIf
                Next
                _GUICtrlStatusBar_SetText($hStatus, '该报告是.')
                GUICtrlCreateListViewItem('', $ahContent[$iFunctionNr])
                GUICtrlCreateListViewItem('该报告是剪贴板中的.', $ahContent[$iFunctionNr])
                _GUICtrlListView_SetColumnWidth($ahContent[14], 0, $LVSCW_AUTOSIZE)
                ClipPut($sContent)
        Else
                _CallFunction($iFunctionNr)
        EndIf
EndFunc   ;==>_TabClick

Func _CallFunction($iFunctionNr, $fNoReport = True)
        Local $sMsg = '空闲.', $aInfo
        If $fNoReport Then
                _GUICtrlStatusBar_SetText($hStatus, '请稍候...')
                _GUICtrlListView_BeginUpdate($ahContent[$iFunctionNr])
        EndIf
        _GUICtrlListView_DeleteAllItems($ahContent[$iFunctionNr])
        Switch $iFunctionNr
                Case 0
                        $aInfo = _CI_GetWindowsInfo()
                Case 1
                        $aInfo = _CI_GetLogicalDisk()
                Case 2
                        $aInfo = _CI_GetHarddrives()
                Case 3
                        $aInfo = _CI_GetCDROM()
                Case 4
                        $aInfo = _CI_GetNetwork()
                Case 5
                        $aInfo = _CI_GetNetworkAdapter()
                Case 6
                        $aInfo = _CI_GetCPU()
                Case 7
                        $aInfo = _CI_GetRAM()
                Case 8
                        $aInfo = _CI_GetVideoController()
                Case 9
                        $aInfo = _CI_GetMonitor()
                Case 10
                        $aInfo = _CI_GetPrinter()
                Case 11
                        $aInfo = _CI_GetSoundDevice()
                Case 12
                        $aInfo = _CI_GetMainBoard()
                Case 13
                        $aInfo = _CI_GetSystemSlot()
                Case 15
                        $aInfo = _CI_GetProgInfo()
        EndSwitch
        If Not @error Then
                For $i = 1 To UBound($aInfo) - 1
                        Switch $iFunctionNr
                                Case 0, 4, 12, 14
                                        GUICtrlCreateListViewItem('', $ahContent[$iFunctionNr])
                                Case Else
                                        GUICtrlCreateListViewItem($i & '.| ', $ahContent[$iFunctionNr])
                        EndSwitch
                        For $j = 0 To UBound($aInfo, 2) - 1
                                GUICtrlCreateListViewItem($aInfo[0][$j] & '|' & $aInfo[$i][$j], $ahContent[$iFunctionNr])
                        Next
                        GUICtrlCreateListViewItem(' | ', $ahContent[$iFunctionNr])
                Next
        Else
                $sMsg = '错误: ' & @error
        EndIf
        _GUICtrlListView_SetColumnWidth($ahContent[$iFunctionNr], 0, $LVSCW_AUTOSIZE)
        _GUICtrlListView_SetColumnWidth($ahContent[$iFunctionNr], 1, $LVSCW_AUTOSIZE)
        If $fNoReport Then
                _GUICtrlListView_EndUpdate($ahContent[$iFunctionNr])
                _GUICtrlStatusBar_SetText($hStatus, $sMsg)
        EndIf
EndFunc   ;==>_CallFunction
	
Func _CI_GetWindowsInfo($strComputer = '.')
        Local $aReturn[2][17] = [[ _
                        '操作系統:', '版本:', '語言版本:', '键盘:', '启动驱动器:', 'Windows目录:', _
                        '空间:', '内存容量:', '页面文件:', '安装时间:', '上次启动时间:', _
                        '今天日期:', '用户名:', '用户目录:', '产品序列号:', '壁纸:', '屏保:']]
        Local $aTmp, $sOSLang = @OSLang, $sKBLayout = @KBLayout, $sDigitalProductID, $sWallpaper = '不存在', $sScreenSaver = '不存在'
        Local $x = 0, $objWMIService, $colItems, $aMemory = MemGetStats(), $sX64 = ''
        $aTmp = DllCall('kernel32.dll', 'int', 'GetLocaleInfo', 'dword', '0x' & $sOSLang, 'dword', BitOR(0x2, 0x80000000), 'str', '', 'int', 85)
        If IsArray($aTmp) Then $sOSLang = $aTmp[3]
        $aTmp = DllCall('kernel32.dll', 'int', 'GetLocaleInfo', 'dword', '0x' & $sKBLayout, 'dword', BitOR(0x2, 0x80000000), 'str', '', 'int', 85)
        If IsArray($aTmp) Then $sKBLayout = $aTmp[3]
        If @OSArch <> 'X86' Then $sX64 = '64'
        $sDigitalProductID = RegRead('HKEY_LOCAL_MACHINE' & $sX64 & '\SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'DigitalProductID')
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_Desktop', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        If StringInStr($objItem.Name, @UserName) Then
                                If $objItem.Wallpaper <> '' Then $sWallpaper = $objItem.Wallpaper
                                If $objItem.ScreenSaverExecutable <> '' Then $sScreenSaver = $objItem.ScreenSaverExecutable
                        EndIf
                Next
        EndIf
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_OperatingSystem', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $aReturn[1][0] = $objItem.Caption & ' (' & @OSArch & ')'
                        $aReturn[1][1] = $objItem.Version
                        $aReturn[1][2] = $sOSLang
                        $aReturn[1][3] = $sKBLayout
                        $aReturn[1][4] = $objItem.BootDevice
                        $aReturn[1][5] = $objItem.WindowsDirectory
                        $aReturn[1][6] = '驱动器 "' & $objItem.SystemDrive & '\"   ' & _ByteAutoSize(DriveSpaceTotal($objItem.SystemDrive) * 2 ^ 20)
                        $aReturn[1][6] &= ' (' & _ByteAutoSize(DriveSpaceFree($objItem.SystemDrive) * 2 ^ 20) & ' 可使用)'
                        $aReturn[1][7] = _ByteAutoSize($aMemory[1] * 1024, 0, 3)
                        $aReturn[1][8] = _ByteAutoSize($objItem.SizeStoredInPagingFiles * 1024, 0, 3)
                        $aReturn[1][9] = _WMIDateStringToDate($objItem.InstallDate)
                        $aReturn[1][10] = _WMIDateStringToDate($objItem.LastBootUpTime)
                        $aReturn[1][11] = _Now()
                        $aReturn[1][12] = @UserName
                        $aReturn[1][13] = @UserProfileDir
                        $aReturn[1][14] = _DecodeProductKey($sDigitalProductID)
                        $aReturn[1][15] = $sWallpaper
                        $aReturn[1][16] = $sScreenSaver
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetWindowsInfo

Func _CI_GetLogicalDisk($strComputer = '.')
        Local $aReturn[1][9] = [[ _
                        '驱动器:', '类型:', '网络路径:', '映射:', '总大小:', '可用空间:', _
                        '文件系统:', '卷标:', ' 系列号:']]
        Local $x = 0, $objWMIService, $colItems, $aAccess[2] = ['R/W', 'R']
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_LogicalDisk', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][9]
                        $aReturn[$x][0] = $objItem.Name
                        $aReturn[$x][1] = $objItem.Description
                        If $objItem.Description = '网络连接' Then
                                $aReturn[$x][2] = $objItem.ProviderName
                        Else
                                $aReturn[$x][2] = '---'
                        EndIf
                        If String($objItem.FileSystem) <> '' Then
                                If String($objItem.Access) <> '' Then
                                        $aReturn[$x][3] = $aAccess[Number($objItem.Access)]
                                Else
                                        $aReturn[$x][3] = '不存在'
                                EndIf
                                $aReturn[$x][4] = _ByteAutoSize($objItem.Size)
                                $aReturn[$x][5] = _ByteAutoSize($objItem.FreeSpace)
                                $aReturn[$x][6] = $objItem.FileSystem
                                $aReturn[$x][7] = '"' & $objItem.VolumeName & '"'
                                $aReturn[$x][8] = $objItem.VolumeSerialNumber
                        EndIf
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetLogicalDisk

Func _CI_GetHarddrives($strComputer = '.')
        Local $aReturn[1][8] = [[ _
                        '名称:', '容量:', '类型:', '磁头数:', '扇区数:', _
                        '设备ID:', '状态:', 'Seriennr. (Hardware):']]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_DiskDrive', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][8]
                        $aReturn[$x][0] = $objItem.Model
                        $aReturn[$x][1] = _ByteAutoSize($objItem.Size)
                        $aReturn[$x][2] = $objItem.InterfaceType
                        $aReturn[$x][3] = $objItem.BytesPerSector
                        $aReturn[$x][4] = $objItem.TotalSectors
                        $aReturn[$x][5] = $objItem.PNPDeviceID
                        $aReturn[$x][6] = $objItem.Status
                        Switch @OSVersion
                                Case 'WIN_VISTA', 'WIN_7'
                                        If Number($objItem.SerialNumber) > 0 Then
                                                $aReturn[$x][7] = $objItem.SerialNumber & '   ("' & _CI_SerialToString($objItem.SerialNumber) & '")'
                                        Else
                                                $aReturn[$x][7] = '不存在'
                                        EndIf
                                Case Else
                                        $aReturn[$x][7] = '哦 ' & @OSVersion & '暂不支持!'
                        EndSwitch
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetHarddrives

Func _CI_SerialToString($sSerial)
        Local $sOut = ''
        For $i = 1 To StringLen($sSerial) Step 2
                $sOut &= Chr(Dec(StringMid($sSerial, $i, 2)))
        Next
        Return $sOut
EndFunc   ;==>_CI_SerialToString

Func _CI_GetCDROM($strComputer = '.')
        Local $aReturn[1][9] = [[ _
                        '驱动器:', '指定:', '类型:', 'PNPDeviceID:', '驱动器状态:', _
                        '光盘状态:', '光盘名称:', 'Disc-Gre:', 'Seriennr. (Disc):']]
        Local $x = 0, $objWMIService, $colItems, $aMedia[2] = ['没有插入光盘', '存在光盘']
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_CDROMDrive', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][9]
                        $aReturn[$x][0] = $objItem.Drive
                        $aReturn[$x][1] = $objItem.Name
                        $aReturn[$x][2] = $objItem.MediaType
                        $aReturn[$x][3] = $objItem.PNPDeviceID
                        $aReturn[$x][4] = $objItem.Status
                        $aReturn[$x][5] = $aMedia[Abs($objItem.MediaLoaded)]
                        If Abs($objItem.MediaLoaded) Then
                                $aReturn[$x][6] = '"' & $objItem.VolumeName & '"'
                                $aReturn[$x][7] = _ByteAutoSize($objItem.Size)
                                $aReturn[$x][8] = $objItem.VolumeSerialNumber
                        EndIf
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetCDROM

Func _CI_GetNetwork($strComputer = '.')
        Local $aReturn[2][11] = [[ _
                        '用户名:', '计算机名:', '局域网IP:', 'DNS服务器:', '工作组:', '外网IP:', _
                        'Max. TCP-Paketgre:', 'Ping-Zeiten:', '     百度', '     腾讯', '     禄脿学校']]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $aReturn[1][0] = @UserName
        $aReturn[1][1] = @ComputerName
        TCPStartup()
        $aReturn[1][2] = TCPNameToIP(@ComputerName)
        TCPShutdown()
        $aReturn[1][3] = _CI_GetDNS()
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_ComputerSystem', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $aReturn[1][4] = $objItem.Domain
                        $aReturn[1][5] = _GetIP()
                Next
        EndIf
        $aReturn[1][6] = _CI_GetMaxTCPLen('www.baidu.com')
        $aReturn[1][8] = _CI_PingCheck('www.qq.com')
        $aReturn[1][9] = _CI_PingCheck('www.lpxx.cn')
        $aReturn[1][10] = _CI_PingCheck('www.google.com')
        Return $aReturn
EndFunc   ;==>_CI_GetNetwork

Func _CI_GetDNS()
        Local $sPID = Run(@ComSpec & ' /c nslookup ' & @ComputerName, @SystemDir, @SW_HIDE, $STDOUT_CHILD)
        Local $sOut = ''
        Do
                $sOut &= StdoutRead($sPID)
        Until @error <> 0
        Return StringRegExpReplace($sOut, '(?s)Server:\h+(\S+).*?Address:\h+(\S+).*', '$2  ("$1")')
EndFunc   ;==>_CI_GetDNS

Func _CI_PingCheck($sURL)
        Local $iRet, $aError[5] = ['', '计算机当前离线', '计算机不可访问', '地址正确', '其他错误']
        $iRet = Ping($sURL, 1000)
        If Not @error Then Return '耗时约 ' & $iRet & ' ms'
        Return $aError[@error]
EndFunc   ;==>_CI_PingCheck

Func _CI_GetMaxTCPLen($sURL, $iTimeout = 1000, $strComputer = '.')
        Local $objWMIService, $colItems, $iStatus
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        For $i = 1500 To 1 Step -1
                $iStatus = 0
                $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_PingStatus WHERE Address="' & $sURL & _
                                '"  and NoFragmentation=True and Timeout=' & $iTimeout & ' and BufferSize=' & $i, 'WQL', 0x30)
                If IsObj($colItems) Then
                        For $objItem In $colItems
                                $iStatus = Number($objItem.StatusCode)
                        Next
                Else
                        Return 'Error, Win32_PingStatus failed!'
                EndIf
                If $iStatus = 0 Then ExitLoop
        Next
        Return $i & ' Bytes'
EndFunc   ;==>_CI_GetMaxTCPLen

Func _CI_GetNetworkAdapter($strComputer = '.')
        Local $aReturn[1][13] = [[ _
                        '生产厂商:', '产品名称:', '适配器型号:', '连接名称:', 'MTU:', _
                        'MAC地址:', 'IP地址:', '子网掩码:', 'IP类型:', _
                        'DHCP服务器:', 'IP erhalten:', 'IP lft ab:', '默认网关:']]
        Local $x = 0, $objWMIService, $colItems, $colItems2
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapter WHERE Netconnectionstatus > 0', 'WQL', 0x30)
        If Not IsObj($colItems) Then Return SetError(2, 0, 0)
        For $objItem In $colItems
                $x += 1
                ReDim $aReturn[$x + 1][13]
                $aReturn[$x][0] = $objItem.Manufacturer
                $aReturn[$x][1] = $objItem.Name
                $aReturn[$x][2] = $objItem.AdapterType
                $aReturn[$x][3] = $objItem.NetConnectionID
                $aReturn[$x][4] = _CI_GetMTU($objItem.NetConnectionID)
                $aReturn[$x][5] = $objItem.MACAddress
                $colItems2 = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapterConfiguration', 'WQL', 0x30)
                If IsObj($colItems2) Then
                        For $objItem2 In $colItems2
                                If $objItem.Caption = $objItem2.Caption Then
                                        If $objItem2.IPEnabled = -1 Then
                                                $aReturn[$x][6] = $objItem2.IPAddress(0)
                                                $aReturn[$x][7] = $objItem2.IPSubnet(0)
                                                If $objItem2.DHCPEnabled = -1 Then
                                                        $aReturn[$x][8] = '通过DHCP分配'
                                                        $aReturn[$x][9] = $objItem2.DHCPServer
                                                        $aReturn[$x][10] = _WMIDateStringToDate($objItem2.DHCPLeaseObtained)
                                                        $aReturn[$x][11] = _WMIDateStringToDate($objItem2.DHCPLeaseExpires)
                                                Else
                                                        $aReturn[$x][8] = '手动配置'
                                                EndIf
                                                $aReturn[$x][12] = $objItem2.DefaultIPGateway(0)
                                        EndIf
                                EndIf
                        Next
                EndIf
        Next
        Return $aReturn
EndFunc   ;==>_CI_GetNetworkAdapter

Func _CI_GetMTU($sNetworkAdapter)
        Switch @OSVersion
                Case 'WIN_VISTA', 'WIN_7'
                        Local $sPID = Run(@ComSpec & ' /c netsh interface ipv4 show subinterface "' & $sNetworkAdapter & '"', @SystemDir, @SW_HIDE, $STDOUT_CHILD)
                        Local $sOut = ''
                        While 1
                                $sOut &= StdoutRead($sPID)
                                If @error Then ExitLoop
                        WEnd
                        Return StringRegExpReplace($sOut, '(?s).*?(\d+).*', '$1') & ' Bytes'
                Case Else
                        Return '不存在'
        EndSwitch
EndFunc   ;==>_CI_GetMTU

Func _CI_GetCPU($strComputer = '.')
        Local $aReturn[2][12] = [[ _
                        '处理器:', '名称:', '描述:', '基地:', '主频:', 'Ext. Taktfrequenz:', '电压:', _
                        'Adress-Bitbreite:', 'Daten-Bitbreite:', '处理器-ID:', '', '']]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_Processor', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][12]
                        $aReturn[$x][0] = $objItem.DeviceID
                        $aReturn[$x][1] = $objItem.Name
                        $aReturn[$x][2] = $objItem.Description
                        $aReturn[$x][3] = $objItem.SocketDesignation
                        $aReturn[$x][4] = $objItem.CurrentClockSpeed & ' MHz   (max. ' & $objItem.MaxClockSpeed & ' MHz)'
                        $aReturn[$x][5] = $objItem.ExtClock & ' MHz'
                        $aReturn[$x][6] = Round($objItem.CurrentVoltage / 10, 1) & ' V'
                        $aReturn[$x][7] = $objItem.AddressWidth & ' Bit'
                        $aReturn[$x][8] = $objItem.DataWidth & ' Bit'
                        $aReturn[$x][9] = $objItem.ProcessorId
                        Switch @OSVersion
                                Case 'WIN_VISTA', 'WIN_7'
                                        $aReturn[0][10] = '核心:'
                                        $aReturn[0][11] = '逻辑处理器:'
                                        $aReturn[$x][10] = $objItem.NumberOfCores
                                        $aReturn[$x][11] = $objItem.NumberOfLogicalProcessors
                        EndSwitch
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetCPU

Func _CI_GetRAM($strComputer = '.')
        Local $aMemType[22] = ['Unbekannt', 'Anderes', 'DRAM', 'Sync DRAM', 'Cache DRAM', _
                        'EDO', 'EDRAM', 'VRAM', 'SRAM', 'RAM', 'ROM', _
                        'Flash', 'EEPROM', 'FEPROM', 'EPROM', 'CDRAM', '3DRAM', _
                        'SDRAM', 'SGRAM', 'RDRAM', 'DDR', 'DDR-2']
        Local $aFormFactor[24] = ['Unbekannt', 'Andere', 'SIP', 'DIP', 'ZIP', 'SOJ', _
                        'Propriet', 'SIMM', 'DIMM', 'TSOP', 'PGA', 'RIMM', _
                        'SODIMM', 'SRIMM', 'SMD', 'SSMP', 'QFP', 'TQFP', _
                        'SOIC', 'LCC', 'PLCC', 'BGA', 'FPBGA', 'LGA']
        Local $aErrCorr[8] = ['保留', '其他', '未知', '没有', 'Parity', 'Single-bit ECC', 'Multi-bit ECC', 'CRC']
        Local $aReturn[2][8] = [[ _
                        '占用:', 'Kapazit:', '数据位宽度:', '槽:', _
                        'Typ:', 'Format:', '错误修正:', '指定:']]
        Local $x = 0, $objWMIService, $colItems, $iMemDev, $iMaxCap, $iErrCorr
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_PhysicalMemoryArray', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $iMemDev = $objItem.MemoryDevices
                        $iMaxCap = _ByteAutoSize($objItem.MaxCapacity * 1024, 0, 3)
                        $iErrCorr = Number($objItem.MemoryErrorCorrection)
                Next
        EndIf
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_PhysicalMemory', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][8]
                        $aReturn[$x][0] = $objItem.BankLabel
                        $aReturn[$x][1] = _ByteAutoSize($objItem.Capacity, 0, 3) & '   (max. ' & $iMaxCap & ')'
                        $aReturn[$x][2] = $objItem.TotalWidth & ' Bit'
                        $aReturn[$x][3] = $objItem.DeviceLocator & '   (max. ' & $iMemDev & ' Steckplze)'
                        $aReturn[$x][4] = $aMemType[Number($objItem.MemoryType)]
                        $aReturn[$x][5] = $aFormFactor[Number($objItem.FormFactor)]
                        $aReturn[$x][6] = $aErrCorr[$iErrCorr]
                        $aReturn[$x][7] = $objItem.PartNumber
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetRAM

Func _CI_GetVideoController($strComputer = '.')
        Local $aReturn[2][12] = [[ _
                        '厂商:', '描述:', 'RAMDAC:', '显存:', _
                        'RAM-Typ:', '水平分辨率:', '垂直分辨率:', 'Bits/Pixel:', _
                        '色彩度:', '刷新率:', '驱动版本:', '驱动日期:']]
        Local $aRAMType[14] = ['', '其他', '未知', 'VRAM', 'DRAM', 'SRAM', 'WRAM', 'EDO RAM', _
                        'Burst Sync DRAM', 'Pipelined Burst SRAM', 'CDRAM', '3DRAM', 'SDRAM', 'SGRAM']
        Local $x = 0, $objWMIService, $colItems, $Output
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_VideoController', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][12]
                        $aReturn[$x][0] = $objItem.AdapterCompatibility
                        $aReturn[$x][1] = $objItem.Description
                        $aReturn[$x][2] = $objItem.AdapterDACType
                        $aReturn[$x][3] = _ByteAutoSize($objItem.AdapterRAM, 0, 3)
                        $aReturn[$x][4] = $aRAMType[Number($objItem.VideoMemoryType)]
                        $aReturn[$x][5] = $objItem.CurrentHorizontalResolution
                        $aReturn[$x][6] = $objItem.CurrentVerticalResolution
                        $aReturn[$x][7] = $objItem.CurrentBitsPerPixel
                        $aReturn[$x][8] = _StringAddThousandsSep($objItem.CurrentNumberOfColors, '.', ',')
                        $aReturn[$x][9] = $objItem.CurrentRefreshRate & ' Hz'
                        $aReturn[$x][10] = $objItem.DriverVersion
                        $aReturn[$x][11] = _WMIDateStringToDate($objItem.DriverDate)
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetVideoController

Func _CI_GetMonitor($strComputer = '.')
        Local $aReturn[2][8] = [[ _
                        '生产厂商:', '型号:', '宽度 (Pixel):', '高度 (Pixel):', _
                        '水平像素 (X):', 'Pixel pro Inch (Y):', 'Monitorgre (ca.):', 'PNPDeviceID:']]
        Local $x = 0, $objWMIService, $colItems, $Output
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_DesktopMonitor', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][8]
                        $aReturn[$x][0] = $objItem.MonitorManufacturer
                        $aReturn[$x][1] = $objItem.Name
                        $aReturn[$x][2] = $objItem.ScreenWidth
                        $aReturn[$x][3] = $objItem.ScreenHeight
                        $aReturn[$x][4] = $objItem.PixelsPerXLogicalInch
                        $aReturn[$x][5] = $objItem.PixelsPerYLogicalInch
                        $aReturn[$x][6] = Round($objItem.ScreenWidth / ($objItem.PixelsPerXLogicalInch / 2.54), 2) & _
                                        ' x ' & Round($objItem.ScreenHeight / ($objItem.PixelsPerYLogicalInch / 2.54), 2) & ' cm'
                        $aReturn[$x][7] = $objItem.PNPDeviceID
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetMonitor

Func _CI_GetPrinter($strComputer = '.')
        Local $aReturn[2][5] = [['名称:', '驱动程序:', '连接名:', '水平分辨率:', '垂直分辨率:']]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_Printer', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][5]
                        $aReturn[$x][0] = $objItem.Name
                        $aReturn[$x][1] = $objItem.DriverName
                        $aReturn[$x][2] = $objItem.PortName
                        $aReturn[$x][3] = $objItem.HorizontalResolution
                        $aReturn[$x][4] = $objItem.VerticalResolution
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetPrinter

Func _CI_GetSoundDevice($strComputer = '.')
        Local $aReturn[2][3] = [['生产厂商:', '名称:', '设备ID:']]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_SoundDevice', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][3]
                        $aReturn[$x][0] = $objItem.Manufacturer
                        $aReturn[$x][1] = $objItem.Name
                        $aReturn[$x][2] = $objItem.PNPDeviceID
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetSoundDevice

Func _CI_GetMainBoard($strComputer = '.')
        Local $aReturn[2][12] = [[ _
                        '生产厂商:', 'Produkt:', '版本:', '产品编号:', 'Ext. Anschlse:', _
                        'Int. Anschlse:', '', 'BIOS厂商:', '名称:', '版本:', '日期:', '编号:']]
        Local $x = 1, $objWMIService, $colItems, $sExtConnector = '', $sIntConnector = '', $sTmp
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_PortConnector', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $sTmp = $objItem.ExternalReferenceDesignator
                        If StringLen($sTmp) > 1 Then
                                $sExtConnector &= $sTmp & ' ** '
                                ContinueLoop
                        EndIf
                        $sTmp = $objItem.InternalReferenceDesignator
                        If StringLen($sTmp) > 1 Then $sIntConnector &= $sTmp & ' ** '
                Next
        EndIf
        $sExtConnector = StringTrimRight($sExtConnector, 4)
        $sIntConnector = StringTrimRight($sIntConnector, 4)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_BaseBoard', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $aReturn[$x][0] = $objItem.Manufacturer
                        $aReturn[$x][1] = $objItem.Product
                        $aReturn[$x][2] = $objItem.Version
                        $aReturn[$x][3] = $objItem.SerialNumber
                        $aReturn[$x][4] = $sExtConnector
                        $aReturn[$x][5] = $sIntConnector
                Next
        EndIf
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_BIOS', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $aReturn[$x][7] = $objItem.Manufacturer
                        $aReturn[$x][8] = $objItem.Name
                        $aReturn[$x][9] = $objItem.BIOSVersion(0)
                        $aReturn[$x][10] = _WMIDateStringToDate($objItem.ReleaseDate)
                        $aReturn[$x][11] = $objItem.SerialNumber
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetMainBoard

Func _CI_GetSystemSlot($strComputer = '.')
        Local $aReturn[2][3] = [['指定:', '被占用插槽:', 'max. Datenbreite:']]
        Local $aUsage[5] = ['保留', '其他', '未知', '没有', 'Ja']
        Local $aMaxDataWidth[5] = [8, 16, 32, 64, 128]
        Local $x = 0, $objWMIService, $colItems
        $objWMIService = ObjGet('winmgmts:\\' & $strComputer & '\root\cimv2')
        If Not IsObj($objWMIService) Then Return SetError(1, 0, 0)
        $colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_SystemSlot', 'WQL', 0x30)
        If IsObj($colItems) Then
                For $objItem In $colItems
                        $x += 1
                        ReDim $aReturn[$x + 1][3]
                        $aReturn[$x][0] = $objItem.SlotDesignation
                        $aReturn[$x][1] = $aUsage[$objItem.CurrentUsage]
                        $aReturn[$x][2] = $aMaxDataWidth[$objItem.MaxDataWidth] & ' Bits'
                Next
        EndIf
        Return $aReturn
EndFunc   ;==>_CI_GetSystemSlot

Func _CI_GetProgInfo()
        Local $aReturn[2][8] = [['软件名称:', '版本:', '更新日期:', '作者:', '', '致谢:']]
        $aReturn[1][0] = 'Computer-Info'
        $aReturn[1][1] = '2.1.0.0'
        $aReturn[1][2] = '21.02.2012'
        $aReturn[1][3] = 'Oscar (www.autoit.de)'
        $aReturn[1][5] = '引用"Thorsten Meger" (Xenobiologist)   "_DecodeProductKey"的函数'
        $aReturn[1][6] = '引用 "Prog@ndy" 的 "GetLocaleInfo"DLL模块'
        $aReturn[1][7] = '感谢Verbesserungsvorschle等对此程序的测试及建议'
        Return $aReturn
EndFunc   ;==>_CI_GetProgInfo

Func _WMIDateStringToDate($dtmDate)
        Return (StringMid($dtmDate, 7, 2) & '.' & StringMid($dtmDate, 5, 2) & '.' & StringLeft($dtmDate, 4) _
                         & ' ' & StringMid($dtmDate, 9, 2) & ':' & StringMid($dtmDate, 11, 2) & ':' & StringMid($dtmDate, 13, 2))
EndFunc   ;==>_WMIDateStringToDate

Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
        _GUICtrlStatusBar_Resize($hStatus)
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE

Func MY_WM_GETMINMAXINFO($hWnd, $Msg, $wParam, $lParam)
        Local $minmaxinfo
        If $hWnd = $hGUI Then
                $minmaxinfo = DllStructCreate('int;int;int;int;int;int;int;int;int;int', $lParam)
                DllStructSetData($minmaxinfo, 7, 600)
                DllStructSetData($minmaxinfo, 8, 400)
        EndIf
EndFunc   ;==>MY_WM_GETMINMAXINFO

;===============================================================================
; Function Name:   _ByteAutoSize($iSize[, $iRound][, $iFormat][, $bThousands])
; Description::    Gibt einen Bytewert in einer bestimmten Einheit zur點k
; Parameter(s):    $iSize = Gr鲞e in Byte 黚ergeben
;                  $iRound = Anzahl der Nachkommastellen (0...8)
;                  $iFormat = bestimmt den R點kgabewert
;                     0 = Automatisch (je nach 黚ergebenen Wert)
;                     1 = in Byte
;                     2 = in KByte
;                     3 = in MByte
;                     4 = in GByte
;                  $bThousands = R點kgabe mit Tausendertrennzeichen (True/False)
; Requirement(s):  #include <String.au3>
; Author(s):       Oscar (www.autoit.de)
;===============================================================================
Func _ByteAutoSize($iSize, $iRound = 2, $iFormat = 0, $bThousands = True)
        Local $aSize[4] = [' Byte', ' KByte', ' MByte', ' GByte'], $sReturn
        If $iFormat < 0 Or $iFormat > 4 Then $iFormat = 0
        If $iRound < 0 Or $iRound > 8 Then $iRound = 2
        If Not IsBool($bThousands) Then $bThousands = False
        $iSize = Abs($iSize)
        If $iFormat = 0 Then
                For $i = 30 To 0 Step -10
                        If $iSize > (2 ^ $i) Then
                                $iFormat = $i / 10 + 1
                                ExitLoop
                        EndIf
                Next
        EndIf
        If $iFormat = 0 Then $iFormat = 1
        $sReturn = StringFormat('%.' & $iRound & 'f', Round($iSize / (2 ^ (($iFormat - 1) * 10)), $iRound))
        If $bThousands Then $sReturn = _StringAddThousandsSep($sReturn, '.', ',')
        Return $sReturn & $aSize[$iFormat - 1]
EndFunc   ;==>_ByteAutoSize

; #FUNCTION# ====================================================================================================================
; Name...........: _StringAddThousandsSep
; Description ...: Returns the original numbered string with the Thousands delimiter inserted.
; Syntax.........: _StringAddThousandsSep($sString[, $sThousands = -1[, $sDecimal = -1]])
; Parameters ....: $sString    - The string to be converted.
;                  $sThousands - Optional: The Thousands delimiter
;                  $sDecimal   - Optional: The decimal delimiter
; Return values .: Success - The string with Thousands delimiter added.
; Author ........: SmOke_N (orignal _StringAddComma
; Modified.......: Valik (complete re-write, new function name)
; ===============================================================================================================================
Func _StringAddThousandsSep($sString, $sThousands = -1, $sDecimal = -1)
        Local $sResult = "" ; Force string
        Local $rKey = "HKCU\Control Panel\International"
        If $sDecimal = -1 Then $sDecimal = RegRead($rKey, "sDecimal")
        If $sThousands = -1 Then $sThousands = RegRead($rKey, "sThousand")
        Local $aNumber = StringRegExp($sString, "(\D?\d+)\D?(\d*)", 1) ; This one works for negatives.
        If UBound($aNumber) = 2 Then
                Local $sLeft = $aNumber[0]
                While StringLen($sLeft)
                        $sResult = $sThousands & StringRight($sLeft, 3) & $sResult
                        $sLeft = StringTrimRight($sLeft, 3)
                WEnd
                $sResult = StringTrimLeft($sResult, StringLen($sThousands)) ; Strip leading thousands separator
                If $aNumber[1] <> "" Then $sResult &= $sDecimal & $aNumber[1]
        EndIf
        Return $sResult
EndFunc   ;==>_StringAddThousandsSep

; ----------------------------------------------------------------------------
; AutoIt Version: 3.1.1 beta
; Author:         Unknown & Thorsten Meger <Thorsten.Meger@gmx.de>
;
; Script Function: Decode REG_BINARY
; ----------------------------------------------------------------------------
Func _DecodeProductKey($BinaryDPID)
        If IsBinary($BinaryDPID) Then $BinaryDPID = StringMid($BinaryDPID, 3) ; Changed because Beta 3.2.13.2
        Local $bKey[15]
        Local $sKey[29]
        Local $Digits[24]
        Local $Value = 0
        Local $hi = 0
        Local $n = 0
        Local $i = 0
        Local $dlen = 29
        Local $slen = 15
        Local $Result
        $Digits = StringSplit('BCDFGHJKMPQRTVWXY2346789', '')
        $BinaryDPID = StringMid($BinaryDPID, 105, 30)
        For $i = 1 To 29 Step 2
                $bKey[Int($i / 2)] = Dec(StringMid($BinaryDPID, $i, 2))
        Next
        For $i = $dlen - 1 To 0 Step -1
                If Mod(($i + 1), 6) = 0 Then
                        $sKey[$i] = '-'
                Else
                        $hi = 0
                        For $n = $slen - 1 To 0 Step -1
                                $Value = BitOR(BitShift($hi, -8), $bKey[$n])
                                $bKey[$n] = Int($Value / 24)
                                $hi = Mod($Value, 24)
                        Next
                        $sKey[$i] = $Digits[$hi + 1]
                EndIf
        Next
        For $i = 0 To 28
                $Result = $Result & $sKey[$i]
        Next
        Return $Result
EndFunc   ;==>_DecodeProductKey