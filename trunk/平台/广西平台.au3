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
Global $Paused
HotKeySet("{F2}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{F1}", "MouseC")

While 1
   Sleep(500)
WEnd

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
		$t = IniRead ( @ScriptDir & "\myfile.ini", "����", "����", "" )
		;MsgBox(0,"�ű���ͣ��", "���д���" & MouseC())
        ToolTip('�ű���ͣ��' & "�ű����е���" & $t & "��" ,250,250)
    WEnd
    ToolTip("")
EndFunc;


Func Terminate()
    Exit 0
EndFunc 

Func MouseC()
Local $i = 1
While $i <= 6000
WinActivate("�������ܼ��ϵͳ","")
ControlClick("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,422, 93)
ControlSend ("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("�������ܼ��ϵͳ","")
ControlClick("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,440, 121)
ControlSend ("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("�������ܼ��ϵͳ","")
ControlClick("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,910, 65)
ControlSend ("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("�������ܼ��ϵͳ","")
ControlClick("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,881, 93)
ControlSend ("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
ControlClick("�������ܼ��ϵͳ","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",1,585, 185)
Sleep(500)

IniWrite(@ScriptDir & "\myfile.ini", "����", "����",$i)

If Not ProcessExists("SmartGIS.exe")  Then
	IniWrite(@ScriptDir & "\myfile.ini", "������", "����","��" &  $i & "�α���")
	Exit
EndIf	

WinActivate("�������ܼ��ϵͳ","")
If Not WinExists ("�������ܼ��ϵͳ","")  Then
	IniWrite(@ScriptDir & "\myfile.ini", "������", "����","��" &  $i & "�α���")
	Exit
EndIf	

 $i = $i + 1
WEnd
Exit
EndFunc 