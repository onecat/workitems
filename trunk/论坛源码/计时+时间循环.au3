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

#include <Date.au3>
#include <StaticConstants.au3>
 
Global $bState = True
 
GUICreate('��ʱ+ʱ��ѭ��', 300, 200)
GUICtrlCreateLabel('ϵͳʱ�䣺', 10, 10, 60, 50)
$Time = GUICtrlCreateLabel(_Now(), 70, 10)
 
$Label1 = GUICtrlCreateLabel('׼������', 10, 60, 280, 50, $SS_CENTER)
GUICtrlSetFont(-1, 15, 800, 0, '����_GB2312')
 
$Button1 = GUICtrlCreateButton('��ʼ', 40, 130, 100, 30)
$Button2 = GUICtrlCreateButton('��ͣ', 160, 130, 100, 30)
GUISetState()
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
                Case $Button1
                        $i = 1
                        AdlibRegister('cont', 1000)
                Case $Button2
                        If $bState = True Then
                                AdlibUnRegister('cont')
                                GUICtrlSetData($Label1, '��ͣ��' & $i & '��')
                                GUICtrlSetData($Button2, '����')
                                $bState = False
                        Else
                                $bState = True
                                GUICtrlSetData($Button2, '��ͣ')
                                AdlibRegister('cont', 1000)
                        EndIf
        EndSwitch
        
        If _Now() <> GUICtrlRead($Time) Then GUICtrlSetData($Time, _Now())
WEnd
 
Func cont()
        GUICtrlSetData($Label1, '�ѿ�ʼ' & $i & '��')
        $i += 1
EndFunc   ;==>cont
