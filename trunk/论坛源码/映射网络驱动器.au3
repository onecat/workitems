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

DriveMapAdd("X:", "\\172.18.6.10\test",0)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
$INI = "config.ini"
$ServerIP = IniRead($INI,"����","������IP","")
$ServerPath = Iniread($INI,"����","��������","")
$UserName   = Iniread($INI,"����","�����ʺ�","") 
$UserPass   = Iniread($INI,"����","��������","")
$PatchName = IniRead($INI,"����","ӳ������","");��
$DriveName = IniRead($INI,"����","ӳ���̷�","")
DriveMapAdd($DriveName,"\\" & $ServerIP & "\" & $ServerPath, 0, $PatchName & "\" & $UserName, $UserPass)
����IP��ʱ�����������\������������Ƶ�ǰ�߼Ӹ���\������β��üӡ�\�������ϣ�����ӳ���̷������ƻ���ini�ļ��ṩ��ӳ�����ƣ�Ȼ���ӳ����̷��������ˡ�

ini�ļ�
[����]
������IP=\\192.168.1.3
��������=\QQ
�����ʺ�=3
��������=4
ӳ������=QQ
ӳ���̷�=Z:

лл��~~~~
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�