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

;;;RunCMD_echoRT.au3
 
#include <Constants.au3>
MsgBox(0,"ʾ��1",_RunEcho("ipconfig"))
;MsgBox(0,"ʾ��2",_RunEcho("dir","/o"))
;�����л��Է���
;       ����CMD����ִ�к����Ϣ
;$var = ����Ĳ���
;$cmd = ִ�е����� 
;by:��ɫ�� 2014.5.2
 Func _RunEcho($cmd,$var = "")  
        Local $foo = Run(@ComSpec & " /c " & $cmd & "  " & $var,  _
                        @ScriptDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
        Local $sDat
        While 1
                $sDat1 = StdoutRead($foo) ;��ȡ������
                If @error Then ExitLoop
                $sDat &= $sDat1
        WEnd
        Return $sDat
EndFunc   ;==>_RunEcho