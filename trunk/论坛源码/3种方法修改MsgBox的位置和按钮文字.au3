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

#cs
;第1种
;===============================================================================
;~ 参考： http://www.autoitscript.com/forum/topic/27507-move-msgbox-and-change-the-buttons/
;~ 函数: _MsgBoxChangeButtons()
;~ 描述: 修改 MsgBox() 的位置或按钮文字
;~ 原UDF作者: HerewasPlato and Smoke_N ChrisL
;~ 修改：甲壳虫
;~ 参数:
;~ $flag = MsgBox() 的 flag
;~ $title = MsgBox() 标题
;~ $text = MsgBox() 的信息内容
;~ $timeout = MsgBox() 超时
;~ $hwnd = MsgBox() 的 hwnd
;~ $Button1 = 第一个按钮要显示的文字
;~ $Button2 = 第二个按钮要显示的文字
;~ $Button3 = 第三个按钮要显示的文字
;~ $x = MsgBox() 的 x 坐标
;~ $y = MsgBox() 的 y 坐标
;~ 返回值: 同 MsgBox() 的返回值
;~ 例:
$msg = _MsgBoxChangeButtons(3, '_MsgBoxChangeButtons()示例', _
                '本例对 MsgBox(3, "标题", "...") 的按钮和位置进行修改：' & @CRLF & _
                '第一个按钮“是”改成“按钮1”' & @CRLF & _
                '第二个按钮“否”改成“修改设置”' & @CRLF & _
                '第三个按钮“取消”不修改' & @CRLF & _
                'x 座标不变，y 座标改成 100', 0, '', '按钮1', '修改设置', '', '', 100)
MsgBox(0, '_MsgBoxChangeButtons()', '返回：' & $msg)
;===============================================================================

Func _MsgBoxChangeButtons($flag, $title, $text, $timeout = 0, $hwnd = '', $Button1 = '', $Button2 = '', $Button3 = '', $x = '', $y = '')
        Local $sText = StringRegExpReplace($text, '(?:\r|\n).*', '') ; 只取第一行
        Local $MBLine = '#NoTrayIcon' & @CRLF
        $MBLine &= 'Opt("WinWaitDelay", 0)' & @CRLF
        $MBLine &= 'WinWait(''' & $title & ''', ''' & $sText & ''', 1)' & @CRLF
        If $x <> '' Or $y <> '' Then
                If $x = '' Then $x = 'Default'
                If $y = '' Then $y = 'Default'
                $MBLine &= 'WinMove(''' & $title & ''', ''' & $sText & ''' , ' & $x & ', ' & $y & ')' & @CRLF
        EndIf
        If $Button1 <> '' Then $MBLine &= 'ControlSetText(''' & $title & ''', ''' & $sText & ''', ''Button1'', ''' & $Button1 & ''')' & @CRLF
        If $Button2 <> '' Then $MBLine &= 'ControlSetText(''' & $title & ''', ''' & $sText & ''', ''Button2'', ''' & $Button2 & ''')' & @CRLF
        If $Button3 <> '' Then $MBLine &= 'ControlSetText(''' & $title & ''', ''' & $sText & ''', ''Button3'', ''' & $Button3 & ''')' & @CRLF
        $MBLine &= 'FileDelete(@ScriptFullPath)' ; 删除自己

        Local $MBFile = @ScriptDir & '\MiscMMB.au3'
        FileDelete($MBFile)
        FileWrite($MBFile, $MBLine)
        Run(@AutoItExe & ' /AutoIt3ExecuteScript "' & $MBFile & '"')
        Return MsgBox($flag, $title, $text, $timeout, $hwnd)
EndFunc   ;==>_MsgBoxChangeButtons
#ce


#cs
;第2种
;===============================================================================
;~ 函数: MsgBoxEx()
;~ 描述: 修改 MsgBox() 的位置或按钮文字
;~ 作者：甲壳虫
;~ 参数:
;~ $flag = MsgBox() 的 flag
;~ $title = MsgBox() 标题
;~ $text = MsgBox() 的信息内容
;~ $timeout = MsgBox() 超时
;~ $hwnd = MsgBox() 的 hwnd
;~ $Button1 = 第一个按钮要显示的文字
;~ $Button2 = 第二个按钮要显示的文字
;~ $Button3 = 第三个按钮要显示的文字
;~ $x = MsgBox() 的 x 坐标
;~ $y = MsgBox() 的 y 坐标
;~ 返回值: 同 MsgBox() 的返回值
;~ 例:
$msg = MsgBoxEx(3, '_MsgBoxEx()示例', _
                '本例对 MsgBox(3, "标题", "...") 的按钮和位置进行修改：' & @CRLF & _
                '第一个按钮“是”改成“按钮1”' & @CRLF & _
                '第二个按钮“否”改成“修改设置”' & @CRLF & _
                '第三个按钮“取消”不修改' & @CRLF & _
                'x 座标不变，y 座标改成 100', 0, '', '按钮1', '修改设置', '', '', 100)
MsgBox(0, 'MsgBoxEx()', '返回：' & $msg)
;===============================================================================

Func MsgBoxEx($flag, $title, $text, $TimeOut = 0, $hwnd = '', $Button1 = '', $Button2 = '', $Button3 = '', $x = '', $y = '')
        Global $MB__title = $title, $MB__text = $text
        Global $MB__Button1 = $Button1, $MB__Button2 = $Button2, $MB__Button3 = $Button3
        Global $MB__x = $x, $MB__y = $y
        Global $MB__Timer = DllCallbackRegister('MB__Timer', 'int', 'hwnd;uint;uint;dword')
        Global $MB__TimerDLL = DllCall('user32.dll', 'uint', 'SetTimer', 'hwnd', 0, 'uint', _
                        0, 'int', 1, 'ptr', DllCallbackGetPtr($MB__Timer))
        Sleep(3)
        Return MsgBox($flag, $title, $text, $TimeOut, $hwnd)
EndFunc   ;==>MsgBoxEx

Func MB__Timer($hwnd, $uiMsg, $idEvent, $dwTime)
        If WinExists($MB__title, $MB__text) Then
                ; 移动 MsgBox 位置
                If $MB__x <> '' Or $MB__y <> '' Then
                        If $MB__x = '' Then $MB__x = Default
                        If $MB__y = '' Then $MB__y = Default
                        WinMove($MB__title, $MB__text, $MB__x, $MB__y)
                EndIf
                ; 修改按钮文字
                If $MB__Button1 <> '' Then ControlSetText($MB__title, $MB__text, 'Button1', $MB__Button1)
                If $MB__Button2 <> '' Then ControlSetText($MB__title, $MB__text, 'Button2', $MB__Button2)
                If $MB__Button3 <> '' Then ControlSetText($MB__title, $MB__text, 'Button3', $MB__Button3)

                DllClose($MB__TimerDLL)
                DllCallbackFree($MB__Timer)
        EndIf
EndFunc   ;==>MB__Timer
#ce


#cs
;第3种
;===============================================================================
;~ 参考： http://www.autoitx.com/viewthread.php?tid=13550&extra=&page=3
;~ 函数: MsgBoxE()
;~ 描述: 修改 MsgBox() 的位置或按钮文字
;~ 作者：甲壳虫
;~ 参数:
;~ $flag = MsgBox() 的 flag
;~ $title = MsgBox() 标题
;~ $text = MsgBox() 的信息内容
;~ $timeout = MsgBox() 超时
;~ $hwnd = MsgBox() 的 hwnd
;~ $Button1 = 第一个按钮要显示的文字
;~ $Button2 = 第二个按钮要显示的文字
;~ $Button3 = 第三个按钮要显示的文字
;~ $x = MsgBox() 的 x 坐标
;~ $y = MsgBox() 的 y 坐标
;~ 返回值: 同 MsgBox() 的返回值
;~ 例:
$msg = MsgBoxE(3, '_MsgBoxE()示例', _
                '本例对 MsgBox(3, "", "...") 的按钮和位置进行修改：' & @CRLF & @CRLF & _
                '第一个按钮“是”改成“按钮1”' & @CRLF & _
                '第二个按钮“否”改成“修改设置”' & @CRLF & _
                '第三个按钮“取消”不修改' & @CRLF & _
                'x 座标不变，y 座标改成 100', 0, '', '按钮1', '修改设置', '', '', 100)
MsgBox(0, 'MsgBoxE()', '返回：' & $msg)
;===============================================================================
Func MsgBoxE($flag, $title, $text, $timeout = 0, $hwnd = '', $Button1 = '', $Button2 = '', $Button3 = '', $x = '', $y = '')

        ; 参数加在 title 后面传递给 MB__CallBack，避免使用全局变量
        $title &= @crlf & 'B1=' & $Button1 & @crlf & 'B2=' & $Button2 & @crlf & 'B3=' & $Button3 & @crlf & 'x=' & $x & @crlf & 'y=' & $y

        Local $hGUI = GUICreate("")
        Local $sFuncName = "GetWindowLongW"
        If @AutoItX64 Then $sFuncName = "GetWindowLongPtrW"
        Local $aResult = DllCall("user32.dll", "long_ptr", $sFuncName, "hwnd", $hGUI, "int", -6)
        Local $hInst = $aResult[0]

        $aResult = DllCall("kernel32.dll", "dword", "GetCurrentThreadId")
        Local $iThreadId = $aResult[0]

        Local $hCallBack = DllCallbackRegister("MB__CallBack", "int", "int;hWnd;ptr")
        Local $pCallBack = DllCallbackGetPtr($hCallBack)

        $aResult = DllCall("user32.dll", "handle", "SetWindowsHookEx", "int", 5, "ptr", $pCallBack, "handle", $hInst, "dword", $iThreadId)
        Local $hHook = $aResult[0]

        Local $msg = MsgBox($flag, $title, $text, $timeout, $hwnd)

        GUIDelete($hGUI)
        DllCall("user32.dll", "bool", "UnhookWindowsHookEx", "handle", $hHook)
        DllCallbackFree($hCallBack)
        Return $msg
EndFunc   ;==>MsgBoxE

Func MB__CallBack($iCode, $wParam, $lParam)
;~         ConsoleWrite('$iCode=' & $iCode & ', $wParam=' & $wParam & ', $lParam=' & $lParam & @CRLF)

        If $iCode = 5 Then

                Local $title = WinGetTitle($wParam)
                If Not StringInStr($title, @crlf & 'B1=') Then Return

                Local $match = StringRegExp($title, '(?i)\r\nB1=(.*)\r\nB2=(.*)\r\nB3=(.*)\r\nx=(.*)\r\ny=(.*)', 1)
                If @error Then Return

                ; 改回 title
                $title = StringRegExpReplace($title, '(?i)(?s)\r\nB1=.*', '')
                WinSetTitle($wParam, '', $title)

                ; 移动 MsgBox 位置
                If $match[3] <> '' Or $match[4] <> '' Then
                        If $match[3] = '' Then $match[3] = Default
                        If $match[4] = '' Then $match[4] = Default
                        WinMove($wParam, '', $match[3], $match[4])
                EndIf

                ; 修改按钮文字
                If $match[0] <> '' Then ControlSetText($wParam, '', 'Button1', $match[0])
                If $match[1] <> '' Then ControlSetText($wParam, '', 'Button2', $match[1])
                If $match[2] <> '' Then ControlSetText($wParam, '', 'Button3', $match[2])
        EndIf
EndFunc   ;==>MB__CallBack
#ce