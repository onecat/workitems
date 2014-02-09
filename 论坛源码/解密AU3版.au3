#Include <ACN_HASH.au3>
#include <array.au3>
$a = 'pWFqbWGalak'
$b = '1991'
MsgBox(0,"解密结果:",'$a='&$a&@CRLF&'$b='&$b&@CRLF&'$Result='&DecodeByFengzi($a,$b))

ConsoleWrite(DecodeByFengzi('qWaYmA',6)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWeYmA',7)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWJhmw',21)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWJomw',28)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWZkmw',64)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWZlmw',65)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWZmmw',66)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWZpmw',69)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWdmmw',76)&@CRLF)
ConsoleWrite(DecodeByFengzi('qWhjmw',83)&@CRLF)

Func DecodeByFengzi($a,$b)
	If $a='' Or $b='' Then Return ''
	;如果a的位数不是偶数位,则后面补零再解码
	If Mod(StringLen($a),2)<>0 Then
		$str = StringTrimRight(StringTrimLeft(_Base64Decode($a&'0=='),2),2)
	Else
		$str = StringTrimLeft(_Base64Decode($a&'=='),2)
	EndIf
	;取出b的数字部分
	$b = String(Int($b)) 
	;将解密结果输出核对
;~ 	ConsoleWrite("Decoded: "&$str&@CRLF)
	;获取结果字符数量
	$str_length=Int(StringLen($str)/2)
	;如果a的位数为奇数, 则证明最后一位是附加的. 不处理
	If Mod(StringLen($a),2)<>0 Then	$str_length=$str_length-1
	;重定义数组存放结果数据
	Dim $str_array[$str_length]
	;将解密结果每两位分割并赋值给结果数组
	For $i=1 To $str_length
		$str_array[$i-1]=Int('0x'&StringLeft($str,2))
		$str=StringTrimLeft($str,2)
	Next
	;对第一位解密  第一位ASCII码减去 115
	$str_array[0] = chr(Int($str_array[0]) - 115)
	;定义b无效时候的密钥表
	Local $keyNumber[9] = [104, 101, 114, 111, 112, 97, 115, 115, 52]
	Local $j = 0 , $result=$str_array[0]
	; 从第二位开始循环处理
	For $i = 1 To $str_length-1
		;按位取出b的ASC码值
		$b_chr = Asc(StringLeft($b,1))
		$b=StringTrimLeft($b,1)
		;如果b的asc码有效 则用b的asc码做参数 否则从密钥表中取
		If $b_chr Then
			;b有相应的值，则减去其ascii码值
			$str_array[$i] = chr($str_array[$i] - $b_chr)
		Else
			;从一个密钥表里循环取值并减去
			$str_array[$i] = chr($str_array[$i] - $keyNumber[Mod(($j) , 9)])
			$j=$j+1
		EndIf
		$result&=$str_array[$i]
	Next
	;将结果数组显示出来
;~ 	_ArrayDisplay($str_array)
	;输出结果用于查看
;~ 	ConsoleWrite($result&@CRLF)
	Return $result
EndFunc
