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
;~ ģ����������
;~ _IEScrollClick(��������������, ģ��Ķ���)
;~ ģ��Ķ�����
;~ scrollbarHThumb Horizontal scroll thumb or box is at the specified location.
;~ scrollbarLeft Left scroll arrow is at the specified location.
;~ scrollbarPageDown Page-down scroll bar shaft is at the specified location.
;~ scrollbarPageLeft Page-left scroll bar shaft is at the specified location.
;~ scrollbarPageRight Page-right scroll bar shaft is at the specified location.
;~ scrollbarPageUp Page-up scroll bar shaft is at the specified location.
;~ scrollbarRight Right scroll arrow is at the specified location.
;~ scrollbarUp Up scroll arrow is at the specified location.
;~ scrollbarVThumb Vertical scroll thumb or box is at the specified location.
;~ down Composite reference to scrollbarDown.
;~ left Composite reference to scrollbarLeft.
;~ pageDown Composite reference to scrollbarPageDown.
;~ pageLeft Composite reference to scrollbarPageLeft.
;~ pageRight Composite reference to scrollbarPageRight.
;~ pageUp Composite reference to scrollbarPageUp.
;~ right Composite reference to scrollbarRight.
;~ up Composite reference to scrollbarUp.
 
#include <WindowsConstants.au3>
#include <IEEX.au3>
Opt("GUIResizeMode",1)
 
Global $oIE = _IECreateEmbedded()
Global $hGui = GUICreate("����", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://au3.cc/")
 GUISetState() ;��ʾ����
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;ģ��������������5��
Local $doc = $oIE.document.documentElement
For $i = 1 To 5
        Sleep(1000)
         _IEScrollClick($doc,"down")
Next
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536  ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc

