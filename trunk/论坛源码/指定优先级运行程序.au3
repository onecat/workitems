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

_Specify_Priority_Run("C:\Program Files\CCleaner\CCleaner.exe", 2);���ȼ� = ��
_Specify_Priority_Run("C:\Program Files\CCleaner\CCleaner.exe");���ȼ� = ��ͨ
Func _Specify_Priority_Run($Process, $Priority = 0)
        If StringRight($Process, 4) = '.exe' Then
                If $Priority = 2 Then
                        $Priority = 'High'
                ElseIf $Priority = 3 Then
                        $Priority = 'Realtime'
                ElseIf $Priority = 1 Then
                        $Priority = 'AboveNormal'
                ElseIf $Priority = 0 Then
                        $Priority = 'Normal'
                ElseIf $Priority = -1 Then
                        $Priority = 'BelowNormal'
                ElseIf $Priority = -2 Then
                        $Priority = 'Low'
                EndIf
                RunWait(@ComSpec & ' /c START /' & $Priority & ' "" "' & $Process & '"', '', @SW_HIDE)
        Else
                MsgBox(16, 'Specify Priority Run', 'Not supported')
        EndIf
EndFunc   ;==>_Specify_Priority_Run

