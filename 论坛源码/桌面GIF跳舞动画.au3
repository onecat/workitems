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

#include <GUIConstantsEx.au3>
#include <GdiPlusEx.au3>
#include <WindowsConstants.au3>
#Include <WinAPIEx.au3>
#include <APIConstants.au3>
 
OnAutoItExitRegister("_myexitfunc")
Opt("GUIOnEventMode", 1)
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
;修改下面的文件名，来适合自己的动画
Global $szFileName = @ScriptDir & "\2.gif"
Global $bPaint = 0, $ID_TIMER = 0;WMPAINT标志及定时器ID
Global $Guid = "{6AEDBD6D-3FB5-418A-83A6-7F45229DC872}";$GDIP_FRAMEDIMENSION_TIME这是动态图常量
;下面依次是：廷时数据，当前帧，帧总数，临时DC，DC画布，图片长，高，GIF图像对象，定时器开标志，窗口显示标志
Global $pItem, $fcount, $frameCount, $hdcMem, $hbmp,$cxClient = 0, $cyClient = 0, $pimage = 0, $btimer = False, $bShow = True
Global $color;透明色
Global $pnid = DllStructCreate($tagNOTIFYICONDATA);托盘图标结构
DllStructSetData($pnid, 'ID', 1);1为当前图标
DllStructSetData($pnid, 'Size', DllStructGetSize($pnid))
DllStructSetData($pnid, 'hWnd', WinGetHandle(AutoItWinGetTitle()))
DllStructSetData($pnid, 'Flags', $NIF_ICON);设置成员hIcon有效
 
;注册窗口自处理函数
Global $hGifCallback = DllCallbackRegister("My_GifProc", "int", "hWnd;uint;wparam;lparam")
Global $tGifCallback = DllCallbackGetPtr($hGifCallback)
_GDIPlus_Startup()
 
$hGUI = GUICreate("GIF", 0, 0, -1, -1, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW));, WinGetHandle("[CLASS:Progman]"))
GUISetOnEvent($GUI_EVENT_CLOSE, "_myexitfunc")
Global $GifCallProc = _WinAPI_SetWindowLong($hGUI, -4, $tGifCallback)
GUISetState()
;菜单
$OptionsDummy = GUICtrlCreateDummy()
$OptionsContext = GUICtrlCreateContextMenu($OptionsDummy)
$OptionsCommon = GUICtrlCreateMenuItem("隐藏窗口", $OptionsContext)
GUICtrlSetOnEvent(-1, "_show")
$OptionsFile = GUICtrlCreateMenuItem("选择Gif图片", $OptionsContext)
GUICtrlSetOnEvent(-1, "_selectfile")
GUICtrlCreateMenuItem("", $OptionsContext)
$OptionsExit = GUICtrlCreateMenuItem("退出", $OptionsContext)
GUICtrlSetOnEvent(-1, "_myexitfunc")
;托盘菜单
Global $tshow = TrayCreateItem("隐藏窗口")
TrayItemSetOnEvent(-1, "_show")
Global $tfile = TrayCreateItem("选择Gif图片")
TrayItemSetOnEvent(-1, "_selectfile")
TrayCreateItem("")
Global $tExit = TrayCreateItem("退出")
TrayItemSetOnEvent(-1, "_myexitfunc")
;打开默认gif图片
OpenFile($hGUI, $szFileName)
 
While 1
        Sleep(10)
WEnd
 
;退出函数
Func _myexitfunc()
        _WinAPI_SetWindowLong($hGUI, -4, $GifCallProc)
        _GDIPlus_ImageDispose($pimage)
        _GDIPlus_Shutdown()
        Exit
EndFunc   ;==>_myexitfunc
 
;窗口显隐
Func _show()
        If $bShow Then
                $bShow = False
                TrayItemSetText($tshow, "显示窗口")
                GUISetState(@SW_HIDE)
        Else
                $bShow = True
                TrayItemSetText($tshow, "隐藏窗口")
                GUISetState(@SW_SHOW)
        EndIf
EndFunc   ;==>_show
 
;选择文件
Func _selectfile()
        Local $var = FileOpenDialog("请选择一个图像文件！", @ScriptDir & "\", "图像文件 (*.gif;*.jpg;*.png;*.bmp;*.tif)")
        If @error Then
                MsgBox(4096, "", "没有选择文件!")
                Return 0
        EndIf
        OpenFile($hGUI, $var)
EndFunc   ;==>_selectfile
 
;窗口处理函数
Func My_GifProc($hWnd, $Msg, $wParam, $lParam)
        Switch $Msg
                Case 0x000F;WM_PAINT
                        If $bPaint = 0 Then
                                Local $tPAINTSTRUCT, $hdc
                                $bPaint += 1
                                $hdc = _WinAPI_BeginPaint($hWnd, $tPAINTSTRUCT)
                                OnPaint($hdc)
                                _WinAPI_EndPaint($hWnd, $tPAINTSTRUCT)
                                $bPaint -= 1
                                Return 0
                        EndIf
                Case 0x0113;$WM_TIMER
                        GoNext();到下一帧
                        If $bShow Then
                                $hdc = _WinAPI_GetDC($hWnd)
                                OnPaint($hdc)
                                _WinAPI_ReleaseDC($hWnd, $hdc)
                        EndIf
                        ModifyIcon($hWnd)
                        _WinAPI_KillTimer($hWnd, $ID_TIMER)
                        _WinAPI_SetTimer($hWnd, $ID_TIMER, GetPause(), 0) ;从GetPause()得到廷时数据来设置定时器
                        Return 0;
                Case 0x0201;WM_LBUTTONDOWN　　左键点击看作点击在状态栏，便于窗口移动
                        _WinAPI_PostMessage($hWnd, $WM_NCLBUTTONDOWN, $HTCAPTION, _WinAPI_MakeLong(_WinAPI_GetMousePosX(True, $hWnd), _WinAPI_GetMousePosX(True, $hWnd)));
                        Return 0;
                Case 0x0203;$WM_LBUTTONDBLCLK
                        $hdc = _WinAPI_GetDC($hWnd)
                        $color = _WinAPI_GetPixel($hdc, _WinAPI_GetMousePosX(True, $hWnd), _WinAPI_GetMousePosX(True, $hWnd));获取双击处颜色
                        settrans($hWnd, $color);根据颜色设置窗口透明色
                        _WinAPI_InvalidateRect($hWnd, 0, False);让窗口重绘
                        _WinAPI_ReleaseDC($hWnd, $hdc)
                        Return 0 ;
                Case 0x0205;WM_RBUTTONUP
                        ShowMenu($hWnd, $OptionsContext);显示菜单
        EndSwitch
        Return _WinAPI_CallWindowProc($GifCallProc, $hWnd, $Msg, $wParam, $lParam)
EndFunc   ;==>My_GifProc
 
Func OpenFile($hWnd, $szFileName)
        If $btimer Then
                _WinAPI_KillTimer($hWnd, $ID_TIMER);
                $btimer = False;
        EndIf
        If $pimage Then _GDIPlus_ImageDispose($pimage)
        $pimage = _GDIPlus_ImageLoadFromFile($szFileName);创建基于文件的图像对象
        ModifyIcon($hWnd)
        If Not $bShow Then
                _WinAPI_ShowWindow($hWnd, @SW_RESTORE);
                $bShow = True;
        EndIf
        If $pimage Then
                If DoInit($hWnd) Then ;返回值为TRUE即是多帧动画图，这样就要开启动画定时器
                        _WinAPI_SetTimer($hWnd, $ID_TIMER, GetPause(), 0) ;
                        $btimer = True ;
                EndIf
        EndIf
        _WinAPI_InvalidateRect($hWnd, 0, False);重绘窗口
EndFunc   ;==>OpenFile
 
Func DoInit($hWnd);返回值为TRUE即是多帧动画图
        ;设置全局变量的值
        $aSize = _GDIPlus_ImageGetDimension($pimage)
        $imgWidth = $aSize[0]
        $imgHeight = $aSize[1]
        If $imgWidth <> $cxClient Or $imgHeight <> $cyClient Then
                If $hdcMem Then _WinAPI_DeleteDC($hdcMem)
                If $hbmp Then _WinAPI_DeleteObject($hbmp)
                $hdc = _WinAPI_GetDC($hWnd)
                $hdcMem = _WinAPI_CreateCompatibleDC($hdc)
                $hbmp = _WinAPI_CreateCompatibleBitmap($hdc, $imgWidth, $imgHeight);
                _WinAPI_SelectObject($hdcMem, $hbmp)
                _WinAPI_ReleaseDC($hWnd, $hdc)
                _WinAPI_MoveWindow($hWnd, (@DesktopWidth - $imgWidth) / 2, (@DesktopHeight - $imgHeight) / 2, $imgWidth, $imgHeight, True);
                $cxClient = $imgWidth
                $cyClient = $imgHeight
        EndIf
        ;读取左上角颜色，设置透明
        $color = "0x" & Hex(_GDIPlus_BitmapGetPixel($pimage, 0, 0), 6)
        settrans($hWnd, $color)
        $fcount = 0;当前帧初始化为0
        $frameCount = _GDIPlus_ImageGetFrameCount($pimage, $Guid);读取帧总数
        If $frameCount > 1 Then
                $FrameDelay = _GDIPlus_ImageGetPropertyItem($pimage, $GDIP_PROPERTYTAGFRAMEDELAY)
;~              $id = DllStructGetData($FrameDelay, "id")
                $length = DllStructGetData($FrameDelay, "length")
;~              $type = DllStructGetData($FrameDelay, "type")
                $value = DllStructGetData($FrameDelay, "value")
                $pItem = DllStructCreate("dword[" & $length / 4 & "]", $value)
                Return True;返回TRUE为多帧
        EndIf
        Return False;返回FALSE为单帧静态图
EndFunc   ;==>DoInit
 
Func GetPause()
        $iDelay = DllStructGetData($pItem, 1, $fcount) * 10 ; 1 = 10 毫秒
        ; 校正延时数据
        If Not $iDelay Then $iDelay = 130 ; 把 0 处理为 130 ms
        If $iDelay < 50 Then $iDelay = 50 ; 防止CPU占用过高，增加延时，放慢播放速度
        If $iDelay > 200 Then $iDelay = 200 ; 有些GIF最后一帧延时数据不准，防止数据不准，GIF不动
        Return $iDelay
EndFunc   ;==>GetPause
 
Func GoNext()
        $fcount += 1
        If $fcount = $frameCount Then $fcount = 0;     //如果到了最后一帧数据又重新开始
        _GDIPlus_ImageSelectActiveFrame($pimage, $Guid, $fcount)
EndFunc   ;==>GoNext
 
Func OnPaint($hdc)
        $hGraphics = _GDIPlus_GraphicsCreateFromHDC($hdcMem)
        _GDIPlus_GraphicsClear($hGraphics, BitOR(BitShift(0xFF, -24), $color))
        _GDIPlus_GraphicsDrawImageRect($hGraphics, $pimage, 0, 0, $cxClient, $cyClient)
        _GDIPlus_GraphicsDispose($hGraphics)
        _WinAPI_BitBlt($hdc, 0, 0, $cxClient, $cyClient, $hdcMem, 0, 0, $SRCCOPY);
EndFunc   ;==>OnPaint
 
Func settrans($hWnd, $color)
        _WinAPI_SetWindowLong($hWnd, $GWL_EXSTYLE, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED))
        _WinAPI_SetLayeredWindowAttributes($hWnd, $color, 0, $LWA_COLORKEY)
EndFunc   ;==>settrans
 
Func ShowMenu($hWnd, $nContextID)
        Local $arPos, $x, $y
        Local $hMenu = GUICtrlGetHandle($nContextID)
        $arPos = MouseGetPos()
        $x = $arPos[0]
        $y = $arPos[1]
        TrackPopupMenu($hWnd, $hMenu, $x, $y)
EndFunc   ;==>ShowMenu
 
Func TrackPopupMenu($hWnd, $hMenu, $x, $y)
        DllCall("user32.dll", "int", "TrackPopupMenuEx", "hwnd", $hMenu, "int", 0, "int", $x, "int", $y, "hwnd", $hWnd, "ptr", 0)
EndFunc   ;==>TrackPopupMenu
 
;修改托盘图标
Func ModifyIcon($hWnd)
        Local $i = _WinAPI_GetSystemMetrics(11);$SM_CXICON=11获取图标宽度
        Local $j = _WinAPI_GetSystemMetrics(12);$SM_CYICON=12获取图标高度
        Local $hdc = _WinAPI_GetDC($hWnd)
        Local $hbitmap = _WinAPI_CreateCompatibleBitmap($hdc, $i, $j)
        Local $hdcMem = _WinAPI_CreateCompatibleDC($hdc)
        _WinAPI_SelectObject($hdcMem, $hbitmap);
        Local $hGraphics = _GDIPlus_GraphicsCreateFromHDC($hdcMem)
        _GDIPlus_GraphicsDrawImageRect($hGraphics, $pimage, 0, 0, $i, $j)
        _GDIPlus_GraphicsDispose($hGraphics)
        _WinAPI_DeleteDC($hdcMem)
        _WinAPI_ReleaseDC($hWnd, $hdc)
        $hIcon = _WinAPI_CreateIconIndirect($hbitmap, $hbitmap);创建图标
        DllStructSetData($pnid, 'hIcon', $hIcon);设置图标到托盘图标结构
        _WinAPI_ShellNotifyIcon($NIM_MODIFY, $pnid);发送消息到任务栏的状态区域修改状态区的图标
        _WinAPI_DestroyIcon($hIcon)
        _WinAPI_DeleteObject($hbitmap)
EndFunc   ;==>ModifyIcon