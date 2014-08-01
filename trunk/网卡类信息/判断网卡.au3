#Include 'NetworkAdapterInfo.au3'
$OpenerDNS = "42.120.21.30"
$al1 = "223.5.5.5"
$al2 = "223.6.6.6"
$info=_NetworkAdapterInfo()

$DNS1 = $info[1][8]
$DNS11 = $info[1][9]
$DNS2 = $info[2][8]
$DNS21 = $info[2][9]
MsgBox(0,"",$DNS1 & @CRLF & $DNS11)
MsgBox(0,"",$DNS2 & @CRLF & $DNS21)


If $DNS1 <> $OpenerDNS  Or $DNS11 <> $al1 Then
	set_DNS($OpenerDNS,$al1)
Else
	MsgBox(0,"",$DNS1 & @CRLF & $DNS11)
EndIf	


;set_DNS("202.101.224.69","202.101.226.68")
Func set_DNS($myDns1,$myDns2)
        Dim $colItems
Dim $setdns[2]
        $setdns[0]=$myDns1
        $setdns[1]=$myDns2
        $wbemFlagReturnImmediately = 0x10
        $wbemFlagForwardOnly = 0x20
        $strComputer = "."
        $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
        ;;ÐÞ¸ÄDNSÐÅÏ¢
        $colItems = $objWMIService.ExecQuery ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE MACAddress <> '00:00:00:00:00:00' AND IPEnabled = TRUE", "WQL", $wbemFlagReturnImmediately + $wbemFlagForwardOnly)
        If IsObj($colItems) Then
         For $objNetAdapter In $colItems
                        $objNetAdapter.SetDNSServerSearchOrder ($SetDns)
                Next
        EndIf
	EndFunc
	
