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
#include <Array.au3>
Local $c = 5 ;����
Local $Str = _
                '4.916094237        18.47223492        17.72360797        20.07765068        2.244682034        ' & @CRLF & _
                '7.073194034        22.04562807        17.19103832        19.8221179        2.23423084        ' & @CRLF & _
                '9.03093563        24.06295487        17.4786963        20.03798008        2.242400756        ' & @CRLF & _
                '10.97421483        28.26196067        17.39201467        19.94261233        2.24527325'
Local $aSR = StringRegExp($Str, '\S+', 3)
MsgBox(0,"",$aSR[1])
If @error Or Not IsInt(UBound($aSR) / $c) Then Exit
Local $a[UBound($aSR) / $c][$c]
For $i = 0 To UBound($aSR) - 1
        $a[Int($i / $c)][Mod($i, $c)] = $aSR[$i]
Next
_ArrayDisplay($a, UBound($a))
