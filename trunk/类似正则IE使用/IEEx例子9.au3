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
;~ �ű�������ִ�нű�������ֵ
;~ _IEDoScript("��Ӵ���","ִ�к���",���� = "javascript")
;~ �ɹ����غ�������ֵ
;~ ʧ�ܷ���0
 
;����������Ҳ����
#include <IEEX.au3>
$string = _ 
'function myfunction(arg1, arg2){' & @CRLF & _
'   var r;' & @CRLF & _
'   r = arg1 * arg2;' & @CRLF & _
'   return(r);' & @CRLF & _
'}'
 
$sum = _IEDoScript($string,'myfunction(3,4)')
 
MsgBox(0,"3*4",$sum)
 
$string = _ 
'function eurl(URIString){' & @CRLF & _
'   var r;' & @CRLF & _
'   r = encodeURI(URIString);' & @CRLF & _
'   return(r);' & @CRLF & _
'}'
 
$url = _IEDoScript($string,'eurl("http://www.baidu.com/s?wd=˫ɫ��")')
MsgBox(0,"url����",$url)

