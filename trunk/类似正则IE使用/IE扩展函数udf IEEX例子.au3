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
#include "IEEX.au3"
Opt("GUIResizeMode", 1)
;�޸��û���������
Global $username = ""
Global $password = ""
Global $oIE = _IECreateEmbedded()
Global $gui = GUICreate("����", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
GUICtrlCreateObj($oIE, 0, 0, 700, 600)
_IENavigate($oIE, "http://www.autoitx.com/")
GUISetState() ;��ʾ����
GUIRegisterMsg($WM_SYSCOMMAND, "WM_SYSCOMMAND")
 
;��¼
Local $Ele = _IEQuery($oIE, "A", 'OuterText="��¼"')
If IsObj($Ele) Then ; û�ж����Ѿ���¼
        _IEAction($Ele, "click")
        $Ele = _IEWaitEle($oIE, "username")
        $Ele.value = $username
        $Ele = _IEWaitEle($oIE, "password3")
        $Ele.value = $password
        $Ele = _IEWaitEle($oIE, "loginsubmit")
        _IEAction($Ele, "click")
EndIf
 
;����
$Ele = _IEWaitEle($oIE, "mn_search")
_IEAction($Ele, "click")
$Ele = _IEWaitEle($oIE, "srchtxt")
$Ele.value = "IEEX"
$Ele = _IEWaitEle($oIE,"searchsubmit")
_IEAction($Ele, "click") ;����
_IELoadWait($oIE,1000)
$Ele = _IEQuery($oIE,"A",'OuterText="IE��չ����"',2) ;ע�����һ������ʹ�ò���ƥ��
_IEAction($Ele, "click")
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536 ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc   ;==>WM_SYSCOMMAND

