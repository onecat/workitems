#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=C:\WINDOWS\system32\SHELL32.dll|-122
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Dim $Get_Dat;����au3�����ļ��õ�

Dim $s_url,$md,$s_Size,$temp_file,$V_V,$Get_size
#Region ### START Koda GUI section ### Form=D:\�Զ����³���\���³���v1.kxf
$Form1 = GUICreate("�����������ʾ��", 245, 341, -1, -1)
$Group1 = GUICtrlCreateGroup("���س���", 8, 8, 225, 129)
GUICtrlCreateLabel("�汾:", 16, 32, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("����:", 16, 56, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("·��:", 16, 80, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("��ע:", 16, 104, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("", 50, 32, 175, 17) ;�汾
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label6 = GUICtrlCreateLabel("", 50, 56, 175, 17) ;����
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label7 = GUICtrlCreateLabel("", 50, 80, 175, 17) ;·��
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x800080)
$Label8 = GUICtrlCreateLabel("", 50, 104, 175, 17) ;��ע
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000080)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Group2 = GUICtrlCreateGroup("���³���", 8, 144, 225, 129)
GUICtrlSetColor(-1, 0x0000ff)
GUICtrlCreateLabel("�汾:", 16, 168, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("����:", 16, 192, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("��ַ:", 16, 216, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("��ע:", 16, 240, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label13 = GUICtrlCreateLabel("", 50, 168, 175, 17) ;�°汾
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label14 = GUICtrlCreateLabel("", 50, 192, 175, 17) ;������
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label15 = GUICtrlCreateLabel("", 50, 216, 175, 17) ;���ص�ַ
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x800080)
$Label16 = GUICtrlCreateLabel("", 50, 240, 175, 17) ;��ע��Ϣ
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000080)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Button1 = GUICtrlCreateButton("����", 194, 280, 41, 25)
$Progress1 = GUICtrlCreateProgress(50, 284, 140, 17)
$Label17 = GUICtrlCreateLabel("", 8, 285, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
GUICtrlCreateLabel("",8,310, 230, 17, $SS_ETCHEDHORZ)
GUICtrlCreateLabel("AutoIT V3 ������ ��������  by:��ɫ��", 12,320, 240, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Dim $md = RegRead64('HKLM\Software\AutoIt v3\AutoIt', 'InstallDir') & '\AutoIt3.exe' ;��ȡautoit3��·��
_GetVer($md)
_getNew();��ȡ����


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Label7 ;���ص�ַ
			ClipPut($md)
			MsgBox(0,"��ʾ",$md&@CRLF&"·���Ѹ��Ƶ�������",2)
		Case $Label15 ;Զ�̵�ַ
			ClipPut($s_url)
			MsgBox(0,"��ʾ",$s_url&@CRLF&"��ַ�Ѹ��Ƶ�������",2)
		Case $Button1 ;����
			_getDown()
	EndSwitch
WEnd

;��ȡ���س�����Ϣ
Func _GetVer($md)
	Local $ver = FileGetVersion($md, "FileVersion") ;��ȡ�ļ��汾��Ϣ
	Local $beij = FileGetVersion($md, "FileDescription") ;��ȡ�ļ���ע��Ϣ
	Local $md83 = FileGetShortName($md) ;���� 8.3��ʽ·��
	Local $tarr = FileGetTime($md) ;�޸�ʱ��
	If @error <> 0 Then
		GUICtrlSetData($Label6, "null")
	Else
		GUICtrlSetData($Label6, $tarr[0] & "��" & $tarr[1] & "��" & $tarr[2] & "��  " & $tarr[3] & ":" & $tarr[4] & ":" & $tarr[5]) ;�޸�ʱ��
	EndIf
	GUICtrlSetData($Label5, $ver) ;�汾
	If FileExists($md) Then
		If StringLen($md) > 25 Then
			GUICtrlSetData($Label7, StringLeft($md83, 22) & "...")
			GUICtrlSetTip($Label7, $md)
		Else
			GUICtrlSetData($Label7, $md)
		EndIf
	Else
		GUICtrlSetData($Label7, "nul")
	EndIf
	If StringLen($beij) > 25 Then
		GUICtrlSetData($Label8, StringLeft($beij, 22) & "...")
		GUICtrlSetTip($Label8, $beij)
	Else
		GUICtrlSetData($Label8, $beij)
	EndIf
EndFunc   ;==>_GetVer
;
;~ ===================================================================================ʾ����
;
;��ע����л�ȡ  Autoit3��·��
Func RegRead64($sKeyname, $sValue)
	Local $res = RegRead($sKeyname, $sValue)
	If @error And @AutoItX64 Then
		$sKeyname = StringReplace($sKeyname, "HKEY_LOCAL_MACHINE", "HKLM")
		$sKeyname = StringReplace($sKeyname, "HKLM\SOFTWARE\", "HKLM\SOFTWARE\Wow6432Node\")
		$res = RegRead($sKeyname, $sValue)
		If @error Then
			SetError(1)
			Return ""
		EndIf
	EndIf
	SetError(0)
	Return $res
EndFunc   ;==>RegRead64
;
;��ȡ���µ���Ϣ
Func _getNew()
	GUICtrlSetData($Label17, "�����")
	Dim $V_V = 1 ;һ�����ض���
	Local $url = "http://www.autoitscript.com/autoit3/files/beta/update.dat"
	Dim $Get_size = InetGetSize($url, 1)
	Dim $temp_file =  @TempDir & "\Au3_upDate.ini"
	Dim $Get_Dat = InetGet($url, $temp_file, 1, 1)
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	AdlibRegister("_getCK", 1000) ;�������
EndFunc   ;==>_getNew
;
;�����³���
Func _getDown()
	GUICtrlSetData($Label17, "������")
	Local $url =  $s_url  ;���ص�ַ
	Dim $V_V = 0 ;����
	Dim $Get_size = $s_Size
	Dim $temp_file = @ScriptDir & "\Au3UP.exe"
	Dim $Get_Dat = InetGet($url, $temp_file, 1, 1)
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	AdlibRegister("_getCK", 1000) ;�������
EndFunc   ;==>_getNew
;
;�������
Func _getCK()
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	If InetGetInfo($Get_Dat, 2) Then
		If InetGetInfo($Get_Dat, 3) = False Then
			$i_Res = MsgBox(5 + 16 + 8192, '������!', '�޷����ӵ��ٷ�������.' & @LF & _
					'�볢�����в���:' & @LF & _
					' - ȷ�ϵ����Ѿ����ӵ�������' & @LF & _
					' - ����ǽ��Ҫ��ֹ���������ӵ�������' & @CRLF & _
					' - ��¼ �ٷ���վ����������̳ �����������' & @LF & _
					' - ȷ�Ϲٷ�����������̳��û�е���	��|^_^|��')
			If $i_Res = 4 Then
				AdlibUnRegister("_getCK");ȡ�����
				_getNew()
			Else
				Exit ;�˳�����
			EndIf
		Else
			InetClose($Get_Dat)
			AdlibUnRegister("_getCK") ;ȡ�����
			If $V_V = 1 Then _set_new() ;�����Ϣ��gui��
			If $V_V = 0 Then _DownRun() ;�������
			GUICtrlSetData($Label17, "���")
		EndIf
	EndIf
EndFunc   ;==>_getCK
;
;�����µ���Ϣ��gui��
Func _set_new()
	Dim $s_Ver = IniRead($temp_file, 'AutoIt', 'version', "nul")
	Dim $s_url = IniRead($temp_file, 'AutoIt', 'setup', 'nul')
	Dim $s_Page = IniRead($temp_file, 'AutoIt', 'index', 'http://www.autoitscript.com') ;����ĳ������ı�ע����
	Dim $s_Size = IniRead($temp_file, 'AutoIt', 'filesize', 0)
	$s_Date = IniRead($temp_file, 'AutoIt', 'filetime', 0)
	GUICtrlSetData($Label13, $s_Ver) ;�汾
	GUICtrlSetData($Label14, StringLeft($s_Date,4)&"��"&StringRight(StringLeft($s_Date,6),2)&"��"&StringRight(StringLeft($s_Date,8),2)&"�� " & _ ;����
					StringRight(StringLeft($s_Date,8),2)&":"&StringRight(StringLeft($s_Date,10),2)&":"&StringRight($s_Date,2)) ;ʱ��
;~ 	GUICtrlSetData($Label15,$s_url)
	
	If StringLen($s_url) > 35 Then ;·��
		GUICtrlSetData($Label15, StringLeft($s_url, 32) & "...")
		GUICtrlSetTip($Label15, $s_url)
	Else
		GUICtrlSetData($Label15, $s_url)
	EndIf	
	If StringLen($s_Page) > 25 Then ;��ע
		GUICtrlSetData($Label16, StringLeft($s_Page, 22) & "...")
		GUICtrlSetTip($Label16, $s_Page)
	Else
		GUICtrlSetData($Label16, $s_Page)
	EndIf
	FileDelete($temp_file)
EndFunc   ;==>_set_new
;
;�������صĳ���
Func _DownRun()
	Local $ver = MsgBox(1, "��ʾ", $temp_file & @CRLF & "��������Ƿ�װ?")
	If $ver = 1 Then
		If @OSType = 'WIN32_NT' Then
			$s_StartStr = @ComSpec & ' /c start "" '
		Else
			$s_StartStr = @ComSpec & ' /c start '
		EndIf
		Run($s_StartStr & $temp_file, '', @SW_HIDE)
	EndIf
	Exit
EndFunc   ;==>_DownRun
 
