#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=N:\��ǽ\�ȸ������\GoogleChromePortable\ChromePortable.exe|-1
#PRE_Outfile=C:\Users\chtyfox\Desktop\�ȸ�CRX������ع���.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.0
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
#include <StaticConstants.au3>
#include <IE.au3>
;~ Opt("TrayIconHide", 0)
;~ Opt("TrayMenuMode", 3) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�. 
;~ Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����.

Global $Title = "�ȸ�CRX������ع���", $URLClick = 0
 
$oIE = _IECreateEmbedded() 
$Form1 = GUICreate($Title,  560, 98, -1, -1)
GUICtrlCreateLabel("����������ID:", 10, 7, 87, 17)
$Input1 = GUICtrlCreateInput("", 98, 2, 460, 21)
$Label1 = GUICtrlCreateLabel("ʹ�÷������Ҽ����Ʋ����ַ����adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb" & @CRLF & "ȡ��cfhdojbkjhnklbpkdaibdccddilifddb���ID�ŵ��༭����" & @CRLF & "�������", 96, 56, 500, 49)
$Label2 = GUICtrlCreateLabel("ʹ�ù���ĵ�ַ�������Խ���ʱ�䳤�����ĵȴ�......", 98, 34, 460, 17)
GUICtrlSetColor($Label2, 0xFF00FF)
$Button1 = GUICtrlCreateButton("���� CRX", 14, 37, 73, 49, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUICtrlCreateObj($oIE, 1, 1, 1,1)
GUISetState(@SW_SHOW)
 
;~ $ttc = TrayCreateItem("�˳�")
;~ TrayItemSetOnEvent($ttc, "ExitScript") ;�� ������
;~ TraySetClick(8) 
 
While 1
        $MouseInfo = GUIGetCursorInfo($Form1)
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] = $Input1 Then $URLClick = 1
        EndIf
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] <> $Input1 And $MouseInfo[4] <> $Button1 Then $URLClick = 0
        EndIf
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
                     Exit
				 Case $Button1 
					AdlibRegister("_xun",100);���й����п�����ֹ
					xz()
					AdlibUnRegister("_xun");���й����п�����ֹ
        EndSwitch
	WEnd
	
Func xz()
		$a = GetSource("http://www.chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here', 3)
;~ 			ConsoleWrite($down[0] & @CRLF);���ص�ַ
;~ 			MsgBox(0,"",$down[0])
			 _IENavigate($oIE, $down[0])
			$URLClick = 0
;~ 			ConsoleWrite($down[1]);�ļ���
		Else
			MsgBox(64, "no", "����ʧ�ܣ�",3)
			Exit
		EndIf
EndFunc 
 
Func GetSource($url)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

Func _xun();���й����п�����ֹ
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit 
	EndSwitch
EndFunc