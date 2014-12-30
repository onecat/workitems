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

;例子1：
$str = "?a测试test_搜索 abc +1234?百度. "
$str1 = _StringToURLEncode($str)
MsgBox(0, '转换前后', $str & @CRLF & $str1 & @CRLF & _URLEncodeToString($str1))
;ShellExecute('http://www.baidu.com/s?wd=' & $str1)

;例子2：
$str2 = 'http://www.autoitx.com'
$str21 = _StringToURLEncode($str2, 1, 1)
MsgBox(0, '转换前后', $str2 & @CRLF & $str21 & @CRLF & _URLEncodeToString($str21))
ShellExecute($str21)

Func _StringToURLEncode($str, $Encode = 1, $AllFlag = 0)
        ;afan 提示：转换字符串为ANSI(GB2312)URL编码
        ;$str - 需转换的字符串
        ;$Encode - 编码格式 ;1 (默认) = ANSI ;2 = UTF16 小 ;3 = UTF16 大 ;4 = UTF8
        ;$AllFlag - [可选参数] =0 不转换字母及数字(默认)； =1 全部转换(字符头http://除外)
        ;返回值：成功 - 返回转换后的编码字符串； 失败 - 设置 @Error = 1

        Local $str_s = StringRegExpReplace($str, '^\s*(?i)(http://).+', '$1')
        If Not @error And @extended = 0 Then $str_s = ''
        If Not @error And @extended > 0 Then $str = StringRegExpReplace($str, '^\s*(?i)http://', '')
        Local $sOut, $i, $sS2B, $aSR
        If $AllFlag Then
                $sS2B = StringTrimLeft(StringToBinary($str, $Encode), 2)
                $sOut = StringRegExpReplace($sS2B, '..', '%$0')
        Else
                $sOut = $str
                ;$aSR = StringRegExp($str, '\W+', 3)
				$aSR = StringRegExp($str, '[^=\w\./&\?]+', 3)
                If Not @error Then
                        For $i = 0 To UBound($aSR) - 1
                                $sS2B = StringTrimLeft(StringToBinary($aSR[$i], $Encode), 2)
                                $sOut = StringReplace($sOut, $aSR[$i], StringRegExpReplace($sS2B, '..', '%$0'), 1)
                        Next
                EndIf
        EndIf
        ;$sOut = StringReplace($sOut, '%20', '+') ;转换空格的编码为'+'号，也可不要此行
        Return $str_s & $sOut
EndFunc   ;==>_StringToURLEncode

Func _URLEncodeToString($URL_str, $URLEncode = 1)
        ;afan 提示：转换经ANSI(GB2312)URL编码后的字符串为原始字符串
        ;$URL_str - URL编码字符串
        ;$URLEncode - URL编码格式 ;1 (默认) = ANSI ;2 = UTF16 小 ;3 = UTF16 大 ;4 = UTF8
        ;返回值：成功 - 返回编码字符串的原始字符串； 失败 - 返回原字符串并设置 @Error = 1

        Local $Rstr, $aSR, $str_Tmp, $i
        $Rstr = StringReplace($URL_str, '+', ' ')
        $aSR = StringRegExp($Rstr, '(?:%\w{2})+', 3)
        If @error Then Return SetError(1, 0, $Rstr)
        For $i = 0 To UBound($aSR) - 1
                $str_Tmp = BinaryToString('0x' & StringReplace($aSR[$i], '%', ''), $URLEncode)
                $Rstr = StringReplace($Rstr, $aSR[$i], $str_Tmp, 1)
        Next
        Return $Rstr
EndFunc   ;==>_URLEncodeToString