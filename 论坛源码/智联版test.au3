

Local $cookie, $oHTTP, $ResponseText, $postdata
;=======================登录包开始


$postdata = "int_count=999&errUrl=http%3A%2F%2Fmy.zhaopin.com%2Floginmgr%2Floginproc.asp&requestFrom=portal&loginname=zhqf2013@126.com&password=xz0031140";提交数据
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.option(6) = 0
$oHTTP.Open("post", "http://i.zhaopin.com/Login/LoginManager/Login", False)
$oHTTP.setRequestHeader("Referer", "http://www.zhaopin.com/")
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Content-Length", "140")
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)")
$oHTTP.Send($postdata);发送请求
$cookie = $oHTTP.getResponseHeader("Set-Cookie")
$ResponseHeaders = $oHTTP.GetAllResponseHeaders
;$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
;MsgBox(0, "", $ResponseHeaders);响应头
$oHTTP = 0;释放对象

;======================登录包结束

If StringInStr($ResponseHeaders, "http://i.zhaopin.com") Then
	MsgBox(0, "提示", "登录成功")
Else
	MsgBox(0, "提示", "登录失败")
EndIf



;======================刷新包开始
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("post", "http://i.zhaopin.com/Home/IsRefreshResume?usermasterId=629021106&resumeId=212969366&extId=JM290211067R90250000000&version=1&language=1", False);创建post/get请求；False 同步方式；True 异步方式
;------设置请求头开始
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Referer", "http://i.zhaopin.com/");来路  就是从哪个网页跳转过来的
$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
$oHTTP.setRequestHeader("Content-Length", "0")
$oHTTP.setRequestHeader("Connection", "Keep-Alive")
$oHTTP.setRequestHeader("Cookie", $cookie)
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");浏览器标识
;------设置请求头结束
$oHTTP.Send("");发送请求
$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
$oHTTP = 0;释放对象
;MsgBox(0, "", $ResponseText)

;======================刷新包结束

	If StringInStr($ResponseText, "true") Then
		MsgBox(0, "提示", "刷新成功")
	Else
		MsgBox(0, "提示", "刷新失败")
	EndIf

