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
#include <file.au3>
_FileAndDirCreate(@DesktopDir & '\�½��ı��ĵ�.txt');�����ļ�
_FileAndDirCreate(@DesktopDir & '\�½��ļ���');�����ļ���

#include <file.au3>
;~ _FileAndDirCreate()
;===============================================================================
; ��������:   _FileAndDirCreate()
; ����:       �����ļ����ļ���
; �﷨:       _FileAndDirCreate($FilePach)
; ����:       $FilePach - �����ļ���·�����ļ���.
; ����:       _FileAndDirCreate('C:\Users\Administrator\Desktop\a.txt');�����ļ�
;             _FileAndDirCreate('C:\Users\Administrator\Desktop\a');�����ļ��� 
;
; ����:      lixiaolong - http://www.autoitx.com/
;===============================================================================
 
Func _FileAndDirCreate($FilePach)
        Dim $szDrive, $szDir, $szFName, $szExt
        $arrPath = _PathSplit($FilePach, $szDrive, $szDir, $szFName, $szExt)
        If Not FileExists($FilePach) Then
                If $szExt = '' Then
                        DirCreate($FilePach)
                Else
                        _FileCreate($FilePach)
                EndIf
        Else
                For $i = 1 To 1000
                        If Not FileExists($szDrive & $szDir & $szFName & '(' & $i & ')' & $szExt) Then ExitLoop
                Next
                If $szExt = '' Then
                        DirCreate($szDrive & $szDir & $szFName & '(' & $i & ')')
                Else
                        _FileCreate($szDrive & $szDir & $szFName & '(' & $i & ')' & $szExt)
                EndIf
        EndIf
EndFunc   ;==>_FileAndDirCreate
