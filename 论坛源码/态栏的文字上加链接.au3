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
#include <GUIStatusBar.au3>
#include <GUIConstants.au3>
#include <WindowsConstants.au3>

$hGUI = GUICreate("Test", 400, 300)

;GUICtrlCreateLabel("www.google.cn", 4, 4, 200, 20)
GUICtrlCreateLabel("谷歌", 4, 4, 200, 20)
GUICtrlSetFont(-1, 9, 400, 4, "Verdana")

$hFont = _SendMessage(GUICtrlGetHandle(-1), $WM_GETFONT, 0, 0)
;Local $aText[2] = ["www.google.cn", ""], $aPart[2] = [400 / 1.5, -1]
Local $aText[2] = ["谷歌", ""], $aPart[2] = [400 / 1.5, -1]
$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPart, $aText)
_SendMessage($hStatusBar, $WM_SETFONT, $hFont, 1, 0, "wparam", "int")
GUICtrlSetState(-1, $GUI_HIDE)

$hLibrary = _WinAPI_LoadLibrary("Shell32.dll")
$hCursor = _LoadCursor($hLibrary, 1002)
_WinAPI_FreeLibrary($hLibrary)

$hSTC = DllCallbackRegister("_StatusBarProcedure", "int", "hWnd;uint;wparam;lparam")
$hOSTC = _WinAPI_SetWindowLong($hStatusBar, -4, DllCallbackGetPtr($hSTC))

Func _StatusBarProcedure($hWnd, $iMsg, $iwParam, $ilParam)
        Local $iX, $iY

        If (($iMsg = $WM_MOUSEMOVE) Or ($iMsg = $WM_LBUTTONDOWN) Or _
                ($iMsg = $WM_LBUTTONUP) Or ($iMsg = $WM_LBUTTONDBLCLK)) Then
                $iX = bitAnd($ilParam, 0xFFFF)
                $iY = bitShift($ilParam, 0x10)

                If ($iX > 0 And $iX < 100) And ($iY > 0 And $iY < 21) Then
                        _SetCursor($hCursor)
                        If ($iMsg = $WM_LBUTTONDBLCLK) Then
                                ShellExecute("www.google.cn")
                        EndIf
                EndIf
        EndIf
        Return _WinAPI_CallWindowProc($hOSTC, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc        ;==>_StatusBarProcedure

GUISetState()

Do
Until GUIGetMsg() = -3

Opt("TrayIconHide", 1)
ProcessClose(@AutoItPid)

Func _LoadCursor($hInstance, $iCursorId)
        Local $iResult
        $iResult = DllCall("User32.dll", "hWnd", "LoadCursor", "hWnd", $hInstance, "int", $iCursorId)
        Return $iResult[0]
EndFunc        ;==>_LoadCursor

Func _SetCursor($hCursor)
        Local $iResult = DllCall("User32.dll", "int", "SetCursor", "hWnd", $hCursor)
        Return $iResult[0]
EndFunc        ;==>_SetCursor
