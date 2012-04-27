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
Local $fp = FileOpen( @ScriptDir & "\2.txt", 0)
Local $buf = FileRead($fp)
FileClose($fp)
 
Local $arr1 = StringSplit($buf, @CRLF)
;_ArrayDisplay($arr1, "包含空白行")
Local $i
For $i = $arr1[0] To 1 Step -1
        If StringLen($arr1[$i]) = 0 Then
                _ArrayDelete($arr1,$i)
                $arr1[0] -= 1
        EndIf
Next
_ArrayDisplay($arr1, "剔除空白行--归类前")
 
Local $arr2[$arr1[0]+1][2]
$arr2[0][0] = $arr1[0]
For $i = 1 To $arr2[0][0]
        $arr2[$i][0] = $arr1[$i]
        $arr2[$i][1] = StringMid($arr2[$i][0],StringInStr($arr2[$i][0],"TM"))
Next
;_ArrayDisplay($arr2, "@后的域名所有")
 
Local $arr3[$arr1[0]+1]
$arr3[0] = 0
Local $j
Local $k
$arr3[1] = $arr2[1][1]
$arr3[0] = 1
$i = 2
For $j = 2 To $arr2[0][0]
        For $k = 1 To $j-1
                If StringCompare($arr2[$j][1], $arr2[$k][1]) = 0 Then ExitLoop
        Next
        If $k = $j Then
                $arr3[$i] = $arr2[$j][1]
                $arr3[0] += 1
                $i += 1
        EndIf
Next
For $i = $arr2[0][0] To $arr3[0]+1 Step -1
        _ArrayDelete($arr3, $i)
Next
;_ArrayDisplay($arr3, "@后的域名无重复")
 
$k = 1
For $i = 1 To $arr3[0]
        For $j = 1 To $arr2[0][0]
                If StringCompare($arr2[$j][1],$arr3[$i]) = 0 Then
                        $arr1[$k] = $arr2[$j][0]
                        $k += 1
                EndIf
        Next
Next
 
_ArrayDisplay($arr1, "最终结果--归类后")