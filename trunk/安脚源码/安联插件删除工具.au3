#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\ccleaner.ico
#PRE_Outfile=�������ɾ������.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.3
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
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("�������ɾ������", 368, 146, 192, 124)
$Group1 = GUICtrlCreateGroup("�������²��ɾ������", 8, 16, 349, 65)
$Checkbox1 = GUICtrlCreateCheckbox("DVR UI1.0+UI2.0", 16, 40, 113, 17)
$Checkbox2 = GUICtrlCreateCheckbox("DVR UI3.0", 136, 40, 73, 17)
$Checkbox3 = GUICtrlCreateCheckbox("NVR", 224, 40, 49, 17)
$Checkbox4 = GUICtrlCreateCheckbox("WebCMS", 280, 40, 65, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("ȷ��", 56, 96, 89, 33)
$Button2 = GUICtrlCreateButton("�˳�", 224, 96, 89, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			IE()
		Case $Button2
			Exit		
	EndSwitch
WEnd

Func IE()
If ProcessExists("iexplore.exe") Then ; Check if the Notepad process is running.
	$MSGcheck = MsgBox(32 + 1, "��⵽IE���̴���", "���ȷ�Ϲرս��̼�������ɾ�����" & @CRLF & "���ȡ���˳�ɾ���������")
	If $MSGcheck = 1 Then
		ProcessClose("iexplore.exe")
		CHBOX()
	Else
		Exit
	EndIf
Else
	CHBOX()
EndIf

EndFunc



Func CHBOX()
If GUICtrlRead($Checkbox1) = $GUI_UNCHECKED And GUICtrlRead($Checkbox2)  = $GUI_UNCHECKED And GUICtrlRead($Checkbox3)  = $GUI_UNCHECKED  And GUICtrlRead($Checkbox4) = $GUI_UNCHECKED Then MsgBox(0,"��ʾ","����Ҫ��ѡһ�����ɾ��")  
;If GUICtrlRead($Checkbox1) Or GUICtrlRead($Checkbox2) Or GUICtrlRead($Checkbox3) Or GUICtrlRead($Checkbox4) = $GUI_UNCHECKED Then MsgBox(0,"1","1")  
If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then DVR1()
If GUICtrlRead($Checkbox2) = $GUI_CHECKED Then DVR2()
If GUICtrlRead($Checkbox3) = $GUI_CHECKED Then NVR()
If GUICtrlRead($Checkbox4) = $GUI_CHECKED Then WebCMS()
EndFunc


Func DVR1()
If FileExists(@AppDataDir & "\OCX_DVR1") Then
    DirRemove (@AppDataDir & "\OCX_DVR1",1) 
	DVR1_1()
Else
    MsgBox(4096,"DVR UI1.0+UI2.0", "DVR UI1.0+UI2.0���������")
EndIf
EndFunc

Func DVR2()
If FileExists(@AppDataDir & "\OCX_DVR2") Then
    DirRemove (@AppDataDir & "\OCX_DVR2",1)
	DVR2_1()
Else
    MsgBox(4096,"DVR UI3.0", "DVR UI3.0���������")
EndIf
EndFunc

;~ Func DVR3()
;~ If FileExists(@AppDataDir & "\OCX_DVR3") Then
;~     DirRemove (@AppDataDir & "\OCX_DVR3",1) 
;~ 	DVR3_1()
;~ Else
;~     MsgBox(4096,"DVR3", "DVR3���������")
;~ EndIf
;~ EndFunc

Func NVR()
If FileExists(@AppDataDir & "\OCX_NVR") Then
    DirRemove (@AppDataDir & "\OCX_NVR",1) 
	NVR_1()
Else
    MsgBox(4096,"NVR", "NVR���������")
EndIf
EndFunc

Func WebCMS()
If FileExists(@AppDataDir & "\OCX_WebCMS") Then
    DirRemove (@AppDataDir & "\OCX_WebCMS",1) 
	WebCMS_1()
Else
    MsgBox(4096,"WebCMS", "WebCMS���������")
EndIf
EndFunc

Func DVR1_1()
If FileExists(@AppDataDir & "\OCX_DVR1") Then
	MsgBox(4096,"ʧ��", "DVR UI1.0+UI2.0���ɾ��ʧ��")
Else
	MsgBox(4096,"�ɹ�", "DVR UI1.0+UI2.0���ɾ���ɹ�")
EndIf
EndFunc

Func DVR2_1()
If FileExists(@AppDataDir & "\OCX_DVR2") Then
    MsgBox(4096,"ʧ��", "DVR UI3.0���ɾ��ʧ��")
Else
    MsgBox(4096,"�ɹ�", "DVR UI3.0���ɾ���ɹ�")
EndIf
EndFunc


;~ Func DVR3_1()
;~ If FileExists(@AppDataDir & "\OCX_DVR3") Then
;~     MsgBox(4096,"ʧ��", "DVR UI3.0���ɾ��ʧ��")
;~ Else
;~     MsgBox(4096,"�ɹ�", "DVR UI3.0���ɾ���ɹ�")
;~ EndIf
;~ EndFunc


Func NVR_1()
If FileExists(@AppDataDir & "\OCX_NVR") Then
    MsgBox(4096,"ʧ��", "NVR���ɾ��ʧ��")
Else
    MsgBox(4096,"�ɹ�", "NVR���ɾ���ɹ�")
EndIf
EndFunc

Func WebCMS_1()
If FileExists(@AppDataDir & "\OCX_WebCMS") Then
    MsgBox(4096,"ʧ��", "WebCMS���ɾ��ʧ��")
Else
    MsgBox(4096,"�ɹ�", "WebCMS���ɾ���ɹ�")
EndIf
EndFunc


#cs
DirCreate(@AppDataDir & "\OCX_DVR1")
DirCreate(@AppDataDir & "\OCX_DVR2")
DirCreate(@AppDataDir & "\OCX_DVR3")
DirCreate(@AppDataDir & "\OCX_NVR")
#ce