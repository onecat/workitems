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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

HotKeySet("{PGUP}", "Start")

GUICreate("", 201, 301, -1, -1, 0, BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST))
$Radio1 = GUICtrlCreateRadio("Radio1", 8, 48, 81, 17)
$Radio2 = GUICtrlCreateRadio("Radio2", 8, 72, 81, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", 8, 96, 81, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Checkbox2", 8, 120, 81, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Checkbox3", 8, 144, 81, 17)
GUISetState(@SW_SHOW)

While 1
        GUIGetMsg()
WEnd

Func start()
        AdlibRegister('SendF2', 20 * 1000)
        GUISetState(@SW_HIDE)
        While 1
                If BitAND(GUICtrlRead($Radio2), $GUI_CHECKED) = $GUI_CHECKED Then
                        Send("^{TAB}")
                        Sleep(500)
                        Send("{F1}")
                        Sleep(500)
                EndIf
        WEnd
EndFunc   ;==>start

Func SendF2()
        If BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) = $GUI_CHECKED Then Send("{F2}")
EndFunc   ;==>SendF2