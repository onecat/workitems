#NoTrayIcon
#region
#AutoIt3Wrapper_icon=..\..\..\WINDOWS\system32\fsquirt.exe
#AutoIt3Wrapper_outfile=自动获取内外网IP地址.exe
#AutoIt3Wrapper_Res_Description=安联锐视
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=安联锐视
#AutoIt3Wrapper_Res_Field=CompanyName|安联锐视
#endregion
#region ### START Koda GUI section ### Form=
#include <GUIConstantsEx.au3>
#include <Inet.au3>
$IP1 = _GetIP()
$SIP = @IPAddress1
If $SIP = "0.0.0.0" Then $SIP = @IPAddress2
$MAC = _GETMAC($SIP)
$IP = GUICreate("自动获取内外网IP地址", 336, 218, 281, 341)
$A = GUICtrlCreateLabel("MAC   地址：", 40, 120, 72, 17)
$C = GUICtrlCreateLabel("外网IP地址：", 40, 40, 74, 17)
$B = GUICtrlCreateLabel("内网IP地址：", 40, 80, 74, 17)
$HGL = GUICtrlCreateLabel("安联锐视小工具", 115, 12, 124, 17)
$INPUT1 = GUICtrlCreateInput($IP1, 136, 40, 153, 21)
$INPUT2 = GUICtrlCreateInput($SIP, 136, 80, 153, 21)
$INPUT3 = GUICtrlCreateInput($MAC, 136, 120, 153, 21)
$Label1 = GUICtrlCreateLabel("",  136, 160, 156, 33)
$Label2 = GUICtrlCreateLabel("IP地址的地理位置：", 8, 168, 110, 17)
GUICtrlSetData ($Label1,_qq_query(GUICtrlRead ($INPUT1)))
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###
Func _GETMAC($SIP)
	Local $MAC, $MACSIZE
	Local $I, $S, $R, $IIP
	$MAC = DllStructCreate("byte[6]")
	$MACSIZE = DllStructCreate("int")
	DllStructSetData($MACSIZE, 1, 6)
	$R = DllCall("Ws2_32.dll", "int", "inet_addr", "str", $SIP)
	$IIP = $R[0]
	$R = DllCall("iphlpapi.dll", "int", "SendARP", "int", $IIP, "int", 0, "ptr", DllStructGetPtr($MAC), "ptr", DllStructGetPtr($MACSIZE))
	$S = ""
	For $I = 0 To 5
		If $I Then $S = $S & "-"
		$S = $S & Hex(DllStructGetData($MAC, 1, $I + 1), 2)
	Next
	Return $S
EndFunc   ;==>_GETMAC


While 1
	$NMSG = GUIGetMsg()
	Switch $NMSG
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd

Func _qq()
        Local $source = _INetGetSource("http://ip.qq.com")
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