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
#include <GuiIPAddress.au3>

Example()

Func Example()
    Local $hGUI, $hGUI_Child
    Local $tab, $tab0, $tab1
    Local $hIPAddress, $aMsg

    $hGUI = GUICreate("IP Iab", 250, 180)

    $hGUI_Child = GUICreate("", 180, 70, 15, 35, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI)
    GUISetBkColor(0xFFffff, $hGUI_Child)
    $hIPAddress = _GUICtrlIpAddress_Create($hGUI_Child, 10, 10)
    GUISetState(@SW_HIDE)

    GUISwitch($hGUI)

    $tab = GUICtrlCreateTab(10, 10, 200, 100)

    $tab0 = GUICtrlCreateTabItem("tab0")
    GUICtrlCreateButton("OK", 20, 50, 50, 20)
    GUICtrlCreateInput("", 80, 50, 70, 20)

    $tab1 = GUICtrlCreateTabItem("tab1")

    GUICtrlCreateTabItem("")


    GUISetState()

    While 1

        $aMsg = GUIGetMsg(1)
        Switch $aMsg[0]
            Case $GUI_EVENT_CLOSE
                Exit
            Case $tab
                Switch GUICtrlRead($tab)
                    Case 0
                        GUISetState(@SW_HIDE, $hGUI_Child)
                    Case 1
                        GUISetState(@SW_SHOW, $hGUI_Child)
                EndSwitch
        EndSwitch
    WEnd
EndFunc 