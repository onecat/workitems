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

#include <INet.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ACN_NET.au3>
 
$ip = _GetIP ( )
$ip1 = @IPAddress1
$ip2 = @IPAddress2
$mac1 = _API_Get_NetworkAdapterMAC (@IPAddress1)
$mac2 = _API_Get_NetworkAdapterMAC (@IPAddress2)               
$CPname = @ComputerName
$UserName = @UserName

$Form1_1 = GUICreate("��ȡ������IP", 328, 255, 365, 331)
$Group1 = GUICtrlCreateGroup("", 8, 3, 313, 245)
$Label1 = GUICtrlCreateLabel("����IP��ַ��", 24, 100, 74, 17)
$Label2 = GUICtrlCreateLabel("��������1 IP��ַ��", 24, 136, 128, 17)
$Label3 = GUICtrlCreateLabel("��������1 MAC��", 24, 192, 90, 17)
$Input1 = GUICtrlCreateInput($ip, 112, 96, 169, 21)
$Input2 = GUICtrlCreateInput($ip1, 24, 160, 129, 21)
$Input3 = GUICtrlCreateInput($mac1, 24, 216, 129, 21)
$Label4 = GUICtrlCreateLabel("��������2 IP��ַ��", 176, 136, 128, 17)
$Label5 = GUICtrlCreateLabel("��������2 MAC��", 176, 192, 90, 17)
$Input4 = GUICtrlCreateInput($ip2, 176, 160, 129, 21)
$Input5 = GUICtrlCreateInput($mac2, 176, 216, 129, 21)
$Label6 = GUICtrlCreateLabel("�������ƣ�", 25, 37, 68, 17)
$Input6 = GUICtrlCreateInput($CPname, 112, 32, 121, 21)
$Label7 = GUICtrlCreateLabel("��ǰ��¼�û���", 24, 68, 88, 17)
$Input7 = GUICtrlCreateInput($UserName, 112, 64, 121, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
	WEnd
	
