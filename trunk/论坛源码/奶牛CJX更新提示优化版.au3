#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=N:\����\QQ\3D���ICOͼ��\deamon.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\��ţCJX������ʾ.exe
#PRE_Compression=4
#PRE_Res_Comment=Сվ����
#PRE_Res_Description=Сվ����
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=Сվ����
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
#include <File.au3>
#Include <WinAPIEx.au3>
#Include <String.au3>
#include <IE.au3>
#include <MSHtml.au3>
#include <IEEX.au3>
If  ProcessExists("AdMunch.exe") Then ; �����±������Ƿ���������.
	bbhdb()
Else
    MsgBox(0, "�����ţCJX�汾", "��ţû�����У���������ţ�������б�����")
	Exit
EndIf




Func bbhdb();�ж�����CJX����ͱ���CJX���� 
	$HBD = _StringToHex(BDCJXGZ())
	$HWL = _StringToHex(WLCJXGZ())
	If $HWL <= $HBD Then
		 MsgBox(0,"��ţCJX����","��ţCJX�����Ѿ�������" & @CRLF & "�°汾   ��" & WLCJXGZ() & @CRLF & "���ذ汾��" & BDCJXGZ())
		 Exit
	Else
		 MsgBox(0,"��ţCJX����","��ţCJX�������°汾��ʱ����"& @CRLF & "�°汾   ��" & WLCJXGZ() & @CRLF & "���ذ汾��" & BDCJXGZ())
		 Exit
	EndIf
EndFunc   ;==>bbhdb

Func WLCJXGZ()
	   WLCJXGZ1()
	If WLCJXGZ1() =  "" Then
		WLCJXGZ2()
		Return(WLCJXGZ2())
	Else
		WLCJXGZ1()
		Return(WLCJXGZ1())
	EndIf	
EndFunc	

Func WLCJXGZ1()
Local $doc = _MHDocGetObj() ;����document����
_MHNavigate($doc, "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat",4) ;���ϻ�ȡ�ٶ�Դ�벢���ص�mshtml,4 utf8����ת��
Local $su = _IEQuery($doc,"td","class=source") ;id��������
Local $sText = _IEPropertyGet($su,"outertext") ;ȡ��ʾ�ı�
$GZ = StringTrimLeft($sText,14)
Return ($GZ)
EndFunc 

Func WLCJXGZ2()
$a=InetRead ( "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat" , 1)
$array = StringRegExp(BinaryToString($a), '><td class="source">Xlist version (.*?)<br></td></tr', 2)
$GZ = $array[1]
Return ($GZ)
EndFunc 

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