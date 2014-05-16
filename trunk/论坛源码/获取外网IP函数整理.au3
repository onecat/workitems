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

;-----------------------------------
;获取外网IP
;-----------------------------------
#include <Inet.au3>

Local $s_PublicIP
;调用示例
$s_PublicIP = _MyGetIP()
MsgBox(0,"Public IP Address",$s_PublicIP)
$s_PublicIP = _MyGetIP2()
MsgBox(0,"Public IP Address",$s_PublicIP)

;方式1: 通过访问web网站获得
;成功: 返回外网IP
;失败: 返回0.0.0.0
Func _MyGetIP()
        Local $s_HtmlSource, $as_IP, $s_PublicIP = "0.0.0.0"
        Dim $as_Url[4]

        $as_Url[0] = "http://city.ip138.com/city.asp"
        $as_Url[1] = "http://www.aamailsoft.com/getip.php"
        $as_Url[2] = "http://automation.whatismyip.com/n09230945.asp"
        $as_Url[3] = "http://checkip.dyndns.org/"

        For $i = 0 To UBound($as_Url) - 1
                $s_HtmlSource = _INetGetSource($as_Url[$i])
                If @error = 0 Then
                        ;IP正则表达式
                        $as_IP = StringRegExp($s_HtmlSource,'(?:(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d|25[0-4])\.){3}(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d|25[0-4])',3)
                        If @error = 0 Then
                                $s_PublicIP = $as_IP[0]
                                ExitLoop
                        EndIf
                EndIf
        Next

        Return($s_PublicIP)
EndFunc

;使用内置函数获得
;成功: 返回外网IP
;失败: 返回0.0.0.0
Func _MyGetIP2()
        Local $s_PublicIP = _GetIP()
        If @error = 1 Then
                Return("0.0.0.0")
        Else
                Return($s_PublicIP)
        EndIf
EndFunc