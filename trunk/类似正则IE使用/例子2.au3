#include <IE.au3>
#include <MSHtml.au3>
#include <IEEX.au3>
Local $doc = _MHDocGetObj() ;����document����
_MHNavigate($doc, "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat",4) ;���ϻ�ȡ�ٶ�Դ�벢���ص�mshtml,4 utf8����ת��

;ȡ����ֻ�ṩ�����ַ���������������IE��һ��
;�Ƽ�ʹ��IEEX.au3�ṩ��ͨ�û�ȡԪ�ط���
;~ $kw = _IEQuery($doc,"input","id=kw") ;��Ҫ#include <IEEX.au3>
;~ $kw = _MHGetObjById($doc, "kw") ;id����
;~ Local $kw = _MHGetObjByName($doc, "wd",1) ;nameȡ��������

;���������IE����һ��
;~ Local $td = _IETagNameGetCollection($doc,"td",0) ;ʹ��ie����ȡ����
;~ MsgBox(64,"Դ��",$td.outerhtml)
Local $su = _IEQuery($doc,"td","class=source") ;id��������
Local $sText = _IEPropertyGet($su,"outertext") ;ȡ��ʾ�ı�
MsgBox(0,"������ʾ�ı�",StringTrimLeft($sText,14))
MsgBox(0,"������ʾ�ı�",$sText)