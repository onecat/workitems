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

Func _GetWinInfoFromPoint($title, $text, $_x, $_y, $RtFlag = 1)
        ;afan提示：本函数用于获取窗口指定坐标点包含的窗口(控件)的句柄、id、文本信息
        ;$title - 窗口标题(也可直接使用句柄)
        ;$text - 窗口文本(如果$title使用句柄则该参数被忽略)
        ;$_x - 控件相对窗口坐标x
        ;$_y - 控件相对窗口坐标y

        ;$RtFlag - 返回信息标志[可选参数]
        ;　　　　　= 1 返回窗口(或控件)句柄(默认)
        ;　　　　　= 2 返回控件的内部标识符(id)
        ;　　　　　= 3 返回控件文本

        ;返回值：  @Error =0 根据返回标志返回字符串信息
        ;　　　　　@Error =1:未匹配到目标窗口；=2:检索句柄错误；=3:检索id错误；=4:拾取控件文本错误

        Local $hWnd = Hwnd($title)
        If Not IsHwnd($hWnd) Then
                $hWnd = WinGetHandle($title, $text)
                If @Error Then Return SetError(1, '', '')
        EndIf
        Local $tPoint = DllStructCreate('long X;long Y')
        DllStructSetData($tPoint, 1, $_x)
        DllStructSetData($tPoint, 2, $_y)
        DllCall('user32.dll', 'bool', 'ClientToScreen', 'hwnd', $hWnd, 'ptr', DllStructGetPtr($tPoint))
        Local $tPointCast = DllStructCreate('int64', DllStructGetPtr($tPoint))
        Local $aRt0 = DllCall('user32.dll', 'hwnd', 'WindowFromPoint', 'int64', DllStructGetData($tPointCast, 1))
        If @error Then Return SetError(2, '', '')
        $hStatic = $aRt0[0]
        Switch $RtFlag
                Case 1
                        Return $hStatic
                Case 2
                        Local $aRt1 = DllCall('user32.dll', 'int', 'GetDlgCtrlID', 'hwnd', $hStatic)
                        If @error Then Return SetError(3, '', '')
                        Return $aRt1[0]
                Case 3
                        Local $sTxt = ControlGetText($hWnd, '', $hStatic)
                        If @error Then Return SetError(4, '', '')
                        Return $sTxt
        EndSwitch
EndFunc   ;==>_GetWinInfoFromPoint