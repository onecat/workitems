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
#include <Array.au3>
 
Global $1DArray = _GetBieQiDatato1DArray()
Global $2DArray = _1DArrayAvailableDataTo2DArray($1DArray)
If @error Then Exit
_ArraySort($2DArray,1,0,0,1)
Global $Final2DArray = _2DArrayDeleteRepeatValue($2DArray)
;If Not @error Then _ArrayDisplay($final2DArray)
 
Global $hCallback = DllCallbackRegister("YourFunc", "int", "hWnd;uint;wparam;lparam");函数名，返回值，参数
Global $ptrCallback = DllCallbackGetPtr($hCallback)
 
GUICreate("", 500, 500)
$nCtrlId = GUICtrlCreatePic("", 0, 0, 500, 500)
$hPicWnd = GUICtrlGetHandle($nCtrlId)
;设置lable控件的处理函数，也就是所谓的控件子类化
Global $hOldProc = _WinAPI_SetWindowLong($hPicWnd, $GWL_WNDPROC, $ptrCallback)
 
GUISetState()
 
While 1
        $Msg = GUIGetMsg()
        Switch $Msg
                Case -3
                        ExitLoop
        EndSwitch
WEnd
GUIDelete()
Exit
 
Func YourFunc($hWnd, $iMsg, $wParam, $lParam)
        Local $au3Dir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\Autoit", "InstallDir");au3安装目录
        Switch $iMsg
                Case $WM_PAINT
                        Local $tPAINTSTRUCT
                        Local $hDC = _WinAPI_BeginPaint($hWnd, $tPAINTSTRUCT)
                        ;获取控件长高
                        Local $HWND_CX = _WinAPI_GetWindowWidth($hWnd)
                        Local $HWND_CY = _WinAPI_GetWindowHeight($hWnd)
                        ConsoleWrite($HWND_CX & "x" & $HWND_CY)
                        ;开始GDI+
                        _GDIPlus_Startup()
                        ;获取画布，这是从DC获取，还可以用_GDIPlus_GraphicsCreateFromHWND($hWnd)从控件句柄获取，使用完成要释放画布_GDIPlus_GraphicsDispose($hGraphics)
                        $hGraphics = _GDIPlus_GraphicsCreateFromHDC($hDC)
                        ;根据画布创建位图对象,我们等会的画图均是针对位图来操作的，也就是没有直接画在画布上，就是所谓的双缓冲画图
                        $hBitmap = _GDIPlus_BitmapCreateFromGraphics($HWND_CX, $HWND_CY, $hGraphics)
                        ;获取位图对象的画布，图就画在位图的画布上
                        $hBackbuffer = _GDIPlus_ImageGetGraphicsContext($hBitmap)
                        ;用颜色0xFFE0E0E0清除画布，GDI+的颜色全是ARGB格式，A是透明度，RGB是红绿蓝，这里FF就是不透明，E0E0E0是红绿蓝成分
                        _GDIPlus_GraphicsClear($hBackbuffer, 0xFFE0E0E0)
                        _GDIPlus_GraphicsSetSmoothingMode($hBackbuffer, 2);平滑模式，2为8*8抗距齿
                        
                        $hPen = _GDIPlus_PenCreate("0xFF000000", 2) ;纯黑色画笔
                        ;纯色画刷_GDIPlus_BrushGetType($hBrush)返回值是0
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFF483D8B)
                        ;还可以用_GDIPlus_BrushSetFillColor($hBrush, $iARGB)设置颜色
                        _GDIPlus_GraphicsDrawRect($hBackbuffer, 0, 0, $HWND_CX - 1, 50, $hPen)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 1, 1, $HWND_CX - 2, 49, $hBrush); GDI+几乎所有操作都是指定画笔或者画刷的，不需要象GDI中先把画笔、画刷选入DC
                        ;_GDIPlus_BrushDispose($hBrush);画刷用完要释放
                        
                        ; _GDIPlus_GraphicsDrawString($hBackbuffer, "憋气测试排行榜 ( Top 10 )", 20, 10,"Arial",20)
                        
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFF274E8B)
                        _GDIPlus_GraphicsDrawRect($hBackbuffer, 0, 50, $HWND_CX - 1, 449, $hPen)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 1, 50, $HWND_CX - 3, 448, $hBrush)
                        ;_GDIPlus_BrushDispose($hBrush)
                        
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFFE0FFFF)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 100, 70, $HWND_CX - 130, 380, $hBrush)
                        ;_GDIPlus_BrushDispose($hBrush)
                        
                        ;绘制白色分割线
                        $hPen = _GDIPlus_PenCreate("0xFFFFFFFF", 1) ;纯黑色画笔
                        _GDIPlus_GraphicsDrawLine($hBackbuffer, 1, 50, 498, 50, $hPen)
                        
                        ;GDI绘制字符串
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFFFFFFFF) ;设置白色画刷，为了字体白色
                        $hFormat = _GDIPlus_StringFormatCreate()
                        $hFamily = _GDIPlus_FontFamilyCreate("Arial")
                        $hFont = _GDIPlus_FontCreate($hFamily, 20, 1)
                        $tLayout = _GDIPlus_RectFCreate(20, 10, 400, 40)
                        _GDIPlus_GraphicsDrawStringEx($hBackbuffer, "憋气测试排行榜 ( Top 10 )", $hFont, $tLayout, $hFormat, $hBrush)
                        _GDIPlus_FontDispose($hFont)
                        $hFont = _GDIPlus_FontCreate($hFamily, 10, 1)
                        ;_GDIPlus_FontFamilyDispose($hFamily)
                        ;_GDIPlus_StringFormatDispose($hFormat)
                        ;_GDIPlus_BrushDispose($hBrush)
                        _GDIPlus_StringFormatSetAlign($hFormat, 2) ;设置字体右对齐
                        For $i = 0 To 9
                                $tLayout = _GDIPlus_RectFCreate(10, 80 + $i * 38, 80, 80 + $i * 38)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $Final2DArray[$i][0], $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        _GDIPlus_StringFormatSetAlign($hFormat, 1) ;设置字体右对齐
                        For $i = 0 To 6
                                $tLayout = _GDIPlus_RectFCreate(70 + $i * 40, 450, 70 + $i * 40, 460)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $i * 1000, $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        
                        ;绘制矩形条和数据
                        _GDIPlus_StringFormatSetAlign($hFormat, 2) ;设置字体右对齐
                        Local $PixsPerCount = 370/6000
                        $hPen = _GDIPlus_PenCreate("0xFFFFFFFF", 1) 
                        For $i = 0 To 9
                                $hBrush = _GDIPlus_BrushCreateSolid(0xFF4169E1) 
                                _GDIPlus_GraphicsDrawRect($hBackbuffer, 101, 80+$i*38, Int($PixsPerCount*$final2DArray[$i][1]), 15, $hPen)
                                _GDIPlus_GraphicsFillRect($hBackbuffer, 102, 81+$i*38, Int($PixsPerCount*$final2DArray[$i][1])-2, 13, $hBrush)
                                $tLayout = _GDIPlus_RectFCreate(76+Int($PixsPerCount*$final2DArray[$i][1]),80+$i*38,60,20)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $final2DArray[$i][1], $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        
                        ;画在位图画布上的图形，在$hBitap上，把$hBitmap画入DC的画布，也就在DC上显示了，双缓冲画图时间再长，画入DC画布就一次操作，图形不会闪烁
                        _GDIPlus_GraphicsDrawImageRect($hGraphics, $hBitmap, 0, 0, 500, 500)
                        _GDIPlus_BitmapDispose($hBitmap)
                        _GDIPlus_GraphicsDispose($hBackbuffer)
                        _GDIPlus_GraphicsDispose($hGraphics)
                        _GDIPlus_FontFamilyDispose($hFamily)
                        _GDIPlus_StringFormatDispose($hFormat)
                        _GDIPlus_BrushDispose($hBrush)
                        _GDIPlus_PenDispose($hPen)
                        _GDIPlus_Shutdown()
                        _WinAPI_EndPaint($hWnd, $tPAINTSTRUCT)
                        Return 0
        EndSwitch
        Return _WinAPI_CallWindowProc($hOldProc, $hWnd, $iMsg, $wParam, $lParam);没有处理的消息让原先的处理程序处理
EndFunc   ;==>YourFunc
 
Func _GetBieQiDatato1DArray()
        $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")
        $oHTTP.Option(4) = 13056 ;忽略错误标志
        $oHTTP.Option(6) = True ;是否接收重定向地址信息
        $oHTTP.SetTimeouts(30000, 30000, 30000, 30000);超时时间设置
        $oHTTP.Open('GET', 'http://www.autoitx.com/viewthread.php?tid=38541&extra=&page=1', False)
        $oHTTP.Send()
        $Respond = BinaryToString($oHTTP.ResponseBody, 1)
        Local $text = $Respond
        Local $RegReturn = StringRegExp($Respond, 'page=(\d+)&sid=\w+', 3) ;取帖子页数
        If @error Then Return SetError(1)
        Local $Maxpage = _ArrayMax($RegReturn) ;最大页数
        
        For $i = 2 To $Maxpage
                $oHTTP.Open('GET', 'http://www.autoitx.com/viewthread.php?tid=38541&extra=&page=' & $i, False)
                $oHTTP.Send()
                $Respond = BinaryToString($oHTTP.ResponseBody, 1)
                ;MsgBox(0,0,$Respond)
                $text &= $Respond
        Next
        
        FileWrite(FileOpen(@ScriptDir & "\bieqi.txt", 10), $text)
        $Return = StringRegExp($text, '(?s)<a href="space.*? target="_blank">([^<]+)</a>\s.*?postmessage_\d+">(.*?)</td>', 3)
        If @error Then Return SetError(1)
        Return $Return
EndFunc   ;==>_GetBieQiDatato1DArray
 
Func _1DArrayAvailableDataTo2DArray($iArray1D)
        Local $iArray_username[1] = [0], $iArray_0Count[1] = [0], $temp, $0Count
        If Not IsArray($iArray1D) Then Return SetError(1, 0, 0)
        Local $N = UBound($iArray1D) - 1
        For $i = 1 To $N Step 2
                $temp = StringRegExp($iArray1D[$i], '((\d)\2{50,})', 3)
                If @error Then
                        ContinueLoop
                Else
                        $0Count = StringLen($temp[0])
                        _ArrayAdd($iArray_username, $iArray1D[$i - 1])
                        $iArray_username[0] += 1
                        _ArrayAdd($iArray_0Count, $0Count)
                EndIf
        Next
        Dim $Return2DArray[$iArray_username[0]][2]
        For $i = 0 To $iArray_username[0] - 1
                $Return2DArray[$i][0] = $iArray_username[$i + 1]
                $Return2DArray[$i][1] = $iArray_0Count[$i + 1]
        Next
        Return $Return2DArray
EndFunc   ;==>_1DArrayAvailableDataTo2DArray
 
Func _2DArrayDeleteRepeatValue($i2DArray)
        If Not IsArray($i2DArray) Then Return SetError(1, 0, 0)
        Local $2DArrayNoRepeat[1][2], $N = 1
        For $i = 0 To UBound($i2DArray) - 1
                If IsDeclared($i2DArray[$i][0]) Then
                        ContinueLoop
                Else
                        Assign($i2DArray[$i][0], "")
                        If $2DArrayNoRepeat[0][0] = "" Then
                                $2DArrayNoRepeat[0][0] = $i2DArray[$i][0]
                                $2DArrayNoRepeat[0][1] = $i2DArray[$i][1]
                        Else
                                $N += 1
                                ReDim $2DArrayNoRepeat[$N][2]
                                $2DArrayNoRepeat[$N - 1][0] = $i2DArray[$i][0]
                                $2DArrayNoRepeat[$N - 1][1] = $i2DArray[$i][1]
                        EndIf
                EndIf
        Next
        Return $2DArrayNoRepeat
EndFunc   ;==>_2DArrayDeleteRepeatValue
