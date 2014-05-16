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

$title = 'C:\sss' ;指定一个不存在的路径做测试，接下来肯定会弹出一个错误。
_WinAdlib($title, '确定', 'test') ;必须在弹窗之前

ShellExecute($title) ;将会弹出错误消息框
;Msgbox(64, 'ok', '脚本继续。(本例已完)')

Func test()
        Send('{Enter}')
        WinClose($title, '确定')
EndFunc   ;==>test



; 函数名:_WinAdlib;=======================================================================
; 说明:　在弹窗出现时执行某个函数
; 语法:　_WinAdlib('窗口标题', '窗口文本', '函数名'[, '超时'])
; 返回值:无
;====================================================================================start
Func _WinAdlib($title, $text, $Func, $timeout = 10000)
        Global $__title = $title, $__text = $text, $__Func = $Func, $__timeouts, $__timeout = $timeout
        Global $__Timer = DllCallbackRegister('__Timer', 'int', 'hwnd;uint;uint;dword')
        Global $__TimerDLL = DllCall('user32.dll', 'uint', 'SetTimer', 'hwnd', 0, 'uint', _
                        0, 'int', 100, 'ptr', DllCallbackGetPtr($__Timer))
EndFunc   ;==>_WinAdlib
Func __Timer($hwnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $__TimerDLL[0] Then
                If WinActive($__title, $__text) Then
                        ;如果弹窗已非激活方式弹窗则应使用WinExists()
                        DllCallbackFree($__Timer)
                        Call($__Func)
                Else
                        $__timeouts += 100
                        If $__timeouts >= $__timeout Then
                                DllCallbackFree($__Timer)
                        EndIf
                EndIf
        EndIf
EndFunc   ;==>__Timer