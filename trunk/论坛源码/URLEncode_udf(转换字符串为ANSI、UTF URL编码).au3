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
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

;����1��
$str = "?a����test_���� abc +1234?�ٶ�. "
$str1 = _StringToURLEncode($str)
MsgBox(0, 'ת��ǰ��', $str & @CRLF & $str1 & @CRLF & _URLEncodeToString($str1))
;ShellExecute('http://www.baidu.com/s?wd=' & $str1)

;����2��
$str2 = 'http://www.autoitx.com'
$str21 = _StringToURLEncode($str2, 1, 1)
MsgBox(0, 'ת��ǰ��', $str2 & @CRLF & $str21 & @CRLF & _URLEncodeToString($str21))
ShellExecute($str21)

Func _StringToURLEncode($str, $Encode = 1, $AllFlag = 0)
        ;afan ��ʾ��ת���ַ���ΪANSI(GB2312)URL����
        ;$str - ��ת�����ַ���
        ;$Encode - �����ʽ ;1 (Ĭ��) = ANSI ;2 = UTF16 С ;3 = UTF16 �� ;4 = UTF8
        ;$AllFlag - [��ѡ����] =0 ��ת����ĸ������(Ĭ��)�� =1 ȫ��ת��(�ַ�ͷhttp://����)
        ;����ֵ���ɹ� - ����ת����ı����ַ����� ʧ�� - ���� @Error = 1

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
        ;$sOut = StringReplace($sOut, '%20', '+') ;ת���ո�ı���Ϊ'+'�ţ�Ҳ�ɲ�Ҫ����
        Return $str_s & $sOut
EndFunc   ;==>_StringToURLEncode

Func _URLEncodeToString($URL_str, $URLEncode = 1)
        ;afan ��ʾ��ת����ANSI(GB2312)URL�������ַ���Ϊԭʼ�ַ���
        ;$URL_str - URL�����ַ���
        ;$URLEncode - URL�����ʽ ;1 (Ĭ��) = ANSI ;2 = UTF16 С ;3 = UTF16 �� ;4 = UTF8
        ;����ֵ���ɹ� - ���ر����ַ�����ԭʼ�ַ����� ʧ�� - ����ԭ�ַ��������� @Error = 1

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