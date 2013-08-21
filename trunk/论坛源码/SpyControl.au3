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
#include-once
#include <WindowsConstants.au3>
#include <APIConstants.au3>
#include <WinAPI.au3>
 
Global Const $WM_MYSPYMSG = $WM_USER + 99
;==========================================================
;                                               自定义消息
;$wParam 返回窗口句柄
;$lParam 低位相对X坐标，高位相对Y坐标
;==========================================================
 
Global $SPY_ICON_CURSOR = @TempDir & "\AutoItSpy\cursor.cur"
Global $SPY_ICON_FULL = @TempDir & "\AutoItSpy\full.ico"
Global $SPY_ICON_EMPTY = @TempDir & "\AutoItSpy\empty.ico"
 
__WriteFile($SPY_ICON_CURSOR, __File_Cursor())
__WriteFile($SPY_ICON_FULL, __File_Full())
__WriteFile($SPY_ICON_EMPTY, __File_Empty())
 
Global $SPY_CTRL_CURSOR = __WinAPI_LoadCursorFromFile($SPY_ICON_CURSOR)
 
Global $SPY_CTRL_CURSOR_OLD
 
Global $SPY_CTRL_GUI, $SPY_CTRL_ID, $SPY_CTRL_HANDLE
 
Global $SPY_CTRL_FIND = 0, $SPY_CTRL_FIND_LAST = 0
 
Global $SPY_CTRL_START = False
 
;==========================================================
;GUI窗口创建SPY控件
;注：内部注册WM_COMMAND、WM_MOUSEMOVE、WM_LBUTTONUP
;        使用前确认没和主程序消息注册起冲突
;==========================================================
Func GUICtrlCreateSpy($hWnd, $iX, $iY, $iW = 32, $iH = 32)
        
        $SPY_CTRL_GUI = $hWnd
        $SPY_CTRL_ID = GUICtrlCreateIcon($SPY_ICON_FULL, -1, $iX, $iY, $iW, $iH)
        $SPY_CTRL_HANDLE = GUICtrlGetHandle($SPY_CTRL_ID)
        GUIRegisterMsg($WM_COMMAND, 'WM_COMMAND')
        GUIRegisterMsg($WM_MOUSEMOVE, "WM_MOUSEMOVE")
        GUIRegisterMsg($WM_LBUTTONUP, "WM_LBUTTONUP")
        
        Return $SPY_CTRL_ID
EndFunc   ;==>GUICtrlCreateSpy
 
Func WM_COMMAND($hWnd, $nMsg, $wParam, $lParam)
        
        Local $iCode = _WinAPI_HiWord($wParam)
        Local $iCtrl = _WinAPI_LoWord($wParam)
        Local $hCtrl = $lParam
        
        Switch $iCtrl
                Case $SPY_CTRL_ID
                        $SPY_CTRL_START = True
                        _WinAPI_SetCapture($SPY_CTRL_GUI)
                        $SPY_CTRL_CURSOR_OLD = _WinAPI_SetCursor($SPY_CTRL_CURSOR)
                        GUICtrlSetImage($SPY_CTRL_ID, $SPY_ICON_EMPTY)
        EndSwitch
        
        Return 0
EndFunc   ;==>WM_COMMAND
 
Func WM_MOUSEMOVE($hWnd, $nMsg, $wParam, $lParam)
        If Not $SPY_CTRL_START Then Return 1
        
        Local $tPoint, $iLong, $iX, $iY
        
        $tPoint = _WinAPI_GetMousePos()
        $SPY_CTRL_FIND = _WinAPI_WindowFromPoint($tPoint)
        
        If ($SPY_CTRL_FIND = $SPY_CTRL_GUI) Or (_WinAPI_GetParent($SPY_CTRL_FIND) = $SPY_CTRL_GUI) Then
                $SPY_CTRL_FIND = 0
        Else
                If $SPY_CTRL_FIND_LAST <> $SPY_CTRL_FIND Then
                        __Spy_Draw_Frame($SPY_CTRL_FIND_LAST)
                        __Spy_Draw_Frame($SPY_CTRL_FIND)
                        $SPY_CTRL_FIND_LAST = $SPY_CTRL_FIND
                EndIf
                _WinAPI_ScreenToClient($SPY_CTRL_FIND, $tPoint)
                $iX = DllStructGetData($tPoint, "X")
                $iY = DllStructGetData($tPoint, "Y")
                ;ConsoleWrite($iX & "," & $iY & @CRLF)
                $iLong = _WinAPI_MakeLong($iX, $iY)
                _WinAPI_PostMessage($SPY_CTRL_GUI, $WM_MYSPYMSG, $SPY_CTRL_FIND, $iLong);异步投递，防止消息相互干扰
        EndIf
        Return 1
EndFunc   ;==>WM_MOUSEMOVE
 
Func WM_LBUTTONUP($hWnd, $nMsg, $wParam, $lParam)
        If Not $SPY_CTRL_START Then Return 1
        $SPY_CTRL_START = False
        
        __Spy_Draw_Frame($SPY_CTRL_FIND_LAST)
        _WinAPI_ReleaseCapture()
        _WinAPI_SetCursor($SPY_CTRL_CURSOR_OLD)
        GUICtrlSetImage($SPY_CTRL_ID, $SPY_ICON_FULL)
        
        $SPY_CTRL_FIND_LAST = 0
        Return 1
EndFunc   ;==>WM_LBUTTONUP
 
;==========================================================
;P版原创，Copy而来
;==========================================================
Func __Spy_Draw_Frame($hWnd)
        If Not IsHWnd($hWnd) Then Return False
 
        Local $hDC, $hPen, $hBrush, $hRgn, $aPos, $tRect
 
        $hDC = _WinAPI_GetWindowDC($hWnd)
        $hPen = _WinAPI_CreatePen($PS_SOLID, 3, 0x000000)
        $hBrush = _WinAPI_GetStockObject($NULL_BRUSH)
        _WinAPI_SelectObject($hDC, $hPen)
        _WinAPI_SelectObject($hDC, $hBrush)
        __WinAPI_SetROP2($hDC, $R2_NOT) ;$R2_XORPEN
        
        $hRgn = _WinAPI_CreateRectRgn(0, 0, @DesktopWidth, @DesktopHeight)
        If _WinAPI_GetWindowRgn($hWnd, $hRgn) Then
                __WinAPI_FrameRgn($hDC, $hRgn, $hPen, 3, 3)
        Else
                $aPos = WinGetPos($hWnd)
                If @error Then Return False
                $tRect = __WinAPI_CreateRect(0, 0, $aPos[2], $aPos[3])
                __WinAPI_Rectangle($hDC, $tRect)
        EndIf
        
        _WinAPI_DeleteObject($hRgn)
        _WinAPI_DeleteObject($hPen)
        _WinAPI_DeleteObject($hBrush)
        _WinAPI_ReleaseDC($hWnd, $hDC)
        Return True
EndFunc ;==>__Spy_Draw_Frame
 
;==========================================================
;WinAPIEx部分函数单独提取
;加快启动速度
;==========================================================
Func __WinAPI_Rectangle($hDC, $tRECT)
 
        Local $Ret = DllCall('gdi32.dll', 'int', 'Rectangle', 'hwnd', $hDC, 'int', DllStructGetData($tRECT, 1), 'int', DllStructGetData($tRECT, 2), 'int', DllStructGetData($tRECT, 3), 'int', DllStructGetData($tRECT, 4))
 
        If (@error) Or (Not $Ret[0]) Then
                Return SetError(1, 0, 0)
        EndIf
        Return 1
EndFunc   ;==>_WinAPI_Rectangle
 
Func __WinAPI_CreateRect($iLeft, $iTop, $iRight, $iBottom)
 
        Local $tRECT = DllStructCreate($tagRECT)
 
        DllStructSetData($tRECT, 1, $iLeft)
        DllStructSetData($tRECT, 2, $iTop)
        DllStructSetData($tRECT, 3, $iRight)
        DllStructSetData($tRECT, 4, $iBottom)
 
        Return $tRECT
EndFunc   ;==>_WinAPI_CreateRect
 
Func __WinAPI_FrameRgn($hDC, $hRgn, $hBrush, $iWidth, $iHeight)
 
        Local $Ret = DllCall('gdi32.dll', 'int', 'FrameRgn', 'hwnd', $hDC, 'ptr', $hRgn, 'ptr', $hBrush, 'int', $iWidth, 'int', $iHeight)
 
        If (@error) Or (Not $Ret[0]) Then
                Return SetError(1, 0, 0)
        EndIf
        Return 1
EndFunc   ;==>_WinAPI_FrameRgn
 
Func __WinAPI_SetROP2($hDC, $iMode)
 
        Local $Ret = DllCall('gdi32.dll', 'int', 'SetROP2', 'hwnd', $hDC, 'int', $iMode)
 
        If (@error) Or (Not $Ret[0]) Then
                Return SetError(1, 0, 0)
        EndIf
        Return $Ret[0]
EndFunc   ;==>_WinAPI_SetROP2
 
Func __WinAPI_LoadCursorFromFile($sFile)
 
        Local $Ret = DllCall('user32.dll', 'ptr', 'LoadCursorFromFileW', 'wstr', $sFile)
 
        If (@error) Or (Not $Ret[0]) Then
                Return SetError(1, 0, 0)
        EndIf
        Return $Ret[0]
EndFunc   ;==>_WinAPI_LoadCursorFromFile
 
;==========================================================
;资源函数
;==========================================================
Func __WriteFile($sFile, $bFile)
        Local $hFile
        If Not FileExists($sFile) Then
                $hFile = FileOpen($sFile, 2 + 8 + 16)
                FileWrite($hFile, $bFile)
                FileClose($hFile)
        EndIf
EndFunc   ;==>_WriteFile
 
Func __File_Empty()
        Return _
                        "0x0000010001002020080000000000E80200001600000028000000200000004000000001000400000000000002" & _
                        "000000000000000000001000000010000000000000000000800000800000008080008000000080008000808000" & _
                        "00C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000" & _
                        "00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF" & _
                        "FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FF" & _
                        "FFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFF" & _
                        "F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFF" & _
                        "FFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF" & _
                        "FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFF" & _
                        "FFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF" & _
                        "FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0" & _
                        "00FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000007770CCCCCCCCCCCCCCCCCCCC" & _
                        "C07770007070CCCCCCCCCCCCCCCCCCCCC07070007770CCCCCCCCCCCCCCCCCCCCC0777000000000000000000000" & _
                        "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" & _
                        "000000000000000000FFFFFFFF8000000080000000800000008000000080000000800000008000000080000000" & _
                        "800000008000000080000000800000008000000080000000800000008000000080000000800000008000000080" & _
                        "0000008000000080000000800000008000000080000000800000008000000080000000FFFFFFFFFFFFFFFFFFFF" & _
                        "FFFF"
EndFunc   ;==>__File_Empty
 
Func __File_Full()
        Return _
                        "0x0000010001002020080000000000E80200001600000028000000200000004000000001000400000000000002" & _
                        "000000000000000000001000000010000000000000000000800000800000008080008000000080008000808000" & _
                        "00C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000" & _
                        "00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF" & _
                        "FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFF00000FFFFFFFFFFFF000FFFFFFFFFF00FF0FF00FFFFFFFFFF000FF" & _
                        "FFFFFFF0FF00000FF0FFFFFFFFF000FFFFFFFF0FFFFF0FFFFF0FFFFFFFF000FFFFFFF0FFFF00000FFFF0FFFFFF" & _
                        "F000FFFFFFF0FFFFFF0FFFFFF0FFFFFFF000FFFFFF0F0F0FF000FF0F0F0FFFFFF000FFFFFF0F0F0F0FFF0F0F0F" & _
                        "0FFFFFF000FFFFFF0000000F0F0000000FFFFFF000FFFFFF0F0F0F0FFF0F0F0F0FFFFFF000FFFFFF0F0F0FF000" & _
                        "FF0F0F0FFFFFF000FFFFFFF0FFFFFF0FFFFFF0FFFFFFF000FFFFFFF0FFFF00000FFFF0FFFFFFF000FFFFFFFF0F" & _
                        "FFFF0FFFFF0FFFFFFFF000FFFFFFFFF0FF00000FF0FFFFFFFFF000FFFFFFFFFF00FF0FF00FFFFFFFFFF000FFFF" & _
                        "FFFFFFFF00000FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0" & _
                        "00FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000007770CCCCCCCCCCCCCCCCCCCC" & _
                        "C07770007070CCCCCCCCCCCCCCCCCCCCC07070007770CCCCCCCCCCCCCCCCCCCCC0777000000000000000000000" & _
                        "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" & _
                        "000000000000000000FFFFFFFF8000000080000000800000008000000080000000800000008000000080000000" & _
                        "800000008000000080000000800000008000000080000000800000008000000080000000800000008000000080" & _
                        "0000008000000080000000800000008000000080000000800000008000000080000000FFFFFFFFFFFFFFFFFFFF" & _
                        "FFFF"
EndFunc   ;==>__File_Full
 
Func __File_Cursor()
        Return _
                        "0x000002000100202000000F001000300100001600000028000000200000004000000001000100000000008000" & _
                        "00000000000000000000020000000200000000000000FFFFFF0000000000000000000000000000000000000000" & _
                        "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" & _
                        "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" & _
                        "00000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" & _
                        "FFFFFFF83FFFFFE6CFFFFFD837FFFFBEFBFFFF783DFFFF7EFDFFFEAC6AFFFEABAAFFFE0280FFFEABAAFFFEAC6A" & _
                        "FFFF7EFDFFFF783DFFFFBEFBFFFFD837FFFFE6CFFFFFF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" & _
                        "FFFFFFFFFFFFFFFFFFFFFFFF"
EndFunc   ;==>__File_Cursor
