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

_main()

Func _main()
        
        MsgBox(0, "", _FileInfoGet(".\11.png"))
        
EndFunc   ;==>_main

Func _FileInfoGet($FilePath)
        
        Local $o_File, $o_Shell, $Str 
        Local $i
        $o_File = ObjCreate("scripting.filesystemobject").GetFile($FilePath)
        $o_Shell = ObjCreate("Shell.Application").Namespace($o_File.ParentFolder.Path)
        For $i = 0 To 100
                If $o_Shell.GetDetailsOf($o_Shell.Items.Item($o_File.Name), $i) <> "" Then 
                        $Str = $Str & $o_Shell.GetDetailsOf(0, $i) & " " & $o_Shell.GetDetailsOf($o_Shell.Items.Item($o_File.Name), $i) & @CRLF
                EndIf
        Next
        Return $Str
        
EndFunc   ;==>_FileInfoGet