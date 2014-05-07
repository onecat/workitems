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

#include<array.au3>

_main()

Func _main()
        
        Local $a = _HttpCodeToArray(_XmlHttp("http://www.cnyes.com/futures/History.aspx?mydate=20140401&code=WTIC"))
        _ArrayDisplay($a)
        
EndFunc   ;==>_main

Func _HttpCodeToArray($HttpCode)
        Local $a_rth = StringRegExp($HttpCode, '(?<=<th width="\d\d%" class="lt">).*?(?=</th>)', 3)
        If Not IsArray($a_rth) Then Return (SetError(1, 1, 0))
        Local $a_rtd = StringRegExp($HttpCode, '(?<=<td>|<td\sclass=\" [rg]\">|<td\sclass=\"[rg]\">)[^<]*?(?=</td>)', 3)
        If Not IsArray($a_rth) Then Return (SetError(1, 2, 0))
        Local $a_r[1][2]
        Local $i
        If UBound($a_rth) = UBound($a_rtd) Then
                For $i = 0 To UBound($a_rth) - 1
                        ReDim $a_r[$i + 2][2]
                        $a_r[$i + 1][0] = $a_rth[$i]
                        $a_r[$i + 1][1] = $a_rtd[$i]
                Next
                $a_r[0][0] = UBound($a_r) - 1
                Return $a_r
        Else
                Return (SetError(1, 3, 0))
        EndIf
EndFunc   ;==>_HttpCodeToArray

Func _XmlHttp($Url)
        Local $oHTTP, $sReturn
        $oHTTP = ObjCreate("MSXML2.ServerXMLHTTP")
        $oHTTP.Open("get", $Url, False)
        $oHTTP.Send()
        $sReturn = BinaryToString($oHTTP.responseBody, 4)
        Return $sReturn
EndFunc   ;==>_XmlHttp
