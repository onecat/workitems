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

#include <Inet.au3>
 
 
MsgBox(0, "����1", JY_ipGet())
MsgBox(0, "����2", JY_ipTest())
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;���������ð�.
;�����IP�������ʱ,һ���ǵö�㼸������վ
;����һ��:
;               �����Ķ������,��IP��,����ȫ��������.ֻ����վ��û�Һ�.
;       �����ر���,�㹻ʹ�õ���.<���׹�����>
;--------------------------------------
; by:��ɫ��  Qq/E_mail:79664738@qq.com
;               ǿ��֧�ַ��,��!��!��!��!��!!!   2014-9-27
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;����
;       JY_ipGet()  ;��ȡ����IP��ַ  ��ַ��Դ 4��վ��
;Ҳ���Ե�������
;                       ��� JY_ipTest�����г�����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;���� IP��׼ȷ����
Func JY_ipTest()
        Local $str = _chinaz()
        $str &= @CRLF & _ip138()
        $str &= @CRLF & _qqip()
        $str &= @CRLF & _apnic()
        $str &= @CRLF & _au3IP()
        
        Return $str
EndFunc   ;==>JY_ipTest
;;��ȡ����IP��ַ
Func JY_ipGet()
        Local $apnic_ip = _apnic() ;��ȡIIP��˳��  1  �����ַ
        If $apnic_ip = 0 Then
                Local $chinaz_ip = _chinaz();��ȡIIP��˳��  2
                If $chinaz_ip = 0 Then
                        Local $au3_ip = _au3IP() ;��ȡIIP��˳��  3 4   �����ַ
                        If $au3_ip = 0 Then
                                Local $ip138_ip = _ip138();��ȡIIP��˳��  5
                                If $ip138_ip = 0 Then
                                        Local $qq_ip = _qqip();��ȡIIP��˳��  6
                                        If $qq_ip = 0 Then
                                                Return "0.0.0.0"
                                        Else
                                                Return $qq_ip
                                        EndIf
                                Else
                                        Return $ip138_ip
                                EndIf
                        Else
                                Return $au3_ip
                        EndIf
                        
                Else
                        Return $chinaz_ip
                EndIf
        Else
                Return $apnic_ip
        EndIf
EndFunc   ;==>JY_ipGet
 
Func _apnic()
        ;���ڴ������վ ��ȡip����Դ��  [url]www.apnic.net[/url] վ
        Local $source = _INetGetSource("https://cgi1.apnic.net/cgi-bin/my-ip.php")
        Local $aIP = StringRegExp($source, 'ip:"(\d[\d.]+)"', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_apnic
 
Func _chinaz()
        Local $source = BinaryToString(_INetGetSource("http://tool.chinaz.com/IP", False), 4)
        Local $aIP = StringRegExp($source, '����IP.*?(\d[\d.]+)', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_chinaz
Func _ip138()
        ;[url]http://iframe.ip138.com/city.asp[/url] ֮ǰ�ô˵�ַ,��Ȼ���ڲ��е���.
        ;��QQһ��,�ҵı��õ�ַ.��Ȼͬһ���������.    ����һ�� 2014.9.26
        Local $source = BinaryToString(_INetGetSource("http://www.ip138.com/ips138.asp", False))
        Local $aIP = StringRegExp($source, '��ַ�ǣ�\[(\d[\d.]+)\]', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_ip138
;���ڻ�������,�ڴ����ܼ�������....
Func _qqip()
        ;2014.9.26 ����,��������.�����Һÿ�.���ĳ���������������ȫֹͣ����.
        Local $source = _INetGetSource("http://ip.qq.com")
        Local $aIP = StringRegExp($source, '����ǰ��IPΪ.*?(\d[\d.]+)', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Return 0
        EndIf
EndFunc   ;==>_qqip
 
Func _au3IP()
        ;Au3 ������  _GetIP  ���� ����IP��ȡ��ַ
        Local $source = _INetGetSource("http://bot.whatismyipaddress.com/")
        Local $aIP = StringRegExp($source, '((?:\d{1,3}\.){3}\d{1,3})', 3, 1)
        If Not @error Then
                Return $aIP[0]
        Else
                Local $source = _INetGetSource("http://www.myexternalip.com/raw")
                Local $aIP = StringRegExp($source, '((?:\d{1,3}\.){3}\d{1,3})', 3, 1)
                If Not @error Then
                        Return $aIP[0]
                Else
                        Return 0
                EndIf
        EndIf
EndFunc   ;==>_au3IP
