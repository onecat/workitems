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
_SearchDelFile("ָ��Ŀ¼", "ָ���ļ�")
_SearchDelFile(@HomeDrive, '1.txt');��ϵͳ���²�������"1.txt������ɾ��
_SearchDelFile(@WindowsDir, '*.log');��Windows�ļ�����(�������ļ���)����������չ��Ϊ"log"���ļ�����ɾ��
_SearchDelFile('C:\Users\Administrator\Desktop\BackUp', ".txt")

 
Func _SearchDelFile($SearchDir, $SearchFile)
        Local $search = FileFindFirstFile($SearchDir & "\*.*")
        While 1
                Dim $file = FileFindNextFile($search)
                If @error Or StringLen($file) < 1 Then ExitLoop
                If Not StringInStr(FileGetAttrib($SearchDir & "\" & $file), "D") And ($file <> "." Or $file <> "..") Then
                        If StringRight($SearchDir & "\" & $file, StringLen($SearchFile)) = $SearchFile Then
                                FileDelete($SearchDir & '\' & $file)
                        EndIf
                EndIf
                If StringInStr(FileGetAttrib($SearchDir & "\" & $file), "D") And ($file <> "." Or $file <> "..") Then
                        _SearchDelFile($SearchDir & "\" & $file, $SearchFile)
                EndIf
        WEnd
        Return
EndFunc   ;==>_SearchDelFile
