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

#include <Inet.au3>
 
 
MsgBox(0, "测试1", JY_ipGet())
MsgBox(0, "测试2", JY_ipTest())
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;共享给大家用吧.
;大家用IP限制软件时,一定记得多搞几个备用站
;吐嘈一下:
;               我做的定制软件,绑定IP的,昨天全崩溃的了.只因备用站点没找好.
;       现六重备用,足够使用的了.<简易工作室>
;--------------------------------------
; by:绿色风  Qq/E_mail:79664738@qq.com
;               强力支持风哥,顶!赞!顶!赞!顶!!!   2014-9-27
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;函数
;       JY_ipGet()  ;获取外网IP地址  地址来源 4个站点
;也可以单独调用
;                       详见 JY_ipTest中所列出来的
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;测试 IP的准确性用
Func JY_ipTest()
        Local $str = _chinaz()
        $str &= @CRLF & _ip138()
        $str &= @CRLF & _qqip()
        $str &= @CRLF & _apnic()
        $str &= @CRLF & _au3IP()
        
        Return $str
EndFunc   ;==>JY_ipTest
;;获取外网IP地址
Func JY_ipGet()
        Local $apnic_ip = _apnic() ;获取IIP的顺序  1  国外地址
        If $apnic_ip = 0 Then
                Local $chinaz_ip = _chinaz();获取IIP的顺序  2
                If $chinaz_ip = 0 Then
                        Local $au3_ip = _au3IP() ;获取IIP的顺序  3 4   国外地址
                        If $au3_ip = 0 Then
                                Local $ip138_ip = _ip138();获取IIP的顺序  5
                                If $ip138_ip = 0 Then
                                        Local $qq_ip = _qqip();获取IIP的顺序  6
                                        If $qq_ip = 0 Then
                                                Return "0.0.0.0"
                                        Else
                                                Return $qq_ip
                                        EndIf
                                Else
                                        Return $ip138_ip
                                EndIf
                        Else
                                Return $au3_ip
                        EndIf
                        
                Else
                        Return $chinaz_ip
                EndIf
        Else
                Return $apnic_ip
        EndIf
EndFunc   ;==>JY_ipGet
 
Func _apnic()
        ;国内大多数网站 获取ip的来源于  [url]www.apnic.net[/url] 站
        Local $source = _INetGetSource("https://cgi1.apnic.net/cgi-bin/my-ip.php")
        Local $aIP = StringRegExp($source, 'ip:"(\d[\d.]+)"', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_apnic
 
Func _chinaz()
        Local $source = BinaryToString(_INetGetSource("http://tool.chinaz.com/IP", False), 4)
        Local $aIP = StringRegExp($source, '您的IP.*?(\d[\d.]+)', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_chinaz
Func _ip138()
        ;[url]http://iframe.ip138.com/city.asp[/url] 之前用此地址,既然现在不行的了.
        ;与QQ一起,我的备用地址.既然同一天崩溃的了.    纪念一下 2014.9.26
        Local $source = BinaryToString(_INetGetSource("http://www.ip138.com/ips138.asp", False))
        Local $aIP = StringRegExp($source, '地址是：\[(\d[\d.]+)\]', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_ip138
;现在还留着它,期待他能继续服务....
Func _qqip()
        ;2014.9.26 晚上,崩溃的了.害得我好苦.做的程序因它问题现在全停止的了.
        Local $source = _INetGetSource("http://ip.qq.com")
        Local $aIP = StringRegExp($source, '您当前的IP为.*?(\d[\d.]+)', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_qqip
 
Func _au3IP()
        ;Au3 函数中  _GetIP  带的 两个IP获取地址
        Local $source = _INetGetSource("http://bot.whatismyipaddress.com/")
        Local $aIP = StringRegExp($source, '((?:\d{1,3}\.){3}\d{1,3})', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Local $source = _INetGetSource("http://www.myexternalip.com/raw")
                Local $aIP = StringRegExp($source, '((?:\d{1,3}\.){3}\d{1,3})', 3, 1)
                If Not @error Then
                        Return $aIP[0]
                Else
                        Return 0
                EndIf
        EndIf
EndFunc   ;==>_au3IP
