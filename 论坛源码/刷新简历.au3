#include <IE.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 678, 424, 192, 124)
$oIE = _IECreateEmbedded()
GUICtrlCreateObj($oIE, 40, 8, 609, 353)
$Button1 = GUICtrlCreateButton("重载", 104, 384, 57, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
re()


;===============================================================
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			re()
	EndSwitch
WEnd

;==================================================================
Func StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1, $i_Flag = 1)
	If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
		SetError(1)
		Return ''
	ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
		SetError(1)
		Return ''
	Else
		If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
		Local $b_EncryptText
		Local $b_EncryptPassword
		Local $v_EncryptModified
		Local $i_EncryptCountH
		Local $i_EncryptCountG
		Local $v_EncryptSwap
		Local $av_EncryptBox[256][2]
		Local $i_EncryptCountA
		Local $i_EncryptCountB
		Local $i_EncryptCountC
		Local $i_EncryptCountD
		Local $i_EncryptCountE
		Local $v_EncryptCipher
		Local $v_EncryptCipherBy
		$b_EncryptText = StringToBinary($s_EncryptText, $i_Flag)
		$b_EncryptPassword = StringToBinary($s_EncryptPassword, $i_Flag)
		If $i_Encrypt = 1 Then
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = Binary('')
				For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
					If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH += 1
					EndIf
					$v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255), 2))
				Next
				$b_EncryptText = $v_EncryptModified
				$i_EncryptCountA = ''
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1), 2))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
					$v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
					$v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy, 2))
				Next
				$b_EncryptText = StringTrimLeft($v_EncryptCipher, 2)
			Next
		Else
			$b_EncryptText = $s_EncryptText
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$b_EncryptText = Binary('0x' & $b_EncryptText)
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1), 2))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
					$v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
					$v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy, 2))
				Next
				$b_EncryptText = $v_EncryptCipher
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = ''
				For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
					If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH += 1
					EndIf
					$v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255), 2))
				Next
				$b_EncryptText = BinaryToString($v_EncryptModified, $i_Flag)
			Next
		EndIf
		Return $b_EncryptText
	EndIf
EndFunc   ;==>StringEncrypt

Func re()
	_IENavigate($oIE, "http://zh-hr.com")
	_IEAction($oIE, "stop")
	$un = "613973DFF6774BDFF64EC56584D2160C"
	$pw = "613973DFF6774BDFF64DC51784A3160E440A917F8F3BEEF2"
	$username = StringEncrypt(0, $un, 'abc', 1, 4)
	$password = StringEncrypt(0, $pw, 'abc', 1, 4)
	post($username, $password)
	$Ele = _IEGetObjById($oIE, "loginname")
	_IEFormElementSetValue($Ele, $username)
	$Ele = _IEGetObjById($oIE, "loginpwd")
	_IEFormElementSetValue($Ele, $password)
	$Ele = _IETagNameGetCollection($oIE, "SPAN", 18)
	_IEAction($Ele, "click")
	Sleep(300)
	Return
EndFunc   ;==>re

Func post($username, $password)
	
	Local $cookie, $oHTTP, $ResponseText, $postdata
	;=======================登录包开始

	$postdata = "rand=831&homepagelogin=1&loginname=" & $username & "&loginpwd=" & $password & "&submit=";提交数据
	;请将提交数据中的用户名和密码替换为自己的即可  文本加密函数 以及其他功能 自己随意添加
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");创建winhttp.winhttprequest.5.1对象
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);设置超时时间
	$oHTTP.Option(4) = 13056;忽略错误标志
	$oHTTP.option(6) = 0;禁止重定向
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/login/logincheck.jsp", False);创建post/get请求；False 同步方式；True 异步方式
	;------设置请求头开始
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/home/centerzhhr.jsp");来路  就是从哪个网页跳转过来的
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");浏览器标识
	;------设置请求头结束
	$oHTTP.Send($postdata);发送请求
	$cookie = $oHTTP.getResponseHeader("Set-Cookie");获取指定的响应头信息,这里获取的是返回cookie
	$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
	;ConsoleWrite($cookie & @CRLF)
	;FileWrite("响应正文1.txt", $ResponseText);保存到本地 方便用来调试
	$oHTTP = 0;释放对象

	;======================登录包结束

;~ 	If StringInStr($ResponseText, "/jsp/person/other/zhtj.jsp") Then
;~ 		MsgBox(0, "提示", "登录成功")
;~ 	Else
;~ 		MsgBox(0, "提示", "登录失败")
;~ 	EndIf


	;======================刷新包开始

	$postdata = "refresh=1"
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");创建winhttp.winhttprequest.5.1对象
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);设置超时时间
	$oHTTP.Option(4) = 13056;忽略错误标志
	$oHTTP.option(6) = 0;禁止重定向
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/other/zhtj.jsp", False);创建post/get请求；False 同步方式；True 异步方式
	;------设置请求头开始
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/person/other/zhtj.jsp");来路  就是从哪个网页跳转过来的
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("Content-Length", "9")
	$oHTTP.setRequestHeader("Connection", "Keep-Alive")
	$oHTTP.setRequestHeader("Cookie", $cookie)
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");浏览器标识
	;------设置请求头结束
	$oHTTP.Send($postdata);发送请求
	$ResponseHeaders = $oHTTP.GetAllResponseHeaders;获取完整响应头
	$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
	;ConsoleWrite($ResponseHeaders)
	;FileWrite("响应正文2.txt", $ResponseText);保存到本地 方便用来调试
	$oHTTP = 0;释放对象

	;======================刷新包结束

;~ 	If StringInStr($ResponseText, "成功刷新简历") Then
;~ 		MsgBox(0, "提示", "刷新成功")
;~ 	Else
;~ 		MsgBox(0, "提示", "刷新失败")
;~ 	EndIf

EndFunc   ;==>post

