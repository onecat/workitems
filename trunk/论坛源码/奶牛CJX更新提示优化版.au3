#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=J:\ADMuncher���պ�����\��ţCJX������ʾ.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\��ţCJX������ʾ.exe
#PRE_Compression=4
#PRE_Res_Comment=Сվ����
#PRE_Res_Description=Сվ����
#PRE_Res_Fileversion=2.0.0.6
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
$Form1_1 = GUICreate("��ţCJX����", 230, 147, -1, -1)
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
GUICtrlSetColor($Label5, 0xFF00FF)
$Button1 = GUICtrlCreateButton("ȷ��", 40, 104, 137, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUISetState(@SW_SHOW)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
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

Func getProxy()
	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
	For $n = 0 To UBound($urlP)-1 ;����ֵ
		ConsoleWrite($urlP[$n] & @CRLF)
		$iPing = Ping(StringLeft($urlP[$n],StringInStr($urlP[$n],":")-1), 500)
		;$iPing = Ping(StringRegExp($urlP[$n],'(\d{1,5}\.\d{1,5}\.\d{1,5}\.\d{1,5}):\d{2,5}',3)[0], 500)
		If $iPing Then Return ($urlP[$n])
		
	Next
	Return ("")
	
EndFunc   ;==>getProxy

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

;�ı���ʽ------------------------------------------------------
#cs
186.92.188.215:9064
181.74.165.181:9064
186.94.81.250:9064
36.84.18.195:9064
36.83.138.220:3128
36.82.219.148:3128
#ce
;�ı���ʽ------------------------------------------------------

;~ Func getProxy()
;~ 	Local $urlP = StringSplit(IniRead(@ScriptDir & "\proxy.user.ini", "iplist", "google_cn", ""),"|")
;~ 	For $n = 1 To $urlP[0] ;����ֵ
;~ 		ConsoleWrite($n & " " & $urlP[$n] & @CRLF)
;~ 		$iPing = Ping($urlP[$n], 500)
;~ 		If $iPing Then Return ($urlP[$n])    
;~ 	Next
;~ 	Return ("")	
;~ EndFunc   ;==>getProxy

;INI��ʽ-----------------------------------------------------
#cs
[iplist]
google_cn = 210.242.125.24|203.66.124.152|203.66.124.212|60.199.175.53|106.162.192.177
#ce
;INI��ʽ-----------------------------------------------------

Func BDCJXGZ();��ȡ����CJX����
	$iPid=ProcessExists("AdMunch.exe")
	$w = _GetModuleFileNameEx($iPid)
	$s = StringTrimRight ( $w, 11 )
	$IniFile = $s & "\CustomStrings.dat" ;�ı�·��
	$Lines = _FileCountLines($IniFile) ;��ȡ�ı�����
	For $i = 1 To $Lines - 1 ;ѭ��
		$ReadFile = FileReadLine($IniFile, $i) ;��1�п�ʼ��ȡ
		If $ReadFile = '' Then ExitLoop ;�ı����˳�
		If StringInStr($ReadFile, "Xlist version") Then ;���ش��������ŵ��ַ���
			Local $BDCJXGZ = StringTrimLeft($ReadFile, 14)
			Return ($BDCJXGZ)
			ExitLoop
			;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ)

		EndIf

	Next
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
