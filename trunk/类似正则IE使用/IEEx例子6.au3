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

;~ ������������ɼ���Χ
;~ _IEscrollIntoView(Ԫ�ض���,$bAlignToTop = False)
;~ $bAlignToTop = True �������е����ڶ���,$bAlignToTop = False ���ڵײ�
 
;~ �ɹ�����1,ʧ�ܷ���0������@errorֵ
;~ @error = 1 ��Ч��������
 
#include <WindowsConstants.au3>
#include <IEEX.au3>
Opt("GUIResizeMode",1)
 
Global $oIE = _IECreateEmbedded()
Global $hGui = GUICreate("����", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://www.autoitx.com/")
 GUISetState() ;��ʾ����
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;����"���BUG������"���
$Ele = _IEQuery($oIE,"A",'outertext="�� ���BUG������ ��"') 
_IEScrollIntoView($Ele) ;Ĭ�Ͻ������е����ڶ���
 
Sleep(2000)
 
$Ele = _IEQuery($oIE,"DIV",'class="sidebox",outertext="��Ծ��Ա',2) ;����ƥ��, ��Ծ��Ա���
MsgBox(0,"",$Ele.outerhtml)
_IEScrollIntoView($Ele,False) ;�������е����ڵײ�
 
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536  ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc
