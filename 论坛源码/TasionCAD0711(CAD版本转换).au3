#region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
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
$FrmCADConver = GUICreate("CAD版本转换-宁波天信工程管理有限公司", 667, 475, 285, 141)
$LvFilelist = GUICtrlCreateListView("|||文件名|输出文件|转换状态", 8, 8, 649, 289, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 10)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 30)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 10)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 180)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 295)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 5, 100)
$ImgLogo = GUICtrlCreatePic("Logo.jpg", 0, 0, 667, 305)
$BtnAddFile = GUICtrlCreateButton("添加文件(&A)", 8, 310, 129, 33, $BS_DEFPUSHBUTTON)
$BtnAddFolder = GUICtrlCreateButton("添加文件夹(&F)", 146, 310, 129, 33)
;~ $ChkDelRepeat = GUICtrlCreateCheckbox("自动去重", 300, 314, 81, 25)
;~ GUICtrlSetState(-1, $GUI_CHECKED)
$BtnDelSelectFile = GUICtrlCreateButton("移除选中文件(&D)", 424, 311, 113, 33)
$BtnDelAllFile = GUICtrlCreateButton("移除所有文件(&L)", 546, 311, 113, 33)
$LblFileType = GUICtrlCreateLabel("目标文件格式(T)", 392, 370, 97, 17)
$CobCADVersion = GUICtrlCreateCombo("", 494, 366, 165, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "AutoCAD 2010图形(*.dwg)|AutoCAD 2007图形(*.dwg)|AutoCAD 2004图形(*.dwg)|AutoCAD 2000图形(*.dwg)", "AutoCAD 2010图形(*.dwg)")
$LblOutFolder = GUICtrlCreateLabel("输出文件夹(O)", 9, 370, 78, 17)
$IptOutFolder = GUICtrlCreateInput(@HomeDrive & "\CADConver\" & @MON & @MDAY, 96, 366, 241, 21)
$BtnBrowse = GUICtrlCreateButton("...", 344, 364, 25, 25)
$LblLine = GUICtrlCreateLabel("", 8, 400, 652, 2, $SS_SUNKEN)
$LblCADVersion_ = GUICtrlCreateLabel("本机CAD版本:", 16, 432, 85, 17)
$LblCADVersion = GUICtrlCreateLabel("AutoCAD Version", 96, 432, 160, 17)
GUICtrlSetColor(-1, 0xFF0000)
$BtnConver = GUICtrlCreateButton("开始转化(&S)", 424, 415, 233, 49)
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
			$DelAllFileAsk = MsgBox(32 + 1 + 8192, "删除确认", "是否清除列表中所有文件?", 20, $FrmCADConver)
			If $DelAllFileAsk = 1 Then
				GUICtrlSetState($BtnDelSelectFile, $GUI_DISABLE)
				GUICtrlSetState($BtnDelAllFile, $GUI_DISABLE)
				_GUICtrlListView_DeleteAllItems($LvFilelist)
				Control_Disable()
			EndIf
		Case $BtnBrowse
			$FileOutFolder = FileSelectFolder("请选择CAD文件转化后的输出目录", "", 9, @HomeDrive & "\CADConver\" & @MON & @MDAY, $FrmCADConver)
			If $FileOutFolder <> "" Then
				GUICtrlSetData($IptOutFolder, $FileOutFolder)
			EndIf
		Case $BtnConver
			Conver()
	EndSwitch
WEnd


Func init()
	;检测是否安装，是则运行程序，否则释放文件
	$AcmeCADConverteExist = FileExists(@ProgramFilesDir & "\AcmeCADConverter\AcmeCADConverter.exe")
	If $AcmeCADConverteExist <> 1 Then
		ToolTip("正在安装软件,请稍后...", @DesktopWidth - 220, @DesktopHeight - 150, "安装", 1)
		FileInstall("E:\AcmeCADConverter.exe", @ProgramFilesDir & "\AcmeCADConverter.exe", 1)
		RunWait(@ProgramFilesDir & "\AcmeCADConverter.exe", @ProgramFilesDir, @SW_HIDE)
;~ 		FileDelete(@ProgramFilesDir)
		ToolTip("")
	EndIf
	
	;注册
	RegWrite("HKEY_CURRENT_USER\Software\DWGTool\CADConverter\Register", "RegistrationCode", "REG_SZ", "PP150JKFF684UF0WW1RGSJUPCPBJGK9NO3IFA6QFMAK17D69LSOET7OI8GFQ")
	;CAD版本判断
	Dim $CADVersionString = "R15.0\ACAD-1:804,15.0\ACAD-1:409,R15.0\ACAD-1:804,R15.0\ACAD-1:409,R16.0\ACAD-201:804,R16.0\ACAD-201:409," & _
			"R16.1\ACAD-301:804,R16.1\ACAD-301:409,R16.2\ACAD-4001:804,R16.2\ACAD-4001:409,R17.0\ACAD-5001:804,R17.0\ACAD-5001:409,R17.1\ACAD-6001:804," & _
			"ACAD-6001:409,R17.2\ACAD-7001:804,R17.2\ACAD-7001:409,R18.0\ACAD-8001:409,R18.0\ACAD-8001:804,R18.1\ACAD-9001:409,R18.1\ACAD-9001:804"
	$CADVersionArray = StringSplit($CADVersionString, ",")
	For $i = 1 To $CADVersionArray[0]
		$CADVersion = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\" & $CADVersionArray[$i], "ProductName")
		If $CADVersion <> "" Then
			If $CADVersion = "AutoCAD 2000" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2000图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2002" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2000图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2004" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2005" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2006" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2007" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2008" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2009" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2007图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2010" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2011" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010图形(*.dwg)")
			ElseIf $CADVersion = "AutoCAD 2012" Then
				GUICtrlSetData($CobCADVersion, "AutoCAD 2010图形(*.dwg)")
			Else
				GUICtrlSetData($CobCADVersion, "AutoCAD 2004图形(*.dwg)")
			EndIf
			
			$CADVersion_LANCode = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\AutoCAD\" & $CADVersionArray[$i], "LocaleId")
			If $CADVersion_LANCode = "804" Then
				$CADVersion_LAN = " 简体中文版"
			Else
				$CADVersion_LAN = " 英文版"
			EndIf
			GUICtrlSetData($LblCADVersion, $CADVersion & $CADVersion_LAN)
			ExitLoop
		Else
			GUICtrlSetData($LblCADVersion, "未检测到CAD安装程序")
		EndIf
	Next
	
	;建立路径
	DirCreate(@HomeDrive & "\CADConver\" & @MON & @MDAY)
	Control_Disable()

	
	
;~ 	skin($She)
EndFunc   ;==>init


Func AddFile()
	$FilePath = FileOpenDialog("请选择要转换的CAD文件", "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "CAD文件 (*.DWG)|", 5, "", $FrmCADConver)
	If $FilePath <> "" Then
		GUICtrlSetState($ImgLogo, $GUI_HIDE)
		GUICtrlSetState($LvFilelist, $GUI_SHOW)
		$OutPath = GUICtrlRead($IptOutFolder)
		If $ConverOver = 1 Then _GUICtrlListView_DeleteAllItems($LvFilelist)
		;检测是否选择了多个文件
		If StringInStr($FilePath, "|") > 0 Then
			;多文件
			$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
			$FilePathArray = StringSplit($FilePath, "|")
			_GUICtrlListView_BeginUpdate($LvFilelist)
			For $i = 2 To $FilePathArray[0]
				GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $i - 1 + $FileListCount) & "|" & $FilePathArray[1] & "|" & $FilePathArray[$i] & "|" & $OutPath & "\" & $FilePathArray[$i] & "|等待转换", $LvFilelist)
			Next
			_GUICtrlListView_SetColumnWidth($LvFilelist, 2, 0)
			_GUICtrlListView_EndUpdate($LvFilelist)
			Control_Enable()

		Else
			;单文件
			$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
			;目录文件名判断
			$FilePathLen = StringLen($FilePath)
			$FilePathDirSeat = StringInStr($FilePath, "\", 0, -1)
			$FilePathDir = StringLeft($FilePath, $FilePathDirSeat - 1)
			$FileName = StringRight($FilePath, $FilePathLen - $FilePathDirSeat)
			GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $FileListCount + 1) & "|" & $FilePathDir & "|" & $FileName & "|" & $OutPath & "\" & $FileName & "|等待转化", $LvFilelist)
			_GUICtrlListView_SetColumnWidth($LvFilelist, 2, 0)
			Control_Enable()
		EndIf
	EndIf
EndFunc   ;==>AddFile



Func AddFolder()
	$FolderPath = FileSelectFolder("选择CAD文件所在文件夹", "", 2, "", $FrmCADConver)
	If $FolderPath <> "" And $FolderPath <> "计算机" And $FolderPath <> "我的电脑" Then
		$OutPath = GUICtrlRead($IptOutFolder)
		If $ConverOver = 1 Then _GUICtrlListView_DeleteAllItems($LvFilelist)
		_GUICtrlListView_BeginUpdate($LvFilelist)
		$FileListCount = _GUICtrlListView_GetItemCount($LvFilelist)
		$DWGArray = _FileListToArray($FolderPath, "*.dwg", 1)
		If @error <> 4 Then
			GUICtrlSetState($ImgLogo, $GUI_HIDE)
			GUICtrlSetState($LvFilelist, $GUI_SHOW)
			For $i = 1 To $DWGArray[0]
				GUICtrlCreateListViewItem("|" & StringFormat("[%02d]", $i + $FileListCount) & "|" & $FolderPath & "|" & $DWGArray[$i] & "|" & $OutPath & "\" & $DWGArray[$i] & "|等待转换", $LvFilelist)
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
		MsgBox(64 + 8192, "提示", "请选择列表中的文件进行删除.", 20, $FrmCADConver)
	EndIf
EndFunc   ;==>DelSelectFile


Func conver()
	;转换目标格式判断
	$CADVersion_ = GUICtrlRead($CobCADVersion)
	If $CADVersion_ = "AutoCAD 2010图形(*.dwg)" Then
		$CAD_Version = "g2010"
	ElseIf $CADVersion_ = "AutoCAD 2007图形(*.dwg)" Then
		$CAD_Version = "g2007"
	ElseIf $CADVersion_ = "AutoCAD 2004图形(*.dwg)" Then
		$CAD_Version = "g2004"
	Else
		$CAD_Version = "g2000"
	EndIf
	;文件检测
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
		;重复文件判断
		$ConverFile = _GUICtrlListView_GetItemText($LvFilelist, $i, 2) & $xiegang & _GUICtrlListView_GetItemText($LvFilelist, $i, 3)
;~ 		$ConverFileList[$i] = $ConverFile
;~ 		Do
;~ 			$CompareResult = StringCompare($ConverFileList[$k], $ConverFile)
;~ 			MsgBox(0, "K:" & $k & "i:" & $i, "对比" & $ConverFileList[$k] & @CRLF & $ConverFile & @CRLF & "jieguo：" & $CompareResult)
;~ 			If $CompareResult = 0 Then
;~ 				$Repeat = 1
;~ 				GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
;~ 				GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xCC9933')
;~ 				_GUICtrlListView_SetItemText($LvFilelist, $i, "列表文件重复", 5)
;~ 				ExitLoop
;~ 			EndIf
;~ 			$k += 1
;~ 		Until $k = $i
		$ConverFileName = _GUICtrlListView_GetItemText($LvFilelist, $i, 3)
		$FileExist = FileExists($ConverFile)
;~ 		MsgBox(0,0,$FileExist&@CRLF&$ConverFile);
		If $FileExist = 1 Then
			;文件输出目录判断
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
					
					;开始转化
					$conver = 1
					Control_Disable()
					_GUICtrlListView_SetItemText($LvFilelist, $i, "正在转化...", 5)
					;文件转换视图列表变化\
					GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFFFFFF')
					GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xfa7906')
					;转换
					$ConverResult = RunWait(@ProgramFilesDir & "\AcmeCADConverter\AcmeCADConverter.exe /r /l /e /" & $CAD_Version & " " & $ConverFile & " " & $FileOutPath)
;~ 					MsgBox(0, $ConverFile, $ConverResult);
					;转化结果判断
					If $ConverResult = 0 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xf6f6f6')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "转换成功", 5)
					ElseIf $ConverResult = 1 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[错误]内存不足", 5)
					ElseIf $ConverResult = 2 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[错误]绘图失败", 5)
					ElseIf $ConverResult = 4 Then
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "[错误]无效文件", 5)
					Else
						GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
						GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xf6f6f6')
						_GUICtrlListView_SetItemText($LvFilelist, $i, "转换成功", 5)
						
					EndIf
				Else
					MsgBox(64 + 8192, "提示", "输出目录填写错误，请重新填写。", 20, $FrmCADConver)
					GUICtrlSetState($IptOutFolder, $GUI_FOCUS)
				EndIf
				FileClose($TempFile)
				FileDelete($FilePathDir & "\Temp.tmp")
			Else
				MsgBox(64 + 8192, "提示", "输出目录填写错误，请重新填写。", 20, $FrmCADConver)
				GUICtrlSetState($IptOutFolder, $GUI_FOCUS)
			EndIf
		Else
			GUICtrlSetColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0x000000')
			GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($LvFilelist, $i), '0xFF3333')
			_GUICtrlListView_SetItemText($LvFilelist, $i, "[错误]文件不存在", 5)
		EndIf
	Next
	$ConverOver = 1
	$conver = 0

	Control_Enable()
	$OutPath = GUICtrlRead($IptOutFolder)
	$OpenDirAsk = MsgBox(64 + 8192 + 4, "提示", "转化完成,是否打开输出目录?" & @CRLF & @CRLF & "'是'则打开,'否'则不打开。", 20, $FrmCADConver)
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

