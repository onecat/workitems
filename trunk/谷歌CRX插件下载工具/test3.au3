$id = InputBox("�ȸ�CRX������ع���", "������չid ���� cfhdojbkjhnklbpkdaibdccddilifddb��", "cfhdojbkjhnklbpkdaibdccddilifddb")

If MsgBox(4 + 64,"��ʾ" ,"�Ƿ����ô���") = 6 Then
	$SetProxy = 1 ;���ô��� ����ֵ��Ϊ 1 ��������Ϊ 0
Else
	$SetProxy = 0
EndIf

Select
	Case $SetProxy
		$Proxyip = getProxy()
		ConsoleWrite($Proxyip)
		If $Proxyip <> "" Then
			HttpSetProxy(2, $Proxyip & ":80")
			$time = TimerInit()
			$a = String(InetRead("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension="&$id))
		Else
			MsgBox(64, "no", "���ô���ʧ�ܣ�", 3)
			Exit
		EndIf
		
	Case Else
		
		$time = TimerInit()
		$a = GetSource("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension="&$id)
		;FileDelete("1.txt")
		;FileWrite("1.txt",$a)

EndSelect

If StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here') Then
	$down = StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here', 3)
	ConsoleWrite($down[0] & @CRLF);���ص�ַ
	ConsoleWrite($down[1]);�ļ���
Else
	MsgBox(64, "no", "����ʧ�ܣ�", 3)
	Exit
	
EndIf
$time = TimerDiff($time)
MsgBox(64, "�������", "������ʱ��" & Int($time) & "ms")
$save = FileSaveDialog("ѡ�񱣴�·��", @WorkingDir, "��չ(*.crx)", 2, $down[1])
If $save <> "" Then
	$time = TimerInit()
	$b = InetGet($down[0], $save, 1, 1)
	While 1
		$info = InetGetInfo($b)
		ConsoleWrite(Int($info[0] / $info[1] * 100) & "%" & @CRLF)
		If $info[2] Or $info[4] Then ExitLoop
		Sleep(500)
	WEnd
	InetClose($b)
	If @error Then
		MsgBox(64, "no", "����ʧ�ܣ�", 3)
		Exit
	EndIf
	$time = TimerDiff($time)
	MsgBox(64, "�������", "���غ�ʱ��" & Int($time) & "ms")
EndIf
;======================================================================
Func GetSource($url)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;======================================================================

Func getProxy()
	Local $urlP[] = ["203.208.46.170", "203.208.46.200", "203.208.46.202", "203.208.46.207", "203.208.46.222"]
	For $n = 0 To 4
		ConsoleWrite($urlP[$n] & @CRLF)
		$iPing = Ping($urlP[$n], 500)
		If $iPing Then Return ($urlP[$n])
		
	Next
	Return ("")
	
EndFunc   ;==>getProxy