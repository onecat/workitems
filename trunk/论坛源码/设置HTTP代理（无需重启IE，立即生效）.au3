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
#AutoIt3Wrapper_outfile=��������.exe
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
Opt("TrayIconHide", 1) 
Example()
 
Func Example()
        Local $file, $btn, $btn2, $msg
 
        GUICreate(" ��������", 320, 60)
        WinSetOnTop(" ��������", '', 1)
        $file = GUICtrlCreateInput("", 10, 5, 300, 20)
        $btn = GUICtrlCreateButton("ȷ��", 40, 35, 60, 20)
        $btn2 = GUICtrlCreateButton("ɾ��", 120, 35, 60, 20)
        If RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings','ProxyEnable') = 0 Then
        GUICtrlCreateLabel('��ʹ�ô��������',190, 40)
        Else
        GUICtrlCreateLabel('����ʹ�ô��������',190, 40)
        EndIf
        GUISetState()
 
        $msg = 0
        While 1
 
                $msg = GUIGetMsg()
                Select
                        Case $msg = $GUI_EVENT_CLOSE
                                Exit
                        Case $msg = $btn
                                If GUICtrlRead($file) = '' Then
                                        MsgBox(16, '����', '���������IP��ַ')
                                        ContinueLoop
                                Else
                                        $a = StringReplace(StringStripWS(GUICtrlRead($file), 3), " ", ":")
                                        RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000001)
                                        RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", $a)
                                        $a = Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE", '', @SW_HIDE)
                                        ProcessWait ($a)
                                        If ProcessExists($a) Then ProcessClose($a)
                                        GUICtrlCreateLabel('����ʹ�ô��������',190, 40)
                                EndIf
                        Case $msg = $btn2
                                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000000)
                                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", "")
                                $a = Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE", '', @SW_HIDE)
                                ProcessWait ($a)
                                If ProcessExists($a) Then ProcessClose($a)
                                GUICtrlCreateLabel(' ��ʹ�ô��������',190, 40)
                EndSelect
        WEnd
 
EndFunc   ;==>Example
