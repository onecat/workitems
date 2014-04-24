#include <Memory.au3>
#include <Array.au3>
#include <WinAPI.au3>

Opt('MustDeclareVars', 1)
HotKeySet("{ESC}", "_Exit")
Global Const $DONT_FRAGMENT = 2, $IP_SUCCESS = 0, $IP_DEST_NET_UNREACHABLE = 11002, $IP_DEST_HOST_UNREACHABLE = 11003, $IP_DEST_PROT_UNREACHABLE = 11004, $IP_DEST_PORT_UNREACHABLE = 11005, _
    $IP_NO_RESOURCES = 11006, $IP_HW_ERROR = 11008, $IP_PACKET_TOO_BIG = 11009, $IP_REQ_TIMED_OUT = 11010, $IP_BAD_REQ = 11011, $IP_BAD_ROUTE = 11012, _
    $IP_TTL_EXPIRED_TRANSIT = 11013, $IP_TTL_EXPIRED_REASSEM = 11014, $IP_PARAM_PROBLEM = 11015, $IP_SOURCE_QUENCH = 11016, $IP_BAD_DESTINATION =11018, _
    $IP_GENERAL_FAILURE = 11050, $NO_STATUS = 10000     ;We will use 10000 as the no status indicator since 0 meens successful reply

Local $hPointers = DllStructCreate("ptr IcmpCloseHandle;ptr IcmpSendEcho;ptr IcmpCreateFile;ptr ExitThread")

Global $hkernel32Dll = DllOpen("kernel32.dll")
Global $hKrn = _WinAPI_GetModuleHandle("kernel32.dll")
DllStructSetData($hPointers,"ExitThread",GetProcAddress($hKrn, "ExitThread"))
Global $hICMPDll = LibLoad("ICMP.dll");Iphlpapi.dll")
DllStructSetData($hPointers,"IcmpCloseHandle",GetProcAddress($hICMPDll, "IcmpCloseHandle"))
DllStructSetData($hPointers,"IcmpSendEcho",GetProcAddress($hICMPDll, "IcmpSendEcho"))
DllStructSetData($hPointers,"IcmpCreateFile",GetProcAddress($hICMPDll, "IcmpCreateFile"))

TCPStartup() ;This is required, not only to do DNS lookup, but also for WSAStartup()

Global $pings[1]  = [0]  ;This array will hold all echo reply data in a struct.
Local $pingdata = "x"
Local $timeout = 150
Local $ttl = 255
For $i=1 To 254
	pingThreaded("192.168.0." & $i, $timeout, $pingdata, $ttl, $DONT_FRAGMENT)
Next

While $pings[0] > 0
    _managePings()	
WEnd
_Exit()
;Function pingThreaded
;$ip_addr will accept valid DNS Name or Normal IP address.
;Timouts only really work when an IP isn't responding. Thats important to remember because if you think you can timeout an IP which has latent responces, you can't!
Func pingThreaded($ip_addr, $timeout=5000, $data="x", $ttl=255, $flags=0)
    Local $hexIP = encodeIP($ip_addr)
    If $hexIP == 0 Then Return 0
    Local $pingID = _addPing($ip_addr)
    If IsNumber($ttl) = 0 Or Number($ttl) > 255 Then $ttl = 255
    If IsNumber($timeout) = 0 Or Number($timeout) > 5000 Then $timeout = 5000
    If StringLen($data) > 256 Then $data = StringTrimRight($data,StringLen($data) - 256)
    If IsNumber($flags) = 0 Or Number($flags) > 2 Then $flags = 2
    DllStructSetData($pings[$pingID],"datasize",StringLen($data))   ;We may wish to report the data size later
    ;Props to trancexx
    Local $CodeBuffer = DllStructCreate("byte[696]"); Code=154, Data=256, Echo reply Struct + ICMP_OPTIONS Struct = 286
    Local $RemoteCode = _MemVirtualAlloc(0, DllStructGetSize($CodeBuffer), $MEM_COMMIT, $PAGE_EXECUTE_READWRITE)
    DllStructSetData($CodeBuffer, 1, _
        "0x" & _                                                            ;Original Assembly started at 401000
        "E889000000" & _                                                ;Call 0040108E  <IcmpCreateFile>
        "A3" & SwapEndian($RemoteCode + 410) & _                            ;mov dword ptr [00403010], eax  <hIcmp = IcmpCreateFile Handle>
        "C605" & SwapEndian($RemoteCode + 418) & Hex($ttl,2) & _            ;mov byte ptr [00403024], xx    <TTL>
        "C605" & SwapEndian($RemoteCode + 419) & "00" & _                                   ;mov byte ptr [00403025], 00    <TOS>
        "C605" & SwapEndian($RemoteCode + 420) & Hex($flags,2) & _          ;mov byte ptr [00403026], 02    <Flags, 0x02=DF Bit Set>
        "C605" & SwapEndian($RemoteCode + 421) & "00" & _                   ;mov byte ptr [00403027], 00
        "C705" & SwapEndian($RemoteCode + 422) & "00000000" & _         ;mov dword ptr [00403028], 00000000
        "68" & SwapEndian(Dec(Hex($timeout,4))) & _                                 ;push 0000xxxx  <Timeout>
        "681E010000" & _                                                ;push 0000011E  <Size of Echo reply Struct + ICMP_OPTIONS Struct>
        "68" & SwapEndian($RemoteCode + 426) & _                            ;push 0040302C  <icmpReply>
        "68" & SwapEndian($RemoteCode + 418) & _                            ;push 00403024  <icmpOptions>
        "6A" & Hex(StringLen($data),2) & _                                  ;push 000000xx  <Data Size>
        "68" & SwapEndian($RemoteCode + 154) & _                            ;push 00403000  <Data>
        "68" & SwapEndian(Dec($hexIP)) & _                              ;push <Hex(IP ADDRESS)>
        "FF35" & SwapEndian($RemoteCode + 410) & _                      ;push dword ptr [00403010]  <hIcmp>
        "E839000000" & _                                                ;Call 00401094  <IcmpSendEcho>
        "A1" & SwapEndian($RemoteCode + 434) & _                            ;mov eax, dword ptr [00403034]  <Get the ms responce time from icmpReply.RoundTripTime>
        "A3" & SwapEndian(DllStructGetPtr($pings[$pingID],"reply")) & _         ;mov dword ptr [0040301C], eax  <Store the ms responce time>
        "A1" & SwapEndian($RemoteCode + 430) & _                            ;mov eax, dword ptr [00403030]  <Get the status from icmpReply.Status>
        "A3" & SwapEndian(DllStructGetPtr($pings[$pingID],"status")) & _        ;mov dword ptr [00403020], eax  <Store the status>
        "FF35" & SwapEndian($RemoteCode + 410) & _                      ;push dword ptr [00403010]  <hIcmp>
        "E80E000000" & _                                                ;Call 00401088  <IcmpCloseHandle>
        "6A00" & _                                                      ;push 00000000
        "E801000000" & _                                                ;Call 00401082  <ExitThread>
        "CC" & _                                                            ;int 03
        "FF25" & SwapEndian(DllStructGetPtr($hPointers,"ExitThread")) & _       ;JMP dword ptr  <kernel32.ExitThread>
        "FF25" & SwapEndian(DllStructGetPtr($hPointers,"IcmpCloseHandle")) & _  ;JMP dword ptr  <ICMP.IcmpCloseHandle>
        "FF25" & SwapEndian(DllStructGetPtr($hPointers,"IcmpCreateFile")) & _   ;JMP dword ptr  <ICMP.IcmpCreateFile>
        "FF25" & SwapEndian(DllStructGetPtr($hPointers,"IcmpSendEcho"))& _  ;JMP dword ptr  <ICMP.IcmpSendEcho>
        SwapEndian(StringToBinary($data)) _                             ;This is our ping Data, Max 256 bytes of space here.
    )
    _MemMoveMemory(DllStructGetPtr($CodeBuffer), $RemoteCode, DllStructGetSize($CodeBuffer))
    Local $aCall = DllCall($hkernel32Dll, "ptr", "CreateThread", "ptr", 0, "int", 0, "ptr", $RemoteCode, "ptr", 0, "int", 0, "dword*", 0)
    Return $aCall[0]
EndFunc


;Function _addPing is just for array management of the $pings[] array.
Func _addPing($ip_addr)
    $pings[0] = UBound($pings)
    ReDim $pings[$pings[0]+1]
    $pings[$pings[0]] = DllStructCreate("char ip[" & StringLen($ip_addr) & "];ulong reply;ulong status;int datasize");You could add a timeout struct here
    DllStructSetData($pings[$pings[0]],"ip",$ip_addr)
    DllStructSetData($pings[$pings[0]],"status",$NO_STATUS)
    Return $pings[0]
EndFunc

;Function _removePing is just for array management of the $pings[] array.
Func _removePing($pingID)
    If $pingID > $pings[0] Then Return ;Ensure our ID is valid
    $pings[$pingID] = 0 ;Free the DLLStruct
    _ArrayDelete($pings,$pingID)
    $pings[0] -= 1
EndFunc

;Function _managePings()
;This is where the reply's get sorted out, and actions taken
Func _managePings()
    Local $pingID, $status
    $pingID = 1
    While $pingID <= $pings[0]
        $status = DllStructGetData($pings[$pingID],"status")
        If $status <> $NO_STATUS Then
            Switch $status
                Case $IP_SUCCESS	
                    If DllStructGetData($pings[$pingID],"reply") = 0 Then
                        ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " replied in <1ms" & @CRLF)
                    Else
                        ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " replied in " & DllStructGetData($pings[$pingID],"reply") & "ms" & @CRLF)
                    EndIf
                Case $IP_REQ_TIMED_OUT	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " timed-out" & @CRLF)
                Case $IP_DEST_NET_UNREACHABLE	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The destination network was unreachable." & @CRLF)
                Case $IP_DEST_HOST_UNREACHABLE	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The destination host was unreachable." & @CRLF)
                Case $IP_DEST_PROT_UNREACHABLE	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The destination protocol was unreachable." & @CRLF)
                Case $IP_DEST_PORT_UNREACHABLE	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The destination port was unreachable." & @CRLF)
                Case $IP_NO_RESOURCES	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " Insufficient IP resources were available." & @CRLF)
                Case $IP_HW_ERROR	
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A hardware error occurred." & @CRLF)
                Case $IP_PACKET_TOO_BIG
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The packet was too big." & @CRLF)
                Case $IP_BAD_REQ
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A bad request." & @CRLF)
                Case $IP_BAD_ROUTE
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A bad route." & @CRLF)
                Case $IP_TTL_EXPIRED_TRANSIT
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The time to live (TTL) expired in transit." & @CRLF) 
                Case $IP_TTL_EXPIRED_REASSEM
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " The time to live expired during fragment reassembly." & @CRLF)
                Case $IP_PARAM_PROBLEM
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A parameter problem." & @CRLF)
                Case $IP_SOURCE_QUENCH
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " Datagrams are arriving too fast to be processed and datagrams may have been discarded." & @CRLF)
                Case $IP_BAD_DESTINATION
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A bad destination." & @CRLF)
                Case $IP_GENERAL_FAILURE
                    ConsoleWrite("Ping with " & DllStructGetData($pings[$pingID],"datasize") & " byte(s) to " & DllStructGetData($pings[$pingID],"ip") & " A general failure. This error can be returned for some malformed ICMP packets or lost network connection." & @CRLF)
            EndSwitch
            _removePing($pingID)
    EndIf
;   You may wish to include a feature which can timeout manually here. Just remember if you do that, do not destroy the dllstruct for the ping 
;   because likelly the ping thread will still write to it when it's done.  You will have to wait for that to happen before you destroy it.
        $pingID += 1
    WEnd
EndFunc
;~ 使用到的常量：
;~ Const ICMP_SUCCESS = 0         ‘成功
;~ Const ICMP_STATUS_BUFFER_TO_SMALL = 11001                 '缓存太小
;~ Const ICMP_STATUS_DESTINATION_NET_UNREACH = 11002          '目的地网络不能到达
;~ Const ICMP_STATUS_DESTINATION_HOST_UNREACH = 11003       '目的地主机不能到达
;~ Const ICMP_STATUS_DESTINATION_PROTOCOL_UNREACH = 11004      '目的地协议不能到达
;~ Const ICMP_STATUS_DESTINATION_PORT_UNREACH = 11005       '目的地端口不能到达
;~ Const ICMP_STATUS_NO_RESOURCE = 11006                     '没有资源
;~ Const ICMP_STATUS_BAD_OPTION = 11007                       '错误选项
;~ Const ICMP_STATUS_HARDWARE_ERROR = 11008                 '硬件错误
;~ Const ICMP_STATUS_LARGE_PACKET = 11009                    '信息包太大
;~ Const ICMP_STATUS_REQUEST_TIMED_OUT = 11010              '请求超时
;~ Const ICMP_STATUS_BAD_REQUEST = 11011                     '错误请求
;~ Const ICMP_STATUS_BAD_ROUTE = 11012                         '错误路由
;~ Const ICMP_STATUS_TTL_EXPIRED_TRANSIT = 11013           'TTL终止传输
;~ Const ICMP_STATUS_TTL_EXPIRED_REASSEMBLY = 11014          'TTL终止重新组装
;~ Const ICMP_STATUS_PARAMETER = 11015                         '参数有问题
;~ Const ICMP_STATUS_SOURCE_QUENCH = 11016                    '资源结束
;~ Const ICMP_STATUS_OPTION_TOO_BIG = 11017                  '选项太大
;~ Const ICMP_STATUS_BAD_DESTINATION = 11018                 '错误目的地
;~ Const ICMP_STATUS_NEGOTIATING_IPSEC = 11032                '谈判IPSEC
;~ Const ICMP_STATUS_GENERAL_FAILURE = 11050                  '常规失败

Func encodeIP($ip_addr)
    Local $ip_addr_temp = $ip_addr
    If Not _isIP($ip_addr) Then $ip_addr = TCPNameToIP($ip_addr)
        If Not _isIP($ip_addr) Then
        ConsoleWrite($ip_addr_temp & " is not a valid IP Address. If you supplied a hostname ensure DNS is available." & @CRLF)
        Return 0
    EndIf
    Return getHexIP($ip_addr)
EndFunc

Func getHexIP($ip_addr)
    Return Hex(_getIPOctet($ip_addr,4),2) & Hex(_getIPOctet($ip_addr,3),2) & Hex(_getIPOctet($ip_addr,2),2) & Hex(_getIPOctet($ip_addr,1),2)
EndFunc

Func LibLoad($lpLibFileName)
    Local $LibHandle = DllCall($hkernel32Dll, "int", "LoadLibraryA", "str", $lpLibFileName)
    Return $LibHandle[0]
EndFunc

Func LibFree($DllHandle)
    Local $LibFreed = DllCall($hkernel32Dll, "int", "FreeLibrary", "int", $DllHandle)
    return $LibFreed[0]
EndFunc

Func GetProcAddress( $hModule, $lpProcName)
    Local $ProcessAddy = DllCall($hkernel32Dll,"int","GetProcAddress","int",$hModule,"str",$lpProcName)
    Return $ProcessAddy[0]
EndFunc

Func SwapEndian($hex)
    ;trancexx
    Return Hex(Binary($hex))
EndFunc

Func _getIPOctet($ip_addr,$octet=1)
    Switch $octet
        Case 1
        Return Int(StringMid($ip_addr,1,StringInStr($ip_addr,".")))
    Case 4
        Return Int(StringMid($ip_addr,StringInStr($ip_addr,".",0,3)+1))
    Case Else
        Return Int(StringMid($ip_addr,StringInStr($ip_addr,".",0,$octet - 1)+1,StringInStr($ip_addr,".",0,$octet)+1))
    EndSwitch
EndFunc

Func _isIP($text)
    Return StringRegExp($text, "(((25[0-5])|(2[0-4][0-9])|(1[0-9][0-9])|([1-9]?[0-9]))\.){3}((25[0-5])|(2[0-4][0-9])|(1[0-9][0-9])|([1-9]?[0-9]))")
EndFunc

Func _Exit()
    TCPShutdown()
    LibFree($hICMPDll)
    DllClose($hkernel32Dll)
    Exit
EndFunc