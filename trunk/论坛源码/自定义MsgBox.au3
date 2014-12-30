#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("奶牛CJX规则", 230, 147, -1, -1)
$Label1 = GUICtrlCreateLabel("网络规则版本号：", 8, 40, 96, 17)
GUICtrlSetColor(-1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("", 128, 40, 88, 17)
;GUICtrlSetData($Label2, WLCJXGZ())
GUICtrlSetColor($Label2, 0x3399FF)
$Label3 = GUICtrlCreateLabel("本地规则版本号：", 8, 72, 100, 17)
GUICtrlSetColor(-1, 0x6633CC)
$Label4 = GUICtrlCreateLabel("", 128, 72, 88, 17)
;GUICtrlSetData($Label4, BDCJXGZ())
GUICtrlSetColor($Label4, 0x9932CC)
$Label5 = GUICtrlCreateLabel("奶牛CJX规则有新版本请及时更新", 24, 8, 179, 17)
GUICtrlSetColor($Label5, 0xFF00FF)
$Button1 = GUICtrlCreateButton("确定", 40, 104, 137, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Exit
	EndSwitch
WEnd
