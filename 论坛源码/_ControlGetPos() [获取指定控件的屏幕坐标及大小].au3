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

;例子：
ShellExecute(@SystemDir & '\calc.exe')
Sleep(1000)
$cp = _ControlGetPos('计算器', '', 'Button13')
MsgBox(0, 'C 键的屏幕坐标为： ' & $cp[0] & '  ' & $cp[1], '点击确定后将移动鼠标到目标中心位置 ')
MouseMove($cp[0] + $cp[2] / 2, $cp[1] + $cp[3] / 2)


; 函数名:_ControlGetPos;========================================================================
; 说明:　获取指定控件相对屏幕左上角(0,0)的坐标位置和大小等信息
; 语法:　_ControlGetPos('窗口句柄或标题', '窗口文本', '控件ID')
; 返回值:成功: 返回一个储存指定控件相对屏幕左上角(0,0)位置及大小信息的数组: 
;　　　　　　　$array[0] = X 坐标, $array[1] = Y 坐标, $array[2] = 宽度, $array[3] = 高度 
;　　　　失败: 返回0。并设置@Error=1 指定的窗口或控件不存在；@Error=2 返回$tagPOINT结构错误；
; 作者:　Afan - www.autoitx.com
;==========================================================================================start
Func _ControlGetPos($hWnd, $text, $Ctrlid)
        Local $ControlPos = ControlGetPos($hWnd, $text, $Ctrlid)
        If @error Then Return SetError(1)
        If Not IsHWnd($hWnd) Then $hWnd = WinGetHandle($hWnd, $text)
        Local $tPoint = DllStructCreate('int X;int Y')
        DllStructSetData($tPoint, 'X', $ControlPos[0])
        DllStructSetData($tPoint, 'Y', $ControlPos[1])
        DllCall("user32.dll", "bool", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($tPoint))
        If @error Then Return SetError(2)
        Local $xy[4] = [DllStructGetData($tPoint, 'X'), DllStructGetData($tPoint, 'Y'), $ControlPos[2], $ControlPos[3]]
        Return $xy
EndFunc   ;==>_ControlGetPos