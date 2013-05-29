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

#include <APIConstants.au3>
#include <WinAPIEx.au3>
#include <GDIPlus.au3>
#include <GDIPlusEx.au3>
 
Global $rectx = 5, $recty = 5, $rectw = 100, $recth = 100
Global $brushx = $rectx, $brushy = $recty, $brushw = 50, $brushh = 50
GUICreate("第十讲之分解1-渐变画刷", 500, 400)
$nCtrlId = GUICtrlCreatePic("", 0, 0, 500, 200)
$hPicWnd = GUICtrlGetHandle($nCtrlId)
 
Global $rect[4][2], $brush[4][2]
init()
GUIRegisterMsg($WM_HSCROLL, "onHSCROLL")
GUISetState()
 
update()
 
While 1
        $Msg = GUIGetMsg()
        Switch $Msg
                Case -3
                        ExitLoop
        EndSwitch
WEnd
 
GUIDelete()
Exit
 
Func init()
        GUICtrlCreateLabel("矩形起点X", 5, 205)
        $rect[0][0] = GUICtrlCreateSlider(60, 205, 100)
        GUICtrlSetLimit(-1, $rectx, 0)
        GUICtrlSetData(-1, $rectx)
        $rect[0][1] = GUICtrlCreateLabel("", 170, 205, 40, 25)
        GUICtrlSetData(-1, $rectx)
 
        GUICtrlCreateLabel("矩形起点Y", 5, 235)
        $rect[1][0] = GUICtrlCreateSlider(60, 235, 100)
        GUICtrlSetLimit(-1, $recty, 0)
        GUICtrlSetData(-1, $recty)
        $rect[1][1] = GUICtrlCreateLabel("", 170, 235, 40, 25)
        GUICtrlSetData(-1, $recty)
 
        GUICtrlCreateLabel("矩形宽度W", 5, 265)
        $rect[2][0] = GUICtrlCreateSlider(60, 265, 100)
        GUICtrlSetLimit(-1, $rectw, 40)
        GUICtrlSetData(-1, $rectw)
        $rect[2][1] = GUICtrlCreateLabel("", 170, 265, 40, 25)
        GUICtrlSetData(-1, $rectw)
 
        GUICtrlCreateLabel("矩形高度H", 5, 295)
        $rect[3][0] = GUICtrlCreateSlider(60, 295, 100)
        GUICtrlSetLimit(-1, $recth, 40)
        GUICtrlSetData(-1, $recth)
        $rect[3][1] = GUICtrlCreateLabel("", 170, 295, 40, 25)
        GUICtrlSetData(-1, $recth)
 
        GUICtrlCreateLabel("画刷起点X", 255, 205)
        $brush[0][0] = GUICtrlCreateSlider(310, 205, 100)
        GUICtrlSetLimit(-1, $brushx, 0)
        GUICtrlSetData(-1, $brushx)
        $brush[0][1] = GUICtrlCreateLabel("", 420, 205, 40, 25)
        GUICtrlSetData(-1, $brushx)
 
        GUICtrlCreateLabel("画刷起点Y", 255, 235)
        $brush[1][0] = GUICtrlCreateSlider(310, 235, 100)
        GUICtrlSetLimit(-1, $brushy, 0)
        GUICtrlSetData(-1, $brushy)
        $brush[1][1] = GUICtrlCreateLabel("", 420, 235, 40, 25)
        GUICtrlSetData(-1, $brushy)
 
        GUICtrlCreateLabel("画刷宽度W", 255, 265)
        $brush[2][0] = GUICtrlCreateSlider(310, 265, 100)
        GUICtrlSetLimit(-1, 110, 0)
        GUICtrlSetData(-1, $brushw)
        $brush[2][1] = GUICtrlCreateLabel("", 420, 265, 40, 25)
        GUICtrlSetData(-1, $brushw)
 
        GUICtrlCreateLabel("画刷高度H", 255, 295)
        $brush[3][0] = GUICtrlCreateSlider(310, 295, 100)
        GUICtrlSetLimit(-1, 110, 0)
        GUICtrlSetData(-1, $brushh)
        $brush[3][1] = GUICtrlCreateLabel("", 420, 295, 40, 25)
        GUICtrlSetData(-1, $brushh)
EndFunc   ;==>init
 
Func onHSCROLL($hWnd, $iMsg, $wParam, $lParam)
        Switch $lParam
                Case GUICtrlGetHandle($rect[0][0])
                        $rectx = GUICtrlRead($rect[0][0])
                        GUICtrlSetData($rect[0][1], $rectx)
                Case GUICtrlGetHandle($rect[1][0])
                        $recty = GUICtrlRead($rect[1][0])
                        GUICtrlSetData($rect[1][1], $recty)
                Case GUICtrlGetHandle($rect[2][0])
                        $rectw = GUICtrlRead($rect[2][0])
                        GUICtrlSetData($rect[2][1], $rectw)
                Case GUICtrlGetHandle($rect[3][0])
                        $recth = GUICtrlRead($rect[3][0])
                        GUICtrlSetData($rect[3][1], $recth)
                Case GUICtrlGetHandle($brush[0][0])
                        $brushx = GUICtrlRead($brush[0][0])
                        GUICtrlSetData($brush[0][1], $brushx)
                Case GUICtrlGetHandle($brush[1][0])
                        $brushy = GUICtrlRead($brush[1][0])
                        GUICtrlSetData($brush[1][1], $brushy)
                Case GUICtrlGetHandle($brush[2][0])
                        $brushw = GUICtrlRead($brush[2][0])
                        GUICtrlSetData($brush[2][1], $brushw)
                Case GUICtrlGetHandle($brush[3][0])
                        $brushh = GUICtrlRead($brush[3][0])
                        GUICtrlSetData($brush[3][1], $brushh)
        EndSwitch
        update()
EndFunc   ;==>onHSCROLL
 
Func update()
        Local $HWND_CX = _WinAPI_GetWindowWidth($hPicWnd)
        Local $HWND_CY = _WinAPI_GetWindowHeight($hPicWnd)
        _GDIPlus_Startup()
        $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hPicWnd)
        $hBitmap = _GDIPlus_BitmapCreateFromGraphics($HWND_CX, $HWND_CY, $hGraphics)
        $hBackbuffer = _GDIPlus_ImageGetGraphicsContext($hBitmap)
        _GDIPlus_GraphicsClear($hBackbuffer, 0xFFECE9D8)
        _GDIPlus_GraphicsSetSmoothingMode($hBackbuffer, 2);光滑模式，2为8*8抗距齿
        lineBrushComp($hBackbuffer)
        _GDIPlus_GraphicsDrawImageRect($hGraphics, $hBitmap, 0, 0, $HWND_CX, $HWND_CY)
        _GDIPlus_BitmapDispose($hBitmap)
        _GDIPlus_GraphicsDispose($hBackbuffer)
        _GDIPlus_GraphicsDispose($hGraphics)
        _GDIPlus_Shutdown()
EndFunc   ;==>update
 
Func lineBrushComp($hGraphics)
        Local $hPen = _GDIPlus_PenCreate(0xFFFFFFFF, 2)
        Local $hPath = _GDIPlus_PathCreate()
        ;$rectx, $recty, $rectw, $recth分别是矩形路径的起点XY坐标，及宽高
        _GDIPlus_PathAddRectangle($hPath, $rectx, $recty, $rectw, $recth)
        Local $hBrush
        ;下面是4种填充方式的对比，0是不翻转，1是水平翻转，2 是垂直翻转，3是水平垂直均翻转,其中4是不铺设，所以不演示了
        ;水平翻转就是到超过画刷高到第二行时，水平翻转
        ;垂直翻转就是到超过画刷宽到第二列时，垂直翻转
        ;对于线性渐变画刷，只有翻转或者不翻转，所以0，2是翻转，1，3是翻转
        ;$brushx, $brushy, $brushw, $brushh分别是我设置的画刷的起点XY及宽高
        ;_GDIPlus_LineBrushCreate函数的参数是起点XY及终点XY，所以终点的XY用了起点+宽高
        Local $endx = $brushw + $brushx, $endy = $brushh + $brushy
        ;============================================================
        ;说明：当画刷起点和填充的起点一至时，填充效果最容易控制，自己在界面上拉动体会一下
        ;============================================================
        
        For $i = 0 To 3
                $hBrush = _GDIPlus_LineBrushCreate($brushx, $brushy, $endx, $endy, 0xFFFFFFFF, 0xFFFF0000, $i)
                _GraphicsFillPath($hGraphics, $hPath, $hBrush)
                _GraphicsDrawPath($hGraphics, $hPath, $hPen)
                _GDIPlus_BrushDispose($hBrush)
                _GraphicsDrawString($hGraphics, "渐变" & $i, $rectx, $recty + $recth + 10)
                _GDIPlus_GraphicsTranslateTransform($hGraphics, $rectx + $rectw + 10, 0)
        Next
        _GDIPlus_PathDispose($hPath)
        _GDIPlus_PenDispose($hPen)
        
        ;复位画布
        _GDIPlus_GraphicsResetTransform($hGraphics)
        _GDIPlus_GraphicsTranslateTransform($hGraphics, 0, $recty + $recth + 40)
        ;================================绘制原画刷样子
        $hPath = _GDIPlus_PathCreate()
        ;防止画刷宽高为0时，看不到刷子，当为0时，设置为1粗细
        Local $brushrectw = $brushw, $brushrecth = $brushh
        If $brushw = 0 Then $brushrectw += 1
        If $brushh = 0 Then $brushrecth += 1
        _GDIPlus_PathAddRectangle($hPath, $brushx, $brushy, $brushrectw, $brushrecth)
        $hBrush = _GDIPlus_LineBrushCreate($brushx, $brushy, $endx, $endy, 0xFFFFFFFF, 0xFFFF0000)
        _GraphicsFillPath($hGraphics, $hPath, $hBrush)
        _GDIPlus_BrushDispose($hBrush)
        _GDIPlus_PathDispose($hPath)
EndFunc   ;==>String1
 
;_GDIPlus_GraphicsDrawString这个函数，我认为他没有设置$hBrush,所以我改成这样就可以用不同的画刷了
Func _GraphicsDrawString($hGraphics, $sString, $nX, $nY, $hBrush = 0, $sFont = "Arial", $nSize = 10, $iFormat = 0)
        Local $hFormat = _GDIPlus_StringFormatCreate($iFormat)
        Local $hFamily = _GDIPlus_FontFamilyCreate($sFont)
        Local $hFont = _GDIPlus_FontCreate($hFamily, $nSize)
        Local $tLayout = _GDIPlus_RectFCreate($nX, $nY, 0, 0)
        Local $aInfo = _GDIPlus_GraphicsMeasureString($hGraphics, $sString, $hFont, $tLayout, $hFormat)
        __GDIPlus_BrushDefCreate($hBrush)
        Local $aResult = _GDIPlus_GraphicsDrawStringEx($hGraphics, $sString, $hFont, $aInfo[0], $hFormat, $hBrush)
        Local $iError = @error
        __GDIPlus_BrushDefDispose()
        _GDIPlus_FontDispose($hFont)
        _GDIPlus_FontFamilyDispose($hFamily)
        _GDIPlus_StringFormatDispose($hFormat)
        Return SetError($iError, 0, $aResult)
EndFunc   ;==>_GraphicsDrawString
 
;下面这两个描路径和填充路径，在3.3.9.5中已经更正了，我用的是3.3.7.15画笔和画刷设置不对，可以改成这样的就行了
Func _GraphicsDrawPath($hGraphics, $hPath, $hPen = 0)
        Local $iTmpErr, $iTmpExt, $aResult
 
        __GDIPlus_PenDefCreate($hPen)
 
        $aResult = DllCall($ghGDIPDll, "uint", "GdipDrawPath", "hwnd", $hGraphics, "hwnd", $hPen, "hwnd", $hPath)
        $iTmpErr = @error
        $iTmpExt = @extended
 
        __GDIPlus_PenDefDispose()
 
        If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
        $GDIP_STATUS = $aResult[0]
        Return $aResult[0] = 0
EndFunc   ;==>_GraphicsDrawPath
 
Func _GraphicsFillPath($hGraphics, $hPath, $hBrush = 0)
        Local $iTmpErr, $iTmpExt, $aResult
 
        __GDIPlus_BrushDefCreate($hBrush)
 
        $aResult = DllCall($ghGDIPDll, "uint", "GdipFillPath", "hwnd", $hGraphics, "hwnd", $hBrush, "hwnd", $hPath)
        $iTmpErr = @error
        $iTmpExt = @extended
 
        __GDIPlus_BrushDefDispose()
 
        If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
        $GDIP_STATUS = $aResult[0]
        Return $aResult[0] = 0
EndFunc   ;==>_GraphicsFillPath
