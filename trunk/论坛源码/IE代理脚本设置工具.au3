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

Global $addr
$addr=InputBox("��������","====��������������===="&@CRLF&@CRLF&"�ڹ�˾���������룺1"&@CRLF&"�ڼ����������룺2")
Select
        Case $addr=1
                _Proxy_add()
        Case $addr=2
                _Proxy_del()
        Case Else
                MsgBox(0,"����","�������")
EndSelect

Func _Proxy_add()
;���ô���ű�
Local $sAddr="http://www.au3.cc" ;����ַ������Ĵ���ű���ַ
RegWrite("HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings","AutoConfigURL","REG_SZ",$sAddr)
Local $sVar = RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "AutoConfigURL")
MsgBox(0, "���ô���", "�����õ�ǰ����ű�Ϊ��"&$sVar)
EndFunc

Func _Proxy_del()
;ɾ������ű�
RegDelete("HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings","AutoConfigURL")
MsgBox(0, "���ô���", "����ű���ɾ��!")
EndFunc