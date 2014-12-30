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
Global Const $xinqi[8] = [7, "Sun(星期日) ", "Mon(星期一) ", "Tue(星期二) ", "Wed(星期三) ", "Thu(星期四) ", "Fri(星期五) ", "Sat(星期六) "] ;星期 0 - 6
Global Const $xinqi1[8] = [7, "Sun ", "Mon ", "Tue ", "Wed ", "Thu ", "Fri ", "Sat "] ;星期 0 - 6
Global Const $yue[13] = [12, "Jan(1)月", "Feb(2)月", "Mar(3)月", "Apr(4)月", "May(5)月", "Jun(6)月", "Jul(7)月", "Aug(8)月", "Sep(9)月", "Oct(10)月", "Nov(11)月", "Dec(12)月"] ;月分 1 - 12
Global Const $yue1[13] = [12, "Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov", "Dec "] ;月分 1 - 12
 
 
 MsgBox(0,"示例",_UTC_Dtime())
  MsgBox(0,"示例",_UTC_Dtime1())
 
;by绿色风   2014.06.24
;[url]www.JianYiIT.com[/url]    接脚本活联系QQ：79664738
;一般用于日期的显示 特别是用于某些post/get数据时，时间的提交
;~返回的日期格式        Tue Jun 24 08:43:05 UTC+0800 2014 
Func _UTC_Dtime()
		Return @YEAR & "年" & $yue[@MON] & @MDAY & "号" & " " & $xinqi[@WDAY] & @HOUR & ":" & @MIN & ":" & @SEC & " UTC+0800 " 
EndFunc

Func _UTC_Dtime1()
        Return $xinqi1[@WDAY] & $yue1[@MON] & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & " UTC+0800 " & @YEAR
EndFunc
