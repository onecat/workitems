#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=11.exe
#PRE_Compression=4
#PRE_Res_Fileversion=0.0.0.5
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
#Include <File.au3>
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
$Label4 = GUICtrlCreateLabel("", 120, 56, 36, 17)
$Button1 = GUICtrlCreateButton("��������", 8, 120, 73, 33)
$Button2 = GUICtrlCreateButton("�������", 104, 120, 73, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$tkjqd = TrayCreateItem("��������") ;������һ���˵���
TrayItemSetOnEvent(-1,"kjqd") ;ע���һ���˵���ģ������£��¼�  
$tzdgx = TrayCreateItem("�Զ�����") ;�����������˵���
TrayItemSetOnEvent(-1,"zdgx") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("��������") ;�����������˵���
TrayItemSetOnEvent(-1,"ljgx") ;ע��ڶ����˵���ģ������£��¼�
$tyctptb = TrayCreateItem("��������ͼ��") ;�����������˵���
TrayItemSetOnEvent(-1,"yctptb") ;ע��ڶ����˵���ģ������£��¼�
$tgy = TrayCreateItem("����") ;�����������˵���
TrayItemSetOnEvent(-1,"guanyu") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"ExitScript") ;ע��ڶ����˵���ģ������£��¼�
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xianshi")
TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()

Local $str = 'CJX�������С���� �������� by xiaozhan\n\n��л����ţ������ ����ά����\n�Լ�������ع��׵���'
CJXBDGZ();��ȡ���ذ汾��
While 1
	 	Switch GUIGetMsg()
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
			 CJXBDGZ()
			;GUICtrlSetData($Label4, $CJXBDGZ)
	EndSwitch	
WEnd



If Not FileExists("CJX�������С����.ini") Then
    Local $file = FileOpen("CJX�������С����.ini", 1)
	FileWrite($file, ";���ļ�ΪCJX�������С���ֵ������ļ� �벻Ҫɾ��" & @CRLF)
	FileWrite($file, ";����ɾ�� ������Ĭ������" & @CRLF)
	FileWrite($file, ";���ʱ�� Ϊ��������µļ��ʱ�� ��λΪ��" & @CRLF)
	FileWrite($file, ";��������ͼ���ȼ�Ϊ��Ctrl+Q ���������ȼ�Ϊ��Ctrl+U" & @CRLF)
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�״�����", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "���ʱ��", "1000")
	FileClose($file)
	ini1()
Else
	ini()
EndIf;�жϽ���



Func ini()
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	

Func kjqd()
		$bt = _WinAPI_GetProcessName ()
	If BitAND(GUICtrlRead($kjqd) , $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
       IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
		;RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt)
		MsgBox(0,"ȡ����������","ȡ�����������ɹ�")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf
EndFunc


Func zdgx()
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
		MsgBox(0,"","ѡ��")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
		MsgBox(0,"","ûѡ��")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	EndIf	
EndFunc	

Func yctptb()
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
		MsgBox(0,"","ѡ��")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
		MsgBox(0,"","ûѡ��")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf		
EndFunc	


Func ljgx()
	MsgBox(0,"δ��ɵĹ���","����δ���")
EndFunc

Func guanyu()
	TrayItemSetState($tgy, $GUI_UNCHECKED)
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

Func CJXBDGZ();��ȡ����CJX����
	$IniFile = @ScriptDir & "\CustomStrings.dat"                                 ;�ı�·��
	$Lines = _FileCountLines($IniFile)                       ;��ȡ�ı�����
For $i=1 To $Lines-1                                           ;ѭ��
        $ReadFile=FileReadLine($IniFile,$i)                       ;��1�п�ʼ��ȡ
        If $ReadFile='' Then ExitLoop                                  ;�ı����˳�
        If stringinstr($ReadFile,"Xlist version") Then   			;���ش��������ŵ��ַ���
		Local $CJXBDGZ = StringRight($ReadFile, 6)
		GUICtrlSetData($Label4, $CJXBDGZ)
		ExitLoop
		;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ) 
		;MsgBox(4096, "���ұ������ַ�Ϊ:", $CJXBDGZ)   
	EndIf    

NEXT
EndFunc;��ȡ����CJX����

Func ini1()
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		;MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	


;���ļ�ΪCJX�������С���ֵ������ļ� �벻Ҫɾ�� 
;����ɾ�� ������Ĭ������
;���ʱ�� Ϊ��������µļ��ʱ�� ��λΪ��
;��������ͼ���ȼ�Ϊ��Ctrl+Q ���������ȼ�Ϊ��Ctrl+U
;~ [����]
;~ ��������=��
;~ �Զ�����=��
;~ �״�����=�� ;��һ�����оͼ��뿪������
;~ ���ʱ��=1000 
;~ ��������=��
