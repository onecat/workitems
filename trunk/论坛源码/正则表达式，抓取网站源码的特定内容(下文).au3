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
#include<array.au3>

_main()

Func _main()
        
        Local $a = _HttpCodeToArray(_XmlHttp("http://www.cnyes.com/futures/History.aspx?mydate=20140303&code=WTIC"))
        _ArrayDisplay($a)
        
EndFunc   ;==>_main

Func _HttpCodeToArray($HttpCode)
        Local $a_rth = StringRegExp($HttpCode, '(?<=<th>)[^<]*?(?=</th>)', 3)
        If Not IsArray($a_rth) Then Return (SetError(1, 1, 0))
;~         _ArrayDisplay($a_rth)
        Local $a_rtd = StringRegExp($HttpCode, '(?<=<td class="cr">|<td  class="cr">)[^<]*?(?=</td>)', 3)
        If Not IsArray($a_rth) Then Return (SetError(1, 2, 0))
;~         _ArrayDisplay($a_rtd)
        Local $a_r[1][2]
        Local $i
        If UBound($a_rth) = UBound($a_rtd) Then
                For $i = 0 To UBound($a_rth) - 1
                        ReDim $a_r[$i + 2][2]
                        $a_r[$i + 1][0] = $a_rth[$i]
                        $a_r[$i + 1][1] = $a_rtd[$i]
                Next
                $a_r[0][0] = UBound($a_r) - 1
                Return $a_r
        Else
                Return (SetError(1, 3, 0))
        EndIf
EndFunc   ;==>_HttpCodeToArray

Func _XmlHttp($Url)
        Local $oHTTP, $sReturn
        $oHTTP = ObjCreate("MSXML2.ServerXMLHTTP")
        $oHTTP.Open("get", $Url, False)
        $oHTTP.Send()
        $sReturn = BinaryToString($oHTTP.responseBody, 4)
        Return $sReturn
EndFunc   ;==>_XmlHttp

