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
#Region Initialization
 
#NoTrayIcon
 
#Include <ComboConstants.au3>
#Include <GUIComboBox.au3>
#Include <GUIConstantsEx.au3>
#Include <StaticConstants.au3>
#Include <WindowsConstants.au3>
 
Opt('MustDeclareVars', 1)
 
Global Const $MIB_IF_TYPE_OTHER = 1
Global Const $MIB_IF_TYPE_ETHERNET_CSMACD = 6
Global Const $MIB_IF_TYPE_ISO88025_TOKENRING = 9
Global Const $MIB_IF_TYPE_PPP = 23
Global Const $MIB_IF_TYPE_SOFTWARE_LOOPBACK = 24
Global Const $MIB_IF_TYPE_ATM = 37
Global Const $MIB_IF_TYPE_IEEE80211 = 71
Global Const $MIB_IF_TYPE_TUNNEL = 131
Global Const $MIB_IF_TYPE_IEEE1394 = 144
 
Global Const $MIB_IF_ADMIN_STATUS_UP = 1
Global Const $MIB_IF_ADMIN_STATUS_DOWN = 2
Global Const $MIB_IF_ADMIN_STATUS_TESTING = 3
 
Global Const $MIB_IF_OPER_STATUS_NON_OPERATIONAL = 0
Global Const $MIB_IF_OPER_STATUS_UNREACHABLE = 1
Global Const $MIB_IF_OPER_STATUS_DISCONNECTED = 2
Global Const $MIB_IF_OPER_STATUS_CONNECTING = 3
Global Const $MIB_IF_OPER_STATUS_CONNECTED = 4
Global Const $MIB_IF_OPER_STATUS_OPERATIONAL = 5
 
Global Const $tagMIB_IFROW = 'wchar Name[256];dword Index;dword Type;dword Mtu;dword Speed;dword PhysAddrLen;byte PhysAddr[8];dword AdminStatus;dword OperStatus;dword LastChange;dword InOctets;dword InUcastPkts;dword InNUcastPkts;dword InDiscards;dword InErrors;dword InUnknownProtos;dword OutOctets;dword OutUcastPkts;dword OutNUcastPkts;dword OutDiscards;dword OutErrors;dword OutQLen;dword DescrLen;char Descr[256]'
 
Global $hParent, $hForm, $Dll, $Msg, $Combo, $Label1, $Label2, $Timer, $Data, $Index = 0, $pIndex = 0, $Adapter[1][3] = [[0]]
 
$Dll = DllOpen('IPHlpApi.dll')
 
$Data = _WinAPI_GetIfTable($MIB_IF_TYPE_ETHERNET_CSMACD, $Dll)
If Not @error Then
    For $i = 1 To $Data[0][0]
        $Adapter[0][0] += 1
        ReDim $Adapter[$Adapter[0][0] + 1][3]
        $Adapter[$Adapter[0][0]][0] = $Data[$i][1 ] ; 接口索引
        $Adapter[$Adapter[0][0]][1] = $Data[$i][5 ] ; 适配器的物理地址(MAC)
        $Adapter[$Adapter[0][0]][2] = $Data[$i][19] ; 描述
    Next
EndIf
 
#EndRegion Initialization
 
#Region Main State
 
$hParent = GUICreate('', -1, -1, -1, -1, -1, $WS_EX_TOOLWINDOW)
$hForm = GUICreate('?', 400, 155, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), $WS_EX_TOPMOST, $hParent)
;GUISetFont(8.5, 400, 0, 'MS Shell Dlg', $hForm)
GUISetIcon('setupapi.dll', 5)
GUICtrlCreateLabel('适配器:', 14, 20, 44, 14)
$Combo = GUICtrlCreateCombo('', 60, 16, 326, 21, $CBS_DROPDOWNLIST)
If $Adapter[0][0] Then
    For $i = 1 To $Adapter[0][0]
        _GUICtrlComboBox_AddString($Combo, $Adapter[$i][2])
    Next
    WinSetTitle($hForm, '', $Adapter[1][1])
    $Index = 1
Else
    _GUICtrlComboBox_AddString($Combo, '没有找到')
    GUICtrlSetState(-1, $GUI_DISABLE)
EndIf
_GUICtrlComboBox_SetCurSel($Combo, 0)
GUiCtrlCreateGroup('流量 (Bytes)', 14, 50, 372, 91)
GUICtrlCreateLabel('发送:', 30, 80, 52, 14)
$Label1 = GUICtrlCreateLabel('', 86, 80, 106, 14, $SS_RIGHT)
GUICtrlCreateLabel('', 204, 80, 70, 14, $SS_RIGHT)
GUICtrlCreateLabel('接收:', 30, 104, 52, 14)
$Label2 = GUICtrlCreateLabel('', 86, 104, 106, 14, $SS_RIGHT)
GUICtrlCreateLabel('', 204, 104, 70, 14, $SS_RIGHT)
GUISetState()
 
While 1
    If ($Index) And (($Index <> $pIndex) Or (TimerDiff($Timer) > 1000)) Then
        $Data = _WinAPI_GetIfEntry($Adapter[$Index][0], $Dll)
        If Not @error Then
            GUICtrlSetData($Label1, _Str($Data[14]) & ' bytes')
            GUICtrlSetData($Label2, _Str($Data[8 ]) & ' bytes')
            GUICtrlSetData($Label1 + 1, StringFormat('%.2f', $Data[14] / 1024 / 1024) & ' MB')
            GUICtrlSetData($Label2 + 1, StringFormat('%.2f', $Data[8 ] / 1024 / 1024) & ' MB')
        Else
            GUICtrlSetData($Label1, '')
            GUICtrlSetData($Label2, '')
        EndIf
        $Timer = TimerInit()
        $pIndex = $Index
    EndIf
    $Msg = GUIGetMsg()
    Switch $Msg
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $Combo
            $Index = _GUICtrlComboBox_GetCurSel($Combo) + 1
            WinSetTitle($hForm, '', $Adapter[$Index][1])
    EndSwitch
WEnd
 
DllClose($Dll)
 
#EndRegion Main State
 
#Region Additional Functions
 
Func _Str($iValue)
 
    Local $Result = '', $Str = String($iValue)
 
    While StringLen($Str)
        $Result = '.' & StringRight($Str, 3) & $Result
        $Str = StringTrimRight($Str, 3)
    WEnd
    Return StringTrimLeft($Result, 1)
EndFunc   ;==>_Str
 
Func _WinAPI_GetIfEntry($iIndex, $Dll = -1)
 
    Local $Ret, $Data, $Addr, $Count
    Local $tMIB_IFROW
 
    If $Dll < 0 Then
        $Dll = 'IPHlpApi.dll'
    EndIf
 
    $tMIB_IFROW = DllStructCreate($tagMIB_IFROW)
    DllStructSetData($tMIB_IFROW, 2, $iIndex)
    $Ret = DLLCall($Dll, 'dword', 'GetIfEntry', 'ptr', DllStructGetPtr($tMIB_IFROW))
    If (@error) Or ($Ret[0]) Then
        Return SetError($Ret[0], 0, 0)
    EndIf
    Dim $Data[20]
    $Data[0 ] = DllStructGetData($tMIB_IFROW, 'Name')
    $Data[1 ] = $iIndex
    $Data[2 ] = DllStructGetData($tMIB_IFROW, 'Type')
    $Data[3 ] = DllStructGetData($tMIB_IFROW, 'Mtu')
    $Data[4 ] = DllStructGetData($tMIB_IFROW, 'Speed')
    $Count = DllStructGetData($tMIB_IFROW, 'PhysAddrLen')
    $Addr = ''
    For $i = 1 To $Count
        $Addr &= Hex(DllStructGetData($tMIB_IFROW, 'PhysAddr', $i), 2) & '-'
    Next
    $Data[5 ] = StringTrimRight($Addr, 1)
    $Data[6 ] = DllStructGetData($tMIB_IFROW, 'AdminStatus')
    $Data[7 ] = DllStructGetData($tMIB_IFROW, 'OperStatus')
    $Data[8 ] = DllStructGetData($tMIB_IFROW, 'InOctets')
    $Data[9 ] = DllStructGetData($tMIB_IFROW, 'InUcastPkts')
    $Data[10] = DllStructGetData($tMIB_IFROW, 'InNUcastPkts')
    $Data[11] = DllStructGetData($tMIB_IFROW, 'InDiscards')
    $Data[12] = DllStructGetData($tMIB_IFROW, 'InErrors')
    $Data[13] = DllStructGetData($tMIB_IFROW, 'InUnknownProtos')
    $Data[14] = DllStructGetData($tMIB_IFROW, 'OutOctets')
    $Data[15] = DllStructGetData($tMIB_IFROW, 'OutUcastPkts')
    $Data[16] = DllStructGetData($tMIB_IFROW, 'OutNUcastPkts')
    $Data[17] = DllStructGetData($tMIB_IFROW, 'OutDiscards')
    $Data[18] = DllStructGetData($tMIB_IFROW, 'OutErrors')
    $Data[19] = StringLeft(DllStructGetData($tMIB_IFROW, 'Descr'), DllStructGetData($tMIB_IFROW, 'DescrLen') - 1)
    Return $Data
EndFunc   ;==>_WinAPI_GetIfEntry
 
Func _WinAPI_GetIfTable($iType = 0, $Dll = -1)
 
    Local $Ret, $Row, $Type, $Tag, $Tab, $Addr, $Count, $Lenght
    Local $tMIB_IFTABLE, $tMIB_IFROW
 
    If $Dll < 0 Then
        $Dll = 'IPHlpApi.dll'
    EndIf
 
    $tMIB_IFROW = DllStructCreate($tagMIB_IFROW)
    $Row = 'byte[' & DllStructGetSize($tMIB_IFROW) & ']'
    $Tag = 'dword;'
    For $i = 1 To 32
        $Tag &= $Row & ';'
    Next
    $tMIB_IFTABLE = DllStructCreate($Tag)
    $Ret = DLLCall($Dll, 'dword', 'GetIfTable', 'ptr', DllStructGetPtr($tMIB_IFTABLE), 'long*', DllStructGetSize($tMIB_IFTABLE), 'int', 1)
    If (@error) Or ($Ret[0]) Then
        Return SetError($Ret[0], 0, 0)
    EndIf
    $Count = DllStructGetData($tMIB_IFTABLE, 1)
    Dim $Tab[$Count + 1][20]
    $Tab[0][0] = 0
    For $i = 1 To $Count
        $tMIB_IFROW = DllStructCreate($tagMIB_IFROW, DllStructGetPtr($tMIB_IFTABLE, $i + 1))
        $Type = DllStructGetData($tMIB_IFROW, 'Type')
        If ($iType = 0) Or ($iType = $Type) Then
            $Tab[0][0] += 1
            $Tab[$Tab[0][0]][0 ] = DllStructGetData($tMIB_IFROW, 'Name')
            $Tab[$Tab[0][0]][1 ] = DllStructGetData($tMIB_IFROW, 'Index')
            $Tab[$Tab[0][0]][2 ] = $Type
            $Tab[$Tab[0][0]][3 ] = DllStructGetData($tMIB_IFROW, 'Mtu')
            $Tab[$Tab[0][0]][4 ] = DllStructGetData($tMIB_IFROW, 'Speed')
            $Lenght = DllStructGetData($tMIB_IFROW, 'PhysAddrLen')
            $Addr = ''
            For $j = 1 To $Lenght
                $Addr &= Hex(DllStructGetData($tMIB_IFROW, 'PhysAddr', $j), 2) & '-'
            Next
            $Tab[$Tab[0][0]][5 ] = StringTrimRight($Addr, 1)
            $Tab[$Tab[0][0]][6 ] = DllStructGetData($tMIB_IFROW, 'AdminStatus')
            $Tab[$Tab[0][0]][7 ] = DllStructGetData($tMIB_IFROW, 'OperStatus')
            $Tab[$Tab[0][0]][8 ] = DllStructGetData($tMIB_IFROW, 'InOctets')
            $Tab[$Tab[0][0]][9 ] = DllStructGetData($tMIB_IFROW, 'InUcastPkts')
            $Tab[$Tab[0][0]][10] = DllStructGetData($tMIB_IFROW, 'InNUcastPkts')
            $Tab[$Tab[0][0]][11] = DllStructGetData($tMIB_IFROW, 'InDiscards')
            $Tab[$Tab[0][0]][12] = DllStructGetData($tMIB_IFROW, 'InErrors')
            $Tab[$Tab[0][0]][13] = DllStructGetData($tMIB_IFROW, 'InUnknownProtos')
            $Tab[$Tab[0][0]][14] = DllStructGetData($tMIB_IFROW, 'OutOctets')
            $Tab[$Tab[0][0]][15] = DllStructGetData($tMIB_IFROW, 'OutUcastPkts')
            $Tab[$Tab[0][0]][16] = DllStructGetData($tMIB_IFROW, 'OutNUcastPkts')
            $Tab[$Tab[0][0]][17] = DllStructGetData($tMIB_IFROW, 'OutDiscards')
            $Tab[$Tab[0][0]][18] = DllStructGetData($tMIB_IFROW, 'OutErrors')
            $Tab[$Tab[0][0]][19] = StringLeft(DllStructGetData($tMIB_IFROW, 'Descr'), DllStructGetData($tMIB_IFROW, 'DescrLen') - 1)
        EndIf
    Next
    If $Tab[0][0] < $Count Then
        ReDim $Tab[$Tab[0][0] + 1][20]
    EndIf
    Return $Tab
EndFunc   ;==>_WinAPI_GetIfTable
 
#EndRegion Windows Message Functions