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
#EndRegion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

$path = @ScriptDir & "\3.txt"
$newfile = StringTrimRight($path, 4) & '_ɾ������.txt'
If FileExists($newfile) Then FileDelete($newfile)
FileWrite($newfile, _nochongfu($path))
ShellExecute($newfile)
Func _nochongfu($path_txt);ȥ���ı�����
	If StringRight($path_txt, 4) <> '.txt' Then $path_txt &= '.txt'
	Local $file = FileOpen($path_txt, 0)
	Local $sTXT = FileRead($file)
	FileClose($file)
	$sTXT = StringRegExp($sTXT, '(?m)(?>\h*\S+)+', 3)
	Local $str_txt = ""
	For $i = 0 To UBound($sTXT) - 1
		If Not $sTXT[$i] = "" Then $str_txt &= $sTXT[$i] & @CRLF
	Next
	MsgBox(0,"",$str_txt)
	Return ($str_txt);ȥ���ı�����
EndFunc   ;==>_nochongfu
