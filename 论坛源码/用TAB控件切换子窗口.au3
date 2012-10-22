#include <GuiTab.au3>
#include <WindowsConstants.au3>
Local $iWidth = 640, $iHeight = 480
Local $aItem[2][2]
$hForm = GUICreate("tab", $iWidth, $iHeight)
$hTab = GUICtrlCreateTab(1, 1, $iWidth-2, 22)
$aItem[0][0] = GUICtrlCreateTabItem("窗口1")
$aItem[1][0] = GUICtrlCreateTabItem("窗口2")
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW, $hForm)

$aItem[0][1] = GUICreate("子窗口1", $iWidth - 4, $iHeight - 24, 2, 24, 0x80000000, 0x00000040 + 0x00000010, $hForm)
GUISetBkColor(0xFF7788)
GUICtrlCreateLabel("我是子窗口1",30,40)
GUISetState(@SW_HIDE)

$aItem[1][1] = GUICreate("子窗口2", $iWidth - 4, $iHeight - 24, 2, 24, 0x80000000, 0x00000040 + 0x00000010, $hForm)
GUISetBkColor(0x77FF88)
GUICtrlCreateLabel("我是子窗口2",30,40)
GUISetState(@SW_HIDE)

GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
_GUICtrlTab_ClickTab($hTab, $aItem[0][0])

Do
Until GUIGetMsg()=-3

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $iIDFrom
		Case $hTab
			If $iCode = $NM_CLICK Then
				_ChildSwitch(Int(_GUICtrlTab_GetCurSel($hTab)))
			EndIf
	EndSwitch
EndFunc   ;==>WM_NOTIFY

Func _ChildSwitch($iActTab)
	For $i = 0 To UBound($aItem) - 1
		If $i = $iActTab Then
			GUISetState(@SW_SHOW, $aItem[$i][1])
		Else
			GUISetState(@SW_HIDE, $aItem[$i][1])
		EndIf
	Next
EndFunc