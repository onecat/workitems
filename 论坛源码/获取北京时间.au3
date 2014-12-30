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
Dim $time = GetTime()
MsgBox(0,"",$time)
Dim $ntime, $H, $M, $S
$ntime = StringRegExp($time, "\d+\:\d+\:\d+", 3)
If Not IsArray($ntime) Then Exit (MsgBox(0, "", "获取时间失败"))
If $ntime[0] <> _NowTime() Then
        If MsgBox(4 + 262144, "", "您的系统时间与北京时间不同，需要设置为北京时间吗？") = 6 Then
                $time = GetTime()
                $ntime = StringRegExp($time, "\d+\:\d+\:\d+", 3)
                $H = StringRegExp($ntime[0], "(\d+)\:", 3)
                $M = StringRegExp($ntime[0], "\:(\d+)\:", 3)
                $S = StringRegExp($ntime[0], "\:\d+\:(\d+)", 3)
                _SetTime($H[0], $M[0], $S[0])
        EndIf
EndIf
 
Func GetTime()
        Local $http = 'http://www.timedate.cn/worldclock/ti.asp'
        Local $sData = InetRead($http, 1)
        Local $Source = BinaryToString($sData, 1)
        Local $aSR = StringRegExp($Source, 'n\w+\=(\d+)', 3)
        If @error Or UBound($aSR) < 7 Then Exit
        Local $Array[8] = ['日', '一', '二', '三', '四', '五', '六', '日']
        Local $time = StringFormat('%d年%d月%d日 星期%s %02d:%02d:%02d', $aSR[0], $aSR[1], $aSR[2], $Array[$aSR[3]], $aSR[4], $aSR[5], $aSR[6])
        Return $time
EndFunc   ;==>GetTime


