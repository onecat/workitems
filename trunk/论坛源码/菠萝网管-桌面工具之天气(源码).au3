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

#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\SHELL32.dll|-131
#AutoIt3Wrapper_Res_Fileversion=2.0.0.3
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include-once


#include <WindowsConstants.au3>
#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <GdiPlus.au3>
#include <WinAPIEx.au3>
#include <WinAPI.au3>
#include <String.au3>
#include <INet.au3>
Opt("WinDetectHiddenText", 1) ;可以查找窗口隐藏文本
Opt("GUIOnEventMode", 1)
If $CmdLine[0] = 0 Then Exit
$Positions = StringSplit($CmdLine[1], ",");1:方位代码;2: Y轴基准值， 3:不响应‘显示桌面’的窗口句柄，由父进程获取并传递过来。

FileInstall("Wallpaper.png", @TempDir & "\Wallpaper.png", 0)
FileInstall("colse.png", @TempDir & "\colse.png", 0)
FileInstall("face\中雨.png", @TempDir & "\中雨.png", 0)
FileInstall("face\多云.png", @TempDir & "\多云.png", 0)
FileInstall("face\大雨.png", @TempDir & "\大雨.png", 0)
FileInstall("face\大雪.png", @TempDir & "\大雪.png", 0)
FileInstall("face\小雨.png", @TempDir & "\小雨.png", 0)
FileInstall("face\小雪.png", @TempDir & "\小雪.png", 0)
FileInstall("face\晴.png", @TempDir & "\晴.png", 0)
FileInstall("face\阴.png", @TempDir & "\阴.png", 0)
FileInstall("face\阵雨.png", @TempDir & "\阵雨.png", 0)

;窗口高度
Global $iHeight = 158 ;窗口固定高度
Global $msgWnd
Global Const $hWndManager = $Positions[3]; 父程序传递过来的窗口句柄，是不响应‘显示桌面’的句柄
;Global $hWndManager = WinGetHandle("Program Manager") ;获取桌面窗口句柄，

;#cs
Switch $Positions[1] ;计算窗口位置
        Case 0
                $iX = 0
                $iY = 0 + $Positions[2]
        Case 1
                $iX = @DesktopWidth / 2 - 250 / 2
                $iY = 0 + $Positions[2]
        Case 2
                $iX = @DesktopWidth - 250
                $iY = 0 + $Positions[2]
        Case 3
                $iX = @DesktopWidth / 2 - 250 / 2
                $iY = @DesktopHeight / 2 - $iHeight / 2
        Case 4
                $iX = @DesktopWidth / 2 - 250 / 2
                $iY = @DesktopHeight - $iHeight - $Positions[2]
EndSwitch
;#ce
;$iX = @DesktopWidth - @DesktopWidth*0.2
;$iY = 5
;创建主窗口
$mWindow = GUICreate("显示天气", 250, 200, $iX, $iY, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $hWndManager);弹出式窗口(无标题栏)，工具窗口(无任务栏) + 分层窗口
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")

;====================================================================================
$wEar = GetWeather();获取天气信息
;====================================================================================
_GDIPlus_Startup()
;加载顶层窗口背景图片
$hImage = ResizeImage(@TempDir & "\Wallpaper.png", 250, $iHeight) ;拉伸后的背景图象对象
$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage);背景图象句柄
_GDIPlus_GraphicsSetSmoothingMode($hGraphic, 2);设置图形的平滑度，使图形的图像有抗锯齿功能
DllCall($ghGDIPDll, "int", "GdipSetTextRenderingHint", "hwnd", $hGraphic, "int", 4);设置字体的平滑度，使图形的文字有抗锯齿功能


;添加一段文字
$Fonts = '汉仪柏青体简'
$FontCoror = 0xff00ff00
_SendTextTOWallpaper($hGraphic, "SOSO天气:" & $wEar[0][0], $FontCoror, $Fonts, 20, 1, 10, 10, 0);背景句柄,文本，颜色，字体，大小，样式，左侧，上侧，基准点

;添加一段文字
$Fonts = '宋体'
$FontCoror = 0xffffffff
_SendTextTOWallpaper($hGraphic, $wEar[0][2] & @CRLF & $wEar[0][3], $FontCoror, $Fonts, 20, 1, 125, 40, 0);背景句柄,文本，颜色，字体，大小，样式，左侧，上侧，基准点

;绘制直线
$hPen = _GDIPlus_PenCreate(0x33000000, 3, 2)
_GDIPlus_GraphicsDrawLine($hGraphic, 0, 95, 250, 95, $hPen)
_GDIPlus_PenDispose($hPen); 清除资源

;添加一段文字
$Fonts = '宋体'
$FontCoror = 0xffffffff
_SendTextTOWallpaper($hGraphic, $wEar[1][0] & @CRLF & $wEar[1][2] & @CRLF & $wEar[1][3], $FontCoror, $Fonts, 12, 1, 60, 100, 0);背景句柄,文本，颜色，字体，大小，样式，左侧，上侧，基准点

;绘制直线
$hPen = _GDIPlus_PenCreate(0x33000000, 3, 2)
_GDIPlus_GraphicsDrawLine($hGraphic, 125, 95, 125, $iHeight, $hPen)
_GDIPlus_PenDispose($hPen); 清除资源


;添加一段文字
$Fonts = '宋体'
$FontCoror = 0xffffffff
_SendTextTOWallpaper($hGraphic, $wEar[2][0] & @CRLF & $wEar[2][2] & @CRLF & $wEar[2][3], $FontCoror, $Fonts, 12, 1, 60 + 120, 100, 0);背景句柄,文本，颜色，字体，大小，样式，左侧，上侧，基准点


;========================================
;设置背景图片
SetBitmap($mWindow, $hImage, 255) ;设置背景图片
;========================================

_GDIPlus_GraphicsDispose($hGraphic);释放图象句柄
_WinAPI_DeleteObject($hImage) ;释放图象对象
_GDIPlus_Shutdown();关闭GDI+
GUISetState(@SW_SHOW, $mWindow) ;父窗口加载完成
;-------------------------------------------------
;加载关闭窗口控件 MDI窗口
$ColseW = GUICreate("关闭", 32, 32, 220+12, 10, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $mWindow)
$Ico2 = ResizeImage(@TempDir & "\colse.png", 16, 16)
SetBitmap($ColseW, $Ico2, 127)
GUISetState(@SW_SHOW, $ColseW)
;---------------------------------------------
$toDay = GUICreate($wEar[0][1], 10, 10, 18 + 5, 20 + 10, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $mWindow)
$Icos = ResizeImage(@TempDir & "\" & $wEar[0][1] & ".png", 68, 68)
SetBitmap($toDay, $Icos, 127)
GUISetState(@SW_SHOW, $toDay)
$Tomorrow = GUICreate($wEar[1][1], 10, 10, 10, 100, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $mWindow)
$Icos = ResizeImage(@TempDir & "\" & $wEar[1][1] & ".png", 48, 48)
SetBitmap($Tomorrow, $Icos, 127)
GUISetState(@SW_SHOW, $Tomorrow)
$aTomorrow = GUICreate($wEar[2][1], 10, 10, 130, 100, $WS_POPUP, $WS_EX_MDICHILD + $WS_EX_LAYERED, $mWindow)
$Icos = ResizeImage(@TempDir & "\" & $wEar[2][1] & ".png", 48, 48)
SetBitmap($aTomorrow, $Icos, 127)
GUISetState(@SW_SHOW, $aTomorrow)
;------------------------------------------
;注册消息函数
GUIRegisterMsg($WM_NCHITTEST, 'WM_NCHITTEST');鼠标经过MID窗口-函数
GUIRegisterMsg($WM_LBUTTONDOWN, "WM_LBUTTONDOWN") ;鼠标左击MID窗口 客户区-函数
;-------------------------------------------
_Sender() ;返回祖窗口 Gui 高度 和 窗口句柄
;----------------------------
While 1
        Sleep(1000)
WEnd
Func CLOSEClicked()
        Exit
EndFunc   ;==>CLOSEClicked
;============================================
;返回坐标
Func _Sender() ;返回窗口高度给主程序
        Local $hMapping, $pAddress, $tData, $Text
        $hMapping = _WinAPI_OpenFileMapping('MyFileMapping');创建或打开指定文件命名或未命名的镜像对象
        $pAddress = _WinAPI_MapViewOfFile($hMapping);将文件映射映射入调用进程的地址空间
        $tData = DllStructCreate('HWND;wchar[1024]', $pAddress);创建消息数据结构
        $Text = $iHeight
        DllStructSetData($tData, 1, $mWindow)
        DllStructSetData($tData, 2, $Text)
        _WinAPI_UnmapViewOfFile($pAddress);从调用进程的地址空间取消对文件的映射视图
        _WinAPI_CloseHandle($hMapping);关闭一个打开的对象的句柄
EndFunc   ;==>_Sender
;======================================================
;系统消息
;鼠标经过MID窗口-函数
Func WM_NCHITTEST($hWnd, $Msg, $wParam, $lParam)
        Switch $hWnd
                Case $mWindow
                        Switch $msgWnd
                                Case $ColseW
                                        SetBitmap($ColseW, $Ico2, 127)
                                Case $toDay
                                        $Icos = ResizeImage(@TempDir & "\" & WinGetTitle($msgWnd) & ".png", 68, 68)
                                        SetBitmap($toDay, $Icos, 127)
                                Case ''
                                Case Else
                                        $Icos = ResizeImage(@TempDir & "\" & WinGetTitle($msgWnd) & ".png", 48, 48)
                                        SetBitmap($msgWnd, $Icos, 127)
                        EndSwitch
                        ToolTip("")
                Case $ColseW
                        SetBitmap($hWnd, $Ico2, 255)
                        $wh = MouseGetPos()
                        ToolTip("关闭", $wh[0] - 20, $wh[1] + 10, "", 0, 2)
                        $msgWnd = $hWnd
                Case $toDay
                        $Icos = ResizeImage(@TempDir & "\" & WinGetTitle($hWnd) & ".png", 68, 68)
                        SetBitmap($hWnd, $Icos, 255)
                        ToolTip(WinGetTitle($hWnd))
                        $msgWnd = $hWnd
                Case Else
                        $Icos = ResizeImage(@TempDir & "\" & WinGetTitle($hWnd) & ".png", 48, 48)
                        SetBitmap($hWnd, $Icos, 255)
                        ToolTip(WinGetTitle($hWnd))
                        $msgWnd = $hWnd
        EndSwitch
EndFunc   ;==>WM_NCHITTEST
;鼠标左击MID窗口 客户区-函数
Func WM_LBUTTONDOWN($hWnd, $Msg, $wParam, $lParam)
        If $hWnd = $ColseW Then
                Exit
        EndIf
EndFunc   ;==>WM_LBUTTONDOWN
;======================================================
;拉伸图片函数
Func ResizeImage($fImage, $iW, $iH, $fExt = "png", $fPart = ".resized.")
        If $fImage = "" Then Return SetError(1, 0, 0)
        If Not FileExists($fImage) Then Return SetError(2, 0, 0)
        Local $iOutputFormats = "jpg,png,bmp,gif,tif"
        If Not StringInStr($iOutputFormats, $fExt) Then
                If $fExt <> -1 Then
                        $fExt = "png"
                Else
                        If Not StringInStr($iOutputFormats, StringRight($fImage, 3)) Then
                                $fExt = "png"
                        Else
                                $fExt = StringRight($fImage, 3)
                        EndIf
                EndIf
        EndIf
        Local $fName = StringRegExpReplace($fImage, ".*\\(.*).{4}", "$1")
        Local $declared = True
        If Not $ghGDIPDll Then
                _GDIPlus_Startup()
                $declared = False
        EndIf
        Local $hImageFromFile = _GDIPlus_ImageLoadFromFile($fImage)
        Local $iWidth = _GDIPlus_ImageGetWidth($hImageFromFile)
        Local $iHeight = _GDIPlus_ImageGetHeight($hImageFromFile)
        Local $x, $y
        If Not $iW And Not $iH Then
                $iW = 96
                $iH = 96
        ElseIf $iW And Not $iH Then
                $x = $iW / $iWidth
                $iH = Int($iHeight * $x)
        ElseIf Not $iW And $iH Then
                $y = $iH / $iHeight
                $iW = Int($iWidth * $y)
        EndIf
        Local $hImageThumbnail = DllCall($ghGDIPDll, "uint", "GdipGetImageThumbnail", "handle", $hImageFromFile, "uint", $iW, "uint", $iH, "int*", 0, "ptr", 0, "ptr", 0)
        If @error Then
                _GDIPlus_ImageDispose($hImageFromFile)
                If Not $declared Then _GDIPlus_Shutdown()
                Return SetError(3, 0, 0)
        EndIf
        $hImageThumbnail = $hImageThumbnail[4]
        Return $hImageThumbnail
EndFunc   ;==>ResizeImage
;加入图标
Func _addico($hGraphic, $ico, $iX, $iY, $Width, $Height)
        _GDIPlus_GraphicsDrawImageRect($hGraphic, $ico, $iX, $iY, $Width, $Height);加入图标
        _GDIPlus_ImageDispose($ico);释放图标资源
EndFunc   ;==>_addico
;加入文字
Func _SendTextTOWallpaper($hGraphic, $Text, $Color, $Fonst, $FontCreate, $FontStyle, $Width, $Height, $Align)
        $hBrush = _GDIPlus_BrushCreateSolid($Color);创建实心画笔对象，其中Alpha通道值为255，RGB值为0xff00ff
        $hFormat = _GDIPlus_StringFormatCreate();创建字符串格式对象
        $hFamily = _GDIPlus_FontFamilyCreate($Fonst);创建字体为"微软雅黑"的字体族对象
        $hFont = _GDIPlus_FontCreate($hFamily, $FontCreate, $FontStyle, 2);用上面创建的字体族创建一个字体大小为20，粗体+斜体，坐标参照为像素的字体对象，坐标参照很重要，会影响到字体在图形上的位置
        $tLayout = _GDIPlus_RectFCreate($Width, $Height, 0, 0);创建 $tagGDIPRECTF 数据结构
        _GDIPlus_StringFormatSetAlign($hFormat, $Align)
        $TestText = _GDIPlus_GraphicsMeasureString($hGraphic, $Text, $hFont, $tLayout, $hFormat);根据上面创建的字体、字符串等信息测量字符串在图形中的尺寸，以便在图形中绘制
        _GDIPlus_GraphicsDrawStringEx($hGraphic, $Text, $hFont, $TestText[0], $hFormat, $hBrush);在图形中绘制上面创建的字符串对象
        ;释放资源文字
        _GDIPlus_FontDispose($tLayout)
        _GDIPlus_FontFamilyDispose($hFamily)
        _GDIPlus_StringFormatDispose($hFormat)
        _GDIPlus_BrushDispose($hBrush)
EndFunc   ;==>_SendTextTOWallpaper
;设置背景图片
Func SetBitmap($hGUI, $hImage, $iOpacity)
        Local $hScrDC, $hMemDC, $hBitmap, $hOld, $pSize, $tSize, $pSource, $tSource, $pBlend, $tBlend
        $hScrDC = _WinAPI_GetDC(0)
        $hMemDC = _WinAPI_CreateCompatibleDC($hScrDC)
        $hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
        $hOld = _WinAPI_SelectObject($hMemDC, $hBitmap)
        $tSize = DllStructCreate($tagSIZE)
        $pSize = DllStructGetPtr($tSize)
        DllStructSetData($tSize, "X", _GDIPlus_ImageGetWidth($hImage))
        DllStructSetData($tSize, "Y", _GDIPlus_ImageGetHeight($hImage))
        $tSource = DllStructCreate($tagPOINT)
        $pSource = DllStructGetPtr($tSource)
        $tBlend = DllStructCreate($tagBLENDFUNCTION)
        $pBlend = DllStructGetPtr($tBlend)
        DllStructSetData($tBlend, "Alpha", $iOpacity)
        DllStructSetData($tBlend, "Format", 1)
        _WinAPI_UpdateLayeredWindow($hGUI, $hScrDC, 0, $pSize, $hMemDC, $pSource, 0, $pBlend, $ULW_ALPHA)
        _WinAPI_ReleaseDC(0, $hScrDC)
        _WinAPI_SelectObject($hMemDC, $hOld)
        _WinAPI_DeleteObject($hBitmap)
        _WinAPI_DeleteDC($hMemDC)
EndFunc   ;==>SetBitmap
;获取天气信息
Func GetWeather()
        Dim $s_URL = "http://www.soso.com/tb.q?cid=tb.tq"
        Local $Text[3][4]
        $soure = _INetGetSource($s_URL);获取源码
        $temp = StringLeft(StringMid($soure, StringInStr($soure, '<body>') + 6), StringInStr(StringMid($soure, StringInStr($soure, '<body>') + 6), '<div style="visibility:hidden;">') - 1)
        For $i = 1 To 3
                $Time = StringLeft(StringMid($temp, StringInStr($temp, '<div class="today">', 0, $i) + 19), StringInStr(StringMid($temp, StringInStr($temp, '<div class="today">', 0, $i) + 19), '</div><div class="weather">', 0, 1) - 1)
                $Weather = StringLeft(StringMid($temp, StringInStr($temp, '>&nbsp;', 0, $i) + 7), StringInStr(StringMid($temp, StringInStr($temp, '>&nbsp;', 0, $i) + 7), '<div', 0, 1) - 1)
                $Temperature = StringLeft(StringMid($temp, StringInStr($temp, '<div class="pd_l">', 0, $i) + 18), StringInStr(StringMid($temp, StringInStr($temp, '<div class="pd_l">', 0, $i) + 18), '<br/>', 0, 1) - 1)
                $WindPower = StringLeft(StringMid($temp, StringInStr($temp, '<br/>', 0, $i) + 5), StringInStr(StringMid($temp, StringInStr($temp, '<br/>', 0, $i) + 5), '</div>', 0, 1) - 1)
                ;$Text &= $Time & @CRLF & $Weather & @CRLF & $Temperature & @CRLF & $WindPower & '|'
                $Text[$i - 1][0] = $Time
                $Text[$i - 1][1] = $Weather
                $Text[$i - 1][2] = $Temperature
                $Text[$i - 1][3] = $WindPower
        Next
        Return $Text
EndFunc   ;==>GetWeather