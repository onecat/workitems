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

$Msg = MsgBox(4 + 32, "�����������", "�Ƿ���������ӣ�")
If $Msg = 7 Then
        Exit
Else
        Switch @OSVersion
                Case "WIN_7"
                        $rasphone = @AppDataDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk" ;��ǰ�û� Application Data Ŀ¼����·��
                        JLKD()
                Case "WIN_XP"
                        $rasphone = @AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk"
                        JLKD()
        EndSwitch
EndIf

Func JLKD()
        FileOpen($rasphone, 1)
        If StringInStr(FileRead($rasphone), "[�������]") = 0 Then
                FileWriteLine($rasphone, "[�������]")
                FileWriteLine($rasphone, "Type=5")
                FileWriteLine($rasphone, "PreviewDomain=0")
                FileWriteLine($rasphone, "PreviewPhoneNumber=0" & @CRLF)
                FileWriteLine($rasphone, "NETCOMPONENTS=")
                FileWriteLine($rasphone, "ms_server=0")
                FileWriteLine($rasphone, "ms_msclient=0" & @CRLF)
                FileWriteLine($rasphone, "MEDIA=rastapi")
                FileWriteLine($rasphone, "Port=PPPoE6-0")
                FileClose($rasphone)
                FileCreateShortcut(@WindowsDir & "\system32\rasphone.exe", @DesktopDir & "\�������.lnk", @WindowsDir,"-d, �������",@SystemDir & "\netshell.dll","","105")
                ;Run(@ComSpec & " /c " & 'rasphone -d ADSL', "", @SW_HIDE)
        Else
                MsgBox(64, "��ʾ:", "��������ѽ���,��ȷ���˳�!", 10)
                Exit
        EndIf
EndFunc   ;==>JLKD