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
Local $str, $n
$Form1 = GUICreate("����", 615, 438, 192, 124)
$Input1 = GUICtrlCreateInput("[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}", 120, 340, 305, 21)
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 280)
GUICtrlSetData(-1,bb())
$Button1 = GUICtrlCreateButton("����", 160, 384, 273, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			zz($str,$n)
			MsgBox(0, "ת�������ʶ��Ӧ��",$str)
	EndSwitch
WEnd

Func zz(ByRef $str, ByRef $n)
	Local $str1 = bb (), $str2 = GUICtrlRead($Input1)
			If StringRegExp($str1, $str2) Then;�Ӹ��ж� ��ֹ��ƥ��ʱֱ���˳�
				$h = StringRegExp($str1, $str2, 3);����������ѡ��3 ��ȫ��ƥ��  ���ص�������
				;_ArrayDisplay($h);�б���ͼ�鿴���� ���ڵ���
				;ConsoleWrite($h[0]);��������ı�  ���ڵ���
				;MsgBox(0, "", $h[0])
			Else
				MsgBox(0, "", "��ƥ��")
			EndIf
				For $n=0 To UBound($h)-1
			$str &=$h[$n] & @CRLF 
	    Next
		;Return $str	
EndFunc		

Func bb()
$string = _ 
'12345678546456459' & @CRLF & _
'44.654.544.15' & @CRLF & _
'12345678546456459' & @CRLF & _
'5678546451234567854' & @CRLF & _
'251.2.154.157'
Return $string
EndFunc
