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
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $gu_Form1 = GUICreate('�����ļ�', 382, 156, -1, -1)
Global $gu_Label1 = GUICtrlCreateLabel('Դ�ļ�', 24, 24 + 2, 40, 17)
Global $gu_Label2 = GUICtrlCreateLabel('Ŀ���ļ�', 24, 48 + 2, 52, 17)
Global $gu_Input1 = GUICtrlCreateInput('', 80, 24, 225, 21)
Global $gu_Input2 = GUICtrlCreateInput('', 80, 48, 225, 21)
Global $gu_Button1 = GUICtrlCreateButton('..', 312, 24 - 2, 33, 25)
Global $gu_Button2 = GUICtrlCreateButton('..', 312, 48 - 2, 33, 25)
Global $gu_Button3 = GUICtrlCreateButton('����', 288, 88, 57, 33)

_Main()
Exit

Func _Main()
        GUISetState(@SW_SHOW)

        Local $ScrFile, $DestFile
        Local $r

        Local $nMsg
        While 1
                $nMsg = GUIGetMsg()
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
                        Case $gu_Button1
                                $r = FileOpenDialog('Դ�ļ�', '', '�����ļ� (*.*)')
                                If $r <> '' And FileExists($r) And $r <> GUICtrlRead($gu_Input1) Then
                                        $ScrFile = $r
                                        GUICtrlSetData($gu_Input1, $ScrFile)
                                EndIf
                        Case $gu_Button2
                                $r = FileSaveDialog('Ŀ���ļ�', '', '�����ļ� (*.*)', 16)
                                If $r <> '' And $r <> GUICtrlRead($gu_Input2) Then
                                        $DestFile = $r
                                        GUICtrlSetData($gu_Input2, $DestFile)
                                EndIf
                        Case $gu_Button3
                                If $ScrFile <> '' And $DestFile <> '' Then
                                        TrayTip('����', '���ڸ���, ���Ժ�...', 0, 1)
                                        FileCopy($ScrFile, $DestFile)
                                        TrayTip('����', '��ɣ�', 3, 1)
                                EndIf
                EndSwitch
        WEnd

EndFunc   ;==>_Main
