#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\recycle full.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\���������.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_requestedExecutionLevel=requireAdministrator
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
 
Global $Title = "�����ֻ�����ͻ�pushע�ᵽ������", $URLClick = 0
 
$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 679, 244, -1, -1, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
GUICtrlCreateLabel("����������ID:", 10, 7, 87, 17)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Input1 = GUICtrlCreateInput("", 98, 2, 513, 21)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKRIGHT+$GUI_DOCKTOP+$GUI_DOCKHEIGHT)
$Button5 = GUICtrlCreateButton("�鿴 >", 614, 0, 65, 25, 0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateObj($oIE, 0, 25, 800, 244)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 


 
While 1
        $MouseInfo = GUIGetCursorInfo($Form1)
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] = $Input1 Then $URLClick = 1
        EndIf
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] <> $Input1 And $MouseInfo[4] <> $Button5 Then $URLClick = 0
        EndIf
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
                                Exit
				Case $Button5 
                        _IENavigate($oIE, "http://121.199.60.164/tpns/apns.php?cmd=reg_mapping&token=a3dc0053a361eb8192904d3d407f8a09e169c5978ff1d24d8b021e7157433b29&uid=" & GUICtrlRead($Input1) & "&appid=com.lttkrx.push")
                        $URLClick = 0
        EndSwitch
WEnd
 
