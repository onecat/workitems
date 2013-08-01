#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
TCPStartup()
GUICreate("Telnet客户端", 500, 390, -1, -1, BitOr($WS_THICKFRAME, $WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU) )
$EDIT = GUICtrlCreateEdit("", 10, 10, 480, 330, $GUI_SS_DEFAULT_EDIT + $ES_READONLY)
GUICtrlSetFont(-1, 10, 0, -1, "Courier New")
GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)
$INPUT = GUICtrlCreateInput("", 10, 360, 480, 20)
GUICtrlSetResizing(-1, 582)
$HOSTI =InputBox("Telnet客户端", "请输入您要连接到的主机名", "172.16.28.1")
$PORTI =InputBox("Telnet客户端", "请输入端口的主机", "23")
GUISetState()
ControlSend("Telnet客户端", "", $EDIT, "{TAB}")
$HOST = TCPNameToIP($HOSTI)
$CONECTION = TCPConnect($HOST, $PORTI)
If @error Then Exit
While 1
    $MSG = GUIGetMsg()
    If $MSG = $GUI_EVENT_CLOSE And (MsgBox(36, "Telnet登录", "你真的要退出么?") = 6) Then Exit
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
            MsgBox(0, "Telnet登录", "错误 - 退出")
            Exit
        EndIf
        GUICtrlSendMsg($EDIT, 183, 0, 0)
    EndIf
WEnd

Func ONAUTOITEXIT()
    TCPCloseSocket($CONECTION)
    TCPShutdown()
EndFunc