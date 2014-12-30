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

;例子：
$str = "测试test_.,;[]ABC012.0好"
$str1 = Unicode2Encode($str)
MsgBox(0, '转换前后', $str & @CRLF & $str1)
$str2 = Encode2Unicode($str1)
MsgBox(0, '转换前后', $str1 & @CRLF & $str2)

Func Unicode2Encode($str, $qz = '&#x', $hz = ';')
        ;转换字符串为Unicode UTF 编码By afan
        Local $EncodedString, $i, $s2d, $sS = StringSplit($str, '')
        For $i = 1 To $sS[0]
                If StringRegExp($sS[$i], '[^\x00-\xff]') Then
                        $EncodedString &= $qz & Hex(AscW($sS[$i]), 4) & $hz 
                Else
                        $EncodedString &= $sS[$i]
                EndIf
        Next
        Return $EncodedString
EndFunc   ;==>Unicode2Encode

Func Encode2Unicode($EncodedString, $qz = '&#x', $hz = ';') 
        ;将 Unicode UTF 编码还原为字符 By afan
        Local $Unicode, $i, $S2H, $Us
        $S2H = StringRegExp($EncodedString, $qz & '(\w{4})' & $hz, 3)
        If @error Then Return $EncodedString
        For $i = 0 To UBound($S2H) - 1
                $Us = ChrW(Dec($S2H[$i])) 
                $Unicode = StringReplace($EncodedString, $qz & $S2H[$i] & $hz, $Us, 1)
                $EncodedString = $Unicode
        Next
        Return $Unicode
EndFunc   ;==>Encode2Unicode