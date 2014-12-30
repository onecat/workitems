

$time = TimerInit()
$a = GetSource("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=cfhdojbkjhnklbpkdaibdccddilifddb")
;FileDelete("1.txt")
;FileWrite("1.txt",$a)

If StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here') Then
	$down = StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here', 3)
	ConsoleWrite($down[0] & @CRLF);下载地址
	MsgBox(0,"",$down[0])
	ConsoleWrite($down[1]);文件名
Else
	MsgBox(64, "no", "解析失败！",3)
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
		ConsoleWrite(int($info[0]/$info[1]*100)&"%"&@crlf)
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
	Local $n3
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	Do
		$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
		If $return Then ExitLoop
		$n3 += 1000;判断超时时间
		Sleep(300)
	Until $n3 > 1000
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;======================================================================
