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

;��ѯ�����۸�
MsgBox(0,"",SearchItemPrice("����ȹ"))
Func SearchItemPrice($word)
Local $aryv[2]
Local $gryup=AnsiURLEncode($word)
$res=InetGet("http://s.etao.com/search?q="&$gryup&"&sort=sale-desc",@ScriptDir&"\112233.txt",1+2+4+8+16)
InetClose($res)
Local $filenr=FileRead(@ScriptDir&"\112233.txt")
Local $seller=QUZJDX($filenr,'<div class="seller-name">','</div>')
Local $price=StringReplace(QUZJDX($filenr,'<li class="price">','</em>'),"<em>","")
$price223=StringRegExp($price,"(\d+\.\d{2})",3)
If UBound($price223)>0 Then $price=$price223[0]
If StringInStr($seller,'charset="gbk"')>0 Then
$aryv[0]="������"
Else
$aryv[0]=$seller
EndIf
If Not StringRegExp($price,"\d+\.\d{2}") Then
$aryv[0]="û���ҵ�"
$aryv[1]="û���ҵ�"
Else
$aryv[1]="��"&$price
EndIf
If StringInStr($filenr,"��Ǹ�� û���ҵ�")>0 Then
$aryv[0]="û���ҵ�"
$aryv[1]="û���ҵ�"
        EndIf
Return $aryv
EndFunc

;��ȡ��Ŀ�м���ַ���
Func QUZJDX($stringc,$sstring,$estring,$cs=1)
Local $start=StringInStr($stringc,$sstring,1,$cs)+StringLen($sstring)
Local $end=StringInStr($stringc,$estring,0,1,$start)
If $end-$start<=0 Then Return ""
Return StringStripWS(StringMid($stringc,$start,$end-$start),3)
EndFunc

;ת��UTF����
Func AnsiURLEncode($str, $falg = 0)
        ;��ѡ����$falg = 0����ת����ĸ������(Ĭ��)��$falg = 1��ȫ��ת��(�ַ�ͷhttp://����)
        Local $str_s = StringRegExpReplace($str, '^(http://).+', '$1')
        If @extended = 0 Then $str_s = ''
        If @extended > 0 Then $str = StringRegExpReplace($str, '^http://', '')
        Local $astr, $i, $s2d, $sS = StringSplit($str, '')
        For $i = 1 To UBound($sS) - 1
                If StringRegExp($sS[$i], '[^\x00-\xff]') Then
                        $s2d = StringToBinary($sS[$i] & ' ')
                        $astr &= '%' & StringMid($s2d, 3, 2) & '%' & StringMid($s2d, 5, 2)
                ElseIf StringRegExp($sS[$i], '[^\w]') Then
                        $s2d = StringToBinary($sS[$i])
                        $astr &= '%' & StringMid($s2d, 3, 2)
                Else
                        If $falg = 0 Then $astr &= $sS[$i]
                        If $falg <> 0 Then
                                $s2d = StringToBinary($sS[$i])
                                $astr &= '%' & StringMid($s2d, 3, 2)
                        EndIf
                EndIf
        Next
        $astr = StringReplace($astr, '%20', '+') ;ת���ո�ı���Ϊ'+'�ţ�Ҳ�ɲ�Ҫ����
        Return $str_s & $astr
EndFunc