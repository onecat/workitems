Const $UserAgent = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1)';�������ʶ
Const $nBufferSize = 1024 * 10;��������С
main()
Func main()
	TCPStartup()
	Local $szDomain = 'www.baidu.com'
	Local $hSocket = TCPConnect(TCPNameToIP($szDomain), 80)
	If ($hSocket = -1) Then Return SetError(@error, 1, 0)
	Local $szSendData = StringFormat('GET %s HTTP/1.1\r\nAccept: %s\r\nAccept-Language: %s\r\nUser-Agent: %s\r\nHost: %s\r\nConnection: %s\r\n\r\n', '/', '*/*', 'zh-cn', $UserAgent, $szDomain, 'close')
	Local $nLen = TCPSend($hSocket, $szSendData)
	If ($nLen = 0) Then Return SetError(@error, 2, 0)
	Local $tBuffer = DllStructCreate('char[' & $nBufferSize & ']');����һ��char�����ǽṹ�� �൱��C����� char[1024*10],���ַ�������
	$nLen = 0;��ʼ��Ϊ0
	While (True)
		#cs
		DllStructGetPtr($tBuffer)+$nLen
		DllStructGetPtr($tBuffer)�˴��õ��Ľ����һ��ָ��
		+$nLen��ʾ��ָ���ƶ���λ��,��ʼΪ0����ֱ��ʹ���׵�ַ
		
		DllStructGetSize($tBuffer)-$nLen
		DllStructGetSize($tBuffer)�õ�ָ��ĳ���,Ҳ����ֱ��ʹ��$nBufferSize
		-$nLen �Ǽ�ǰһ�ν��յĳ���
		#ce
		$nLen = recv($hSocket, DllStructGetPtr($tBuffer)+$nLen, DllStructGetSize($tBuffer)-$nLen)
		If (@extended = 0) Then Return;�д�����
		If ($nLen = 0) Then ExitLoop;���ֽڱ��ر�
	WEnd
	MsgBox(0,'�յ�����',DllStructGetData($tBuffer, 1))
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
	$hSocket SOCKET���
	$lpBuf ���ջ�������ָ��
	$iLen ��������С
	$iFlags �ο�MSDNrecv�����һ��������Ŀǰ����ʹ��0
	�����ɹ������ؽ��յ����ֽ���(�����ַ���),ʧ�ܽ����ش������
	��������ֽڱ��ر�,����������0
	#ce
	Local $aResult = DllCall('Ws2_32.dll', 'int', 'recv', 'uint', $hSocket, 'ptr', $lpBuf, 'int', $iLen, 'int', $iFlags)
	If @error Then Return SetError(-1, 0, @error)
	Return SetError(WSAGetLastError(), 1, $aResult[0])
EndFunc   ;==>recv
