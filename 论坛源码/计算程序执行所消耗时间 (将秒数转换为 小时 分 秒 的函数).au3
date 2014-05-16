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

#include <Date.au3>
Local $AutoIt_Start_Time = _NowCalc()

;~ 程序执行区域
MsgBox(0,"1","1")

Local $AutoIt_Stop_Time = _DateDiff('s', $AutoIt_Start_Time, _NowCalc())
_CalcAutoItExecutionTime($AutoIt_Stop_Time)

;~ 将秒数转换为小时分秒的函数
Func _CalcAutoItExecutionTime($Time)
        Select
                Case $Time < 60
                        MsgBox(0,"程序提示","程序执行所耗时间为："&$Time&"秒")
                Case $Time = 60
                        MsgBox(0,"程序提示","程序执行所耗时间为：1分钟")
                Case $Time > 60 And $Time < 3600
                        Local $CalcTimeMin = Floor ($Time / 60)
                        Local $CalcTimeSec = $Time - ((Floor ($CalcTimeMin)) * 60)
                        MsgBox(0,"程序提示","程序执行所耗时间为：" & $CalcTimeMin & "分" & $CalcTimeSec & "秒")
                Case $Time = 3600
                        Local $CalcTimeHour = $Time / 60 / 60
                        MsgBox(0,"程序提示","程序执行所耗时间为：" & $CalcTimeHour & "小时")
                Case $Time > 3600
                        Local $CalcTimeHour = Floor ($Time / 60 / 60)
                        Local $CalcTimeMin = Floor (($Time - (Floor ($CalcTimeHour) * 60 * 60)) / 60)
                        Local $CalcTimeSec = ($Time - ( $CalcTimeHour * 60 * 60 )) - ((Floor (($Time - ( $CalcTimeHour * 60 * 60 )) / 60)) * 60)
                        MsgBox(0,"程序提示","程序执行所耗时间为：" & $CalcTimeHour & "小时" & $CalcTimeMin & "分" & $CalcTimeSec & "秒")
        EndSelect
EndFunc