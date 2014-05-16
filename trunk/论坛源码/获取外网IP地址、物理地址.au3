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

#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
 Au3 版本: AutoIt v3.3.6.1
 软件语言: 简体中文
 执行环境: WinXP
 创建日期: 2009-12-31
 修改日期: 2011-03-16
 脚本作者: easefull
        Email: 
        QQ/TM: 19519549
 脚本版本: 1.1.0 Build 20110316
 脚本功能: 可以从8个信息来源获取外网IP地址、物理地址，获取顺序可控。
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <Array.au3>
$asResult = fn_GetWanIP(2)
If Not IsArray($asResult) Then
        MsgBox(4096, "", "返回结果非数组" &@LF& $asResult)
Else
        _ArrayDisplay($asResult)
EndIf
Exit





; ===============================================================================================================================
; 函数名称: fn_GetWanIP
; 函数环境: AutoIt3 v3.3.6.1
; 函数版本: 1.1.0 Build 20110316
; 函数说明: 跟据参数,选择从不同的信息渠道获取外网IP地址
; 函数语法: fn_GetWanIP($sInfoSource, $sTempDir, $sTempFile)
; 参数说明: $sInfoSource        ——        信息源标识/标号
;                   |1                        ——        信息源标号,选择信息源：                        http://www.ip138.com/ip2city.asp
;                   |2                        ——        信息源标号,选择信息源：                         http://www.whatismyip.com/automation/n09230945.asp
;                   |3                        ——        信息源标号,选择信息源：                         http://www.aamailsoft.com/getip.php
;                   |4                        ——        信息源标号,选择信息源：                         http://checkip.dyndns.org/
;                   |5                        ——        信息源标号,选择信息源：                         http://www.geobytes.com/IpLocator.htm
;                   |6                        ——        (默认)信息源标号,选择信息源：        http://ip.qq.com/cgi-bin/index
;                   |7                        ——        信息源标号,选择信息源：                         http://www.123cha.com/ip/
;                                |8                        ——        信息源标号,选择信息源：                         http://ip.91cool.net/ip.php
;                   
;                   |ip138                ——        信息源标识,选择信息源：                        http://www.ip138.com/ip2city.asp
;                   |whatismyip        ——        信息源标识,选择信息源：                         http://www.whatismyip.com/automation/n09230945.asp
;                   |aamailsoft        ——        信息源标识,选择信息源：                         http://www.aamailsoft.com/getip.php
;                   |dyndns                ——        信息源标识,选择信息源：                         http://checkip.dyndns.org/
;                   |geobytes        ——        信息源标识,选择信息源：                         http://www.geobytes.com/IpLocator.htm
;                   |qq                        ——        信息源标识,选择信息源：                         http://ip.qq.com/cgi-bin/index
;                   |123cha                ——        信息源标识,选择信息源：                         http://www.123cha.com/ip/
;                   |91cool                ——        信息源标识,选择信息源：                         http://ip.91cool.net/ip.php
;                   
;           $iMode                        ——        是否只使用指定的信息源获取IP地址(1 = yes|0(默认) = no)
;           $sTempDir                ——        参数已取消，保留此参数格式只为了兼容旧版本函数
;           $sTempFile                ——        参数已取消，保留此参数格式只为了兼容旧版本函数
; 返 回 值: 返回一个数组：
;                                        第一个元素($array[0])保存外网IP地址，获取失败返回 "0.0.0.0"
;                                        第二个元素($array[1])保存外网IP地址所在的物理地址，获取失败返回空字符
;                                        第三个元素($array[2])保存信息来源地址，获取失败返回空字符
; 函数作者: easefull
; 创建日期: 2009-12-31
; 更新日期: 2011-03-16
; 函数改良: 
; 修改说明: 
; 相关函数: 
; 链接网页: 
; 函数示例: 
;           Example 1: 
;           #include <Array.au3>
;           $Array = fn_GetWanIP()
;           _ArrayDisplay($Array)
;           
;           Example 2: 
;           #include <Array.au3>
;           $iInfoSource = 1
;           $Array = fn_GetWanIP($iInfoSource)
;           _ArrayDisplay($Array)
;           
;           Example 3: 
;           #include <Array.au3>
;           $sInfoSource = "ip138"
;           $Array = fn_GetWanIP($sInfoSource)
;           _ArrayDisplay($Array)
;           
;           Example 4: 
;           #include <Array.au3>
;           $iInfoSource = "ip138"
;           $iMode = 1
;           $Array = fn_GetWanIP($iInfoSource, $iMode)
;           _ArrayDisplay($Array)
; ===============================================================================================================================
Func fn_GetWanIP($sInfoSource = 6, $iMode = 0, $sTempDir = "", $sTempFile = "")
        ;=================================================
        ; 定义局部变量
        ; $sURL                                ——        储存 IP获取页面URL(Key)
        ; $asURL                        ——        储存 IP获取页面URL(数组)
        ; $asResult                        ——        储存 外网IP地址和物理地址
        ; $nIndex                        ——        储存 可获取的信息源数量
        ; $iStep                        ——        储存 信息标识累加器
        ; $sHTML                        ——        储存 下载页面内容
        ; $asIP[0]                        ——        中转变量 匹配的正则返回值
        ;=================================================
        Local $sURL = @CR & _
        "http://www.ip138.com/ip2city.asp" & @CR & _
        "http://www.whatismyip.com/automation/n09230945.asp" & @CR & _
        "http://www.aamailsoft.com/getip.php" & @CR & _
        "http://checkip.dyndns.org/" & @CR & _
        "http://www.geobytes.com/IpLocator.htm" & @CR & _
        "http://ip.QQ.com/cgi-bin/index" & @CR & _
        "http://www.123cha.com/ip/" & @CR & _
        "http://ip.91cool.net/ip.php" & @CR
        Local $asURL  = StringRegExp($sURL, '(?<=\r)[\S]+(?=\r)', 3)
        Local $nIndex = UBound($asURL), $iStep = 0, $iMark
        Local $asResult[3], $sHTML, $asIP[1]
        ;=================================================
        ; 检查参数，防止意外错误
        ;=================================================
        ; 格式化参数 信息源标识
        ;=================================================
        If StringIsDigit($sInfoSource) = 0 Or $sInfoSource > $nIndex Or $sInfoSource < 0 Then
                For $i = 0 To $nIndex - 1 Step 1
                        $asIP = StringRegExp($asURL[$i], '(?<=\.)\w+(?=\.)', 1)
                        If $sInfoSource == $asIP[0] Then
                                $sInfoSource = $i + 1
                                ExitLoop
                        EndIf
                Next
                If StringIsDigit($sInfoSource) = 0 Or $sInfoSource > $nIndex Or $sInfoSource < 0 Then $sInfoSource = 6
        EndIf
        ;=================================================
        ; 使用机械指针结构,从不同信息点循环获取IP信息
        ;=================================================
        Do
                ;=================================================
                ; 从指定的信息源获取信息
                ;=================================================
                $sHTML = BinaryToString(InetRead($asURL[$sInfoSource - 1], 1))
                $asIP  = StringRegExp($sHTML, '(((25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(25[0-5]|2[0-4]\d|[01]?\d?\d))', 1)
                ;=================================================
                ; 如果成功获取信息
                ;=================================================
                If Not @error Then
                        ;=================================================
                        ; 保存 IP地址
                        ;=================================================
                        $asResult[0] = $asIP[0]
                        ;=================================================
                        ; 获取 信息来源地址
                        ;=================================================
                        $asIP        = StringRegExp($asURL[$sInfoSource - 1], '(?<=\.)\w+\.\w+(?=\/)', 1)
                        If Not @error Then $asResult[2] = $asIP[0]
                        ;=================================================
                        ; 获取 IP所在的物理地址
                        ;=================================================
                        If $sInfoSource <> 6 And $sInfoSource <> 8 Then
                                ;=================================================
                                ; 信息源不提供物理地址的将从第6信息源获取物理地址
                                ;=================================================
                                $sInfoSource = 6
                                $sHTML = BinaryToString(InetRead($asURL[$sInfoSource - 1], 1))
                        EndIf
                        Select
                                Case $sInfoSource = 6
                                        $asIP = StringRegExp($sHTML, '(?<=<span>)[^<]+(?=</span></p>)', 1)
                                        If Not @error Then $asResult[1] = StringRegExpReplace($asIP[0], '&nbsp;', '')
                                Case $sInfoSource = 8
                                        $asIP = StringRegExp($sHTML, '(?<=来自)[^"]+(?=")', 1)
                                        If Not @error Then $asResult[1] = $asIP[0]
                        EndSelect
                EndIf
                ;=================================================
                ; 机械指针计算
                ; 继续循环查找IP
                ;=================================================
                $iStep += 1
                $sInfoSource = $sInfoSource + $iStep
                If $sInfoSource > $nIndex Then $sInfoSource -= $nIndex
        Until $asResult[0] Or $iMode Or $iStep = $nIndex
        ;=================================================
        ; 返回执行结果
        ;=================================================
        If Not $asResult[0] Then $asResult[0] = "0.0.0.0"
        Return($asResult)
EndFunc   ;==>fn_GetWanIP