
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:ilv
	�����ʼ�:
	QQ/TM:914004582
	�ű��汾:V1.0
	�ű�����:ˢ�¼���post au3��
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

Local $cookie, $oHTTP, $ResponseText, $postdata
;=======================��¼����ʼ

$postdata = "rand=831&homepagelogin=1&loginname=ilvjyw&loginpwd=ilv31415926&submit=";�ύ����
;�뽫�ύ�����е��û����������滻Ϊ�Լ��ļ���  �ı����ܺ��� �Լ��������� �Լ��������
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");����winhttp.winhttprequest.5.1����
$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);���ó�ʱʱ��
$oHTTP.Option(4) = 13056;���Դ����־
$oHTTP.option(6) = 0;��ֹ�ض���
$oHTTP.Open("post", "http://zh-hr.com/jsp/person/login/logincheck.jsp", False);����post/get����False ͬ����ʽ��True �첽��ʽ
;------��������ͷ��ʼ
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/home/centerzhhr.jsp");��·  ���Ǵ��ĸ���ҳ��ת������
$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");�������ʶ
;------��������ͷ����
$oHTTP.Send($postdata);��������
$cookie = $oHTTP.getResponseHeader("Set-Cookie");��ȡָ������Ӧͷ��Ϣ,�����ȡ���Ƿ���cookie
$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
;ConsoleWrite($cookie & @CRLF)
;FileWrite("��Ӧ����1.txt", $ResponseText);���浽���� ������������
$oHTTP = 0;�ͷŶ���

;======================��¼������

If StringInStr($ResponseText, "/jsp/person/other/zhtj.jsp") Then
	MsgBox(0, "��ʾ", "��¼�ɹ�")
Else
	MsgBox(0, "��ʾ", "��¼ʧ��")
EndIf


;======================ˢ�°���ʼ

$postdata = "refresh=1"
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");����winhttp.winhttprequest.5.1����
$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);���ó�ʱʱ��
$oHTTP.Option(4) = 13056;���Դ����־
$oHTTP.option(6) = 0;��ֹ�ض���
$oHTTP.Open("post", "http://zh-hr.com/jsp/person/other/zhtj.jsp", False);����post/get����False ͬ����ʽ��True �첽��ʽ
;------��������ͷ��ʼ
$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/person/other/zhtj.jsp");��·  ���Ǵ��ĸ���ҳ��ת������
$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
$oHTTP.setRequestHeader("Content-Length", "9")
$oHTTP.setRequestHeader("Connection", "Keep-Alive")
$oHTTP.setRequestHeader("Cookie", $cookie)
$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");�������ʶ
;------��������ͷ����
$oHTTP.Send($postdata);��������
$ResponseHeaders = $oHTTP.GetAllResponseHeaders;��ȡ������Ӧͷ
$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
;ConsoleWrite($ResponseHeaders)
;FileWrite("��Ӧ����2.txt", $ResponseText);���浽���� ������������
$oHTTP = 0;�ͷŶ���

;======================ˢ�°�����

if StringInStr($ResponseText, "�ɹ�ˢ�¼���") then
	MsgBox(0, "��ʾ", "ˢ�³ɹ�")
Else
	MsgBox(0, "��ʾ", "ˢ��ʧ��")
EndIf
