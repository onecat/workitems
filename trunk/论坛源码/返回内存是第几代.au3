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

; #FUNCTION# ====================================================================================================================
; Name ..........: _GetMemType
; Description ...: Get mem Type
; Syntax ........: _GetMemType()
; Parameters ....: None
; Return values .: None
; Author ........: ����ӣ��
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: MsgBox(0,'',_GetMemType())
; ===============================================================================================================================
MsgBox(0,'',_GetMemType())
Func _GetMemType()
        $ObjMem = ObjGet('winmgmts:\\' & @ComputerName)
        $ObjMemdata = $ObjMem.InstancesOf("Win32_PhysicalMemory")
        Local $Speed, $DDRType
        For $t In $ObjMemdata
                If $t.Speed > 0 Then
                        $Speed = $t.Speed
                        ExitLoop
                EndIf
        Next
        Switch $Speed
                Case $Speed <= 400
                        $DDRType = 'DDR1'
                Case $Speed > 400 And $Speed <= 800
                        $DDRType = 'DDR2'
                Case $Speed > 800
                        $DDRType = 'DDR3'
        EndSwitch
        Return $DDRType
EndFunc   ;==>_GetMemType
