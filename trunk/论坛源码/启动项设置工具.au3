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

#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiListView.au3>
#include <ListViewConstants.au3>
 
$Version = 'AutoStartSettings'
If WinExists($Version) Then Exit
AutoItWinSetTitle($Version)
 
Global $Dll
Opt("OnExitFunc","Quit")
FileInstall("SkinCrafterDll.dll", @TempDir&"SkinCrafterDll.dll", 1)
FileInstall("vista.skf", @TempDir&"vista.skf", 1)
$MainWindow = GUICreate("AutoStart Settings", 610, 303)
_SkinGUI(@TempDir&"SkinCrafterDll.dll", @TempDir&"vista.skf", $MainWindow)
GUICtrlCreateGroup("�������б�", 2, 8, 321, 273)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$List = GUICtrlCreateListView("λ��   | ����   | ·��  ",  4, 30, 313, 248)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("���������", 326, 8, 282, 169)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
GUICtrlCreateLabel("����λ��:", 342, 48, 55, 17)
GUICtrlCreateLabel("����������:", 342, 88, 67, 17)
GUICtrlCreateLabel("������·��:", 342, 128, 67, 17)
$Choose = GUICtrlCreateCombo("MACHINE �� RUN", 416, 44, 185, 25)
GUICtrlSetColor(-1, 0x808080)
GUICtrlSetData(-1,"USER    �� RUN") 
$Name = GUICtrlCreateInput("Defalut", 416, 85, 183, 21)
GUICtrlSetTip(-1,"������Ҫ�����������������")
GUICtrlSetColor(-1, 0x808080)
$Path = GUICtrlCreateInput("��������ťѡ���ļ�...", 416, 125, 137, 21)
GUICtrlSetTip(-1,"������Ҫ�����������������·�����ļ���")
GUICtrlSetColor(-1, 0x808080)
$Browse = GUICtrlCreateButton("���", 558, 125, 41, 21, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Status = GUICtrlCreateLabel("", 0, 285, 320, 16, $SS_SUNKEN)
$Delete = GUICtrlCreateButton("ɾ��(&D)", 330, 196, 121, 33, 0)
GUICtrlSetTip(-1, "ɾ��ѡ�е�������")
$Add = GUICtrlCreateButton("���(&C)", 480, 196, 121, 33, 0)
GUICtrlSetTip(-1, "������������ƺ�·�����������")
$Refresh = GUICtrlCreateButton("ˢ��(&R)", 330, 240, 121, 33, 0)
GUICtrlSetTip(-1, "ˢ���������б�")
$About = GUICtrlCreateButton("����(&A)", 480, 240, 121, 33, 0)
GUICtrlSetTip(-1, "����...")
$Tips = GUICtrlCreateLabel("��ʾ:����ԺͿ�ʼ�˵�����Ŀ¼Ҳ�����ÿ���������", 325, 288, 287, 16)
GUICtrlSetState($Tips, $GUI_DISABLE)
GUISetState(@SW_SHOW)
Read()
 
While 1
        $Msg = GUIGetMsg()
        Select
                Case $Msg = $GUI_EVENT_CLOSE
                        Exit
                Case $Msg = $Browse
                        $PathValue = FileOpenDialog("��ѡ����Ҫ�����������ļ�...", @ScriptDir, "��ִ���ļ�(*.exe;*.bat;*.vbs)")
                        GUICtrlSetData($Path, $PathValue)               
                Case $Msg = $Add
                        $Data = GUICtrlRead($Choose)
                        Select
                                Case GUICtrlRead($Path) = "" Or GUICtrlRead($Path) = "��������ťѡ���ļ�..." 
                                 MsgBox (0, "��ʾ", "��������ȷ��·�����ļ��������ԣ�")
                            Case $Data = "MACHINE �� RUN" 
                                 RegWrite("HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", GUICtrlRead($Name), "REG_SZ", GUICtrlRead($Path))
                                 MsgBox(0, "��ʾ", "���óɹ���������Ч��")
                                Case $Data = "USER    �� RUN"
                                         RegWrite("HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", GUICtrlRead($Name), "REG_SZ", GUICtrlRead($Path))
                                 MsgBox(0, "��ʾ", "���óɹ���������Ч��")
                        EndSelect
                Case $Msg = $Refresh
                        ReMain()
                Case $Msg = $About
                        About()
                Case $Msg = $Delete
                        If GUICtrlRead($List) = 0 Then 
                           MsgBox(0, "��ʾ", "��ѡ������Ҫɾ������Ŀ�ٽ��в�����")
                    ElseIf GUICtrlRead($List) <> 0 Then
                            $answer = MsgBox(4, "��ʾ", "ɾ���󽫲��ɻָ���ֻ���ֶ���ӣ�ȷ��ɾ��ô��")
                            If $answer = 7 Then 
                              Remain()
                            Else   
                                    If StringLeft(GUICtrlRead(GUICtrlRead($List)),4) = "User" Then 
                                                $result = StringTrimLeft(GUICtrlRead(GUICtrlRead($List)), 9)
                                                $x = StringInStr ($result, "|")
                                                $y = StringLeft($result, $x - 1)
                                                RegDelete("HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", $y)
                        GUICtrlDelete(GUICtrlRead($List))
                                        MsgBox(0, "��ʾ", "ɾ���ɹ���������Ч��")
                                Else
                        $result = StringTrimLeft(GUICtrlRead(GUICtrlRead($List)), 9)
                                                $x = StringInStr ($result, "|")
                                                $y = StringLeft($result, $x - 1)
                        RegDelete("HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", $y)
                        GUICtrlDelete(GUICtrlRead($List))
                                        MsgBox(0, "��ʾ", "ɾ���ɹ���������Ч��")
                                    EndIf
                EndIf
                        EndIf
        EndSelect
        _ReduceMemory(@AutoItPID)       
WEnd
 
Func Read()
        
        $Sum = 0
        $i = 1
        While 1
            $key=RegEnumVal('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$i)
            If @error <> 0 then ExitLoop
            GUICtrlCreateListViewItem('User    |'& $key & '|' & RegRead('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$key),$List)
            $i=$i+1
                $Sum = $Sum + 1
        WEnd
        
        $i = 1
        While 1
            $key=RegEnumVal('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$i)
            If @error <> 0 then ExitLoop
            GUICtrlCreateListViewItem('Machine |'& $key & '|' & RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$key),$List)
            $i=$i+1
                $Sum = $Sum + 1
        WEnd
 
        GUICtrlSetData($Status, ' ��ȡ���������! ��' & $Sum & '����Ŀ...')
EndFunc
 
Func ReMain()
        _GUICtrlListView_DeleteAllItems($List)
        Read()
EndFunc
 
Func About()
        GUISetState(@SW_DISABLE,$Mainwindow)
        $Window = GUICreate("����...", 235, 240)
        GUICtrlCreateIcon (@AutoItExe,-1,22,40)
        GUICtrlCreateGroup("", 8, 4, 220, 195)
        $Label1 = GUICtrlCreateLabel("���������ù��� V1.0", 70, 40, 142, 17, $WS_GROUP)
        GUICtrlSetFont(-1, 10, 800, 0, "����")
        GUICtrlCreateLabel("��ͳ.��", 70, 80, 100, 17)
        $Mail = GUICtrlCreateLabel("5i3p@sina.com", 70, 102, 100, 17)
        GuiCtrlSetCursor($Mail,0)
    GUICtrlSetColor(-1, 0x0000FF)
        GUICtrlCreateLabel("��Ȩ���У����治����", 20, 144, 124, 17, $WS_GROUP)
        GUICtrlCreateLabel("��ӭ����QQȺ227200 (AU3��������)", 20, 168, 194, 17)
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        $OK = GUICtrlCreateButton("ȷ��(&O)", 90, 208, 75, 25)
        GUISetState(@SW_SHOW)
 
        While 1
                Switch GUIGetMsg()
                        Case $GUI_EVENT_CLOSE
                                        GUISetState(@SW_ENABLE,$MainWindow)
                                        GUIDelete($Window)
                                        ExitLoop
                        Case $OK
                                        GUISetState(@SW_ENABLE,$MainWindow)
                                        GUIDelete($Window)
                                        ExitLoop
                        Case $Mail
                                        Run(@ComSpec & " /c " & 'start mailto:5i3p@sina.com?subject=Something', "", @SW_HIDE)
                EndSwitch
        WEnd
EndFunc
 
Func _SkinGUI($SkincrafterDll, $SkincrafterSkin, $Handle) 
   $Dll = DllOpen($SkincrafterDll) 
   DllCall($Dll, "int:cdecl", "InitLicenKeys", "wstr", "1", "wstr", "", "wstr", "1@1.com", "wstr", "1") 
   DllCall($Dll, "int:cdecl", "InitDecoration", "int", 1) 
   DllCall($Dll, "int:cdecl", "LoadSkinFromFile", "wstr", $SkincrafterSkin) 
   DllCall($Dll, "int:cdecl", "DecorateAs", "int", $Handle, "int", 25) 
   DllCall($Dll, "int:cdecl", "ApplySkin") 
EndFunc 
 
Func Quit()
    GUISetState(@SW_HIDE)
    DllCall($Dll, "int:cdecl", "DeInitDecoration")
    DllCall($Dll, "int:cdecl", "RemoveSkin")
    DllClose($Dll)
        FileDelete(@TempDir&"SkinCrafterDll.dll") 
        FileDelete(@TempDir&"vista.skf") 
        FileDelete(@TempDir&"eyes.jpg") 
    Exit
EndFunc
 
Func _ReduceMemory($i_PID = -1)
        If $i_PID <> -1 Then
                Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
                DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
        Else
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
        EndIf
 
        Return $ai_Return[0]
EndFunc
