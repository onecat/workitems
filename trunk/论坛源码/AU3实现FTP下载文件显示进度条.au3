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
Local $nDownload
Local $nSize
Local $ProgressBar
DirCreate ("H:\TEST")  ;����һ���ļ��С����ڴ�����ص��ļ�

;��InetGetSize��ȡ�ļ���С
$nSize = InetGetSize("ftp://sam:sam@192.168.9.253/2.rar")
MsgBox(0,"��ʾ��","�ļ���С:" & $nSize)

;��ʾ���ؽ���
ProgressOn ("���ؽ���","�����������Ժ�.....","0 %")
For $ProgressBar = 0 To $nSize Step 10
        Sleep(1000)
        ProgressSet($ProgressBar,$ProgressBar & " %")
Next
ProgressSet(100 ,"���","ȫ�����")
Sleep(500)

;ʹ��InetGet�����ļ�
$nDownload = InetGet("ftp://sam:sam@192.168.9.253/2.rar","H:\TEST\2.rar",0,1) 
Do
        Sleep(200)
        Until InetGetInfo($nDownload,2) ;����Ƿ��������

ProgressOff() ;�رս�����

MsgBox(0,"�����ʾ��","�������")
