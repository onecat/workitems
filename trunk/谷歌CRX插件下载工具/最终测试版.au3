$id = InputBox("谷歌CRX插件下载工具", "输入扩展id 例如 cfhdojbkjhnklbpkdaibdccddilifddb：", "cfhdojbkjhnklbpkdaibdccddilifddb")

If MsgBox(4 + 64, "提示", "是否启用代理") = 6 Then
	$SetProxy = 1 ;启用代理 将该值设为 1 不启用设为 0
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
			$a = BinaryToString(InetRead("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & $id))
;~ 		FileDelete("1.txt")
;~ 		FileWrite("1.txt", $a)
		Else
			MsgBox(64, "no", "启用代理失败！", 3)
			Exit
		EndIf
		
	Case Else
		HttpSetProxy(1)
;~ 		代理模式:
;~     0 = (默认) 使用当前 Internet Explorer 的代理设置.
;~     1 = 无代理 (直接访问)
;~ 	   2 = 使用指定的代理
		$time = TimerInit()
		$a = GetSource("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & $id)
		;FileDelete("1.txt")
		;FileWrite("1.txt",$a)

EndSelect

If StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here') Then
	$down = StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here', 3)
	ConsoleWrite($down[0] & @CRLF);下载地址
	ConsoleWrite($down[1]);文件名
Else
	MsgBox(64, "no", "解析失败！", 3)
	Exit
	
EndIf
$time = TimerDiff($time)
MsgBox(64, "解析完成", "解析耗时：" & Int($time) & "ms")
$save = FileSaveDialog("选择保存路径", @WorkingDir, "扩展(*.crx)", 2, $down[1])
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
		MsgBox(64, "no", "下载失败！", 3)
		Exit
	EndIf
	$time = TimerDiff($time)
	MsgBox(64, "下载完成", "下载耗时：" & Int($time) & "ms")
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