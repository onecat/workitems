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

_Specify_Priority_Run("C:\Program Files\CCleaner\CCleaner.exe", 2);优先级 = 高
_Specify_Priority_Run("C:\Program Files\CCleaner\CCleaner.exe");优先级 = 普通
Func _Specify_Priority_Run($Process, $Priority = 0)
        If StringRight($Process, 4) = '.exe' Then
                If $Priority = 2 Then
                        $Priority = 'High'
                ElseIf $Priority = 3 Then
                        $Priority = 'Realtime'
                ElseIf $Priority = 1 Then
                        $Priority = 'AboveNormal'
                ElseIf $Priority = 0 Then
                        $Priority = 'Normal'
                ElseIf $Priority = -1 Then
                        $Priority = 'BelowNormal'
                ElseIf $Priority = -2 Then
                        $Priority = 'Low'
                EndIf
                RunWait(@ComSpec & ' /c START /' & $Priority & ' "" "' & $Process & '"', '', @SW_HIDE)
        Else
                MsgBox(16, 'Specify Priority Run', 'Not supported')
        EndIf
EndFunc   ;==>_Specify_Priority_Run

