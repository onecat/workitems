#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=123.ico
#PRE_Outfile=C:\Users\xiaozhan\Desktop\CJX�������С����.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=Сվ���� by xiaozhan
#PRE_Res_Description=Сվ���� by xiaozhan
#PRE_Res_Fileversion=1.0.0.6
#PRE_Res_LegalCopyright=Сվ���� by xiaozhan
#PRE_Res_requestedExecutionLevel=None
;#PRE_Res_File_Add=123.jpg,-10
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
#include <Constants.au3>
#Include <WinAPIEx.au3>
#Include <File.au3>
#include <String.au3>

FileInstall("C:\Users\xiaozhan\Desktop\123.jpg", @TempDir & "\123.jpg",1)

If Not FileExists("AdMunch.exe") Then
    MsgBox(64,"������ʾ","�뽫������������ţ(AdMunch)��װĿ¼�����У�")
    Exit
EndIf
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�.
Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����.
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("CJX�������С����", 335, 217, 197, 124,$WS_SYSMENU)
$MenuItem = GUICtrlCreateMenu("ѡ��")
$kjqd = GUICtrlCreateMenuItem("��������", $MenuItem)
$zdgx = GUICtrlCreateMenuItem("�Զ�����", $MenuItem)
$ljgx = GUICtrlCreateMenuItem("��������", $MenuItem)
$yctptb = GUICtrlCreateMenuItem("��������ͼ��", $MenuItem)
$gy = GUICtrlCreateMenuItem("����", $MenuItem)
$tc = GUICtrlCreateMenuItem("�˳�", $MenuItem)
$Label1 = GUICtrlCreateLabel("�������״̬��", 8, 24, 88, 17)
$Label2 = GUICtrlCreateLabel("", 120, 24, 88, 17)
$Label3 = GUICtrlCreateLabel("���ع���汾�ţ�", 8, 56, 100, 17)
$Label4 = GUICtrlCreateLabel("", 120, 56, 84, 17)
$Button1 = GUICtrlCreateButton("��������", 8, 120, 73, 33)
;$Button2 = GUICtrlCreateButton("�������", 104, 120, 73, 33)
$Label5 = GUICtrlCreateLabel("�������� by xiaozhan", 200, 144, 130, 17)
GUICtrlSetColor($Label5,0xFF00FF)
$Pic1 = GUICtrlCreatePic(@TempDir & "\123.jpg",  200, 8, 121, 113)
Dim $Form1_1_AccelTable[1][2] = [["6", $gy]]
GUISetAccelerators($Form1_1_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$tkjqd = TrayCreateItem("��������") ;������һ���˵���
TrayItemSetOnEvent(-1,"kjqd") ;ע���һ���˵���ģ������£��¼�  
$tzdgx = TrayCreateItem("�Զ�����") ;�����������˵���
TrayItemSetOnEvent(-1,"zdgx") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("��������") ;�����������˵���
TrayItemSetOnEvent(-1,"ljgx") ;ע��ڶ����˵���ģ������£��¼�
$tyctptb = TrayCreateItem("��������ͼ��") ;�����������˵���
TrayItemSetOnEvent(-1,"yctptb") ;ע��ڶ����˵���ģ������£��¼�
$tgy = TrayCreateItem("����") ;�����������˵���
TrayItemSetOnEvent(-1,"guanyu") ;ע��ڶ����˵���ģ������£��¼�
TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"ExitScript") ;ע��ڶ����˵���ģ������£��¼�
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xianshi")
TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()

If Not FileExists("CJX�������С����.ini") Then
    Local $file = FileOpen("CJX�������С����.ini", 1)
	FileWrite($file, ";���ļ�ΪCJX�������С���ֵ������ļ� �벻Ҫɾ��" & @CRLF)
	FileWrite($file, ";����ɾ�� ������Ĭ������" & @CRLF)
	FileWrite($file, ";���ʱ�� Ϊ��������µļ��ʱ�� ��λΪ��" & @CRLF)
	FileWrite($file, ";��������ͼ���ȼ�Ϊ��Ctrl+Q ���������ȼ�Ϊ��Ctrl+U" & @CRLF)
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�״�����", "��")
	IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "���ʱ��", "1000")
	FileClose($file)
	ini1()
Else
	ini()
EndIf;�жϽ���


Local $str = 'CJX�������С���� �������� by xiaozhan\n\n��л����ţ������ ����ά����\n�Լ�������ع��׵���\n��лilv�Ĵ���֧��'
BDCJXGZ();��ȡ���ذ汾��
While 1
	 	Switch GUIGetMsg()
	Case $GUI_EVENT_CLOSE
			suoxiao()
	Case $tc 
			ExitScript()		
	Case $gy 
			guanyu()
	Case $kjqd
            kjqd()	
	Case $zdgx
			zdgx()
	Case $yctptb
			yctptb()
	Case $Button1
			ljgx()
			ForceDel1()
			ForceDel2()
	;Case $Button2
			;BDCJXGZ()
			;GUICtrlSetData($Label4, $CJXBDGZ)
	EndSwitch	
WEnd



Func ini1();�����ļ������ھ����о���ʾ״̬
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		;MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	


Func ini();�����ļ����ھ���ʾ״̬
	$kj = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	$zd = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "")
	$yt = IniRead(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "")
	If $kj = "��" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "��" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
		ljgx()
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "��" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	

Func kjqd();��������
		$bt = _WinAPI_GetProcessName ()
	If BitAND(GUICtrlRead($kjqd) , $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		MsgBox(0,"���ÿ�������","���ÿ��������ɹ�")
       IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt)
		MsgBox(0,"ȡ����������","ȡ�����������ɹ�")
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf
EndFunc


Func zdgx();�Զ�����
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "�Զ�����", "��")
	EndIf	
EndFunc	

Func yctptb();��������
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
		IniWrite(@ScriptDir & "\CJX�������С����.ini", "����", "��������", "��")
	EndIf		
EndFunc	

Func ljgx();��������
	CJXBAK()
	CJZGX();�����ڼӸ��ж�
EndFunc	

Func guanyu();����
	TrayItemSetState($tgy, $GUI_UNCHECKED)
	MsgBox(0, '����', StringFormat($str))
EndFunc	

Func suoxiao();��С������
 GUISetState(@SW_HIDE,$Form1)
EndFunc

Func xianshi();��ʾGUI����
   GUISetState(@SW_SHOW, $Form1)   ;�������ڵ�״̬
   GUISetState(@SW_RESTORE, $Form1)
 
EndFunc   ;==>����(˫�����)


Func ExitScript()
   FileDelete(@TempDir & "\123.jpg")
   Exit  ; $Quit
EndFunc ;==>�˳�

Func CJXBAK();���CJX�����ļ��Ƿ����
	If FileExists("CustomStrings.dat.BAK") Then
		FileDelete(@ScriptDir & "\CustomStrings.dat.BAK")
		FileCopy (@ScriptDir & "\CustomStrings.dat",@ScriptDir & "\CustomStrings.dat.BAK",1)
	Else
		FileCopy (@ScriptDir & "\CustomStrings.dat",@ScriptDir & "\CustomStrings.dat.BAK",1)
	EndIf
EndFunc	


	
Func CJZGX();CJX�������
	gzxz()
	WLSB()
	ForceDel1()
	ForceDel2()
	FileDelete(@TempDir & "\update.dat")
EndFunc

Func WLSB();�ж�update.dat�ļ�������
	If FileExists (@TempDir & "\update.dat") Then
		bbhdb()
	Else
		GUICtrlSetData($Label2, "����ʧ��")	
	EndIf	
EndFunc

Func bbhdb();�ж�����CJX����ͱ���CJX����
			$HWL = _StringToHex(WLCJXGZ())
			$HBD = _StringToHex(BDCJXGZ())
	If $HWL <= $HBD Then
			BDCJXGZ()
			GUICtrlSetData($Label2, "��������")
	Else
			GUICtrlSetData($Label2, "���ڸ�����")
			THKS()
			THJGZ();�������2�λ�������
			BDCJXGZ()
			GUICtrlSetData($Label2, "�������")
			ForceDel2()
			FileDelete(@TempDir & "\update.dat")
	EndIf	
EndFunc
	
Func THJGZ();������ţCJX����
	If ProcessExists("AdMunch.exe") Then ; Check if the Notepad process is running.
		ProcessClose ("AdMunch.exe") 
		FileDelete(@ScriptDir & "\CustomStrings.dat")
		FileCopy (@TempDir & "\update.dat",@ScriptDir & "\CustomStrings.dat",1)
		ForceDel2()
		FileDelete(@TempDir & "\update.dat")
		_RefreshSystemTray();ˢ������ͼ��
		ShellExecute("AdMunch.exe","",@ScriptDir)
EndIf
		
EndFunc	

Func gzxz();����CJX�����ļ�
	GUICtrlSetData($Label2, "��ȡ����")
	Local $hDownload = InetGet("http://cjxlist.googlecode.com/svn/CustomStrings.dat", @TempDir & "\update.dat", 1, 1)
Do
    Sleep(250)
Until InetGetInfo($hDownload, 2)    ; ��������Ƿ����.
	Local $nBytes = InetGetInfo($hDownload, 0)
	InetClose($hDownload)   ; �رվ��,�ͷ���Դ.
	;MsgBox(4096, "", "�ֽڶ�ȡ: " & $nBytes)
EndFunc



Func WLCJXGZ();����CJX����
	$IniFile = @TempDir & "\update.dat"                                 ;�ı�·��
	$Lines = _FileCountLines($IniFile)                       ;��ȡ�ı�����
For $i=1 To $Lines-1                                           ;ѭ��
        $ReadFile=FileReadLine($IniFile,$i)                       ;��1�п�ʼ��ȡ
        If $ReadFile='' Then ExitLoop                                  ;�ı����˳�
        If stringinstr($ReadFile,"Xlist version") Then   			;���ش��������ŵ��ַ���
		Local $WLCJXGZ = StringTrimLeft($ReadFile, 14)
		Return($WLCJXGZ)
		ExitLoop
		;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ) 
		;MsgBox(4096, "���ұ������ַ�Ϊ:", $CJXBDGZ)   
	EndIf    

NEXT
EndFunc;��ȡ����CJX����

Func BDCJXGZ();��ȡ����CJX����
	$IniFile = @ScriptDir & "\CustomStrings.dat"                                 ;�ı�·��
	$Lines = _FileCountLines($IniFile)                       ;��ȡ�ı�����
For $i=1 To $Lines-1                                           ;ѭ��
        $ReadFile=FileReadLine($IniFile,$i)                       ;��1�п�ʼ��ȡ
        If $ReadFile='' Then ExitLoop                                  ;�ı����˳�
        If stringinstr($ReadFile,"Xlist version") Then   			;���ش��������ŵ��ַ���
		Local $BDCJXGZ = StringTrimLeft($ReadFile, 14)
		GUICtrlSetData($Label4, $BDCJXGZ)
		Return($BDCJXGZ)
		ExitLoop
		;MsgBox(4096, "���ұ������ַ�Ϊ:", $GZ) 

	EndIf    
 
NEXT
EndFunc;��ȡ����CJX����


	
Func THKS();�滻��ʼ
	$IniFile = "CustomStrings.dat"                                 ;�ı�·��
	$Lines = _FileCountLines($IniFile)                       ;��ȡ�ı�����
For $i=1 To $Lines-1                                           ;ѭ��

        $ReadFile=FileReadLine($IniFile,$i)                       ;��1�п�ʼ��ȡ
		FileWriteLine(@TempDir & "\���������ʱ�ļ�.txt", $ReadFile)
        If stringinstr($ReadFile,"Xlist version") Then                            ;���ش��������ŵ��ַ���
			 QCBBH()
			 WLTH()
			ExitLoop 
	EndIf     
NEXT
EndFunc

Func QCBBH();ȥ���汾��
	Local Const $aFile = @TempDir & "\���������ʱ�ļ�.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, 0, $file_begin)
	FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$last = FileRead($aFile,Filegetpos($hFile))
	FileOpen($aFile, 2)
	FileWrite($aFile,$last)
	FileClose($aFile)
	Return($last)
EndFunc

Func WLTH();���Զ������д��CJX����
Local Const $aFile3 = @TempDir & "\update.dat"
Local $hFile = FileOpen($aFile3, 1)
FileFlush($hFile)
FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile3), 2), Chr(13), 0, -1), $file_current)
$last = FileRead($aFile3,Filegetpos($hFile))
	FileOpen($aFile3, 2)
	FileWrite($aFile3,QCBBHGZ() & $last)
	FileClose($aFile3)
	;FileDelete(@TempDir & "\���������ʱ�ļ�.txt")
EndFunc

Func QCBBHGZ();��ȡû�汾�ŵ��Զ������
	Local Const $aFile = @TempDir & "\���������ʱ�ļ�.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$QCBBHGZ = FileRead($aFile,Filegetpos($hFile))
	Return($QCBBHGZ)
EndFunc


Func ForceDel1();ɾ�����������ʱ�ļ�.tx
        Local $file = @TempDir & "\���������ʱ�ļ�.txt"
        ;If FileExists($file) = 0 Then Exit(MsgBox(0,'','�ļ�������'))
        ;If @OSArch = 'X64' Then Exit(MsgBox(0,'','��֧�ִ�ƽ̨ϵͳ'))
        If FileDelete($file) = 0 Then
                Local $tempdata = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager','PendingFileRenameOperations')
                RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager','PendingFileRenameOperations','REG_MULTI_SZ',$tempdata&@LF&'\??\'&@LF&$file&'!\??\')
        EndIf
EndFunc

Func ForceDel2();ɾ��update.dat
        Local $file =  @TempDir & "\update.dat"
       ; If FileExists($file) = 0 Then Exit(MsgBox(0,'','�ļ�������'))
        ;If @OSArch = 'X64' Then Exit(MsgBox(0,'','��֧�ִ�ƽ̨ϵͳ'))
        If FileDelete($file) = 0 Then
                Local $tempdata = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager','PendingFileRenameOperations')
                RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager','PendingFileRenameOperations','REG_MULTI_SZ',$tempdata&@LF&'\??\'&@LF&$file&'!\??\')
        EndIf
EndFunc


Func _RefreshSystemTray($nDelay = 1000);ˢ������ͼ��
    Local $oldMatchMode = Opt("WinTitleMatchMode", 4)
    Local $oldChildMode = Opt("WinSearchChildren", 1)
    Local $error = 0
    Do
        Local $hWnd = WinGetHandle("classname=TrayNotifyWnd")
        If @error Then
            $error = 1
            ExitLoop
        EndIf
        Local $hControl = ControlGetHandle($hWnd, "", "Button1")
        
        If $hControl <> "" And ControlCommand($hWnd, "", $hControl, "IsVisible") Then
            ControlClick($hWnd, "", $hControl)
            Sleep($nDelay)
        EndIf
        Local $posStart = MouseGetPos()
        Local $posWin = WinGetPos($hWnd)    
        Local $y = $posWin[1]
        While $y < $posWin[3] + $posWin[1]
            Local $x = $posWin[0]
            While $x < $posWin[2] + $posWin[0]
                DllCall("user32.dll", "int", "SetCursorPos", "int", $x, "int", $y)
                If @error Then
                    $error = 2
                    ExitLoop 3;
                EndIf
                $x += 8
            WEnd
            $y += 8
        WEnd
        DllCall("user32.dll", "int", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
        If $hControl <> "" And ControlCommand($hWnd, "", $hControl, "IsVisible") Then
            ControlClick($hWnd, "", $hControl)
        EndIf
    Until 1
    Opt("WinTitleMatchMode", $oldMatchMode)
    Opt("WinSearchChildren", $oldChildMode)
    SetError($error)
EndFunc


;���ļ�ΪCJX�������С���ֵ������ļ� �벻Ҫɾ�� 
;����ɾ�� ������Ĭ������
;���ʱ�� Ϊ��������µļ��ʱ�� ��λΪ��
;��������ͼ���ȼ�Ϊ��Ctrl+Q ���������ȼ�Ϊ��Ctrl+U
;~ [����]
;~ ��������=��
;~ �Զ�����=��
;~ �״�����=�� ;��һ�����оͼ��뿪������
;~ ���ʱ��=1000 
;~ ��������=��
