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
#include <Date.au3>
Dim $time = GetTime()
MsgBox(0,"",$time)
Dim $ntime, $H, $M, $S
$ntime = StringRegExp($time, "\d+\:\d+\:\d+", 3)
If Not IsArray($ntime) Then Exit (MsgBox(0, "", "��ȡʱ��ʧ��"))
If $ntime[0] <> _NowTime() Then
        If MsgBox(4 + 262144, "", "����ϵͳʱ���뱱��ʱ�䲻ͬ����Ҫ����Ϊ����ʱ����") = 6 Then
                $time = GetTime()
                $ntime = StringRegExp($time, "\d+\:\d+\:\d+", 3)
                $H = StringRegExp($ntime[0], "(\d+)\:", 3)
                $M = StringRegExp($ntime[0], "\:(\d+)\:", 3)
                $S = StringRegExp($ntime[0], "\:\d+\:(\d+)", 3)
                _SetTime($H[0], $M[0], $S[0])
        EndIf
EndIf
 
Func GetTime()
        Local $http = 'http://www.timedate.cn/worldclock/ti.asp'
        Local $sData = InetRead($http, 1)
        Local $Source = BinaryToString($sData, 1)
        Local $aSR = StringRegExp($Source, 'n\w+\=(\d+)', 3)
        If @error Or UBound($aSR) < 7 Then Exit
        Local $Array[8] = ['��', 'һ', '��', '��', '��', '��', '��', '��']
        Local $time = StringFormat('%d��%d��%d�� ����%s %02d:%02d:%02d', $aSR[0], $aSR[1], $aSR[2], $Array[$aSR[3]], $aSR[4], $aSR[5], $aSR[6])
        Return $time
EndFunc   ;==>GetTime


