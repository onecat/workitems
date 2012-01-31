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

#include <array.au3>
Dim $numb = InputBox("", "")
$go = NUM2CWORD($numb)
$go1 = NUM2CWORD($numb, 1)
MsgBox(0, 0, "原始数字:" & $numb & @CRLF & "中文大写：" & $go & @CRLF & "中文古写：" & $go1)

Func NUM2CWORD($number, $vValue = "")
        If Not IsNumber(Execute($number)) Then Return SetError(1, 0, "");如果输入的不是数字返回错误代码1
        If $number > 999999999999 Then Return SetError(2, 0, "");如果大于千亿返回错误代码2
        If $vValue < 0 Or $vValue = "" Then $vValue = 0
        If $vValue = 1 Then
                Dim $Cnum[10] = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"]
                Dim $Cwei[12] = ["", "拾", "佰", "仟", "万", "拾万", "佰万", "仟万", "亿", "拾亿", "佰亿", "仟亿"]
        Else
                Dim $Cnum[10] = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
                Dim $Cwei[12] = ["", "十", "百", "千", "万", "十万", "百万", "千万", "亿", "十亿", "百亿", "千亿"]
        EndIf
        Local $str, $xiao
        If StringRegExp($number, '\d+\.\d+', 0) Then;判断是否有小数
                $number_temp = StringRegExp($number, '(\d+)\.(\d+)', 3)
                $number = $number_temp[0]
                $number_xiao = $number_temp[1]
                $number_xiao_wei = StringLen($number_xiao)
        Else
                $number_xiao_wei = 0
        EndIf
        $number_wei = StringLen($number)
        If $number_xiao_wei > 0 Then;计算小数部分
                For $x = 1 To $number_xiao_wei
                        $xiao &= $Cnum[StringMid($number_xiao, $x, 1)]
                Next
        EndIf
        $n = $number_wei
        For $i = 1 To $number_wei;计算整数部分
                If StringMid($number, $i, 1) = 0 Then
                        If StringMid($number, $i - 1, 1) = 0 Then
                                $n -= 1
                        Else
                                $str &= $Cnum[0]
                                $n -= 1
                        EndIf
                Else
                        $str &= $Cnum[StringMid($number, $i, 1)] & $Cwei[$n - 1]
                        $n -= 1
                EndIf
        Next
        $wan = StringRegExp($str, '万', 3)
        $yi = StringRegExp($str, '亿', 3)
        If UBound($wan) > 1 Then $str = StringReplace($str, "万", "", UBound($wan) - 1)

        If UBound($yi) > 1 Then $str = StringReplace($str, "亿", "", UBound($yi) - 1)
        If StringRight($str, 1) = "零" Then $str = StringMid($str, 1, StringLen($str) - 1)
        If StringLen($xiao) > 0 Then
                If StringLen($str) > 0 Then
                        $str = $str & "点" & $xiao
                Else
                        $str = "零点" & $xiao
                EndIf
        EndIf
        Return $str
EndFunc   ;==>NUM2CWORD