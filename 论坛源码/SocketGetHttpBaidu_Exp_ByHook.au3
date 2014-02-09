Const $UserAgent = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1)';浏览器标识
Const $nBufferSize = 1024 * 10;缓冲区大小
main()
Func main()
	TCPStartup()
	Local $szDomain = 'www.baidu.com'
	Local $hSocket = TCPConnect(TCPNameToIP($szDomain), 80)
	If ($hSocket = -1) Then Return SetError(@error, 1, 0)
	Local $szSendData = StringFormat('GET %s HTTP/1.1\r\nAccept: %s\r\nAccept-Language: %s\r\nUser-Agent: %s\r\nHost: %s\r\nConnection: %s\r\n\r\n', '/', '*/*', 'zh-cn', $UserAgent, $szDomain, 'close')
	Local $nLen = TCPSend($hSocket, $szSendData)
	If ($nLen = 0) Then Return SetError(@error, 2, 0)
	Local $tBuffer = DllStructCreate('char[' & $nBufferSize & ']');创建一个char类型是结构体 相当于C里面的 char[1024*10],即字符串数组
	$nLen = 0;初始化为0
	While (True)
		#cs
		DllStructGetPtr($tBuffer)+$nLen
		DllStructGetPtr($tBuffer)此处得到的结果是一个指针
		+$nLen表示将指针移动的位置,初始为0，即直接使用首地址
		
		DllStructGetSize($tBuffer)-$nLen
		DllStructGetSize($tBuffer)得到指针的长度,也可以直接使用$nBufferSize
		-$nLen 是减前一次接收的长度
		#ce
		$nLen = recv($hSocket, DllStructGetPtr($tBuffer)+$nLen, DllStructGetSize($tBuffer)-$nLen)
		If (@extended = 0) Then Return;有错误发生
		If ($nLen = 0) Then ExitLoop;套字节被关闭
	WEnd
	MsgBox(0,'收到数据',DllStructGetData($tBuffer, 1))
	TCPCloseSocket($hSocket)
	TCPShutdown()
EndFunc   ;==>main

Func WSAGetLastError()
	Local $Ret = DllCall('Ws2_32.dll', 'int', 'WSAGetLastError')
	If @error Then Return SetError(@error, 0, 0)
	Return $Ret[0]
EndFunc   ;==>WSAGetLastError

Func recv($hSocket, $lpBuf, $iLen, $iFlags = 0)
	#cs
	$hSocket SOCKET句柄
	$lpBuf 接收缓冲区的指针
	$iLen 缓冲区大小
	$iFlags 参考MSDNrecv的最后一个参数，目前总是使用0
	函数成功，返回接收到的字节数(不是字符数),失败将返回错误代码
	另，如果套字节被关闭,函数将返回0
	#ce
	Local $aResult = DllCall('Ws2_32.dll', 'int', 'recv', 'uint', $hSocket, 'ptr', $lpBuf, 'int', $iLen, 'int', $iFlags)
	If @error Then Return SetError(-1, 0, @error)
	Return SetError(WSAGetLastError(), 1, $aResult[0])
EndFunc   ;==>recv
