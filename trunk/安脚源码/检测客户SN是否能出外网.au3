#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\mc.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\���ͻ�SN�Ƿ��ܳ�����.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.9
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
 
Global $Title = "���SN ID����(DVR����͵���ͬһ��������)"
 

$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 549, 562, -1, -1);, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button1 = GUICtrlCreateButton("��ַ1", 0, 0, 49, 25)
$Button2 = GUICtrlCreateButton("��ַ2", 56, 0, 49, 25)
$Button3 = GUICtrlCreateButton("��ַ3", 112, 0, 49, 25)
$Button4 = GUICtrlCreateButton("��ַ4", 168, 0, 49, 25)
$Label1 = GUICtrlCreateLabel("��ַ1-��ַ4����һ���ܳ�������IP��ַ����", 224, 8, 316, 17)
$IE = GUICtrlCreateObj($oIE, 0, 27, 800, 562)
GUICtrlSetState($IE, $GUI_DISABLE)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
 
;_IENavigate($oIE, "http://50.16.231.7/iotc/pl/uid.html")
 
While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
						Exit
					Case $Button1	
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.checkrealip.com")	
					Case $Button2
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.dynamic.zoneedit.com/checkip.htmll")	
					Case $Button3
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.networksecuritytoolkit.org/nst/tools/ip.php")
					Case $Button4
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.checkip.dyndns.org")				
;~ 					Case $Button5
;~ 						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
;~ 						_IENavigate($oIE, "http://www.anlian.co/queryinfo.php?DevID=" & GUICtrlRead($Input1))			
        EndSwitch
WEnd