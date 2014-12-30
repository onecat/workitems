#NoTrayIcon
#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\WINDOWS\system32\SHELL32.dll|-222
#PRE_UseUpx=n
#PRE_Res_Comment=系统及计算机信息读取工具 By：1cvvvv IT天空专用公测版 Beta2
#PRE_Res_Description=系统及计算机信息读取工具 By：1cvvvv IT天空专用公测版 Beta2
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_LegalCopyright=By:1cvvvv
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
If $CmdLine[0] = 1 Or $CmdLine[0] = 2 Then
	If $CmdLine[1] = "/SC" Then
		FileDelete(@HomeDrive&"\info.txt")
		RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
		$Info=FileRead(@HomeDrive&"\info.txt")
		FileDelete(@HomeDrive&"\info.txt")
		ClipPut($Info)
		Exit
	ElseIf $CmdLine[1] = "/SF" Then
		If $CmdLine[2] = "FileSave" Then
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			$Info=FileRead(@HomeDrive&"\info.txt")
			FileDelete(@HomeDrive&"\info.txt")
			$Data = FileSaveDialog("保存系统信息",@DesktopDir&"\","文本文件(*.txt)",16)
			If StringRight($Data,4) = ".txt" Then
			Else
				$Data=$Data&".txt"
			EndIf
			FileDelete($Data)
			FileWrite($Data,$Info)
			Exit
		Else
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			$Info=FileRead(@HomeDrive&"\info.txt")
			FileDelete(@HomeDrive&"\info.txt")
			$Data = $CmdLine[2]
			FileDelete($Data)
			FileWrite($Data,$Info)
			Exit
		EndIf
	Else
		MsgBox(0,"参数说明","参数说明"&@CRLF&"/SC 静默读取信息并复制到剪贴板"&@CRLF&"/SF FileSave 静默读取信息并弹出窗口询问存放路径。"&@CRLF&"/SF [路径] 静默读取信息并存储到指定路径。（若路径包含空格请在路径两旁加引号）。"&@CRLF&"By:1cvvvv")
		Exit
	EndIf
EndIf
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("系统及计算机信息读取工具 By：1cvvvv IT天空专用公测版", 393, 345)
$Button1 = GUICtrlCreateButton("刷新", 0, 0, 49, 25)
$Button2 = GUICtrlCreateButton("保存到文件", 48, 0, 75, 25)
$Button3 = GUICtrlCreateButton("复制到剪贴版", 122, 0, 75, 25)
$Edit1 = GUICtrlCreateEdit("", 0, 26, 391, 297)
$Label1 = GUICtrlCreateLabel("若有Bug请反馈到本人邮箱：2117879346@qq.com谢谢配合。", 0, 324, 321, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$Label2 = GUICtrlCreateLabel("正在获取信息，请稍候。", 236, 4, 136, 17)
FileDelete(@HomeDrive&"\info.txt")
RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
GUICtrlSetData($Edit1,FileRead(@HomeDrive&"\info.txt"))
FileDelete(@HomeDrive&"\info.txt")
GUICtrlDelete($Label2)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			$Label2 = GUICtrlCreateLabel("正在获取信息，请稍候。", 236, 4, 136, 17)
			FileDelete(@HomeDrive&"\info.txt")
			RunWait("cmd /c systeminfo >"&@HomeDrive&"\info.txt",@SystemDir&"\",@SW_HIDE)
			GUICtrlSetData($Edit1,FileRead(@HomeDrive&"\info.txt"))
			FileDelete(@HomeDrive&"\info.txt")
			GUICtrlDelete($Label2)
		Case $Button2
			$Data = FileSaveDialog("保存系统信息",@DesktopDir&"\","文本文件(*.txt)",16)
			If StringRight($Data,4) = ".txt" Then
			Else
				$Data=$Data&".txt"
			EndIf
			FileDelete($Data)
			FileWrite($Data,GUICtrlRead($Edit1))
		Case $Button3
			ClipPut(GUICtrlRead($Edit1))
			MsgBox(64,"复制到剪贴板","已复制到剪贴板。")
	EndSwitch
WEnd
