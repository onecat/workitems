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
#Region 
#AutoIt3Wrapper_icon=d:\My Documents\icon\favicon.ico
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Res_Comment=Ҫ�����Ҫ��Ȩ
#AutoIt3Wrapper_Res_Description=ͨ��FTP�ϴ������ļ�
#AutoIt3Wrapper_Res_Fileversion=2.1.505
#AutoIt3Wrapper_Res_LegalCopyright=zeebit@hotmail.com Qme:1415020
#EndRegion
 
#cs 
----------------------------------------------------------------------------------------
�ڽ�ѧ�У�ѧ������ҵ��Ҫ����
�������ڸ��Եļ�����в���ô��ȫ�����ܻᱻ�������ѧ�������޸�����ɾ��
        ʵ�ֹ���1�����ļ��϶��������ڵ��ı����У�����Ͼʹ���ť�����ϴ�
        ʵ�ֹ���2�����ļ���д���ı����У�������ؾͿ��Խ��Ѿ��ϴ������ļ����ص�����
2008-4-28
1��û��ѡ���ļ����͵�����ϴ��������ء�����ʱ�������Ի���Ӧ�����Լ��˸��ж�����
2��ָ�������ļ�������
3�����롰״̬�С�������ɫ
4���޸İ�����Ϣ
2008-5-5
�ж������ļ��Ƿ����

[serverinfo]
ip="127.0.0.1"----------------�������ʵ������޸�
name="ftp"
pass="ftp"
ctrlport="21"---------------�����ʱû�õ�
dataport="22"------------------�����ʱû�õ�
----------------------------------------------------------------------------------------
#CE
 
 
#NoTrayIcon
#include <GUIConstants.au3>
#include "ftp.au3"
#include <file.au3>
#include <ftpex.au3>
$z_ver = "V2.1.505"
$title = "FTP�ļ��ϴ������� " & $z_ver
Global $ftpserverinfo = "ftp.ini"
If( Not FileExists($ftpserverinfo) ) Then
        MsgBox(48,"ERROR","�����ļ� "&$ftpserverinfo&" ��ʧ��")
        Exit
EndIf
Dim $ftp_ip = IniRead($ftpserverinfo, "serverinfo", "ip", "")
Dim $ftp_name =  IniRead($ftpserverinfo, "serverinfo", "name", "")
Dim $ftp_pass = IniRead($ftpserverinfo, "serverinfo", "pass", "")
Dim $ftp_ctrlport = IniRead($ftpserverinfo, "serverinfo", "ctrlport", "")
Dim $ftp_dataport = IniRead($ftpserverinfo, "serverinfo", "dataport", "")
 
$gui_main = GUICreate($title, 320,130, @DesktopWidth/2-160, @DesktopHeight/2-45, -1, 0x00000018); WS_EX_ACCEPTFILES
;~ $Dummy1 = GUICtrlCreateDummy()
$Label_txt = GUICtrlCreateLabel("�뽫Ҫ�ϴ����ļ��϶���������ı�����", 11, 13, 220, 17)
$input_file = GUICtrlCreateInput ( "", 10,  35, 300, 20)
GUICtrlSetState(-1,$GUI_DROPACCEPTED)
GUICtrlCreateLabel("FTP��������" & $ftp_ip, 11, 78, 220, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateLabel("Powered by zeebit", 210, 116, 180, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$btn_upload = GUICtrlCreateButton ("�ϴ�", 160,  75, 49, 20)
$btn_download = GUICtrlCreateButton ("����", 210,  75, 49, 20)
$btn_help = GUICtrlCreateButton ("����", 260,  75, 49, 20)
$Graphic1 = GUICtrlCreateGraphic(0, 98, 320, 18)
GUICtrlSetBkColor(-1, 0xD4D0C8)
$Label_stat = GUICtrlCreateLabel("��ӭʹ�� "&$title, 11, 101, 320, 14)
GUICtrlSetBkColor(-1, 0xD4D0C8)
GUISetState () 
 
$gui_help = GUICreate($title, 320,130, @DesktopWidth/2-160, @DesktopHeight/2-45, -1, 0x00000018); WS_EX_ACCEPTFILES
;~ $Icon = GUICtrlCreateIcon("d:\My Documents\icon\favicon.ico", 0, 288, 0, 32, 32, BitOR($SS_NOTIFY,$WS_GROUP))
;~ $Label_h0 = GUICtrlCreateLabel("ע�⣺", 11, 13, 320, 17)
$Label_h1 = GUICtrlCreateLabel("1���������ŵ��ļ����ϴ�ʱ���ܻ�ʧ�ܡ�", 12, 13, 270, 17)
$Label_h2 = GUICtrlCreateLabel("2�����ı�������������׼ȷ���ļ������ٵ㡰���ء������Դ�FTP����������ָ���ļ������档", 12, 33, 300, 34)
$Label_h3 = GUICtrlCreateLabel("3�������ʾ����FTP������������ȷ�����糩ͨ�ҷ���������������", 12, 66, 310, 27)
$btn_back = GUICtrlCreateButton ("����", 250,  95, 60, 20)
GUICtrlCreateLabel("Powered by zeebit", 210, 116, 180, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_HIDE, $gui_help)
 
Local $nMsg
While 1
        $nMsg = GUIGetMsg()
        Select 
                Case $nMsg = $GUI_EVENT_CLOSE
                        Exit
                Case $nMsg =  $btn_help
                        GUISetState(@SW_HIDE, $gui_main)
                        GUISetState(@SW_SHOW, $gui_help)
					Case $nMsg =  $btn_back
                        GUISetState(@SW_HIDE, $gui_help)
                        GUISetState(@SW_SHOW, $gui_main)
                Case $nMsg =  $btn_download
                        $full_path = GUICtrlRead($input_file)
                        If($full_path=="") Then 
                                GUICtrlSetData($Label_stat,"������Ҫ���ص��ļ�����")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                                ContinueLoop
                        EndIf
                        GUICtrlSetState($btn_download, $GUI_DISABLE)
                        $array_filename = StringSplit($full_path,"\")
                        $file_name = $array_filename[$array_filename[0]] 
                        $error_i = 0
                        $dllhandle = DllOpen( 'wininet.dll' )
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllOpen wininet.dll Failed")
                                EndIf
                        $z_ftpOpen  = _FTPOpen('MyFTP_Control')
                                if @error then
                                        GUICtrlSetData($Label_stat,"��FTP�Ự����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        $z_ftpConn  = _FTPConnect($z_ftpOpen, $ftp_ip, $ftp_name, $ftp_pass, $ftp_ctrlport)
                                if @error then
                                        GUICtrlSetData($Label_stat,"����FTP����������")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
;~                                      ContinueLoop 
                                EndIf 
                        If($error_i==0) Then
                                $z_ftpPut   = _FtpGetFile($z_ftpConn, '/'&$file_name, @DesktopDir & '\' & $file_name,1,0)
                                if @error then
                                        GUICtrlSetData($Label_stat,"��FTP�����������ļ�ʱ����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
                                EndIf 
                        EndIf
                        $z_ftpColse = _FTPClose($z_ftpOpen)
                                if @error then
                                        GUICtrlSetData($Label_stat,"����FTP�Ự����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        DllClose($dllhandle)
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllClose wininet.dll Failed")
                                EndIf
                        GUICtrlSetData($input_file,"")
                        If($error_i ==0) then 
                                GUICtrlSetData($Label_stat,"��"&$file_name&"���ɹ����ص����棡")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                        EndIf
                        $error_i = 0
                        GUICtrlSetState($btn_download, $GUI_ENABLE)
                Case $nMsg =  $btn_upload
                        $full_path = GUICtrlRead($input_file)
                        If($full_path=="") Then 
                                GUICtrlSetData($Label_stat,"��ѡ��Ҫ�ϴ����ļ���")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                                ContinueLoop
                        EndIf
                        GUICtrlSetState($btn_upload, $GUI_DISABLE)
                        $array_filename = StringSplit($full_path,"\")
                        $file_name = $array_filename[$array_filename[0]] 
                        $error_i = 0
                        $dllhandle = DllOpen( 'wininet.dll' )
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllOpen wininet.dll Failed")
                                EndIf
                        $z_ftpOpen  = _FTPOpen('MyFTP_Control')
                                if @error then
                                        GUICtrlSetData($Label_stat,"��FTP�Ự����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        $z_ftpConn  = _FTPConnect($z_ftpOpen, $ftp_ip, $ftp_name, $ftp_pass, $ftp_ctrlport)
                                if @error then
                                        GUICtrlSetData($Label_stat,"����FTP����������")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
;~                                      ContinueLoop 
                                EndIf 
                        If($error_i==0) Then
                                $z_ftpPut   = _FtpPutFile($z_ftpConn, $full_path, '/'&$file_name)
                                if @error then
                                        GUICtrlSetData($Label_stat,"�ϴ��ļ���FTP������ʱ����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
                                EndIf 
                        EndIf
                        $z_ftpColse = _FTPClose($z_ftpOpen)
                                if @error then
                                        GUICtrlSetData($Label_stat,"����FTP�Ự����")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        DllClose($dllhandle)
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllClose wininet.dll Failed")
                                EndIf
                        GUICtrlSetData($input_file,"")
                        If($error_i ==0) then 
                                GUICtrlSetData($Label_stat,"��"&$file_name&"���ϴ��ɹ���")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                        EndIf
                        $error_i = 0
                        GUICtrlSetState($btn_upload, $GUI_ENABLE)
        EndSelect
WEnd
