#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiEdit.au3>
Global $Label1,$Label2,$Label3,$Label4
Global $caput_text = False,$Title,$Name0
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("*** ���Բ����� ***", 401, 170, (@DesktopWidth - 401) / 2, @DesktopHeight - 230)
	GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Edit1 = GUICtrlCreateEdit("", 2, 17, 396, 90, BitOR($ES_AUTOVSCROLL, $WS_HSCROLL, $WS_VSCROLL), _
		BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
	GUICtrlSetData(-1, "")
	GUICtrlSetOnEvent(-1, "Edit1Change")
$Input1 = GUICtrlCreateInput("���ڱ���", 8, 120, 185, 17)
$Input2 = GUICtrlCreateInput("�ؼ� ID", 208, 120, 185, 17)

$Label1 = GUICtrlCreateLabel("��� [����],�۲����ͣ��λ��", 5, 2, 390, 15, $SS_CENTER)
	GUICtrlSetColor(-1, 0xFF0000)
GUICtrlCreateLabel("ˮƽ:", 8, 150, 31, 17)
GUICtrlCreateLabel("��ֱ:", 112, 150, 31, 17)
$Input3 = GUICtrlCreateInput("15", 40, 147, 50, 17)
$Input4 = GUICtrlCreateInput("35", 144, 147, 50, 17)
$Button1 = GUICtrlCreateButton("�� ��", 256, 145, 50, 20)
	GUICtrlSetOnEvent(-1, "Button1Click")
$Button2 = GUICtrlCreateButton("ȷ ��", 336, 145, 50, 20)
	GUICtrlSetOnEvent(-1, "Button2Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Edit1Change()

EndFunc
Func Form1Close()
	Exit
EndFunc

Func Button1Click() ; [����] ��ť����;�ı��� '����' �� 'û��' ���л�
	If $caput_text = False Then _caput_text()
	$Title = GUICtrlRead($Input1);��ȡ���ڱ���
	$Name0 = GUICtrlRead($Input2);��ȡ�ؼ� ID
	GUICtrlSetState($Button2, $GUI_HIDE);����
	# ��ȡ $Button1 ��ť�ı�, ȷ����������
	Local $GetText = ControlGetText("*** ���Բ����� ***", "", $Button1)	
	If $GetText = '�� ��' Then
		$X = GUICtrlRead($Input3)
		$Y = GUICtrlRead($Input4)		
		$Title = $Title ;��Ϊ��װ����ı��⣡
		WinWait($Title, "")
		If Not WinActivate($Title, "") Then WinActivate($Title, "")
		WinWaitActive($Title, "")
		$WinPosArray = WinGetPos($Title)
		$TNewCheckListBoxArray = ControlGetPos($Title, "", $Name0)
		$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]
		$Height = $WinPosArray[1] + $TNewCheckListBoxArray[1]
		MouseClick("left", $Width + $X, $Height + $Y) ;ִ�������
		_enquiry_Ok();ת�� ����ѯ��
	ElseIf $GetText = 'δ����' Then
		_enquiry_Nay();ת�� ����ѯ��
	ElseIf $GetText = 'û����' Then
		WinClose("*** ���Բ����� ***");�ر��򵼴���
	EndIf
EndFunc   ;==>_Button1
Func Button2Click() ; [����] ��ť����;�ı��� 'ȷ��' �� '����' �� '����' ���л�
	# ��ȡ $Button2 ��ť�ı�, ȷ����������
	Local $GetText02 = ControlGetText("*** ���Բ����� ***", "", $Button2)
	If $GetText02 = 'ȷ ��' Then

	ElseIf $GetText02 = '������' Then
		$X = ""
		$Y = ""
		$X = GUICtrlRead($Input3)
		$Y = GUICtrlRead($Input4)
		_GUICtrlEdit_AppendText($Edit1, 'MouseClick ( "left", $Width + ' & $X & ', $Height + ' & $Y & ' )' & @CRLF);д�������༭��
		# �޸ı�ǩ01���ı�
		ControlSetText("*** ���Բ����� ***", "", $Label1, "����ѡ���������")
		# �޸� '����' ��ť�ı�
		ControlSetText("*** ���Բ����� ***", "", $Button2, "�� ��")
		# �޸� '����' ��ť�ı�
		ControlSetText("*** ���Բ����� ***", "", $Button1, "û����")
	ElseIf $GetText02 = '�� ��' Then
		# ���� $Input3 	$Label3 ˮƽ�������
		GUICtrlSetState($Input3, $GUI_HIDE);����
		GUICtrlSetState($Label3, $GUI_HIDE);����
		GUICtrlSetState($Button2, $GUI_HIDE);����
		# �޸� $Button1 Ϊ '����'
		ControlSetText("*** ���Բ����� ***", "", $Button1, "�� ��")
		_enquiry_Nay()
	EndIf
EndFunc   ;==>_Button2
Func _enquiry_Ok() ;��ť�ı� = ���� �ĵ���ѯ��
	;# �޸ı�ǩ01���ı�
	ControlSetText("*** ���Բ����� ***", "", $Label1, "������Ŀ������")
	# �޸� '����' ��ť�ı�
	ControlSetText("*** ���Բ����� ***", "", $Button1, "δ����")
	# ��ʾ 'ȷ��' ��ť
	GUICtrlSetState($Button2, $GUI_SHOW)
	ControlSetText("*** ���Բ����� ***", "", $Button2, "������")
EndFunc   ;==>_enquiry_Ok
Func _enquiry_Nay() ;��ť�ı� = û�� �ĵ���ѯ��
	# �޸� '����' ��ť�ı�
	ControlSetText("*** ���Բ����� ***", "", $Button1, "�� ��")
	# �޸ı�ǩ01���ı�
	ControlSetText("*** ���Բ����� ***", "", $Label1, "�ٴ������ʵ��Ĵ�ֱ����;��� [����]")
	# ��ʾ $Button2 ��ť
	GUICtrlSetState($Button2, $GUI_HIDE)
EndFunc   ;==>_enquiry_Nay
#EndRegion  "һ�ض�ѡ"
Func _caput_text()
	$Title = GUICtrlRead($Input1);��ȡ���ڱ���
	$Name0 = GUICtrlRead($Input2);��ȡ�ؼ� ID	
	GUICtrlSetData($Edit1, '	WinWait( "' & $Title & '" )' _
			 & @CRLF & '	If Not WinActivate ( "' & $Title & '","" ) Then WinActivate ( "' & $Title & '","" )' _
			 & @CRLF & '	WinWaitActive ( "' & $Title & '","" )' _
			 & @CRLF & '	$WinPosArray = WinGetPos ( "' & $Title & '" )' & @CRLF, 1)
	GUICtrlSetData($Edit1, '	$WinPosArray = WinGetPos ( "' & $Title & '" )' _
			 & @CRLF & '	$TNewCheckListBoxArray = ControlGetPos ( "' & $Title & '", "", ' & '"' & $Name0 & '" )' _
			 & @CRLF & '	$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]' _
			 & @CRLF & '	$Height =  $WinPosArray[1] + $TNewCheckListBoxArray[1]' & @CRLF, 1)
	$caput_text = True	
	;Button1Click()	
EndFunc	