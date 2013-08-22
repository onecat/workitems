
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <GUIListView.au3>
#include <GUIConstants.au3>
#include <GUIImageList.au3>


Const $tagMEASURE_ITEM = "int CtlType;int CtlId;int ItemId;int ItemWidth;int ItemHeight;ulong_ptr ItemData"
Const $tagDRAW_ITEM = "uint CtlType;uint CtlId;uint ItemId;uint ItemAction;uint ItemState;hWnd HWndItem;hWnd hDC;long Left;long Top;long Right;long Bottom;ptr ItemData"

Const $tagCOLOR_THEME = "long DefTextClr;long SelTextClr;long DefBkgClr1;long DefBkgClr2;long SelBkgClr1;long SelBkgClr2;ptr Reserved"
Const $tagITEM_DATA = "ptr ClrTheme;ptr MinorText;ptr UserData;dword Reserved"

Const $LV_DEF_TEXT_CLR = 0
Const $LV_SEL_TEXT_CLR = 0xFFFFFF
Const $LV_DEF_BKG_CLR1 = 0xFFFFFF
Const $LV_DEF_BKG_CLR2 = $LV_DEF_BKG_CLR1

Const $LV_SEL_BKG_CLR1 = 0x7394E1
Const $LV_SEL_BKG_CLR2 = $LV_SEL_BKG_CLR1
Const $LV_DEF_CLR = _CreateClrTheme(0, 0xFFFFFF)

Global $HEIGHT

GUIRegisterMsg($WM_MEASUREITEM, "WM_MEASUREITEM")

$hGUI = GUICreate("Test", 410, 310)
GUISetBkColor(0xFFFFFF)

$hMajorFont = _GetMajorFont()
$hMinorFont = _GetMinorFont()

$hImage = _GUIImageList_Create(16, 16, 5, 3)
_GUIImageList_AddIcon($hImage, "Shell32.dll", 130)
_GUIImageList_AddIcon($hImage, "Shell32.dll", 170)
_GUIImageList_AddIcon($hImage, "Shell32.dll", 176)
_GUIImageList_AddIcon($hImage, "Shell32.dll", 179)

$iStyle = BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $LVS_SINGLESEL, $LVS_NOCOLUMNHEADER, $LVS_OWNERDRAWFIXED)

$hView = _GUICtrlListView_Create($hGUI, "Test", 5, 5, 400, 340, $iStyle)
_GUICtrlListView_SetColumnWidth($hView, 0, 394)
_GUICtrlListView_SetImageList($hView, $hImage, 0)

_AddItem($hView, "ListView Demo", "This is a standard ListView control.", $LV_DEF_CLR, 0)
_AddItem($hView, "This is major text.", "This is minor text.", $LV_DEF_CLR, 1)
_AddItem($hView, "This item has only major text.", "", $LV_DEF_CLR, 2)
_AddItem($hView, "", "This item has only minor text.", $LV_DEF_CLR, 3)

$hBrush = _WinAPI_GetStockObject(5)

GUIRegisterMsg($WM_DRAWITEM, "WM_DRAWITEM")
GUISetState()
While GUIGetMsg() <> -3
WEnd
_WinAPI_DeleteObject($hBrush)
GUIDelete($hGUI)

Func WM_DRAWITEM($hWnd, $iMsg, $iwParam, $ilParam)
	Local $tDraw = DllStructCreate($tagDRAW_ITEM, $ilParam)
	Local $hDC = DllStructGetData($tDraw, "hDC")
	Local $iState = DllStructGetData($tDraw, "ItemState")
	Local $iItem = DllStructGetData($tDraw, "ItemId")

	Local $tItem = DllStructCreate($tagITEM_DATA, DllStructGetData($tDraw, "ItemData"))
	Local $tClrTheme = DllStructCreate($tagCOLOR_THEME, DllStructGetData($tItem, "ClrTheme"))
	Local $tRect = DllStructCreate($tagRECT, DllStructGetPtr($tDraw, "Left"))

	If BitAND($iState, 1) Then
		_GradientFill($hDC, _
				DllStructGetData($tClrTheme, "SelBkgClr1"), _
				DllStructGetData($tClrTheme, "SelBkgClr2"), _
				$tRect)

		_WinAPI_SetTextColor($hDC, DllStructGetData($tClrTheme, "SelTextClr"))

		Local $hPen = _WinAPI_CreatePen(6, 2, DllStructGetData($tClrTheme, "DefTextClr"))

		_WinAPI_SelectObject($hDC, $hPen)
		_WinAPI_SelectObject($hDC, $hBrush)
		_Rectangle($hDC, $tRect)
		_WinAPI_DeleteObject($hPen)
	Else
		_GradientFill($hDC, _
				DllStructGetData($tClrTheme, "DefBkgClr1"), _
				DllStructGetData($tClrTheme, "DefBkgClr2"), _
				$tRect)
		_WinAPI_SetTextColor($hDC, DllStructGetData($tClrTheme, "DefTextClr"))
	EndIf
	_WinAPI_SetBkMode($hDC, $TRANSPARENT)

	Local $iMajorX, $iMajorY, $iMajorW, $iMajorH
	Local $iMinorX, $iMinorY, $iMinorW, $iMinorH
	Local $hImage, $iIcon, $iImageX, $iImageY, $iIcon

	$hImage = _GUICtrlListView_GetImageList($hView, 0)
	$iIcon = _GUICtrlListView_GetItemImage($hView, $iItem)

	If $hImage Then
		$iImageX = 15
		$iImageY = DllStructGetData($tRect, "Top") + Int($HEIGHT - _GUIImageList_GetIconHeight($hImage)) / 2

		_GUIImageList_Draw($hImage, $iIcon, $hDC, $iImageX, $iImageY, 1)
		$iMajorX += $iImageX + _GUIImageList_GetIconWidth($hImage) + 15
		$iMinorX += $iMajorX
	Else
		$iMajorX = 10
		$iMinorX = $iMajorX
	EndIf

	Local $pMinor, $sMinor, $sMajor
	
	$pMinor = DllStructGetData($tItem, "MinorText")
	$sMajor = _GUICtrlListView_GetItemText($hView, $iItem)

	$iMajorW = _GetStringPixels($hDC, $hMajorFont, $sMajor)
	$iMajorH = @extended

	If $pMinor Then
		$iMajorY = DllStructGetData($tRect, "Top") + 15
	Else
		$iMajorY = DllStructGetData($tRect, "Top") + ($HEIGHT - $iMajorH) / 2
	EndIf
	
	Local $tMajorRect = DllStructCreate($tagRECT)
	DllStructSetData($tMajorRect, "Left", $iMajorX)
	DllStructSetData($tMajorRect, "Top", $iMajorY)
	DllStructSetData($tMajorRect, "Right", $iMajorX + $iMajorW)
	DllStructSetData($tMajorRect, "Bottom", $iMajorY + $iMajorH)

	_WinAPI_SelectObject($hDC, $hMajorFont)
	_WinAPI_DrawText($hDC, $sMajor, $tMajorRect, 0)

	If $pMinor = 0 Then Return

	Local $tMinor = DllStructCreate("wchar Text[2048]", $pMinor)
	$sMinor = DllStructGetData($tMinor, "Text")

	$iMinorW = _GetStringPixels($hDC, $hMinorFont, $sMinor)
	$iMinorH = @extended

	If $sMajor Then
		$iMinorY = $iMajorY + $iMajorH + 5
	Else
		$iMinorY = DllStructGetData($tRect, "Top") + ($HEIGHT - $iMinorH) / 2
	EndIf

	Local $tMinorRect = DllStructCreate($tagRECT)
	DllStructSetData($tMinorRect, "Left", $iMinorX)
	DllStructSetData($tMinorRect, "Right", $iMinorX + $iMinorW)
	DllStructSetData($tMinorRect, "Top", $iMinorY)
	DllStructSetData($tMinorRect, "Bottom", $iMinorY + $iMinorH)

	_WinAPI_SelectObject($hDC, $hMinorFont)
	_WinAPI_DrawText($hDC, $sMinor, $tMinorRect, 0)
EndFunc   ;==>WM_DRAWITEM

Func _Rectangle($hDC, $tRect)
	Local $iResult
	$iResult = DllCall("Gdi32.dll", "bool", "Rectangle", "hwnd", $hDC, _
			"int", DllStructGetData($tRect, 1), _
			"int", DllStructGetData($tRect, 2), _
			"int", DllStructGetData($tRect, 3), _
			"int", DllStructGetData($tRect, 4))

	Return $iResult[0]
EndFunc   ;==>_Rectangle

Func _GradientFill($hDC, $iStartClr, $iEndClr, $tRect)
	Local $iResult, $tGrad, $tVert, $tRect1

	$tRect1 = DllStructCreate($tagRECT, DllStructGetPtr($tRect))

	$tGrad = DllStructCreate("long;long;long;long")
	DllStructSetData($tGrad, 1, 0)
	DllStructSetData($tGrad, 2, 1)
	DllStructSetData($tGrad, 3, 2)
	DllStructSetData($tGrad, 4, 1)

	$tVert = DllStructCreate("long[2];word[4];long[2];word[4];long[2];word[4]")

	DllStructSetData($tVert, 1, DllStructGetData($tRect1, 1), 1)
	DllStructSetData($tVert, 1, DllStructGetData($tRect1, 2), 2)
	DllStructSetData($tVert, 2, _ConvertColor($iStartClr, 1), 1)
	DllStructSetData($tVert, 2, _ConvertColor($iStartClr, 2), 2)
	DllStructSetData($tVert, 2, _ConvertColor($iStartClr, 3), 3)

	DllStructSetData($tVert, 3, Int(DllStructGetData($tRect1, 3) / 6.6), 1)
	DllStructSetData($tVert, 3, DllStructGetData($tRect1, 4), 2)
	DllStructSetData($tVert, 4, _ConvertColor($iEndClr, 1), 1)
	DllStructSetData($tVert, 4, _ConvertColor($iEndClr, 2), 2)
	DllStructSetData($tVert, 4, _ConvertColor($iEndClr, 3), 3)

	DllStructSetData($tVert, 5, DllStructGetData($tRect1, 3), 1)
	DllStructSetData($tVert, 5, DllStructGetData($tRect1, 2), 2)
	DllStructSetData($tVert, 6, _ConvertColor($iStartClr, 1), 1)
	DllStructSetData($tVert, 6, _ConvertColor($iStartClr, 2), 2)
	DllStructSetData($tVert, 6, _ConvertColor($iStartClr, 3), 3)

	$iResult = DllCall("Msimg32.dll", "bool", "GradientFill", "hwnd", $hDC, _
			"ptr", DllStructGetPtr($tVert), _
			"ulong", 3, _
			"ptr", DllStructGetPtr($tGrad), _
			"ulong", 2, _
			"ulong", 0)
	Return $iResult[0]
EndFunc   ;==>_GradientFill

Func _ConvertColor($iColor, $iMode)
	Local $iClr

	Switch $iMode
		Case 1
			$iClr = BitShift($iColor, 16)
		Case 2
			$iClr = BitShift(BitAND($iColor, 0xFF00), 8)
		Case 3
			$iClr = BitAND($iColor, 0xFF)
	EndSwitch

	Return BitShift(BitAND($iClr, 0xFFFF), -8)
EndFunc   ;==>_ConvertColor

Func WM_MEASUREITEM($hWnd, $iMsg, $iwParam, $ilParam)
	Local $tBuffer = DllStructCreate($tagMEASURE_ITEM, $ilParam)

	Local $hDC = _WinAPI_GetDC($hWnd)
	Local $iHeight

	_GetStringPixels($hDC, $hMajorFont, "Major")
	$iHeight += @extended + 20

	_GetStringPixels($hDC, $hMinorFont, "Minor")
	$iHeight += @extended + 20

	DllStructSetData($tBuffer, "ItemHeight", $iHeight)
	_WinAPI_ReleaseDC($hWnd, $hDC)

	$HEIGHT = $iHeight

	Return 1
EndFunc   ;==>WM_MEASUREITEM

Func _GetStringPixels($hDC, $hFont, $sText)
	Local $hFont1, $tSize, $iWidth, $iHeight

	$hFont1 = _WinAPI_SelectObject($hDC, $hFont)
	$tSize = _WinAPI_GetTextExtentPoint32($hDC, $sText)
	$iWidth = DllStructGetData($tSize, "X")
	$iHeight = DllStructGetData($tSize, "Y")

	_WinAPI_SelectObject($hDC, $hFont1)
	Return SetExtended($iHeight, $iWidth)

EndFunc   ;==>_GetStringPixels

Func _AddItem($hWnd, $sText, $sMinorText = "", $pClrTheme = $LV_DEF_CLR, $iImage = -1, $pUserData = 0)

	Local $pItem, $iItem

	$pItem = _CreateItemData($sMinorText, $pClrTheme, $pUserData)
	$iItem = _GUICtrlListView_AddItem($hWnd, $sText, $iImage, $pItem)

	Return $iItem
EndFunc   ;==>_AddItem

Func _CreateItemData($sMinorText = "", $pClrTheme = $LV_DEF_CLR, $pUserData = 0)
	Local $pItem, $tItem, $tBuffer, $iLen

	$pItem = _MemGlobalAlloc(18 + StringLen($sMinorText) * 2, 0x40)
	$tItem = DllStructCreate($tagITEM_DATA, $pItem)

	DllStructSetData($tItem, "ClrTheme", $pClrTheme)
	DllStructSetData($tItem, "UserData", $pUserData)

	If $sMinorText Then
		$iLen = StringLen($sMinorText) + 1
		$tBuffer = DllStructCreate("wchar Text[" & $iLen & "]", $pItem + 16)

		DllStructSetData($tItem, "MinorText", $pItem + 16)
		DllStructSetData($tBuffer, "Text", $sMinorText)
	EndIf

	Return $pItem
EndFunc   ;==>_CreateItemData

Func _CreateClrTheme($iDefTextClr = Default, $iSelTextClr = Default, _
		$iDefBkgClr1 = Default, $iDefBkgClr2 = Default, _
		$iSelBkgClr1 = Default, $iSelBkgClr2 = Default)

	Local $pClrTheme, $tClrTheme

	If IsKeyword($iDefTextClr) Then $iDefTextClr = $LV_DEF_TEXT_CLR
	If IsKeyword($iSelTextClr) Then $iSelTextClr = $LV_SEL_TEXT_CLR

	If IsKeyword($iDefBkgClr1) Then $iDefBkgClr1 = $LV_DEF_BKG_CLR1
	If IsKeyword($iDefBkgClr2) Then $iDefBkgClr2 = $LV_DEF_BKG_CLR2

	If IsKeyword($iSelBkgClr1) Then $iSelBkgClr1 = $LV_SEL_BKG_CLR1
	If IsKeyword($iSelBkgClr2) Then $iSelBkgClr2 = $LV_SEL_BKG_CLR2

	$pClrTheme = _MemGlobalAlloc(28, 0x40)
	$tClrTheme = DllStructCreate($tagCOLOR_THEME, $pClrTheme)

	DllStructSetData($tClrTheme, "DefTextClr", $iDefTextClr)
	DllStructSetData($tClrTheme, "SelTextClr", $iSelTextClr)
	DllStructSetData($tClrTheme, "DefBkgClr1", $iDefBkgClr1)
	DllStructSetData($tClrTheme, "DefBkgClr2", $iDefBkgClr2)
	
	DllStructSetData($tClrTheme, "SelBkgClr1", $iSelBkgClr1)
	DllStructSetData($tClrTheme, "SelBkgClr2", $iSelBkgClr2)

	Return $pClrTheme
EndFunc   ;==>_CreateClrTheme

Func _GetMajorFont()
	Local Static $hFont

	If $hFont Then Return $hFont

	GUICtrlCreateLabel("Major font", 5, 5, 100, 20)
	GUICtrlSetFont(-1, 11, 800, 0, "Tahoma")
	GUICtrlSetState(-1, $GUI_HIDE)

	$hFont = _SendMessage(GUICtrlGetHandle(-1), $WM_GETFONT)
	Return $hFont
EndFunc   ;==>_GetMajorFont

Func _GetMajorHoverFont()
	Local Static $hFont

	If $hFont Then Return $hFont

	GUICtrlCreateLabel("Major font", 5, 5, 100, 20)
	GUICtrlSetFont(-1, 11, 800, 4, "Tahoma")
	GUICtrlSetState(-1, $GUI_HIDE)

	$hFont = _SendMessage(GUICtrlGetHandle(-1), $WM_GETFONT)
	Return $hFont
EndFunc   ;==>_GetMajorHoverFont

Func _GetMinorFont()
	Local Static $hFont

	If $hFont Then Return $hFont

	GUICtrlCreateLabel("Major font", 5, 5, 100, 20)
	GUICtrlSetFont(-1, 8.8, 400, 0, "Tahoma")
	GUICtrlSetState(-1, $GUI_HIDE)

	$hFont = _SendMessage(GUICtrlGetHandle(-1), $WM_GETFONT)
	Return $hFont
EndFunc   ;==>_GetMinorFont





































