#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\tutkp2p��⹤��.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=tutkp2p
#PRE_Res_Description=tutkp2p
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=tutkp2p
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

;
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("TUTK UID���״̬", 466, 363, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 449, 21)
$UID = GUICtrlCreateLabel("������UID", 8, 8, 60, 17)
$Button1 = GUICtrlCreateButton("��ȡUID״̬", 8, 296, 129, 41)
;$Button2 = GUICtrlCreateButton("�˳�", 168, 296, 129, 41)
$Button3 = GUICtrlCreateButton("��ʾUID״̬", 328, 296, 129, 41)
$Group1 = GUICtrlCreateGroup("��ʾ", 8, 80, 449, 193)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 172)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ
While 1

  $msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			tc()
			Exit	
		Case $msg = $Button1
			GUICtrlSetData ($Label1,"")
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\tutkp2p.exe ' & GUICtrlRead($Input1) & ">" & @ScriptDir & '"\tutkp2p.txt"', '', @SW_HIDE)
;~ 		Case $msg = $Button2
;~ 			tc()
;~ 			Exit
		Case $msg = $Button3
			Sleep(10000)
			tc()
			line()
			tutkp2p()
			GUICtrlSetData ($Label1, $HQ)
			FileDelete(@ScriptDir & "\tutkp2p.ini")
	EndSelect
WEnd



Func tutkp2p()
$HQ0 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ1", "")
$HQ1 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ2", "")
$HQ2 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ3", "")
$HQ3 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ4", "")
$HQ4 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ5", "")
$HQ5 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ6", "")
$HQ6 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ7", "")
$HQ7 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ8", "")
$HQ8 = IniRead(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ9", "")

$HQ = $HQ0 & @CR & $HQ1 & @CR & $HQ2 & @CR & $HQ3 & @CR & $HQ4 & @CR & $HQ5 & @CR & $HQ6 & @CR & $HQ7 & @CR & $HQ8
EndFunc

Func line()
Local $file = FileOpen(@ScriptDir &"\tutkp2p.txt", 0)
Local $j = 1
Local $i = 1
Local $line = 0
Do
if $j<=10 Then
    Local $line = FileReadLine($file,$j)
	IniWrite(@ScriptDir & "\tutkp2p.ini", "�ַ�", "��ȡ" & $i ,$line)
	$j = $j + 1 
EndIf
   $i = $i + 1
Until $i = 10
FileClose($file)
FileDelete(@ScriptDir & "\tutkp2p.txt")
EndFunc

Func tc()
	ProcessClose ("cmd.exe")
	ProcessClose ("tutkp2p.exe")
EndFunc	