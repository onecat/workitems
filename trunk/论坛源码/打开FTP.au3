#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\xiaozhan\Desktop\��FTP.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.3
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
Local $server ='72.167.183.48'
Local $username = 'sharpayr'
Local $pass = 'RaySHARP13@1'
;Local $FTP =ftp:// & $username & ":" & $pass & "@" &  $server & "/"
;MsgBox (0,"1",$FTP)
;Run("C:\WINDOWS\explorer.exe ftp://anonymous:anonymous@" & $server & "/")
Run("C:\WINDOWS\explorer.exe " & "ftp://" & $username & ":" & $pass & "@" &  $server & "/")

;~ MsgBox (0,"1",$1)