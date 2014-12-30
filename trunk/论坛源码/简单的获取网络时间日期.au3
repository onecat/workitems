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

#include <WinHTTP.au3>
MsgBox(0, "", _Hdate())
Func _Hdate()
        Local $hOpen, $hConnect, $hRequest, $H_time, $str, $Date
        Local $mon[13] = [12, "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        Local $wee[8] = [7, "Mon,", "Tue,", "Wed,", "Thu,", "Fri,", "Sat,", "Sun,"]
        Local $week[8] = [7, "周一", "周二", "周三", "周四", "周五", "周六", "周日"]
        Local $url = "www.beijing-time.org"
        $hOpen = _WinHttpOpen()
        $hConnect = _WinHttpConnect($hOpen, $url)
        $hRequest = _WinHttpOpenRequest($hConnect, "head")
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        If _WinHttpQueryDataAvailable($hRequest) Then $str = _WinHttpQueryHeaders($hRequest, $WINHTTP_QUERY_DATE)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        For $i = 1 To 12
                $str = StringReplace($str, $mon[$i], $i)
        Next
        For $i = 1 To 7
                $str = StringReplace($str, $wee[$i], $week[$i])
        Next
        $str = StringSplit($str, " ")
        $H_time = StringLeft($str[5], 2) + 8
        If $H_time >= 24 Then $H_time -= 24
        $H_time &= StringTrimLeft($str[5], 2)
        $Date = $str[4] & "-" & $str[3] & "-" & $str[2] & " " & $str[1] & " " & $H_time
        Return $Date
EndFunc   ;==>_Hdate
