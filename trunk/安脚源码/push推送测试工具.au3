#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\mail-outlook.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\push���Ͳ��Թ���.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.6
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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
#include <StaticConstants.au3>
#include <IE.au3>
 
Global $Title = "push���Ͳ��Թ���(��ʾ����IP��ַ�����������)"
 

$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 613, 561, -1, -1);, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button2 = GUICtrlCreateButton("ˢ��", 0, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateLabel("ע������:����1�κ������ˢ���ڲ���", 58, 7, 223, 17)
GUICtrlCreateLabel("����������ID��", 282, 7, 87, 17)
$Input1 = GUICtrlCreateInput("", 376, 2, 177, 21)
$Button1 = GUICtrlCreateButton("����", 560, 0, 49, 25)
GUICtrlCreateObj($oIE, 0, 25, 800, 561)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
 
_IENavigate($oIE, "http://50.16.231.7/iotc/pl/uid.html")
 
While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
						Exit
				Case $Button1	
						$Ele = _IEGetObjByName($oIE,"uid") ;ע����ͬname���,��Ҫ��������
						_IEFormElementSetValue($Ele,GUICtrlRead($Input1))		
                Case $Button2
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://50.16.231.7/iotc/pl/uid.html")
        EndSwitch
WEnd