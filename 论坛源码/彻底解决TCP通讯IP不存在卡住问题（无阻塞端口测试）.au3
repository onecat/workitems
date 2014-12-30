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

Dim $testip = -1, $sIP = @IPAddress1, $iPort = 135, $hWs2_32 = -1, $mSocket = -1
$testip = _TCP_Test($iPort, $sIP, 300000)
If $testip <> -1 Then
        MsgBox(0, "提示", "成功连接:" & $sIP & ":" & $iPort & " ...")
Else
        MsgBox(0, "提示", "无法连接:" & $sIP & ":" & $iPort & " ...")
EndIf
 
Dim $testip = -1, $sIP = "255.255.255.255", $iPort = 80, $hWs2_32 = -1, $mSocket = -1
$testip = _TCP_Test($iPort, $sIP, 300000)
If $testip <> -1 Then
        MsgBox(0, "提示", "成功连接:" & $sIP & ":" & $iPort & " ...")
Else
        MsgBox(0, "提示", "无法连接:" & $sIP & ":" & $iPort & " ...")
EndIf
 
Func _TCP_Test($check_port = 0, $check_ip = "127.0.0.1", $stimeout = 30000)
        If $check_ip = "localhost" Then $check_ip = "127.0.0.1"
        If $check_port = 0 Then
                Return -1
        EndIf
        Dim $iResult, $tSockaddr_in, $tTime, $tFD_SET, $iTime, $eTime
        WSAStartup()
        If @error Then Exit (MsgBox(16, '错误', '网络初始化失败', 1))
        ;Global Const  $IPPROTO_TCP = 6, $IPPROTO_UDP = 17
        $mSocket = _ASocket(2, 1, 6)
        If $mSocket = -1 Then Exit (MsgBox(16, '错误', '套字节创建失败', 1))
        $iResult = ioctlsocket($mSocket, 2147772030, 1);设置为非阻塞模式
        If $iResult <> 0 Then MsgBox(16, '错误', '设置非阻塞模式失败', 1)
        $tSockaddr_in = DllStructCreate('ushort family;ushort port;long address;char zero[8];')
        DllStructSetData($tSockaddr_in, 1, 2)
        DllStructSetData($tSockaddr_in, 2, htons($check_port))
        DllStructSetData($tSockaddr_in, 3, inet_addr($check_ip))
        connect($mSocket, DllStructGetPtr($tSockaddr_in), DllStructGetSize($tSockaddr_in));此处WSAGetLastError()会产生10035错误,表示一个非阻塞的连接正在进行.这是一个正常的错误,不必理会
        $tTime = DllStructCreate('int tv_sec;int tv_usec;')
        ;DllStructSetData($tTime, 1, 1);5秒 ==============================>>>>单位秒
        DllStructSetData($tTime, 2, $stimeout);0  =============================>>>>>单位微秒
        $tFD_SET = DllStructCreate('uint;uint[64];')
        $iTime = TimerInit()
        DllStructSetData($tFD_SET, 1, 1)
        DllStructSetData($tFD_SET, 2, $mSocket, 1)
        $iResult = _select(0, DllStructGetPtr($tFD_SET), 0, DllStructGetPtr($tTime))
        If $iResult <= 0 Then
                Return -1
        EndIf
        ioctlsocket($mSocket, 2147772030, 1);设置回阻塞模式
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
