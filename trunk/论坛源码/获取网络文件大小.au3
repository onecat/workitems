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
MsgBox(0, "", _FileSize("http://www.baidu.com/img/bdlogo.png")  / 1024 & "KB")
Func _FileSize($url, $username = "", $password = "")
        Local $hOpen, $hConnect, $hRequest, $LENGTH
        Local $File, $hS
        If StringInStr($url, "http://") Then $url = StringTrimLeft($url, 7)
        $hS = StringSplit($url, "/")
        If @error Then
                MsgBox(0, "error", "��ʽ����")
                Return SetError(0, 0, 0)
        EndIf
        $File = StringRegExpReplace($url, "^(.*?)/", "/")
        $hOpen = _WinHttpOpen()
        $hConnect = _WinHttpConnect($hOpen, $hS[1])
        $hRequest = _WinHttpOpenRequest($hConnect, "head", $File)
        _WinHttpSetCredentials($hRequest, $WINHTTP_AUTH_TARGET_SERVER, $WINHTTP_AUTH_SCHEME_BASIC, $username, $password)
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        If _WinHttpQueryDataAvailable($hRequest) Then $LENGTH = _WinHttpQueryHeaders($hRequest, $WINHTTP_QUERY_CONTENT_LENGTH)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        $LENGTH = $LENGTH
        Return $LENGTH
EndFunc   ;==>_FileSize
