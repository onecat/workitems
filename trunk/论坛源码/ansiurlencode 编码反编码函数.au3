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
#EndRegion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
$url="http://xxx.com/测试.mp3"

$encode=ansiurlcode($url,1)
msgbox(0,'encode',$encode)

$decode=ansiurlcode($encode,2)
msgbox(0,'decode',$decode)

Func ansiurlcode($str, $flag = 1)
	If $flag = 1 Then
		$aChr = StringSplit($str, "")

		$str = ""
		For $i = 1 To UBound($aChr) - 1
			If StringRegExp($aChr[$i], "[^\x00-\xff]") Then
				$encChr = StringToBinary($aChr[$i] & ' ')
				$str &= "%" & StringMid($encChr, 3, 2) & "%" & StringMid($encChr, 5, 2)
			ElseIf StringRegExp($aChr[$i], "[^\w]") Then
				$encChr = StringToBinary($aChr[$i])
				$str &= "%" & StringMid($encChr, 3, 2)
			Else
				$str &= $aChr[$i]
			EndIf
		Next

		Return $str
	ElseIf $flag = 2 Then
		$encChr = StringRegExp($str, "%([a-zA-Z0-9]{2})", 3)
		If @error Then Return $str

		Local $i = 0
		While $i < UBound($encChr)
			If StringRegExp($encchr[$i], "^[a-zA-Z][a-zA-Z0-9]$") Then
				$str = StringReplace($str, "%" & $encChr[$i] & "%" & $encChr[$i + 1], BinaryToString("0X" & $encchr[$i] & $encchr[$i + 1]))
				$i += 2
			ElseIf StringRegExp($encchr[$i], "^\d[a-zA-Z0-9]$") Then
				$str = StringReplace($str, "%" & $encChr[$i], BinaryToString("0X" & $encchr[$i]))
				$i += 1
			Else
				$i += 1
			EndIf
		WEnd

		Return $str
	EndIf
EndFunc   ;==>ansiurlcode
