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

$title = 'C:\sss' ;ָ��һ�������ڵ�·�������ԣ��������϶��ᵯ��һ������
_WinAdlib($title, 'ȷ��', 'test') ;�����ڵ���֮ǰ

ShellExecute($title) ;���ᵯ��������Ϣ��
;Msgbox(64, 'ok', '�ű�������(��������)')

Func test()
        Send('{Enter}')
        WinClose($title, 'ȷ��')
EndFunc   ;==>test



; ������:_WinAdlib;=======================================================================
; ˵��:���ڵ�������ʱִ��ĳ������
; �﷨:��_WinAdlib('���ڱ���', '�����ı�', '������'[, '��ʱ'])
; ����ֵ:��
;====================================================================================start
Func _WinAdlib($title, $text, $Func, $timeout = 10000)
        Global $__title = $title, $__text = $text, $__Func = $Func, $__timeouts, $__timeout = $timeout
        Global $__Timer = DllCallbackRegister('__Timer', 'int', 'hwnd;uint;uint;dword')
        Global $__TimerDLL = DllCall('user32.dll', 'uint', 'SetTimer', 'hwnd', 0, 'uint', _
                        0, 'int', 100, 'ptr', DllCallbackGetPtr($__Timer))
EndFunc   ;==>_WinAdlib
Func __Timer($hwnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $__TimerDLL[0] Then
                If WinActive($__title, $__text) Then
                        ;��������ѷǼ��ʽ������Ӧʹ��WinExists()
                        DllCallbackFree($__Timer)
                        Call($__Func)
                Else
                        $__timeouts += 100
                        If $__timeouts >= $__timeout Then
                                DllCallbackFree($__Timer)
                        EndIf
                EndIf
        EndIf
EndFunc   ;==>__Timer