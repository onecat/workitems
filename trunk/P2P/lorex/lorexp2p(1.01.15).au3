#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\lorexp2p��⹤��.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=lorexp2p
#PRE_Res_Description=lorexp2p
#PRE_Res_Fileversion=3.0.0.0
#PRE_Res_LegalCopyright=lorexp2p SDK 1.01.15
#PRE_Res_SaveSource=y
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
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("Lorex ID���״̬", 468, 462, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 209, 21)
$Input2 = GUICtrlCreateInput("", 240, 40, 209, 21)
$Label2 = GUICtrlCreateLabel("������˿�", 240, 8, 64, 17)
$UID = GUICtrlCreateLabel("������lorex ID", 8, 8, 108, 17)
;$Button1 = GUICtrlCreateButton("��ȡUID״̬", 8, 384, 129, 41)
;$Button2 = GUICtrlCreateButton("�˳�", 168, 384, 129, 41)
$Button3 = GUICtrlCreateButton("��ʾlorex ID״̬", 328, 411, 129, 41,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("��ʾ", 8, 80, 449, 321)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 292)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "��ȡlorex ID״̬����ȴ�..........."

$Quit = TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"_Exit")
TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()

While 1
  $msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			Exit	
;~ 		Case $msg = $Button1
;~ 			
;~ 		Case $msg = $Button2
;~ 			tc()
;~ 			Exit
		Case $msg = $Button3
			GUICtrlSetData ($Label1,$BQ)
			ShellExecute("p2p.exe","",@ScriptDir,"", @SW_HIDE)
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\P2PClientApp.exe ' & GUICtrlRead($Input1) & " " & GUICtrlRead($Input2) & " " & "0" & " " & ">" & " " & @ScriptDir & '"\P2Plorex.txt"', '', @SW_HIDE)
			Sleep(10*1000)
			SCKH()
			GUICtrlSetData ($Label1,P2PJG())
			FileDelete(@ScriptDir &"\P2P.txt")
		EndSelect
	WEnd


Func SCKH()
$path = @ScriptDir & "\P2Plorex.txt"
$newfile = StringTrimRight($path, 9) & '.txt'
If FileExists($newfile) Then FileDelete($newfile)
FileWrite($newfile, _nochongfu($path))
FileDelete(@ScriptDir &"\P2Plorex.txt")
FileDelete(@ScriptDir &"\version.txt")
EndFunc

Func _nochongfu($path_txt);ȥ���ı�����
	If StringRight($path_txt, 4) <> '.txt' Then $path_txt &= '.txt'
	Local $file = FileOpen($path_txt, 0)
	Local $sTXT = FileRead($file)
	FileClose($file)
	$sTXT = StringRegExp($sTXT, '(?m)(?>\h*\S+)+', 3)
	Local $str_txt = ""
	For $i = 0 To UBound($sTXT) - 1
		If Not $sTXT[$i] = "" Then $str_txt &= $sTXT[$i] & @CRLF
	Next
	Return ($str_txt);ȥ���ı�����
EndFunc   ;==>_nochongfu

Func P2PJG()
	Local $aFiles = @ScriptDir & "\P2P.txt"
	$aFile = FileOpen($aFiles)
	$aFileStrings = FileRead($aFile)
	FileClose($aFile)
	Return $aFileStrings
EndFunc   ;==>



Func _Exit()
        Exit
EndFunc
;~ Func tc()
;~ 	ProcessClose ("cmd.exe")
;~ 	ProcessClose ("OsnClientApp.exe")
;~ EndFunc	