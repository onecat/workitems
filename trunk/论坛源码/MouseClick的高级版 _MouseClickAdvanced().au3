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

_MouseClickAdvanced("left", @DesktopWidth - 47, @DesktopHeight - 15)
; @DesktopWidth - 47 ʹ�����ַ�ʽ�����ĵ�����Ҳ����ʹ��.
If @error Then
        ConsoleWrite('�ɹ���')
Else
        ConsoleWrite('ʧ�ܣ�')
EndIf

; _MouseClickAdvanced
; #FUNCTION# ===================================================================
; �������� ...........: _MouseClickAdvanced()
; ���� ...............: ִ�����������, ִ�к������ص�ԭλ.
; �﷨ ...............:  _MouseClickAdvanced("��ť" [, X����, Y���� [, ������� [, �ٶ� ]]])
;                     : ��ť ���ڵ�������İ�ť:
;                     : "left"(���)��"right"(�Ҽ�)��"middle"(�м�)��
;                     : "main"(����)��"menu"(�˵���)��
;                     : "primary"(��Ҫ��ť)��"secondary"(��Ҫ��ť).
;
; ��ѡ���� ...........:X����,Y���� [��ѡ����] Ŀ�� X/Y ������ֵ .�����߶����գ���ʹ�õ�ǰλ�� (Ĭ��).
;                     :������� [��ѡ����] ��갴ť����Ĵ���. Default(Ĭ��) = 1.
;                     :�ٶ� [��ѡ����] ����ƶ��ٶȣ�������ֵ��Χ�� 1(���)�� 100(����)֮��.
;                     :�������ٶ�Ϊ 0, �������ƶ���굽ָ��λ��. Default(Ĭ��) = 0.
;
; ����ֵ .............: �ɹ�: ���� @error Ϊ 1, ʧ��: ���� @error Ϊ 0
;
; ����................: lixiaolong - [url]http://www.autoitx.com/[/url]
;===============================================================================
 
Func _MouseClickAdvanced($Key, $x = 0, $y = 0, $Clicks = 1, $Speed = 0)
        Local $pos = MouseGetPos()
        If $x >= 0 And $x <= @DesktopWidth And _
                        $y >= 0 And $y <= @DesktopHeight And _
                        $Clicks > 0 And $Speed <= 100 Then
                Local $error = MouseClick($Key, $x, $y, $Clicks, $Speed)
                MouseMove($pos[0], $pos[1], 0)
                SetError($error)
        Else
                SetError(0)
        EndIf
EndFunc   ;==>_MouseClickAdvanced
