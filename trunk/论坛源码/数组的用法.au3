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
#EndRegion ACNԤ����������(���ò���)
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
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 261, 800, 192, 124)
Local $Input[10], $aInputs[10], $str
For $i = 0 To UBound($Input) - 1
        $Input[$i] = GUICtrlCreateInput("", 8, 8 + $i * 32, 121, 21)
Next
$Button1 = GUICtrlCreateButton("����", 152, 16, 75, 25)
$Button2 = GUICtrlCreateButton("��ʾ", 152, 56, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        For $i = 0 To UBound($Input) - 1
                                $aInputs[$i] = GUICtrlRead($Input[$i])
							  MsgBox(0, 0, $aInputs[$i])
                        Next
                        MsgBox(0, 0, "�������")
                Case $Button2
                        MsgBox(0, 0, vv())
        EndSwitch
WEnd


Func vv()
	       $str = ""
          For $i = 0 To UBound($Input) - 1
				 $aInputs[$i] = GUICtrlRead($Input[$i])
                $str &= "Input" & $i + 1 & "������Ϊ:" & $aInputs[$i] & @CRLF
		Next
             ;MsgBox(0, 0, $str)
			 Return $str
EndFunc	