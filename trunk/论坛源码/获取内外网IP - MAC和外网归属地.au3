#include <GuiComboBoxEx.au3>
#include <INet.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#Include <Array.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=

$ip = _GetIP ( )
;~ $ip1 = @IPAddress1
;~ $ip2 = @IPAddress2
;~ $mac1 = _API_Get_NetworkAdapterMAC (@IPAddress1)
;~ $mac2 = _API_Get_NetworkAdapterMAC (@IPAddress2)               
$CPname = @ComputerName
$UserName = @UserName
Global  $NetworkAdapterInfo = _NetworkAdapterInfo()

$Form1_1 = GUICreate("获取内外网IP - MAC和外网归属地", 330, 320, 312, 133)
$Group1 = GUICtrlCreateGroup("", 8, 3, 313, 309)
$Label1 = GUICtrlCreateLabel("公网IP地址：", 24, 100, 74, 17)
$Label2 = GUICtrlCreateLabel("本机网卡 IP地址：", 96, 200, 128, 17)
$Label3 = GUICtrlCreateLabel("本机网卡 MAC：", 96, 256, 90, 17)
$Input1 = GUICtrlCreateInput($ip, 112, 96, 121, 21)
$Input2 = GUICtrlCreateInput("", 88, 224, 129, 21)
$Input3 = GUICtrlCreateInput("", 88, 280, 129, 21)
$Label6 = GUICtrlCreateLabel("主机名称：", 25, 37, 68, 17)
$Input6 = GUICtrlCreateInput($CPname, 112, 32, 121, 21)
$Label7 = GUICtrlCreateLabel("当前登录用户：", 24, 68, 88, 17)
$Input7 = GUICtrlCreateInput($UserName, 112, 64, 121, 21)
$Combo1 = GUICtrlCreateCombo("", 16, 168, 289, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$Label4 = GUICtrlCreateLabel("网卡", 24, 144, 28, 17)
$Label5 = GUICtrlCreateLabel("", 112, 128, 172, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###




For $i=1 To $NetworkAdapterInfo[0][0]
        GUICtrlSetData($Combo1,$NetworkAdapterInfo[$i][2],$NetworkAdapterInfo[$i][2])
If $NetworkAdapterInfo[$i][0] = 0 Then
        GUICtrlSetData($Combo1,"没有找到可用的网卡信息^_^")
Else
        GUICtrlSetData($Input2,$NetworkAdapterInfo[$i][5])
		$MAC = _API_Get_NetworkAdapterMAC (GUICtrlRead($Input2))
		GUICtrlSetData($Input3,$MAC)
EndIf
Next

$ZXIP = _qq_query($ip)
GUICtrlSetData ($Label5,$ZXIP)



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Combo1
          $ipset = GUICtrlRead($Combo1)
                        For $i=1 To $NetworkAdapterInfo[0][0]
                                If $NetworkAdapterInfo[$i][2] = $ipset Then
									GUICtrlSetData($Input2,$NetworkAdapterInfo[$i][5])
									$MAC = _API_Get_NetworkAdapterMAC (GUICtrlRead($Input2))
									GUICtrlSetData($Input3,$MAC)		
                                EndIf
                        Next
	EndSwitch
WEnd

Func _NetworkAdapterInfo()
    Local $colItem
    Local $objItem
    Local $colItems 
    Local $objItems
    Local $objWMIService 
    Local $Adapters[1][12]
    $Adapters[0][0] = 0
    $objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
    $colItem  = $objWMIService.ExecQuery("Select * FROM Win32_NetworkAdapter Where NetConnectionStatus >0", "WQL", 0x30)
    If IsObj($colItem) Then
        For $objItem In $colItem
            If $objItem.MACAddress = "00:00:00:00:00:00" Then ContinueLoop
            $Adapters[0][0] += 1
            ReDim $Adapters[UBound($Adapters) + 1][12]
            $Adapters[$Adapters[0][0]][0] += $Adapters[0][0]
            $Adapters[$Adapters[0][0]][1] = $objItem.NetConnectionStatus
            $Adapters[$Adapters[0][0]][2] = $objItem.Description
            $Adapters[$Adapters[0][0]][3] = $objItem.NetConnectionID
            $Adapters[$Adapters[0][0]][4] = $objItem.MACAddress 
                        $Adapters[$Adapters[0][0]][11] = $objItem.PNPDeviceID 
            $colItems  = $objWMIService.ExecQuery('Select * FROM Win32_NetworkAdapterConfiguration Where MACAddress = "'&$Adapters[$Adapters[0][0]][4]&'" And IPEnabled = True ' , "WQL", 0x30)                     
            If IsObj($colItems) Then
                For $objItems In $colItems
                    $Adapters[$Adapters[0][0]][5] = $objItems.IPAddress(0)
                    $Adapters[$Adapters[0][0]][6] = $objItems.DefaultIPGateway(0)
                    $Adapters[$Adapters[0][0]][7] = $objItems.IPSubnet(0)
                    $Adapters[$Adapters[0][0]][8] = $objItems.DNSServerSearchOrder(0)
                    $Adapters[$Adapters[0][0]][9] = $objItems.DNSServerSearchOrder(1)
                    $Adapters[$Adapters[0][0]][10] = $objItems.SettingID
                Next    
            EndIf
        Next
    EndIf
Return $Adapters
EndFunc

Func _API_Get_NetworkAdapterMAC($sIP)
	Local $MAC, $MACSize
	Local $i, $s, $r, $iIP

	$MAC = DllStructCreate("byte[6]")
	$MACSize = DllStructCreate("int")

	DllStructSetData($MACSize, 1, 6)
	$r = DllCall("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
	$iIP = $r[0]
	$r = DllCall("iphlpapi.dll", "int", "SendARP", "int", $iIP, "int", 0, "ptr", DllStructGetPtr($MAC), "ptr", DllStructGetPtr($MACSize))
	$s = ""
	For $i = 0 To 5
		If $i Then $s = $s & ":"
		$s = $s & Hex(DllStructGetData($MAC, 1, $i + 1), 2)
	Next
	Return $s
EndFunc 


Func _qq_query($sHostName = "")
        Local $source = _INetGetSource('http://ip.qq.com/cgi-bin/searchip?searchip1=' & $sHostName)
        Local $sIP,$sLocation,$aIP,$aLocation
        $aIP = StringRegExp($source,'您当前的IP为.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "未获取IP"
        EndIf
        $aLocation = StringRegExp($source,'该IP所在地为.*?([^<>]+)</span>',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
                $sLocation = StringRegExpReplace($sLocation,'&nbsp;','')
        Else
                $sLocation = "未获取物理位置"
        EndIf
        Return $sIP & @CRLF & $sLocation
	EndFunc
	
;~ Dim $Description[5], $ServiceName[5], $cards, $myipaddress, $mygeteway, $mysubnetmask
;~ For $i = 1 To 4
;~ $var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards", $i)
;~ If @error <> 0 Then
;~    ExitLoop
;~ Else
;~    $Description[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "Description")
;~    $ServiceName[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "ServiceName")
;~    If StringLen($Description[$i]) > 0 Then
;~     $cards = $cards & $Description[$i] & "|"
;~    EndIf
;~ EndIf
;~ Next

;~ GUICtrlSetData($Combo1, $cards, $Description[1])