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

#include <WindowsConstants.au3>
#include <EditConstants.au3>

Local $sDefault = "Ĭ��ֵ"
Global $NONEAACTIVECOLOR    = 0x989898
GUICreate('TEST', 420, 200)
$Input = GUICtrlCreateInput($sDefault, 10, 15, 400, 23)
GUICtrlSetColor(-1, $NONEAACTIVECOLOR)
;$Input = GUICtrlCreateInput("", 75, $tpos[1]+$tpos[3]+5, 80, 20, $ES_MULTILINE)
;GUICtrlSetStyle ( BitOR ($Input),$ES_MULTILINE)
$Edit =  GUICtrlCreateEdit('', 10, 50, 400, 140)
GUISetState()
GUIRegisterMsg($WM_COMMAND, "MY_WM_COMMAND")
Do
Until GUIGetMsg() == -3

Func MY_WM_COMMAND($hWnd, $msg, $wParam, $lParam)
        Local $nCode = BitShift($wParam, 16)
        Local $ID = BitAND($wParam, 0x0000FFFF)
                If $ID <>  $Input Then Return
        If $nCode = $EN_KILLFOCUS Then
                   If GUICtrlRead($Input) == '' Then GUICtrlSetData($Input, $sDefault)
            ElseIf $nCode = $EN_SETFOCUS Then
                   GUICtrlSetData($Input, '')
        EndIf
EndFunc