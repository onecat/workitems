#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=1.0.0.1
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
;=============================
;����1:��ʾ��ǰĿ¼�������ļ����ļ���
;=============================
$path = FileSelectFolder("ѡ����¼�����ļ���", "", 2)
If @error = 1 Then Exit
Local $hSearch = FileFindFirstFile($path & "\*.*")

; ��������Ƿ�ɹ�
If $hSearch = -1 Then
    MsgBox(4096, "����", "û���ļ�/Ŀ¼ ƥ������")
    Exit
EndIf

While 1
    Local $sFile = FileFindNextFile($hSearch)
    If @error Then ExitLoop

    MsgBox(4096, "�ҵ����ļ�:", $sFile)
WEnd

; �ر��������
FileClose($hSearch)

;~ ;=============================
;~ ;����2:�ݹ���ҵ�ǰĿ¼������Ŀ¼�µ������ļ�
;~ ;=============================
;~ FindAllFile(@ScriptDir)
;~ Func FindAllFile($sDir)
;~     Local $hSearch = FileFindFirstFile($sDir & "\*.*")
;~     ; ��������Ƿ�ɹ�
;~     If $hSearch = -1 Then Return
;~     While 1
;~         Local $sFile = FileFindNextFile($hSearch)
;~         If @error Then ExitLoop
;~         
;~         If @extended Then 
;~             FindAllFile($sDir & "\" & $sFile)
;~             ContinueLoop
;~         EndIf
;~         FileWriteLine("�ҵ����ļ�.txt",$sDir & "\" & $sFile)
;~     WEnd
;~     ; �ر��������
;~     FileClose($hSearch)
;~ EndFunc
