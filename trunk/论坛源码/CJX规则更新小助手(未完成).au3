#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=J:\ADMuncher���պ�����\CJX�������С����(δ���).exe
#PRE_Compression=4
#PRE_Res_Fileversion=0.0.0.2
#PRE_Res_Fileversion_AutoIncrement=p
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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#Include <WinAPIEx.au3>
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�.
Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����.
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("CJX�������С����", 347, 215, 197, 124,$WS_SYSMENU)
$MenuItem = GUICtrlCreateMenu("ѡ��")
$kjqd = GUICtrlCreateMenuItem("��������", $MenuItem)
$zdgx = GUICtrlCreateMenuItem("�Զ�����", $MenuItem)
$ljgx = GUICtrlCreateMenuItem("��������", $MenuItem)
$yctptb = GUICtrlCreateMenuItem("��������ͼ��", $MenuItem)
$gy = GUICtrlCreateMenuItem("����", $MenuItem)
$tc = GUICtrlCreateMenuItem("�˳�", $MenuItem)
$Label1 = GUICtrlCreateLabel("�������״̬��", 8, 24, 88, 17)
$Label2 = GUICtrlCreateLabel("Label1", 120, 24, 36, 17)
$Label3 = GUICtrlCreateLabel("���ع���汾�ţ�", 8, 56, 100, 17)
$Label4 = GUICtrlCreateLabel("Label1", 120, 56, 36, 17)
$Button1 = GUICtrlCreateButton("��������", 8, 120, 73, 33)
$Button2 = GUICtrlCreateButton("�������", 104, 120, 73, 33)

TrayCreateItem("��������") ;������һ���˵���
TrayItemSetOnEvent(-1,"kjqd") ;ע���һ���˵���ģ������£��¼�  
TrayCreateItem("�Զ�����") ;�����������˵���
TrayItemSetOnEvent(-1,"zdgx") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("��������") ;�����������˵���
TrayItemSetOnEvent(-1,"ljgx") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("��������ͼ��") ;�����������˵���
TrayItemSetOnEvent(-1,"yctptb") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("����") ;�����������˵���
TrayItemSetOnEvent(-1,"guanyu") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"ExitScript") ;ע��ڶ����˵���ģ������£��¼�
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xianshi")
TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Local $str = 'CJX�������С���� �������� by xiaozhan\n\n��л����ţ������ ����ά����\n�Լ�������ع��׵���'

While 1
	 	Switch GUIGetMsg()

;~ 		If $msg = $fileitem Then
;~ 			$file = FileOpenDialog("Choose file...", @TempDir, "All (*.*)")
;~ 			If @error <> 1 Then GUICtrlCreateMenuItem($file, $recentfilesmenu)
;~ 		EndIf
	Case $GUI_EVENT_CLOSE
			suoxiao()
	Case $tc 
				Exit		
	Case $gy 
			guanyu()
	Case $kjqd
            kjqd()
	Case $zdgx
			zdgx()
	Case $yctptb
			yctptb()
	Case $ljgx
			ljgx()
	Case $Button1
			ljgx()
		Case $Button2
			$25 = _WinAPI_GetProcessName ()
			MsgBox(0,"",$25)
	EndSwitch	
WEnd

Func kjqd()
		$bt = _WinAPI_GetProcessName ()
	If BitAND(GUICtrlRead($kjqd), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
;~      IniWrite(@ScriptDir & "\myfile.ini", "����", "��������", "12345")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt)
		MsgBox(0,"ȡ����������","ȡ�����������ɹ�")
;~      IniWrite(@ScriptDir & "\myfile.ini", "����", "��������", "54321")
	EndIf
EndFunc

Func zdgx()
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		MsgBox(0,"","ѡ��")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		MsgBox(0,"","ûѡ��")
	EndIf	
EndFunc	

Func yctptb()
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		MsgBox(0,"","ѡ��")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		MsgBox(0,"","ûѡ��")
	EndIf		
EndFunc	

Func ljgx()
	MsgBox(0,"δ��ɵĹ���","����δ���")
EndFunc

Func guanyu()
	MsgBox(0, '����', StringFormat($str))
EndFunc	

Func suoxiao()
 GUISetState(@SW_HIDE,$Form1)
EndFunc

Func xianshi()
   GUISetState(@SW_SHOW, $Form1)   ;�������ڵ�״̬
   GUISetState(@SW_RESTORE, $Form1)
 
EndFunc   ;==>����(˫�����)


Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>�˳�
