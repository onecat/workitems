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

#include'array.au3'
MsgBox(0, '', _IpDec('221.4.221.195'))
Exit
Func _IpDec($s_Ip)
        Local $i, $__IpElementHex,$__IpElementDec[1]
        If StringIsDigit($s_Ip) Then
                $__IpElementHex = Hex($s_Ip, 8);ת��Ϊ16����,ֻȡ8λ
                For $i = 1 To StringLen($__IpElementHex) Step 2
                        $ii = ($i - 1) / 2 + 1
                        ReDim $__IpElementDec[$ii]
                        $__IpElementDec[$ii - 1] = Dec(StringMid($__IpElementHex, $i, 2))
                Next
                Return _ArrayToString($__IpElementDec, '.')
        Else
                $__IpElement = StringSplit($s_Ip, ".");���
                For $i = 1 To $__IpElement[0]
                        $__IpElementHex &= StringRight(Hex($__IpElement[$i]), 2)
                Next
                $__IpElementDec = Dec($__IpElementHex, 2)
                Return $__IpElementDec
        EndIf
EndFunc   ;==>_IpDec