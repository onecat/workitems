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

#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
Global $Debug_CB
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>
#include <Guiedit.au3>
 
Opt('MustDeclareVars', 1)
 
$Debug_CB = False
 
_Main()
 
Func _Main()
        Local $tInfo, $hCombo, $hEdit
 
        ; Create GUI
        GUICreate("ComboBox Get ComboBox Info", 400, 296)
        $hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
        GUISetState()
 
        ; Add files
        _GUICtrlComboBox_BeginUpdate($hCombo)
        _GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
        _GUICtrlComboBox_EndUpdate($hCombo)
 
        If _GUICtrlComboBox_GetComboBoxInfo($hCombo, $tInfo) Then
                $hEdit = DllStructGetData($tInfo, "hEdit")
                _GUICtrlEdit_SetReadOnly($hEdit, True)
        EndIf
 
        ; Loop until user exits
        Do
        Until GUIGetMsg() = $GUI_EVENT_CLOSE
        GUIDelete()
EndFunc   ;==>_Main