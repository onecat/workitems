#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=J:\ADMuncher���պ�����\CJX�������С���� V1.0 by ilv.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\CJX�������С���� V3.5 by xiaozhan.exe
#PRE_Compression=4
#PRE_Res_Comment=Сվ���� by xiaozhan
#PRE_Res_Description=Сվ���� by xiaozhan
#PRE_Res_Fileversion=3.5.0.0
#PRE_Res_LegalCopyright=Сվ���� by xiaozhan
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;#PRE_Res_File_Add=123.jpg,-10
#Region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ����������(���ò���)
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
#include <WinAPIEx.au3>
#include <File.au3>
#include <String.au3>
#include <gdiplus.au3>
#include <APIConstants.au3>
#include <GDIPlus.au3>
#include <Memory.au3>
#Include <Misc.au3>
#include <GuiButton.au3>
#include <ButtonConstants.au3>


$ui = HotKeySet("^u", "ljgx")
$qi = HotKeySet("^q", "yctptb")
$qw = HotKeySet("^w", "xianshi")
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�. 
Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����.
Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173
Global $time = 6
Global $hForm, $Pic, $hPic, $hBitmap, $hObj, $hImage, $pStream, $bData, $hData, $pData, $tData, $Width, $Height, $Lenght
Local $size , $get

If Not FileExists("AdMunch.exe") Then;����ļ��Ƿ����
   MsgBox(64,"������ʾ","�뽫������������ţ(AdMunch)��װĿ¼�����У�")
    Exit
EndIf

If _Singleton("CJX�������С����.exe", 1) = 0 Then ;����Լ������Ƿ�࿪   
	Exit
EndIf


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("CJX�������С����", 336, 255, -1, -1, $WS_SYSMENU)
$MenuItem = GUICtrlCreateMenu("ѡ��")
$kjqd = GUICtrlCreateMenuItem("��������", $MenuItem)
$zdgx = GUICtrlCreateMenuItem("�Զ�����", $MenuItem)
$ljgx = GUICtrlCreateMenuItem("��������"   &  "           Ctrl+U", $MenuItem)
$yctptb = GUICtrlCreateMenuItem("��������ͼ��"  &  "     Ctrl+Q", $MenuItem)
$gy = GUICtrlCreateMenuItem("����", $MenuItem)
$tc = GUICtrlCreateMenuItem("�˳�", $MenuItem)
$Label1 = GUICtrlCreateLabel("�������״̬��", 8, 24, 88, 17)
GUICtrlSetColor($Label1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("", 120, 24, 88, 17)
$Label3 = GUICtrlCreateLabel("���ع���汾�ţ�", 8, 56, 100, 17)
GUICtrlSetColor($Label3, 0x6633CC)
$Label4 = GUICtrlCreateLabel("", 120, 56, 84, 17)
$Progress1 = GUICtrlCreateProgress(8, 112, 186, 17)
$Button1 = GUICtrlCreateButton("��������", 8, 160, 73, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("�������������", 95, 160, 95, 33)
$Label5 = GUICtrlCreateLabel("�������� by xiaozhan", 200, 168, 130, 17)
;Global $iClose = GUICtrlCreateButton("N M ��ʲô������", 199, 185, 132, 20)
GUICtrlSetColor($Label5, 0xFF00FF)
$Label6 = GUICtrlCreateLabel("",  126, 136, 68, 17,$SS_CENTER)
GUICtrlSetColor($Label6, 0x0000FF)
$Label7 = GUICtrlCreateLabel("", 8, 88, 180, 17,$SS_CENTER)
GUICtrlSetColor($Label7, 0x0000FF)
;-----------------------------------------------------------------------------
PN()
$Pic = GUICtrlCreatePic("", 208, 24, 121, 113, $WS_EX_TRANSPARENT)
$hPic = GUICtrlGetHandle($Pic)
; ����λͼ���ؼ�
_SendMessage($hPic, $STM_SETIMAGE, 0, $hBitmap)
$hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hBitmap Then
	_WinAPI_DeleteObject($hBitmap)
EndIf
;~ GUISetState()
;~ Do
;~ Until GUIGetMsg() = -3
;-------------------------------------------------------------------------------;������ͼƬ���ر�������д�ſ�����ʱû�кõİ취
Dim $Form1_1_AccelTable[1][2] = [["6", $gy]]
GUISetAccelerators($Form1_1_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$tkjqd = TrayCreateItem("��������") ;������һ���˵���
$tzdgx = TrayCreateItem("�Զ�����") ;�����������˵���
$tljgx = TrayCreateItem("��������"  &  "           Ctrl+U") ;�����������˵���
TrayItemSetOnEvent($tljgx, "ljgx") ;ע��ڶ����˵���ģ������£��¼�
$tyctptb = TrayCreateItem("��������ͼ��"  &  "     Ctrl+Q") ;�����������˵���
$tgy = TrayCreateItem("����") ;�����������˵���
$ttc = TrayCreateItem("�˳�") ;�����������˵���
 _tp();���й����п�����ֹ

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

TraySetState(2);

Local $str = 'CJX�������С���� �������� by xiaozhan\n\n��л����ţ������ ����ά����\n�Լ�������ع��׵����ѣ�\n��лilv�Ĵ���֧��'
BDCJXGZ();��ȡ���ذ汾��
While 1
		
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			suoxiao()
		Case $tc
			ExitScript()
		Case $gy
			guanyu()
		Case $kjqd
			kjqd()
		Case $zdgx
			zdgx()
		Case $ljgx
			ljgx()	
		Case $yctptb
			yctptb()
		Case $Button1
			ljgx()
		Case $Button2
			qlhc()
	EndSwitch
WEnd

Func _xun();���й����п�����ֹ
	Switch GUIGetMsg()
		Case $tc ;$iClose,
			Exit
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE, $Form1)
			Opt("TrayIconHide", 0) 
		Case $kjqd
			kjqd()
		Case $zdgx
			zdgx()
		Case $gy
			guanyu()	
		Case $yctptb
			yctptb()	
		Case $qi 
			HotKeySet("^q", "yctptb")
		Case $qw
			HotKeySet("^w", "xianshi")	
	EndSwitch
EndFunc

Func _tp()
	TrayItemSetOnEvent($tkjqd, "kjqd") ;ע���һ���˵���ģ������£��¼�
	TrayItemSetOnEvent($tzdgx, "zdgx") ;ע��ڶ����˵���ģ������£��¼�
	TrayItemSetOnEvent($tyctptb, "yctptb") ;��������
	TrayItemSetOnEvent($tgy, "guanyu") ;����
	TrayItemSetOnEvent($ttc, "ExitScript") ;�˳�����
	TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "xianshi")
	TraySetClick(8) ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�)
EndFunc

Func ini1();�����ļ������ھ����о���ʾ״̬
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState($tkjqd, $GUI_CHECKED)
		kjqd()
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		;MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState($tkjqd, $GUI_UNCHECKED)
	EndIf
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState($tzdgx, $GUI_CHECKED)
		ljgx()
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1)
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0)
	EndIf
EndFunc   ;==>ini1


Func ini();�����ļ����ھ���ʾ״̬
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState($tkjqd, $GUI_CHECKED)
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState($tkjqd, $GUI_UNCHECKED)
	EndIf
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState($tzdgx, $GUI_CHECKED)
		ljgx()
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1)
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0)
	EndIf
EndFunc   ;==>ini

Func qlhc()
$Form1_1 = GUICreate("���������",  229, 228, -1, -1,$WS_VISIBLE)
$Radio1 = GUICtrlCreateRadio("IE", 24, 16, 41, 25)
GUICtrlSetState($Radio1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("����", 24, 40, 41, 25)
$Radio3 = GUICtrlCreateRadio("���", 24, 64, 57, 25)
$Radio4 = GUICtrlCreateRadio("�ȸ�", 24, 92, 57, 17)
$Button11 = GUICtrlCreateButton("ȷ��", 8, 160, 73, 25,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button12 = GUICtrlCreateButton("�˳�", 112, 160, 73, 25)
$Label11 = GUICtrlCreateLabel("  ��ʱ��֧����ɫ�������", 16, 128, 158, 17)
GUICtrlSetColor($Label11, 0x0000FF)
$Label12 = GUICtrlCreateLabel("", 96, 22, 116, 17)
$Label13 = GUICtrlCreateLabel("", 96, 46, 116, 17)
$Label14 = GUICtrlCreateLabel("", 96, 70, 116, 17)
$Label15 = GUICtrlCreateLabel("", 96, 94, 116, 17)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
	Case $Button12
			GUIDelete($Form1_1)
			ExitLoop
	Case $radio1 
		If	BitAND(GUICtrlRead($radio1), $GUI_CHECKED) = $GUI_CHECKED Then
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label14, "")
			GUICtrlSetData($Label15, "")
		EndIf
	Case $radio2
		If	BitAND(GUICtrlRead($radio2), $GUI_CHECKED) = $GUI_CHECKED Then
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label14, "")
			GUICtrlSetData($Label15, "")
		EndIf	
	Case $radio3
		If	BitAND(GUICtrlRead($radio3), $GUI_CHECKED) = $GUI_CHECKED Then
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label15, "")
		EndIf
	Case $radio4
		If	BitAND(GUICtrlRead($radio4), $GUI_CHECKED) = $GUI_CHECKED Then
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label14, "")
		EndIf	
	Case $Button11
		If  BitAnd(GUICtrlRead($Radio1), $GUI_CHECKED) Then ;IE
			GUISetState($Radio2, $GUI_UNCHECKED)
			GUISetState($Radio3, $GUI_UNCHECKED)
			GUISetState($Radio4, $GUI_UNCHECKED)
			RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
			GUICtrlSetData($Label12, "����IE����ɹ�")
			GUICtrlSetColor($Label12, 0xFF00FF)
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label14, "")
			GUICtrlSetData($Label15, "")
		Else	
			GUISetState($Radio1, $GUI_UNCHECKED)
			GUISetState($Radio2, $GUI_CHECKED)
			GUISetState($Radio3, $GUI_CHECKED)
			GUISetState($Radio4, $GUI_CHECKED)
		EndIf	
		
		If  BitAnd(GUICtrlRead($Radio2), $GUI_CHECKED) Then ;����
			GUISetState($Radio1, $GUI_UNCHECKED)
			GUISetState($Radio3, $GUI_UNCHECKED)
			GUISetState($Radio4, $GUI_UNCHECKED)
			RunWait(@ComSpec & ' /c ' & 'del /f /s /q '& @TempDir & '"\Maxthon3Cache\Temp\Webkit\Cache\*.*"', '', @SW_HIDE)
			GUICtrlSetData($Label13, "������λ���ɹ�")
			GUICtrlSetColor($Label13, 0xFF00FF)
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label14, "")
			GUICtrlSetData($Label15, "")
		Else	
			GUISetState($Radio2, $GUI_UNCHECKED)
			GUISetState($Radio1, $GUI_CHECKED)
			GUISetState($Radio3, $GUI_CHECKED)
			GUISetState($Radio4, $GUI_CHECKED)
		EndIf
		
		If  BitAnd(GUICtrlRead($Radio3), $GUI_CHECKED) Then ;���
			GUISetState($Radio1, $GUI_UNCHECKED)
			GUISetState($Radio2, $GUI_UNCHECKED)
			GUISetState($Radio4, $GUI_UNCHECKED)
			RunWait(@ComSpec & ' /c ' & 'del /f /s /q ' & StringTrimRight(@TempDir,5) & '"\Mozilla\Firefox\Profiles\7wayvzhv.default\Cache\*.*"', '', @SW_HIDE)
			RunWait(@ComSpec & ' /c ' & 'del /f /s /q ' & StringTrimRight(@TempDir,5) & '"\Mozilla\Firefox\Profiles\7wayvzhv.default\OfflineCache\*.*"', '', @SW_HIDE)
			GUICtrlSetData($Label14, "����������ɹ�")
			GUICtrlSetColor($Label14, 0xFF00FF)
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label15, "")
		Else	
			GUISetState($Radio3, $GUI_UNCHECKED)
			GUISetState($Radio1, $GUI_CHECKED)
			GUISetState($Radio2, $GUI_CHECKED)
			GUISetState($Radio4, $GUI_CHECKED)
		EndIf
		
		If  BitAnd(GUICtrlRead($Radio4), $GUI_CHECKED) Then ;�ȸ�
			GUISetState($Radio1, $GUI_UNCHECKED)
			GUISetState($Radio2, $GUI_UNCHECKED)
			GUISetState($Radio3, $GUI_UNCHECKED)
			RunWait(@ComSpec & ' /c ' & 'del /f /s /q ' & StringTrimRight(@TempDir,5) & '"\Google\Chrome\User Data\Default\Cache\*.*"', '', @SW_HIDE)
			GUICtrlSetData($Label15, "����ȸ軺��ɹ�")
			GUICtrlSetColor($Label15, 0xFF00FF)
			GUICtrlSetData($Label12, "")
			GUICtrlSetData($Label13, "")
			GUICtrlSetData($Label14, "")
		Else	
			GUISetState($Radio4, $GUI_UNCHECKED)
			GUISetState($Radio1, $GUI_CHECKED)
			GUISetState($Radio2, $GUI_CHECKED)
			GUISetState($Radio3, $GUI_CHECKED)
		EndIf
;~ 		GUIDelete($Form1_1)
;~ 		ExitLoop
	EndSwitch
WEnd
EndFunc
Func kjqd();��������
	$bt = _WinAPI_GetProcessName()
	If BitAND(GUICtrlRead($kjqd), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState($tkjqd, $GUI_CHECKED)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe" & " /start")
		MsgBox(0, "���ÿ�������", "���ÿ��������ɹ�")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState($tkjqd, $GUI_UNCHECKED)
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $bt)
		MsgBox(0, "ȡ����������", "ȡ�����������ɹ�")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf
EndFunc   ;==>kjqd


Func zdgx();�Զ�����
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState($tzdgx, $GUI_CHECKED)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState($tzdgx, $GUI_UNCHECKED)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	EndIf
EndFunc   ;==>zdgx

Func yctptb();��������
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf
EndFunc   ;==>yctptb

Func ljgx();��������
	AdlibRegister("_xun",100);���й����п�����ֹ
	AdlibRegister("_tp",100);���й����п�����ֹ
	PBNN();���ΰ�ťΪ��ɫ״̬���ɵ��
	CJXBAK()
	CJZGX();�����ڼӸ��ж�
	XXAN();��ʾ֮ǰ���εİ�ť
	AdlibUnRegister("_xun");���й����п�����ֹ
	AdlibUnRegister("_tp");���й����п�����ֹ
EndFunc   ;==>ljgx

Func PBNN();���ΰ�ťΪ��ɫ״̬���ɵ��
	_GUICtrlButton_Enable($Button1,False)
	GUICtrlSetState($ljgx, $GUI_DISABLE)
	_GUICtrlButton_Enable($Button2,False)
	TrayItemSetState($tljgx, $GUI_DISABLE)
	TrayItemSetState($tljgx, $GUI_UNCHECKED)
EndFunc

Func XXAN();��ʾ֮ǰ���εİ�ť
	_GUICtrlButton_Enable($Button1,True)
	_GUICtrlButton_Enable($Button2,True)
	GUICtrlSetState($ljgx, $GUI_ENABLE)
	TrayItemSetState($tljgx, $GUI_ENABLE)
EndFunc	

Func guanyu();����
	TrayItemSetState($tgy, $GUI_UNCHECKED)
	MsgBox(0, '����', StringFormat($str))
EndFunc   ;==>guanyu

Func suoxiao();��С������
	GUISetState(@SW_HIDE, $Form1)
	Opt("TrayIconHide", 0) 
EndFunc   ;==>suoxiao

Func xianshi();��ʾGUI����
	GUISetState(@SW_SHOW, $Form1) ;�������ڵ�״̬
	GUISetState(@SW_RESTORE, $Form1)
	Opt("TrayIconHide", 1) 
EndFunc   ;==>xianshi


Func ExitScript()
	Exit ; $Quit
EndFunc   ;==>ExitScript



Func CJXBAK();���CJX�����ļ��Ƿ����
	If FileExists("CustomStrings.dat.BAK") Then
		FileDelete(@ScriptDir & "\CustomStrings.dat.BAK")
		FileCopy(@ScriptDir & "\CustomStrings.dat", @ScriptDir & "\CustomStrings.dat.BAK", 1)
	Else
		FileCopy(@ScriptDir & "\CustomStrings.dat", @ScriptDir & "\CustomStrings.dat.BAK", 1)
	EndIf
EndFunc   ;==>CJXBAK



Func CJZGX();CJX�������
	BDCJXGZ()
	gzxz()
	WLSB()
	ZXJDT()
EndFunc   ;==>CJZGX

Func ZXJDT()
	AdlibUnRegister( "Down" )
	GUICtrlSetData($Progress1,"")
	GUICtrlSetData($Label6,"")
	GUICtrlSetData($Label7,"")
EndFunc		

Func WLSB();�ж�update.dat�ļ�������
	If FileExists(@TempDir & "\update.dat") Then
		BDX();�ж�CJX����Ĵ�С�Ƿ�һ��
	Else
		GUICtrlSetData($Label2, "����ʧ��")
		GUICtrlSetColor($Label2, 0x3399FF)
	EndIf
EndFunc   ;==>WLSB

Func BDX();�ж�CJX����Ĵ�С�Ƿ�һ��
	$url = "http://cjxlist.googlecode.com/svn/CustomStrings.dat"
	$size = Int(InetGetSize($url) / 1024)
	$data = Int(FileGetSize(@TempDir & "\update.dat") / 1024)
	If $size = $data Then
		bbhdb()
	Else
		GUICtrlSetData($Label2, "��ȡ����ʧ��")
		GUICtrlSetColor($Label2, 0x3399FF)
		ZXJDT()
		AdlibRegister("timer",1000);����ʱ�л�ͨ��
		Sleep(6*1000)
		gzxz1()
		BDX1();�ж�CJX����Ĵ�С�Ƿ�һ��
	EndIf
EndFunc 

Func timer()
        $time -= 1
        GUICtrlSetData($Label2, $time & "����л���·")
		GUICtrlSetColor($Label2, 0x3399FF)
        If $time <= 1 Then AdlibUnRegister()
EndFunc   ;==>_timer

Func BDX1();�ж�CJX����Ĵ�С�Ƿ�һ��
	$url = "http://cjxlist.googlecode.com/svn/CustomStrings.dat"
	$size = Int(InetGetSize($url) / 1024)
	$data = Int(FileGetSize(@TempDir & "\update.dat") / 1024)
	If $size = $data Then
		bbhdb()
	Else
		GUICtrlSetData($Label2, "����ʧ��")
		GUICtrlSetColor($Label2, 0x3399FF)
	EndIf
EndFunc 

Func bbhdb();�ж�����CJX����ͱ���CJX���� 
	$HWL = _StringToHex(WLCJXGZ())
	$HBD = _StringToHex(BDCJXGZ())
	If $HWL <= $HBD Then
		BDCJXGZ()
		GUICtrlSetData($Label2, "��������")
		GUICtrlSetColor($Label2, 0x3399FF)
		FileDelete(@TempDir & "\update.dat")
		YZXPD()
	Else
		GUICtrlSetData($Label2, "���ڸ�����")
		GUICtrlSetColor($Label2, 0x3399FF)
		CJXGZGX();���¹����Զ������ϲ�
		THJGZ();������ţCJX����
		BDCJXGZ()
		GUICtrlSetData($Label2, "�������")
		GUICtrlSetColor($Label2, 0x3399FF)
		GBNNJC();���¹����ж���ţ���̺�ˢ�¹���汾��
	EndIf
EndFunc   ;==>bbhdb

Func THJGZ();������ţCJX����
		FileDelete(@ScriptDir & "\CustomStrings.dat")
		FileCopy(@TempDir & "\update.dat", @ScriptDir & "\CustomStrings.dat", 1)
		FileDelete(@TempDir & "\update.dat")	
EndFunc   ;==>THJGZ

Func YZXPD();�Ѿ����¹����ж���ţ����
	If Not ProcessExists("AdMunch.exe") Then ; Check if the Notepad process is running.
		ShellExecute("AdMunch.exe", "", @ScriptDir)
	EndIf
EndFunc

Func GBNNJC();���¹����ж���ţ���̺�ˢ�¹���汾��
	If Not ProcessExists("AdMunch.exe") Then ; Check if the Notepad process is running.
		ShellExecute("AdMunch.exe", "", @ScriptDir)
	Else
		Run(@ScriptDir & "\AdMunch.exe");��ʱ������
		WinWait("Ad Muncher 4.93 ��������", "",2)
		Local $aPos = WinGetPos("Ad Muncher 4.93 ��������")
		WinSetState("Ad Muncher 4.93 ��������", "", @SW_HIDE)
		WinMove("Ad Muncher 4.93 ��������", "", -100, -100, -100, -100)
		WinMove("Ad Muncher 4.93 ��������", "", $aPos[0], $aPos[1], $aPos[2], $aPos[3])
		WinClose("Ad Muncher 4.93 ��������")
	EndIf
EndFunc	

Func gzxz();����CJX�����ļ�
	GUICtrlSetData($Label2, "��ȡ����")
	GUICtrlSetColor($Label2, 0x3399FF)
	$url = "http://cjxlist.googlecode.com/svn/CustomStrings.dat"
	;$url ="http://dldir1.qq.com/qqfile/qq/QQ5.5NewDesign/8853/QQ5.5NewDesign.exe"
	$get = InetGet($url, @TempDir & "\update.dat", 1, 1)
	GUICtrlSetData($Label7, "���ڶ�ȡ����CJX����,���Ժ�....")
	$size = Int(InetGetSize($url) / 1024)
	AdlibRegister("Down")
	Do
		Sleep(250)
	Until InetGetInfo($get, 2)
EndFunc   ;==>gzxz

Func gzxz1();����CJX�����ļ�
	GUICtrlSetData($Label2, "��ȡ����")
	GUICtrlSetColor($Label2, 0x3399FF)
	$url = "https://cjxlist.googlecode.com/svn/CustomStrings.dat"
	$get = InetGet($url, @TempDir & "\update.dat", 1, 1)
	GUICtrlSetData($Label7, "���ڶ�ȡ����CJX����,���Ժ�....")
	$size = Int(InetGetSize($url) / 1024)
	AdlibRegister("Down")
	Do
		Sleep(250)
	Until InetGetInfo($get, 2)
EndFunc   ;==>gzxz

Func Down()
		$newsize = InetGetInfo($get)
        $pro = Int($newsize[0] / 1024) / $size
        GUICtrlSetData($Progress1, $pro * 100)
        GUICtrlSetData($Label6, "�Ѷ�ȡ " &  Int($pro * 100) & "%")
EndFunc   ;==>Down
	
;~ Func gzxz();����CJX�����ļ�
;~ 	GUICtrlSetData($Label2, "��ȡ����")
;~ 	GUICtrlSetColor($Label2, 0x3399FF)
;~ 	Local $hDownload = InetGet("http://cjxlist.googlecode.com/svn/CustomStrings.dat", @TempDir & "\update.dat", 1, 1)
;~ 	Do
;~ 		Sleep(250)
;~ 	Until InetGetInfo($hDownload, 2) ; ��������Ƿ����.
;~ 	Local $nBytes = InetGetInfo($hDownload, 0)
;~ 	InetClose($hDownload) ; �رվ��,�ͷ���Դ.
;~ 	;MsgBox(4096, "", "�ֽڶ�ȡ: " & $nBytes)
;~ EndFunc   ;==>gzxz

;~ Func WLCJXGZ();����CJX����
;~ 		$a=InetRead ( "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat" , 1)
;~ 		$array = StringRegExp(BinaryToString($a), '><td class="source">Xlist version (.*?)<br></td></tr', 2)
;~ 		Return($array[1])
;~ EndFunc   ;==>WLCJXGZ

Func WLCJXGZ();����CJX����
	$IniFile = @TempDir & "\update.dat" ;�ı�·��
	$Lines = _FileCountLines($IniFile) ;��ȡ�ı�����
	For $i = 1 To $Lines - 1 ;ѭ��
		$ReadFile = FileReadLine($IniFile, $i) ;��1�п�ʼ��ȡ
		If $ReadFile = '' Then ExitLoop ;�ı����˳�
		If StringInStr($ReadFile, "Xlist version") Then ;���ش��������ŵ��ַ���
			Local $WLCJXGZ = StringTrimLeft($ReadFile, 14)
			Return ($WLCJXGZ)
			ExitLoop
			;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ)
			;MsgBox(4096, "���ұ������ַ�Ϊ:", $CJXBDGZ)
		EndIf

	Next
EndFunc   ;==>WLCJXG

Func BDCJXGZ();��ȡ����CJX����
	$IniFile = @ScriptDir & "\CustomStrings.dat" ;�ı�·��
	$Lines = _FileCountLines($IniFile) ;��ȡ�ı�����
	For $i = 1 To $Lines - 1 ;ѭ��
		$ReadFile = FileReadLine($IniFile, $i) ;��1�п�ʼ��ȡ
		If $ReadFile = '' Then ExitLoop ;�ı����˳�
		If StringInStr($ReadFile, "Xlist version") Then ;���ش��������ŵ��ַ���
			Local $BDCJXGZ = StringTrimLeft($ReadFile, 14)
			GUICtrlSetData($Label4, $BDCJXGZ)
			GUICtrlSetColor($Label4, 0x9932CC)
			Return ($BDCJXGZ)
			ExitLoop
			;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ)

		EndIf

	Next
EndFunc   ;==>BDCJXGZ

Func CJXGZGX();���¹����Զ������ϲ�
	Local $aFiles = @ScriptDir & "\CustomStrings.dat"
	Local $bFiles = @TempDir & "\update.dat"
	$aFile = FileOpen($aFiles)
	$aFileStrings = FileRead($aFile)
	$splitaFileStrings = StringSplit($aFileStrings, "Xlist version", 1)
	For $i = 1 To $splitaFileStrings[0]
		;MsgBox(64+0,"",$splitaFileStrings[$i])
		;ExitLoop
	Next
	FileClose($aFile)
	$bFile = FileOpen($bFiles)
	$bFileStrings = FileRead($bFile)
	$FinalString=$splitaFileStrings[1] & $bFileStrings
	FileClose($bFile)
	$bFile2 = FileOpen($bFiles, 2);��д��ģʽ�򿪣���������������
	FileWrite($bFile2, $FinalString)
	FileClose($bFile2)
EndFunc   ;==>CJXGZGX

;~ Func _xun()
;~ 	Switch GUIGetMsg()
;~ 		Case $iClose,$tc; $GUI_EVENT_CLOSE, 
;~ 			Exit
;~ 		Case $GUI_EVENT_CLOSE
;~ 			GUISetState(@SW_HIDE, $Form1)
;~ 			Opt("TrayIconHide", 0) 
;~ 		Case $zdgx
;~ 			zdgx()
;~ 		Case $ttcc 
;~ 			TrayItemSetOnEvent(-1, "ExitScript")	
;~ 	EndSwitch
;~ EndFunc

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


Func PN()
	; ����λͼ (MSDNLogo.png)
	$bData = _Image_MSDNLogo()
	$Lenght = BinaryLen($bData)
	$hData = _MemGlobalAlloc($Lenght, $GMEM_MOVEABLE)
	$pData = _MemGlobalLock($hData)
	$tData = DllStructCreate('byte[' & $Lenght & ']', $pData)
	DllStructSetData($tData, 1, $bData)
	_MemGlobalUnlock($hData)
	$pStream = _WinAPI_CreateStreamOnHGlobal($hData)
	_GDIPlus_Startup()
	$hImage = _GDIPlus_BitmapCreateFromStream($pStream)
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
	;$Width = _GDIPlus_ImageGetWidth($hImage)
	;$Height = _GDIPlus_ImageGetHeight($hImage)
	_WinAPI_ReleaseStream($pStream)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
EndFunc   ;==>PN

Func _Image_MSDNLogo()
	Local $bImage = _
			"0x89504E470D0A1A0A0000000D4948445200000080000000800806000000C33E61CB000000097048597300000B1300000B1301009A9C18000020004944415478" & _
			"DAECBD799C1D65953EFE9CF7ADED6EBDA493EEA493CED2D9080981400861937D555001155C40C57143C5751475041D755C07C62F0E0C8E5F7464406415947D87" & _
			"843D244042F63D9DA4F7BE7B55BDEF7B7E7F54D5BDB79BE038F30585F979F3E9F4CD4DDD7BABEA9CF72CCF39E779E9B2CB2EC3DF1EFFFF7D587FBB057F5380BF" & _
			"3DFEA6007F7BFC4D015EE70733838808000130F1BFFF76C75FFB5E0180885FFA8BDD2FEB8DBA1822125A6B036626212084F89BA45FE3414430C680998D310652" & _
			"4A9252C218C3C9FFBF65148088C0CC140681993879727BE7E4AE4BFB7B7BAFDDB963DB7352CABF90156030138818F1B7357E298D3AB0517781DAFB461FF6862E" & _
			"7F525A73D7D46933DBC6B7FF03D85CB77EDD2B0F140A05B8AE4BCCCC6F190B109FAB10429AFD161CF0A18E8E8E4BBD547AA65FAD3CC5C63C47962500983748D0" & _
			"048092BB2588A1587208C90466D465CAAF123D4582B74993459A9203A8AE246F9872301119369CC9643BC74F987081205CD0DE31E1A62D9B365DB87EFDBA826D" & _
			"3B7823DD81F57A0A9F8844100466FF05F33E3B7DC68C9F0902BC544AD9B63DD3C431C1FF9B428F16380314095A98902D2630133188190A02E3650113E488A759" & _
			"8C238204E000688E3F4C8168080C62A062C18CF4AAA6A0DFE4D82213899F01030211E05228EA1685CDEBA51044043606428AAE5C36AB2A95B20943FD9E050B0F" & _
			"EC2C954B27EDDCB1B3EA380EBFE92D001109A51477744C3C6872E7E49F78AEAB1DC75229CF733A274D9AB52E9D411806FCDF8F05460B9D8849B1E0902D16306C" & _
			"4018270A68B746BA5888698BBCAD331CA11785B067B45AA5896D56B9C590DD8C48016C90CC014CC44631511ECC04A3AB82757E50678A432A3D4046AFB785DAB8" & _
			"C56FDFB8236CDB2288376E09DA358390D89A06856006F3FF581998494A0BCDCDCD8B5A9B73D2B6250741E0974A9523A74D9FF1D5DDBB7A2E032098D9BC1156E0" & _
			"F5B300C6B0ED383C63E6AC4B734D392793492BC7B6EC94E7514B6BEB9142CA0C022EFDB9E62C32140C410091118A2542960600B78902C6D9C5CE49D6F001D39D" & _
			"BE6333B63A7E825DEED6C21ECF6401960392044DADA8887690B023434E14FD3033B37105CC04660D5621C08C1C42B4181F50E16960C6E4D43690D954D406DB7B" & _
			"C296CDBE918FACAA4E5B1618F9D25635A1C42C6040B0490B8B4C7CDA7FBE323033988D49A5D272F2E4C9277A2997081081EB0A635813B57CAA6362C7953D3DBB" & _
			"FB1DC779535B00D25A73CBB8B6394DCD2D27388E6D32694F38B64BD2967A5C6BCBF4AEAE296F5FB37AF5EF52A99430C6BCA636271E42449E58F86C19C5C2B489" & _
			"0226D94333F64FF5BCA3C32EBC6B9C5D99AFA5DB0169C1480F25390E242D436419920E58D810C2224B58919D2501082B89B90106C3286613022604B4CFAC1542" & _
			"D6CC3A04B402D8808DCAC2E8FD273BC1FEC4EA1DB3332BA13436F6044DCF558DF5E0CBD5290FEC0E5BB70E9A2C0880455A58A4991179BBD752046686104294CB" & _
			"55D33D6BD6296D6DAD07398E6B8490C20A03842AA5C350B5A733B9E389F6FC0E8004A0DFA40AC002441AC001AEEBE43CD7538EEB4ACF7189A48063D97CD0A245" & _
			"DFD8B367CFEF0BF97C28A5DC6760C35C13BCAC1A4B0B18D365F5795DCEE0A98B52DB3FD06CFBC71BCB1DA7ED14CAD40C212DCD96C3246CB2A44D2C1D22E15824" & _
			"2C0609226183840B161648C838CD16F5EF6543D02160AA30AA04529132181D30699FC08661B461A338349A610C182CC9A859539CEA2CD6E573E7A4560E0C86DE" & _
			"F2BD61EED657FCCE877787E3B6F59B2678140A49C6987D588358F854AD5679E2A449F2E045077F2F97CE3049C9966509418494AB50B4CADCDED171E2D62D9B7F" & _
			"F72677014491B926ED3A36BBAE05DBB2494AC942086960F4D4AEAE85071F72C8F71EBCFFFE2F4B292D218432C6D472E0F80E892ADB9A00DD6DF7B61C9ADA78C1" & _
			"0C6FE063C2920B9448A1623541D8B68274494A9B48D802D2260887216C12C201491B246C82B0C1C20220416401C202410024001088E258840CA0030855028202" & _
			"A0AB201D126B0FE090603491512C8C06580346C3B0D681B619422330BA2D6755CF687606CF9897DADB371C3A77ADAA4CFBC90BD5E92F97B40D8BB46426062201" & _
			"12118410320802DDDCDC84C58B175F33A5ABEB2021A496524863982DDB8663DBE4B90E854A2D881586DFC42E20CE9C88402449080929050B21484620908062B5" & _
			"F8E043BE542C167B9E5AFEE43FDBB645966509AD353CCFD37182A0A79A9ED4626FE3276778039F2329A7FB3207928E1696CBD272052C47927441960BC48226E1" & _
			"10A40D223B12B4B0A2788F642470517F4E24C0A0C6F508080F427A30906055025115100A30018835D828820901A3016320580B212CB05160131AA385D170D817" & _
			"7A424A04171C6BAF7DEF7EA9BD3FBFA57ADC3703B67C010322812008441004260C43DDD5D5D574FC0927FCACADADED02DB72946509290068183242B094C44248" & _
			"30C3C31B0805BC5E2E808008008A231B8E22760110B1454464434A41FA84E38FFF693693F59E7BE699EF178A059DC964B065F36654ABD56E6330F1DC8336FC60" & _
			"62868F2E220D92B612964D64B9822C17B01C40A688A407B23C40462B1EC206C802C1020B09901DAF7A19AD749200284AE823B8004C8D501003D203D9B908A620" & _
			"01681FD016080AD02140124C0A2C34C828AA19BEE8990488A421C36053E4A6D4786BF8CB67760D1FF3F3E7ED1FF4EDDCB80642EE983A6D5AA9A3BD1DF30F5870" & _
			"F6DC39732F6D6A6E3AC0733C25849452800C834944612FC7BE82805D884C3F8D412FDE540A9000564AB326630C69C36C31832008442C09C420218DD0471E71F8" & _
			"F7E6CC9E7DFCEFEFB8FDA73FBBFC5F666ED8B4F14200D324ACD68FB6CDC3848326285244C2B22DB21C86E580A54588023B4008300484958A7C3C08245C405810" & _
			"B1C063E5ABF9FDD844D5EE252741073160621F2D5D90766B581523049B447F042024A083E8FB18806190008139CA566188202DC9C628CA98CC8E070F7DEC3FD7" & _
			"DDB272AF5F3C6CF1A2DE934E3AE991934F3D758EE77947D952C2761C2584905210519C3E301BD646436B036514E5F3F907126CEB4D1C04921642C0AF561FCFE7" & _
			"0BDB9B72D9C929A58C6D59928560662221045B92C88084D64A4F9830FE84F79D7BEE0993274DC6F2A79FC2130F3F8C152B57F3BA5E658EB6852C6B4152584CC2" & _
			"2216566CC66D302404086C144C5082F052202B130996AC58E814FB7A51C7F362E828B24D06C4716618CB9EA163FB40B1A2588030D1013A3A9010B91330006140" & _
			"2CC1E0C8ED301360C06C9884A43030D6E4CE167DD4FE2D14B64FCEDE78CB4D592F9DEE9642C0B62CE3D80E0B292C218809820D9BE82C8C21ADB509C290AAD560" & _
			"A4BFAFF7E6B83E60DEC42E009052CA7C7E6478D7CE9D973735355FEEB96E605B9690529260C1602621049345108284D15A67D2599CF6F6D3F9ED679E41BFFAF5" & _
			"AFE9D94F5E44B7AC1A11E71D3B912CD766264994987188388863B0D120C160AD60CA3D10E98920B7AD26CD460F0F32D1BF5824A86E9C6B2616D5C45E4B036C00" & _
			"18903160363583CB71D0C81C7D7F645D0458489089AC080B13C50891C5832062A52167A6899BCF7AB7C9E6726CB4E69497225B4A218888A46422228E826036C6" & _
			"402905DFF755A95471B66ED972653E3FB2CB7ADD21F437060AD69665898DEBD7FE7C7CDBF8931DDB3ACDB24400216CD8205B480683E2CA20032C49192E158A08" & _
			"01D2A1E296944DCBB65770CBD383B8E094A934ECC7E2644402310108124C14099404800026BF09C6CBC3CA4E8D57BD892D41040B47C76980090C0302C7750B86" & _
			"61031813E5FCACA2489F35103F67A3411C610291A98F8FAD9514222522E65121052802021C496413C84040124340409080B404C07115D0306BA3C90F43AE542A" & _
			"E1F0C888D3DBDBB76CEB964DFFA89512966599377910582B591AADB559BFFE95F7D9AEF30786795BAB36DAA4D230A99494124C5A47EB384AFF88B54299093DEB" & _
			"D751102AB8290FBF5EDE87330F6B879DC9C0681D2F5C031602CC32AE38C64158A280239BA19921B3D3A3D48EE3454304660DE2BAC84C2CC448E8068464C56BC0" & _
			"84205660D6606850EC1A38B60E601D1FCBA0D86A98514A1159046318B624ACCB6BF4AE7A09F94A193929A15947E529C53031DCA98C21DFF74DB95CE2917CC1D9" & _
			"BDB7EFF91757BD704EA55CF62DCBA2B74431280138A494D4D7DB57787AD913A7CE9A3BEF9F67CE9AF1C996A66664C3906DC726292C086230086110A02A2D6C7B" & _
			"F945DCFB873FC0F252F06C89750321B6F79630AFDB4145330856BCCA04987424C85A4C1C47E246C314B74278E301E9016C227482E2858BFA0A6630884DED3546" & _
			"94DF332B9009C146C72E8123EB80C43DC4C2A7F8FDA33EC3D414830D430AA05008B0A11F58F9E24358FBDC5338F0A8E340E5328CEBD64E5F6B4D4A855CA9FAA2" & _
			"AF7F10DBB66FBF66CBA68D5F1A1A1C28DAB64DCCCC6F997E80B817802D4B52D5AF5656BFB4F253D56AF9D64C26FBEDCECE894B3B3A261ADB71C910489928375E" & _
			"BF6625AEB8F4BBD8B0772FD2A974ADF8D33750C5FE331458278ED8804944FE3C09F422AC3536C40CAE5460FC7E08AF3D124E14A2C702E206D31FFB7D6890D160" & _
			"8EA05F669594B4E3D70D0C0C2859E146458A02132B4CE43E6A1601914218AD917180A7D694F0CC4E05AD7D7CF79B97E1CBDF365874D851C8070558242020A0C2" & _
			"C0ECEEE9A10DEBD76F30C0E7B66EDE780FB3C15F42F87FB602C448140048661E5B4D4F5ABF4C920B32330B292188C44B2B5FB8FFE69B6E3E2B93CE1C7EEC0927" & _
			"E8A30E3B584E6C9B04C792B8F7FE3FE23F7F7B1306470A48A55360361042C030A35CD11108A339BEE15130C882EA859DF854A2C05E47C08C9F073B2D35470CA3" & _
			"930250F439E09A20C10AA6E17974AC85D85EC43582104C228E0B4C64196A423760636ACAC2A66E618436F8F55323A82A83E6B487355BB6E10B9FFA0CCE39EB0C" & _
			"BCEBEDEF86110E7A7AB7E3F1A79FE7E54F2C139B36ACE3779D7DD6FDF3E72F10BEEFF358E137C8801A7EB8310FFF9FB80AEBCF103C111155AB5503405BD6ABDF" & _
			"1286219819AEEB929411A0A59412995CCE2C7BFCF123B66FDFF6C9949732BFBCE66A79FB4D2DD49CC9C11612BBFAF64093052F958A73EAA8DC6A5B02E37332F2" & _
			"FF264EC4850143807424788E2D7FE49B39B2EE3A045415E0101C940141809D011B3F1630C7819DAAC1BAD1F318EC311AEC446010574740760EE434C354FAA3CF" & _
			"32512C91048A864D9C3E468A00D6504AA3D5036E7E7C08BF7FB9885C4A406946CA7351F2035CFB1F37E0FEBB1F820150A896D03F382C4890324ACF59F1DCF35F" & _
			"9B376FFFEF3173840CC465768E3328DFF78DD69A93FF6B9493EBBA10B1B09859FFB9CA60FDA9154F44A25AAD1A22E2E9D3A77BD3A64D7BDB7EFBED7788D6BA8B" & _
			"885A01148510832B57AE5C592A95566CDDBA755DA150D04208A45229D1DBBBD7AC787EC557B3992C6CDB360059A56AC0854A1F11115CC7831DB90D08A21A5023" & _
			"04219D91601D45F1CC04E8A8A8C24CF5E02E36EF267627503E8C9F07C232E4B819B0BA9642EF7D116AE7B380940D42D7915F4F56B80E011D808404FB0AAC42C8" & _
			"CEC590930F875A773BD80420B6A26C000C3671C6A0234560AD01A31086219A5C83355B4AF8D6BD0390B68C3A08A20A342C29C132856D03FD407CCDE9749A0CB3" & _
			"80C366CBE62D5FD8B07EFDB573E7CDEBF1AB558B9975A55231966581993175EA54B4B4B44C35C6B410511B47DA3F2C84E8DBB66D5B4F3E9F37C618589605CBB2" & _
			"24009DD45BFE2C0548FC5F52A90260BABBBBBB962C59F2B99933679E6DDBD60CA5F4AB1A3C4F3FFD7408210AFDFDFDCFF4F4F45CBB6CD9B29B070607FDEDDBB6" & _
			"2FCCE7474ECBE672C6182D88045B52921076EDA438C920A2DC1986819C23904B0B6813013664A25C3C4EC36B008E315174EE59021CE411C81CAC19C7C1EA3E01" & _
			"B27D06F4B617A0763E19AD50C5F5B44E87601D440AA115382801D521506E32A8631EEC79674234752178F24A98A10D203B0DE86A14ED27419F89840E1D5911A5" & _
			"42B4B8061BB697F177D7EDC640D5206509688E71C758D1C18C9463C7F12583D930D81022DBD6F6CCD3CF7C704677F78FAAD5AA6A6A6AC2AC59B30E98376FDE91" & _
			"EDEDED27B6B4B41C904EA7DB8C3169224AC596AF4A4485DEDEDE2DBEEF3FB861C386879F7FFEF9FB8BC5A20600D7750533BF6697B1B58F544E542A15D3DDDDED" & _
			"2C5DBAF4CBDDDDDD9F97524EF07D1FD5AA1FE74F2021242C4B4208C14A2900C83537379F307EFCF813F69B3BF7F3EB376CF8FCAD37DD7CBA94960D46183BD7F8" & _
			"0C4C846C12D57A3492955F518CC5AD36DA3C42A84DD40DC411984371CA1EA74F48DB8067115ED9D20F7BC1BB30FDC44FC1643B40B644B87335C215BF00484756" & _
			"C38491C08C026B05360150CD838312C86981987122ECF967434E5E08B3E715541FF80638BF03646760C24A3D803451A017C527065A2B48D218EF693CB6268F2F" & _
			"DED4872D45839C2BA174B4FA0D28CE4A62D498B9D6F04214A53186996CC7E6BEBEDEF33CCFFB3F679E79E6899D9D9D17B5B7B71FADB54E1B137D57A55289EEA0" & _
			"D11C861AC6B007B097CDE626B4B6B62E993469D2250B172E5CD1DBDB7BE5D34F3F7DDDE6CD9B43CFF30411ED5309AC313D7D542C16CD92254B669E71C619BF30" & _
			"C61C1786012AD5AA2A57AA22A8FAA4B596512A446449C99EE7513A9D66CF7399994DA55261DBB617CF993DE731A355D518C3446445ED8F31161F958A30F68F20" & _
			"4029C2A4361B4D6981E1C04092006BAEA1F39624646D402B83355B7DDCBEAA847F7F6433DE7EDE20AE39A713C5521134D007F3FCD5E0B0105500751047EC1AAC" & _
			"CAE04A3EF2E72DDD10F38F85D57D2244C70C70B100FFC97F83597F27C00A243D7058AAD50D62C42EF2FD5A430A8326C7A090F7F1F30787F1A3478751D140D616" & _
			"50866B0227309828AA2BC42930C100A008838A000461D936F50F0ECE9F3B7BCE8A458B16ED57AD56512E9741448A88486B43D56A15A572997C3F80D1060CE608" & _
			"66B7E0A53C93F25C91C9640E9E3973E6FF9D3367CE857FF8C31F3EF7CC33CFACF03C8FA494AF0A14ADC660AF52A9F092254B8E38E38C337E57AD56273373C8CC" & _
			"B2902F5ABE1FB0D2218C36644C047E3033E50B45D8B645E9749A9B9B72C2761C645D57DF79C71D72FD860DE96C268BA43526CA1608D4B0F2479900220862CC9C" & _
			"604308401B8694069605785200863158507874B38F7B569771DF8632062A1AC2CAE0EEDB6FC4FA2F7C0653A64C41F8FCBF830A3B00CB03AB10ACAB805F00421F" & _
			"EC36019D4B21669C0031650928DB060EAB085FB819BCE656706127C84D4788A2F2812857AFE10A5230D216604B8D917C88DBD714F16F4F0C63C59E10698790B6" & _
			"230B95C0D1542F36C4BE2C495BEB0545C05094460A08C05EB66CD97EEF7CF7BB586B6D2CCB124A29992F14696464847DBF4AA15251159B08420A0812A4A462A5" & _
			"9534DA20971346296588E8C8534F3D75F97EFBEDF7893BEFBCF3D7954A0552CA575B002282EFFB3C75EAD489A79C72CA2DF97C7EA2312624223B541ADA184E56" & _
			"708274C58DD260D60843463E3F42A552099EE7B125A57CF4E14738500A24888C362C4850A3D06994221092212212C0AE210D288326091802FAFB1536F4292CDF" & _
			"5CC5839B7C6C1ED2D060B896405B0608B587DEDEBDB8F78187F199635B50DDF904A4D704947B00E5838503B4CD033A0F054D3D0AD4322DC2F259C1F46D8479E4" & _
			"DBC0EE67A3DE41CB05AB4A2D3E11005A326900914B2AE643ACDD1BE0E10D25FC614D151B07150C01CD290963382A2C26395A8C532431406C0B404C711663EAE9" & _
			"6A94CA912D2D7EE4E107B95AAD90564A140A45E4F3052A57CA11721ADFF70400E37A1C450010842187A122CB9296D15A559572E7CC99F3AB934F3E79E8E69B6F" & _
			"BE434A39AAAC6CD53A3A98594AE90D0F0DB514CBE538C76548CB62D74BC39212BEEF47F64A47FE3A318924442DD2AD54AAB4B7B70F8F3CF208B9D2AA8F881145" & _
			"FE1C0488189FE7062500C33021EB12EE78A5826DBF54983FCEC6EA21839D430A7D2546D918641C422E2500064263A035410A0161B978E28EEBF1F16C0A222C47" & _
			"7979F34C60D22270E752D08439203B03D63E382C47E99CB4003B03B1F07CF09CD3C1C35B81F2104885C9428506E3A6479661E7967EBCD467B0BA5F61A0C0E80F" & _
			"18595722E30A18C3D0A6BE36120BABE23672228EC21E8A7B128CA9015EF5988008C4705329DABC69333DF1D8135870E04118181880D6510C24A5888E35C9F495" & _
			"8020829412B6B4206D1B44A072A9C410009824D854C220484929CF1242DC11C10BC4635D003B8E433D3D3D5B972F5F7EFEB8D6D66BC330CC4821351360DB8E6C" & _
			"696D456BEB38F652290218611822087C28150324313297C966F0CAEA35D8BE6D1BDC945753D6C8CD241650C465543474E7443743C677EFA1ED21EEDB15226B19" & _
			"3816C3CD127210A82A09AD086911BF93A2D6BD4C3A8D6756ADC1F68BBE80F60533E167A783C6CD84F09A0013003A00F4709C7188A8A0640C60A740DDC7D4FB3A" & _
			"D8446E2342E3B07BCF1E7CECC21B502E959049A5E0D8129E2D312143A81A8111033896868CD145C384AA96802264E2C596D42D98E3A211C5A96C1C0324F230CC" & _
			"B02D0B03C3437861E52A1C70E041D159098231542B694B5BC092129665434A0921095A192E978A08822A456513D22058469B94ED381BB66EDDFA93D8DAF33E5D" & _
			"405C8EA435AFBC72533A95DA39D43FF0A362B17894EB38705D8F89A053A9B4983879124D9CD8C9E3DBDBA9A9A909D94C16221EF9526188A6E626F4F4EC42DFD0" & _
			"20DA5A5A618C810045404A12EE25661F548F880990040486A02CC691E3031C1E0A1C60B5A03995023363B05CC62A6B04CBD38475E5141C1DD5FE14089614C8FB" & _
			"0A9BB347A363FFC3A10B2390ACC1D5A10841AC3588506D408813A4B09A8F03615333FD461B482B8DED1BD720C515E49A3C08499082A00D630884FD72551CA981" & _
			"C55613C6A772105260B850C66A3584E5E900CF575C5000B802513AC814BB88B18D3D546BAC636648105E59BD1A424A388E0322829456827A431B833008901F19" & _
			"E162B18891E1611A191966152A03621106A1A8FABE20A0944A7BD7144AE5EF0D0D0D0DD8B6FDAA2FB7C6803F0C40547CFF49CB758F19E9E979CF9A975FFE54A1" & _
			"5038C6755D2B934EC3B22C232DCB8C9F30418E1B378E9A9B9B7972D7546A6F9F80A6E616CC9C350B5B366F892C500282507DEC75DFF50382244649094CCA85F8" & _
			"849038DE3D12138E7B07C4C28570E6B6028A11BCD487635E7E1EEF7BEE2EDC975E896B428942916003909685F2E0009E7DFC411C7BC42128041548DB8EEA0154" & _
			"EF048E3BD690C433358BC01CB57DC529A6361A8EEBE1F9E75760B85042DB380F6C181503B8298D2F648133E541987CC869B0171D067BFF0910290BC1DA211CFB" & _
			"F26A9CF7F43D7874E0315CE956B02D6F232B192A6E138FEA108D4160125B45A1956D5978E18515D8BE6D1BBC9407BF52C5C8C830F2F93C060606B86FCF5E948A" & _
			"451A1A1EE652B1682AE592F0ABBEA8F855512A1601A28D9D9D9DBF9B3E6BE6AF5CCFDBC000AC31BEFF550A1017724044461009D773CDFE0B0FB871CAB4A937AE" & _
			"5AB9F2885D3B767E68ED860D67482126E77239B17BCF1E789EA71DDB86EB38C2755DCA64323C6952272D7F72393CCF8B3EAF01B41ED3049E0CC6C0128CA21698" & _
			"DDECE3073411F3DFF645789F3907A9855934C6AC991366426129BC67CFC307FFF93798BDEA2A5C962D60575EC01504C38C5DBBF740C76926D74735465DE3D86B" & _
			"6E7CADF6EF1870DAD5D303CD0652005525D09A55B8CCCBE094799F80F7F98F22F5B60ED80DE7983E7A06340E86B7E9BD78F755BFC7823FFE085F69D98C97865C" & _
			"642C03ADEB579F2441B5EF8F9FDB8E83BD7B76E396DFDE806C3687A181011E181C40A958A462B9CCD56AC594CB1559AE94C5F0C888A856AB60E65D525A8F2E3A" & _
			"E4E0DFCE9B37EFB15C53D38865DB305ACBD8DFF09FC401C62A8131067EB52AD399B43EF6B8E3966BAD97AF5FBFFE1B1BD7AF3F75C78E1D67E5F3F9934AC56253" & _
			"AE2907E60C8410BA52A950CF9E1E1A1A19662924E28063CC482EC78D19917510C4A86A89AE5C881FA10B077CFC67C87CF148D8008C52490D0F5A9B182E66A40F" & _
			"6D86F39B8B71F857A7E13B777D0D9F4F0DA3589648A73CAC7DE5150C0D0E626CCD62EC4C62A3528C153E3343DA1223434358BBE615A41C17A10684AB71999BC5" & _
			"1927FD00EE0FCF859335E03080AE5D4F1494113332331D783F792FF69B3E1BFFFCB38B7051F33A6CC8DB48511430D646131A6BDB0C500CC3972B15DEBC711335" & _
			"B734F3E0C0A0A954AB28960AB2502C8991E16151A956A0B4D936A973D2BD9D5326DF3E6FBF794F5BB63DD8367E3CC22080D6DAD24A6922D2FBBAD6D7AC05341E" & _
			"2484D0461B944A2521841073E6CC199CB7FFBCEB478647AEDFBB67CF94AD9BB79CD1BB77EFBBCAE5F2714A6BBB8908DA680E43058A42FF7D4CC5C4C59CA49792" & _
			"09E4687CC54A63C179DF41EE8B4742A8108624281E20114246433D8D2D6816801FBD0B4B8B23F8E44397E0BBC2C0B15D6CDEB409857C1EE3274C8052AA367750" & _
			"53C47D08BCD13DD4AE9D040AA53C76EEDC09C7B65102E34B29C6E9875C0CEFC7E7C24BC77D9AF6E891ADA42EC19A218C42D36716616EF8437CF5E71FC545EE10" & _
			"B42F6295DE973F8CFE1200570345FD83830644626864588E0C0FA3542E230CC315E3DB273CD23171E21DB366CF5ED5D2DA3AEC791E82200033CB72A904223200" & _
			"54C382FEEF57031BDF24A534CC6C7CDF27AEB248A552DC3D6BE6CED973E75C951FC95F353C343C77EBA64DEFF1AB95F706A13A40291D5960AA2120A3A7B3E3D4" & _
			"4F12A1C0C0C9968FB7CDFA30D25F793B845660922041357CE085E757E0FEFBEEC3E62D9BD1D2DA8AF9F3E7E3F4D34E47DB84F130FF781EDEB9E6113CB0EB363C" & _
			"5A92B0954A40AA51E67DAC90C72AC2BEAC43108628958AF059628157C17BC79D02EF7B7F072F0D0C0F0CE1AEBBEFC2CBAB5F465F6F1FA64D9B8AE38E3F1E471E" & _
			"75146A2D8824414A21F5F9A371F48A0B71C6633FC00DBE8B1C51DC3B40F596863123E300D8F7ABA258C8A35AA92C6B6B9F70CFCCD6D63BBAA64E5DDBD4DC1CB8" & _
			"AE8B300CA19492C56211420803400B214609FDBFAA08FE97FD00633E8885105A6B0DA51431B3F03CCF4CEE9ABCAE6362C777B5D63F59FDD24B1F0C5E5871B5E3" & _
			"B822B68BB4AFB897011843709C1067CB4968FDF8F970D20C5604921447E21A977CF5ABE8D9D583CECE4EB8AE8B5FFEE2DFD13F348899D3A7E3B26F5D860F7EE4" & _
			"024CFAD08538F5FB0FE1516B04C6108AC512DADBA911E2DEA7EF7FF5681A8FFA6D8C810E158CCD3803194C3BFBC3C8CCCCE2F69B6EC1DF5FF2556CD8B4094D57" & _
			"5241370000200049444154E92CCE3DEF5CE447F2B8EA5FFF15D75FF79FB8FC67FF02DBB66BADE836184D9FFC20DEF9F4CDF8BDBF0926B42368B8267C1E3366C3" & _
			"9A08627864E4EE83172FFE5A3A9B79399DC918DBB1A1948656CA2A954A260EDAF5D851BBFF4E4FC07FAB23685FCA608C81F6B560662B93CD56D399CCB34A29F2" & _
			"3C0FC680633FD0D0BDC049C68D0A0307508085738F847BDCDCA85E9F0807C0F9E79F8FB497C275375C5F3B87CF7FE10B38F5E453B075EB565CF0D10F63A8348C" & _
			"CF7EE4622CF9B7F9682F3F8AA140200C829A90E3B2F6AB02C17DBD36D642944B4504DA60BC0C7174DB81683AFF14DC7CDB4DF8C0B9EF0783D1D9DE813BFFF807" & _
			"1CBC7871EDFC3E77D167F0A10F7C00D7DD7043140F8828FFB7174FC17E0B8FC582C75FC17370900660E2DEC157C92B2ADCC852B974DFA429935F0CC2401A63AC" & _
			"6A252ACD0350FF2F427F5D5AC2C6C40A466BAD8CD6648CE9889B18747D002F8A76E24A0088A3E68F008C194660E2BCC51039022B0D03C09216FEE357BFC27F5E" & _
			"7F3D76EFDE0D66461004008019DDDD38FB9C73F0C31FFF082DCDCDF8C6D72EC1E1479C80B9479C8259BF7D088F850AFD7B7B21162C789550C73E1FEB16C6FEF6" & _
			"AB3E7CC3982C3466EFF736ACCFF7E0131FFD18BC948772B58233DFF54E1CBC7871849002701C07DFFFE10F30AEB90557FECBCFF0852F7D115A45BD85E432261D" & _
			"B804FB2DBB164F2673094CA32DC0A853231642CE564A09A30D13D17FDBBCFF457A021B4E8688C810512E7663C63064C2CD420DA3DF49BE2BC8609295863B775E" & _
			"ED86484B406B8D2B2EBF022DD91C5CD785D61A3169128C31686A6A823106B6ED60706404D7FCC72F71D5FE27602E397890352A95722DBDDAD7CADF573CD028FC" & _
			"E447104111304B03130E3900DFFCCDB5181CCEA3BD6D3CF2A522DAC68F6F8C9312A2274CECE8C055FFFAAFF8BB4F7C1C994C06AC35880171C05C74BB39D82A0F" & _
			"6659EB661A151F7382F2C70841744FE9F514FA1BD5149A5C8969EC59AB5D09731C1851DCE5C390C4E8B25D70472E8245D9C02289952B5660DBD6AD28944BB8FB" & _
			"AEBBF0FE0F7C60D417DD7BCFDDB0A585300C9192361E7EEC410C4C391C2978904E80C953A64419005EEDEBC7067CFB32FF8D97A4C1989C4E61C42FE281471F80" & _
			"2B24C230846BD9B8ED965BF1F5AF7F1DE94CA6F68E071F7800BDFD7D104458FEF81338F9B453A18D81B42C58937248930781915A0B3973830BE09AB1E4066AA2" & _
			"376C2EF075EF0A1E3BEB4FE078C831867F996AB571C47572AA1F1C157098F1CADAB518CC8FA0299BC3E73F773106070670DCF1C763A0BF1F575F7D35962D7F12" & _
			"9974BA6619FAFAFBD1DBDF0F2125408065595183268D49ED6213FAA7E281C6DFB95C134808580228E64BD8B963276CDB863106A9540A1B376DC2FBDEFB5E7CF6" & _
			"B39FC594AE2E2C5FB61CDFB8E41278AE879162013B76ED1CFD7DA29EFC27F93F25D73D9621E3B552C537B10250A3B6462D7B51E903B506CE9A330088A198B03D" & _
			"0820862B0D37A52E04DBB250A95470F1C517637C5B1BCAE50ACA95329A9B9A6BE616044011AA03FD604B410A895CEC22FE9C74EFB502C004914BBB2EFA823C42" & _
			"5DAD539071D4A0924EA771CF5D77E3C1FB1F40AEA909838383705D17A9546A4C8C11D9F6B0B78412FB718710D760E1FA5DE1A4D1398996C6D88637B702242739" & _
			"10DF23C9716304D507C8639F1035782A23D1AB4A08D76D804B8723F6109832793232AE07A5142CCB4273730BCAE50A841068696A061B03C7920011AAAC918203" & _
			"A750C12BD522A6B477231D5B87D732F9AFA50449D690CCE8A55229744F998AD56B9F45B86D0F5ADD2694680F528E0D22200C3572CD4D30DAA05C2E2397CB8199" & _
			"A1B5862D2DB434372775CEE8E6ACDD8A6D7E1E210BA42882AEEB86BE8E04C60D0460B07A2BB980E404C364E89613308839AA0852FD620D0836039B4C883D5B5E" & _
			"C0CCE00208C70298B0F8D04331A56B2A76ECD80EC7716062534F0072D90C161FBC08933B2763CDEAD578F285E7B078FA7C3843BBF054BE8AA54B6723D7D4844A" & _
			"B5FAAAEE97FF0A086AB4065A6B649B9AB0DFECD9B8FDF9A780620F8E9CB510BFD9BE1A074E9B8E830E3E08A55209CF3CF31CF60EF483C8AA591D158698D8DE81" & _
			"A3DFF6B6A892674BB0210CBCFC2C36AA32C8640132758B481CC342A8DDBA58317B1A95F44DEF02E2C19002800A983D8A6100A25A3410354C40C010E091C1CBB0" & _
			"B1F6C5C7306DC54E388775428521724D4D78FF07CEC3A5DFFE3632E9348230AACF3B8E83430F3E185FBEE46BB06D1B97FFD30F603C1B1F9ABD042FAEBE130301" & _
			"B0FF9CD94865D228964AB5EEE53F17086A5406AD356CDB46F7D429281BE0D19E1771DE211FC06F9B9B914DA5F1EE73CE41D7B4E9F8D7CB2FC76D77DE8942A91C" & _
			"A78236FA8A057CEC9CB331A1BD1D3A549052205C3B84752B1EC62A924883A1131750A329A8358750DC7DC54110BCE19CC1AFE77430C73736CFCC65224A99687C" & _
			"263668754488637646414049D9B835BF09875F7B035A977E05020A461B7CE92B5FC1934F3E857BEEBB17E39A5B01305CC781D61ACF3EF914366FD8847B1FBE1F" & _
			"1F3BF713383E1FE0BC1D2F437A692C5D7A187CDFAF057CFB8AF6FFC458DBA8B988AAEFE3D0C30E8593CAE0577B36E20FA5017CF14317E3F2ABBE8BCE5FFD0687" & _
			"1D7E188AE5121CC781E5473845DFE0200E5BBC18977EE7DB515D800DB4B050BCF666DCDABB0A43CA455332A3C4F57BC1B5FEC1481D8CD1E89A3A758F94124A29" & _
			"7AD35B806820854144FD445460E671C4D17A8F9A01B8915225E267049002E31E65E1CC47FE1DA75C772CD21F3C14C60F90C96470C38DBFC5472EB800BFBFE30E" & _
			"30806241E2A1471FC5830F3D040270E1255FC577B247E2C67FFB3B3C5E214C9F3811F3E6EF8FC00F6AF9FE58C1372AC66B6501C96B81EF63F69CB9E81ADF8615" & _
			"03FDF8D5B3D7E15B0BAF86F8DE0F71C537BE8E5B6EBB159663A3EAFBA846ADF138E98413F18B5F5C83969616683F80701DF877AEC3B37FFC396E3140DA50C425" & _
			"90ACEC5A6F80A915C78420A9B5A6D9B367EF8A11BFB70453287CDFA759B36797264DEA1CEAEDED9DEEB84EDC4F1F997D4E54BD61B44F1250F12DFCB8BA17DD3F" & _
			"FA0A6635FD12E93367C2E8102DB926DC76FBEDF8FD6DB7E38F7FFC03FA7AFB20004C9D390DEFFDE88538BC2F83C7BE7C1EBE571C815FF071EC5947A3BDA30323" & _
			"2323A386571AC19FC615DE080C25FEBB51117CDF477B47078E3EF66DD8F49BEBF12F558979D77F13DFB9E406BCE3855371E335BFC0D60D9BA10DA3B56D1C4E3A" & _
			"F9249C77DEFB4152C0A810E43AA83CDD8B1D3FFA7B7C37BF0945DF439A746DAEA1DE771097C8A38E248E490E7CDFF7FBE3737C6B288031861CC761CBB23631F3" & _
			"41C9C85ED4EEC8310E40353790F4C5A6A5C64B45175FA01770C5A51FC5CC3DDF86FBE1630127321EEF3CEBDD78E759EF1E5D76BDFC013C7CED47F0F7839BD05B" & _
			"7190F56C9C7CDA69FBACFEFD393EFFB560620038FEA49371E36F6F44A16AE33383DBC0DF7F2FCEFCF08FB1E42757ECB3D54903306423F8F5D3D8F6B34BF1D5A1" & _
			"6578A6E4A15918E89AF01B737DAE7317711C1C128D4829F7BC657080E4061B631004C1CB4474362779604CEDD208181053AD50AC41C8098D67F31E3E6656E28B" & _
			"3FF9088E79E86CB49C7C06C421FB01CD6E6432FA2AD04FADC49E3B6EC6839BFE889FFA15ECADA4C095112C386021962E5D8A521CFC354CD3D68026707D14AD8E" & _
			"C0D547B6C00C8AD3C004DE2D954A58BA742966CD9E8DAD9B376308697C6A6437365EFD119CF9C83BD079FA7B200F3908E8CA45FEBC10829F5F8FE17BEFC493CF" & _
			"DD829F96F76045C9450B19A851C21FDD0C12F74632401C86214FEAECDC3E6BF6ECDE6AB5FAD6B200424A4C9B3EFDA5DEDEDE08C066709403502D06E064B88FEB" & _
			"5DC11A409334D858F2F0D9B080639FBA06C73C7323F61F3705692B0780510A47F0FCC00E3C860A9EAC3AA0C0464A1AF48721DE77DEB9C8E672181E1A6AA800D6" & _
			"A95B62280E54A38BAB07A631676FF4AAE17AD2CD80520AE3C68DC3BBCE3A0BDFFBEE77313E9D46A562E15B2170D79A5B71C2BABB7140AE0B6D995680057C5DC4" & _
			"4BFD3BB1DC0CE181C086EF472B5F99BAA047D746B94E749160970C1863D65A9605A514BD512491AF3B14CCCC465A16A64D9FB66EF9B265D5542AE59AA4C60B6E" & _
			"8032EA0D2235B09B010586270C100ADC1BA671BF55C5B8EA5AC858888A08FDC6860C235FCA12C8178A58307F3ECE7CE73B5128E4515BF4313DACA1E83725040F" & _
			"84980646832101E18089C16481A40D63749D20522B080154CA659C7DF6D9F8CDAF7F85FEFE41789E0BDB309E2EB8586E1B8CAB6C82CDA636A831606C689D4216" & _
			"0669325089B967AE5500EBF31D31C99489C835842036C6D0D469D39E8C2D986066FD96A088212256418096D6D675ADADAD1B7CBFBA4048C9C9387FBD32587F65" & _
			"148D2E1374DC0598038334A1A46CD479FD8066C1304243E9A8CD2B0C037CFAD39F444B4B0B868B154827075615083F0F591D04957B20CA7B21940FD2E5A84B27" & _
			"1801E912D8CE82EDE668665038603B03936E83C94C05A7DBC17606B0B308C20AA64E9F8E0F7DF083F8DE3FFD005ECA83321A6902C808F8DA4639092819C81040" & _
			"A4A11951BF2033EA8BB85EFA6511BBCE88CF88E326512B0CC370EAB469CF58B60DDFF7F98DDC6EE77555002104C2301493264D52D96CF6F172B9B44008997039" & _
			"243247E3561C48F260AA2B06239EAA4932C768AA12060C650003862D0506878670E229A7E3F4B33F807C7E104E7E0BAC81D590A59D90E55D20E140D80E844C01" & _
			"560AE4E640560648B702C2893980CA601D82833CB8B8079C5F031356C06CA05393A03253A1DBE6A324BAF1FE0B2FC28D37FF1E3BB76F46269381D6D1C0A92081" & _
			"1A172945A2AC7B9EC6A9E0B125F10821E5C4070868A5B4686E6EDED23AAEF5C5B8B1C5BC2582C051291480899326DDD5D3B3EBD3AEEB9236CCA2067A725C1D8C" & _
			"854DF5223253C2169EB080709DD6AF964E322C010C162BC8B676E09B9FBF10DEBA1B60ED7E0E8E29822C1722330534E52890DB06916A03D9D91AAD2C49AB160F" & _
			"C4B422D1A8152B18E5838312D81F80A90E800B3B61069F85D9F318429941E7CCE3F0F5CF7D181FFEDCB7602C859C2360B83E0CCABC8F554E63790993BC3F26BF" & _
			"80684CFF5829854993263D3079F2E4C0F77D11F7FABD3514208EAE0D33E388A38E7878FDBA759BC230E816421A8EF67EA8F9C908178A780222C1461A60621741" & _
			"0D2E32E9EF9744F00DA35CD658D826F1B5F7CFC4C2C22D08FAABF0C6CD06351D0691EA80705B20EC34C872A2CD2344CC29180F8144F1A8A8CD0C24B42FD2F6C0" & _
			"5E1360C683431F66DC7C707508A6B21756612BF4C63FE2EC0EC05C3007573FB0032B7A15329E842311CD06A21EEED43A7D1A829C1AF7643C2B4888F89098C144" & _
			"0C414228A5CCFE0BE6DF9098FDB70C143CCA0D0481686B1B5F1E3F7EFCF53B766CFF07D7959C10E70B0631457C3FE024264FDC02D7266A93959FB80D298091AA" & _
			"46478AF0CDD3DA71FE29DD68EA9C8CB2330556E77488D4444827179148DB4E44DF2A63B6F064B527263989C012F782A86A8198838984134D13590ED8F220DC56" & _
			"98EC5450EB7CA8918DF8D07B5B70E6119B71EDDD9B70C523FDE8AF1A3479229AF56F50DE51753253B70D14B7CCC4BBC2257D935A6B2DD2E9F4CA295D5D4FC6A4" & _
			"1BE64DC112F63F70030C222C3AE4E0ABB76DDBF619226A2632060C6188986AD0101AD89E46DF301E334ADD570871FCCC34AEF8C00CCC3D60268AEE1494535360" & _
			"A72742782D1076069076C410CE118D2C7303B772DC2082A4219B1ADAD4A801A1A058196A4D1C16E0A420A50D213D083B87426912AC191370F1873B70DAC11BF0" & _
			"B5DF6DC1DD6B4B68CE58F194336A1DF13C6A32D8C4700825DB4EC59693994870A954A6430E5D7CC594295374A954126F143FF01BAA0049C770E0FB62FE82053D" & _
			"4F2D7FF2CADEDEDE7F705D47715C0060A2787A390AE844038742920D24FB05696654AB0A971CDB862FBD6F0EDC8E191871BA60673A20BDC8BF9370223FAAAA75" & _
			"80A5D60D147F6A0CEED428E36834084322B6168CD865D4E9E86A13CCC28270B270D1092D3D144433A61FD2821BBA5A70C5EFD6E2FB0FF7C3B125248D8E87EAFC" & _
			"368957300DA6810980525A5BAEEBAE386CE9D21B83302421C45F64F7D037A4252C06850C11D1DBCF78C74FAEFBF57F9C630CCF13028AC116108FB8272D518DE3" & _
			"6271CD4000500C94AB1A3F7DD7245C74D65C0CBB5DA8A6BAE0A43A4076265A49AA02A32AA098D0D134046294C0AA09B953E33C56D2A592B4A35144414F448090" & _
			"313720C5CA106F3793149708104E0E0E0984D28399E0E09B1FF5D0965B8D8B6FEB41DAB3201AC0A4B8EC57C7FDA9860011110C9140502D87871F75E445EDEDED" & _
			"41A552A17DF532BC65142081618320C0D469D3F2072F5EFCD1C71F7BECA15C2EEB0941C61823B8363C4CB56EA1E896981A834EA5AAF193774EC4A7DE3D07FD56" & _
			"27EC5407A49D06B40F56010C254BCAD498BE91207A092358329A9EA07DF14F422F1FE137BAE63EA2552F40C28ABD79BCE54C4C524964454A102770D2F6409929" & _
			"E8D78C4F9C1D8D6E7FE9F63DC878B2C1E973435F10D72D3F11838847F2796BC6F4E9979E70E2894F054120FE52ABFF0DB500C9B879B95C16279D7ACA53CCE643" & _
			"CB972DBF5E4A21B399ACD146450CAC5C4B8A622F4CB0A544EF888F2F1ED98A4F9FD98D416A8365A740BA0C2E57E3551EB32B71CCE66D74039B77C2E6A96A2B37" & _
			"E2FB6D48C6938CA0F65CD65C02C5FB13D4320711139C25FB1640444A95BC87042C278D41D58E4FBF7B2EB6F505F8E9130368CB3A50DA8C4A0DE3FA034B69C1F7" & _
			"7D53AC94C5C72FFCD81353674CFF4E92F6FD2537D9A6CB2EBBEC0DFD82D8174ADBB6F5E4CECE2B2EFFE93F5FFCE2EA9755CA712DDBB639DA2E235218633454A8" & _
			"50F27D1C35733C6EFDC27E90AD6D00792029EAACE11CD3B4C5EC9C09592325FCFF260A21234AB7463753C712EA1B4BD43638478DCC8028DE658C803885E49892" & _
			"05220E34494613AAC9BE44446015464A9AEFC319DF5F85E5DB46D0944947ED6C144DCA69A5A1B5E652B582E66CCEFCE377FF11471C75D409B7DD76DBA39665BD" & _
			"269DDB5BCA028CAD100230F97C5E1C78E081DFBFEF81FBCFFBF995578EBFFDD6DBF4CE5DBB64A95462AD35799E0BD7F5307D7A378E39FE247CA27B1D3C670895" & _
			"5211920A35C147141BA6C6CD4B31354B2DCD1A05BC348048B5C89EC6101DC75803D5DA17633D6800A96A4A84D81588FA0E64718C90600DCA305216F0E3F3E7E3" & _
			"1B8FD858B3E665140A0504810F22814C26C36D6D6DF49EE38F571FFFE427AD85072EBCE5EAABAF7E341EA537634BD1FF2B2C402301E559679D75D192254BAEDC" & _
			"B56B97DABE6D9B5CFDF2CB2897CB347EC204CC983E1D5DB3E6619CBF05C15D9F4110680841A82328FCAA025242E644717691D417EB1B4013F6B575E3D899E53F" & _
			"7105F5899D9836ACF69D0DFB0F450A1259096D18AE4D08DFF67DF45017563EF30486868661DB36CF9E3D87BA67CD34933A3B399D4A55AFBBEEBA452FBEF8E286" & _
			"6C364B31A722FE920FEB0DD7B006D209CBB2C4638F3D76557777F7FB72B9DCD10B0F3C502F3EF4500902AB5051E05711C0C5C833B7C1CA0F40782DF1362C8D9F" & _
			"55175F92D753BCF2EB742B63FF1E0B34D0D881F55125E0D13A216A815C6DE3291E0DEAD633BA28D01424E11706C15B1FC6E4A3BF8159D3DE03CB76002228A538" & _
			"F07DAD95B2972D5B76D9DAB56B376432993FB99BEA5B5A011A95C0711C1E1818E055AB567DF6B0C30E5B5EA954DC72B96C985930C774E1C687EC7B11B0BC0662" & _
			"E006D026A6968B9661ADA28F7ACF04BD6A9DA3713E719472D41563D494F618502ACAE94483C0450CE870434F4F436609867452307B57222C0E221012842247DB" & _
			"044945443680E5CF3CF3CCBF30F31BB61FD09B46011AB001F63C8F1E7CF0C155DDDDDD97767474FCB852A9A864E3241616737E37C11F89605C6E281B729D4E2E" & _
			"BADB328658C3083B10CEAB67EDC7361D801B384BEA59008D8AD0C7EA40944130EB08291676ECDA4CDDBA7052D8E2DA14349304AA235149BA650A132B228A167A" & _
			"3A9D1E7AF2C9273FDEDBDB1BA65229FAAF18BDFF572840E39292528A3BEFBCF3A7EF7BDFFB96A652A9B3C3300C8960B3B499AAFD80AE8048D600A2D12B1651F4" & _
			"1D56C0B60791EB8A6284626FD4CD136F1733EA2DF1966F3C2A3ED887C168D098285310E0A0027632104DE3C03A8429EC81200121ED1AD49C64188DFB121149B0" & _
			"AE80FC3E263983482936C6984C2663AD5AB5EAE2FBEEBB6FF57FB591F6FF3A05A8CDDCD936EFDEBD1B37DE78E3C7CF3FFFFC054288B96CB41624A53155661D52" & _
			"422E4EB55632110F574AB0AAC0EA3C10D98E2310EE1900491BB23B83C2E6FB80C2DEA82094A07D8DBD80C98EA11C9FCB283DE057D1D898B00A6BDA52645B17C1" & _
			"DFBD1BD2CB82BA250A9BEF025746A26A63BCB750ADFDD170B2810DC8844C3A0091646656AEEBD98542E1EAE5CB97FFC6B6EDBFAAE9FFAB5980C415A4D369EAE9" & _
			"E9197CFEF9E7CF3BFAE8A31F2F14F22962A5C91D2F616798C30A09B263C0454479B91040E8C39A72086CB53F6EF9FB7FC2B39BB6C20270E26187E0982F7D02C5" & _
			"5DF7838BFD80EDD6A176A23191001A82C37AD9961A023D0E4A70661C0DEE6FC56F2EFD265EDCB51B2921F0F6E38FC1A19F7E3FF25B7E1F11508B4809A2BD0605" & _
			"48266969C8901EC16B055887525A76A9547AEE77BFFBDD97FBFBFB85E779E6AF69FAFF9A2E004404AD35A75229F9C0030FBC20A5BCE8F0A54B7F55ACF886BC56" & _
			"C364453B034941C986CF10D16CA0C9B6226DCFC1555FFE07FCC7D63CBC940D43C0E3773F8BBFF7AB78FBD7FF0EF96DF74308BB1E95C5F97B23252DD5391850A7" & _
			"5C8E95408710CDD36157DAF0C3AF5C823B0715DC948D90194FDCF410BE6D148EF8E43B30B2F16E4869830C814947350783049B204817E4B529A343BBA929BBED" & _
			"EE7BEE3967C78E1DA5A6A626D25AFFD585FF5753808687F63C4FDE73CF3DBF26A2EC92254BAE2C73AB46CB74437B5F1024520C1244C2020B1B46FBC874EC8F97" & _
			"7EFF106EDB9A474B930B2B0C210C50C938B8F6A19770E809ABD1B2682E82FE1D20DB8B567F8DAC2821AC1EE3FFEBB41C00013AAC2233611E1EBFEA36DC37A0D0" & _
			"967540610848423EEBE29A3B1EC3C26316C39E3C1566B837DA73D8D4369A8C86E2B54F9C9BA8393DCECA655283CB962D7FFB9A356BB665B3598AF7FDC19BE1F1" & _
			"575380067C40A7522979D75D77FDDCB12D7BD1D2232FCF772C56B2E76962923193AC20921246DAB0B487A79F5983920DB46A1D912C69862B34064078E9859771" & _
			"E211A7C37706206C2F4AD912E3DF904ED6B7AC897A0E120A7C0640B60B51019E78762D94058830041B862620250C7A4260FDCBAFE0A0B9F3512A0C45198B1180" & _
			"56518B0B1B625D51987C84956D6D2D3EF5E8C367DE7DCFBDAB3DCF7B53F8FD378D05685402C771E4F2E5CBAF98B9DFFEE3B2F34FFD87D22B37186942C0720922" & _
			"825C85701006550CFB262AF0C5CD1B5A46A97A20181B76EEC0C94A006E3AE2FF4F18771A765B13A0467ADE7853E91AD000296CF8D52AF24144116B8480416C45" & _
			"985196C096EDDBB1840F46D1921014F3FD908EC63B956FD81D67E5E69F3EFCD4F2273F78F7DDF72CF3522999B076BE5956FF5F4C01C6B27136DE8086CC400F0E" & _
			"0D8BEBAEFDE5B7DE76E23B0667CFFBFFDAFBF228ABAA2BFD6F9F7387F75E4D5023C550554C16A38C0212268728934DC701874423519C12DB0CAEE6D749A75BA3" & _
			"76564C62BA0D28414523080A9808265170024486524026B190A1AAA82AA028A8E9D5BBEF0EE79CDF1FF7DE570FC424AE6E9098DCB5DE7AAFA0EADDAAB7F7D967" & _
			"9FBDBFFD7D573DEA7CB888B3EC229012A44EA908FA6011090AEAF2C1918D04344E50CAF18D1FAA89875C752A680D13FC842D0D8E46B203B2AB984F7046002423" & _
			"4822481E2891330267BE728814093F7A28E543CB85AB20A59456331983AFDFBB797FF39DAB5F7DE5DD4834C689203E8B9BF0B33E9B2F4D338831464288B0D5A9" & _
			"CEE40421EF4E6D5D1DF6ECDCF666E9A5331DB96F4D9425E34A191944F020A582461672A3BEE139F7D9281418C0194C00E53DBA4372072405A0B18EE27D8A9919" & _
			"296068EA921D9ABF2116D13014F23218643303B8CFD74FBE6A0332948B5EDDBBC1156DBE841C049470FCEEA413972CAB8BDED8E58A97DE7EF9B5774D336210C1" & _
			"F90BC6E72052E48B6F9E5327D0CEB6F1038E3F95919929AC4402676A79869A45F1785C96F7EB9F77C5E597AE74B48C0C39F4DB826DFA0927EE73E693046CAF01" & _
			"A38777C3EF7755C3D33498E40120B41343771D1830A02B6CE1A4EAF21D03571DDD2392EA9423600A3A16A2898407916963C245BDB1BAFA7D2066C0F02488016D" & _
			"0A1818E3E875416724ED76900A04278500098F94747962D05DC2281A70FFA51313EFAC5EB3667D341A652A2C1DA63E1B5F9ECFF33C9F7D35E0353E5748A0B3EE" & _
			"00690398D4BD7B8FCC2953A63DB46DDBD6B99B36BDB73F2B2B4B23222FC5CCCD39B5B7B7A3ACAC279B7CE59445DB3FDCD12B1A31BDDE032ED334D5A4C4E6FF26" & _
			"19C905E33A92F116F41DD305376CCCC5339FB4C08E1A900AC8B42CCCBEBC1C9D8614C16A6BF68F8152845389413F27007DAA4F29AF7624804115D04A2630ECCA" & _
			"A1F8DAC68FF0D2311B64EA109E42BE95C4ED5FBB10468986645B73C7C8991090D649650FBE9D7925970866356596F71FF4FCBE4FF64F3878707F4D4646261342" & _
			"A4DABD44C493C9A4C8CACA6253A75DF5F3F72B363FDBD0D0B0C7755D752EA3C0596B0713112512093564C890DED75F7FE3F2E696E6619CB11D1B366CB861DDBA" & _
			"B51F9BA641BA6E3022422291102525A5B8E6DA6B9FD134FD5BF7DC7D97FBFAEBAF69A3478DC2D76FBD03938BEB88EF7C164A8F827814300DE88D0E36ADD8891D" & _
			"F5EDD0018C1FD615036F1C8FA44E6032BD78A4F97504A200611CE0FED2F1FAA932AE0A90BB0A52B8205387DA7718EB5FD8803D0D16620C9834BA147D660C81E5" & _
			"B4074AE30AD269874AB6400EFD16C485B7292FD14200F322D188A6697CFBCB2B964F3B78E0C0918CCC4C0E400921E0BAAECCCDCD8D7EED9FAF9E5F5058700B11" & _
			"D5555555DDF3E28B4B579DCB2AE159C503B8AE87FCFCFCC8C489132B9E59F874FFBD1FEDD5264F9E7CECA251A37FB073C7872F1C3972044208F4ECD98B6EB8E1" & _
			"8667323233665996E5DE7DD75DDAD2A54BFDCD916B987DCFBFE087338721B6EB2928A70D14C9010C035122A0A115CC3021BB1521E9014C31FF58160235C87F1D" & _
			"2A93848A6548B1D8AA94FA7720511AC0C9FCE150D21922B60559DF00323588FC4C242D0B24249414908993303372C0C67C0FB519C371BCBE1A4545C52A1A8B91" & _
			"69E85E4E7696E67ADEF625A38226E10000191C494441544B965CB5AFF2E33A4DD3611806468EBC68EC15575E31CF348CA12D2DAD8E6118DE8A152B86EFDDFB51" & _
			"652412396BAC60E7CC0182F0CE4CD390BB76ED9EF4E28B2FBE0D3F6733162C58805B67CD5ABB69E3C64555D5D55B67CC98F1B39CECEC2B3DCFF36A0E1FE6D3A7" & _
			"4DA3BD7BF72ACE3985746FB3BFF3033CF4DDAF836DFE25A86107C8C88632A3205DF70D2D00E25AB0EA79076C8B4247485156A5C1C03A2062E17838C19785F515" & _
			"C6FDF0AE94F2F5A4840BD88EFF3D4E1C70E2307A8CC4366D0296AFDB87D5AF2E435E5E3E9E7DEE796465672B43D7283323E6C562312DDEDEBEBF62CB96BB8594" & _
			"66F905E5B79594F4F8272925B76DDB763D611E3870E081DFBDBCFC414DD358303AF2B79F030090522A2A2C2C5C6B9AE69F3CCF9B268470DE7CEB2D6DF6ECD993" & _
			"264C9830695C000AB56D5B6ABAAE1DAEA9454D4D8D021072FD2922A2A7E6FE12032EE88D59B73C016BC78BD02A5780DA8E024626C888024CF3BB738C524657E1" & _
			"36C0B514E45B51D85A0E5F8709A02FFBEEE34D5D28E175A08DA500EC0087E85ABEF163459017DE865FBC598B5F3DFEAF686B3A9E3A50B4B7B7212727878490CA" & _
			"F384662512D2348C3E975E7AE91BE1E7934C26E17A9E9B4858A6A6E947B76FDF36CFF304699AFEE5C10412111CC741D7AE5D316EDCB83BDF7EFBED0DDDBA752B" & _
			"BBE9C69B3CDBB695E3D8C4B9C600482104499F645105D8B8A00CD881CC5BB8E0094C9F76257286DC02593A11ECC06BC0A13781B6C300D7417A0C4A8F04077BD7" & _
			"6FC93202A41650D35107B6BF83ADCA178556E12C92F48D2F45281FE62B88BA96EF1859DD2107DC84E8C07FC6FC25AFE2270FFA1134248BAEAEAA523B76ECA4D2" & _
			"D29E2A6925949006B262598CE08F4A2412094829A527042CCBD6344D77DEDBF0EEAD070F1C68F443FF97E418186E039C736559164D9C38B1EEC20B2F9C3E65EA" & _
			"B41503060CEC77B2A9D9D3348D7326141191273CD2A59256D222D77539700A39161111DAE271D85612CC6B83C828042EBA076CC03540CDBB50D5EB214FEC05DA" & _
			"8EFA804D3D0A68018C5B3303BC608744AD4A2978214D58CA079828D7F67506BD402833D219D47504A8E757A1BA8D01CF2844C28EE3B5575E4AB191845B951082" & _
			"962C790193265D42B168948E1C392AE63F399FD7D5D7D194295370F1C563C9751CD88E4BA66926B76CDEF8CD8D1BDF5B1DEEFB675210F99B8E00C1B31242B04E" & _
			"9D3AED715D771AE77C5D3299ECEEB9C2E59CE9C448B9AEE769DCD0EAEBEB21A5781AC0D5007201C8A09084A953A7A25BB7AE3E0F20F7404EAB9F100E9C09EAFF" & _
			"35A8E66AE0C856C8C64AA0610794DD0ED8AD40BCA1231F08F0FC44CC4FF482D5AF84E7C7042306A56502D945A0FC41A0C281605D868072BA43910EE62620ED16" & _
			"447513FDFA0FC03B6BD7F9E28D1DDC42EAEDB7DEA25FFCFCD1230FFEE421EDA9A79E2AF8EF5F3DE601E04B5E78815E79E555D1A74F1F30C6B065F3E66F6EDCF8" & _
			"DEF26834CA01882F5D25F0B4A2901442F0756BDF39E83ACEB5A3C75CBCCAB6ED42CFF15C108813D71289C43125E5CDE3C78F3FFEF6DBEFDC1A72E308213076EC" & _
			"587CEFFBDFF74919C21631118470C0A50B231281D6B51CD4A39FBF172712705A8F43B555835AEBA1927120D9E21FFBEC56A8E47190D11914CDF3F7F9482720D6" & _
			"09325600965D06A373319861FA53BC9E809B4CC049B6079183412889FBEEFB2E0E1E3C88D5AB57777CA09A26A5947CD1A2DFB68C1839E29AF20BCA7F53525232" & _
			"EED8B16372D8B0E16E4666CCE01A47CDC1EABBB76CD9F4851AFF9C3940DAA49088C562B469D3C62D4AA94943870D7F2E1A8D8E0208AEEBFCF10F7F58F59DA6A6" & _
			"135539399D6E618C69524A0F001F357A34FEE7F1C791979B07DBB67D49B86077C88C65C015020DC71AD0D8D88864328168340385455DD0A56B098C2EA5B08269" & _
			"3186B4492D04DC04D4510D8E681DAC6FC71B4FA03D5E0F290418D790959383CEB9799052A2BDBD1D76D246515121162E5C88254B9662D1E2E7B17BD76E789E47" & _
			"BED3CAA2DDBB76D50E1D3AF4AB0B173EF733D773EF2DEFD7DFC8CECAAADFF0EEFAEFBE5F51B1DC344DA694FA421B44677D2EE0336ADF944C265541418156DCB5" & _
			"EBD7A0E0363535BD525D5D85828202F6D65B6F7DEBF5D75F5F505858E8CE9C39D3B8EBEE7B50D4A50B5CC7861608521B8601C608EFAC5D8B9757ACC0D6AD5BD1" & _
			"D0D000CFF3A0EB3A0A0B0B3172E4485C3FF33A5C7ED9657E5D42F8742EC4825340EAF8C710310D54565662E5CA95D8F0DE7BA8ACDC87C6C6460821601806BA76" & _
			"ED8AF2F2725C76D965983C79327273F3D0DEDE0ECE19A2B1185A9A5BB06DDB367CB0F503B97DDB76964C269353A74E1D7BE448FDF6DCDC5CF4E9D3F72B8EEBF4" & _
			"B2ACE4EA03FB3F69D0348DCE26FDDB79E900E94E4044E4799E725D379545EBBEB8AD6BDBF6B7F2F2F29EB978EC58B7FC820B742164200EC1A00018BA81B6781B" & _
			"1E79F861FCF6B7BF4D69F69CE9324D13B7DF7E3BFEF381077CFA56CF433AFB46D8297CF2C927F1F0C30FA3B1B1F12FFE0DFDFAF5C3CF7FF10B8C1F3F1E56C282" & _
			"54128C18CC88094DD355A2BD9D8833EFCD356F5CBC6BD7CE0F4CD3D49249CB0B15BF4DD3F459A1CE83D6F01782090C0B049C73689AC60363082292894402C387" & _
			"0FA769D3AF52ADAD2DCAB2928A71463E67AEAF06D2D2DA82FBEEBB0FAB56AE04F0692590B47A3B6CDBC6BC79F3D0D0D080794F3C81ECAC2C48A9C098BF2D99A6" & _
			"89D5AFBF8EFBEFBF1F5EE01C6177F2F4F70BEFF3F1C71FE33BDFFE367EFFCA2B282D2985E3D8505088C7E390522A29244563319B3166756C7D192CA83EC91009" & _
			"FC770D094BEB048AB4E8A0FCDA817BA2A5A5851CC761BAA6077C3EFEF1886B1C73E7CEC5AA952BC139871022C5EC79864A64CA41962F5F8EBE7DFBE291471E81" & _
			"100221268F009C3C7932A5321A38E71999C5A594A9E8D1D8D888F6781C2C884ABE83F0606E081042C46D3B591DE43F2ABDB4FB770708F91C4EA182DA410DE7DC" & _
			"21821E284C9102108946B17BF76E2C5EB4286590BFE60AD1B78F3DF61838D7F0C31FFE1B0CC380E779104260FAF4AB306BD62C3CFBECB39F292A95AE23601A06" & _
			"1E7CF0410C1A3408AEE3801183F45949958082A669686E6EAA3D74E850DC344D9C6F28A0F3D6017CA64C06DB4E1E765D374EA05CA59452018684738E4D1B37E2" & _
			"D8B1631D7BF8E7C83D92C9241E7AE827A8ABABC5E38F3F0E5FDC5220333313BFF9CD024C9F3E1D8B162D4645C596544219DE231A8DA2B8B818975C7209BEF18D" & _
			"6F60D4A8D1F055BBC3C0AE10907D292595226287C2ADE46C123D9EDF0EE0F39FA5F87AC3D7E4CFC34111C9D4FF7740C370E8D0A1E36D6D6D7BB3B3B2C62AE593" & _
			"E9110384E7A1BABAFA9495F979B71DC618962E5D8A7BEEB90723468C809F60FAE1FFEAABAFC6D5575F8D93279BB06F5F65EA14A0EB3A8ABB7645AF9E3D919393" & _
			"03C771D1D6D676AAC6805F65544A49C53827DBB6B70591E7BC03829EBB5270605CC97D3928EE79CAD375788621494A688E0326848FEBEB381D30C771645555D5" & _
			"D261C3867DC5B66D498C58387DF5D786FDCFBA84101833660C4A4A4A82D5D9810CB203A1894E9D723066CC984FFDAC655968696949E50FA148B5FFBBF917A034" & _
			"A55462C787DB57388E834824A2701E5F67B714AC14246330DB2D4EC213AD4545E8B1E7A38CF2F7DFBFBCA1A4B4E193114337796604DC75534E002225A5445D6D" & _
			"ED1F2F1C3CF8E70444C228C038477171F1E70EFFE91163C2840978EEB9E75090262F1F042B30E673F78532B5A9A4500808292182E49002C52FA4B39129454A2A" & _
			"8F71AEC5E36D5BAAAAAA3E09F67F75BEEEFF67DF01A424371A55653B77F718F9C6DB37BE7AE7ACC74E1417B51754D73E5456D330B8EF9E8F57BE75ED8C6FB677" & _
			"EAD4C23D8FC098524A29D334515B7BB8AAB5AD6D5D6666E664A5E0018A8410B8E8A28BA873E7CE686A6AFADCBF4F7E7E3E1E7BEC31949494C0755D8402CC7EA2" & _
			"E8276FBA4EA948D1DADA0AD775118BC5909199090ADAB8EDED89D325EA55207C491A37A9A6BA6689EBBA300CE3BC0EFFE7620B504C4A246391C6A891F96FD357" & _
			"BD3573FBE03EFFAFADB4D7EEA8A506E6B4B7CC98B474D9BCD5B7DDFA0DA169A96D0000B36D5B1EAEA9F9C9D061C32EB7AC04D3344D5996C5860E1B8E2953A660" & _
			"C992257F751E10366AAEBBEE3A0C1E3C3875DE4F4F100D4347737333D6AC59830D1B3660CF9E3DA944303B3B1BA565A518317C04264E9C880B870CF185A5BDA4" & _
			"4F75AD40522A0FC4783299DCB373E78E17423C04CEF3EBEC26818C414FDA5433B07FBC71FB47CB8A79CE6D133E3EFABAC7B3800C288F93D7A976FFF57DDEDFFA" & _
			"C09E89E3F71B9645E05C01909C73DABE6DEBA66EDDBABF94D329FBEB524A973130C674659A26FD35896058B8915262DCB8719833670E74DD8094E15C9E4A2171" & _
			"5F7AE9253CFAE8A3D8B66DDB19DFABA2A202CB972D47565616BE71F3CDB8F73BF7A2A84B112CCB22004A4A01C33069EF477B1E38D1D8684563B12F84F2E5FC8A" & _
			"0000B810ACCF07DBCB8EE7642C2838D67AB528EA9EC59C24539EC7887122A6F39CC6C6918AB1FDA4028A85E03470B2A9095BB66C7E60CAD4A9D31DDBCEE25C13" & _
			"ADADCD7CF79E3DEACFE9A875B08EF90B70CA94A998376F2E4A4B4B53AB3F741CCE197EFAD39FE2473FFAD1A7D4C54FEB5F0000DADADAF0E4134F60EB071F60DE" & _
			"134FAA921E3DC82FF332DD719C753B77EE7C59D3753ADFF7FE7395033037628A3E1F6CBF36F748FD74AB73419599DD799812AE509E03A584024149E2D9E18F84" & _
			"060C47C86B6AAAF71F3972E487858585F33CD713D1684C959694D0FB1515A93DFC741938A5143AE5E460C4C891983973266EBCF126646565C275DD53CAC69AA6" & _
			"61E5CA95F8F18F7F7C8A6CEC9934864F8F2C151515EABF1E79987EF9CB5F09C619370DA379F3A68D7736353529D334E97C2EFE9CCB4290149C63F725139EBC74" & _
			"F1D2EF7B4485D28A7BC4884BAB554AE1312E3DB23362DB28E44CEFF890999412F1785CAD5BFBCE13D75E7BCD68A9700B91E6DE7DCFDDDAF6EDDBE9C08103A750" & _
			"3A8586BAEEBAEB70FFFDF7A35FBFFEC8CECE82E709D8B6E337933AB8ACE1791E9E7BEE390821D2011D7F4D655171CE69D5AA55F2F6DB6763D4E8516CFDBAF5B7" & _
			"55546CA98C46A304FC6DACFEB3BF053006C3B2A8FE82BEADBBC77FE5E6E1EB37BD6E473335300DA2BD9DD4C9E322AEB39F558E1CBECD1042679A2641A4398EE3" & _
			"B9AE2B239108C68E19537AD188C137E765E8434FC61DDB4A2669E0C04172F1E2C56CC1530B68F5EA35AAB9A989745D47AF5EBD306BD62CDC7CCB2DC8CECE8663" & _
			"DB29D1E953052301C6389A9B5B50575707E073159542B4B29A3A6D1A0D1D3694D5D5D67DEF830FDEFF5D241209C01DE716D6755ED701C098D25C97F68D18BEA6" & _
			"536DDD37BBD6D73DC45CD149CF899CECF2F01D3D0F14F7F950D536C94473AB0C8B32858585E8DEADDBA8D16346DF5E90977B83EBD859B6E7223BCAE1288E78D2" & _
			"4659594F3CFAE82FD40F7E70948E1F3F8E482482929212E4E6E622994CA2B9B919BAA68105DB4498F8A5CBB7C46211E4E5E50550C1BFEC042196410821AFBAEA" & _
			"2AFCFAD773ADFABABAFBDF79E79DF9A6699A44E4FC6F0B55E7BCFF7236E702527BB294D02311260D5D16EF3F90A32712C5D4ADA0FECABB66FCBC4BF73E771CAF" & _
			"69FC7D557DD3EF34239214A051653D7B5F168BC5863B8E0DC7B1E36D6D6D3BDBE3AD5BEB6A6B2BAAAA6A0E5C76C5E49B22A6794F503360BAA11340F0840B2524" & _
			"B8A6A5563D0BCABF619B1740AA79138BC5F0F4534F63F61DB34F9953FCAC12720853BFF7DE7BD5BFFFF83F586565E5035B366F7AC4B22CAFBDBD1DBAAE43D7F5" & _
			"D40858FACFFF39F1CA2F9D03A48B4832C6FCA9DFC387E1D836A3AC2C59535F078334F42EE84C578C1FF2EDD15F99F0C39CA2EEC5503E7E3FDE9E683DDAD0B0B1" & _
			"B6B6F6F7F575756B5B5B5BF71DAE398C018306E675EFDEE3A61E3DBAFF936E18974821992F4548448CC0990FCE244629C3A76B08771823050E83EBB99833670E" & _
			"9E79FAE9E054C03F85030811BF656565F8CF071E503366CC806DDB1042B64622E6F163478FED3872A4FED5DDBB77AF3876EC587B76767670340C95CDDC53AA8E" & _
			"E75373E8AC45002925745D87EBBAF8C31FFE801D3B763021844FF375AAE06AF2A2114363B9B9798385440404AB6BD76E877272728E07000BECDAB54B9F3B6FDE" & _
			"7F5C70C105F7B9AE9BE5382E524A42014128314A199711757C0DFF75C8D59FFEB5540A9C3124ED24E6CF9F8F050B16A021E834A65FD9D9D9F8E6ADB7E28E3BEE" & _
			"40AF9EBDE0380E745D032382E37929EAB964D2FA68CB962DF7FFFB8F7EF45A59591995959529DBB6515050804E9D3AC175DD5059F5BC890C673502789E87A54B" & _
			"97E2C081031CFEA007574A6944296E764600974A39001200BCE02DF4E0C189C8FAEDF3CFCF9D366DDAECE6E666044C9B21CB636AF057CA8E337C9A03F8328D14" & _
			"28368512151D54C2904A12082A1A89E2A33D1FA9575F5D850FB66EA543070F92A11B6AF2D42974FDCCEB3164C81084A3E49AA629F22F258454420AE9094F3949" & _
			"47CFC8CC74EEBAF38E6B9E7FFEF93F028800F00A0B0B65414181ECD9B3A7EAD3A70F8A8A8AC2B1F95494FCA29CE0AC3840583E7DEFBDF7B072E54AA6EB3A775D" & _
			"570B924E3D78D6C268C018E3694E01F84AB24A08615DFED5AF962F5BB66C4D73733331C68831C683220BA5F30687A14075A893FB4602291970CC2A05F129D110" & _
			"FF07980228333313B168144DCD27556B6B1B65C432909B9BAB186324A548E1FF296D7B9152AAA07640C964D22162C69E3DBBD78E1B37EEDAC0D95DE50B177800" & _
			"04634CF4EDDB57949797ABE1C387C3300C589695DA7ABE1473019C735896857EFDFAA1A2A2421D397224FD9C4DC116A001300198524A23F83A35B5C9FC2381C5" & _
			"39EF1EC0BE583A794238D9D3617C4A7D1D1413494AA99492CA34238C732E4CD3E41D641008B8831884F460DB4EB2A6BAA6F9C4C913F1FEFDFBF7C9CECE91BAAE" & _
			"9395B448E79A621A277F6AD80F5BBE0E9E7F6F2124A492F084648C945040A6522A3FF8455C2272024770A5945E6565A5575959E96DDEBCD99B3469921A397224" & _
			"E2F1F817921B9C35C5102104B2B2B2306BD62CB570E142EFE8D1A361718402826495E60C1C80911615484A4900B2DF5DBFFED8D6AD5B775D7CF1C5C38F1F3FEE" & _
			"72CE03E750087B70FE3D5540FCE077E764E06D8585857CFEFCF97F5AB162C5BA58345A949B9B1BE9DDBB4FA62F1445F864DF276DC78F1F6FB16D3B5E5757DBD4" & _
			"D6DA66BFF1D69B0F9797F7EBDAD2D2E29986C104533EC38F929014D017067C23524A789E50AEEB0A2104CBEADC99AD5AB96A2D800811E94AA9A4524A574AD9C1" & _
			"DFE7042011D6D0D040CB962DF3841072D8B061701CE79C3BC159CD018410304D13F1781C2FBFFC323EF9E4130640272253291509F6C8F061064E103A42182564" & _
			"696969DEAFE7CEFDF6F8F1E3C7789E87643209CFF364383C48D491E40120C33058241201002C5EB4E8CD7F9D33679963DB4EB8B500A7118777389E09000306F4" & _
			"2F9AFF9B05B70C1F3EA2CC711CB8AE03259500913F59961A3005A0C035FFF887F6F676FBC9279E58F2C8C30F2D723D4F01B04F7B38690F97885C005E341A1573" & _
			"E6CC519F17E3F0375107905222807FA3BABA1A870E1DC21B6FBCA103308828A29432D21C2074823009D48255A40CC3D066CC9831E69A6BAFBD6CE8D0A17DF3F3" & _
			"F3F3CFD40B904AA1BEAEAE71D7AE5D558B172F5EFFDA9FFEB41380CEFCA5752642F810AE1D4E226B4A2937272727E3F6D9B3C75E71C595C3FAF5EB579C9BDB39" & _
			"9A965F04B3850A492BE15655D71CDBB4F1BDEDCF3CB370CD8E1D1FEE091C2ADDE8A73B800BC0E59CBB4208AF478F1EDE9D77DE09D775CF790E705607434E2906" & _
			"05187CC330B07EFD7AAC5FBF9E5A5A5AF4202218000CA5941918FE4C4EC0830F8EF7EED3A75B972E5DBAF7E8DEBDB057EFDED99AA61904A803070FB65655559D" & _
			"A8AEAAAA3D7CF8F0C9C0B0016930144E578D38F575E808149C5664602C7DD0A041DD0A0B0B0B070C1CD8292F3737EA799E48266D7BF7EE5D279A9A9A1A2A2B2B" & _
			"6B5A5A5A4E06B90B935226D30C7DA6551F26866E972E5DC4AC59B354341AC517411F7B4E2683D2A381520A1919193879F22456AE5C49478F1E652D2D2D2C3436" & _
			"634C534AE94148D68315A905AB58574AF120568AC0682C2D790C43BB4144CC972190E9AB3E45BD12B693C35D04A7F0D1FBAF03635290C17B69FF1F68D441A47D" & _
			"2F9452AEF28FB45E606C2F5CED44E406B38E1E00919393E38D1E3D5A8E1C3912D16834D5A9FCB27503D36BE8A93F30914820232303B366CD526D6D6D62CB962D" & _
			"62FFFEFDA2B9B9999A9B9B7960FCF0A1115158436044C4C36363904CB2536FE51B3D10B156442483193C15F6E8D35ABE945625A420410D1D8105F723C6182322" & _
			"A63ACE9D80AFEBAB82E14E01401051F8EC4929C37FF7FC069112D9D9D9A25BB76E72E4C891AAB8B818F9F9F9B02CEB9436F5973202FCB96D41D334689A06CE39" & _
			"1A1B1B71E2C409D4D4D4A0B2B29202890DAAADAD4D5FE9A73FA7AF5C75DAEB406030F52C01A868348AA2A222E5380EEAEBEB7186F73D5364398D57EE94C7E9F7" & _
			"90D9D9D93237375772CED5D8B1631500141717232FCF9F304E2F0F7F91D5C073EE009FE508803FF76718C6A7E6FCF6EFDF9F4A90C2FFDBBC79336CDBA6D36864" & _
			"3AA47B82EF2D292951E5E5E5A92396520AF9F9F9282E2E866DDBD8BF7F7F0A0710D6ED376DDA84A06C8D339C18527F42788FBE7DFBAAB2B2B253EED1A54B17E4" & _
			"E7E79F326FE8380E0255F0F3A641F48539C05F7286F4ED2312899C9166F5F36E41E17D5CD74D39D4FFF6BD3FEB1EA1B1D3DBCCE76357F0BC180D3BB553F76963" & _
			"5896F57F7EBF70A5FE5FBFF799EE717A72F78FE1D0CFF9419EAD0FEC5C8C68FF5DA382FF719DFFD73F1CE0EFFCFAFF58850BEBF10A94FD0000000049454E44AE" & _
			"426082" & _
			'2BADCEDA68D1C177542CF267009C9181ED5375B9A1FFD9'
	Return Binary($bImage)
EndFunc   ;==>_Image_MSDNLogo



#cs
	Func THKS();�滻��ʼ
	$IniFile = "CustomStrings.dat" ;�ı�·��
	$Lines = _FileCountLines($IniFile) ;��ȡ�ı�����
	For $i = 1 To $Lines - 1 ;ѭ��
	
	$ReadFile = FileReadLine($IniFile, $i) ;��1�п�ʼ��ȡ
	FileWriteLine(@TempDir & "\���������ʱ�ļ�.txt", $ReadFile)
	If StringInStr($ReadFile, "Xlist version") Then ;���ش��������ŵ��ַ���
	QCBBH()
	WLTH()
	ExitLoop
	EndIf
	Next
	EndFunc   ;==>THKS
	
	Func QCBBH();ȥ���汾��
	Local Const $aFile = @TempDir & "\���������ʱ�ļ�.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, 0, $file_begin)
	FileSetPos($hFile, StringInStr(StringStripWS(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$last = FileRead($aFile, FileGetPos($hFile))
	FileOpen($aFile, 2)
	FileWrite($aFile, $last)
	FileClose($aFile)
	Return ($last)
	EndFunc   ;==>QCBBH
	
	Func WLTH();���Զ������д��CJX����
	Local Const $aFile3 = @TempDir & "\update.dat"
	Local $hFile = FileOpen($aFile3, 1)
	FileFlush($hFile)
	FileSetPos($hFile, StringInStr(StringStripWS(FileRead($aFile3), 2), Chr(13), 0, -1), $file_current)
	$last = FileRead($aFile3, FileGetPos($hFile))
	FileOpen($aFile3, 2)
	FileWrite($aFile3, QCBBHGZ() & $last)
	FileClose($aFile3)
	;FileDelete(@TempDir & "\���������ʱ�ļ�.txt")
	EndFunc   ;==>WLTH
	
	Func QCBBHGZ();��ȡû�汾�ŵ��Զ������
	Local Const $aFile = @TempDir & "\���������ʱ�ļ�.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, StringInStr(StringStripWS(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$QCBBHGZ = FileRead($aFile, FileGetPos($hFile))
	Return ($QCBBHGZ)
	EndFunc   ;==>QCBBHGZ
	
	EndFunc   ;==>
	
	
	
	Func ForceDel1();ɾ�����������ʱ�ļ�.tx
	Local $file = @TempDir & "\���������ʱ�ļ�.txt"
	;If FileExists($file) = 0 Then Exit(MsgBox(0,'','�ļ�������'))
	;If @OSArch = 'X64' Then Exit(MsgBox(0,'','��֧�ִ�ƽ̨ϵͳ'))
	If FileDelete($file) = 0 Then
	Local $tempdata = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations')
	RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations', 'REG_MULTI_SZ', $tempdata & @LF & '\??\' & @LF & $file & '!\??\')
	EndIf
	EndFunc   ;==>ForceDel1
	
	Func ForceDel2();ɾ��update.dat
	Local $file = @TempDir & "\update.dat"
	; If FileExists($file) = 0 Then Exit(MsgBox(0,'','�ļ�������'))
	;If @OSArch = 'X64' Then Exit(MsgBox(0,'','��֧�ִ�ƽ̨ϵͳ'))
	If FileDelete($file) = 0 Then
	Local $tempdata = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations')
	RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager', 'PendingFileRenameOperations', 'REG_MULTI_SZ', $tempdata & @LF & '\??\' & @LF & $file & '!\??\')
	EndIf
	EndFunc   ;==>ForceDel2
	
#ce
