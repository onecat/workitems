#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
$url="http://xxx.com/����.mp3"

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
