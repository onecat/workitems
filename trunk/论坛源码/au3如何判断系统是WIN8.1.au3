#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Outfile=C:\Users\chtyfox\Desktop\au3����ж�ϵͳ��WIN8.1.exe
#PRE_Compression=4
#PRE_UseX64=y
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ACNԤ����������(���ò���)
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
$Kpath = "C:\WINDOWS\system32\kernel32.dll"
                        If FileExists($Kpath) Then
                                $Version = StringLeft(FileGetVersion($Kpath), 3)
                                Switch $Version
                                        Case "5.0"
                                                $Ver = "Win2000"
                                        Case "5.1"
                                                $Ver = "WinXP"
                                        Case "5.2"
                                                $Ver = "Win2003"
                                        Case "6.0"
                                                $Ver = "Vista"
                                        Case "6.1"
                                                $Ver = "Win7"
                                        Case "6.2"
                                                $Ver = "Win8"
                                        Case "6.3"
                                                $Ver = "Win8.1"
                                EndSwitch
                        EndIf


MsgBox(1,"1",$Version)
MsgBox(1,"1",$Ver)