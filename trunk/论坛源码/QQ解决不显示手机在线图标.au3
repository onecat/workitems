#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=L:\����\QQ\3D���ICOͼ��\quitime.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\QQ�������ʾ�ֻ�����ͼ��.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=Сվ����
#PRE_Res_Description=Сվ����
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=Сվ����
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
#include <WinAPI.au3>

If ProcessExists("QQ.exe") Then ; Check if the Notepad process is running.
    $ms = MsgBox(1, "QQ��ʾ�ֻ�����ͼ��", "��ر�QQ���̲�ʹ�ñ�����")
	ms()
Else
    QQ()
EndIf

Func ms()
	If $ms=1 Then
		QQ()
	Else
		Exit
	EndIf
EndFunc	

Func QQ()
$QQpach=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\TENCENT\QQ2009", "Install") & "\Misc\CSC\2052\9"
$QQTEP=@AppDataDir & "\Tencent\QQ\Misc\CSC\2052\9"
$QQWJ= @AppDataDir & "\Tencent\QQ\Misc\CSC\2052\9\18"
FileInstall("C:\Users\chtyfox\Desktop\18" , $QQpach & "\18")
FileDelete($QQTEP & "\18")
_WinAPI_CreateFile($QQWJ,1, "","",4)
EndFunc