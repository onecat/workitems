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
#include <SliderConstants.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars',1)

Global $gu_Form1 = GUICreate('Demo', 363, 157, -1, -1)
Global $gu_Slider1 = GUICtrlCreateSlider(16, 96, 329, 25)

Global $g_Trans, $g_TransOld

_Main()
Exit

Func _Main()
        AdlibRegister('_SetTrans', 20)
        
        GUICtrlSetLimit($gu_Slider1, 255, 0)
        GUICtrlSetData($gu_Slider1, 255)
        
        GUISetState(@SW_SHOW)        
        
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit

                EndSwitch
        WEnd
        
EndFunc   ;==>_Main

Func _SetTrans()
        $g_Trans = GUICtrlRead($gu_Slider1)
        If $g_Trans <> $g_TransOld Then
                $g_TransOld = $g_Trans
                WinSetTrans($gu_Form1, '', $g_Trans)
        EndIf
EndFunc   ;==>_SetTrans
