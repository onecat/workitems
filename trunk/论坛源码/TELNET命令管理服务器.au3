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

#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
TCPStartup()
GUICreate("Telnet�ͻ���", 500, 390, -1, -1, BitOr($WS_THICKFRAME, $WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU) )
$EDIT = GUICtrlCreateEdit("", 10, 10, 480, 330, $GUI_SS_DEFAULT_EDIT + $ES_READONLY)
GUICtrlSetFont(-1, 10, 0, -1, "Courier New")
GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)
$INPUT = GUICtrlCreateInput("", 10, 360, 480, 20)
GUICtrlSetResizing(-1, 582)
$HOSTI =InputBox("Telnet�ͻ���", "��������Ҫ���ӵ���������", "172.16.28.1")
$PORTI =InputBox("Telnet�ͻ���", "������˿ڵ�����", "23")
GUISetState()
ControlSend("Telnet�ͻ���", "", $EDIT, "{TAB}")
$HOST = TCPNameToIP($HOSTI)
$CONECTION = TCPConnect($HOST, $PORTI)
If @error Then Exit
While 1
    $MSG = GUIGetMsg()
    If $MSG = $GUI_EVENT_CLOSE And (MsgBox(36, "Telnet��¼", "�����Ҫ�˳�ô?") = 6) Then Exit
    $RECV = TCPRecv($CONECTION, 2048)
    If $RECV <> "" Then
        $RECV = StringReplace($RECV, @LF, @CRLF)
        $RECV = StringReplace($RECV, @CRLF & @CR, @CRLF)
        $TEXT = GUICtrlRead($EDIT)
        GUICtrlSetData($EDIT, $TEXT & $RECV)
        GUICtrlSendMsg($EDIT, 183, 0, 0)
    EndIf
    If $MSG = $INPUT Then
        $TEXT = GUICtrlRead($EDIT)
        $EINGABE = GUICtrlRead($INPUT)
        GUICtrlSetData($EDIT, $TEXT & $EINGABE & @CRLF)
        GUICtrlSetData($INPUT, "")
        TCPSend($CONECTION, $EINGABE & Chr(10))
        If @error Then
            MsgBox(0, "Telnet��¼", "���� - �˳�")
            Exit
        EndIf
        GUICtrlSendMsg($EDIT, 183, 0, 0)
    EndIf
WEnd

Func ONAUTOITEXIT()
    TCPCloseSocket($CONECTION)
    TCPShutdown()
EndFunc