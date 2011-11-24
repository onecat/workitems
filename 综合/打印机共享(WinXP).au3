#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=E:\工具\综合软件\3D风格ICO图标\limewirexx.ico
#AutoIt3Wrapper_outfile=打印机共享(win7).exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <Process.au3>
#include <WindowsConstants.au3>
#include <WindowsConstants.au3>
$GUI_1 = GUICreate("打印机共享地址", 251, 106, 192, 125)
$Button1 = GUICtrlCreateButton("确定", 50, 58, 150, 35,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$IPAddress1 = _GUICtrlIpAddress_Create($GUI_1, 32, 16, 185, 25)
_GUICtrlIpAddress_Set($IPAddress1, "172.18.6.7")
GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button1
			$T = _GUICtrlIpAddress_Get($IPAddress1)
			$I = "\\"
			$H =$I & $T
			ShellExecute($H )
			GUISetState(@SW_HIDE)
			ExitLoop
			;Exit 
	EndSelect
WEnd
WinWaitActive ("\\172.18.6.7","")
Send("{space}")
Send("{enter}")
WinWaitActive ("连接到打印机","是(&Y)")
If WinExists("连接到打印机","是(&Y)") Then
    ControlClick("连接到打印机","","Button1")
Else
	WinClose("172.18.6.7 上 的 HP LaserJet 1020 正在初始化")
	WinClose("\\172.18.6.7")
    Exit	
EndIf

WinWait("172.18.6.7 上 的 HP LaserJet 1020 正在初始化")
MsgBox("","",1)
WinActivate("172.18.6.7 上 的 HP LaserJet 1020 正在初始化")
Send("!p")
Send("{down}")
Send("{enter}")
WinClose("\\172.18.6.7","")
WinClose("172.18.6.7 上 的 HP LaserJet 1020 正在初始化")