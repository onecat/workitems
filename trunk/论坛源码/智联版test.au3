

Local $cookie, $oHTTP, $ResponseText, $postdata
;=======================��¼����ʼ


$postdata = "int_count=999&errUrl=http%3A%2F%2Fmy.zhaopin.com%2Floginmgr%2Floginproc.asp&requestFrom=portal&loginname=zhqf2013@126.com&password=xz0031140";�ύ����
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.option(6) = 0
$oHTTP.Open("post", "http://i.zhaopin.com/Login/LoginManager/Login", False)
$oHTTP.setRequestHeader("Referer", "http://www.zhaopin.com/")
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Content-Length", "140")
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)")
$oHTTP.Send($postdata);��������
$cookie = $oHTTP.getResponseHeader("Set-Cookie")
$ResponseHeaders = $oHTTP.GetAllResponseHeaders
;$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
;MsgBox(0, "", $ResponseHeaders);��Ӧͷ
$oHTTP = 0;�ͷŶ���

;======================��¼������

If StringInStr($ResponseHeaders, "http://i.zhaopin.com") Then
	MsgBox(0, "��ʾ", "��¼�ɹ�")
Else
	MsgBox(0, "��ʾ", "��¼ʧ��")
EndIf



;======================ˢ�°���ʼ
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("post", "http://i.zhaopin.com/Home/IsRefreshResume?usermasterId=629021106&resumeId=212969366&extId=JM290211067R90250000000&version=1&language=1", False);����post/get����False ͬ����ʽ��True �첽��ʽ
;------��������ͷ��ʼ
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Referer", "http://i.zhaopin.com/");��·  ���Ǵ��ĸ���ҳ��ת������
$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
$oHTTP.setRequestHeader("Content-Length", "0")
$oHTTP.setRequestHeader("Connection", "Keep-Alive")
$oHTTP.setRequestHeader("Cookie", $cookie)
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");�������ʶ
;------��������ͷ����
$oHTTP.Send("");��������
$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
$oHTTP = 0;�ͷŶ���
;MsgBox(0, "", $ResponseText)

;======================ˢ�°�����

	If StringInStr($ResponseText, "true") Then
		MsgBox(0, "��ʾ", "ˢ�³ɹ�")
	Else
		MsgBox(0, "��ʾ", "ˢ��ʧ��")
	EndIf

