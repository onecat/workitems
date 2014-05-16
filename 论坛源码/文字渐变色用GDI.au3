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
#include <GuiConstants.au3>
;#include <WinAPI.au3>
;#include <WindowsConstants.au3>

Local $iX = 40, $iY = 20, $iWidth = 400, $iHeight = 120

$hGui = GUICreate("Paths", 480, 440)
GUISetState()

_GDIPlus_Startup()

$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)
_GDIPlus_GraphicsClear($hGraphic, 0xFFFFFF00) ; set background color

;**********************
; Create Line Brush Using minimum number of settings- Brush size same size as Rectangle to fill
$hBrushLin = GDIPlus_CreateLineBrushFromRect(0,20, $iWidth, $iHeight,-1,-1)

;Fill a rectangle using the above brush
_GDIPlus_GraphicsFillRect($hGraphic, $iX, $iY, $iWidth, $iHeight, $hBrushLin)
;***************************

; Factors & Positions Arrays to be used in next two brushes
Local $aFact[4]  = [0.0, 0.3, 0.6, 1.0]
Local $aPosit[4] = [0.0, 0.2, 0.6, 1.0]

;Create another Line Brush with parameters - brush size 200 by 60
$hBrushLin1 = GDIPlus_CreateLineBrushFromRect(1000,1000, $iWidth/2, $iHeight/2, $aFact, $aPosit, _
                                                        0xB00000FF, 0xFFFF0000, 0x00000001, 3)
;Fill a rectangle using the above brush              
_GDIPlus_GraphicsFillRect($hGraphic, $iX, $iY + $iHeight + 20, $iWidth, $iHeight, $hBrushLin1)

;**************************
;Create another Line Brush with parameters - brush size is 400/12 x 120/8 = 33.3 by 15
$hBrushLin2 = GDIPlus_CreateLineBrushFromRect($iX, $iY, $iWidth/12, $iHeight/8, $aFact, $aPosit, _
                                                        0xFFFF0000, 0xFF00FFFF, 0x00000003, 23)
;Fill a rectangle using the above brush              
_GDIPlus_GraphicsFillRect($hGraphic, $iX, $iY + ($iHeight*2) + 40, $iWidth, $iHeight, $hBrushLin2)
;***************************

_GDIPlus_BrushDispose($hBrushLin2)
_GDIPlus_BrushDispose($hBrushLin1)
_GDIPlus_BrushDispose($hBrushLin)
_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_Shutdown()

Do
    Sleep(25)
Until GUIGetMsg() = $GUI_EVENT_CLOSE

;==== GDIPlus_CreateLineBrushFromRect ===
;Description - Creates a LinearGradientBrush object from a set of boundary points and boundary colors.
; $aFactors - If non-array, default array will be used.
;           Pointer to an array of real numbers that specify blend factors. Each number in the array
;           specifies a percentage of the ending color and should be in the range from 0.0 through 1.0.
;$aPositions - If non-array, default array will be used.
;            Pointer to an array of real numbers that specify blend factors' positions. Each number in the array
;            indicates a percentage of the distance between the starting boundary and the ending boundary
;            and is in the range from 0.0 through 1.0, where 0.0 indicates the starting boundary of the
;            gradient and 1.0 indicates the ending boundary. There must be at least two positions
;            specified: the first position, which is always 0.0, and the last position, which is always
;            1.0. Otherwise, the behavior is undefined. A blend position between 0.0 and 1.0 indicates a
;            line, parallel to the boundary lines, that is a certain fraction of the distance from the
;            starting boundary to the ending boundary. For example, a blend position of 0.7 indicates
;            the line that is 70 percent of the distance from the starting boundary to the ending boundary.
;            The color is constant on lines that are parallel to the boundary lines.
; $iArgb1    - First Top color in 0xAARRGGBB format
; $iArgb2    - Second color in 0xAARRGGBB format
; $LinearGradientMode -  LinearGradientModeHorizontal       = 0x00000000,
;                        LinearGradientModeVertical         = 0x00000001,
;                        LinearGradientModeForwardDiagonal  = 0x00000002,
;                        LinearGradientModeBackwardDiagonal = 0x00000003
; $WrapMode  - WrapModeTile       = 0,
;              WrapModeTileFlipX  = 1,
;              WrapModeTileFlipY  = 2,
;              WrapModeTileFlipXY = 3,
;              WrapModeClamp      = 4
; GdipCreateLineBrushFromRect(GDIPCONST GpRectF* rect, ARGB color1, ARGB color2,
;             LinearGradientMode mode, GpWrapMode wrapMode, GpLineGradient **lineGradient)
; Reference:  http://msdn.microsoft.com/en-us/library/ms534043(VS.85).aspx
;
Func GDIPlus_CreateLineBrushFromRect($iX, $iY, $iWidth, $iHeight, $aFactors, $aPositions, _
        $iArgb1 = 0xFF0000FF, $iArgb2 = 0xFFFF0000, $LinearGradientMode = 0x00000001, $WrapMode = 0)

    Local $tRect, $pRect, $aRet, $tFactors, $pFactors, $tPositions, $pPositions, $iCount,$hStatus

    If $iArgb1 = -1 Then $iArgb1 = 0xFF0000FF
    If $iArgb2 = -1 Then $iArgb2 = 0xFFFF0000
    If $LinearGradientMode = -1 Then $LinearGradientMode = 0x00000001
    If $WrapMode = -1 Then $WrapMode = 1

    $tRect = DllStructCreate("float X;float Y;float Width;float Height")
    $pRect = DllStructGetPtr($tRect)
    DllStructSetData($tRect, "X", $iX)
    DllStructSetData($tRect, "Y", $iY)
    DllStructSetData($tRect, "Width", $iWidth)
    DllStructSetData($tRect, "Height", $iHeight)

    ;Note: Withn _GDIPlus_Startup(), $ghGDIPDll is defined
    $aRet = DllCall($ghGDIPDll, "int", "GdipCreateLineBrushFromRect", "ptr", $pRect, "int", $iArgb1, _
            "int", $iArgb2, "int", $LinearGradientMode, "int", $WrapMode, "int*", 0)

    If IsArray($aFactors) = 0 Then Dim $aFactors[4] = [0.0, 0.4, 0.6, 1.0]
    If IsArray($aPositions) = 0 Then Dim $aPositions[4] = [0.0, 0.3, 0.7, 1.0]

    $iCount = UBound($aPositions)
    $tFactors = DllStructCreate("float[" & $iCount & "]")
    $pFactors = DllStructGetPtr($tFactors)
    For $iI = 0 To $iCount - 1
        DllStructSetData($tFactors, 1, $aFactors[$iI], $iI + 1)
    Next
    $tPositions = DllStructCreate("float[" & $iCount & "]")
    $pPositions = DllStructGetPtr($tPositions)
    For $iI = 0 To $iCount - 1
        DllStructSetData($tPositions, 1, $aPositions[$iI], $iI + 1)
    Next

    $hStatus = DllCall($ghGDIPDll, "int", "GdipSetLineBlend", "hwnd", $aRet[6], _
            "ptr", $pFactors, "ptr", $pPositions, "int", $iCount)
    Return $aRet[6] ; Handle of Line Brush
EndFunc   ;==>GDIPlus_CreateLineBrushFromRect