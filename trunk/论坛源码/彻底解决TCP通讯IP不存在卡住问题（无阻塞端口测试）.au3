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

Dim $testip = -1, $sIP = @IPAddress1, $iPort = 135, $hWs2_32 = -1, $mSocket = -1
$testip = _TCP_Test($iPort, $sIP, 300000)
If $testip <> -1 Then
        MsgBox(0, "��ʾ", "�ɹ�����:" & $sIP & ":" & $iPort & " ...")
Else
        MsgBox(0, "��ʾ", "�޷�����:" & $sIP & ":" & $iPort & " ...")
EndIf
 
Dim $testip = -1, $sIP = "255.255.255.255", $iPort = 80, $hWs2_32 = -1, $mSocket = -1
$testip = _TCP_Test($iPort, $sIP, 300000)
If $testip <> -1 Then
        MsgBox(0, "��ʾ", "�ɹ�����:" & $sIP & ":" & $iPort & " ...")
Else
        MsgBox(0, "��ʾ", "�޷�����:" & $sIP & ":" & $iPort & " ...")
EndIf
 
Func _TCP_Test($check_port = 0, $check_ip = "127.0.0.1", $stimeout = 30000)
        If $check_ip = "localhost" Then $check_ip = "127.0.0.1"
        If $check_port = 0 Then
                Return -1
        EndIf
        Dim $iResult, $tSockaddr_in, $tTime, $tFD_SET, $iTime, $eTime
        WSAStartup()
        If @error Then Exit (MsgBox(16, '����', '�����ʼ��ʧ��', 1))
        ;Global Const  $IPPROTO_TCP = 6, $IPPROTO_UDP = 17
        $mSocket = _ASocket(2, 1, 6)
        If $mSocket = -1 Then Exit (MsgBox(16, '����', '���ֽڴ���ʧ��', 1))
        $iResult = ioctlsocket($mSocket, 2147772030, 1);����Ϊ������ģʽ
        If $iResult <> 0 Then MsgBox(16, '����', '���÷�����ģʽʧ��', 1)
        $tSockaddr_in = DllStructCreate('ushort family;ushort port;long address;char zero[8];')
        DllStructSetData($tSockaddr_in, 1, 2)
        DllStructSetData($tSockaddr_in, 2, htons($check_port))
        DllStructSetData($tSockaddr_in, 3, inet_addr($check_ip))
        connect($mSocket, DllStructGetPtr($tSockaddr_in), DllStructGetSize($tSockaddr_in));�˴�WSAGetLastError()�����10035����,��ʾһ�����������������ڽ���.����һ�������Ĵ���,�������
        $tTime = DllStructCreate('int tv_sec;int tv_usec;')
        ;DllStructSetData($tTime, 1, 1);5�� ==============================>>>>��λ��
        DllStructSetData($tTime, 2, $stimeout);0  =============================>>>>>��λ΢��
        $tFD_SET = DllStructCreate('uint;uint[64];')
        $iTime = TimerInit()
        DllStructSetData($tFD_SET, 1, 1)
        DllStructSetData($tFD_SET, 2, $mSocket, 1)
        $iResult = _select(0, DllStructGetPtr($tFD_SET), 0, DllStructGetPtr($tTime))
        If $iResult <= 0 Then
                Return -1
        EndIf
        ioctlsocket($mSocket, 2147772030, 1);���û�����ģʽ
        $eTime = TimerDiff($iTime)
        _ASockClose($mSocket)
        Return $eTime
EndFunc   ;==>_TCP_Test
 
Func WSAStartup()
        $hWs2_32 = DllOpen('Ws2_32.dll')
        If $hWs2_32 = -1 Then
                Return SetError(-2, 0, 0)
        EndIf
        Local $WSADATA = DllStructCreate('ushort wVersion;ushort wHighVersion;char szDescription[257];char szSystemStatus[129];ushort iMaxSockets;ushort iMaxUdpDg;ptr lpVendorInfo;'), $Ret
        $Ret = DllCall($hWs2_32, 'int', 'WSAStartup', 'short', MAKEWORD(2, 2), 'ptr', DllStructGetPtr($WSADATA))
        Return SetError($Ret[0], $WSADATA = 0, $Ret[0] = 0)
EndFunc   ;==>WSAStartup
 
Func _ASocket($iAddressFamily = 2, $iType = 1, $iProtocol = 6)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen("Ws2_32.dll")
        Local $hSocket = DllCall($hWs2_32, "uint", "socket", "int", $iAddressFamily, "int", $iType, "int", $iProtocol)
        If @error Then
                SetError(1, @error)
                Return -1
        EndIf
        If $hSocket[0] = -1 Then
                SetError(2, _WSAGetLastError())
                Return -1
        EndIf
        Return $hSocket[0]
EndFunc   ;==>_ASocket
 
Func ioctlsocket($hSocket, $iCmd, $pArgp)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen('Ws2_32.dll')
        Local $Ret = DllCall($hWs2_32, 'int', 'ioctlsocket', 'uint', $hSocket, 'long', $iCmd, 'ulong*', $pArgp)
        If @error Then Return SetError(@error, 0, -1)
        Return $Ret[0]
EndFunc   ;==>ioctlsocket
 
Func htons($iPort)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen('Ws2_32.dll')
        Local $aResult = DllCall($hWs2_32, 'ushort', 'htons', 'ushort', $iPort)
        If @error Then Return SetError(-1, 0, @error)
        Return SetError(_WSAGetLastError(), 1, $aResult[0])
EndFunc   ;==>htons
 
Func inet_addr($sIP)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen('Ws2_32.dll')
        Local $aResult = DllCall($hWs2_32, 'uint', 'inet_addr', 'str', $sIP)
        If @error Then Return SetError(-1, 0, @error)
        Return SetError(@error, @extended, $aResult[0])
EndFunc   ;==>inet_addr
 
Func connect($hSocket, $lpsockaddr, $iLen)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen('Ws2_32.dll')
        Local $aResult = DllCall($hWs2_32, 'int', 'connect', 'uint', $hSocket, 'ptr', $lpsockaddr, 'int', $iLen)
        If @error Then Return SetError(@error, 1, -1)
        Return SetError(_WSAGetLastError(), 0, $aResult[0])
EndFunc   ;==>connect
 
Func _select($preadfds, $pWritefds, $pexceptfds, $pTimeout)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen('Ws2_32.dll')
        Local $aResult = DllCall($hWs2_32, 'int', 'select', 'int', 0, 'ptr', $preadfds, 'ptr', $pWritefds, 'ptr', $pexceptfds, 'ptr', $pTimeout)
        If @error Then Return SetError(@error)
        Return $aResult[0]
EndFunc   ;==>_select
 
Func _ASockShutdown($hSocket)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen("Ws2_32.dll")
        Local $iRet = DllCall($hWs2_32, "int", "shutdown", "uint", $hSocket, "int", 2)
        If @error Then
                SetError(1, @error)
                Return False
        EndIf
        If $iRet[0] <> 0 Then
                SetError(2, _WSAGetLastError())
                Return False
        EndIf
        Return True
EndFunc   ;==>_ASockShutdown
 
Func _ASockClose($hSocket)
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen("Ws2_32.dll")
        Local $iRet = DllCall($hWs2_32, "int", "closesocket", "uint", $hSocket)
        If @error Then
                SetError(1, @error)
                Return False
        EndIf
        If $iRet[0] <> 0 Then
                SetError(2, _WSAGetLastError())
                Return False
        EndIf
        Return True
EndFunc   ;==>_ASockClose
 
Func _WSAGetLastError()
        If $hWs2_32 = -1 Then $hWs2_32 = DllOpen("Ws2_32.dll")
        Local $iRet = DllCall($hWs2_32, "int", "WSAGetLastError")
        If @error Then
                SetExtended(1)
                Return 0
        EndIf
        Return $iRet[0]
EndFunc   ;==>_WSAGetLastError
 
Func MAKEWORD($LoByte, $HiByte)
        Return BitOR($LoByte, 0x100 * $HiByte)
EndFunc   ;==>MAKEWORD
