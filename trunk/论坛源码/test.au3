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

#include <Interval_Time.au3>
#include <Date.au3>
;~ D - ����Ϊ��λ��ӵ�ָ��������
;~ M - ����Ϊ��λ��ӵ�ָ��������
;~ Y - ����Ϊ��λ��ӵ�ָ��������
;~ w - ����Ϊ��λ��ӵ�ָ��������
;~ h - ��СʱΪ��λ��ӵ�ָ��������
;~ n - �Է���Ϊ��λ��ӵ�ָ��������
;~ s - ������Ϊ��λ��ӵ�ָ��������
_time(10, "s") ;10����ִ��һ��
Func _run()
;~ ������������⿪ʼд
        MsgBox(0,0,"�����ɹ���")
EndFunc
	
Func _time($a, $type)
While True
$NewDate = _DateAdd($type, $a, _NowCalc())
While True
If _NowCalc() = $NewDate Then
_run()
ExitLoop

EndIf
WEnd
WEnd
EndFunc
	