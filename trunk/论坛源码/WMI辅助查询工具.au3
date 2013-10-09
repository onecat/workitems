#NoTrayIcon
#region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=wmitool.ico
#AutoIt3Wrapper_Res_Comment=WMI�����༭����
#AutoIt3Wrapper_Res_Description=WMI�����༭����
#AutoIt3Wrapper_Res_Fileversion=1.0.0.13
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=CopyRight escortmnm 2010
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>
#include <ComboConstants.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
;=====================��������=================================================
#region ### START Koda GUI section ### Form=WMI������ѯ����.kxf
Global $arrspace[1], $arrclass[1]
Global $alldata
Local $file
If Not FileExists(@ScriptDir & "\setting.ini") Then
	$file = FileOpen(@ScriptDir & "\setting.ini", 2)
	FileWriteLine($file, "[favorite]")
	FileWriteLine($file, "WIN32_Process=root\CIMV2")
	FileWriteLine($file, "CIM_datafile=root\CIMV2")
	FileWriteLine($file, "[default]")
	FileWriteLine($file, "space=root\CIMV2")
	FileWriteLine($file, "class=WIN32_Process")
	FileClose($file)
EndIf
$defaultspace = IniRead(@ScriptDir & "\setting.ini", "default", "space", "root\CIMV2")
$defaultclass = IniRead(@ScriptDir & "\setting.ini", "default", "class", "WIN32_Process")
;=========================��ʼ����ʼ==============================================
FileInstall("wmi.bmp", @TempDir & "\wmi.bmp", 1)
$destination = @TempDir & "\wmi.bmp"
SplashImageOn("Splash Screen", $destination, 240, 180, -1, -1, 1) ;ʹ���ޱ���ϸ�߿�
Global $wintitle = "WMI������ѯ����2010 Beta2-http://hi.baidu.com/escortmnm"
Global $Form1 = GUICreate($wintitle, 629, 543, -1, -1)
GUISetIcon("C:\Data\icon\Messages.ico", -1)
GUISetFont(9, 400, 0, "΢���ź�")
Global $Combo1 = GUICtrlCreateCombo($defaultspace, 76, 16, 97, 25, BitOR($GUI_SS_DEFAULT_COMBO, $WS_HSCROLL))
Global $Combo2 = GUICtrlCreateCombo($defaultclass, 198, 16, 250, 25, BitOR($GUI_SS_DEFAULT_COMBO, $WS_HSCROLL))
Global $Combo3 = GUICtrlCreateCombo($defaultclass, 489, 16, 121, 25, BitOR($GUI_SS_DEFAULT_COMBO, $WS_HSCROLL))
Global $Label1 = GUICtrlCreateLabel("�����ռ�:", 16, 16, 59, 23)
GUICtrlSetFont(-1, 10, 400, 0, "΢���ź�")
Global $Label2 = GUICtrlCreateLabel("��:", 176, 16, 20, 23)
GUICtrlSetFont(-1, 10, 400, 0, "΢���ź�")
Global $Label3 = GUICtrlCreateLabel("����:", 453, 16, 33, 23)
GUICtrlSetFont(-1, 10, 400, 0, "΢���ź�")
Global $Label4 = GUICtrlCreateLabel("����:", 16, 48, 31, 21)
Global $Label5 = GUICtrlCreateLabel("����:", 16, 272, 31, 21)
Global $ListView1 = GUICtrlCreateListView("���|����|����", 16, 72, 593, 193, BitOR($LVS_REPORT, $LVS_EDITLABELS, $LVS_SHOWSELALWAYS), BitOR($LVS_EX_FULLROWSELECT, $WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
Global $ListView2 = GUICtrlCreateListView("���|����|����", 16, 296, 593, 209, BitOR($LVS_REPORT, $LVS_EDITLABELS, $LVS_SHOWSELALWAYS), BitOR($LVS_EX_FULLROWSELECT, $WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
Global $StatusBar1 = _GUICtrlStatusBar_Create($Form1)
#endregion ### END Koda GUI section ###
;==========�ض����ʽ==================================
_GUICtrlListView_SetExtendedListViewStyle($ListView1, BitOR($LVS_EX_SUBITEMIMAGES, $LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_ONECLICKACTIVATE), 0)
_GUICtrlListView_SetExtendedListViewStyle($ListView2, BitOR($LVS_EX_SUBITEMIMAGES, $LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_ONECLICKACTIVATE), 0)
;==========�ض����ʽ���==============================
;==========�ض�����==================================
_GUICtrlListView_SetColumn($ListView1, 0, "���", 40)
_GUICtrlListView_SetColumn($ListView1, 1, "����", 150)
_GUICtrlListView_SetColumn($ListView1, 2, "����", 375)
_GUICtrlListView_SetColumn($ListView2, 0, "���", 40)
_GUICtrlListView_SetColumn($ListView2, 1, "����", 150)
_GUICtrlListView_SetColumn($ListView2, 2, "����", 375)
;==========�ض��������==============================
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
space()
class("root\CIMV2")
favorite(-1)
describe($defaultspace, $defaultclass)
SplashOff()
GUISetState(@SW_SHOW)
;=======================��ʼ������====================================================



;=====================================================================================
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Combo1
			class(GUICtrlRead($Combo1))
		Case $Combo2
			describe(GUICtrlRead($Combo1), GUICtrlRead($Combo2))
		Case $Combo3
			favorite(GUICtrlRead($Combo3))
	EndSwitch
WEnd
;=====================================================================================

;=================================��������============================================
Func space();�������ռ����һ��������
	Local $i, $j
	Local $objServices, $colNameSpaces, $objNameSpace
	Local $temp
	$i = 1
	$objServices = ObjGet("winmgmts:\\.\root")
	$colNameSpaces = $objServices.InstancesOf("__NAMESPACE")
	For $objNameSpace In $colNameSpaces
		ReDim $arrspace[$i]
		$arrspace[$i - 1] = "root\" & $objNameSpace.name
		$i = $i + 1
	Next
	For $i = 0 To UBound($arrspace) - 1
		$temp = $temp & $arrspace[$i] & "|"
	Next
	GUICtrlSetData($Combo1, "|", $defaultspace)
	GUICtrlSetData($Combo1, $temp, $defaultspace)
EndFunc   ;==>space
;=====================================================================================


;=====================================================================================
Func class($strclass);��ָ�������ռ��µ������һ��������
	Local $i, $j, $k, $t
	Local $temp
	Local $objService, $objClasses, $objClass
	$i = 1
	$objService = ObjGet("winmgmts:\\.\" & $strclass)
	$objClasses = $objService.SubclassesOf()
	For $objClass In $objClasses
		$data = $objClass.Path_.Path
		$data = StringMid($data, StringInStr($data, ":") + 1)
		ReDim $arrclass[$i]
		$arrclass[$i - 1] = $data
		$i = $i + 1
	Next
	For $j = 0 To UBound($arrclass) - 1
		For $k = $j To UBound($arrclass) - 1
			If $arrclass[$j] > $arrclass[$k] Then
				$t = $arrclass[$j]
				$arrclass[$j] = $arrclass[$k]
				$arrclass[$k] = $t
			EndIf
		Next
	Next
	For $i = 0 To UBound($arrclass) - 1
		$temp = $temp & $arrclass[$i] & "|"
	Next
	GUICtrlSetData($Combo2, "", $defaultclass)
	GUICtrlSetData($Combo2, $temp, $defaultclass)
EndFunc   ;==>class
;=====================================================================================

;=====================================================================================
Func describe($space, $class)
	Local $objService, $objClass
	Local $texttype, $k, $data, $i = 1
	$objService = ObjGet("winmgmts:\\.\" & $space)
	$objClass = $objService.Get($class, 0x20000)
	$alldata = $objClass.GetObjectText_;����������������
	_GUICtrlListView_DeleteAllItems($ListView1);��������б�
	$objClass = ObjGet("winmgmts:\\.\" & $space & ":" & $class)
	$texttype = "����"
	For $objProperty In $objClass.Properties_
		$data = showlist($objProperty.name, $texttype)
		GUICtrlCreateListViewItem($i & "|" & $objProperty.name & "|" & $data, $ListView1)
		$i = $i + 1
	Next
	_GUICtrlListView_DeleteAllItems($ListView2);��շ����б�
	$i = 1
	$objClass = ObjGet("winmgmts:\\.\" & $space & ":" & $class)
	$texttype = "����"
	For $objMethod In $objClass.Methods_
		$data = showlist($objMethod.name, $texttype)
		GUICtrlCreateListViewItem($i & "|" & $objMethod.name & "|" & $data, $ListView2)
		$i = $i + 1
	Next
	status($space, $class);��ʾ״̬��Ϣ�ĺ���
EndFunc   ;==>describe
;=====================================================================================

;=====================================================================================
Func showlist($Property, ByRef $texttype)
	Local $arralldata, $i, $k1, $k2, $k3
	Local $data = ""
	$arralldata = StringSplit($alldata, @LF)
	For $i = 1 To UBound($arralldata) - 1
		$k1 = StringInStr($arralldata[$i], $Property)
		$k2 = StringInStr($arralldata[$i], "Description(""")
		If $k1 <> 0 And $k2 <> 0 Then
			$data = StringMid($arralldata[$i], $k2 + 13)
			$k3 = StringInStr($data, """):")
			$data = StringLeft($data, $k3 - 1)
			If StringLeft($data, StringLen($Property)) = $Property Then
				$data = StringMid($data, StringLen($Property) + 2);��ͷ��β
			EndIf
		EndIf
	Next
	Return $data
EndFunc   ;==>showlist
;=====================================================================================

;=====================================================================================
Func favorite($key)
	Local $flist, $data, $content
	If $key = -1 Then;��ʼ��
		$flist = IniReadSection(@ScriptDir & "\setting.ini", "favorite")
		If @error Then
			GUICtrlSetData($Combo3, "|", $defaultclass)
			GUICtrlSetData($Combo3, $defaultclass, $defaultclass)
			;describe($defaultspace,$defaultclass)
		Else
			For $i = 1 To $flist[0][0]
				$data = $data & $flist[$i][0] & "|"
			Next
			GUICtrlSetData($Combo3, "|", $defaultclass)
			GUICtrlSetData($Combo3, $data, $defaultclass)
		EndIf
	Else;ʹ����
		$content = IniRead(@ScriptDir & "\setting.ini", "favorite", $key, -1)
		describe($content, $key)
	EndIf;����
EndFunc   ;==>favorite
;=====================================================================================

;=====================================================================================
Func ListView_Click($list)
	Local $d, $item, $winpos, $xpos, $ypos, $data, $data_len
	$d = _GUICtrlListView_GetSelectedIndices($list)
	$item = _GUICtrlListView_GetItemTextArray($list, $d - 0)
	ClipPut($item[2])
	$mousepos = MouseGetPos()
	$winpos = WinGetPos($wintitle)
	$xpos = $winpos[0]
	$ypos = $mousepos[1]
	$data_len = 10
	$data_part = StringLen($item[2]) / $data_len
	For $i = 0 To $data_part
		$data &= StringMid($item[2], $i * $data_len + 1, $data_len) & @CRLF
	Next
	ToolTip($item[3], $xpos, $ypos + 10, $data)
	$xpos = $mousepos[0]
	While $xpos - MouseGetPos(0) < 10 And $ypos - MouseGetPos(1) < 10
		Sleep(100)
	WEnd
	ToolTip("")
EndFunc   ;==>ListView_Click
;=====================================================================================

;=====================================================================================
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iCode, $tNMHDR, $tInfo
	$hWndListView1 = HWnd(GUICtrlGetHandle($ListView1))
	$hWndListView2 = HWnd(GUICtrlGetHandle($ListView2))
	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView1
			Switch $iCode
				Case $NM_CLICK
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					ListView_Click($ListView1)
			EndSwitch
		Case $hWndListView2
			Switch $iCode
				Case $NM_CLICK
					ListView_Click($ListView2)
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func status($strspace, $strcalss)
	_GUICtrlStatusBar_SetText($StatusBar1, "�����ռ䣺" & $strspace & "   ��ǰ�ࣺ" & $strcalss & @TAB & @TAB & "WMI������ѯ����")
EndFunc   ;==>status