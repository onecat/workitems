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

;-----------------------------------
;��ȡ����IP
;-----------------------------------
#include <Inet.au3>

Local $s_PublicIP
;����ʾ��
$s_PublicIP = _MyGetIP()
MsgBox(0,"Public IP Address",$s_PublicIP)
$s_PublicIP = _MyGetIP2()
MsgBox(0,"Public IP Address",$s_PublicIP)

;��ʽ1: ͨ������web��վ���
;�ɹ�: ��������IP
;ʧ��: ����0.0.0.0
Func _MyGetIP()
        Local $s_HtmlSource, $as_IP, $s_PublicIP = "0.0.0.0"
        Dim $as_Url[4]

        $as_Url[0] = "http://city.ip138.com/city.asp"
        $as_Url[1] = "http://www.aamailsoft.com/getip.php"
        $as_Url[2] = "http://automation.whatismyip.com/n09230945.asp"
        $as_Url[3] = "http://checkip.dyndns.org/"

        For $i = 0 To UBound($as_Url) - 1
                $s_HtmlSource = _INetGetSource($as_Url[$i])
                If @error = 0 Then
                        ;IP������ʽ
                        $as_IP = StringRegExp($s_HtmlSource,'(?:(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d|25[0-4])\.){3}(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d|25[0-4])',3)
                        If @error = 0 Then
                                $s_PublicIP = $as_IP[0]
                                ExitLoop
                        EndIf
                EndIf
        Next

        Return($s_PublicIP)
EndFunc

;ʹ�����ú������
;�ɹ�: ��������IP
;ʧ��: ����0.0.0.0
Func _MyGetIP2()
        Local $s_PublicIP = _GetIP()
        If @error = 1 Then
                Return("0.0.0.0")
        Else
                Return($s_PublicIP)
        EndIf
EndFunc