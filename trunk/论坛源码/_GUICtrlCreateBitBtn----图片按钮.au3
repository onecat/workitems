#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>

Local $hGUI = GUICreate("Funkey's BitBtn-Example", 1060, 270)
Local $IcoPath = StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1)) & "Icons\au3.ico"

$BitBtn1 = _GUICtrlCreateBitBtn("Explorer", 10, 10, 200, 25, "shell32.dll", 5)
$BitBtn2 = _GUICtrlCreateBitBtn("Button2", 10, 40, 200, 35, "shell32.dll", 7)
$BitBtn3 = _GUICtrlCreateBitBtn("Button3", 10, 80, 200, 55, "shell32.dll", 10, 20)
$BitBtn4 = _GUICtrlCreateBitBtn("Button4", 10, 140, 200, 55, $IcoPath, 20)
$BitBtn5 = _GUICtrlCreateBitBtn("Papierkorb", 10, 200, 200, 55, "shell32.dll", 32, 30, 20, 0, 20)

$BitBtn6 = _GUICtrlCreateBitBtn("Explorer", 220, 10, 200, 25, "shell32.dll", 5, -1, 0, 1)
$BitBtn7 = _GUICtrlCreateBitBtn("Button7", 220, 40, 200, 35, "shell32.dll", 7, -1, 0, 1)
$BitBtn8 = _GUICtrlCreateBitBtn("Button8", 220, 80, 200, 55, "shell32.dll", 10, 20, 0, 1)
$BitBtn9 = _GUICtrlCreateBitBtn("Button9", 220, 140, 200, 55, $IcoPath, 20, -1, 0, 1)
$BitBtn10= _GUICtrlCreateBitBtn("Papierkorb", 220, 200, 200, 55, "shell32.dll", 32, 30, 20, 1, 20)

$BitBtn11 = _GUICtrlCreateBitBtn("Explorer", 430, 10, 200, 25, "shell32.dll", 5, -1, 0, 2)
$BitBtn12 = _GUICtrlCreateBitBtn("Button12", 430, 40, 200, 35, "shell32.dll", 7, -1, 0, 2)
$BitBtn13 = _GUICtrlCreateBitBtn(@CR & @CR & "Button13", 430, 80, 200, 55, "shell32.dll", 10, 20, 0, 2)
$BitBtn14 = _GUICtrlCreateBitBtn(@CR & @CR & "Button14", 430, 140, 200, 55, $IcoPath, 20, 30, 0, 2, 10)
$BitBtn15 = _GUICtrlCreateBitBtn(@CR & "Papierkorb", 430, 200, 200, 55, "shell32.dll", 32, 20, 20, 2, 15)

$BitBtn16 = _GUICtrlCreateBitBtn("Explorer", 640, 10, 200, 25, "shell32.dll", 5, -1, 0, 3)
$BitBtn17 = _GUICtrlCreateBitBtn("Button17", 640, 40, 200, 35, "shell32.dll", 7, -1, 0, 3)
$BitBtn18 = _GUICtrlCreateBitBtn("Button18", 640, 80, 200, 55, "shell32.dll", 10, 20, 0, 3, 15)
$BitBtn19 = _GUICtrlCreateBitBtn("Button19", 640, 140, 200, 55, $IcoPath, 20, 35, 0, 3)
$BitBtn20 = _GUICtrlCreateBitBtn("Papierkorb", 640, 200, 200, 55, "shell32.dll", 32, -1, 20, 3, 20)

$BitBtn21 = _GUICtrlCreateBitBtn("", 850, 10, 200, 25, "shell32.dll", 5, -1, 0, 4)
$BitBtn22 = _GUICtrlCreateBitBtn("", 850, 40, 200, 35, "shell32.dll", 7, -1, 0, 4)
$BitBtn23 = _GUICtrlCreateBitBtn("", 850, 80, 200, 55, "shell32.dll", 10, 20, 0, 4)
$BitBtn24 = _GUICtrlCreateBitBtn("", 850, 140, 200, 55, $IcoPath, 20, -1, 0, 4)
$BitBtn25 = _GUICtrlCreateBitBtn("Papierkorb", 850, 200, 200, 55, "shell32.dll", 32, -1, 20, 4, 20)

GUISetState()

Local $msg
While 1
    $msg = GUIGetMsg()
    If $msg = $GUI_EVENT_CLOSE Then Exit
    For $i = 1 To 25
        If $msg = Eval("BitBtn" & $i) Then ConsoleWrite("$BitBtn"&$i& ": " & _BitBtnClick(Eval("BitBtn" & $i)) & @CR)
    Next
    Sleep(10)
WEnd

Func _GUICtrlCreateBitBtn($sText, $iLeft, $iTop, $iWidth, $iHeight, $sImg, $iIndex = 0, $iMaxIconHeight = -1, $iDist = 0, $nAllign = 0, $iFontSize = 8.5, $iFontWeight = Default)
    ;funkey 16.12.2009
    Local $iOffsetX, $iOffsetY, $LabelStyle = 0x201
    Local $a = _GetTextSize("a  a", $iFontSize)
    Local $b = _GetTextSize("aa", $iFontSize)
    Local $SpaceLen = ($a[0] - $b[0]) / 5
    Local $aSize = _GetTextSize($sText, $iFontSize)
    Local $iIconHeight = $iMaxIconHeight
    If $iMaxIconHeight = -1 Or $iMaxIconHeight >  $iHeight - 8 Then
        $iIconHeight = $iHeight - 8
    EndIf
    Local $iSpaces = Ceiling(($iIconHeight + $iDist) / $SpaceLen)
    Switch $nAllign
        Case 0  ;Icon is left
            $iOffsetX = $iWidth / 2 - $aSize[0] / 2 - $iIconHeight / 2 - $iDist / 2
            $iOffsetY = ($iHeight - $iIconHeight) / 2
            $sText = StringFormat("%" & $iSpaces + StringLen($sText) & "s", $sText)
        Case 1  ;Icon is right
            $iOffsetX = $iWidth / 2 + $aSize[0] / 2 - $iIconHeight / 2 + $iDist / 2
            $iOffsetY = ($iHeight - $iIconHeight) / 2
            $sText = StringFormat("%" & -$iSpaces - StringLen($sText) & "s", $sText)
        Case 2  ;Icon is on the top
            $iOffsetX = $iWidth / 2 - $iIconHeight / 2
            $iOffsetY = 4
            $LabelStyle = 0x1
        Case 3  ;Icon is on the bottom
            $iOffsetX = $iWidth / 2 - $iIconHeight / 2
            $iOffsetY = $iHeight - $iIconHeight -4
            $LabelStyle = 0x1
        Case 4 ;Icon is in the middle
            $iOffsetX = $iWidth /2 - $iIconHeight / 2 + $iDist / 2
            $iOffsetY = ($iHeight - $iIconHeight) / 2
    EndSwitch
    Local $hBtn = GUICtrlCreateLabel("", $iLeft, $iTop, $iWidth, $iHeight)
    GUICtrlCreateIcon($sImg, $iIndex, $iLeft + $iOffsetX, $iTop + $iOffsetY, $iIconHeight, $iIconHeight, 0)
    GUICtrlCreateLabel($sText, $iLeft, $iTop, $iWidth, $iHeight, $LabelStyle, 0x200)
    GUICtrlSetBkColor(-1, -2) ; $GUI_BKCOLOR_TRANSPARENT
    GUICtrlSetFont(-1, $iFontSize, $iFontWeight)
    GUICtrlSetState(-1, 32) ;$GUI_HIDE
    GUICtrlCreateLabel($sText, $iLeft, $iTop, $iWidth, $iHeight, $LabelStyle, 0x001)
    GUICtrlSetBkColor(-1, -2) ; $GUI_BKCOLOR_TRANSPARENT
    GUICtrlSetFont(-1, $iFontSize, $iFontWeight)
    Return $hBtn
EndFunc   ;==>_GUICtrlCreateBitBtn

Func _BitBtnClick($IdBtn)
    ;funkey 16.12.2009
    Local $aInfo, $aInfoLast
    GUICtrlSetState($IdBtn + 3, 32) ;$GUI_HIDE
    GUICtrlSetState($IdBtn + 2, 16) ;$GUI_SHOW
    $aInfoLast = GUIGetCursorInfo()
    Do
        Sleep(10)
        $aInfo = GUIGetCursorInfo()
        If @error Then Return 0
        If $aInfo[4] <> $aInfoLast[4] Then ;if changing the hover-control
            If $aInfo[4] < $IdBtn Or $aInfo[4] > $IdBtn + 3 Then ;if not hovering the BitBtn
                GUICtrlSetState($IdBtn + 2, 32) ;$GUI_HIDE
                GUICtrlSetState($IdBtn + 3, 16) ;$GUI_SHOW
            Else
                GUICtrlSetState($IdBtn + 3, 32) ;$GUI_HIDE
                GUICtrlSetState($IdBtn + 2, 16) ;$GUI_SHOW
            EndIf
        EndIf
        $aInfoLast = $aInfo
    Until Not $aInfo[2]
    GUICtrlSetState($IdBtn + 2, 32) ;$GUI_HIDE
    GUICtrlSetState($IdBtn + 3, 16) ;$GUI_SHOW
    If $aInfo[4] <> $IdBtn + 2 And $aInfo[4] <> $IdBtn + 1 Then Return 0
    Return 1
EndFunc   ;==>_BitBtnClick

Func _GetTextSize($nText, $iFontSize = 8.5, $sFont = 'Microsoft Sans Serif', $iFontAttributes = 0)
 ;Author: Bugfix
 ;Modified: funkey
 If $nText = '' Then Return
 _GDIPlus_Startup()
 Local $hFormat = _GDIPlus_StringFormatCreate(0)
 Local $hFamily = _GDIPlus_FontFamilyCreate($sFont)
 Local $hFont = _GDIPlus_FontCreate($hFamily, $iFontSize, $iFontAttributes, 3)
 Local $tLayout = _GDIPlus_RectFCreate(15, 171, 0, 0)
 Local $hGraphic = _GDIPlus_GraphicsCreateFromHWND(0)
 Local $aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, $nText, $hFont, $tLayout, $hFormat)
 Local $iWidth = Ceiling(DllStructGetData($aInfo[0], "Width"))
 Local $iHeight = Ceiling(DllStructGetData($aInfo[0], "Height"))
 _GDIPlus_StringFormatDispose($hFormat)
 _GDIPlus_FontDispose($hFont)
 _GDIPlus_FontFamilyDispose($hFamily)
 _GDIPlus_GraphicsDispose($hGraphic)
 _GDIPlus_Shutdown()
 Local $aSize[2] = [$iWidth, $iHeight]
 Return $aSize
EndFunc   ;==>_GetTextSize
