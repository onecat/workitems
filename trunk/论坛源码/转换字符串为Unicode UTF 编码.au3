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

;���ӣ�
$str = "����test_.,;[]ABC012.0��"
$str1 = Unicode2Encode($str)
MsgBox(0, 'ת��ǰ��', $str & @CRLF & $str1)
$str2 = Encode2Unicode($str1)
MsgBox(0, 'ת��ǰ��', $str1 & @CRLF & $str2)

Func Unicode2Encode($str, $qz = '&#x', $hz = ';')
        ;ת���ַ���ΪUnicode UTF ����By afan
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
        ;�� Unicode UTF ���뻹ԭΪ�ַ� By afan
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