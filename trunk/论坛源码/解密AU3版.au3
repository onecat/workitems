#Include <ACN_HASH.au3>
#include <array.au3>
$a = 'pWFqbWGalak'
$b = '1991'
MsgBox(0,"���ܽ��:",'$a='&$a&@CRLF&'$b='&$b&@CRLF&'$Result='&DecodeByFengzi($a,$b))

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
	;���a��λ������ż��λ,����油���ٽ���
	If Mod(StringLen($a),2)<>0 Then
		$str = StringTrimRight(StringTrimLeft(_Base64Decode($a&'0=='),2),2)
	Else
		$str = StringTrimLeft(_Base64Decode($a&'=='),2)
	EndIf
	;ȡ��b�����ֲ���
	$b = String(Int($b)) 
	;�����ܽ������˶�
;~ 	ConsoleWrite("Decoded: "&$str&@CRLF)
	;��ȡ����ַ�����
	$str_length=Int(StringLen($str)/2)
	;���a��λ��Ϊ����, ��֤�����һλ�Ǹ��ӵ�. ������
	If Mod(StringLen($a),2)<>0 Then	$str_length=$str_length-1
	;�ض��������Ž������
	Dim $str_array[$str_length]
	;�����ܽ��ÿ��λ�ָ��ֵ���������
	For $i=1 To $str_length
		$str_array[$i-1]=Int('0x'&StringLeft($str,2))
		$str=StringTrimLeft($str,2)
	Next
	;�Ե�һλ����  ��һλASCII���ȥ 115
	$str_array[0] = chr(Int($str_array[0]) - 115)
	;����b��Чʱ�����Կ��
	Local $keyNumber[9] = [104, 101, 114, 111, 112, 97, 115, 115, 52]
	Local $j = 0 , $result=$str_array[0]
	; �ӵڶ�λ��ʼѭ������
	For $i = 1 To $str_length-1
		;��λȡ��b��ASC��ֵ
		$b_chr = Asc(StringLeft($b,1))
		$b=StringTrimLeft($b,1)
		;���b��asc����Ч ����b��asc�������� �������Կ����ȡ
		If $b_chr Then
			;b����Ӧ��ֵ�����ȥ��ascii��ֵ
			$str_array[$i] = chr($str_array[$i] - $b_chr)
		Else
			;��һ����Կ����ѭ��ȡֵ����ȥ
			$str_array[$i] = chr($str_array[$i] - $keyNumber[Mod(($j) , 9)])
			$j=$j+1
		EndIf
		$result&=$str_array[$i]
	Next
	;�����������ʾ����
;~ 	_ArrayDisplay($str_array)
	;���������ڲ鿴
;~ 	ConsoleWrite($result&@CRLF)
	Return $result
EndFunc
