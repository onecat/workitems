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

;~ #include <GUIConstantsEx.au3>
;~ #include <WindowsConstants.au3>

;~ GUICreate("Form1", 600, 450)
;~ $Checkbox1 = GUICtrlCreateCheckbox("��ѡ�� - 1", 40, 30, 97, 17)
;~ $Checkbox2 = GUICtrlCreateCheckbox("��ѡ�� - 2", 160, 30, 97, 17)
;~ $Checkbox3 = GUICtrlCreateCheckbox("��ѡ�� - 3", 280, 30, 97, 17)
;~ $Checkbox4 = GUICtrlCreateCheckbox("��ѡ�� - 4", 400, 30, 97, 17)
;~ $Checkbox5 = GUICtrlCreateCheckbox("��ѡ�� - 5", 40, 80, 97, 17)
;~ $Checkbox6 = GUICtrlCreateCheckbox("��ѡ�� - 6", 160, 80, 97, 17)
;~ $Checkbox7 = GUICtrlCreateCheckbox("��ѡ�� - 7", 280, 80, 97, 17)
;~ $Checkbox8 = GUICtrlCreateCheckbox("��ѡ�� - 8", 400, 80, 97, 17)
;~ $Checkbox9 = GUICtrlCreateCheckbox("��ѡ�� - 9", 40, 130, 97, 17)
;~ $Checkbox10 = GUICtrlCreateCheckbox("��ѡ�� - 10", 160, 130, 97, 17)
;~ $Checkbox11 = GUICtrlCreateCheckbox("��ѡ�� - 11", 280, 130, 97, 17)
;~ $Checkbox12 = GUICtrlCreateCheckbox("��ѡ�� - 12", 400, 130, 97, 17)
;~ GUISetState()

;~ While 1
;~         $nMsg = GUIGetMsg()
;~         Switch $nMsg
;~                 Case - 3
;~                         Exit
;~                 Case $Checkbox1 To $Checkbox12
;~                         $nText = ''
;~                         For $i = $Checkbox1 To $Checkbox12
;~                                 If BitAND(GUICtrlRead($i), $GUI_CHECKED) Then $nText &= '��ѡ�� - ' & $i - 2 & ' ����ѡ' & @CRLF
;~                         Next
;~                         MsgBox(0, '��ѡ��Ŀ', $nText)
;~         EndSwitch
;~ WEnd


GUICreate("Form1", 600, 450)
$Checkbox1 = GUICtrlCreateCheckbox("��ѡ�� - 1", 40, 30, 97, 17)
$Checkbox2 = GUICtrlCreateCheckbox("��ѡ�� - 2", 160, 30, 97, 17)
$Checkbox3 = GUICtrlCreateCheckbox("��ѡ�� - 3", 280, 30, 97, 17)
$Checkbox4 = GUICtrlCreateCheckbox("��ѡ�� - 4", 400, 30, 97, 17)
$Checkbox5 = GUICtrlCreateCheckbox("��ѡ�� - 5", 40, 80, 97, 17)
$Checkbox6 = GUICtrlCreateCheckbox("��ѡ�� - 6", 160, 80, 97, 17)
$Checkbox7 = GUICtrlCreateCheckbox("��ѡ�� - 7", 280, 80, 97, 17)
$Checkbox8 = GUICtrlCreateCheckbox("��ѡ�� - 8", 400, 80, 97, 17)
$Checkbox9 = GUICtrlCreateCheckbox("��ѡ�� - 9", 40, 130, 97, 17)
$Checkbox10 = GUICtrlCreateCheckbox("��ѡ�� - 10", 160, 130, 97, 17)
$Checkbox11 = GUICtrlCreateCheckbox("��ѡ�� - 11", 280, 130, 97, 17)
$Checkbox12 = GUICtrlCreateCheckbox("��ѡ�� - 12", 400, 130, 97, 17)

$b = GUICtrlCreateButton('�������', 130, 200, 150, 25)
GUISetState()
$sl = 0
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
                Case $Checkbox1 To $Checkbox12
                        If GUICtrlRead($nMsg) = 1 Then $sl += 1
                        If GUICtrlRead($nMsg) = 4 Then $sl -= 1
                Case $b
                        MsgBox(0, 0, $sl)
        EndSwitch
WEnd