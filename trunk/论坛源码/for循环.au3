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
;Opt("TrayIconHide", 1) ;����ʾ������ͼ��.
Opt("TrayAutoPause",1) ;����������ͼ��ʱ����ͣ. 
HotKeySet("+!d", "mb");�˳������ݼ�.
;��ȡini�����ļ�
Global $var = IniReadSection("myfile.ini", "�ֶ�1")
Global $i = 1
If @error Then
    MsgBox(4096, "", "����, ��ȡ�����ļ�ʧ��.")
Else
    For $i = 1 To $var[0][0]
		 If ProcessExists($var[$i][1]) Then
               MsgBox(4096, "", "�ؼ���: " & "����")
				;Run($var[$i][1])
			Else
					Exit
        EndIf
        MsgBox(4096, "", "�ؼ���: " & $var[$i][0] & @CRLF & "ֵ: " & $var[$i][1])
    Next
EndIf
;��ȡ����

Func mb()
        Exit
EndFunc
	
	
;~ [�ֶ�1]
;~ ��ѶQQ=QQ.exe
;~ QQ����=QQDownload.exe