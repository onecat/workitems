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

#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Outfile=C:\Users\Administrator\Desktop\xx\xxTools.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Smallan������
#AutoIt3Wrapper_Res_Description=Smallan
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Smallan
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Administrator\Desktop\Form1.kxf
$Form1 = GUICreate("xx������", 437, 470, 410, 171)
GUISetFont(9, 400, 0, "����")
$Button1 = GUICtrlCreateButton("��ע���", 24, 40, 97, 33)
$Button2 = GUICtrlCreateButton("�򿪿������", 24, 80, 97, 33)
$Button3 = GUICtrlCreateButton("�����������", 24, 120, 97, 33)
$Button4 = GUICtrlCreateButton("��������", 24, 160, 97, 33)
$Button5 = GUICtrlCreateButton("���豸������", 24, 200, 97, 33)
$Button6 = GUICtrlCreateButton("�򿪴��̹�����", 24, 240, 97, 33)
$Button7 = GUICtrlCreateButton("�򿪷������", 24, 280, 97, 33)
$Button8 = GUICtrlCreateButton("�򿪼��±�", 24, 320, 97, 33)
$Button9 = GUICtrlCreateButton("�򿪻�ͼ", 24, 360, 97, 33)
$Group1 = GUICtrlCreateGroup("�������", 304, 16, 124, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("������", 152, 16, 137, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("ϵͳ���", 8, 16, 129, 393)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button10 = GUICtrlCreateButton("OA�칫ϵͳ", 320, 40, 92, 33)
$Button11 = GUICtrlCreateButton("������̳", 320, 80, 92, 33)
$Button12 = GUICtrlCreateButton("�������԰�", 320, 120, 92, 33)
$Button13 = GUICtrlCreateButton("��Ϸ���²�ѯ", 320, 160, 92, 33)
$Button14 = GUICtrlCreateButton("��ά��ʦ����", 320, 200, 92, 33)
$Button15 = GUICtrlCreateButton("���Բ���'s Blog", 320, 240, 92, 33)
$Button16 = GUICtrlCreateButton("��ά��ʦ��̳", 320, 280, 92, 33)
$Button17 = GUICtrlCreateButton("�����ȷ�����", 320, 320, 92, 33)
$Button18 = GUICtrlCreateButton("XX����", 320, 360, 92, 33)
$Button19 = GUICtrlCreateButton("ж�ؾ����ȷ�", 168, 40, 105, 33)
$Button21 = GUICtrlCreateButton("GHOST32", 168, 80, 105, 33)
$Button22 = GUICtrlCreateButton("MstscԶ�̹���", 168, 120, 105, 33)
$Button23 = GUICtrlCreateButton("RadminԶ�̹���", 168, 160, 105, 33)
$Button24 = GUICtrlCreateButton("VNCԶ�̹���", 168, 200, 105, 33)
$Button25 = GUICtrlCreateButton("���������޸�", 168, 240, 105, 33)
$Button26 = GUICtrlCreateButton("CMOS�������", 168, 280, 105, 33)
$Button27 = GUICtrlCreateButton("HDTunesӲ�̼��", 168, 320, 105, 33)
$Button28 = GUICtrlCreateButton("OA�칫���", 168, 360, 105, 33)
$Input1 = GUICtrlCreateInput("ping 202.102.192.68", 8, 416, 281, 24)
$Button29 = GUICtrlCreateButton("��������", 304, 416, 121, 25)
$Label1 = GUICtrlCreateLabel("��Ȩ���� �� Smallan", 100, 448, 240, 20)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        Run(@WindowsDir &"\regedit.exe");��ע���
                Case $Button2
                        Run(@SystemDir &"\control.exe");�򿪿������
                Case $Button3
                        Run(@SystemDir &"\taskmgr.exe");�����������       
                Case $Button4
                        Run(@SystemDir &"\cmd.exe");��������      
                Case $Button5
                        _RunDOS(@SystemDir &"\devmgmt.msc");���豸������
                Case $Button6
                        _RunDOS(@SystemDir &"\diskmgmt.msc");�򿪴��̹�����
                Case $Button7
                        _RunDOS(@SystemDir &"\services.msc");�򿪷��������
                Case $Button8
                        Run(@SystemDir &"\notepad.exe");���������Ƴ���
                Case $Button9
                        Run(@SystemDir &"\mspaint.exe");�򿪻�ͼ����
                Case $Button29
                        Run(@ComSpec &" /c"&GUICtrlRead($input1));��ȡ�ı����������Ȼ������
                Case $Button10
                        ShellExecute("http://xx.xx.xx.xx")
                Case $Button11
                        ShellExecute("http://xx.xx.xx.xx")
                Case $Button12
                        ShellExecute("http://xxx.xxx.xxx")
                Case $Button13
                        ShellExecute("http://www.icafe8.com/frontEnd/prod_game_update.html")
                Case $Button14
                        ShellExecute("http://www.icafe8.com")
                Case $Button15
                        ShellExecute("http://www.clxp.net.cn")
                Case $Button16
                        ShellExecute("http://bbs.icafe8.com")
                Case $Button17
                        ShellExecute("http://www.ah-netbar.com/sylt.asp")
                Case $Button19
                        ShellExecute("C:\YTOOLS\CleanMainPro.exe")  
                Case $Button21
                        ShellExecute("C:\YTOOLS\Ghost32.exe") 
                Case $Button22
                        ShellExecute("C:\YTOOLS\mstsc.exe") 
                Case $Button23
                        ShellExecute("C:\YTOOLS\RadminClient\Radmin.exe") 
                Case $Button24
                        ShellExecute("C:\YTOOLS\vnc.exe") 
                Case $Button25
                        ShellExecute("C:\YTOOLS\NTBOOTautofix.exe") 
                Case $Button26
                        ShellExecute("C:\YTOOLS\cmos.exe") 
                Case $Button27
                        ShellExecute("C:\YTOOLS\HDTunePro.exe") 
                Case $Button28
                        ShellExecute("http://xx.xx.xx.xx") 
                Case $Label1
        EndSwitch
WEnd