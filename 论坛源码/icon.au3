#Include <Constants.au3>
#Include <GDIPlus.au3>
#Include <WinAPI.au3>
#Include <WindowsConstants.au3>
Global Const $__STM_SETIMAGE = 0x0172
Global Const $__STM_GETIMAGE = 0x0173
Global Const $__SS_BITMAP = 0x0E
Global Const $__SS_ICON = 0x03


Func _SetImage($hWnd, $sImage, $hOverlap = 0)

	$hWnd = _Icons_Control_CheckHandle($hWnd)
	If $hWnd = 0 Then
		Return SetError(1, 0, 0)
	EndIf

	Local $Result, $hImage, $hBitmap, $hFit

	_GDIPlus_Startup()

	$hImage = _GDIPlus_BitmapCreateFromFile($sImage)
	$hFit = _Icons_Control_FitTo($hWnd, $hImage)
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hFit)

	_GDIPlus_ImageDispose($hFit)
	_GDIPlus_Shutdown()

	If Not ($hOverlap < 0) Then
		$hOverlap = _Icons_Control_CheckHandle($hOverlap)
	EndIf
	$Result = _Icons_Control_SetImage($hWnd, $hBitmap, $IMAGE_BITMAP, $hOverlap)
	If $Result Then
		$hImage = _SendMessage($hWnd, $__STM_GETIMAGE, $IMAGE_BITMAP, 0)
		If (@error) Or ($hBitmap = $hImage) Then
			$hBitmap = 0
		EndIf
	EndIf
	If $hBitmap Then
		_WinAPI_DeleteObject($hBitmap)
	EndIf
	Return SetError(1 - $Result, 0, $Result)
EndFunc   ;==>_SetImage

Func _Icons_Control_CheckHandle($hWnd)
	If Not IsHWnd($hWnd) Then
		$hWnd = GUICtrlGetHandle($hWnd)
		If $hWnd = 0 Then
			Return 0
		EndIf
	EndIf
	Return $hWnd
EndFunc   ;==>_Icons_Control_CheckHandle

Func _Icons_Control_FitTo($hWnd, $hImage)

	Local $Size = _Icons_Control_GetSize($hWnd)

	If $Size = 0 Then
		Return SetError(1, 0, $hImage)
	EndIf

	_GDIPlus_Startup()

	Local $Width = _GDIPlus_ImageGetWidth($hImage), $Height = _GDIPlus_ImageGetHeight($hImage)
	Local $Ret, $Error = 0

	If ($Width = -1) Or ($Height = -1) Then
		$Error = 1
	Else
		If ($Width <> $Size[0]) Or ($Height <> $Size[1]) Then
			$Ret = DllCall($ghGDIPDll, 'int', 'GdipGetImageThumbnail', 'ptr', $hImage, 'int', $Size[0], 'int', $Size[1], 'ptr*', 0, 'ptr', 0, 'ptr', 0)
			If (Not @error) And ($Ret[0] = 0) Then
				_GDIPlus_ImageDispose($hImage)
				$hImage = $Ret[4]
			Else
				$Error = 1
			EndIf
		EndIf
	EndIf

	_GDIPlus_Shutdown()

	Return SetError($Error, 0, $hImage)
EndFunc   ;==>_Icons_Control_FitTo

Func _Icons_Control_GetSize($hWnd)

	Local $tRect = DllStructCreate($tagRECT)
	Local $Ret = DllCall('user32.dll', 'int', 'GetClientRect', 'hwnd', $hWnd, 'ptr', DllStructGetPtr($tRect))

	If (@error) Or ($Ret[0] = 0) Then
		Return 0
	EndIf

	Local $Size[2] = [DllStructGetData($tRect, 3) - DllStructGetData($tRect, 1), DllStructGetData($tRect, 4) - DllStructGetData($tRect, 2)]

	If ($Size[0] = 0) Or ($Size[1] = 0) Then
		Return 0
	EndIf
	Return $Size
EndFunc   ;==>_Icons_Control_GetSize

Func _Icons_Control_SetImage($hWnd, $hImage, $iType, $hOverlap)

	Local $Static, $Style, $Update, $tRect, $hPrev

	Switch $iType
		Case $IMAGE_BITMAP
			$Static = $__SS_BITMAP
		Case $IMAGE_ICON
			$Static = $__SS_ICON
		Case Else
			Return 0
	EndSwitch

	$Style = _WinAPI_GetWindowLong($hWnd, $GWL_STYLE)
	If @error Then
		Return 0
	EndIf
	_WinAPI_SetWindowLong($hWnd, $GWL_STYLE, BitOR($Style, $Static))
	If @error Then
		Return 0
	EndIf
	$tRect = _Icons_Control_GetRect($hWnd)
	$hPrev = _SendMessage($hWnd, $__STM_SETIMAGE, $iType, $hImage)
	If @error Then
		Return 0
	EndIf
	If $hPrev Then
		If $iType = $IMAGE_BITMAP Then
			_WinAPI_DeleteObject($hPrev)
		Else
			_WinAPI_DestroyIcon($hPrev)
		EndIf
	EndIf
	If (Not $hImage) And (IsDllStruct($tRect)) Then
		_WinAPI_MoveWindow($hWnd, DllStructGetData($tRect, 1), DllStructGetData($tRect, 2), DllStructGetData($tRect, 3) - DllStructGetData($tRect, 1), DllStructGetData($tRect, 4) - DllStructGetData($tRect, 2), 0)
	EndIf
	If $hOverlap Then
		If Not IsHWnd($hOverlap) Then
			$hOverlap = 0
		EndIf
		_Icons_Control_Update($hWnd, $hOverlap)
	Else
		_Icons_Control_Invalidate($hWnd)
	EndIf
	Return 1
EndFunc   ;==>_Icons_Control_SetImage

Func _Icons_Control_GetRect($hWnd)

	Local $Pos = ControlGetPos($hWnd, '', '')

	If (@error) Or ($Pos[2] = 0) Or ($Pos[3] = 0) Then
		Return 0
	EndIf

	Local $tRect = DllStructCreate($tagRECT)

	DllStructSetData($tRect, 1, $Pos[0])
	DllStructSetData($tRect, 2, $Pos[1])
	DllStructSetData($tRect, 3, $Pos[0] + $Pos[2])
	DllStructSetData($tRect, 4, $Pos[1] + $Pos[3])

	Return $tRect
EndFunc   ;==>_Icons_Control_GetRect

Func _Icons_Control_Update($hWnd, $hOverlap)

	Local $tBack, $tFront = _Icons_Control_GetRect($hWnd)

	If $tFront = 0 Then
		Return
	EndIf

	Local $aNext = _Icons_Control_Enum($hWnd, 1)
	Local $aPrev = _Icons_Control_Enum($hWnd, 0)

	If UBound($aPrev) = 1 Then
		_WinAPI_InvalidateRect(_WinAPI_GetParent($hWnd), $tFront)
		Return
	EndIf

	Local $aWnd[UBound($aNext) + UBound($aPrev - 1)]
	Local $tIntersect = DllStructCreate($tagRECT), $pIntersect = DllStructGetPtr($tIntersect)
	Local $iWnd, $Ret, $XOffset, $YOffset, $Count = 0, $Update = 0

	For $i = UBound($aPrev) - 1 To 1 Step -1
		$aWnd[$Count] = $aPrev[$i]
		$Count += 1
	Next
	For $i = 0 To UBound($aNext) - 1
		$aWnd[$Count] = $aNext[$i]
		$Count += 1
	Next
	For $i = 0 To $Count - 1
		If $aWnd[$i] = $hWnd Then
			_WinAPI_InvalidateRect($hWnd)
		Else
			If (Not $hOverlap) Or ($aWnd[$i] = $hOverlap) Then
				$tBack = _Icons_Control_GetRect($aWnd[$i])
				$Ret = DllCall('user32.dll', 'int', 'IntersectRect', 'ptr', $pIntersect, 'ptr', DllStructGetPtr($tFront), 'ptr', DllStructGetPtr($tBack))
				If (Not @error) And ($Ret[0]) Then
					$Ret = DllCall('user32.dll', 'int', 'IsRectEmpty', 'ptr', $pIntersect)
					If (Not @error) And (Not $Ret[0]) Then
						$XOffset = DllStructGetData($tBack, 1)
						$YOffset = DllStructGetData($tBack, 2)
						$Ret = DllCall('user32.dll', 'int', 'OffsetRect', 'ptr', $pIntersect, 'int', -$XOffset, 'int', -$YOffset)
						If (Not @error) And ($Ret[0]) Then
							_WinAPI_InvalidateRect($aWnd[$i], $tIntersect)
							$Update += 1
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Next
	If Not $Update Then
		_WinAPI_InvalidateRect(_WinAPI_GetParent($hWnd), $tFront)
	EndIf
EndFunc   ;==>_Icons_Control_Update

Func _Icons_Control_Invalidate($hWnd)

	Local $tRect = _Icons_Control_GetRect($hWnd)

	If IsDllStruct($tRect) Then
		_WinAPI_InvalidateRect(_WinAPI_GetParent($hWnd), $tRect)
	EndIf
EndFunc   ;==>_Icons_Control_Invalidate

Func _Icons_Control_Enum($hWnd, $iDirection)

	Local $iWnd, $Count = 0, $aWnd[50] = [$hWnd]

	If $iDirection Then
		$iDirection = $GW_HWNDNEXT
	Else
		$iDirection = $GW_HWNDPREV
	EndIf
	While 1
		$iWnd = _WinAPI_GetWindow($aWnd[$Count], $iDirection)
		If Not $iWnd Then
			ExitLoop
		EndIf
		$Count += 1
		If $Count = UBound($aWnd) Then
			ReDim $aWnd[$Count + 50]
		EndIf
		$aWnd[$Count] = $iWnd
	WEnd
	ReDim $aWnd[$Count + 1]
	Return $aWnd
EndFunc   ;==>_Icons_Control_Enum