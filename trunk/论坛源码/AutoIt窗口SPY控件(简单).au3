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
#include <WindowsConstants.au3>
#include <APIConstants.au3>
#include <WinAPI.au3>
#include "SpyControl.au3"

$Form1 = GUICreate("����SPY - �Զ�����Ϣ��ʾ", 419, 97, -1, -1)
$Label1 = GUICtrlCreateLabel("�����", 65, 10, 40, 17)
$Input1 = GUICtrlCreateInput("", 110, 8, 296, 21)
$Label2 = GUICtrlCreateLabel("���⣺", 65, 40, 40, 17)
$Input2 = GUICtrlCreateInput("", 110, 38, 296, 21)
$Label3 = GUICtrlCreateLabel("��꣺", 65, 70, 40, 17)
$Input3 = GUICtrlCreateInput("", 110, 68, 296, 21)
 
$Spy1 = GUICtrlCreateSpy($Form1, 15, 15, 32, 32)
GUIRegisterMsg($WM_MYSPYMSG, "WM_MYSPYMSG")
 
GUISetState(@SW_SHOW)
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
 
        EndSwitch
WEnd
 
Func WM_MYSPYMSG($hWnd, $nMsg, $wParam, $lParam)
        If $wParam <> 0 Then
                GUICtrlSetData($Input1, $wParam)
                GUICtrlSetData($Input2, WinGetTitle($wParam))
                Local $iX = _WinAPI_LoWord($lParam)
                Local $iY = _WinAPI_HiWord($lParam)
                GUICtrlSetData($Input3, $iX & "," & $iY)
        EndIf
EndFunc



