#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ACN_HASH.au3>
#AutoIt3Wrapper_icon=D:\autoit3\Aut2Exe\Icons\kde.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=��������ά��       ��д���� ����������QQ_825312600  Http://www.sn189.com
#AutoIt3Wrapper_Res_Description=��������ά�����ҡ� Http://www.sn189.com
#AutoIt3Wrapper_Res_Fileversion=1.0.5.0
;  2010-08-07 19:27����  (�û���)
; ������ά������ 
;��������ά�����ҡ� Http://www.sn189.com 
; �����д����������QQ:825312600 
#NoTrayIcon 

Global $Cdkey, $cpuid, $hdKey ,$Iname ,$Ihdkey ,$Iregkey
$RegPW1 = "QQ_825312600" ;������֮������ 1
$RegPW2 = "WWW.SN189.COM" ;������֮������ 2
$KeyPw = "Cmaoge@126.com" ;����ע����ʱ�õ��� ������!
$RegGUI = GUICreate(" ����ע��", 283, 157, @DesktopWidth / 2 - 150, @DesktopHeight / 2 - 150)
$Title = GUICtrlCreateLabel("* * ����ע�� ", 80, 4, 130, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$User = GUICtrlCreateLabel("�û���", 8, 28, 40, 17)
$RegUser = GUICtrlCreateInput("Sn189", 55, 25, 217, 21, BitOR($ES_CENTER, $ES_AUTOHSCROLL, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
GUICtrlSetLimit(-1, 15)
GUICtrlSetBkColor(-1, 0xECE9D8)
$MacKey = GUICtrlCreateLabel("������", 8, 58, 40, 17)
$hdKey = GUICtrlCreateInput(_HDkey(), 55, 55, 217, 21, BitOR($ES_CENTER, $ES_READONLY, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
GUICtrlSetLimit(-1, 32)
GUICtrlSetBkColor(-1, 0xECE9D8)
$RegSn = GUICtrlCreateLabel("ע����", 8, 88, 40, 17)
$RegKey = GUICtrlCreateInput("", 55, 85, 217, 21, BitOR($ES_CENTER, $ES_AUTOHSCROLL, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
GUICtrlSetLimit(-1, 32)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetBkColor(-1, 0xECE9D8)
$BtnOK = GUICtrlCreateButton(" ע �� ", 104, 120, 75, 25)
GUISetState(@SW_SHOW)
ClipPut(_HDkey()) ;�Ѻ���_HDkey() ��ȡ�õ�Ӳ���벢�ڼ��ܺ� ���͵����а���..
MsgBox(0, "��ʾ:", " �Ѿ��������뷢�͵����а� " & @CR & "  ����ֱ��ճ��ע����! " & @CR & "�뽫�û����ͻ����뷢������!", 3)
_IniVer()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BtnOK
			If GUICtrlRead($RegUser) = "" Or GUICtrlRead($RegKey) = "" Then
				MsgBox(0, "����", "�û�����ע���붼����Ϊ��")
			Else	
				If GUICtrlRead($RegKey)  =  _CdKey() Then 
					IniWrite("sn189.dat", "ע��", "�û��� ", GUICtrlRead($RegUser))
					IniWrite("sn189.dat", "ע��", "������ ",  _HDkey()  )
					IniWrite("sn189.dat", "ע��", "ע���� ", GUICtrlRead($RegKey) )
				    MsgBox(48, "��ʾ", "    ע��ɹ� "  )
				Else
					MsgBox(48, "����", "    ע��ʧ�� " & @CR & "�û�����ע�������!"  )
;~ 					ExitLoop
					;ʧ��֮���˳�����
				EndIf
				;������ζ���ִ�еĲ���,���Ե�ע��ʧ�ܺ� �˳��������һֱѭ��ע��Ľ���
			EndIf
	EndSwitch
WEnd
Func _Cpuid() ;ȡ��CPU�����к�ID
	$objWMIService = ObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	$colCPU = $objWMIService.ExecQuery("Select * from Win32_Processor")
	For $object In $colCPU
		$cpu = StringStripWS($object.ProcessorId, 1)
		Return $cpuid ;��������������ú���һ����������
	Next
EndFunc   ;==>_Cpuid
Func _HDkey() ;��CPU���к�ID����
	$hdKey = StringMid(_MD5(StringMid(_MD5($cpuid & $RegPW1), 3, 34) & $RegPW2), 3, 34)
	Return $hdKey
;~ 	ClipPut($hdKey)  ;
;~ 	MsgBox(0, "��ʾ:", " �Ѿ���ע���뷢�͵����а� " & @CR & " ����ֱ��ճ��ע����! ")
EndFunc   ;==>_HDkey
Func _CdKey() ;���ܵĹؼ����� ��������MD5����  ����ע����Ĺؼ����־�������, ���Ҫ�Լ�д�����㷨 �Ǿ͸�����
	_HDkey()
	$Cdkey = StringMid(_MD5($hdKey & GUICtrlRead($RegUser) & $KeyPw), 3, 34) ;MD5���� û�¿��������ƽ�һ��@!!!!!
	;StringMid����ȡ�ֽ��еĲ����ַ� ,GUICtrlRead��ȡ�ؼ��е�����,
	Return $Cdkey
EndFunc   ;==>_CdKey

Func _IniVer()
$iregkey = IniRead("sn189.dat", "ע��", "ע����", "")
   If $Iregkey = _Cdkey() Then
	   GUICtrlSetData($RegKey,"ע��ɹ�", "") ;�������$RegKey д������$Cdkey
;~  ע��ɹ�ʱ �Ĵ���ʽ
   EndIf   
;~    �������д��û��ע����߹��ں�Ĵ���ʽ
EndFunc