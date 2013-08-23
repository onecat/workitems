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
#include <WindowsConstants.au3>
#include <FontConstants.au3>
#include <WinAPIEx.au3>
#include <TabConstants.au3>
#include <GuiTab.au3>
#include <Constants.au3>
 
Global $hGUI, $GUIMsg
 
Global $TabHover = False, $TABActiveID = 0, $TabHoverID = -1, $Count = 0
Global $WinWidth = 600, $WinHeight = 400, $TabWidth = 100, $TabHeight = 30, $Tabcount = 5
 
Global $hTABCallback = DllCallbackRegister("My_TABProc", "int", "hWnd;uint;wparam;lparam")
Global $tTABCallback = DllCallbackGetPtr($hTABCallback)
 
$hGUI = GUICreate("自绘TAB", $WinWidth, $WinHeight)
$tab = GUICtrlCreateTab(0, 0, $WinWidth, $WinHeight, BitOR($TCS_FIXEDWIDTH, $TCS_OWNERDRAWFIXED))
$tabHwnd = GUICtrlGetHandle(-1)
_GUICtrlTab_SetItemSize($tab, $TabWidth, $TabHeight)
 
GUICtrlCreateTabItem("开始")
GUICtrlCreateEdit("测试数据第一页里放EDIT控件", 30, 60, 300, 220, 0x00C0)
GUICtrlCreateButton("确定", 350, 150, 60, 40)
 
GUICtrlCreateTabItem("插入")
GUICtrlCreateLabel("第二页文字，看看效果", 30, 80)
GUICtrlCreateCombo("", 30, 150, 60, 120)
GUICtrlSetData(-1, "Trids|CyberSlug|Larry|Jon|Tylo", "Jon")
GUICtrlCreateButton("改变", 180, 150, 50, 20)
 
GUICtrlCreateTabItem("页面布局")
GUICtrlCreateLabel("第三页在这里", 30, 80)
 
GUICtrlCreateTabItem("引用")
GUICtrlCreateButton("第4页了", 30, 80)
GUICtrlCreateTabItem("审阅")
GUICtrlCreateButton("这是第5页哦", 30, 80)
GUICtrlCreateTabItem("")
 
$hdisplayDC = _WinAPI_CreateDC()
;初始化选项卡图像DC
$MyhImage = _WinAPI_LoadImage(0, @ScriptDir & "\OFFICE.bmp", $IMAGE_BITMAP, 0, 0, $LR_LOADFROMFILE)
$hBmpDC = _WinAPI_CreateCompatibleDC($hdisplayDC)
$hBmpSv = _WinAPI_SelectObject($hBmpDC, $MyhImage)
_WinAPI_DeleteObject($MyhImage)
;初始化临时DC，也就是二次缓冲，防止闪烁
$hTempDC = _WinAPI_CreateCompatibleDC($hdisplayDC)
$hTempImage = _WinAPI_CreateCompatibleBitmap($hdisplayDC, $TabWidth * $Tabcount, $TabHeight)
$hTempSv = _WinAPI_SelectObject($hTempDC, $hTempImage)
_WinAPI_DeleteObject($hTempImage)
_WinAPI_DeleteDC($hdisplayDC)
 
Global $TABCallProc = _WinAPI_SetWindowLong(GUICtrlGetHandle($tab), -4, $tTABCallback)
GUISetState()
 
While 1
        $GUIMsg = GUIGetMsg()
        Switch $GUIMsg
                Case $GUI_EVENT_CLOSE
                        _myexitfunc()
        EndSwitch
WEnd
;退出函数，退出前要改回TAB原来的处理函数，不然退出要报错
Func _myexitfunc()
        _WinAPI_SetWindowLong(GUICtrlGetHandle($tab), -4, $TABCallProc)
        DllCallbackFree($hTABCallback)
        ;删除DC
        _WinAPI_SelectObject($hBmpDC, $hBmpSv)
        _WinAPI_DeleteDC($hBmpDC)
        _WinAPI_SelectObject($hTempDC, $hTempSv)
        _WinAPI_DeleteDC($hTempDC)
        Exit
EndFunc   ;==>_myexitfunc


Func My_TABProc($hWnd, $Msg, $wParam, $lParam)
        Switch $Msg
                Case $WM_MOUSEMOVE
                        If Not $TabHover Then;
                                $TabHover = True
                                _WinAPI_TrackMouseEvent($hWnd, 0x00000002)
                        EndIf
                        $mx = _WinAPI_LoWord($lParam)
                        $my = _WinAPI_HiWord($lParam)
                        onMouseMove($hWnd, $mx, $my)
                        Return 0
                Case 0x2A3;WM_MOUSELEAVE
                        $TabHover = False
                        $TabHoverID = -1
                        RedrawAllTAB()
                        Return 0
                Case $WM_ERASEBKGND
                        _JiuGongDraw($wParam, 0, 0, $WinWidth, $WinHeight, $hBmpDC, 19, 25, 1, 2, 0, 0, 0, 0)
                        _JiuGongDraw($wParam, 0, 0, $WinWidth, $TabHeight, $hBmpDC, 0, 0, 1, 27, 0, 0, 0, 1)
                        Return 0
                Case $WM_LBUTTONDOWN
                        $mx = _WinAPI_LoWord($lParam)
                        $my = _WinAPI_HiWord($lParam)
                        onMouseDown($hWnd, $mx, $my)
                        Return _WinAPI_CallWindowProc($TABCallProc, $hWnd, $Msg, $wParam, $lParam)
                Case $WM_PAINT
                        If $Count = 0 Then
                                Local $tPAINTSTRUCT, $hDC
                                $Count += 1
                                $hDC = _WinAPI_BeginPaint($hWnd, $tPAINTSTRUCT)
                                RedrawAllTAB()
                                _WinAPI_EndPaint($hWnd, $tPAINTSTRUCT)
                                $Count -= 1
                                Return 0
                        EndIf
        EndSwitch
        Return _WinAPI_CallWindowProc($TABCallProc, $hWnd, $Msg, $wParam, $lParam)
EndFunc   ;==>My_TABProc
 
Func onMouseMove($hWnd, $mx, $my)
        If $my <= $TabHeight Then
                $Idx = Int($mx / $TabWidth)
                If $Idx >= 0 And $Idx <= $Tabcount - 1 Then
                        If $Idx <> $TabHoverID Then
                                $TabHoverID = $Idx
                                RedrawAllTAB()
                        EndIf
                Else
                        If $TabHoverID <> -1 Then
                                $TabHoverID = -1
                                RedrawAllTAB()
                        EndIf
                EndIf
        Else
                If $TabHoverID >= 0 Then
                        $TabHoverID = -1
                        RedrawAllTAB()
                EndIf
        EndIf
EndFunc   ;==>onMouseMove
 
Func onMouseDown($hWnd, $mx, $my)
        If $my <= $TabHeight Then
                $Idx = Int($mx / $TabWidth)
                If $Idx >= 0 And $Idx <= $Tabcount - 1 Then
                        $TABActiveID = $Idx
                EndIf
        EndIf
EndFunc   ;==>onMouseDown
 
Func RedrawAllTAB()
        For $i = 0 To $Tabcount - 1
                If $i = $TabHoverID Then
                        $stata = 1
                Else
                        $stata = 0
                EndIf
                DrawTAB($hTempDC, $i, $stata, $i * $TabWidth, 0, $TabWidth, $TabHeight)
        Next
        $hDC = _WinAPI_GetDC($tabHwnd)
        _WinAPI_BitBlt($hDC, 0, 0, $TabWidth * $Tabcount, $TabHeight, $hTempDC, 0, 0, $SRCCOPY)
        _WinAPI_ReleaseDC($tabHwnd, $hDC)
EndFunc   ;==>RedrawAllTAB
 
Func DrawTAB($hDC, $nTabID, $TabState, $nLeft, $nTop, $nRight, $nBottom)
        ;这里的数字是由于图像文件决定的
        If $nTabID = $TABActiveID Then;相等就是当前选项卡
                _JiuGongDraw($hDC, $nLeft, $nTop, $nRight, $nBottom, $hBmpDC, 13 + $TabState * 13, 0, 13, 27, 6, 5, 6, 2);$TabState是Hover标志
        Else
                If $TabState = 0 Then
                        _JiuGongDraw($hDC, $nLeft, $nTop, $nRight, $nBottom, $hBmpDC, 0, 0, 1, 27, 0, 0, 0, 1)
                Else
                        _JiuGongDraw($hDC, $nLeft, $nTop, $nRight, $nBottom, $hBmpDC, 0, 0, 13, 27, 6, 5, 6, 2)
                EndIf
        EndIf
        ;绘制选项卡文字
        $tRECT = DllStructCreate($tagRect)
        DllStructSetData($tRECT, "Left", $nLeft)
        DllStructSetData($tRECT, "Top", $nTop)
        DllStructSetData($tRECT, "Right", $nRight + $nLeft)
        DllStructSetData($tRECT, "Bottom", $nBottom)
        _WinAPI_SetBkMode($hDC, $TRANSPARENT)
        $hFont = _WinAPI_CreateFont(14, 0, 0, 0, 400, False, False, False, $DEFAULT_CHARSET, _
                        $OUT_DEFAULT_PRECIS, $CLIP_DEFAULT_PRECIS, $DEFAULT_QUALITY, 0, 'Arial')
        $hOldFont = _WinAPI_SelectObject($hDC, $hFont)
        _WinAPI_DrawText($hDC, _GUICtrlTab_GetItemText($tab, $nTabID), $tRECT, BitOR($DT_CENTER, $DT_VCENTER, $DT_SINGLELINE))
        _WinAPI_SelectObject($hDC, $hOldFont)
        _WinAPI_DeleteObject($hFont)
        Return 1
EndFunc   ;==>DrawTAB
 
;九宫格绘图，参数依次为：目标DC，左,上，长，高，图像DC，左，上，长，高，左上角的长，左上角的高，右下角的长，右下角的高
Func _JiuGongDraw($hDC, $dstX, $dstY, $dstWidth, $dstHeight, $hSrcDC, $SrcX, $SrcY, $srcWidth, $srcHeight, $gX1 = 0, $gY1 = 0, $gX2 = 0, $gY2 = 0)
        If $dstWidth = 0 Or $dstHeight = 0 Or $srcWidth = 0 Or $srcHeight = 0 Then Return
        Local $hmenDC = _WinAPI_CreateCompatibleDC($hDC)
        Local $hSource = _WinAPI_CreateCompatibleBitmap($hDC, $dstWidth, $dstHeight)
        Local $hSv = _WinAPI_SelectObject($hmenDC, $hSource)
        If $gX1 <= 0 And $gX2 <= 0 And $gY1 <= 0 And $gY2 <= 0 Then
                _WinApi_StretchBlt($hmenDC, 0, 0, $dstWidth, $dstHeight, $hSrcDC, $SrcX + $gX1, $SrcY + $gY1, $srcWidth - $gX2, $srcHeight - $gY2, $SRCCOPY)
        Else
                If $gX1 > 0 And $gY1 > 0 Then ;左上角
                        _WinAPI_BitBlt($hmenDC, 0, 0, $gX1, $gY1, $hSrcDC, $SrcX, $SrcY, $SRCCOPY)
                EndIf
                If $gX2 > 0 And $gY1 > 0 Then ;右上角
                        _WinAPI_BitBlt($hmenDC, $dstWidth - $gX2, 0, $gX2, $gY1, $hSrcDC, $SrcX + $srcWidth - $gX2, $SrcY, $SRCCOPY)
                EndIf
                If $gX1 > 0 And $gY2 > 0 Then ;左下角
                        _WinAPI_BitBlt($hmenDC, 0, $dstHeight - $gY2, $gX1, $gY2, $hSrcDC, $SrcX, $SrcY + $srcHeight - $gY2, $SRCCOPY)
                EndIf
                If $gX2 > 0 And $gY2 > 0 Then ;右下角
                        _WinAPI_BitBlt($hmenDC, $dstWidth - $gX2, $dstHeight - $gY2, $gX2, $gY2, $hSrcDC, $SrcX + $srcWidth - $gX2, $SrcY + $srcHeight - $gY2, $SRCCOPY)
                EndIf
                If $gX1 > 0 Then ;左边框
                        _WinApi_StretchBlt($hmenDC, 0, $gY1, $gX1, $dstHeight - $gY1 - $gY2, $hSrcDC, $SrcX, $SrcY + $gY1, $gX1, $srcHeight - $gY1 - $gY2, $SRCCOPY)
                EndIf
                If $gX2 > 0 Then ;右边框
                        _WinApi_StretchBlt($hmenDC, $dstWidth - $gX2, $gY1, $gX2, $dstHeight - $gY1 - $gY2, $hSrcDC, $SrcX + $srcWidth - $gX2, $SrcY + $gY1, $gX2, $srcHeight - $gY1 - $gY2, $SRCCOPY)
                EndIf
                If $gY1 > 0 Then ;上边框
                        _WinApi_StretchBlt($hmenDC, $gX1, 0, $dstWidth - $gX1 - $gX2, $gY1, $hSrcDC, $SrcX + $gX1, $SrcY, $srcWidth - $gX1 - $gX2, $gY1, $SRCCOPY)
                EndIf
                If $gY2 > 0 Then ;下边框
                        _WinApi_StretchBlt($hmenDC, $gX1, $dstHeight - $gY2, $dstWidth - $gX1 - $gX2, $gY2, $hSrcDC, $SrcX + $gX1, $SrcY + $srcHeight - $gY2, $srcWidth - $gX1 - $gX2, $gY2, $SRCCOPY)
                EndIf
                ;中间的伸展部分
                _WinApi_StretchBlt($hmenDC, $gX1, $gY1, $dstWidth - $gX1 - $gX2, $dstHeight - $gY1 - $gY2, $hSrcDC, $SrcX + $gX1, $SrcY + $gY1, $srcWidth - $gX1 - $gX2, $srcHeight - $gY1 - $gY2, $SRCCOPY)
        EndIf
        _WinAPI_BitBlt($hDC, $dstX, $dstY, $dstWidth, $dstHeight, $hmenDC, 0, 0, $SRCCOPY)
        _WinAPI_SelectObject($hmenDC, $hSv)
        _WinAPI_DeleteObject($hSource)
        _WinAPI_DeleteDC($hmenDC)
EndFunc   ;==>_JiuGongDraw
 
Func _WinAPI_CreateDC()
        Local $aResult = DllCall("gdi32.dll", "handle", "CreateDC", "str", "DISPLAY", "str", "", "str", "", "ptr", 0)
        If @error Then Return SetError(@error, @extended, 0)
        Return $aResult[0]
EndFunc   ;==>_WinAPI_CreateDC
