#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=J:\ADMuncher���պ�����\��ţCJX������ʾ.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\��ţCJX������ʾ.exe
#PRE_Compression=4
#PRE_Res_Comment=Сվ����
#PRE_Res_Description=Сվ����
#PRE_Res_Fileversion=2.0.1.0
#PRE_Res_LegalCopyright=Сվ����
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;#PRE_Outfile=C:\Users\xiaozhan\Desktop\��ţCJX������ʾ.exe
;#PRE_Icon=N:\����\QQ\3D���ICOͼ��\deamon.ico
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
#include <File.au3>
#Include <WinAPIEx.au3>
#Include <String.au3>
#include <IE.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;~ #include <MSHtml.au3>
;~ #include <IEEX.au3>
If  ProcessExists("AdMunch.exe") Then ; �����±������Ƿ���������.
	bbhdb()
Else
    MsgBox(0, "�����ţCJX�汾", "��ţû�����У���������ţ�������б�����")
	;Exit
EndIf




Func bbhdb();�ж�����CJX����ͱ���CJX���� 
	$HBD = _StringToHex(BDCJXGZ())
	$HWL = _StringToHex(WLCJXGZ())
	If $HWL <= $HBD Then
		 MsgBox(0,"��ţCJX����","��ţCJX�����Ѿ�������" & @CRLF & "�°汾   ��" & WLCJXGZ() & @CRLF & "���ذ汾��" & BDCJXGZ())
		 Exit
	 Else
		 gxgz()
		 ;MsgBox(0,"��ţCJX����","��ţCJX�������°汾�뼰ʱ����"& @CRLF & "�°汾   ��" & WLCJXGZ() & @CRLF & "���ذ汾��" & BDCJXGZ())
		 ;Exit
	EndIf
EndFunc   ;==>bbhdb


Func gxgz()
$Form1_1 = GUICreate("��ţCJX����", 219, 162, -1, -1)
$Label1 = GUICtrlCreateLabel("�������汾�ţ�", 8, 40, 96, 17)
GUICtrlSetColor(-1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("", 128, 40, 88, 17)
GUICtrlSetData($Label2, WLCJXGZ())
GUICtrlSetColor($Label2, 0x3399FF)
$Label3 = GUICtrlCreateLabel("���ع���汾�ţ�", 8, 72, 100, 17)
GUICtrlSetColor(-1, 0x6633CC)
$Label4 = GUICtrlCreateLabel("", 128, 72, 88, 17)
GUICtrlSetData($Label4, BDCJXGZ())
GUICtrlSetColor($Label4, 0x9932CC)
$Label5 = GUICtrlCreateLabel("��ţCJX�������°汾�뼰ʱ����", 24, 8, 179, 17)
GUICtrlSetColor(-1, 0xFF00FF)
$Button1 = GUICtrlCreateButton("ȷ������", 16, 120, 81, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Radio1 = GUICtrlCreateRadio("ADMU", 8, 96, 65, 17)
$Radio2 = GUICtrlCreateRadio("CJX�������С����", 80, 96, 129, 17)
GUICtrlSetState($Radio2, $GUI_CHECKED)
$Button2 = GUICtrlCreateButton("ȡ������", 120, 120, 81, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			If  BitAnd(GUICtrlRead($Radio1), $GUI_CHECKED) Then 
				GUISetState($Radio2, $GUI_UNCHECKED)
				$iPid=ProcessExists("AdMunch.exe")
				$w = _GetModuleFileNameEx($iPid)
				$s = StringTrimRight ( $w, 11 )
				ShellExecute($s & "ADMU(CJX).exe")
				Exit
			Else	
				GUISetState($Radio1, $GUI_UNCHECKED)
				GUISetState($Radio2, $GUI_CHECKED)
			EndIf	
		
			If  BitAnd(GUICtrlRead($Radio2), $GUI_CHECKED) Then 
				GUISetState($Radio1, $GUI_UNCHECKED)
				GUISetState($Radio2, $GUI_UNCHECKED)
				$iPid=ProcessExists("AdMunch.exe")
				$w = _GetModuleFileNameEx($iPid)
				$s = StringTrimRight ( $w, 11 )
				ShellExecute($s & "CJX�������С����.exe")
				Exit
			Else	
				GUISetState($Radio2, $GUI_UNCHECKED)
				GUISetState($Radio1, $GUI_CHECKED)
			EndIf	
				
		Case $Button2
			Exit
	EndSwitch
WEnd

EndFunc 


Func WLCJXGZ()
		$a = GetSourced("http://cjxlist.googlecode.com/svn/CustomStrings.dat")
		If StringRegExp($a, 'Xlist version (.*)') Then
			$down = StringRegExp($a, 'Xlist version (.*)', 3)
			 Return $down[0]
		Else
			MsgBox(64, "�Բ���", "����ʧ�ܣ�",5)
			Exit
		EndIf
EndFunc 


Func GetSourced($url)
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxy());���ô���
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		MsgBox(64, "�Բ���", "������߽���ʧ�ܣ�",5)
		Exit
	EndIf	
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;============================

;~ Func getProxy()
;~ 	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
;~ 	For $n = 0 To UBound($urlP)-1 ;����ֵ
;~ 		ConsoleWrite($urlP[$n] & @CRLF)
;~ 		$iPing = Ping(StringLeft($urlP[$n],StringInStr($urlP[$n],":")-1), 500)
;~ 		;$iPing = Ping(StringRegExp($urlP[$n],'(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5}):\d{2,5}',3)[0], 500)
;~ 		If $iPing Then Return ($urlP[$n])
;~ 		
;~ 	Next
;~ 	Return ("")
;~ 	
;~ EndFunc   ;==>getProxy



;ֱ�Ӷ�ȡ��ַ------------------------------------------------------
 Func getProxy()
$b="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$strb=GetSource1("http://www.xici.net.co/wt/");http://www.xici.net.co/wt/
If Not StringRegExp($strb,$b) Then
	MsgBox(0,"����","������ַ" & @CRLF & "�򲻿��Ժ��ڳ���")
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
		

#cs
186.92.188.215:9064
181.74.165.181:9064
186.94.81.250:9064
36.84.18.195:9064
36.83.138.220:3128
36.82.219.148:3128
#ce
;ֱ�Ӷ�ȡ��ַ------------------------------------------------------

;�ı���ʽ------------------------------------------------------
;~ Func getProxy()
;~ 	$IniFile = @ScriptDir & "\����.txt" ;�ı�·��
;~ 	$Lines = _FileCountLines($IniFile) ;��ȡ�ı�����
;~ 	For $i = 1 To $Lines - 1 ;ѭ��
;~ 		$ReadFile = FileReadLine($IniFile, $i) ;��1�п�ʼ��ȡ
;~ 		ConsoleWrite($ReadFile & @CRLF)
;~ 		$iPing = Ping(StringLeft($ReadFile,StringInStr($ReadFile,":")-1), 500)
;~ 		If $iPing Then Return ($ReadFile)
;~ 		If $ReadFile = '' Then ExitLoop ;�ı����˳�
;~ 	Next	
;~ 	Return ("")
;~ 	
;~ EndFunc   ;==>getProxy


#cs
186.92.188.215:9064
181.74.165.181:9064
186.94.81.250:9064
36.84.18.195:9064
36.83.138.220:3128
36.82.219.148:3128
#ce
;�ı���ʽ------------------------------------------------------

;INI��ʽ-----------------------------------------------------
;~ Func getProxy()
;~ 	Local $urlP = StringSplit(IniRead(@ScriptDir & "\proxy.user.ini", "iplist", "google_cn", ""),"|")
;~ 	For $n = 1 To $urlP[0] ;����ֵ
;~ 		ConsoleWrite($n & " " & $urlP[$n] & @CRLF)
;~ 		$iPing = Ping($urlP[$n], 500)
;~ 		If $iPing Then Return ($urlP[$n])    
;~ 	Next
;~ 	Return ("")	
;~ EndFunc   ;==>getProxy


#cs
[iplist]
google_cn = 210.242.125.24|203.66.124.152|203.66.124.212|60.199.175.53|106.162.192.177
#ce
;INI��ʽ-----------------------------------------------------

Func BDCJXGZ();��ȡ����CJX����
	$iPid=ProcessExists("AdMunch.exe")
	$w = _GetModuleFileNameEx($iPid)
	$s = StringTrimRight ( $w, 11 )
	$IniFile = $s & "CustomStrings.dat" ;�ı�·��
	$aFile = FileOpen($IniFile)
	$aFileStrings = FileRead($aFile)
	If StringRegExp($aFileStrings, 'Xlist version (.*)') Then
			$down = StringRegExp($aFileStrings, 'Xlist version (.*)', 3)
			FileClose($aFile)
			 Return $down[0]
		Else
			MsgBox(64, "�Բ���", "����û�й����ļ���",5)
			FileClose($aFile)
			Exit
		EndIf
	FileClose($aFile)	
EndFunc 

Func _GetModuleFileNameEx($_Pid)
        $_Hwnd=DllCall("Kernel32.dll","hwnd","OpenProcess","dword",0x0400+0x0010,"int",0,"dword",$_Pid)        
        $_Return=DllCall("Psapi.dll","long","GetModuleFileNameEx","hwnd",$_Hwnd[0],"long",0,"str",0,"long",255)        
        DllCall("Kernel32.dll","int","CloseHandle","hwnd",$_Hwnd[0])        
        If StringInStr($_Return[3],"\") Then Return $_Return[3]
        Return ""
EndFunc
	
;~ Func WLCJXGZ()
;~ 	$urlP="203.208.46.170:80"
;~ 	$urlP1="203.208.46.200:80"
;~ 	$urlP2="203.208.46.202:80"
;~ 	$urlP3="203.208.46.207:80"
;~ 	$urlP4="203.208.46.222:80"
;~ 	Local $iPing = Ping(StringTrimRight($urlP,3), 250)
;~ 	Local $iPing1 = Ping(StringTrimRight($urlP1,3), 250)
;~ 	Local $iPing2 = Ping(StringTrimRight($urlP2,3), 250)
;~ 	Local $iPing3 = Ping(StringTrimRight($urlP3,3), 250)
;~ 	Local $iPing4 = Ping(StringTrimRight($urlP4,3), 250)
;~     If $iPing Then ; �������ֵ���� 0������ʾ�������Ϣ.
;~        $gz = SetProxyget($urlP)
;~ 	ElseIf $iPing1 Then
;~ 		 $gz = SetProxyget($urlP1)
;~ 	 ElseIf $iPing2 Then
;~ 		 $gz = SetProxyget($urlP2)
;~ 	 ElseIf $iPing3 Then
;~ 		 $gz = SetProxyget($urlP3)
;~ 	 ElseIf $iPing4 Then
;~ 		 $gz = SetProxyget($urlP4)
;~     EndIf
;~ 	Return $gz
;~ EndFunc 	

;~ ;Func SetProxyget()
;~ Func WLCJXGZ()
;~ $oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
;~ $oHTTP.SetProxy(2,getProxy());���ô���
;~ $oHTTP.Open("GET",'http://cjxlist.googlecode.com/svn/CustomStrings.dat') ;����
;~ $oHTTP.Send()
;~ $return = $oHTTP.responsetext
;~ $oHTTP=0
;~ $array = StringRegExp($return, 'Xlist version (.*)', 3)
;~ $CJXGZ = $array[0]
;~ If $return<>"" Then 
;~ FileWrite("CustomStrings.dat",$return);ע����ɾ��ԭ����
;~ EndIf
;~ Return $CJXGZ
;~ EndFunc
