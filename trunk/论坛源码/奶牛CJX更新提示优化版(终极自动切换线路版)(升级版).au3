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


Func  WLCJXGZ()
		If StringRegExp(GetSourced(), 'Xlist version (.*)') Then
			$down = StringRegExp(GetSourced(), 'Xlist version (.*)', 3)
			Return $down[0]
		EndIf
		If StringRegExp(GetSourcedzx(), 'Xlist version (.*)') Then
			 $down = StringRegExp(GetSourcedzx(), 'Xlist version (.*)', 3)
			 Return $down[0]
		EndIf	 
EndFunc		

Func GetSourced()
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxy());���ô���
	$oHTTP.Open("get", "http://cjxlist.googlecode.com/svn/CustomStrings.dat", False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		;MsgBox(64, "�Բ���", "�̶�IP��ַ����ʧ�ܣ�",3)
	Else	
		$oHTTP = 0
		Return $return
	EndIf	
EndFunc   ;==>GetSource


Func getProxy()
	Local $urlP[] = ["203.208.46.170:80", "203.208.46.200:80", "203.208.46.202:80", "203.208.46.207:80", "203.208.46.222:80"]
	For $n = 0 To UBound($urlP)-1 ;����ֵ
		ConsoleWrite($urlP[$n] & @CRLF)
		$iPing = Ping(StringLeft($urlP[$n],StringInStr($urlP[$n],":")-1), 500)
		If $iPing Then Return ($urlP[$n])
	Next
	Return ("")
	
EndFunc   ;==>getProxy

Func GetSourcedzx()
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
	$oHTTP.SetProxy(2,getProxyzx());���ô���
	$oHTTP.Open("get", "http://cjxlist.googlecode.com/svn/CustomStrings.dat", False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	If Not StringInStr($return,"Xlist version") Then
		;MsgBox(64, "�Բ���", "������ַʧ�ܣ�",3)
		Exit
	Else	
		$oHTTP = 0
		Return $return
	EndIf	
EndFunc   ;==>GetSource
	
 Func getProxyzx()
$azz="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$strgz=GetSourcezx("http://www.xici.net.co/wn/");http://www.xici.net.co/wt/
If Not StringRegExp($strgz,$azz) Then;����������
		MsgBox(64, "�Բ���", "���ߴ�����ַʧЧ��",3)
Else
		$reg=StringRegExp($strgz,$azz,3)
	For $n= 0 To UBound($reg)/2-1
		$ip=$reg[2*$n]&":"&$reg[2*$n+1] ;& "|"
		ConsoleWrite($ip&@CRLF)
		$iPing = Ping(StringLeft($ip,StringInStr($ip,":")-1), 500)
		If $iPing Then Return ($ip)	
	Next
EndIf
EndFunc

Func GetSourcezx($urls)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $urls, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource	
		

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


