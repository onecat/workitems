#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=N:\��Դ��\workitems\P2P\lorex\p2p.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.10
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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
#include 'msgboxDJS_UDF.au3'
$msg = MsgBoxDJS(0 + 48 + 4, '�ȴ���ȡlorex ID״̬', '�ȴ���ȡlorex ID״̬��' & @CRLF & '�벻Ҫ����������' & @CRLF & '��������Զ��ر����ֶ��㡰�ǡ�', 9, 2)
If $msg = 6 Then 
	ProcessClose ("cmd.exe")
	ProcessClose ("OsnClientApp.exe")
EndIf

	