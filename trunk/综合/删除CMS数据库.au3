#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=C:\Users\chtyfox\Desktop\ɾ��CMS���ݿ�.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\ɾ��CMS���ݿ�(ȥ���ַ����ķ���).exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=����
#PRE_Res_Description=����
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=����
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

	;FileDelete (@AppDataDir & "\Video Client\SysConfig.mdb");ɾ�����ݿ�
	FileRecycle (@AppDataDir & "\Video Client\SysConfig.mdb");�����ݿ��Ƶ�����վ

	DirRemove(@UserProfileDir & "\Video Client",1)
	;DirRemove(StringLeft(@MyDocumentsDir, StringInStr(@MyDocumentsDir, '\')-1) & @HomePath & "\Video Client",1)



If Not (FileExists(@AppDataDir & "\Video Client\SysConfig.mdb") Or FileExists(@UserProfileDir & "\Video Client")) Then
	MsgBox(4096, "CMS", "ɾ���ɹ�")
Else
	If FileExists(@AppDataDir & "\Video Client\SysConfig.mdb") Then MsgBox(4096, "CMS", "SysConfig.mdbɾ�����ɹ�")
	If FileExists(@UserProfileDir & "\Video Client") Then MsgBox(4096, "CMS", "Video Clientɾ�����ɹ�")
EndIf
;~ If FileExists(@AppDataDir & "\Video Client\SysConfig.mdb") Then
;~ 	MsgBox(4096, "CMS", "SysConfig.mdbɾ�����ɹ�")
;~ ElseIf FileExists(@UserProfileDir & "\Video Client")  Then
;~     MsgBox(4096, "CMS", "Video Clientɾ�����ɹ�")
;~ Else
;~     MsgBox(4096, "CMS", "ɾ���ɹ�")

;~ EndIf



