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
Global Const $xinqi[8] = [7, "Sun(������) ", "Mon(����һ) ", "Tue(���ڶ�) ", "Wed(������) ", "Thu(������) ", "Fri(������) ", "Sat(������) "] ;���� 0 - 6
Global Const $xinqi1[8] = [7, "Sun ", "Mon ", "Tue ", "Wed ", "Thu ", "Fri ", "Sat "] ;���� 0 - 6
Global Const $yue[13] = [12, "Jan(1)��", "Feb(2)��", "Mar(3)��", "Apr(4)��", "May(5)��", "Jun(6)��", "Jul(7)��", "Aug(8)��", "Sep(9)��", "Oct(10)��", "Nov(11)��", "Dec(12)��"] ;�·� 1 - 12
Global Const $yue1[13] = [12, "Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov", "Dec "] ;�·� 1 - 12
 
 
 MsgBox(0,"ʾ��",_UTC_Dtime())
  MsgBox(0,"ʾ��",_UTC_Dtime1())
 
;by��ɫ��   2014.06.24
;[url]www.JianYiIT.com[/url]    �ӽű�����ϵQQ��79664738
;һ���������ڵ���ʾ �ر�������ĳЩpost/get����ʱ��ʱ����ύ
;~���ص����ڸ�ʽ        Tue Jun 24 08:43:05 UTC+0800 2014 
Func _UTC_Dtime()
		Return @YEAR & "��" & $yue[@MON] & @MDAY & "��" & " " & $xinqi[@WDAY] & @HOUR & ":" & @MIN & ":" & @SEC & " UTC+0800 " 
EndFunc

Func _UTC_Dtime1()
        Return $xinqi1[@WDAY] & $yue1[@MON] & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & " UTC+0800 " & @YEAR
EndFunc
