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

#include <GUIConstants.au3>
#include <WindowsConstants.au3>

$oRDP = ObjCreate("Mstscax.Mstscax")
GUICreate("au3Զ���������Ӳ���", 640, 480, -1 , -1, $WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS)
$GUIActiveX = GUICtrlCreateObj($oRDP, 10, 10, 620, 460)
GUICtrlSetStyle ( $GUIActiveX, $WS_VISIBLE )
GUICtrlSetResizing ($GUIActiveX,$GUI_DOCKAUTO)

GUISetState()

$oRDP.Server = "218.25.87.2" 
$oRDP.Domain = "" 
$oRDP.UserName = "guest" 
$oRDP.AdvancedSettings2.ClearTextPassword = "demo888" 
$oRDP.FullScreen = False 
$oRDP.AdvancedSettings2.RedirectDrives = True 
$oRDP.AdvancedSettings2.RedirectPrinters = False 
$oRDP.AdvancedSettings2.RedirectPorts = False 
$oRDP.AdvancedSettings2.RedirectSmartCards = False 
$oRDP.ConnectingText = "���������� ...." 
$oRDP.AdvancedSettings2.EnableAutoReconnect = True
$oRDP.AdvancedSettings2.allowBackgroundInput = true
$oRDP.AdvancedSettings2.ConnectionBarShowRestoreButton = False
$oRDP.AdvancedSettings5.AudioRedirectionMode = 0
$oRDP.Connect()

While 1
$msg = GUIGetMsg()
Select
Case $msg = $GUI_EVENT_CLOSE
ExitLoop
EndSelect
WEnd

GUIDelete()

Exit