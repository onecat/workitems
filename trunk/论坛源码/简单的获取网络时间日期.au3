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

#include <WinHTTP.au3>
MsgBox(0, "", _Hdate())
Func _Hdate()
        Local $hOpen, $hConnect, $hRequest, $H_time, $str, $Date
        Local $mon[13] = [12, "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        Local $wee[8] = [7, "Mon,", "Tue,", "Wed,", "Thu,", "Fri,", "Sat,", "Sun,"]
        Local $week[8] = [7, "��һ", "�ܶ�", "����", "����", "����", "����", "����"]
        Local $url = "www.beijing-time.org"
        $hOpen = _WinHttpOpen()
        $hConnect = _WinHttpConnect($hOpen, $url)
        $hRequest = _WinHttpOpenRequest($hConnect, "head")
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        If _WinHttpQueryDataAvailable($hRequest) Then $str = _WinHttpQueryHeaders($hRequest, $WINHTTP_QUERY_DATE)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        For $i = 1 To 12
                $str = StringReplace($str, $mon[$i], $i)
        Next
        For $i = 1 To 7
                $str = StringReplace($str, $wee[$i], $week[$i])
        Next
        $str = StringSplit($str, " ")
        $H_time = StringLeft($str[5], 2) + 8
        If $H_time >= 24 Then $H_time -= 24
        $H_time &= StringTrimLeft($str[5], 2)
        $Date = $str[4] & "-" & $str[3] & "-" & $str[2] & " " & $str[1] & " " & $H_time
        Return $Date
EndFunc   ;==>_Hdate
