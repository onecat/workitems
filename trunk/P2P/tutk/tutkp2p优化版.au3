#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\tutkp2p��⹤��.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=tutkp2p
#PRE_Res_Description=tutkp2p
#PRE_Res_Fileversion=3.0.0.2
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=tutkp2p
#PRE_Res_requestedExecutionLevel=highestAvailable
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
#include <Constants.au3>
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("TUTK UID���״̬", 467, 318, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 449, 21)
$UID = GUICtrlCreateLabel("������UID", 8, 8, 60, 17)
$Button1 = GUICtrlCreateButton("��ʾUID״̬", 328, 280, 129, 30,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("��ʾ", 8, 80, 449, 193)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 172)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "��ȴ�����ȡTUTK UID״̬��..........." 

$Quit = TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"_Exit")
TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()

While 1
	$msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			tc()
			_Exit()
		Case $msg = $Button1
			GUICtrlSetData ($Label1, $BQ)
			$HQ =_RunEcho(@ScriptDir & "\tutkp2p.exe " & GUICtrlRead($Input1))
			tc()
			GUICtrlSetData ($Label1, $HQ)
	EndSelect
WEnd

;�����л��Է���
;       ����CMD����ִ�к����Ϣ
;$var = ����Ĳ���
;$cmd = ִ�е����� 
;by:��ɫ�� 2014.5.2
 Func _RunEcho($cmd,$var = "")  
        Local $foo = Run(@ComSpec & " /c " & $cmd & "  " & $var,  _
                        @ScriptDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
						Sleep(500)
        Local $sDat
        While 1
                $sDat1 = StdoutRead($foo) ;��ȡ������
                If @error Then ExitLoop
                $sDat &= $sDat1
        WEnd
        Return $sDat
EndFunc   ;==>_RunEcho
	
Func tc()
	ProcessClose ("cmd.exe")
	ProcessClose ("tutkp2p.exe")
EndFunc	
	

Func _Exit()
        Exit
EndFunc

