#region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#NoTrayIcon
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListView.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Dim $She = @ScriptDir & "\Skin\aero.she", $SkinDll = @ScriptDir & "\Skin\Skin.dll"
Dim $ConverOver = 0, $conver = 0, $ConverFileList[1000]
#region ### START Koda GUI section ### Form=k:\users\administrator\desktop\tasion\frmmain.kxf
$FrmCADConver = GUICreate("CAD�汾ת��-�������Ź��̹������޹�˾", 667, 475, 285, 141)
$LvFilelist = GUICtrlCreateListView("|||�ļ���|����ļ�|ת��״̬", 8, 8, 649, 289, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 10)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 30)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 10)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 180)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 295)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 5, 100)
$ImgLogo = GUICtrlCreatePic("Logo.jpg", 0, 0, 667, 305)
$BtnAddFile = GUICtrlCreateButton("����ļ�(&A)", 8, 310, 129, 33, $BS_DEFPUSHBUTTON)
$BtnAddFolder = GUICtrlCreateButton("����ļ���(&F)", 146, 310, 129, 33)
;~ $ChkDelRepeat = GUICtrlCreateCheckbox("�Զ�ȥ��", 300, 314, 81, 25)
;~ GUICtrlSetState(-1, $GUI_CHECKED)
$BtnDelSelectFile = GUICtrlCreateButton("�Ƴ�ѡ���ļ�(&D)", 424, 311, 113, 33)
$BtnDelAllFile = GUICtrlCreateButton("�Ƴ������ļ�(&L)", 546, 311, 113, 33)
$LblFileType = GUICtrlCreateLabel("Ŀ���ļ���ʽ(T)", 392, 370, 97, 17)
$CobCADVersion = GUICtrlCreateCombo("", 494, 366, 165, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "AutoCAD 2010ͼ��(*.dwg)|AutoCAD 2007ͼ��(*.dwg)|AutoCAD 2004ͼ��(*.dwg)|AutoCAD 2000ͼ��(*.dwg)", "AutoCAD 2010ͼ��(*.dwg)")
$LblOutFolder = GUICtrlCreateLabel("����ļ���(O)", 9, 370, 78, 17)
$IptOutFolder = GUICtrlCreateInput(@HomeDrive & "\CADConver\" & @MON & @MDAY, 96, 366, 241, 21)
$BtnBrowse = GUICtrlCreateButton("...", 344, 364, 25, 25)
$LblLine = GUICtrlCreateLabel("", 8, 400, 652, 2, $SS_SUNKEN)
$LblCADVersion_ = GUICtrlCreateLabel("����CAD�汾:", 16, 432, 85, 17)
$LblCADVersion = GUICtrlCreateLabel("AutoCAD Version", 96, 432, 160, 17)
GUICtrlSetColor(-1, 0xFF0000)
$BtnConver = GUICtrlCreateButton("��ʼת��(&S)", 424, 415, 233, 49)
$FrmCADConver_Pos = WinGetPos($FrmCADConver)
WinMove($FrmCADConver, "", @DesktopWidth / 2 - $FrmCADConver_Pos[2] / 2, @DesktopHeight / 2 - $FrmCADConver_Pos[3] / 2 - 20)

init()

GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BtnAddFile
			AddFile()
		Case $BtnAddFolder
			AddFolder()
		Case $BtnDelSelectFile
			DelSelectFile()
		Case $BtnDelAllFile
			$DelAllFileAsk = MsgBox(32 + 1 + 8192, "ɾ��ȷ��", "�Ƿ�����б��������ļ�?", 20, $FrmCADConver)
			If $DelAllFileAsk = 1 Then
				GUICtrlSetState($BtnDelSelectFile, $GUI_DISABLE)
				GUICtrlSetState($BtnDelAllFile, $GUI_DISABLE)
				_GUICtrlListView_DeleteAllItems($LvFilelist)
				Control_Disable()
			EndIf
		Case $BtnBrowse
			$FileOutFolder = FileSelectFolder("��ѡ��CAD�ļ�ת��������Ŀ¼", "", 9, @HomeDrive & "\CADConver\" & @MON & @MDAY, $FrmCADConver)
			If $FileOutFolder <> "" Then
				GUICtrlSetData($IptOutFolder, $FileOutFolder)
			EndIf
		Case $BtnConver
			Conver()
	EndSwitch
WEnd


Func init()
	;����Ƿ�װ���������г��򣬷����ͷ��ļ�
	$AcmeCADConverteExist = FileExists(@ProgramFilesDir & "\AcmeCADConverter\AcmeCADConverter.exe")
	If $AcmeCADConverteExist <> 1 Then
		ToolTip("���ڰ�װ���,���Ժ�...", @DesktopWidth - 220, @DesktopHeight - 150, "��װ", 1)
		FileInstall("E:\AcmeCADConverter.exe", @ProgramFilesDir & "\AcmeCADConverter.exe", 1)
		RunWait(@ProgramFilesDir & "\AcmeCADConverter.exe", @ProgramFilesDir, @SW_HIDE)
;~ 		FileDelete(@ProgramFilesDir)
		ToolTip("")
	EndIf
	
	;ע��
	RegWrite("HKEY_CURRENT_USER\Software\DWGTool\CADConverter\Register", "RegistrationCode", "REG_SZ", "PP150JKFF684UF0WW1RGSJUPCPBJGK9NO3IFA6QFMAK17D69LSOET7OI8GFQ")
	;CAD�汾�ж�
	Dim $CADVersionString = "R15.0\ACAD-1:804,15.0\ACAD-1:409,R15.0\ACAD-1:804,R15.0\ACAD-1:409,R16.0\ACAD-201:804,R16.0\ACAD-201:409," & _
			"R16.1\ACAD-301:804,R16.1\ACAD-301:409,R16.2\ACAD-4001:804,R16.2\ACAD-4001:409,R17.0\ACAD-5001:804,R17.0\ACAD-5001:409,R17.1\ACAD-6001:804," & _
			"ACAD-6001:409,R17.2\ACAD-7001:804,R17.2\ACAD-7001:409,R18.0\ACAD-8001:409,R18.0\ACAD-8001:804,R18.1\ACAD-9001:409,R18.1\ACAD-9001:804"
	$CADVersionArray = StringSplit($CADVersionString, ",")
	For $i = 1 To $CADVersionArray[0]
		$CADVersion = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\" & $CADVersionArray[$i], "ProductName")
		If $CADVersion <> "" Then
			If $CADVersion = "AutoCAD 2000" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2000ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2002" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2000ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2004" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2005" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2006" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2007" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2008" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2009" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2010" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2011" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010ͼ��(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2012" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010ͼ��(*.dwg)")
			Else
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004ͼ��(*.dwg)")
			EndIf
			
			$CADVersion_LANCode = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\" & $CADVersionArray[$i], "LocaleId")
			If $CADVersion_LANCode = "804" Then
				$CADVersion_LAN = " �������İ�"
			Else
				$CADVersion_LAN = " Ӣ�İ�"
			EndIf
			GUICtrlSetData($LblCADVersion, $CADVersion & $CADVersion_LAN)
			ExitLoop
		Else
			GUICtrlSetData($LblCADVersion, "δ��⵽CAD��װ����")
		EndIf
	Next
	
	;����·��
	DirCreate(@HomeDrive & "\CADConver\" & @MON & @MDAY)
	Control_Disable()

	
	
;~ 	skin($She)
EndFunc   ;==>init


Func AddFile()
	$FilePath = FileOpenDialog("��ѡ��Ҫת����CAD�ļ�", "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "CAD�ļ� (*.DWG)|", 5, "", $FrmCADConver)
	If $FilePath <> "" Then
		GUICtrlSetState($ImgLogo, $GUI_HIDE)
		GUICtrlSetState($LvFilelist, $GUI_SHOW)
		$OutPath = GUICtrlRead($IptOutFolder)
		If $ConverOver = 1 Then _GUICtrlListView_DeleteAllItems($LvFilelist)
		;����Ƿ�ѡ���˶���ļ�
		If StringInStr($FilePath, "|") > 0 Then
			;���ļ�
			$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
			$FilePathArray = StringSplit($FilePath, "|")
			_GUICtrlListView_BeginUpdate($LvFilelist)
			For $i = 2 To $FilePathArray[0]
				GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $i - 1 + $FileListCount) & "|" & $FilePathArray[1] & "|" & $FilePathArray[$i] & "|" & $OutPath & "\" & $FilePathArray[$i] & "|�ȴ�ת��", $LvFilelist)
			Next
			_GUICtrlListView_SetColumnWidth($LvFilelist, 2, 0)
			_GUICtrlListView_EndUpdate($LvFilelist)
			Control_Enable()

		Else
			;���ļ�
			$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
			;Ŀ¼�ļ����ж�
			$FilePathLen = StringLen($FilePath)
			$FilePathDirSeat = StringInStr($FilePath, "\", 0, -1)
			$FilePathDir = StringLeft($FilePath, $FilePathDirSeat - 1)
			$FileName = StringRight($FilePath, $FilePathLen - $FilePathDirSeat)
			GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $FileListCount + 1) & "|" & $FilePathDir & "|" & $FileName & "|" & $OutPath & "\" & $FileName & "|�ȴ�ת��", $LvFilelist)
			_GUICtrlListView_SetColumnWidth($LvFilelist, 2, 0)
			Control_Enable()
		EndIf
	EndIf
EndFunc   ;==>AddFile



Func AddFolder()
	$FolderPath = FileSelectFolder("ѡ��CAD�ļ������ļ���", "", 2, "", $FrmCADConver)
	If $FolderPath <> "" And $FolderPath <> "�����" And $FolderPath <> "�ҵĵ���" Then
		$OutPath = GUICtrlRead($IptOutFolder)
		If $ConverOver = 1 Then _GUICtrlListView_DeleteAllItems($LvFilelist)
		_GUICtrlListView_BeginUpdate($LvFilelist)
		$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
		$DWGArray = _FileListToArray($FolderPath, "*.dwg", 1)
		If @error <> 4 Then
			GUICtrlSetState($ImgLogo, $GUI_HIDE)
			GUICtrlSetState($LvFilelist, $GUI_SHOW)
			For $i = 1 To $DWGArray[0]
				GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $i + $FileListCount) & "|" & $FolderPath & "|" & $DWGArray[$i] & "|" & $OutPath & "\" & $DWGArray[$i] & "|�ȴ�ת��", $LvFilelist)
			Next
			_GUICtrlListView_SetColumnWidth($LvFilelist, 2, 0)
			_GUICtrlListView_EndUpdate($LvFilelist)
			Control_Enable()
		EndIf
	EndIf
EndFunc   ;==>AddFolder


Func DelSelectFile()
	$Index = _GUICtrlListView_GetSelectedIndices($LvFilelist)
	If $Index <> "" Then
		_GUICtrlListView_DeleteItemsSelected($LvFilelist)
		$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
		If $FileListCount > 0 Then
			For $i = 1 To $FileListCount
				_GUICtrlListView_SetItemText($LvFilelist, $i - 1, StringFormat("[%02d]", $i), 1)
			Next
		Else
			control_disable()
		EndIf
	Else
		MsgBox(64 + 8192, "��ʾ", "��ѡ���б��е��ļ�����ɾ��.", 20, $FrmCADConver)
	EndIf
EndFunc   ;==>DelSelectFile


Func conver()
	;ת��Ŀ���ʽ�ж�
	$CADVersion_ = GUICtrlRead($CobCADVersion)
	If $CADVersion_ = "AutoCAD 2010ͼ��(*.dwg)" Then
		$CAD_Version = "g2010"
	ElseIf $CADVersion_ = "AutoCAD 2007ͼ��(*.dwg)" Then
		$CAD_Version = "g2007"
	ElseIf $CADVersion_ = "AutoCAD 2004ͼ��(*.dwg)" Then
		$CAD_Version = "g2004"
	Else
		$CAD_Version = "g2000"
	EndIf
	;�ļ����
	$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
;~ 	MsgBox(0,0,$FileListCount)
	
	Local $xiegang = "", $l = 0, $k = 0, $Repeat = 0
	For $i = 0 To $FileListCount - 1
		$FileOutPath_Len = StringLen(_GUICtrlListView_GetItemText($LvFilelist, $i, 2))
		If $FileOutPath_Len = 3 Then
			$xiegang = ""
		Else
			$xiegang = "\"
		EndIf
		;�ظ��ļ��ж�
		$ConverFile = _GUICtrlListView_GetItemText($LvFilelist, $i, 2) & $xiegang & _GUICtrlListView_GetItemText($LvFilelist, $i, 3)
;~ 		$ConverFileList[$i] = $ConverFile
;~ 		Do
;~ 			$CompareResult = StringCompare($ConverFileList[$k], $ConverFile)
;~ 			MsgBox(0, "K:" & $k & "i:" & $i, "�Ա�" & $ConverFileList[$k] & @CRLF & $ConverFile & @CRLF & "jieguo��" & $CompareResult)
;~ 			If $CompareResult = 0 Then
;~ 				$Repeat = 1
;~ 				GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
;~ 				GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xCC9933')
;~ 				_GUICtrlListView_SetItemText($LvFilelist, $i, "�б��ļ��ظ�", 5)
;~ 				ExitLoop
;~ 			EndIf
;~ 			$k += 1
;~ 		Until $k = $i
		$ConverFileName = _GUICtrlListView_GetItemText($LvFilelist, $i, 3)
		$FileExist = FileExists($ConverFile)
;~ 		MsgBox(0,0,$FileExist&@CRLF&$ConverFile);
		If $FileExist = 1 Then
			;�ļ����Ŀ¼�ж�
			$FileOutPath = _GUICtrlListView_GetItemText($LvFilelist, $i, 4)
			$FileOutPath_Drive = StringLeft($FileOutPath, 1)
			If $FileOutPath_Drive <> "A" Then
				$FileOutLen = StringLen($FileOutPath)
				$FileOutDirSeat = StringInStr($FileOutPath, "\", 0, -1)
				$FilePathDir = StringLeft($FileOutPath, $FileOutDirSeat - 1)
				$FileNameShort = StringTrimRight(StringRight($FileOutPath, $FileOutLen - $FileOutDirSeat), 4)
				$TempFile = FileOpen($FilePathDir & "\Temp.tmp", 9)
				$FileOutPath_Drive = StringLeft($FileOutPath, 1)
;~ 				MsgBox(0, 0, $ConverFile);
				
				If $TempFile <> -1 Then
					$OutFileExist = FileExists($FileOutPath)
					If $OutFileExist = 1 Then
						Do
							$l += 1
							$FileNameShort = $FileNameShort & "(" & $l & ")"
							$FileOutPath = $FilePathDir & "\" & $FileNameShort & ".dwg"
							$OutFileExist = FileExists($FileOutPath)
							
						Until $OutFileExist <> 1
						$l = 0
						_GUICtrlListView_SetItemText($LvFilelist, $i, $FileOutPath, 4)
					EndIf
					
					;��ʼת��
					$conver = 1
					Control_Disable()
					_GUICtrlListView_SetItemText($LvFilelist, $i, "����ת��...", 5)
					;�ļ�ת����ͼ�б�仯\
					GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFFFFFF')
					GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xfa7906')
					;ת��
					$ConverResult = RunWait(@ProgramFilesDir & "\AcmeCADConverter\AcmeCADConverter.exe /r /l /e /" & $CAD_Version & " " & $ConverFile & " " & $FileOutPath)
;~ 					MsgBox(0, $ConverFile, $ConverResult);
					;ת������ж�
					If $ConverResult = 0 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xf6f6f6')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "ת���ɹ�", 5)
					ElseIf $ConverResult = 1 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[����]�ڴ治��", 5)
					ElseIf $ConverResult = 2 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[����]��ͼʧ��", 5)
					ElseIf $ConverResult = 4 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[����]��Ч�ļ�", 5)
					Else
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xf6f6f6')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "ת���ɹ�", 5)
						
					EndIf
				Else
					MsgBox(64 + 8192, "��ʾ", "���Ŀ¼��д������������д��", 20, $FrmCADConver)
					GUICtrlSetState($IptOutFolder, $GUI_FOCUS)
				EndIf
				FileClose($TempFile)
				FileDelete($FilePathDir & "\Temp.tmp")
			Else
				MsgBox(64 + 8192, "��ʾ", "���Ŀ¼��д������������д��", 20, $FrmCADConver)
				GUICtrlSetState($IptOutFolder, $GUI_FOCUS)
			EndIf
		Else
			GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
			GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
			_GUICtrlListView_SetItemText($LvFilelist, $i, "[����]�ļ�������", 5)
		EndIf
	Next
	$ConverOver = 1
	$conver = 0

	Control_Enable()
	$OutPath = GUICtrlRead($IptOutFolder)
	$OpenDirAsk = MsgBox(64 + 8192 + 4, "��ʾ", "ת�����,�Ƿ�����Ŀ¼?" & @CRLF & @CRLF & "'��'���,'��'�򲻴򿪡�", 20, $FrmCADConver)
	If $OpenDirAsk = 6 Then ShellExecute($OutPath)
EndFunc   ;==>conver

Func Control_Disable()
	If $conver = 1 Then
		GUICtrlSetState($BtnAddFile, $GUI_DISABLE)
		GUICtrlSetState($BtnAddFolder, $GUI_DISABLE)
		GUICtrlSetState($BtnBrowse, $GUI_DISABLE)
		GUICtrlSetState($CobCADVersion, $GUI_DISABLE)
		GUICtrlSetState($IptOutFolder, $GUI_DISABLE)
	EndIf
	GUICtrlSetState($BtnDelSelectFile, $GUI_DISABLE)
	GUICtrlSetState($BtnDelAllFile, $GUI_DISABLE)
	GUICtrlSetState($BtnConver, $GUI_DISABLE)
	GUICtrlSetState($BtnAddFile, $GUI_FOCUS)
EndFunc   ;==>Control_Disable

Func Control_Enable()
	If $conver = 0 Then
		GUICtrlSetState($BtnAddFile, $GUI_ENABLE)
		GUICtrlSetState($BtnAddFolder, $GUI_ENABLE)
		GUICtrlSetState($BtnBrowse, $GUI_ENABLE)
		GUICtrlSetState($CobCADVersion, $GUI_ENABLE)
		GUICtrlSetState($IptOutFolder, $GUI_ENABLE)
	EndIf
	GUICtrlSetState($BtnDelSelectFile, $GUI_ENABLE)
	GUICtrlSetState($BtnDelAllFile, $GUI_ENABLE)
	GUICtrlSetState($BtnConver, $GUI_ENABLE)
	GUICtrlSetState($BtnConver, $GUI_FOCUS)
EndFunc   ;==>Control_Enable


Func _FileListToArray($sPath, $sFilter = "*", $iFlag = 0)
	Local $hSearch, $sFile, $sFileList, $sDelim = "|"
	$sPath = StringRegExpReplace($sPath, "[\\/]+\z", "") & "\" ; ensure single trailing backslash
	If Not FileExists($sPath) Then Return SetError(1, 1, "")
	If StringRegExp($sFilter, "[\\/:><\|]|(?s)\A\s*\z") Then Return SetError(2, 2, "")
	If Not ($iFlag = 0 Or $iFlag = 1 Or $iFlag = 2) Then Return SetError(3, 3, "")
	$hSearch = FileFindFirstFile($sPath & $sFilter)
	If @error Then Return SetError(4, 4, "")
	While 1
		$sFile = FileFindNextFile($hSearch)
		If @error Then ExitLoop
		If ($iFlag + @extended = 2) Then ContinueLoop
		$sFileList &= $sDelim & $sFile
	WEnd
	FileClose($hSearch)
	If Not $sFileList Then Return SetError(4, 4, "")
	Return StringSplit(StringTrimLeft($sFileList, 1), "|")
EndFunc   ;==>_FileListToArray


Func Skin($She)
	$SkinDll = DllOpen(@ScriptDir & "\Skin\Skin.dll")
	DllCall($SkinDll, "int", "SkinH_AttachEx", "str", $She, "str", "mhgd")
	DllCall($SkinDll, "int", "SkinH_SetAero", "int", 0)
EndFunc   ;==>Skin

Func Quit()
	DllClose($SkinDll)
	Exit
EndFunc   ;==>Quit

