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

_CreateUrlShortcut(@ScriptDir & "\AutoIt������̳.url", "http://www.autoitx.com/", 'C:\Icon.ico');�������λ�ã���ַ����վͼ�����غ�·��


Func _CreateUrlShortcut($_Name, $_Url, $_IcoPass)
        Local $aData[2][2]
        $aData[0][0] = 'IconFile'
        $aData[0][1] = $_IcoPass
        $aData[1][0] = 'IconIndex'
        $aData[1][1] = '0'
        
        Local $objShell = ObjCreate("WScript.Shell")

        If FileExists($_Name) Then FileDelete($_Name)
        Local $objShortCut = $objShell.CreateShortcut($_Name)

        $objShortCut.TargetPath = $_Url
        InetGet($_Url & '/favicon.ico', $_IcoPass)
        IniWriteSection($_Name, 'InternetShortcut', $aData, 0)
        $objShortCut.Save()
        
	If @OSVersion = "WIN_XP" Then
			Local $size = DllCall("User32.dll", "int", "GetSystemMetrics", "int", 11)
			RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0] - 1)
			DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
			RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0])
			DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
	Else
        ; ˢ��(Win7��Ч,XP��Ч)
        DllCall("shell32.dll", "ptr", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
	EndIf	
EndFunc   ;==>_CreateUrlShortcut



;~ Func RefreshIcon()
;~         Local $size = DllCall("User32.dll", "int", "GetSystemMetrics", "int", 11)
;~         RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0] - 1)
;~         DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
;~         RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0])
;~         DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
;~ EndFunc


;������벻���޸�
;~ $a = "http://www.baidu.com/" ;��������Ӹ�"/"
;~ $b = "�ٶ���ҳ"
;~ _UrlLink($a,$b)

;~ Func _UrlLink($UrlLink,$UrlName)
;~ DirCreate(@ScriptDir & "\ico")
;~ InetGet($UrlLink&"favicon.ico", @ScriptDir & "\ico\" & $UrlName & ".ico", 1)
;~ $file = FileOpen($UrlName & ".url", 1)
;~ FileWriteLine($file, "[DEFAULT]")
;~ FileWriteLine($file, "BASEURL=" & $UrlLink)
;~ FileWriteLine($file, "[InternetShortcut]")
;~ FileWriteLine($file, "URL=" & $UrlLink)
;~ FileWriteLine($file, "IconFile=" & @ScriptDir & "\ico\" & $UrlName & ".ico")
;~ FileWriteLine($file, "IconIndex=0")
;~ FileClose($file)
;~ EndFunc
