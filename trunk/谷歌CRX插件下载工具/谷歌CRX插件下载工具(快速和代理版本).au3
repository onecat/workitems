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
$qi = HotKeySet("^3", "yctptb")

Global $Title = "�ȸ�CRX������ع���", $URLClick = 0
Local $size , $get ,$str
 
$oIE = _IECreateEmbedded() 
$Form1 = GUICreate($Title,  560, 126, -1, -1)
GUICtrlCreateLabel("����������ID:", 10, 7, 87, 17)
$Input1 = GUICtrlCreateInput("cfhdojbkjhnklbpkdaibdccddilifddb", 98, 2, 460, 21)
$Label1 = GUICtrlCreateLabel("ʹ�÷������Ҽ����Ʋ����ַ����adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb" & @CRLF & "ȡ��cfhdojbkjhnklbpkdaibdccddilifddb���ID�ŵ��༭����" & @CRLF & "�������", 96, 56, 500, 49)
$Label2 = GUICtrlCreateLabel("ʹ�ù���ĵ�ַ����,����ʱ�䳤�����ĵȴ�......ǿ���˳������밴��ϼ� CTRL+3", 98, 34, 460, 17)
GUICtrlSetColor($Label2, 0xFF00FF)
$Button1 = GUICtrlCreateButton("���� CRX", 14, 33, 73, 33)
$Button2 = GUICtrlCreateButton("��������CRX", 14, 83, 73, 33, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUICtrlCreateObj($oIE, 1, 1, 1,1)
$Progress1 = GUICtrlCreateProgress(104, 96, 377, 25)
$Label3 = GUICtrlCreateLabel("", 486, 96, 68, 17,$SS_CENTER)
GUICtrlSetColor($Label3, 0x0000FF)
GUISetState(@SW_SHOW)
 
 
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
					GUICtrlSetData($Label3,"")
					xz()
					xzhql()
					AdlibUnRegister("_xun");���й����п�����ֹ
				Case $Button2	;����ʽ
					AdlibRegister("_xun",100);���й����п�����ֹ
					GUICtrlSetData($Label3,"")
					xzd()
					xzhql()
					AdlibUnRegister("_xun");���й����п�����ֹ
        EndSwitch
	WEnd

Func xz()
		$a = GetSource("http://chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http.+/(.*crx))">here', 3);href="(http://www.chrome-extension-downloader.com/.+/(.*crx))">here
			 wjxz($down[0],$down[1])
			 pdxz($down[0],$down[1])
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

Func wjxz($url,$wjmz);$wjmz�����ļ�����
	$get = InetGet($url, @DesktopDir & "\" & $wjmz, 1, 1)
	$size = Int(InetGetSize($url) / 1024)
	AdlibRegister("Down")
	Do
		Sleep(250)
	Until InetGetInfo($get, 2)
EndFunc 

Func pdxz($url,$wjmz)
	$size = Int(InetGetSize($url) / 1024)
	$data = Int(FileGetSize(@DesktopDir & "\" & $wjmz) / 1024)
	If $size = $data Then
		GUICtrlSetData($Label3,"�������")
	EndIf	
EndFunc	
	

Func Down()
		$newsize = InetGetInfo($get)
        $pro = Int($newsize[0] / 1024) / $size
        GUICtrlSetData($Progress1, $pro * 100)
        GUICtrlSetData($Label3, "������ " &  Int($pro * 100) & "%")	
EndFunc 

Func xzhql()
	AdlibUnRegister( "Down" )
	GUICtrlSetData($Progress1,"")
EndFunc		


Func xzd()
		$a = GetSourced("http://chrome-extension-downloader.com/landing.php?source=chrome-extension&extension=" & GUICtrlRead($Input1))
		If StringRegExp($a, 'href="(http.+/(.*crx))">here') Then
			$down = StringRegExp($a, 'href="(http.+/(.*crx))">here', 3)
			 wjxz($down[0],$down[1])
			 pdxz($down[0],$down[1])
		Else
			MsgBox(64, "no", "����ʧ�ܣ�",3)
			Exit
		EndIf
EndFunc 

Func GetSourced($url)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.SetProxy(2,getProxy());���ô���
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

;~ Func getProxy()
;~ 	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
;~ 	For $n = 0 To 4
;~ 		ConsoleWrite($urlP[$n] & @CRLF)
;~ 		$iPing = Ping(StringTrimRight($urlP[$n],3), 500)
;~ 		If $iPing Then Return ($urlP[$n])
;~ 		
;~ 	Next
;~ 	Return ("")
;~ 	
;~ EndFunc   ;==>getProxy


 Func getProxy()
$b="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$strb=GetSource1("http://www.xici.net.co/wt/");http://www.xici.net.co/wt/
If Not StringRegExp($strb,$b) Then
	MsgBox(0,"����","������ַ" & @CRLF & "�򿪲����Ժ��ڳ���")
EndIf	
$reg=StringRegExp($strb,$b,3)
;_ArrayDisplay($reg)
For $n= 0 To UBound($reg)/2-1
	$ip=$reg[2*$n]&":"&$reg[2*$n+1] ;& "|"
	ConsoleWrite($ip&@CRLF)
	;FileWrite(@ScriptDir & "\22.txt",$ip&@CRLF)
		$iPing = Ping(StringLeft($ip,StringInStr($ip,":")-1), 500)
		;$iPing = Ping(StringRegExp($urlP[$n],'(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5}):\d{2,5}',3)[0], 500)
		If $iPing Then Return ($ip)	
	Next

EndFunc

Func GetSource1($urls)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $urls, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource	


Func _xun();���й����п�����ֹ
	Switch GUIGetMsg()
;~ 		Case $GUI_EVENT_CLOSE
;~ 			Exit 
		Case $Form1
			HotKeySet("^3", "yctptb")
	EndSwitch
EndFunc

Func yctptb();��������
	Exit 
EndFunc   ;==>yctptb