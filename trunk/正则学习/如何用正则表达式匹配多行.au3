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
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#Region ### START Koda GUI section ### Form=
Local $str
$path =@ScriptDir &  "\1.txt"
$Form1 = GUICreate("����", 615, 438, 192, 124)
;$Input1 = GUICtrlCreateInput("[A-Z]", 120, 340, 305, 21)
;$Input1 = GUICtrlCreateInput("[a-z]", 120, 340, 305, 21)
;$Input1 = GUICtrlCreateInput("[-A-Z]", 120, 340, 305, 21)
$Input1 = GUICtrlCreateInput("<type>sign</type>[^.]+<srcip>(\S+)</srcip>[^.]+<dstip>(\S+)</dstip>[^.]+<srcport>(\d+)</srcport>[^.]+<dstport>(\d+)</dstport>[^.]+<protocol>(\w+)</protocol>[^.]+<time>(\S+ \S+)</time>[^.]+<engine>(\S+)</engine>[^.]+<digest>(\S+)</digest>", 120, 340, 305, 21)
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 280)
GUICtrlSetData(-1, bb($path))
$Button1 = GUICtrlCreateButton("����", 160, 384, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			zz()
			MsgBox(0,"���ַ��ͷ�Χ������",$str)
	EndSwitch
WEnd

Func bb($iDIR)
	$sFile = FileOpen($iDIR,0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc	

Func zz()
	$str = ""
	Local $str1 = bb ($path), $str2 = GUICtrlRead($Input1)
			If StringRegExp($str1, $str2) Then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
				$h = StringRegExp($str1, $str2, 3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
				;_ArrayDisplay($h);�б���ͼ�鿴���� ���ڵ���
				;ConsoleWrite($h[0]);��������ı�  ���ڵ���
				;MsgBox(0, "", $h[0])
				;Return $h[0]
			Else
				MsgBox(0, "", "��ƥ��")
			EndIf
		For $n=0 To UBound($h)-1
			$str &=$h[$n] ;& @CRLF 	
		Next	
EndFunc			