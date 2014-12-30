
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:ilv
	电子邮件:
	QQ/TM:914004582
	脚本版本:V1.0
	脚本功能:刷新简历post au3版
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

Local $cookie, $oHTTP, $ResponseText, $postdata
;=======================登录包开始

$postdata = "rand=831&homepagelogin=1&loginname=ilvjyw&loginpwd=ilv31415926&submit=";提交数据
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

If StringInStr($ResponseText, "/jsp/person/other/zhtj.jsp") Then
	MsgBox(0, "提示", "登录成功")
Else
	MsgBox(0, "提示", "登录失败")
EndIf


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

if StringInStr($ResponseText, "成功刷新简历") then
	MsgBox(0, "提示", "刷新成功")
Else
	MsgBox(0, "提示", "刷新失败")
EndIf
