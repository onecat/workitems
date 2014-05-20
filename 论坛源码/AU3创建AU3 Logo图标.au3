#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <GDIPlus.au3>

Opt("MustDeclareVars", 1)


_GDIPlus_Startup()

Global $hBitmap = _CreateAutoItLogo(1920, 1200);Set resolution

_GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\Logo.bmp")
_GDIPlus_Shutdown()

ShellExecute(@ScriptDir & "\Logo.bmp")





Func _Draw_Inner($hContext, $hPath)
    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath)

    Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 0.4)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.5, 0.5)
    Local $aPBlend[4][2] = [[3]]
    $aPBlend[1][0] = 0xFF181F39
    $aPBlend[1][1] = 0
    $aPBlend[2][0] = 0xFF394D82
    $aPBlend[2][1] = 0.3
    $aPBlend[3][0] = 0xFF607CD0
    $aPBlend[3][1] = 1
    _GDIPlus_PathBrushSetPresetBlend($hBrush, $aPBlend)
    _GDIPlus_PathBrushSetGammaCorrection($hBrush, True)

    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    Local $hPath_Clone = _GDIPlus_PathClone($hPath)
    Local $hMatrix = _GDIPlus_MatrixCreate()
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -$aBounds[1])
    _GDIPlus_MatrixScale($hMatrix, 0.85, 0.6, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1], True)
    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.45, $aBounds[1] + $aBounds[3] * 0.1)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFFFFFFF)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1, 0.9)

    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath_Clone)

    $hPath_Clone = _GDIPlus_PathClone($hPath)
    _GDIPlus_MatrixSetElements($hMatrix)
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -($aBounds[1] + $aBounds[3]))
    _GDIPlus_MatrixScale($hMatrix, 0.95, 0.8, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3], True)
    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.65, $aBounds[1] + $aBounds[3] * 0.70)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFDDEEFF)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1, 0.7)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.3, 0.2)
    _GDIPlus_PathBrushSetGammaCorrection($hBrush, True)

    _GDIPlus_GraphicsSetCompositingQuality($hContext, 3)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_GraphicsSetCompositingQuality($hContext, 1)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath_Clone)

    _GDIPlus_MatrixDispose($hMatrix)
EndFunc   ;==>_Draw_Inner


Func _Draw_A($hContext, $hPath, $hBrush_Alu)
    Local $hPath_Clone = _GDIPlus_PathClone($hPath)

    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath_Clone)
    Local $hMatrix = _GDIPlus_MatrixCreate()
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -($aBounds[1] + $aBounds[3] * 0.4))
    _GDIPlus_MatrixScale($hMatrix, 1.01, 1.02, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 0.43, True)
    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFF000000)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.91, 0.91)

    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath_Clone)

    $hPath_Clone = _GDIPlus_PathClone($hPath)

    Local $hPen = _GDIPlus_PenCreate(0xDD000000, 2)
    _GDIPlus_PenSetLineJoin($hPen, 1)
    _GDIPlus_GraphicsDrawPath($hContext, $hPath, $hPen)
    _GDIPlus_PenDispose($hPen)

    Local $hBmp = _GDIPlus_BitmapCreateFromScan0($aBounds[2], $aBounds[3])
    Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBmp)
    _GDIPlus_GraphicsFillRect($hGfx, 0, 0, $aBounds[2], $aBounds[3], $hBrush_Alu)

    _GDIPlus_GraphicsSetClipPath($hContext, $hPath)

    Local $hImgAttrib = _GDIPlus_ImageAttributesCreate()
    Local $tColorMatrix = _GDIPlus_ColorMatrixCreateScale(0.8, 0.9, 1.1)
    _GDIPlus_ImageAttributesSetColorMatrix($hImgAttrib, 1, 1, DllStructGetPtr($tColorMatrix))
    _GDIPlus_GraphicsDrawImageRectRect($hContext, $hBmp, 0, 0, $aBounds[2], $aBounds[3], $aBounds[0], $aBounds[1], $aBounds[2], $aBounds[3], $hImgAttrib)
    _GDIPlus_ImageAttributesDispose($hImgAttrib)
    _GDIPlus_GraphicsResetClip($hContext)
    _GDIPlus_GraphicsDispose($hGfx)
    _GDIPlus_BitmapDispose($hBmp)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 1.2)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFFFFFFFF)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.96, 0.96)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1, 1)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 0.1)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFF000000)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.96, 0.96)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    Local $aData = _GDIPlus_PathGetData($hPath)
    Local $aPnt[6][2] = [[5]]
    $aPnt[1][0] = $aData[1][0]
    $aPnt[1][1] = $aData[1][1]
    $aPnt[2][0] = $aData[2][0]
    $aPnt[2][1] = $aData[2][1]
    $aPnt[3][0] = $aData[3][0]
    $aPnt[3][1] = $aData[3][1]
    $aPnt[4][0] = $aData[3][0] + ($aData[11][0] - $aData[3][0]) * 0.2
    $aPnt[4][1] = $aData[12][1]
    $aPnt[5][0] = $aData[12][0]
    $aPnt[5][1] = $aData[12][1]

    _GDIPlus_PathReset($hPath_Clone)
    _GDIPlus_PathAddPolygon($hPath_Clone, $aPnt)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aData[12][0] + ($aData[11][0] - $aData[12][0]) * 1.2, $aData[12][1])
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFFFFFFFF)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.985, 0.91)

    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath_Clone)

    $aData[0][0] = 5
    $aData[5][2] = 129
    $hPath_Clone = _GDIPlus_PathCreate2($aData)

    _GDIPlus_MatrixSetElements($hMatrix)
    _GDIPlus_MatrixTranslate($hMatrix, -$aData[4][0], -$aData[2][1])
    _GDIPlus_MatrixScale($hMatrix, 1.12, 1.12, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aData[4][0], $aData[2][1], True)

    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aData[4][0], $aData[2][1])

    Local $aPBlend[4][2] = [[3]]
    $aPBlend[1][0] = 0x00000000
    $aPBlend[1][1] = 0
    $aPBlend[2][0] = 0xAF000000
    $aPBlend[2][1] = 0.1
    $aPBlend[3][0] = 0
    $aPBlend[3][1] = 1
    _GDIPlus_PathBrushSetPresetBlend($hBrush, $aPBlend)

    _GDIPlus_GraphicsSetClipPath($hContext, $hPath_Clone)
    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)
    _GDIPlus_GraphicsResetClip($hContext)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath_Clone)

    _GDIPlus_MatrixDispose($hMatrix)
EndFunc   ;==>_Draw_A


Func _Draw_Outer($hContext, $hPath_O, $hPath_I, $hBrush_Alu)
    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath_I)

    Local $hPath = _GDIPlus_PathClone($hPath_O)
    Local $hMatrix = _GDIPlus_MatrixCreate()
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[2] * 0.05, $aBounds[3] * 0.05)
    _GDIPlus_PathTransform($hPath, $hMatrix)

    Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.1, $aBounds[1] + $aBounds[2] * 0.1)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFF000000)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.84, 0.92)

    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath)

    $hPath = _GDIPlus_PathClone($hPath_O)
    _GDIPlus_MatrixSetElements($hMatrix)
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.7), -($aBounds[1] + $aBounds[3] * 0.9))
    _GDIPlus_MatrixScale($hMatrix, 1.07, 1.06, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.69, $aBounds[1] + $aBounds[3] * 0.895, True)
    _GDIPlus_PathTransform($hPath, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFFFFFFF)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1, 1)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.4, 0.3)

    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)

    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath)

    $hPath = _GDIPlus_PathClone($hPath_O)
    _GDIPlus_PathAddPath($hPath, $hPath_I)
    _GDIPlus_GraphicsSetClipPath($hContext, $hPath)
    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush_Alu)
    _GDIPlus_GraphicsResetClip($hContext)
    _GDIPlus_PathDispose($hPath)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_O)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.8, $aBounds[1] + $aBounds[3] * 0.8)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.98, 0.98)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_O, $hBrush)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.2, $aBounds[1] + $aBounds[3] * 0.8)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_O, $hBrush)

    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.4, $aBounds[1])
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFF000000)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.98, 0.98)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_O, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    Local $hPath_Clone = _GDIPlus_PathClone($hPath_I)
    _GDIPlus_MatrixSetElements($hMatrix)
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -($aBounds[1] + $aBounds[3] * 0.5))
    _GDIPlus_MatrixScale($hMatrix, 1.02, 1.02, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 0.51, True)
    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFFFFFFF)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.98, 0.98)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    _GDIPlus_PathDispose($hPath_Clone)

    $hPath_Clone = _GDIPlus_PathClone($hPath_I)
    _GDIPlus_MatrixSetElements($hMatrix)
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -($aBounds[1] + $aBounds[3] * 0.5))
    _GDIPlus_MatrixScale($hMatrix, 1.02, 1.02, True)
    _GDIPlus_MatrixTranslate($hMatrix, $aBounds[0] + $aBounds[2] * 0.5, $aBounds[1] + $aBounds[3] * 0.49, True)
    _GDIPlus_PathTransform($hPath_Clone, $hMatrix)

    $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath_Clone)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0xFF000000)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.96, 0.96)
    _GDIPlus_GraphicsFillPath($hContext, $hPath_Clone, $hBrush)
    _GDIPlus_BrushDispose($hBrush)

    _GDIPlus_PathDispose($hPath_Clone)

    Local $hPen = _GDIPlus_PenCreate(0xFF000000, 2)
    _GDIPlus_GraphicsDrawPath($hContext, $hPath_I, $hPen)
    _GDIPlus_GraphicsDrawPath($hContext, $hPath_O, $hPen)
    _GDIPlus_PenDispose($hPen)

    _GDIPlus_MatrixDispose($hMatrix)
    _GDIPlus_GraphicsResetClip($hContext)
EndFunc   ;==>_Draw_Outer


Func _Draw_Light($hContext, $hPath_O, $hPath_I, $hPath_A)
    Local $hPath = _GDIPlus_PathClone($hPath_O)
    _GDIPlus_PathAddPath($hPath, $hPath_I)
    _GDIPlus_PathAddPath($hPath, $hPath_A)

    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath)
    Local $hBrush = _GDIPlus_LineBrushCreate($aBounds[0] + $aBounds[2], $aBounds[1], $aBounds[0] + $aBounds[2] * 0.8, $aBounds[1] + $aBounds[3], 0, 0xDDFFFFFF, 3)

    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1)

    Local $aBlend[8][2] = [[7]]
    $aBlend[1][0] = 0.4
    $aBlend[1][1] = 0
    $aBlend[2][0] = 0.8
    $aBlend[2][1] = 0.1
    $aBlend[3][0] = 0.3
    $aBlend[3][1] = 0.3
    $aBlend[4][0] = 0.7
    $aBlend[4][1] = 0.4
    $aBlend[5][0] = 0.3
    $aBlend[5][1] = 0.7
    $aBlend[6][0] = 0
    $aBlend[6][1] = 0.8
    $aBlend[7][0] = 0.2
    $aBlend[7][1] = 1
    _GDIPlus_LineBrushSetBlend($hBrush, $aBlend)

    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)

    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath)
EndFunc   ;==>_Draw_Light


Func _Draw_3($hContext, $hPath, $hBrush_Alu)
    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath)
    Local $hBmp = _GDIPlus_BitmapCreateFromScan0($aBounds[2] + 1, $aBounds[3] + 1)
    Local $hGfx = _GDIPlus_ImageGetGraphicsContext($hBmp)

    _GDIPlus_GraphicsFillRect($hGfx, 0, 0, $aBounds[2] + 1, $aBounds[3] + 1, $hBrush_Alu)

    Local $tColorMatrix = _GDIPlus_ColorMatrixCreateScale(1.3, 1.4, 2)
    Local $hImgAttrib = _GDIPlus_ImageAttributesCreate()
    _GDIPlus_ImageAttributesSetColorMatrix($hImgAttrib, 1, 1, DllStructGetPtr($tColorMatrix))

    _GDIPlus_GraphicsSetClipPath($hContext, $hPath)
    _GDIPlus_GraphicsDrawImageRectRect($hContext, $hBmp, 0, 0, $aBounds[2], $aBounds[3], $aBounds[0], $aBounds[1], $aBounds[2], $aBounds[3], $hImgAttrib)
    _GDIPlus_GraphicsResetClip($hContext)
    _GDIPlus_GraphicsDispose($hGfx)
    _GDIPlus_BitmapDispose($hBmp)
    _GDIPlus_ImageAttributesDispose($hImgAttrib)

    Local $aBounds = _GDIPlus_PathGetWorldBounds($hPath)
    Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
    _GDIPlus_PathBrushSetCenterPoint($hBrush, $aBounds[0] + $aBounds[2] * 0.22, $aBounds[1] + $aBounds[3] * 0.5)
    _GDIPlus_PathBrushSetCenterColor($hBrush, 0x5FFFFFFF)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFF6080FF)
    _GDIPlus_PathBrushSetFocusScales($hBrush, 0.8, 0.4)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1)

    Local $aPBlend[5][2] = [[4]]
    $aPBlend[1][0] = 0xFF8090FF
    $aPBlend[1][1] = 0
    $aPBlend[2][0] = 0x208090FF
    $aPBlend[2][1] = 0.2
    $aPBlend[3][0] = 0x00000000
    $aPBlend[3][1] = 0.25
    $aPBlend[4][0] = 0xFFFFFFFF
    $aPBlend[4][1] = 1
    _GDIPlus_PathBrushSetPresetBlend($hBrush, $aPBlend)

    _GDIPlus_GraphicsFillPath($hContext, $hPath, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
EndFunc   ;==>_Draw_3


Func _Draw_BG($hContext, $iWidth, $iHeight, $iColor1, $iColor2)
    _GDIPlus_GraphicsClear($hContext, $iColor1)
    Local $hPath = _GDIPlus_PathCreate()
    _GDIPlus_PathAddEllipse($hPath, 0, 0, $iWidth, $iHeight)
    Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
    _GDIPlus_PathBrushSetCenterColor($hBrush, $iColor2)
    _GDIPlus_PathBrushSetSurroundColor($hBrush, $iColor1)
    _GDIPlus_PathBrushSetSigmaBlend($hBrush, 1)

    _GDIPlus_GraphicsFillRect($hContext, 0, 0, $iWidth, $iHeight, $hBrush)
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_PathDispose($hPath)
EndFunc   ;==>_Draw_BG


Func _CreateAutoItLogo($iWidth, $iHeight)
    Global $aLogo[79][3] = [[78, 0, 0],[192.180, 15.750, 0],[226.790, 15.730, 3],[259.230, 24.910, 3],[287.250, 40.920, 3],[294.600, 17.470, 3],[316.500, 0.470, 3],[342.350, 0.470, 3],[374.280, 0.470, 3],[400.130, 26.320, 3], _
            [400.130, 58.250, 3],[400.130, 84.250, 3],[382.940, 106.240, 3],[359.350, 113.490, 3],[374.980, 141.270, 3],[383.930, 173.290, 3],[383.930, 207.430, 3],[383.930, 313.340, 3],[298.080, 399.190, 3],[192.180, 399.190, 3], _
            [86.320, 399.190, 3],[0.470, 313.340, 3],[0.470, 207.430, 3],[0.470, 101.570, 3],[86.320, 15.730, 3],[192.180, 15.750, 131],[192.180, 359.650, 0],[275.760, 359.210, 3],[343.950, 291.020, 3],[343.950, 207.430, 3], _
            [343.950, 123.850, 3],[275.760, 55.710, 3],[192.180, 55.710, 3],[108.590, 55.710, 3],[40.450, 123.850, 3],[40.450, 207.430, 3],[40.450, 291.020, 3],[108.590, 359.210, 3],[192.180, 359.650, 131],[142.450, 263.800, 0], _
            [170.520, 225.280, 1],[234.980, 225.280, 1],[192.790, 164.960, 1],[122.250, 263.470, 1],[67.250, 263.470, 1],[163.590, 129.220, 1],[179.650, 107.080, 3],[207.390, 106.380, 3],[223.300, 129.220, 3],[317.200, 263.470, 1], _
            [142.450, 263.800, 1],[355.481, 44.846, 0],[362.130, 44.845, 3],[361.952, 52.088, 3],[355.481, 52.088, 3],[325.026, 52.089, 1],[333.159, 63.310, 1],[355.719, 63.310, 1],[361.715, 63.427, 3],[361.595, 70.254, 3], _
            [355.719, 70.254, 3],[313.153, 70.256, 1],[323.245, 83.970, 1],[355.006, 83.970, 1],[366.167, 83.908, 3],[371.688, 80.524, 3],[374.122, 74.588, 3],[376.674, 68.354, 3],[374.359, 61.052, 3],[368.066, 58.381, 3], _
            [378.040, 54.937, 3],[376.437, 43.954, 3],[375.072, 40.511, 3],[372.223, 33.447, 3],[364.208, 31.250, 3],[355.362, 31.250, 3],[310.660, 31.252, 1],[320.692, 44.846, 1],[355.481, 44.846, 129]]

    Local $hPath_Logo = _GDIPlus_PathCreate2($aLogo)

    Local $hIter = _GDIPlus_PathIterCreate($hPath_Logo)
    Local $iIterCnt = _GDIPlus_PathIterGetSubpathCount($hIter)
    Local $aPath_Logo[$iIterCnt + 1] = [$iIterCnt]

    For $i = 1 To $iIterCnt
        $aPath_Logo[$i] = _GDIPlus_PathCreate()
        _GDIPlus_PathIterNextSubpathPath($hIter, $aPath_Logo[$i])
    Next
    _GDIPlus_PathIterDispose($hIter)

    Local $aBounds = _GDIPlus_PathGetWorldBounds($aPath_Logo[2])

    Local $fScale = ($iHeight * 0.5) / $aBounds[3]
    Local $hMatrix = _GDIPlus_MatrixCreate()
    _GDIPlus_MatrixTranslate($hMatrix, -($aBounds[0] + $aBounds[2] * 0.5), -($aBounds[1] + $aBounds[3] * 0.5))
    _GDIPlus_MatrixScale($hMatrix, $fScale, $fScale, True)
    _GDIPlus_MatrixTranslate($hMatrix, $iWidth * 0.5, $iHeight * 0.5, True)

    For $i = 1 To $aPath_Logo[0]
        _GDIPlus_PathTransform($aPath_Logo[$i], $hMatrix)
    Next
    _GDIPlus_MatrixDispose($hMatrix)

    Local $hBrush_Alu = _CreateAluTexture(400, 400)

    Local $hBitmap = _GDIPlus_BitmapCreateFromScan0($iWidth, $iHeight)
    Local $hContext = _GDIPlus_ImageGetGraphicsContext($hBitmap)
    _GDIPlus_GraphicsSetSmoothingMode($hContext, 2)

    _Draw_BG($hContext, $iWidth, $iHeight, 0xFF1E375A, 0xFF325A88)
    _Draw_Outer($hContext, $aPath_Logo[1], $aPath_Logo[2], $hBrush_Alu)
    _Draw_Inner($hContext, $aPath_Logo[2])
    _Draw_A($hContext, $aPath_Logo[3], $hBrush_Alu)
    _Draw_3($hContext, $aPath_Logo[4], $hBrush_Alu)
    _Draw_Light($hContext, $aPath_Logo[1], $aPath_Logo[2], $aPath_Logo[3])

    _GDIPlus_BrushDispose($hBrush_Alu)
    _GDIPlus_PathDispose($hPath_Logo)
    For $i = 1 To $aPath_Logo[0]
        _GDIPlus_PathDispose($aPath_Logo[$i])
    Next
    _GDIPlus_GraphicsDispose($hContext)
    Return $hBitmap
EndFunc   ;==>_CreateAutoItLogo


Func _CreateAluTexture($iW, $iH, $iBlurDist = 14, $fBlurTrans = 0.6)
    $iBlurDist = Ceiling($iBlurDist)
    $iBlurDist += 1 - Mod($iBlurDist, 2)

    Local $iOverSize = 0
    For $i = 1 To $iBlurDist Step 2
        $iOverSize += $i + $i + 1
    Next

    Local $iWO = $iW + $iOverSize

    Local $iNoiseSize = 40
    Local $hBmp_Noise = _GDIPlus_BitmapCreateFromScan0($iNoiseSize, $iNoiseSize)
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
            $iAmp = Random(0x4F, 0xFF, 1)
            DllStructSetData($tPixel, 1, BitOR(0xFF000000, BitShift($iAmp, -16), BitShift($iAmp, -8), $iAmp), $row * $iWidth + $col + 1)
        Next
    Next
    _GDIPlus_BitmapUnlockBits($hBmp_Noise, $tData)

    Local $hBmp_Full = _GDIPlus_BitmapCreateFromScan0($iWO, $iH)
    Local $hGfx_Full = _GDIPlus_ImageGetGraphicsContext($hBmp_Full)
    _GDIPlus_GraphicsSetSmoothingMode($hGfx_Full, 2)
    _GDIPlus_GraphicsSetInterpolationMode($hGfx_Full, 7)

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

    Local $hBmp_Full2 = _GDIPlus_BitmapCreateFromScan0($iWO, $iH)
    Local $hGfx_Full2 = _GDIPlus_ImageGetGraphicsContext($hBmp_Full2)
    _GDIPlus_GraphicsSetSmoothingMode($hGfx_Full2, 2)
    _GDIPlus_GraphicsSetInterpolationMode($hGfx_Full2, 7)

    Local $tColorMatrix = _GDIPlus_ColorMatrixCreateScale(1, 1, 1, $fBlurTrans)
    Local $hImgAttrib = _GDIPlus_ImageAttributesCreate()
    _GDIPlus_ImageAttributesSetColorMatrix($hImgAttrib, 1, 1, DllStructGetPtr($tColorMatrix), 0, 0)

    For $i = 1 To $iBlurDist Step 2
        _GDIPlus_GraphicsDrawImageRectRect($hGfx_Full2, $hBmp_Full, 0, 0, $iWO, $iH, $i, 0, $iWO, $iH, $hImgAttrib)
        _GDIPlus_GraphicsDrawImageRectRect($hGfx_Full, $hBmp_Full2, 0, 0, $iWO, $iH, $i + 1, 0, $iWO, $iH, $hImgAttrib)
    Next
    _GDIPlus_ImageAttributesDispose($hImgAttrib)

    _GDIPlus_GraphicsDispose($hGfx_Full2)
    _GDIPlus_BitmapDispose($hBmp_Full2)
    _GDIPlus_GraphicsDispose($hGfx_Full)

    Local $hTXT_Alu = _GDIPlus_TextureCreate2($hBmp_Full, $iOverSize, 0, $iW, $iH, 3)
    _GDIPlus_BitmapDispose($hBmp_Full)

    Return $hTXT_Alu
EndFunc   ;==>_CreateAluTexture