#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\lorexp2p��⹤��.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=lorexp2p
#PRE_Res_Description=lorexp2p
#PRE_Res_Fileversion=1.0.0.8
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=lorexp2p
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
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("TUTK UID���״̬", 467, 438, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 209, 21)
$Input2 = GUICtrlCreateInput("", 240, 40, 209, 21)
$Label2 = GUICtrlCreateLabel("������˿�", 240, 8, 64, 17)
$UID = GUICtrlCreateLabel("������lorex ID", 8, 8, 108, 17)
$Button1 = GUICtrlCreateButton("��ȡUID״̬", 8, 384, 129, 41)
;$Button2 = GUICtrlCreateButton("�˳�", 168, 384, 129, 41)
$Button3 = GUICtrlCreateButton("��ʾUID״̬", 328, 384, 129, 41)
$Group1 = GUICtrlCreateGroup("��ʾ", 8, 80, 449, 289)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 268)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "��ȴ���������ʱ�䳬��2���ӣ������µ����ʾUID״̬"
While 1

  $msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			Exit	
		Case $msg = $Button1
			GUICtrlSetData ($Label1,"")
			ShellExecute("p2p.exe","",@ScriptDir)
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\OsnClientApp.exe ' & GUICtrlRead($Input1) & " " & GUICtrlRead($Input2) & " " & "0" & " " & ">" & " " & @ScriptDir & '"\lorexp2p.txt"', '', @SW_HIDE)
;~ 		Case $msg = $Button2
;~ 			tc()
;~ 			Exit
		Case $msg = $Button3

			line()
			tutkp2p()
			GUICtrlSetData ($Label1, $HQ)
			FileDelete(@ScriptDir & "\lorexp2p.ini")
	EndSelect
WEnd



Func line()
Local $file = FileOpen(@ScriptDir &"\lorexp2p.txt", 0)
Local $j = 3
Local $i = 1
Do
if $j<=21 Then
    Local $line = FileReadLine($file,$j)
	IniWrite(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ" & $i ,$line)
	$j = $j + 1 
EndIf
   $i = $i + 1
Until $i = 20
FileClose($file)
FileDelete(@ScriptDir & "\lorexp2p.txt")
FileDelete(@ScriptDir & "\version.txt")
EndFunc

Func tutkp2p()
$HQ0 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ1", "")
$HQ1 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ2", "")
$HQ2 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ3", "")
$HQ3 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ4", "")
$HQ4 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ5", "")
$HQ5 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ6", "")
$HQ6 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ7", "")
$HQ7 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ8", "")
$HQ8 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ9", "")
$HQ9 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ10", "")
$HQ10 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ11", "")
$HQ11 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ12", "")
$HQ12 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ13", "")
$HQ13 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ14", "")
$HQ14 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ15", "")
$HQ15 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ16", "")
$HQ16 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ17", "")
;~ $HQ17 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ18", "")
;~ $HQ18 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ19", "")
;~ $HQ19 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ20", "")
;~ $HQ20 = IniRead(@ScriptDir & "\lorexp2p.ini", "�ַ�", "��ȡ21", "")

$HQ = $HQ0 & @CR & $HQ1 & @CR & $HQ2 & @CR & $HQ3 & @CR & $HQ4 & @CR & $HQ5 & @CR & $HQ6 & @CR & $HQ7 & @CR & $HQ8 & @CR & $HQ9 & @CR & $HQ10 & @CR & $HQ11 & @CR & $HQ12 & @CR & $HQ13 & @CR & $HQ14 & @CR & $HQ15 & @CR & $HQ16; & @CR & $HQ17 & @CR & $HQ18 & @CR & $HQ19 & @CR & $HQ20
EndFunc


;~ Func tc()
;~ 	ProcessClose ("cmd.exe")
;~ 	ProcessClose ("OsnClientApp.exe")
;~ EndFunc	