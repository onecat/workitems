#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=C:\Users\ilv\Desktop\www.28lu.com\Form1.kxf
Local $hStatus
Global $gc_Copyright = " ������"
$Form1 = GUICreate("Form1", 482, 322, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "Form1PRIMARYDOWN")
;~ $GUI_EVENT_CLOSE ---------- ���ڹر�
;~ $GUI_EVENT_MINIMIZE ------- ������С��
;~ $GUI_EVENT_RESTORE -------- ���ڻ�ԭ
;~ $GUI_EVENT_MAXIMIZE ------- �������
;~ $GUI_EVENT_PRIMARYDOWN ---- ����������
;~ $GUI_EVENT_PRIMARYUP ------ �������ͷ�
;~ $GUI_EVENT_SECONDARYDOWN -- ����Ҽ�����
;~ $GUI_EVENT_SECONDARYUP ---- ����Ҽ��ͷ�
;~ $GUI_EVENT_MOUSEMOVE ------ ����ƶ�
;~ $GUI_EVENT_RESIZED -------- ������С
;~ $GUI_EVENT_DROPPED -------- �϶�����

$input1 = GUICtrlCreateInput("�������ַ��ID", 22, 16, 369, 21)
GUICtrlSetColor(-1, 0x800080)
;GUICtrlSetOnEvent(-1, "input1Change")
$Button1 = GUICtrlCreateButton("����", 415, 14, 41, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
;$StatusBar1 = _GUICtrlStatusBar_Create($Form1);,200,"������",$SBARS_TOOLTIPS)
;~ _GUICtrlStatusBar_SetSimple($StatusBar1)
;~ _GUICtrlStatusBar_SetText($StatusBar1, "������")
;~ _GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)
$MenuItem0 = GUICtrlCreateMenu("ѡ��(&Z)")
$MenuItem1 = GUICtrlCreateMenuItem("������������", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem2 = GUICtrlCreateMenuItem("�������", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("����", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$ListView1 = GUICtrlCreateListView("", 12, 56, 457, 217, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
_GUICtrlListView_AddColumn($ListView1, "����id", 70);�����
_GUICtrlListView_AddColumn($ListView1, "Դ��ַ", 280)
_GUICtrlListView_AddColumn($ListView1, "״̬", 100)
;~ $a=_GUICtrlListView_AddItem($ListView1,"test");�����Ŀ
;~ _GUICtrlListView_AddSubItem($ListView1,$a,"test",2);�������Ŀ
GUICtrlSetOnEvent(-1, "ListView1Click")

  Local $PC_StatusBar1 = _GUICtrlStatusBar_Create($Form1, -1, "", BitOR($WS_VISIBLE, $WS_CHILD), $WS_EX_STATICEDGE)
        Dim $PC_StatusBar1_PartsWidth[2] = [260, -1]
        _GUICtrlStatusBar_SetParts($PC_StatusBar1, $PC_StatusBar1_PartsWidth)
        _GUICtrlStatusBar_SetText($PC_StatusBar1, $gc_Copyright, 0)
       ; _GUICtrlStatusBar_SetText($PC_StatusBar1, $g_szVersionnum, 1)
        _GUICtrlStatusBar_SetMinHeight($PC_StatusBar1, 15)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Button1Click()

EndFunc   ;==>Button1Click
Func Form1PRIMARYDOWN()
	$Pos = GUIGetCursorInfo($Form1);��ȡ���λ��
	If $Pos[4] = $input1 And GUICtrlRead($input1) = "�������ַ��ID" Then
		GUICtrlSetData($input1, "")
	EndIf

EndFunc   ;==>Form1PRIMARYDOWN
Func Form1Close()

	Exit
EndFunc   ;==>Form1Close
Func ListView1Click()

EndFunc   ;==>ListView1Click
Func MenuItem1Click()

EndFunc   ;==>MenuItem1Click
Func MenuItem2Click()

EndFunc   ;==>MenuItem2Click
Func MenuItem3Click()

EndFunc   ;==>MenuItem3Click

