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
;
InstallFonts('F:\tools\FONT\JQ20.TTF', "���ŷ�κ��")

Func InstallFonts($sSourceFile, $sFontDescription)
        Local Const $HWND_BROADCAST = 0xFFFF
        Local Const $WM_FONTCHANGE = 0x1D

        Local $sFontFileName = StringRegExpReplace($sSourceFile, '^.*\\', '')
        If Not FileCopy($sSourceFile, @WindowsDir & "\fonts\" & $sFontFileName, 1) Then Return SetError(1, 0, 0)

        Local $aRet = DllCall("gdi32.dll", "Int", "AddFontResource", "str", @WindowsDir & "\fonts\" & $sFontFileName)
        If IsArray($aRet) And $aRet[0] > 0 Then
                RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts", $sFontDescription, "REG_SZ", $sFontFileName)
                DllCall("user32.dll", "Int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_FONTCHANGE, "int", 0, "int", 0)
                Return 1
        EndIf
        Return SetError(2, 0, 0)
EndFunc   ;==>InstallFonts