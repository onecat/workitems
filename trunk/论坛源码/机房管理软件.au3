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
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <GuiTab.au3>
#Region ### START Koda GUI section ### Form=�����������.kxf
$Form1_1 = GUICreate("�����������", 438, 309, 221, 163,BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SYSMENU,$WS_GROUP,$WS_TABSTOP))
$Tab1 = GUICtrlCreateTab(0, 0, 433, 305)
_GUICtrlTab_SetItemSize($Tab1, 66, 28)
$TabSheet1 = GUICtrlCreateTabItem("��������ǰ׼���������")
$Button1 = GUICtrlCreateButton("ͬ��ר�����ɰ�", 24, 40, 161, 41)
$Button2 = GUICtrlCreateButton("������ʱ��ͬ��", 24, 101, 161, 41)
$Button3 = GUICtrlCreateButton("�����ƶ����� V.01", 24, 163, 161, 41)
$Button4 = GUICtrlCreateButton("�����ƶ�����1.91", 24, 224, 161, 41)
$Button5 = GUICtrlCreateButton("����IP��ַ", 246, 40, 161, 41)
$Button6 = GUICtrlCreateButton("���ļ��������IP��ַ", 246, 101, 161, 41)
$Button7 = GUICtrlCreateButton("��ֹU�̼���", 246, 163, 161, 41)
$Button8 = GUICtrlCreateButton("���ļ������", 246, 224, 161, 41)
$TabSheet2 = GUICtrlCreateTabItem("ϵͳ������")
$Button9 = GUICtrlCreateButton("CMD", 25, 39, 161, 41)
$Button10 = GUICtrlCreateButton("���������", 25, 100, 161, 41)
$Button11 = GUICtrlCreateButton("��ӻ�ɾ������", 25, 162, 161, 41)
$Button12 = GUICtrlCreateButton("�豸������", 25, 223, 161, 41)
$Button13 = GUICtrlCreateButton("ע���", 247, 39, 161, 41)
$Button14 = GUICtrlCreateButton("ע�������", 247, 100, 161, 41)
$Button15 = GUICtrlCreateButton("���������", 247, 162, 161, 41)
$Button16 = GUICtrlCreateButton("�رռ����", 247, 223, 161, 41)
$TabSheet3 = GUICtrlCreateTabItem("����ƽ�������")
$Button17 = GUICtrlCreateButton("3D����ע��Ľ������", 19, 43, 161, 41)
$Button18 = GUICtrlCreateButton("3dsmax8.0�ƽ���", 19, 104, 161, 41)
$Button19 = GUICtrlCreateButton("CAD2006�ƽ���", 19, 166, 161, 41)
$Button20 = GUICtrlCreateButton("����7.5�ƽ���", 19, 227, 161, 41)
$Button21 = GUICtrlCreateButton("���к������", 241, 43, 161, 41)
$Button22 = GUICtrlCreateButton("Photoshop CS2�ƽ���", 241, 104, 161, 41)
$Button23 = GUICtrlCreateButton("Premiere Pro 2.0�ƽ���", 241, 166, 161, 41)
$Button24 = GUICtrlCreateButton(" Dreamweaver MX 2004�ƽ���", 241, 227, 161, 41)
$TabSheet4 = GUICtrlCreateTabItem("����������")
$Button25 = GUICtrlCreateButton("�ɸ봫��2007", 20, 41, 161, 41)
$Button26 = GUICtrlCreateButton("�������������", 20, 101, 161, 41)
$Button27 = GUICtrlCreateButton("GHOST��IP�޸Ĺ���", 20, 161, 161, 41)
$Button28 = GUICtrlCreateButton("Internet����", 20, 221, 161, 41)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                        Case $Button1
                        runwait(@ScriptDir & "\��������ǰ׼���������\ͬ��ר�����ɰ�\SEBarSvr.exe")
                        Case $Button2
                        runwait(@ScriptDir & "\��������ǰ׼���������\������ʱ��ͬ��\������ʱ��ͬ�����.exe")
                        Case $Button3
                        runwait(@ScriptDir & "\��������ǰ׼���������\�����ƶ�����\�����ƶ����� V.01\mode.exe")
                        Case $Button4
                        runwait(@ScriptDir & "\��������ǰ׼���������\�����ƶ�����\�����ƶ�����1.91\MoveWizard.EXE")
                        Case $Button5
                        runwait(@ScriptDir & "\��������ǰ׼���������\����IP��ַ\����IP��ַ.exe")
                        Case $Button6
                        runwait(@ScriptDir & "\��������ǰ׼���������\���ļ��������IP��ַ\���ļ��������IP��ַ.EXE")
                        Case $Button7
                        runwait(@ScriptDir & "\��������ǰ׼���������\��ֹU�̼���\��ֹU�̼���.EXE")
                        Case $Button8
                        runwait(@ScriptDir & "\��������ǰ׼���������\���ļ������\���ļ������.EXE")
                        Case $Button9
                        ShellExecute("cmd.exe");CMD
                        Case $Button10
                        ShellExecute("compmgmt.msc");���������
                        Case $Button11
                        ShellExecute("appwiz.cpl");��ӻ�ɾ������
                        Case $Button12
                        ShellExecute("devmgmt.msc");�豸������
                        Case $Button13
                        runwait(@ScriptDir & "\ϵͳ������\ע���\RegShortCut.exe")
                        Case $Button14
                        ShellExecute("logoff");ע�������
                        Case $Button15
                        Shutdown(2);���������
                        Case $Button16
                        ShellExecute("shutdown");�رռ����
                        Case $Button17
                        ShellExecute("3D����ע��Ľ������.txt", "","����ƽ�������\3ds max 8.0�ƽ�")
                        Case $Button18
                        runwait(@ScriptDir & "\����ƽ�������\3ds max 8.0�ƽ�\3dsmax8.0�ƽ���.exe")
                        Case $Button19
                        runwait(@ScriptDir & "\����ƽ�������\CAD2006�ƽ���\CAD2006�ƽ���.exe")
                        Case $Button20
                        runwait(@ScriptDir & "\����ƽ�������\����7.5�ƽ���\����7.5�ƽ���.exe")
                        Case $Button21
                        runwait(@ScriptDir & "\����ƽ�������\���к������\���к������.exe")
                        Case $Button22
                        runwait(@ScriptDir & "\����ƽ�������\Photoshop CS2�ƽ���\Photoshop CS2�ƽ���.exe")
                        Case $Button23
                        runwait(@ScriptDir & "\����ƽ�������\Premiere Pro 2.0�ƽ���\Premiere Pro 2.0�ƽ���.exe")
                        Case $Button24
                        runwait(@ScriptDir & "\����ƽ�������\Dreamweaver MX 2004�ƽ���\Dreamweaver MX 2004�ƽ���.exe")
                        Case $Button25
                        runwait(@ScriptDir & "\����������\�ɸ봫��2007\�ɸ봫��2007.exe")
                        Case $Button26
                        ShellExecute("��ͨ����������(���ʱ���������֤���ɽ���).cmd", "","����������\�������������")
                        Case $Button27
                        runwait(@ScriptDir & "\����������\GHOST��IP�޸Ĺ���\GHOST��IP�޸Ĺ���.exe")
                        Case $Button28
                        ShellExecute("inetcpl.cpl");Internet����
                        


        EndSwitch
WEnd
;control userpasswords2--------�û��ʻ�����