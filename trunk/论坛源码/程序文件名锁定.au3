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

;����������
$name = "Զ������(chty40).exe"
_File_NameLock($name)
;$name = �������ĳ�����
;       �����ǰ�����������趨���ļ�����һ��
;       �˺������Զ���ԭ������
;       ע:ʹ��ʱ�ŵ� �����Ŀ�ͷ
;��ɫ��'s Blog  [url]www.JianYiIT.com[/url]
;                               2014/11/8 
Func _File_NameLock($name)
        If @ScriptName <> $name Then ;��������� ���� 
                Local $str = "@echo off" & @CRLF
                $str &= "ping -n 3 127.0.0.1>nul" & @CRLF ;��ʱ ��Լ3��
                $str &= 'ren "' & @ScriptName & '" '&$name & @CRLF ;���� ��ԭ������
                $str &= "ping -n 1 127.0.0.1>nul" & @CRLF ;��ʱ ��Լ1��
                $str &= "start "&$name & @CRLF ;�������� ����
                $str &= "del /f /q %0" & @CRLF ;ɾ����ʱ�ļ�
                $str &= "exit"
                Local   $file = @ScriptDir & "\"&$name&".ren.bat"
                FileDelete($file) ;Ԥɾ����ʱ�ļ�
                FileWrite($file, $str) ;д����ʱ�ļ�
                Run($file, "", @SW_HIDE) ;������ʱ�ļ�
                Exit ;�˳�
        EndIf
EndFunc   ;==>_File_NameLock
