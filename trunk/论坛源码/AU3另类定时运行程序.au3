#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
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

#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=ico\12.ICO
#AutoIt3Wrapper_Outfile=D:\��ʱ��.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Description=����ʱ������
#AutoIt3Wrapper_Res_Fileversion=2.0
#AutoIt3Wrapper_Res_LegalCopyright=crwmart
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>

Local $Runtime = 0, $sleep = 0, $Start = 0, $DJS, $sRun = 0, $EXEFile, $Stoptime, $Starttime, $TrayMini = 0, $sFile

Opt("TrayMenuMode", 1)
Local $item_0 = TrayCreateItem("��ʾ����")
TrayCreateItem("")
Local $item_1 = TrayCreateItem("�˳�")

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("����ʱ����", 326, 130, -1, -1)
$Input1 = GUICtrlCreateInput("", 8, 9, 249, 20)
$Button2 = GUICtrlCreateButton("...", 268, 8, 50, 22)
$Label1 = GUICtrlCreateLabel("���иó���", 8, 44, 60, 14)
$Combo1 = GUICtrlCreateCombo("", 73, 40, 55, 25)
GUICtrlSetData($Combo1, "00:15|00:30|01:00|01:30|02:00|02:30|03:00", "01:00")
$Label2 = GUICtrlCreateLabel("( ʱ:��)����ͣ", 131, 44, 84, 14)
$Combo2 = GUICtrlCreateCombo("", 220, 40, 55, 25)
GUICtrlSetData($Combo2, "00:15|00:30|01:00|01:30|02:00|02:30|03:00", "01:00")
$Label3 = GUICtrlCreateLabel("������", 280, 44, 36, 14)
$Label4 = GUICtrlCreateLabel("������ʱ����ڲ����иó���:", 8, 75, 170, 14)
$Input2 = GUICtrlCreateInput("11:00", 177, 72, 40, 16)
$Input3 = GUICtrlCreateInput("13:00", 244, 72, 40, 16)
$Label5 = GUICtrlCreateLabel("��", 225, 75, 16, 14)
$Label6 = GUICtrlCreateLabel("�ڼ�", 292, 75, 24, 14)
$Button3 = GUICtrlCreateButton("������ʾ", 150, 100, 80, 22)
$Button1 = GUICtrlCreateButton("��ʼ����", 240, 100, 80, 22)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
 If $Start = 1 Then
  If $sRun = 0 Then
   Run($EXEFile)
   $sRun = 1
  EndIf
  If $DJS + $Runtime = (@HOUR * 3600 + @MIN * 60 + @SEC) Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 2
  EndIf
 EndIf
 If $Start = 2 Then
  If $sRun = 1 Then
   ProcessClose($sFile)
   $sRun = 0
  EndIf
  If $DJS + $sleep = (@HOUR * 3600 + @MIN * 60 + @SEC) Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 1
  EndIf
 EndIf
 If (@HOUR * 3600 + @MIN * 60 + @SEC) = $Stoptime Then
  If $Start = 1 Or $Start = 2 Then
   $Start = 0
   $sRun = 0
   ProcessClose($sFile)
  EndIf
 EndIf
 If (@HOUR * 3600 + @MIN * 60 + @SEC) = $Starttime Then
  If $Start = 0 Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 1
  EndIf
 EndIf
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE
   Exit
  Case $Button2
   $EXEFile = FileOpenDialog("ѡȡһ����ִ���ļ�", @ProgramFilesDir & "\", "�����ļ�(*.exe)", 1 + 2)
   If $EXEFile <> "" Then GUICtrlSetData($Input1, $EXEFile)
  Case $Button3
   $TrayMini = 1
   GUISetState(@SW_HIDE, $Form1)
  Case $Button1
   If FileExists(GUICtrlRead($Input1)) Then
    $EXEFile = GUICtrlRead($Input1)
    $sFile = StringRegExpReplace($EXEFile, '.+\\', '')
    $Runtime = _Split(GUICtrlRead($Combo1))
    $sleep = _Split(GUICtrlRead($Combo2))
    $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
    $Stoptime = _Split(GUICtrlRead($Input2))
    $Starttime = _Split(GUICtrlRead($Input3))
    $Start = 1
    $TrayMini = 1
    GUICtrlSetState($Button1, $GUI_DISABLE)
    GUISetState(@SW_HIDE, $Form1)
   Else
    MsgBox(0, "����", "�����еĳ��򲻴��ڣ�������ѡ��")
   EndIf
 EndSwitch
 $Traymsg = TrayGetMsg()
 If $Traymsg = $item_0 And $TrayMini = 1 Then
  GUISetState(@SW_SHOW, $Form1)
  $TrayMini = 0
 ElseIf $Traymsg = $item_1 Then
  Exit
 EndIf
 _ReduceMemory(@AutoItPID)
WEnd

Func _Split($Time)
 If $Time <> "" Then
  Local $Data = StringSplit($Time, ":")
  If IsArray($Data) And Not @error Then
   Return $Data[1] * 3600 + $Data[2] * 60
  EndIf
 EndIf
EndFunc   ;==>_Split

Func _ReduceMemory($i_PID = -1);�����ڴ�
 If $i_PID <> -1 Then
  Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
  Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
  DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
 Else
  Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
 EndIf
 Return $ai_Return[0]
EndFunc   ;==>_ReduceMemory