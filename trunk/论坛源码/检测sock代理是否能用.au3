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

#include <winapi.au3>
$a = CheckSocks("173.3.220.236:32819")


Func CheckSocks($socks)
        Local $fault, $fault2
        TCPStartup()
        $_socks = StringSplit($socks, ":", 1)
        If $_socks[0] == 2 Then
                $ip = $_socks[1]
                ; ConsoleWrite($ip & @CRLF)
                $port = $_socks[2]
                ; ConsoleWrite($port & @CRLF)
                $socket = TCPConnect($ip, $port)
                $fault2 = _WSAGetLastError()
                If @extended Then
                        MsgBox(262144, "Fault", "WSAGetLastError failed")
                        $fault2 = 'unknown'
                EndIf

                If $socket = -1 Then
                        Switch @error
                                Case 1
                                        $fault = "Incorrect IP"
                                Case 2
                                        $fault = "Incorrect port"
                                Case Else
                                        $fault = "Valid IP and Port"
                        EndSwitch
                        MsgBox(262144, "Failed to connect", "Error = " & $fault2 & @CRLF & $fault)
                EndIf

        Else
                $socket = -1
        EndIf
        TCPShutdown()
        Return $socket
EndFunc   ;==>CheckSocks

Func _WSAGetLastError()
        Local $Res = DllCall("Ws2_32.dll", "int", "WSAGetLastError")
        If @error Then
                SetExtended(1)
                Return 0
        EndIf
        Return $Res[0]
EndFunc   ;==>_WSAGetLastError
