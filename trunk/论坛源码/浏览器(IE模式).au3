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

#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_outfile=00000.exe
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Include <INet.au3>
#Include <String.au3>
 
Global $oIE = ObjCreate("Shell.Explorer.2")
Global $ini = @ScriptDir & "\autoit.ini"
 
Global $read_height = IniRead($ini, "Display", "Height", "")
Global $read_width = IniRead($ini, "Display", "Width", "")
Global $read_homepage = IniRead($ini, "Settings", "Homepage", "")
Global $read_starthomepage = IniRead($ini, "Settings", "StartHomepage", "")
 
If $read_height = "" Then
    IniWrite($ini, "Display", "Height", "600")
    IniWrite($ini, "Display", "Width", "800")
    $read_height = 600
    $read_width = 800
EndIf
 
If $read_starthomepage = "" Then
    $read_starthomepage = "1"
    $read_homepage = "www.baidu.com"
EndIf
 
$iniread = IniRead($ini, "URL", "LAST URL", " ")
If $read_starthomepage = "0" Then $read_homepage = $iniread
 
 
$gui_main = GUICreate("", $read_width, $read_height + 20, -1, -1, 0x04000000 + 0x00CF0000)
 
$file_menu = GUICtrlCreateMenu("�ļ�")
$fm_newwind = GUICtrlCreateMenuItem("�´���", $file_menu)
$fm_sep = GUICtrlCreateMenuItem("", $file_menu)
$fm_open = GUICtrlCreateMenuItem("��", $file_menu)
$fm_sep = GUICtrlCreateMenuItem("", $file_menu)
$fm_print = GUICtrlCreateMenuItem("��ӡ", $file_menu)
$fm_sep = GUICtrlCreateMenuItem("", $file_menu)
$fm_savas = GUICtrlCreateMenuItem("����", $file_menu)
$fm_SaveSource = GUICtrlCreateMenuItem("���", $file_menu)
$fm_sep = GUICtrlCreateMenuItem("", $file_menu)
$fm_exit = GUICtrlCreateMenuItem("�˳�", $file_menu)
 
$view_menu = GUICtrlCreateMenu("�鿴")
$vm_status = GUICtrlCreateMenuItem("״̬��", $view_menu)
GUICtrlSetState(-1, 1)
 
$tool_menu = GUICtrlCreateMenu("����")
$tm_pref = GUICtrlCreateMenuItem("ƫ��", $tool_menu)
$tm_sep = GUICtrlCreateMenuItem("", $tool_menu)
 
$tm_sep = GUICtrlCreateMenuItem("", $tool_menu)
$tm_gu = GUICtrlCreateMenuItem("��ȡ��ǰ��ַ", $tool_menu)
 
$about_menu = GUICtrlCreateMenu("����")
$am_about = GUICtrlCreateMenuItem("����", $about_menu)
 
$gui_iewindow = GUICtrlCreateObj($oIE, 0, 0, $read_width, $read_height - 45)
GUICtrlSetResizing($gui_iewindow, 0x0001)
 
$address_bar_label = GUICtrlCreateLabel("�����ַ: ", 0, 562, 85, -1)
$address_bar_input = GUICtrlCreateInput($read_homepage, 76, 559, 200, -1)
$address_bar_go = GUICtrlCreateButton("����>>", 280, 557, 50, -1, 0x0001)
$address_bar_stop = GUICtrlCreateButton("ֹͣ", 330, 557, 50, -1)
$address_bar_back = GUICtrlCreateButton("����", 380, 557, 50, -1)
$address_bar_forward = GUICtrlCreateButton("ǰ��", 430, 557, 50, -1)
$address_bar_refresh = GUICtrlCreateButton("ˢ��", 480, 557, 50, -1)
$address_bar_home = GUICtrlCreateButton("��ҳ", 530, 557, 50, -1)
 
$status_bar = GUICtrlCreateLabel("����: " & $read_homepage & "...", 0, 584, $read_width, $read_height, BitOR(11, 0x1000))
 
GUISetState()
 
AnimateTitle($gui_main, "Tcfox - by 2008", 100)
$oIE.Navigate ($read_homepage)
 
$gui_pref = GUICreate("ƫ��", 298, 230, 359, 233)
$group1 = GUICtrlCreateGroup("����", 16, 16, 265, 170)
$label_home = GUICtrlCreateLabel("��ҳ:", 32, 40, 59, 17)
$input_add = GUICtrlCreateInput($read_homepage, 96, 40, 161, 21)
$label_start = GUICtrlCreateLabel("����:", 32, 80, 58, 17)
$combo_startup = GUICtrlCreateCombo("", 96, 80, 161, 25)
If $read_starthomepage = "0" Then
    GUICtrlSetData(-1, "������ҳ|��ʼ���ϴη���", "��ʷ����")
Else
    GUICtrlSetData(-1, "������ҳ|��ʼ���ϴη���", "������ҳ")
EndIf
#cs
    $pref_Status_Status = GUICtrlCreateLabel("Display Width", 32, 110, 58, 71)
    $pref_width_input = GUICtrlCreateInput($read_width, 80, 115, 58, 20)
    $pref_height_label = GUICtrlCreateLabel("Display Height", 32, 140, 58, 71)
    $pref_height_input = GUICtrlCreateInput($read_height, 80, 145, 58, 20)
#ce
$button_apply = GUICtrlCreateButton("Ӧ��", 120, 190, 75, 25, 0)
$button_close = GUICtrlCreateButton("�ر�", 208, 190, 75, 25, 0)
GUISetState(@SW_HIDE, $gui_pref)
 
While 1
    WinSetTitle($gui_main, "", "Tcfox - Created by 2008 " & $oIE.locationURL ())
   
    If $oIE.Busy () Then
        $url = $oIE.LocationURL ()
        _StatusChange("Loading: " & $url & "...")
    Else
        _StatusChange("Done.")
    EndIf
 
    $msg = GUIGetMsg(1)
    Switch $msg[0]
        Case - 3
            $update = $oIE.LocationURL ()
            IniWrite($ini, "URL", "LAST URL", $update)
            FileDelete(@TempDir & "\HelpFile.exe")
            Exit
            ;File Menu
        Case $fm_newwind
            Run("tcfox.exe")
        Case $fm_open
            Local $file = FileOpenDialog("ѡ���ļ�", @ScriptDir, "All Files (*.*)")
            If @error <> 1 Then
                _StatusChange("Loading: " & $file & "...")
                $oIE.Navigate ($file)
            EndIf
        Case $fm_print
            $oIE.document.parentwindow.Print ()
        Case $fm_savas
            $oIE.document.execCommand ("SaveAs")
        Case $fm_SaveSource
            $IE = _INetGetSource("" & $update & "")
            FileWrite(@DesktopDir & "\websource.html", $IE)
            MsgBox(64, "tcfox", "���浽���� websource.html")
        Case $fm_exit
            $update = $oIE.LocationURL ()
            IniWrite($ini, "URL", "LAST URL", $update)
            Exit
            ;View Menu
        Case $vm_status
            $size = WinGetPos("Tcfox")
            If BitAND(GUICtrlRead($vm_status), 1) = 4 Then
                GUICtrlSetState($vm_status, 4)
                GUICtrlSetState($status_bar, 32)
                WinMove("Tcfox", "", $size[0], $size[1], $size[2], $size[3] - 15)
            Else
                GUICtrlSetState($vm_status, 1)
                GUICtrlSetState($status_bar, 16)
                WinMove("Tcfox ", "", $size[0], $size[1], $size[2], $size[3] + 15)
            EndIf
        Case $tm_pref
            GUISetState(@SW_SHOW, $gui_pref)
        Case $tm_gu
            $update = $oIE.LocationURL ()
            MsgBox(0, "Tcfox", "URL:" & $update & "")
            ClipPut($update)
        Case $button_close
            GUISetState(@SW_HIDE, $gui_pref)
        Case $button_apply
            ;$getwidth = GUICtrlRead($pref_width_input)
            ;$getheight = GUICtrlRead($pref_height_input)
            ;IniWrite($ini, "Display", "Width", $getwidth)
            ;IniWrite($ini, "Display", "Height", $getheight)
            $gethome = GUICtrlRead($input_add)
            $getstarthome = GUICtrlRead($combo_startup)
            If $getstarthome = "Start with Homepage" Then
                IniWrite($ini, "Settings", "StartHomepage", "1")
            Else
                IniWrite($ini, "Settings", "StartHomepage", "0")
            EndIf
            IniWrite($ini, "Settings", "Homepage", $gethome)
            GUISetState(@SW_HIDE, $gui_pref)
            _StatusChange("Configuration written successfully.")
            sleep(1000)
            ;About Menu
        Case $am_about
            MsgBox(64,"About","Product name:    Tcfox ")
            ;Address Bar Buttons
        Case $address_bar_go
            $addy = GUICtrlRead($address_bar_input)
            _StatusChange("Loading: " & $addy & "...")
            $oIE.Navigate ($addy)
            _StatusChange("Done.")
        Case $address_bar_stop
            $oIE.Stop ()
        Case $address_bar_back
            $oIE.GoBack ()
        Case $address_bar_forward
            $oIE.GoForward ()
        Case $address_bar_refresh
            $oIE.document.execCommand ("Refresh")
        Case $address_bar_home
            $read_homepageini = IniRead($ini, "Settings", "Homepage", "")
            $oIE.Navigate ($read_homepageini)
            GUICtrlSetData($address_bar_input, $read_homepage)
    EndSwitch
WEnd
 
Func _StatusChange($message)
    GUICtrlSetData($status_bar, $message)
EndFunc   ;==>_StatusChange
 
 
 
 
Func AnimateTitle($hGUI, $sTitle, $iBuf)
    $sTitle = StringSplit($sTitle, "")
    For $i = $iBuf To 0 Step - 1
        WinSetTitle($hGUI, "", _StringRepeat(" ", $i) & $sTitle[1])
    Next
    Local $s
    For $i = 1 To $sTitle[0]
        $s &= $sTitle[$i]
        WinSetTitle($hGUI, "", $s)
        Sleep(5)
    Next
EndFunc   ;==>AnimateTitle