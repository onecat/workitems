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
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <Array.au3>
Global Const $gc_formName = "�����ļ�"
#Region ### START Koda GUI section ###
Global $gu_PzForm = GUICreate($gc_formName, 402, 288, 340, 128)
Global $gu_PzGroup1 = GUICtrlCreateGroup("[1]�����ļ�", 13, 6, 374, 60)
Global $gu_PzInput1 = GUICtrlCreateInput("", 25, 32, 260, 21)
Global $gu_PzButton1 = GUICtrlCreateButton("���д��(O)", 288, 30, 86, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_PzButton2 = GUICtrlCreateButton("����(A)", 13, 250, 59, 25)
Global $gu_PzButton3 = GUICtrlCreateButton("���", 264, 250, 59, 25)
Global $gu_PzButton4 = GUICtrlCreateButton("�˳�(X)", 328, 250, 59, 25)
GUISetState(@SW_SHOW)
 
_Main() ;��������ʼ
Exit
 
Func _Main()
        Local $ini = @ScriptDir & "\*.ini"
        GUICtrlSetData($gu_PzInput1, $ini)
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_PzButton1
                                
                                Local $path = FileSaveDialog("�������ļ�λ��", _
                                                @ScriptDir, "�����ļ�.ini (*.ini)|�����ļ�(*.*)", 1 + 8, _
                                                "*.ini", $gu_PzForm)
                                GUICtrlSetData($gu_PzInput1, $path)
                                $gc_IniFile = GUICtrlRead($gu_PzInput1)
                                If $gc_IniFile = "" Then
                                        MsgBox(16, "", "����, ��ȡINI�ļ�ʧ��.")
                                        Exit
                                EndIf
                                
                                Local $a_SectionName[101], $a_Pzname1 = "aa", $a_Pzname2 = "bb"
                                Local $I
                                For $I = 1 To 100 Step 1
                                        $a_SectionName[0] = UBound($a_SectionName) - 1
                                        $a_SectionName[$I] = "a" & $I
                                        IniWrite($gc_IniFile, $a_SectionName[$I], $a_Pzname1, 123)
                                        IniWrite($gc_IniFile, $a_SectionName[$I], $a_Pzname2, 1)
                                Next
                               MsgBox(0, "��ʾ:", "�ɹ�д�������ļ�" & @CRLF & "���ڵ�ǰ����Ŀ¼�鿴")                          
                        Case $gu_PzButton3
                                Local $gc_IniFile =GUICtrlRead($gu_PzInput1)
                                Local $sSection = IniReadSectionNames($gc_IniFile)
                                   If @error Then 
                                         MsgBox(0,"��ʾ","��ѡ��Ҫ������������鿴")
                                        ExitLoop
                                    EndIf
                                Local $ArraySecName[101][5], $I
                                For $I = 1 To 100
                                        
                                        Local $pz_array = IniReadSection($gc_IniFile, $sSection[$I])
                                        $ArraySecName[0][0] = "�ֶ���"
                                        $ArraySecName[0][1] = "��һ�ؼ���"
                                        $ArraySecName[0][2] = "��һ�ؼ��ֵ�ֵ"
                                        $ArraySecName[0][3] = "�ڶ��ؼ���"
                                        $ArraySecName[0][4] = "�ڶ��ؼ��ֵ�ֵ"
                                        
                                        $ArraySecName[$I][0] = $sSection[$I]
                                        $ArraySecName[$I][1] = $pz_array[1][0]
                                        $ArraySecName[$I][2] = $pz_array[1][1]
                                        $ArraySecName[$I][3] = $pz_array[2][0]
                                        $ArraySecName[$I][4] = $pz_array[2][1]
                                        ;If $ArraySecName[$I][4] = 1 Then
                                        ;MsgBox (0,"��ʾ","�ֶ�"& $sSection[$I]&"�йؽ���bbֵΪ1")
                                        ;EndIf
                                Next
                                _ArrayDisplay($ArraySecName, "$Array")
                                
                   Case $gu_PzButton2
                                MsgBox(0 + 64, $gc_formName, "���ߣ�#####")
                                
                   Case $gu_PzButton4
                                Exit
                EndSwitch
        WEnd
EndFunc   ;==>_Main
