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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <IE.au3>
 
Global $Title = "ʷ�����������ĵ������", $URLClick = 0
 
_IEErrorHandlerRegister()
$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 800, 600, -1, -1, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button1 = GUICtrlCreateButton("����", 0, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button2 = GUICtrlCreateButton("ǰ��", 48, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button3 = GUICtrlCreateButton("ˢ��", 96, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button4 = GUICtrlCreateButton("��ҳ", 144, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateGraphic(197, 2, 2, 23, BitOR($SS_NOTIFY,$SS_SUNKEN))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateLabel("ת��:", 202, 7, 31, 17)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Input1 = GUICtrlCreateInput("http://www.google.com.hk/", 234, 2, 521, 21)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKRIGHT+$GUI_DOCKTOP+$GUI_DOCKHEIGHT)
$Button5 = GUICtrlCreateButton("Go >", 758, 0, 41, 25, 0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateObj($oIE, 0, 25, 800, 575)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
AdlibRegister("Timer")
 
_IENavigate($oIE, "http://baidu.com")
 
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
                        If MsgBox(1 + 32, $Title, "ȷ��Ҫ�˳���") = 1 Then
                                AdlibUnRegister()
                                Exit
                        EndIf
                Case $Button1
                        _IEAction($oIE, "back")
                Case $Button2
                        _IEAction($oIE, "forward")
                Case $Button3
                        _IEAction($oIE, "refresh")
                Case $Button4
                        _IENavigate($oIE, "http://www.google.cn")
                Case $Button5 
                        _IENavigate($oIE, GUICtrlRead($Input1))
                        $URLClick = 0
        EndSwitch
WEnd
 
Func Timer()
        $WinPos = WinGetPos($Form1)
        If $WinPos[2] < 415 Then WinMove($Form1, "", $WinPos[0], $WinPos[1], 415, $WinPos[3])
        If $WinPos[3] < 61 Then WinMove($Form1, "", $WinPos[0], $WinPos[1], $WinPos[2], 61)
        If WinGetTitle($Form1) <> _IEPropertyGet($oIE, "title") Then
                If _IEPropertyGet($oIE, "title") = "" Then
                        WinSetTitle($Form1, "", _IEPropertyGet($oIE, "locationurl") & " - " & $Title)
                Else
                        WinSetTitle($Form1, "", _IEPropertyGet($oIE, "title") & " - " & $Title)
                EndIf
        EndIf
        If GUICtrlRead($Input1) <> _IEPropertyGet($oIE, "locationurl") And $URLClick = 0 Then GUICtrlSetData($Input1, _IEPropertyGet($oIE, "locationurl"))
EndFunc