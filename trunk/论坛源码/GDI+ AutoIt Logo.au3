#include <GDIPlus.au3>
#include <GDIPlusConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>


Opt("GUIOnEventMode", 1)
Opt("MustDeclareVars", 1)

_GDIPlus_Startup()


Global $aAutoIt = _CreateAutoItLogo()
Global $aAutoIt_Dim = _CalcLogoDim($aAutoIt)


Global $iWidth = $aAutoIt_Dim[8] * 2 + 20
Global $iHeight = $aAutoIt_Dim[9] * 2 + 20

Global $hGui = GUICreate("AutoIt GDI+", $iWidth, $iHeight)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")
Global $hDC = _WinAPI_GetDC($hGui)
Global $hBMP = _WinAPI_CreateCompatibleBitmap($hDC, $iWidth, $iHeight)
Global $hBmpTmp = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
_WinAPI_DeleteObject($hBMP)
$hBMP = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBmpTmp)
_GDIPlus_BitmapDispose($hBmpTmp)
Global $hCDC = _WinAPI_CreateCompatibleDC($hDC)
Global $hOBJ = _WinAPI_SelectObject($hCDC, $hBMP)
Global $hGfxBuffer = _GDIPlus_GraphicsCreateFromHDC($hCDC)
_GDIPlus_GraphicsSetSmoothingMode($hGfxBuffer, 2)
_GDIPlus_GraphicsClear($hGfxBuffer, 0xFF000000)

GUIRegisterMsg($WM_PAINT, "_WM_PAINT")
GUISetState()


Global $hBmp_Glow
Global $hBmp_Alu = _CreateAlu($aAutoIt_Dim[2] + 11, $aAutoIt_Dim[3] + 11)
Global $hBmp_AutoIt = _CreateAutoItBitmap($aAutoIt, $aAutoIt_Dim, $hBmp_Alu)
Global $aInfo = _CreateInfoBitmap()

Global $hBrush_Light = _CreateLight_Brush($aAutoIt_Dim[2] / 2, 0xBBFFFFFF, 1.2)



While Sleep(10)
	_Draw()
WEnd



Func _Draw()
	Local Static $fRotate = -30, $fRotateI = 0.33, $fGlow = 0, $fLight = 0
	$fRotate += $fRotateI
	$fGlow += 0.1
	$fLight += 0.011

	Local $hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixTranslate($hMatrix, -($aAutoIt_Dim[4] + $aAutoIt_Dim[6] / 2), -($aAutoIt_Dim[5] + $aAutoIt_Dim[7] / 2), True)
	_GDIPlus_MatrixRotate($hMatrix, $fRotate, True)
	_GDIPlus_MatrixTranslate($hMatrix, ($aAutoIt_Dim[8]), ($aAutoIt_Dim[9]), True)

	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $aAutoIt_Dim[8] * 2, "int", $aAutoIt_Dim[9] * 2, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Then Return SetError(1, 3, False)
	Local $hBMP = $aResult[6]
	Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBMP)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx, 2)
	_GDIPlus_GraphicsSetTransform($hGfx, $hMatrix)

	_GDIPlus_GraphicsDrawImage($hGfx, $hBmp_AutoIt, 0, 0)
	_GDIPlus_GraphicsDispose($hGfx)

	_GDIPlus_GraphicsClear($hGfxBuffer, 0xFF000000)
	_GDIPlus_GraphicsDrawImage($hGfxBuffer, $hBMP, 0, 0)
	_GDIPlus_BitmapDispose($hBMP)


	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iWidth, "int", $iHeight, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Then Return SetError(1, 3, False)
	Local $hBMP = $aResult[6]
	Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBMP)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx, 2)

	Global $fScale = 1.007

	DllCall($ghGDIPDll, "uint", "GdipSetInterpolationMode", "hwnd", $hGfx, "int", 0)
	DllCall($ghGDIPDll, "uint", "GdipTranslateWorldTransform", "hwnd", $hGfx, "float", -$aAutoIt_Dim[8], "float", -$aAutoIt_Dim[9], "int", 1)
	DllCall($ghGDIPDll, "uint", "GdipRotateWorldTransform", "hwnd", $hGfx, "float", $fRotateI + Sin($fGlow) * 0.14, "int", 1)
	DllCall($ghGDIPDll, "uint", "GdipScaleWorldTransform", "hwnd", $hGfx, "float", $fScale, "float", $fScale, "int", 1)
	DllCall($ghGDIPDll, "uint", "GdipTranslateWorldTransform", "hwnd", $hGfx, "float", $aAutoIt_Dim[8], "float", $aAutoIt_Dim[9], "int", 1)

	Local $tColorMatrix = DllStructCreate("float[5]; float[5]; float[5]; float[5]; float[5];")
	DllStructSetData($tColorMatrix, 1, 1, 1)
	DllStructSetData($tColorMatrix, 2, 1, 2)
	DllStructSetData($tColorMatrix, 3, 1, 3)
	DllStructSetData($tColorMatrix, 4, 0.96, 4)
	DllStructSetData($tColorMatrix, 5, 1, 5)

	Local $aResult = DllCall($ghGDIPDll, "int", "GdipCreateImageAttributes", "ptr*", 0)
	If @error Then Return SetError(1, 4, False)
	Local $hImgAttrib = $aResult[1]
	DllCall($ghGDIPDll, "int", "GdipSetImageAttributesColorMatrix", "ptr", $hImgAttrib, "int", 1, "int", 1, "ptr", DllStructGetPtr($tColorMatrix), "ptr", 0, "int", 0)

	DllCall($ghGDIPDll, "int", "GdipDrawImageRectRectI", "hwnd", $hGfx, "hwnd", $hBmp_Glow, "int", 0, "int", 0, "int", $iWidth, "int", $iHeight, "int", 0, "int", 0, "int", $iWidth, "int", $iHeight, "int", 2, "ptr", $hImgAttrib, "int", 0, "int", 0)

	DllCall($ghGDIPDll, "int", "GdipDisposeImageAttributes", "ptr", $hImgAttrib)

	Local $iInfW = _GDIPlus_ImageGetWidth($aInfo[0])
	Local $iInfH = _GDIPlus_ImageGetHeight($aInfo[0])
	_GDIPlus_GraphicsDrawImage($hGfxBuffer, $aInfo[0], $iWidth / 2 - $iInfW / 2, $iHeight - $iInfH - 30)

	Local $hClone
	If Random(0, 300, 1) = 0 Then
		$aResult = DllCall($ghGDIPDll, "uint", "GdipClonePath", "hwnd", $aAutoIt[2], "hwnd*", 0)
		$hClone = $aResult[2]
		DllCall($ghGDIPDll, "uint", "GdipTransformPath", "hwnd", $hClone, "hwnd", $hMatrix)
		Local $hPen = _GDIPlus_PenCreate(0xAA000000, 8)
		DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen, "hwnd", $hClone)
		_GDIPlus_PenDispose($hPen)
		DllCall($ghGDIPDll, "uint", "GdipDeletePath", "hwnd", $hClone)
	EndIf

	$aResult = DllCall($ghGDIPDll, "uint", "GdipClonePath", "hwnd", $aAutoIt[1], "hwnd*", 0)
	$hClone = $aResult[2]
	DllCall($ghGDIPDll, "uint", "GdipTransformPath", "hwnd", $hClone, "hwnd", $hMatrix)

	Local $hPen_Glow = _GDIPlus_PenCreate(0x30FFEEFF, 3)
	DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen_Glow, "hwnd", $hClone)
	_GDIPlus_PenDispose($hPen_Glow)

	_GDIPlus_GraphicsDispose($hGfx)

	_GDIPlus_GraphicsDrawImage($hGfxBuffer, $hBMP, 0, 0)
	_GDIPlus_BitmapDispose($hBmp_Glow)
	$hBmp_Glow = $hBMP


	DllCall($ghGDIPDll, "uint", "GdipResetLineTransform", "hwnd", $hBrush_Light)
	DllCall($ghGDIPDll, "uint", "GdipRotateLineTransform", "hwnd", $hBrush_Light, "float", 80, "int", 1)
	DllCall($ghGDIPDll, "uint", "GdipScaleLineTransform", "hwnd", $hBrush_Light, "float", 1 + Sin($fLight) * 0.2, "float", 1 + Sin($fLight) * 0.2, "int", 1)

	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfxBuffer, "hwnd", $hBrush_Light, "hwnd", $hClone)
	DllCall($ghGDIPDll, "uint", "GdipDeletePath", "hwnd", $hClone)

	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfxBuffer, "hwnd", $hBrush_Light, "hwnd", $aInfo[1])

	_GDIPlus_MatrixDispose($hMatrix)

	_WinAPI_BitBlt($hDC, 0, 0, $iWidth, $iHeight, $hCDC, 0, 0, 0x00CC0020)
EndFunc   ;==>_Draw


Func _CreateAutoItBitmap($aAutoIt, $aAutoIt_Dim, $hBmp_Alu)
	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $aAutoIt_Dim[2] + 20, "int", $aAutoIt_Dim[3] + 20, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Then Return SetError(1, 3, False)
	Local $hBMP = $aResult[6]
	Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBMP)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx, 2)

	Local $hBrush_Alu_1 = _CreateAlu_Brush($hBmp_Alu, 0.75, 0.8, 0.75)
	Local $hBrush_Alu_2 = _CreateAlu_Brush($hBmp_Alu, 0.1, 0.3, 0.8)
	Local $hBrush_Alu_3 = _CreateAlu_Brush($hBmp_Alu, 0.64, 0.1, 0.1)

	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfx, "hwnd", $hBrush_Alu_1, "hwnd", $aAutoIt[1])
	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfx, "hwnd", $hBrush_Alu_2, "hwnd", $aAutoIt[4])
	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfx, "hwnd", $hBrush_Alu_3, "hwnd", $aAutoIt[5])
	_GDIPlus_BrushDispose($hBrush_Alu_1)
	_GDIPlus_BrushDispose($hBrush_Alu_2)
	_GDIPlus_BrushDispose($hBrush_Alu_3)


	Local $aGlowColor[6] = [0, 0, 0x00EEFFEE, 0x00DDFFDD, 0x006688FF, 0x00FF6666]
	Local $aGlowSize[6] = [0, 0, 16, 14, 14, 10]

	Local $hPen_Glow = _GDIPlus_PenCreate()
	DllCall($ghGDIPDll, "uint", "GdipSetPenLineJoin", "hwnd", $hPen_Glow, "int", 1)

	For $i = 2 To $aAutoIt[0]
		_GDIPlus_PenSetColor($hPen_Glow, BitOR(0x14000000, $aGlowColor[$i]))

		For $j = 1 To $aGlowSize[$i] Step 2
			_GDIPlus_PenSetWidth($hPen_Glow, $aGlowSize[$i] + 3 - $j)
			DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen_Glow, "hwnd", $aAutoIt[$i])
		Next

		_GDIPlus_PenSetWidth($hPen_Glow, 2)
		_GDIPlus_PenSetColor($hPen_Glow, BitOR(0xDD000000, $aGlowColor[$i]))
		DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen_Glow, "hwnd", $aAutoIt[$i])
	Next

	_GDIPlus_PenDispose($hPen_Glow)

	_GDIPlus_GraphicsDispose($hGfx)

	Return $hBMP
EndFunc   ;==>_CreateAutoItBitmap


Func _CreateInfoBitmap()
	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreatePath", "int", 0, "int*", 0)
	If @error Then Return SetError(1, 1, False)
	Local $hPath = $aResult[2]

	Local $hFormat = _GDIPlus_StringFormatCreate()
	Local $hFamily = _GDIPlus_FontFamilyCreate("Arial")
	Local $tLayout = _GDIPlus_RectFCreate(0, 0, 0, 0)

	DllCall($ghGDIPDll, "uint", "GdipAddPathString", "hwnd", $hPath, "wstr", "AutoIt GDI+ Script by Eukalyptus", "int", -1, "hwnd", $hFamily, "int", 0, "float", 13, "ptr", DllStructGetPtr($tLayout), "hwnd", $hFormat)

	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_StringFormatDispose($hFormat)

	Local $tBounds = _GDIPlus_RectFCreate(0, 0, 0, 0)
	DllCall($ghGDIPDll, "uint", "GdipGetPathWorldBounds", "hwnd", $hPath, "ptr", DllStructGetPtr($tBounds), "hwnd", 0, "hwnd", 0)

	Local $hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixTranslate($hMatrix, -DllStructGetData($tBounds, "X") + 10, -DllStructGetData($tBounds, "Y") + 10, 0)
	DllCall($ghGDIPDll, "uint", "GdipTransformPath", "hwnd", $hPath, "hwnd", $hMatrix)
	_GDIPlus_MatrixDispose($hMatrix)

	Local $iImgW = DllStructGetData($tBounds, "Width") + 20
	Local $iImgH = DllStructGetData($tBounds, "Height") + 20
	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iImgW, "int", $iImgH, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Then Return SetError(1, 3, False)
	Local $hBMP = $aResult[6]
	Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBMP)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx, 2)


	Local $hPen = _GDIPlus_PenCreate(0x0444FFAA)
	DllCall($ghGDIPDll, "uint", "GdipSetPenLineJoin", "hwnd", $hPen, "int", 1)
	For $i = 12 To 1 Step -1
		_GDIPlus_PenSetWidth($hPen, $i)
		DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen, "hwnd", $hPath)
	Next
	_GDIPlus_PenSetWidth($hPen, 1)
	_GDIPlus_PenSetColor($hPen, 0xFF88DD88)
	DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGfx, "hwnd", $hPen, "hwnd", $hPath)

	Local $hBrush = _GDIPlus_BrushCreateSolid(0xFFFFFFFF)
	DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGfx, "hwnd", $hBrush, "hwnd", $hPath)
	_GDIPlus_BrushDispose($hBrush)

	_GDIPlus_PenSetWidth($hPen, 2)
	DllCall($ghGDIPDll, "uint", "GdipWidenPath", "hwnd", $hPath, "hwnd", $hPen, "hwnd", 0, "float", 0.1)
	_GDIPlus_PenDispose($hPen)

	_GDIPlus_GraphicsDispose($hGfx)

	Local $hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixTranslate($hMatrix, $iWidth / 2 - $iImgW / 2, $iHeight - $iImgH - 30, 0)
	DllCall($ghGDIPDll, "uint", "GdipTransformPath", "hwnd", $hPath, "hwnd", $hMatrix)
	_GDIPlus_MatrixDispose($hMatrix)

	Local $aReturn[2]
	$aReturn[0] = $hBMP
	$aReturn[1] = $hPath
	Return $aReturn
EndFunc   ;==>_CreateInfoBitmap


Func _CreateLight_Brush($fSize, $iLightColor = 0xAAFFFFFF, $fLightScale = 1.3)
	Local $tPointF1 = DllStructCreate("float; float;")
	Local $tPointF2 = DllStructCreate("float; float;")
	DllStructSetData($tPointF2, 2, $fSize * $fLightScale)

	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateLineBrush", "ptr", DllStructGetPtr($tPointF1), "ptr", DllStructGetPtr($tPointF2), "uint", 0, "uint", $iLightColor, "int", 0, "int*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 4, False)
	Local $hBrush = $aResult[6]

	DllCall($ghGDIPDll, "uint", "GdipSetLineSigmaBlend", "hwnd", $hBrush, "float", 0.5, "float", 1)
	DllCall($ghGDIPDll, "uint", "GdipSetLineGammaCorrection", "hwnd", $hBrush, "int", True)

	Return $hBrush
EndFunc   ;==>_CreateLight_Brush


Func _CreateAlu_Brush($hBmp_Alu, $fRed = 1, $fGreen = 1, $fBlue = 1)
	Local $iImgW = _GDIPlus_ImageGetWidth($hBmp_Alu)
	Local $iImgH = _GDIPlus_ImageGetHeight($hBmp_Alu)

	Local $tColorMatrix = DllStructCreate("float[5]; float[5]; float[5]; float[5]; float[5];")
	DllStructSetData($tColorMatrix, 1, $fRed, 1)
	DllStructSetData($tColorMatrix, 2, $fGreen, 2)
	DllStructSetData($tColorMatrix, 3, $fBlue, 3)
	DllStructSetData($tColorMatrix, 4, 1, 4)
	DllStructSetData($tColorMatrix, 5, 1, 5)

	Local $aResult = DllCall($ghGDIPDll, "int", "GdipCreateImageAttributes", "ptr*", 0)
	If @error Then Return SetError(1, 4, False)
	Local $hImgAttrib = $aResult[1]
	DllCall($ghGDIPDll, "int", "GdipSetImageAttributesColorMatrix", "ptr", $hImgAttrib, "int", 1, "int", 1, "ptr", DllStructGetPtr($tColorMatrix), "ptr", 0, "int", 0)

	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateTextureIA", "hwnd", $hBmp_Alu, "hwnd", $hImgAttrib, "float", 0, "float", 0, "float", $iImgW, "float", $iImgH, "int*", 0)
	If @error Then Return SetError(1, 1, False)
	Local $hBrush = $aResult[7]

	DllCall($ghGDIPDll, "int", "GdipDisposeImageAttributes", "ptr", $hImgAttrib)

	Return $hBrush
EndFunc   ;==>_CreateAlu_Brush


Func _CalcLogoDim($aAutoIt)
	Local $aDim[10]
	Local $tBounds = _GDIPlus_RectFCreate(0, 0, 0, 0)
	Local $pBounds = DllStructGetPtr($tBounds)

	DllCall($ghGDIPDll, "uint", "GdipGetPathWorldBounds", "hwnd", $aAutoIt[1], "ptr", $pBounds, "hwnd", 0, "hwnd", 0)
	$aDim[0] = DllStructGetData($tBounds, "X")
	$aDim[1] = DllStructGetData($tBounds, "Y")
	$aDim[2] = DllStructGetData($tBounds, "Width")
	$aDim[3] = DllStructGetData($tBounds, "Height")

	DllCall($ghGDIPDll, "uint", "GdipGetPathWorldBounds", "hwnd", $aAutoIt[3], "ptr", $pBounds, "hwnd", 0, "hwnd", 0)
	$aDim[4] = DllStructGetData($tBounds, "X")
	$aDim[5] = DllStructGetData($tBounds, "Y")
	$aDim[6] = DllStructGetData($tBounds, "Width")
	$aDim[7] = DllStructGetData($tBounds, "Height")

	$aDim[8] = ($aDim[2] - $aDim[6] / 2) + $aDim[4]
	$aDim[9] = ($aDim[3] - $aDim[7] / 2) + $aDim[4]

	Return $aDim
EndFunc   ;==>_CalcLogoDim


Func _CreateAutoItLogo()
	Local $bLogo = "0x6A0000006E2D404317F67B4108CA624333A77B410C9E8143C649C7417BA08F4303B02342CA4C9343F3C38B41A23F9E43D31AF13ECB2CAB43D31AF13E8523BB43D31AF13EAF10C8430797D241AF10C84353016942AF10C843A57DA8429A78BF433E79D442C4ACB34341FAE242F07DBB43B7450D432FF7BF43474B2D432FF7BF43556F4F432FF7BF43C8AB9C43D50A95432198C7436E2D40432198C74381A2AC422198C743D31AF13EC8AB9C43D31AF13E556F4F43D31AF13E4D26CB4281A2AC4233A77B416E2D404333A77B416E2D4043FCD2B343BDE18943AF9AB343BBF9AB43B0829143BBF9AB43556F4F43BBF9AB438FB2F742BDE1894364D55E426E2D404364D55E42C32ED94264D55E42CDCD21428FB2F742CDCD2142556F4F43CDCD2142B0829143C32ED942AF9AB3436E2D4043AF9AB34319730E43D4E5834317D2174326C27A43163121433C0B6E4305842A43444861437FDA36434448614348BD5E439AB76043A5FB6A43D1C06143C4DB6043AFD95443C1D44943F824324326CA404380F52443883E294302C84543F7BE114390A66643CE7EF44288BC8343D4DBCF4288BC8343BD20AB4288BC8343C37D864288BC83431CB9C64296BC5A433B7A03430DF42D43E797234393370143BCA633433B2BD64246634F4392C1D442F24D5F4393370143AF9E7E430DF42D43AEF18E4396BC5A430B9A9E4388BC8343E179814388BC83436EB3484388BC834319730E4388BC8343E52DA043B9B0374279C8A543367737420B63AB43367737429EFDB04336773742582BB443367737427543B443D2B450429EFDB043D2B45042DF17AC43D2B45042192CA743D2B450425B46A243D2B45042E091A3434AE45D426CE3A443C2136B42F834A64300137842A57DA843001378420858B14321A075427E97B24318B67A427D70B3434B4A7E4212EFB343C12F8842C11BB143C12F8842B741AA43C12F8842AD67A343C12F88429E879C43C12F88428C2D9E430719904274CD9F436C1A98425C6DA143D01BA042F255A543D01BA0425DA0B143233DA14209C2B443EF819E42E750BC4317D29742139CBB43D0CC7242C516B743ACBE6642990EBC43DBD15B42BB05BD43BBC61B4241CBB5439D540C423055B243FFFB0442D01BA043C12F084234549B43C12F08421DF49C434F021842FE8D9E43DFD42742E52DA04336773742000303030303030303030303030303030303030303030303830003030303030303030303038300030303030303030303030303030303030303030303030303030383000303030303030303030303030303030303030303030303030303030303030303030303030303830000"

	Local $tLogo = DllStructCreate("byte[" & BinaryLen($bLogo) & "];")
	DllStructSetData($tLogo, 1, $bLogo)
	Local $tCnt = DllStructCreate("uint", DllStructGetPtr($tLogo))
	Local $iPathCnt = DllStructGetData($tCnt, 1)
	Local $tPathData = DllStructCreate("uint Cnt; float Pnt[" & $iPathCnt * 2 & "]; ubyte Type[" & $iPathCnt & "];", DllStructGetPtr($tLogo))

	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreatePath2", "ptr", DllStructGetPtr($tPathData, "Pnt"), "ptr", DllStructGetPtr($tPathData, "Type"), "int", $iPathCnt, "int", 0, "int*", 0)
	If @error Then Return SetError(1, 1, False)
	Local $hPath = $aResult[5]

	Local $tBounds = _GDIPlus_RectFCreate(0, 0, 0, 0)
	Local $pBounds = DllStructGetPtr($tBounds)

	DllCall($ghGDIPDll, "uint", "GdipGetPathWorldBounds", "hwnd", $hPath, "ptr", $pBounds, "hwnd", 0, "hwnd", 0)
	Local $hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixTranslate($hMatrix, -DllStructGetData($tBounds, "X") + 10, -DllStructGetData($tBounds, "Y") + 10, 0)
	DllCall($ghGDIPDll, "uint", "GdipTransformPath", "hwnd", $hPath, "hwnd", $hMatrix)
	_GDIPlus_MatrixDispose($hMatrix)

	$aResult = DllCall($ghGDIPDll, "uint", "GdipCreatePathIter", "int*", 0, "hwnd", $hPath)
	If @error Then Return SetError(1, 2, False)
	Local $hPathIter = $aResult[1]

	$aResult = DllCall($ghGDIPDll, "uint", "GdipPathIterGetSubpathCount", "hwnd", $hPathIter, "int*", 0)
	If @error Then Return SetError(1, 3, False)
	Local $iPathIter = $aResult[2]

	Local $aReturn[$iPathIter + 2] = [$iPathIter + 1]
	For $i = 1 To $iPathIter
		$aResult = DllCall($ghGDIPDll, "uint", "GdipCreatePath", "int", 0, "int*", 0)
		If @error Then Return SetError(1, 4, False)
		$aReturn[$i + 1] = $aResult[2]
		DllCall($ghGDIPDll, "uint", "GdipPathIterNextSubpathPath", "hwnd", $hPathIter, "int*", 0, "hwnd", $aReturn[$i + 1], "int*", 0)
	Next
	DllCall($ghGDIPDll, "uint", "GdipDeletePathIter", "hwnd", $hPathIter)

	$aReturn[1] = $hPath

	Return $aReturn
EndFunc   ;==>_CreateAutoItLogo


Func _CreateAlu($iW, $iH, $iBlurDist = 14, $fBlurTrans = 0.6)
	$iBlurDist = Ceiling($iBlurDist)
	$iBlurDist += 1 - Mod($iBlurDist, 2)

	Local $iOverSize = 0
	For $i = 1 To $iBlurDist Step 2
		$iOverSize += $i + $i + 1
	Next

	Local $iWO = $iW + $iOverSize

	Local $iNoiseSize = 40

	Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iNoiseSize, "int", $iNoiseSize, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 1, False)
	Local $hBmp_Noise = $aResult[6]
	Local $hGfx_Noise = _GDIPlus_ImageGetGraphicsContext($hBmp_Noise)

	Local $tData = _GDIPlus_BitmapLockBits($hBmp_Noise, 0, 0, $iNoiseSize, $iNoiseSize, BitOR($GDIP_ILMREAD, $GDIP_ILMWRITE), $GDIP_PXF32ARGB)
	Local $iStride = DllStructGetData($tData, "Stride")
	Local $iWidth = DllStructGetData($tData, "Width")
	Local $iHeight = DllStructGetData($tData, "Height")
	Local $pScan0 = DllStructGetData($tData, "Scan0")
	Local $tPixel = DllStructCreate("dword[" & $iWidth * $iHeight & "];", $pScan0)

	Local $iAmp
	For $row = 0 To $iHeight - 1
		For $col = 0 To $iWidth - 1
			$iAmp = Random(0, 0xFF, 1)
			DllStructSetData($tPixel, 1, BitOR(0xFF000000, BitShift($iAmp, -16), BitShift($iAmp, -8), $iAmp), $row * $iWidth + $col + 1)
		Next
	Next

	_GDIPlus_BitmapUnlockBits($hBmp_Noise, $tData)

	$aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iWO, "int", $iH, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 3, False)
	Local $hBmp_Full = $aResult[6]
	Local $hGfx_Full = _GDIPlus_ImageGetGraphicsContext($hBmp_Full)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx_Full, 2)
	DllCall($ghGDIPDll, "uint", "GdipSetInterpolationMode", "hwnd", $hGfx_Full, "int", 7)

	Local $iXOff, $iYOff, $iSizeX, $iSizeY
	For $y = 0 To $iH Step $iNoiseSize / 2
		For $x = 0 To $iWO Step $iNoiseSize / 2
			$iXOff = Random(0, $iNoiseSize / 2, 1)
			$iYOff = Random(0, $iNoiseSize / 2, 1)
			$iSizeX = $iNoiseSize - $iXOff
			$iSizeY = $iNoiseSize - $iYOff
			_GDIPlus_GraphicsDrawImageRectRect($hGfx_Full, $hBmp_Noise, $iXOff, $iYOff, $iSizeX, $iSizeY, $x, $y, $iSizeX, $iSizeY)
		Next
	Next

	_GDIPlus_GraphicsDispose($hGfx_Noise)
	_GDIPlus_BitmapDispose($hBmp_Noise)

	$aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iWO, "int", $iH, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 3, False)
	Local $hBmp_Full2 = $aResult[6]
	Local $hGfx_Full2 = _GDIPlus_ImageGetGraphicsContext($hBmp_Full2)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx_Full2, 2)
	DllCall($ghGDIPDll, "uint", "GdipSetInterpolationMode", "hwnd", $hGfx_Full2, "int", 7)

	Local $tColorMatrix = DllStructCreate("float[5]; float[5]; float[5]; float[5]; float[5];")
	DllStructSetData($tColorMatrix, 1, 1, 1)
	DllStructSetData($tColorMatrix, 2, 1, 2)
	DllStructSetData($tColorMatrix, 3, 1, 3)
	DllStructSetData($tColorMatrix, 4, $fBlurTrans, 4)
	DllStructSetData($tColorMatrix, 5, 1, 5)

	$aResult = DllCall($ghGDIPDll, "int", "GdipCreateImageAttributes", "ptr*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 4, False)
	Local $hImgAttrib = $aResult[1]
	DllCall($ghGDIPDll, "int", "GdipSetImageAttributesColorMatrix", "ptr", $hImgAttrib, "int", 1, "int", 1, "ptr", DllStructGetPtr($tColorMatrix), "ptr", 0, "int", 0)

	For $i = 1 To $iBlurDist Step 2
		DllCall($ghGDIPDll, "int", "GdipDrawImageRectRectI", "hwnd", $hGfx_Full2, "hwnd", $hBmp_Full, "int", $i, "int", 0, "int", $iWO, "int", $iH, "int", 0, "int", 0, "int", $iWO, "int", $iH, "int", 2, "ptr", $hImgAttrib, "int", 0, "int", 0)
		DllCall($ghGDIPDll, "int", "GdipDrawImageRectRectI", "hwnd", $hGfx_Full, "hwnd", $hBmp_Full2, "int", $i + 1, "int", 0, "int", $iWO, "int", $iH, "int", 0, "int", 0, "int", $iWO, "int", $iH, "int", 2, "ptr", $hImgAttrib, "int", 0, "int", 0)
	Next
	DllCall($ghGDIPDll, "int", "GdipDisposeImageAttributes", "ptr", $hImgAttrib)

	_GDIPlus_GraphicsDispose($hGfx_Full2)
	_GDIPlus_BitmapDispose($hBmp_Full2)
	_GDIPlus_GraphicsDispose($hGfx_Full)

	$aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iW, "int", $iH, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	If @error Or Not IsArray($aResult) Then Return SetError(1, 3, False)
	Local $hBmp_Alu = $aResult[6]
	Local $hGfx_Alu = _GDIPlus_ImageGetGraphicsContext($hBmp_Alu)
	_GDIPlus_GraphicsSetSmoothingMode($hGfx_Alu, 2)
	DllCall($ghGDIPDll, "uint", "GdipSetInterpolationMode", "hwnd", $hGfx_Alu, "int", 7)

	_GDIPlus_GraphicsDrawImage($hGfx_Alu, $hBmp_Full, -$iOverSize, 0)
	_GDIPlus_BitmapDispose($hBmp_Full)
	_GDIPlus_GraphicsDispose($hGfx_Alu)

	Return $hBmp_Alu
EndFunc   ;==>_CreateAlu


Func _WM_PAINT($hWnd, $iMsg, $wParam, $lParam)
	_WinAPI_BitBlt($hDC, 0, 0, $iWidth, $iHeight, $hCDC, 0, 0, 0x00CC0020)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_PAINT


Func _Exit()
	For $i = 1 To $aAutoIt[0]
		DllCall($ghGDIPDll, "uint", "GdipDeletePath", "hwnd", $aAutoIt[$i])
	Next
	DllCall($ghGDIPDll, "uint", "GdipDeletePath", "hwnd", $aInfo[1])

	_GDIPlus_BitmapDispose($hBmp_Alu)
	_GDIPlus_BitmapDispose($hBmp_AutoIt)
	_GDIPlus_BitmapDispose($hBmp_Glow)
	_GDIPlus_BitmapDispose($aInfo[0])

	_GDIPlus_BrushDispose($hBrush_Light)

	_GDIPlus_GraphicsDispose($hGfxBuffer)
	_WinAPI_SelectObject($hCDC, $hOBJ)
	_WinAPI_DeleteObject($hBMP)
	_WinAPI_DeleteDC($hCDC)
	_WinAPI_ReleaseDC($hGui, $hDC)
	_GDIPlus_Shutdown()
	GUIDelete($hGui)
	Exit
EndFunc   ;==>_Exit