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

#NoTrayIcon
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
$Form1 = GUICreate("ת������ͼƬ��ȡ����", 586, 589, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Edit1 = GUICtrlCreateEdit("", 10, 10, 565, 229)
$Edit2 = GUICtrlCreateEdit("", 10, 290, 555, 289)
$Button1 = GUICtrlCreateButton("ֻҪͼƬ", 90, 250, 75, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$Button2 = GUICtrlCreateButton("���ƽ��", 370, 250, 75, 25)
GUICtrlSetOnEvent(-1, "Button2Click")
GUISetState(@SW_SHOW)
While 1
        Sleep(100)
WEnd
Func Button1Click()
        $sss = StringRegExp(GUICtrlRead ($Edit1), '(?s)\[img\].*?\[\/img\]', 3)
        GUICtrlSetData ($Edit2,_ArrayToString ($sss,@CRLF&@CRLF))
EndFunc   ;==>Button1Click
Func Button2Click()
        ClipPut (GUICtrlRead ($Edit2))
EndFunc   ;==>Button2Click
Func Form1Close()
        Exit
EndFunc   ;==>Form1Close

