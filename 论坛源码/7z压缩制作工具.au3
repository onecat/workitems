#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\1UTJMZPM\favicon[4].ico
#PRE_Outfile=123.exe
#PRE_UseX64=n
#PRE_Res_requestedExecutionLevel=None
#PRE_Res_File_Add=7za.exe
#PRE_Res_File_Add=7z.dll
#PRE_Run_Tidy=y
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>

Opt("TrayAutoPause", 1)
OnAutoItExitRegister("_OnExit")

FileInstall("7za.exe", @TempDir & "\7za.exe", 1)
FileInstall("7z.dll", @TempDir & "\7z.dll", 1)

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("7z文件压缩工具 By 微风", 615, 301, -1, -1)
$Group1 = GUICtrlCreateGroup("", 8, 8, 601, 281)
$Label1 = GUICtrlCreateLabel("压缩等级：", 24, 24, 60, 17)
$Combo1 = GUICtrlCreateCombo("", 88, 22, 81, 17, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "极限压缩|最大压缩|标准压缩|快速压缩|最快压缩|存储压缩", "极限压缩")
$Label2 = GUICtrlCreateLabel("字典：", 192, 24, 52, 17)
$Combo2 = GUICtrlCreateCombo("", 230, 22, 73, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "64k|1m|2m|3m|4m|6m|8m|12m|16m|24m|32m|48m|64m", "64m")
$Label3 = GUICtrlCreateLabel("单词：", 328, 24, 44, 17)
$Combo3 = GUICtrlCreateCombo("", 376, 22, 65, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "8|12|16|24|32|48|64|96|128|192|256", "64")
$Label4 = GUICtrlCreateLabel("固实数据：", 464, 24, 60, 17)
$Combo4 = GUICtrlCreateCombo("", 526, 22, 73, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0b|1m|2m|4m|8m|16m|32m|48m|64m|128m|256m|512m|1g|2g|4g|8g|12g|16g|32g|64g", "4g")
$ListView1 = GUICtrlCreateListView("", 16, 48, 585, 193, BitOR($GUI_SS_DEFAULT_LISTVIEW, _
		$WS_HSCROLL, $WS_VSCROLL), _
		BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
_GUICtrlListView_AddColumn($ListView1, "路径", 500)
_GUICtrlListView_AddColumn($ListView1, "大小", 65)
$Button1 = GUICtrlCreateButton("添加文件夹", 24, 256, 66, 25)
$Button2 = GUICtrlCreateButton("添加文件", 104, 256, 65, 25)
$Button3 = GUICtrlCreateButton("...", 460, 256, 34, 25)
$Label5 = GUICtrlCreateLabel("保存位置：", 188, 260, 76, 17)
$Input1 = GUICtrlCreateInput("", 250, 258, 201, 21)
GUICtrlSetData(-1, @ScriptDir & "\MyFiles.7z")
$Button4 = GUICtrlCreateButton("开始压缩", 544, 256, 57, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


_Main()
Exit

Func _Main()
	Local $nMsg
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				_SelectDirs()
			Case $Button2
				_SelectFiles()
			Case $Button3
				Local $Path = FileSaveDialog("设置压缩包保存位置", "", "7z压缩包(*.7z)", 2 + 6, "", $Form1)
				If $Path <> "" Then
					If StringRight($Path, 3) <> ".7z" Then
						$Path &= ".7z"
					EndIf
					GUICtrlSetData($Input1, $Path)
				EndIf
			Case $Button4
				If GUICtrlRead($Input1) = "" Then
					MsgBox(16, "错误", "请选择压缩包保存位置！")
				Else
					_Add7z()
				EndIf
				

		EndSwitch
	WEnd
EndFunc   ;==>_Main


Func _SelectDirs()
	Local $a_Dirs = FileSelectFolder("请选择需要压缩的目录", "", "", "所有文件(*.*)", $Form1)
	Local $Size = Round(DirGetSize($a_Dirs) / 1024 / 1024, 2) & "MB"
	
	;MsgBox(0,"",$a_Dirs)
	If $a_Dirs <> "" Then
		_GUICtrlListView_BeginUpdate($ListView1)
		GUICtrlCreateListViewItem($a_Dirs & "|" & $Size, $ListView1)
		_GUICtrlListView_EndUpdate($ListView1)
	EndIf

EndFunc   ;==>_SelectDirs

Func _SelectFiles()
	Local $a_Files = FileOpenDialog("请选择需要压缩的文件", "", "所有文件(*.*)", 1 + 2, "", $Form1)
	Local $f_Size = Round(FileGetSize($a_Files) / 1024 / 1024, 2) & "MB"
	;MsgBox(0, "", $a_Files)
	If $a_Files <> "" Then
		_GUICtrlListView_BeginUpdate($ListView1)
		GUICtrlCreateListViewItem($a_Files & "|" & $f_Size, $ListView1)
		_GUICtrlListView_EndUpdate($ListView1)
	EndIf
EndFunc   ;==>_SelectFiles

Func _Add7z()
	Local $7zzFile = @TempDir & "\7za.exe"
	#CS 	FileInstall ( "7z.dll" , @TEMPDIR & "\7z.dll" , 1 )
		FileInstall("7za.exe",$7zzFile,1)
		If Not (FileExists($7zzFile)) Then
		MsgBox(16,"错误","7az.exe装载失败！")
		Return 0
		EndIf
	#CE

	Local $lv = _Scomo1()
	Local $ZiDian = GUICtrlRead($Combo2)
	Local $DanCi = GUICtrlRead($Combo3)
	Local $GuShi = GUICtrlRead($Combo4)
	Local $7zPkg = GUICtrlRead($Input1)
	Local $a_DFiles = _ReadItem()
	
	If UBound($a_DFiles, 1) - 1 < 1 Then
		MsgBox(0 + 48, "错误", "未添加任何文件夹或文件！")
		Return 0
	Else
		Local $r = MsgBox(1 + 64, "提示", "确定要开始吗？", "", $Form1)
		If $r = 1 Then
			;_ArrayDisplay($a_DFiles)
			If FileExists($7zPkg) Then FileDelete($7zPkg)
			Local $i
			Local $Max = UBound($a_DFiles, 1) - 1
			For $i = 1 To $Max
				Local $cmd = $7zzFile & ' a -t7z ' & $7zPkg & ' "' & $a_DFiles[$i][0] & '" ' & '-mx=' & $lv & ' ' & _
						'-ms=' & $GuShi & ' ' & '-m0=LZMA:d=' & $ZiDian & ':mf=bt4:fb=' & $DanCi
				ClipPut($cmd)
				RunWait(@ComSpec & " /c " & $cmd, @TempDir & "\", @SW_HIDE)
			Next
			MsgBox(64, "完成", "压缩完成！")
			GUICtrlSetData($Input1, "")
			Return 1
		Else
			Return 0
			
		EndIf
	EndIf
	
EndFunc   ;==>_Add7z

Func _ReadItem()
	Local $a_DFiles[1][2], $p = 1
	Local $i
	Local $Max = _GUICtrlListView_GetItemCount($ListView1)
	For $i = 0 To $Max - 1
		ReDim $a_DFiles[$p + 1][2]
		$a_DFiles[$p][0] = _GUICtrlListView_GetItemText($ListView1, $i, 0)
		$a_DFiles[$p][1] = _GUICtrlListView_GetItemText($ListView1, $i, 1)
		$p += 1
		
	Next
	Return $a_DFiles
	
EndFunc   ;==>_ReadItem

Func _Scomo1()
	Local $lvev1 = GUICtrlRead($Combo1)
	Local $lv
	Switch $lvev1
		Case "极限压缩"
			$lv = 9
		Case "最大压缩"
			$lv = 7
		Case "标准压缩"
			$lv = 5
		Case "快速压缩"
			$lv = 3
		Case "最快压缩"
			$lv = 1
		Case "存储压缩"
			$lv = 0
	EndSwitch
	Return $lv
	
EndFunc   ;==>_Scomo1

Func _OnExit()
	GUISetState(@SW_HIDE)
	FileDelete(@TempDir & "\7za.exe")
	FileDelete(@TempDir & "\7z.dll")
EndFunc   ;==>_OnExit
