#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <IE.au3>
#include <MSHtml.au3>
Local $doc = _MHDocGetObj() ;����document����
_MHNavigate($doc, "http://www.baidu.com",4) ;���ϻ�ȡ�ٶ�Դ�벢���ص�mshtml,4 utf8����ת��

;ȡ����ֻ�ṩ�����ַ���������������IE��һ��
;�Ƽ�ʹ��IEEX.au3�ṩ��ͨ�û�ȡԪ�ط���
;~ $kw = _IEQuery($doc,"input","id=kw") ;��Ҫ#include <IEEX.au3>
;~ $kw = _MHGetObjById($doc, "kw") ;id����
Local $kw = _MHGetObjByName($doc, "wd",1) ;nameȡ��������

;���������IE����һ��
Local $sHtml = _IEPropertyGet($kw,"outerhtml") ;ȡ�����htmlԴ��
MsgBox(0,"����htmlԴ��",$sHtml)
Local $su = _MHGetObjById($doc,"seth") ;id��������
Local $sText = _IEPropertyGet($su,"outertext") ;ȡ��ʾ�ı�
MsgBox(0,"������ʾ�ı�",$sText)