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
#EndRegion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <GUIConstantsEx.au3>
Opt("GUIOnEventMode", 1) ; �л�Ϊ OnEvent ģʽ
Opt("TrayMenuMode", 1)
Select
	Case @OSBuild = 2600
		$mainwindow = GUICreate("WinXP����IEͼ������", 340, 120) ;�������ڲ����ش��ھ��
		GUICtrlCreateLabel("WinXP����IEͼ�ꡰ��ʾ/���ء����ù���", 65, 15)
		$showbutton = GUICtrlCreateButton("��ʾWinXP����IEͼ��", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("����WinXP����IEͼ��", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "XHideButton")
		GUICtrlSetOnEvent($showbutton, "XShowButton")
	Case @OSBuild = 7601
		$mainwindow = GUICreate("WIN7����IEͼ������", 340, 120) ;�������ڲ����ش��ھ��
		GUICtrlCreateLabel("WIN7����IEͼ�ꡰ�ָ�/ɾ�������ù���", 65, 15)
		$showbutton = GUICtrlCreateButton("�ָ�WIN7����IEͼ��", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("ɾ��WIN7����IEͼ��", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "HideButton")
		GUICtrlSetOnEvent($showbutton, "ShowButton")
	Case @OSBuild > 2600 And @OSBuild < 7601 Or @OSBuild < 2600 Or @OSBuild > 7601
		$mainwindow = GUICreate("����IEͼ������", 340, 120) ; �������ڲ����ش��ھ��
		GUICtrlCreateLabel("����IEͼ�ꡰ�ָ�/ɾ�������ù���", 65, 15)
		$showbutton = GUICtrlCreateButton("�ָ�����IEͼ��", 20, 40, 140, 60)
		$hidebutton = GUICtrlCreateButton("ɾ������IEͼ��", 180, 40, 140, 60)
		GUICtrlSetOnEvent($hidebutton, "HideButton")
		GUICtrlSetOnEvent($showbutton, "ShowButton")
EndSelect
		GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked") ;���ô��ڹر��¼�Show And hide
		GUISetState(@SW_SHOW)
While 1
	Sleep(1000) ; �����κ���
WEnd
;### Tidy Error: Func statement without parentheses ().
Func ShowButton()
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "", "REG_SZ", "Internet Explorer")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "InfoTip", "REG_SZ", "@C:\Windows\system32\ieframe.dll,-881")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}", "LocalizedString", "REG_SZ", "@C:\WINDOWS\system32\ieframe.dll.mui,-880")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\DefaultIcon", "", "REG_SZ", "C:\Windows\system32\ieframe.dll,-190")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\InProcServer32", "", "REG_SZ", "C:\Windows\system32\ieframe.dll")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\InProcServer32", "ThreadingModel", "REG_SZ", "Apartment")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell", "", "REG_SZ", "OpenHomePage")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\NoAddOns", "", "REG_SZ", "��û�м���������������(&N)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\NoAddOns\Command", "", "REG_SZ", "C:\ProgramFiles\Internet Explorer\iexplore.exeabout : NoAdd - ons")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\OpenHomePage", "", "REG_SZ", "����ҳ(&H)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\OpenHomePage\Command", "", "REG_SZ", "C:\ProgramFiles\Internet Explorer\iexplore.exe")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties", "", "REG_SZ", "����(&R)")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties", "Position", "REG_SZ", "bottom")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\shell\Properties\command", "", "REG_SZ", "Rundll32.exe Shell32.dll, Control_RunDLLInetcpl.cpl")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\ContextMenuHandlers", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\ContextMenuHandlers\ieframe", "", "REG_SZ", "{871C5380-42A0-1069-A2EA-08002B30309D}")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\Shellex\MayChangeDefaultMenu", "", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "", "REG_SZ", "C:\Windows\system32\ieframe.dll,-190")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideAsDeletePerUser", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideFolderVerbs", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "WantsParseDisplayName", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "HideOnDesktopPerUser", "REG_SZ", "")
RegWrite("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}\ShellFolder", "Attributes", "REG_DWORD", "0x00000030")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30308D}", "", "REG_SZ", "")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30308D}", "REG_DWORD", "0x00000000")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func HideButton()
RegDelete("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30308D}")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30308D}")
RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30308D}")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000001")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func XShowButton()
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000000")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
;### Tidy Error: Func statement without parentheses ().
Func XHideButton()
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel", "{871C5380-42A0-1069-A2EA-08002B30309D}", "REG_DWORD", "0x00000001")
DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
;### Tidy Error: "endfunc" is likely missing it's opening statement. next line creates a negative tablevel.
EndFunc   ;==>
Func CLOSEClicked()
	Exit
EndFunc   ;==>CLOSEClicked
