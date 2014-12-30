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


;用多进程解决，以下省略号表示主程序代码

;……

#include <CoProc.au3>;这个是处理多进程的UDF，必需包含

;……
$PIDok=_CoProc('_ok') ;在网页对话框出现之前运行子进程，同时返回子进程PID值

;……这里的主程序代码将打开网页对话框

ProcessClose($PIDok);关闭完成使命的子进程，要用时可重新开启。

;……主程序继续

;……

Func _ok();这是子进程代码，必须是一个函数
        While 1 
                If Not WinExists('会计人员继续教育助学助考', '') Then ExitLoop ;如果主程序不在就退出
                WinWaitActive("来自网页的消息")
                                ;WinClose("来自网页的消息")，你也可以这样，但当对话框上有多个按钮时就……
                                ControlClick("来自网页的消息", "", "[CLASS:Button; TEXT:确定]");我没有直接关闭对话框，而是点击“确定”，这样更保险
        WEnd
EndFunc   ;==>_ok