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
Local $AutoIt_Start_Time = _NowCalc()

;~ ����ִ������
MsgBox(0,"1","1")

Local $AutoIt_Stop_Time = _DateDiff('s', $AutoIt_Start_Time, _NowCalc())
_CalcAutoItExecutionTime($AutoIt_Stop_Time)

;~ ������ת��ΪСʱ����ĺ���
Func _CalcAutoItExecutionTime($Time)
        Select
                Case $Time < 60
                        MsgBox(0,"������ʾ","����ִ������ʱ��Ϊ��"&$Time&"��")
                Case $Time = 60
                        MsgBox(0,"������ʾ","����ִ������ʱ��Ϊ��1����")
                Case $Time > 60 And $Time < 3600
                        Local $CalcTimeMin = Floor ($Time / 60)
                        Local $CalcTimeSec = $Time - ((Floor ($CalcTimeMin)) * 60)
                        MsgBox(0,"������ʾ","����ִ������ʱ��Ϊ��" & $CalcTimeMin & "��" & $CalcTimeSec & "��")
                Case $Time = 3600
                        Local $CalcTimeHour = $Time / 60 / 60
                        MsgBox(0,"������ʾ","����ִ������ʱ��Ϊ��" & $CalcTimeHour & "Сʱ")
                Case $Time > 3600
                        Local $CalcTimeHour = Floor ($Time / 60 / 60)
                        Local $CalcTimeMin = Floor (($Time - (Floor ($CalcTimeHour) * 60 * 60)) / 60)
                        Local $CalcTimeSec = ($Time - ( $CalcTimeHour * 60 * 60 )) - ((Floor (($Time - ( $CalcTimeHour * 60 * 60 )) / 60)) * 60)
                        MsgBox(0,"������ʾ","����ִ������ʱ��Ϊ��" & $CalcTimeHour & "Сʱ" & $CalcTimeMin & "��" & $CalcTimeSec & "��")
        EndSelect
EndFunc