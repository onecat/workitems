#include <ACN_NET.au3>
;#include <StringMD5.au3>
;#include <StringEncrypt.au3>
#include <GuiConstants.au3>
#include <GuiIPAddress.au3>
#include <GuiEdit.au3>
#include <File.au3>
#include <Array.au3>
#include <Date.au3>
#include <MSSQL.au3>
#include <Crypt.au3>
#include <Process.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

Opt("MustDeclareVars", 1)
Opt("GUIOnEventMode", 1)

Global Const $g_szVersion = "ϵͳ������V1.1"
Global Const $g_szVersionnum = "V1.1C"
Global Const $gc_IniFile = @ScriptDir & "\Config.ini"


If WinExists($g_szVersion) Then
        MsgBox(0 + 16 + 0, $g_szVersion, _
                        "�����Ѿ������С� " & @CRLF & "����3����Զ��رա�", 3)
        Exit
EndIf
AutoItWinSetTitle($g_szVersion)





Global $gc_Copyright = " ר�ð�"


_main()


Func _main()
        #Region
        Global $PC_Form1 = GUICreate($g_szVersion, 300, 290, -1, -1)
        GUISetOnEvent($GUI_EVENT_CLOSE, "_SpecialEvents")
        Global $PC_MenuItem1 = GUICtrlCreateMenu("�˵�")
        Global $PC_MenuItem8 = GUICtrlCreateMenuItem("���ĵ�¼����", $PC_MenuItem1)
        GUICtrlSetState(-1, $GUI_FOCUS)
        Global $PC_MenuItem2 = GUICtrlCreateMenuItem("ϵͳ����", $PC_MenuItem1)
        Global $PC_MenuItem3 = GUICtrlCreateMenuItem("�˳�", $PC_MenuItem1)
        ; Global $PC_MenuItem6 = GUICtrlCreateMenu("����")
        ; Global $PC_MenuItem61 = GUICtrlCreateMenuItem("ά��ί���������", $PC_MenuItem6)
        ; Global $PC_MenuItem62 = GUICtrlCreateMenuItem("�������۵�������", $PC_MenuItem6)
        ; Global $PC_MenuItem63 = GUICtrlCreateMenuItem("������������", $PC_MenuItem6)
        Global $PC_MenuItem4 = GUICtrlCreateMenu("����")
        Global $PC_MenuItem5 = GUICtrlCreateMenuItem("���ڱ�����", $PC_MenuItem4)
        Global $PC_Group1 = GUICtrlCreateGroup("ϵͳ��Ϣ", 5, 5, 290, 45)
        Global $PC_Label1 = GUICtrlCreateLabel("��ǰ״̬��", 15, 25, 64, 20)
        Global $PC_Input1 = GUICtrlCreateInput("", 80, 20, 150, 20, $ES_READONLY)
        GUICtrlSetFont($PC_Input1, 8, 800, 0, "MS Sans Serif")
        Global $PC_Button = GUICtrlCreateButton("���", 240, 20, 45, 20)
        Global $PC_Group2 = GUICtrlCreateGroup("ϵͳ����", 5, 55, 290, 140)
        Global $PC_Button3 = GUICtrlCreateButton("ϵͳ����", 15, 70, 130, 35)
        Global $PC_Button2 = GUICtrlCreateButton("ϵͳ����", 155, 70, 130, 35)
        Global $PC_Button4 = GUICtrlCreateButton("����ERPϵͳ", 155, 110, 130, 35)
        Global $PC_Button8 = GUICtrlCreateButton("ͬ��ϵͳ�汾", 15, 110, 130, 35)
        Global $PC_Button1 = GUICtrlCreateButton("ϵ ͳ �� ��", 15, 150, 270, 35)

        Global $PC_Group4 = GUICtrlCreateGroup("ע��", 5, 200, 290, 35)
        Global $PC_Label2 = GUICtrlCreateLabel("���ע���ߵ�ǰ״̬��Ȼ�������ز�����", 15, 215, 270, 15)
        GUICtrlSetColor(-1, 0x808080)
        GUISetBkColor(0xFFFFFF)
        Local $PC_StatusBar1 = _GUICtrlStatusBar_Create($PC_Form1, -1, "", BitOR($WS_VISIBLE, $WS_CHILD), $WS_EX_STATICEDGE)
        Dim $PC_StatusBar1_PartsWidth[2] = [260, -1]
        _GUICtrlStatusBar_SetParts($PC_StatusBar1, $PC_StatusBar1_PartsWidth)
        _GUICtrlStatusBar_SetText($PC_StatusBar1, $gc_Copyright, 0)
        _GUICtrlStatusBar_SetText($PC_StatusBar1, $g_szVersionnum, 1)
        _GUICtrlStatusBar_SetMinHeight($PC_StatusBar1, 15)

        #EndRegion ### END Koda GUI section ###
        #Region SET_Form2
        Global $SET_Form2 = GUICreate("���ĵ�¼�ܳ�", 290, 245, -1, -1)
        GUISetOnEvent($GUI_EVENT_CLOSE, "_kamain")
        Global $SET2_MenuItem1 = GUICtrlCreateMenu("�˵�")
        Global $SET2_MenuItem2 = GUICtrlCreateMenuItem("����", $SET2_MenuItem1)
        GUICtrlSetState(-1, $GUI_FOCUS)
        Global $SET2_MenuItem3 = GUICtrlCreateMenuItem("����", $SET2_MenuItem1)
        Global $SET2_MenuItem4 = GUICtrlCreateMenu("����")
        Global $SET2_MenuItem7 = GUICtrlCreateMenuItem("���ڱ�����", $SET2_MenuItem4)
        Global $SET2_Label1 = GUICtrlCreateLabel("ԭ �� ��: ", 36, 16, 65, 20, $SS_CENTERIMAGE)
        Global $SET2_Input2 = GUICtrlCreateInput("", 105, 16, 150, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))
        Global $SET2_Label3 = GUICtrlCreateLabel("�� �� ��: ", 36, 48, 65, 20, $SS_CENTERIMAGE)
        Global $SET2_Input3 = GUICtrlCreateInput("", 105, 48, 150, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))
        Global $SET2_Label4 = GUICtrlCreateLabel("ȷ��������: ", 36, 80, 65, 20, $SS_CENTERIMAGE)
        Global $SET2_Input4 = GUICtrlCreateInput("", 105, 80, 150, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))
        Global $SET2_Button5 = GUICtrlCreateButton("����", 35, 115, 105, 25, $BS_MULTILINE)
        Global $SET2_Button6 = GUICtrlCreateButton("����", 150, 115, 105, 25, $BS_MULTILINE)
        Global $SET2_Group4 = GUICtrlCreateGroup("ע��", 5, 150, 280, 40)
        Global $SET2_Label33 = GUICtrlCreateLabel("���벻��Ϊ�գ����Ȳ��ܵ���6λ��", 10, 165, 270, 20, $SS_CENTERIMAGE)
        GUICtrlSetColor(-1, 0xFF0000)
        GUISetBkColor(0xFFFFFF)
        Global $SET_StatusBar2 = _GUICtrlStatusBar_Create($SET_Form2)
        Dim $SET_StatusBar2_PartsWidth[2] = [260, -1]
        _GUICtrlStatusBar_SetParts($SET_StatusBar2, $SET_StatusBar2_PartsWidth)
        _GUICtrlStatusBar_SetText($SET_StatusBar2, $gc_Copyright, 0)
        _GUICtrlStatusBar_SetText($SET_StatusBar2, $g_szVersionnum, 1)
        _GUICtrlStatusBar_SetMinHeight($SET_StatusBar2, 15)
        #EndRegion SET_Form2

        #Region SET_Form1
        Global $SET_Form1 = GUICreate("SQL���Ӳ�������", 290, 245, -1, -1)
        GUISetOnEvent($GUI_EVENT_CLOSE, "_kamain")
        Global $SET_MenuItem1 = GUICtrlCreateMenu("�˵�")
        Global $SET_MenuItem2 = GUICtrlCreateMenuItem("��������", $SET_MenuItem1)
        GUICtrlSetState(-1, $GUI_FOCUS)
        Global $SET_MenuItem3 = GUICtrlCreateMenuItem("����", $SET_MenuItem1)
        Global $SET_MenuItem4 = GUICtrlCreateMenu("����")
        Global $SET_MenuItem7 = GUICtrlCreateMenuItem("���ڱ�����", $SET_MenuItem4)
        GUISetBkColor(0xFFFFFF)
        Global $SET_StatusBar1 = _GUICtrlStatusBar_Create($SET_Form1)
        Dim $SET_StatusBar1_PartsWidth[2] = [260, -1]
        _GUICtrlStatusBar_SetParts($SET_StatusBar1, $SET_StatusBar1_PartsWidth)
        _GUICtrlStatusBar_SetText($SET_StatusBar1, $gc_Copyright, 0)
        _GUICtrlStatusBar_SetText($SET_StatusBar1, $g_szVersionnum, 1)
        _GUICtrlStatusBar_SetMinHeight($SET_StatusBar1, 15)
        Global $SET_Group1 = GUICtrlCreateGroup("SQL���Ӳ�������", 8, 8, 275, 130)

        Global $SET_Label1 = GUICtrlCreateLabel("SQL������IP��ַ: ", 16, 24, 105, 20, $SS_CENTERIMAGE)
        Global $IPAddress1 = _GUICtrlIpAddress_Create($SET_Form1, 120, 24, 120, 20)
        _GUICtrlIpAddress_Set($IPAddress1, "127.0.0.1")

        Global $SET_Label2 = GUICtrlCreateLabel("SQL�������û���: ", 16, 52, 105, 20, $SS_CENTERIMAGE)
        Global $SET_Input2 = GUICtrlCreateInput("", 120, 52, 80, 20)

        Global $SET_Label3 = GUICtrlCreateLabel("SQL����������: ", 16, 80, 105, 20, $SS_CENTERIMAGE)
        Global $SET_Input3 = GUICtrlCreateInput("", 120, 80, 80, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))

        Global $SET_Label4 = GUICtrlCreateLabel("SQL���ݿ���: ", 16, 108, 105, 20, $SS_CENTERIMAGE)
        Global $SET_Input4 = GUICtrlCreateInput("", 120, 108, 80, 20)
        Global $SET_Label5 = GUICtrlCreateLabel("tds_dserp", 210, 108, 60, 20, $SS_CENTERIMAGE)
        Global $SET_Group2 = GUICtrlCreateGroup("", 8, 142, 275, 30)
        Global $SET_Label33 = GUICtrlCreateLabel("����Ķ��������ã�������������ϵ�������Ա��", 16, 150, 260, 20, $SS_CENTERIMAGE)
        GUICtrlSetColor(-1, 0xFF0000)
        Global $SET_Button6 = GUICtrlCreateButton("���SQL", 20, 174, 60, 25, $BS_MULTILINE)
        Global $SET_Button4 = GUICtrlCreateButton("����", 150, 174, 60, 25, $BS_MULTILINE)
        Global $SET_Button5 = GUICtrlCreateButton("����", 215, 174, 60, 25, $BS_MULTILINE)
        #EndRegion SET_Form1
        Local $GP_SETTXT1 = IniRead($gc_IniFile, "SETUP", "Sqlip", "")
        Local $GP_SETTXT2 = IniRead($gc_IniFile, "SETUP", "Sqluser", "")
        Local $GP_SETTXT3B = IniRead($gc_IniFile, "SETUP", "SqlPw", "")

        Local $GP_SETTXT4 = IniRead($gc_IniFile, "SETUP", "Sqlname", "")


        GUICtrlSetData($SET_Input4, $GP_SETTXT4)
        GUICtrlSetOnEvent($PC_Button, "_kamain")
        GUICtrlSetOnEvent($PC_Button1, "_kamain")
        GUICtrlSetOnEvent($PC_Button2, "_kamain")
        GUICtrlSetOnEvent($PC_Button3, "_kamain")
        GUICtrlSetOnEvent($PC_Button4, "_kamain")
        GUICtrlSetOnEvent($PC_Button8, "_kamain")
        GUICtrlSetOnEvent($PC_MenuItem2, "_kamain")
        GUICtrlSetOnEvent($PC_MenuItem3, "_kamain")
        GUICtrlSetOnEvent($PC_MenuItem5, "_kamain")
        ; GUICtrlSetOnEvent($PC_MenuItem6, "_kamain")
        ; GUICtrlSetOnEvent($PC_MenuItem61, "_kamain")
        ; GUICtrlSetOnEvent($PC_MenuItem62, "_kamain")
        ; GUICtrlSetOnEvent($PC_MenuItem63, "_kamain")
        GUICtrlSetOnEvent($PC_MenuItem8, "_kamain")
        GUICtrlSetOnEvent($SET_Button6, "_kamain")
        GUICtrlSetOnEvent($SET_Button4, "_kamain")
        GUICtrlSetOnEvent($SET_Button5, "_kamain")
        GUICtrlSetOnEvent($SET_MenuItem2, "_kamain")
        GUICtrlSetOnEvent($SET_MenuItem3, "_kamain")
        GUICtrlSetOnEvent($SET_MenuItem7, "_kamain")
        GUICtrlSetOnEvent($SET2_Button5, "_kamain")
        GUICtrlSetOnEvent($SET2_Button6, "_kamain")
        GUICtrlSetOnEvent($SET2_MenuItem2, "_kamain")
        GUICtrlSetOnEvent($SET2_MenuItem3, "_kamain")
        GUICtrlSetOnEvent($SET2_MenuItem7, "_kamain")
        _checkitem()
        GUISwitch($PC_Form1)
        GUISetState(@SW_SHOW)

        While 1
                Sleep(1000)
        WEnd
        GUIDelete()
EndFunc   ;==>_main

Func _SpecialEvents()
        Exit
EndFunc   ;==>_SpecialEvents

Func _kamain()
        Switch @GUI_CtrlId

                Case $PC_MenuItem3
                        Exit
        EndSwitch
EndFunc   ;==>_kamain



Func _checkitem()
        Local $FileData1 = "D:\app\dapp.exe"
        If FileExists($FileData1) Then
                _Crypt_Startup()
                Local $filemd5 = StringUpper(_Crypt_HashFile($FileData1, $CALG_MD5))
                _Crypt_Shutdown()
                If $filemd5 = '0XCC4BC4C3630BD321640D1BC1579A13BF' Then
                        GUICtrlSetData($PC_Input1, "�����ڲ���ģʽ...")
                        GUICtrlSetColor($PC_Input1, 0x0000FF)
                Else
                        GUICtrlSetData($PC_Input1, "������ҵ��ģʽ...")
                        GUICtrlSetColor($PC_Input1, 0x008000)
                EndIf
        Else
                GUICtrlSetData($PC_Input1, "ϵͳ��װ����ȷ...")
                GUICtrlSetColor($PC_Input1, 0xFF0000)
        EndIf
EndFunc   ;==>_checkitem
