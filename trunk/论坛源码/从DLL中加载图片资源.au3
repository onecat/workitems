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

;~ By Crossdoor
;~ ��DLL�ļ��м���ͼƬ��ͼƬ�ؼ�
;~ _SetBitmap(DLL����, ͼƬ���, �ؼ����)
;~ �ɹ�����1
;~ ʾ����
;~ $pic = GUICtrlCreatePic("", 0, 0, 640, 480, 0x04000000)
;~ _SetBitmap('Res.dll', '#143', $pic)
Func _SetBitmap($sDll, $sBitmap, $hwnd)
        $LoadLibraryA = DllCall("Kernel32.dll", "hwnd", "LoadLibraryA", "str", $sDll)
        If @error Then Return SetError(@error, 0, 0)
        $LoadBitmap = DllCall("User32.dll", "hwnd", "LoadBitmap", "hwnd", $LoadLibraryA[0], "str", $sBitmap)
        If @error Then Return SetError(@error, 0, -1)
        DllCall("user32.dll", "lparam", "SendMessage", "hwnd", GUICtrlGetHandle($hwnd), "int", 0x0172, "wparam", 0, "lparam", $LoadBitmap[0])
        If @error Then Return SetError(@error, @extended, "")
        DllCall("Kernel32.dll", "hwnd", "FreeLibrary", "hwnd", $LoadLibraryA[0])
        Return 1
EndFunc