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

;�������Բ���Ԫ�ض���֧������Ԫ������
;_IEQuery(IE����,��ǩ��,�����б�,ƥ��ģʽ=1,��־ = true)
 
;��������ö��ŷָ�����ʹ��˫������������
;�ɹ� �����־Ϊtrue �����ҵ��ĵ�һ��Ԫ�ض���false����Ԫ�����飬$Eles[0]Ϊ�ҵ�Ԫ������
;ʧ�ܷ���0��������@errorֵ
;~ @error:
;~ 1 - ��Ч��������
;~ 2 - �Ҳ���Ԫ��
 
#include <WindowsConstants.au3>
#include "IEEX.au3"
Opt("GUIResizeMode",1)
Global $oIE = _IECreateEmbedded()
$gui = GUICreate("����", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://www.baidu.com/")
 GUISetState() ;��ʾ����
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;����
Local $Ele = _IEQuery($oIE,"INPUT",'id="kw1"')
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"INPUT",'value="�ٶ�һ��"')
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"A",'outerText="��Ϊ��ҳ"',2) ;����ƥ�䣬Ĭ����1��ȫƥ��
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"A",'outerText="hao\d+"',3) ;����ƥ��
MsgBox(64,"html",$Ele.outerhtml)
 
;���������ı���"�ٶ�"������
$Eles = _IEQuery($oIE,"A",'outerText="�ٶ�"',2,False) ;���һ������false�����ҵ�����Ԫ������
;~ $Eles[0] ����Ԫ�ظ���������ΪԪ��
For $i = 1 To $Eles[0]
        MsgBox(64,"html",$Eles[$i].outerhtml)
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
