#include <IE.au3>
#include <MSHtml.au3>
Local $doc = _MHDocGetObj() ;����document����
_MHNavigate($doc, "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat",4) ;���ϻ�ȡ�ٶ�Դ�벢���ص�mshtml,4 utf8����ת��

;ȡ����ֻ�ṩ�����ַ���������������IE��һ��
;�Ƽ�ʹ��IEEX.au3�ṩ��ͨ�û�ȡԪ�ط���
;~ $kw = _IEQuery($doc,"input","id=kw") ;��Ҫ#include <IEEX.au3>
;~ $kw = _MHGetObjById($doc, "kw") ;id����
;~ Local $kw = _MHGetObjByName($doc, "wd",1) ;nameȡ��������

;���������IE����һ��
Local $su = _MHGetObjById($doc,"sl_svn376_1") ;id��������
Local $sText = _IEPropertyGet($su,"outertext") ;ȡ��ʾ�ı�
MsgBox(0,"������ʾ�ı�",StringTrimLeft($sText,14))