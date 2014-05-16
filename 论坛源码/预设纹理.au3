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
#include <WindowsConstants.au3>
#include <Misc.au3>
;#include <WinAPI.au3>

Global $hGraphicGUI, $hBMPBuff, $aLables
Global $hGraphic, $hBrushHatch, $hGui, $ButExit, $ButForeCol, $ButBkGndCol
Global $iX = 10, $iY = 10, $iWidth = 50, $iHeight = 50
Global $GuiSizeX = 560, $GuiSizeY = 560, $ColorBack = 0xFFFFFFFF, $colorFore = 0xFF000000
Global $aHatchStyle[53] = ["HathStyleHorizontal = 0x00000000", _
                            "HathStyleVertical = 0x00000001", _
                            "HathStyleForwardDiagonal = 0x00000002", _
                            "HathStyleBackwardDiagonal = 0x00000003", _
                            "HathStyleCross / HathStyleLargeGrid = 0x00000004", _
                            "HathStyleDiagonalCross = 0x00000005", _
                            "HathStyle05Percent = 0x00000006", _
                            "HathStyle10Percent = 0x00000007", _
                            "HathStyle20Percent = 0x00000008", _
                            "HathStyle25Percent = 0x00000009", _
                            "HathStyle30Percent = 0x0000000A", _
                            "HathStyle40Percent = 0x0000000B", _
                            "HathStyle50Percent = 0x0000000C", _
                            "HathStyle60Percent = 0x0000000D", _
                            "HathStyle70Percent = 0x0000000E", _
                            "HathStyle75Percent = 0x0000000F", _
                            "HathStyle80Percent = 0x00000010", _
                            "HathStyle90Percent = 0x00000011", _
                            "HathStyleLightDownwardDiagonal = 0x00000012", _
                            "HathStyleLightUpwardDiagonal = 0x00000013", _
                            "HathStyleDarkDownwardDiagonal = 0x00000014", _
                            "HathStyleDarkUpwardDiagonal = 0x00000015", _
                            "HathStyleWideDownwardDiagonal = 0x00000016", _
                            "HathStyleWideUpwardDiagonal = 0x00000017", _
                            "HathStyleLightVertical = 0x00000018", _
                            "HathStyleLightHorizontal = 0x00000019", _
                            "HathStyleNarrowVertical = 0x0000001A", _
                            "HathStyleNarrowHorizontal = 0x0000001B", _
                            "HathStyleDarkVertical = 0x0000001C", _
                            "HathStyleDarkHorizontal = 0x0000001D", _
                            "HathStyleDashedDownwardDiagonal = 0x0000001E", _
                            "HathStyleDashedUpwardDiagonal = 0x0000001F", _
                            "HathStyleDashedHorizontal = 0x00000020", _
                            "HathStyleDashedVertical = 0x00000021", _
                            "HathStyleSmallConfetti = 0x00000022", _
                            "HathStyleLargeConfetti = 0x00000023", _
                            "HathStyleZigZag = 0x00000024", _
                            "HathStyleWave = 0x00000025", _
                            "HathStyleDiagonalBrick = 0x00000026", _
                            "HathStyleHorizontalBrick = 0x00000027", _
                            "HathStyleWeave = 0x00000028", _
                            "HathStylePlaid = 0x00000029", _
                            "HathStyleDivot = 0x0000002A", _
                            "HathStyleDottedGrid = 0x0000002B", _
                            "HathStyleDottedDiamond = 0x0000002C", _
                            "HathStyleShingle = 0x0000002D", _
                            "HathStyleTrellis = 0x0000002E", _
                            "HathStyleSphere = 0x0000002F", _
                            "HathStyleSmallGrid = 0x00000030", _
                            "HathStyleSmallCheckerBoard = 0x00000031", _
                            "HathStyleLargeCheckerBoard = 0x00000032", _
                            "HathStyleOutlinedDiamond = 0x00000033", _
                            "HathStyleSolidDiamond = 0x00000034"]
Local $col

$hGui = GUICreate("Hatch Brushes", $GuiSizeX, $GuiSizeY)
$SliderForeAlpha = GUICtrlCreateSlider( 10, $GuiSizeY-112, 230, 18)
GUICtrlSetLimit(-1, 255, 0)
GUICtrlSetData ($SliderForeAlpha,BitAND(BitShift($colorFore,24),0x000000FF))
GUICtrlCreateLabel("Fore Ground Color Alpha Channel Adjust",20,$GuiSizeY-90)

$SliderBackAlpha = GUICtrlCreateSlider( 245, $GuiSizeY-112, 230, 18)
GUICtrlSetLimit(-1, 255, 0)
GUICtrlSetData ($SliderBackAlpha,BitAND(BitShift($ColorBack,24),0x000000FF))
GUICtrlCreateLabel("Back Ground Color Alpha Channel Adjust",255,$GuiSizeY-90)

$ButForeCol = GUICtrlCreateButton("Fore Ground Color" & @CRLF & "   0x" & Hex($colorFore), 70, $GuiSizeY - 70, 100, 40, 0x2000)
$ButBkGndCol = GUICtrlCreateButton("Back Ground Color" & @CRLF & "   0x" & Hex($ColorBack), 310, $GuiSizeY - 70, 100, 40, 0x2000)
$ButExit = GUICtrlCreateButton("Exit", $GuiSizeX - 60, $GuiSizeY - 70, 50, 30)
$Input = GUICtrlCreateInput ("GDIPlus_CreateHatchBrush(0x??," & "0x" & Hex($colorFore) & "," & "0x" & Hex($ColorBack) & ")", 120,$GuiSizeY - 25,300,20)
GUISetState()

_GDIPlus_Startup()
Draw()

; Create Double Buffer, so the doesn't need to be repainted on PAINT-Event
GUIRegisterMsg(0xF, "MY_PAINT"); Register PAINT-Event 0x000F = $WM_PAINT (WindowsConstants.au3)
_WinAPI_RedrawWindow($hGui, 0, 0, 2) ;PAINT the window Flag $RDW_INTERNALPAINT = 0x0002
;End Double Buffer add-in 2 of 3

While 1
    $msg = GUIGetMsg()
    Switch $msg
        Case $GUI_EVENT_CLOSE, $ButExit
            CleanUp()
            ExitLoop
        Case $ButForeCol
            $col = _ChooseColor(2, "0x" & Hex(BitAND($colorFore,0x00FFFFFF),6 ),2)
            If $col <> -1 Then
                $colorFore = "0x" & Hex(BitOR(BitAND($colorFore, 0xFF000000), BitAND($col, 0x00FFFFFF)))
                ;_GDIPlus_GraphicsClear($hGraphic, 0x00000000)
                GUICtrlSetData($ButForeCol, "Fore Ground Color" & @CRLF & "   0x" & Hex($colorFore))
                GUICtrlSetData ($Input,"GDIPlus_CreateHatchBrush(0x??," & "0x" & Hex($colorFore) & "," & "0x" & Hex($ColorBack) & ")")
                CleanUp()
                Draw()
            EndIf           
        Case $ButBkGndCol
            $col = _ChooseColor(2, "0x" & Hex(BitAND($ColorBack,0x00FFFFFF),6 ),2)
            If $col <> -1 Then
                $ColorBack = "0x" & Hex(BitOR(BitAND($ColorBack, 0xFF000000), BitAND($col, 0x00FFFFFF)))
                ;ConsoleWrite("$col " & $col & "   $ButBkGndCol " & $ButBkGndCol & @CRLF)
                ;_GDIPlus_GraphicsClear($hGraphic, 0x00000000)
                GUICtrlSetData($ButBkGndCol, "Back Ground Color" & @CRLF & "   0x" & Hex($ColorBack))
                GUICtrlSetData ($Input,"GDIPlus_CreateHatchBrush(0x??," & "0x" & Hex($colorFore) & "," & "0x" & Hex($ColorBack) & ")")
                CleanUp()
                Draw()
            EndIf   
        Case $SliderForeAlpha
            $colorFore = "0x" & Hex(BitOR(BitShift(GUICtrlRead($SliderForeAlpha), -24), BitAND($colorFore, 0x00FFFFFF)))
            ;_GDIPlus_GraphicsClear($hGraphic, 0x00000000)
            GUICtrlSetData($ButForeCol, "Fore Ground Color" & @CRLF & "   0x" & Hex($colorFore))
            GUICtrlSetData ($Input,"GDIPlus_CreateHatchBrush(0x??," & "0x" & Hex($colorFore) & "," & "0x" & Hex($ColorBack) & ")")          
            CleanUp()
            Draw()
            WinSetState ("Hatch Brushes","", @SW_HIDE  )
            WinSetState ("Hatch Brushes","", @SW_SHOW )
        Case $SliderBackAlpha   
            $ColorBack = "0x" & Hex(BitOR(BitShift(GUICtrlRead($SliderBackAlpha), -24), BitAND($ColorBack, 0x00FFFFFF)))
            ;_GDIPlus_GraphicsClear($hGraphic, 0x00000000)
            GUICtrlSetData($ButBkGndCol, "Back Ground Color" & @CRLF & "   0x" & Hex($ColorBack))
            GUICtrlSetData ($Input,"GDIPlus_CreateHatchBrush(0x??," & "0x" & Hex($colorFore) & "," & "0x" & Hex($ColorBack) & ")")          
            CleanUp()
            Draw()
            WinSetState ("Hatch Brushes","", @SW_HIDE  )
            WinSetState ("Hatch Brushes","", @SW_SHOW )
    EndSwitch
    $msg = ""
    Sleep(10)
WEnd 
_GDIPlus_Shutdown()
;====================> The End ============

; 
Func Draw()     
    dim $aLables[UBound($aHatchStyle)]
    dim $aTip[UBound($aHatchStyle)]
    
    ; Create Double Buffer, so the doesn't need to be repainted on PAINT-Event
    $hGraphicGUI = _GDIPlus_GraphicsCreateFromHWND($hGui)
    $hBMPBuff = _GDIPlus_BitmapCreateFromGraphics($GuiSizeX, $GuiSizeY - 112, $hGraphicGUI)
    $hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)
    ;End Double Buffer add-in 1 of 3
    
    ;_GDIPlus_GraphicsClear($hGraphic, 0x80FFFF80)
    $hBrushHatch = GDIPlus_CreateHatchBrush(Hex(0), $colorFore, $ColorBack) 
    _GDIPlus_GraphicsFillRect($hGraphic, $iX, $iY, $iWidth, $iHeight, $hBrushHatch)
    $aLables[0] = GUICtrlCreateLabel("No. 0x" & Hex(0, 2), $iX, $iY + 53)
    $aTip[0]    = GUICtrlSetTip(-1, $aHatchStyle[0])
    _GDIPlus_BrushDispose($hBrushHatch)
    
    For $x = 1 To UBound($aHatchStyle) - 1 step 0x01
        If Mod($x, 9) = 0 Then  ; 15 squares per row
            $iX  = 10             ; New row start x coordinate at
            $iY += 73            ; New row drop  y coordinate by this amount 
        Else
            $iX += 60            ; Increase x coordinate along row
        EndIf
        $hBrushHatch = GDIPlus_CreateHatchBrush("0x" & Hex($x,2), $colorFore, $ColorBack)
        _GDIPlus_GraphicsFillRect($hGraphic, $iX, $iY, $iWidth, $iHeight, $hBrushHatch)
        $aLables[$x] = GUICtrlCreateLabel("No. 0x" & Hex($x, 2), $iX, $iY + 53)
        $aTip[$x]    = GUICtrlSetTip(-1, $aHatchStyle[$x])
        _GDIPlus_BrushDispose($hBrushHatch)
    Next
    
    $iX      = 10
    $iY      = 10
    $iWidth  = 50
    $iHeight = 50
    Return  
EndFunc   ;==>Draw


Func CleanUp()
    _GDIPlus_GraphicsDispose($hGraphicGUI)
    _WinAPI_DeleteObject($hBMPBuff)
    _GDIPlus_BrushDispose($hBrushHatch)
    _GDIPlus_GraphicsDispose($hGraphic)
EndFunc   ;==>CleanUp

;Func to redraw the BMP on PAINT MSG
Func MY_PAINT($hWnd, $msg, $wParam, $lParam)
    ; Check, if the GUI with the Graphic should be repainted
    If $hWnd = $hGui Then
        _GDIPlus_GraphicsDrawImage($hGraphicGUI, $hBMPBuff, 0, 0)
    EndIf
EndFunc   ;==>MY_PAINT

;===============================================================
; Parameters
; $iHatchStyle - A hexi-decimal number, 0xnn, representing a Hatch Style (see ref),
; $iArgbFore   - A hexi-decimal number, 0xAARRGGBB, being the fore ground color, 
; $iArgbBack   - A hexi-decimal number, 0xAARRGGBB, being the back ground color.
;GdipCreateHatchBrush(GpHatchStyle hatchstyle, ARGB forecol, ARGB backcol, GpHatch **brush)
;Ref HatchBrush Functions:  http://msdn.microsoft.com/en-us/library/ms534040(VS.85).aspx
;Ref HatchStyle          : http://msdn.microsoft.com/en-us/library/bb401620.aspx
;
Func GDIPlus_CreateHatchBrush($iHatchStyle, $iArgbFore = 0xFF000000, $iArgbBack = 0xFFFFFFFF)
    Local $aRet, $res

    If $iArgbFore = -1 Then $iArgbFore = 0xFF000000
    If $iArgbBack = -1 Then $iArgbBack = 0xFFFFFFFF

    ;Note: Within _GDIPlus_Startup(), $ghGDIPDll is defined
    $aRet = DllCall($ghGDIPDll, "int", "GdipCreateHatchBrush", "int", $iHatchStyle, "int", $iArgbFore, _
            "int", $iArgbBack, "int*", 0)
    ;$res = "GdipCreateHatchBrush " & @CRLF
    ; for $x = 0 to 4
    ;$res &= $x & "  " & $aRet[$x] & @CRLF
    ; Next
    ;ConsoleWrite($res & @CRLF)
    Return $aRet[4]
EndFunc   ;==>GDIPlus_CreateHatchBrush