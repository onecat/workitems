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

#include <WinHttp.au3>
#include <Date.au3>

;����
Local $sLastModified = _WinHttpGetLastModified('http://news.163.com/')
If Not @error Then MsgBox(64, '��ҳ�������ʱ��', $sLastModified)

Func _WinHttpGetLastModified($sURL)
        ;afan ��ʾ����ȡ��̬��ҳ�������ļ����һ���޸�(����)ʱ��
        ;$sURL - ��ַ�������ļ���ַ
        ;����ֵ���ɹ� - ���ر���ʱ�䣻ʧ�� - ���ؿգ������� @Error=1 ��ַ����@Error=2 ����Ч��ͷ��Ϣ

        Local $aSR = StringRegExp($sURL, '(?i)\h*(?:(?:ftp|http)://)?([^\\/\s]+)/?(\H+)?', 1)
        If @error Then Return SetError(1, 0, '')
        Local $sObjectName = ''
        If UBound($aSR) = 2 Then $sObjectName = $aSR[1]
        Local $hOpen = _WinHttpOpen()
        Local $hConnect = _WinHttpConnect($hOpen, $aSR[0])
        Local $hRequest = _WinHttpOpenRequest($hConnect, 'GET', $sObjectName)
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        Local $sHeader = _WinHttpQueryHeaders($hRequest)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        Local $aSR = StringRegExp($sHeader, '(?i)(?:Last-Modified): (.+?), (\d+) (\H+) (\d+) (\d+):(\d+):(\d+)\h+GMT\h*((?:[+-]?\h*\d+)?)', 3)
        If @error Then Return SetError(2, 0, '')
        Local $sMon = 'Jan01,Feb02,Mar03,Apr04,May05,Jun06,Jul07,Aug08,Sep09,Oct10,Nov11,Dec12'
        Local $s_Mon = StringRegExpReplace($sMon, '(?i).*?' & $aSR[2] & '(\d+).*', '$1')
        Local $sTimer = $aSR[3] & '/' & $s_Mon & '/' & $aSR[1] & ' ' & $aSR[4] & ':' & $aSR[5] & ':' & $aSR[6]
        If Number($aSR[7]) = 8 Then Return $sTimer
        Local $sNewDate = _DateAdd('h', 8 - Number($aSR[7]), $sTimer)
        Return $sNewDate
EndFunc   ;==>_WinHttpGetLastModified