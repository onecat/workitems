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
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Dim $SliderAlpha, $aForm1
Opt("GUICloseOnESC", 0)
FileInstall("WinLockDll.dll", @TempDir & "\WinLockDll.dll")
$mm = RegRead("HKLM\Software\pclock", "password")
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("�һ��� 2.0", 338, 147, -1, -1)
GUISetBkColor(0xD8E4F8)
$Group1 = GUICtrlCreateGroup("", 8, 0, 321, 137)
$Pic1 = GUICtrlCreatePic(@TempDir & "\logo.jpg", 16, 16, 108, 108, 0, BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE, $GUI_WS_EX_PARENTDRAG))
$Label1 = GUICtrlCreateLabel("�������룺", 144, 24, 64, 17)
$Label2 = GUICtrlCreateLabel("ȷ�����룺", 144, 64, 64, 17)
$Input1 = GUICtrlCreateInput("", 208, 20, 105, 21, $ES_PASSWORD, BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
$Input2 = GUICtrlCreateInput("", 208, 60, 105, 21, $ES_PASSWORD, BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
$Button1 = GUICtrlCreateButton("��ʼ�һ�", 144, 96, 67, 25, $WS_GROUP, $WS_EX_STATICEDGE)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("��ȫ�˳�", 248, 96, 67, 25, $WS_GROUP, $WS_EX_STATICEDGE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
Global $Pic1 = GUICtrlCreatePic("C:\Documents and Settings\Administrator\����\��.jpg", 20, 15, 110, 110)
#EndRegion ### END Koda GUI section ###
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        GUISetState(@SW_HIDE, $Form1)
                        $mm1 = GUICtrlRead($Input1)
                        $mm2 = GUICtrlRead($Input2)
                        If $mm1 <> $mm2 Then
                                MsgBox(16, "ע��!", "������������벻һ��!")
                                quit1()
                        EndIf
                        RegWrite("HKLM\Software\pclock", "password", "REG_SZ", $mm1)
                        _beijing()
                        ExitLoop
                Case $Button2
                        quit()
        EndSwitch
WEnd
Func _beijing()
        #Region ### START Koda GUI section ### Form=
        $aForm1 = GUICreate("�һ���", @DesktopWidth, @DesktopHeight, 0, 0, $WS_POPUP, BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST))
        GUISetBkColor(0x000000)
        $AlphaDLL = DllCall("user32.dll", "long", "GetWindowLongA", "hwnd", $aForm1, "int", -20)
        $AlphaDLL = BitOR($AlphaDLL, 0x00080000)
        DllCall("user32.dll", "long", "SetWindowLongA", "hwnd", $aForm1, "int", -20, "long", $AlphaDLL)
        DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $aForm1, "int", 0, "int", 0, "int", 0x00000002)
        $Pic1 = GUICtrlCreatePic(@TempDir & "\lock.gif", (@DesktopWidth - 700) / 2, (@DesktopHeight - 300) / 2, 700, 150, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
        $Input1 = GUICtrlCreateInput("", @DesktopWidth - 280, @DesktopHeight - 180, 153, 21, $ES_PASSWORD, BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
        $Button1 = GUICtrlCreateButton("����", @DesktopWidth - 100, @DesktopHeight - 182, 51, 25, $WS_GROUP, $WS_EX_STATICEDGE)
        GUICtrlSetState(-1, $GUI_DEFBUTTON)
        $Label1 = GUICtrlCreateLabel("��ʼ�һ�ʱ��:" & @HOUR & ":" & @MIN & ":" & @SEC, @DesktopWidth - 280, @DesktopHeight - 142, 150, 17)
        GUICtrlSetColor(-1, 0xFFFFFF)
        $Label2 = GUICtrlCreateLabel("��������xxx����", @DesktopWidth - 280, @DesktopHeight - 112, 208, 17)
        GUICtrlSetColor(-1, 0xFFFFFF)
        $Slider1 = GUICtrlCreateSlider(@DesktopWidth - 280, @DesktopHeight - 82, 240, 33)
        GUICtrlSetLimit(-1, 250, 30)
        GUICtrlSetData(-1, 150)
        GUISetState(@SW_SHOW)
        GUISetState(@SW_DISABLE)
        For $i = 0 To 255 Step 10
                $AlphaDLL = DllCall("user32.dll", "long", "GetWindowLongA", "hwnd", $aForm1, "int", -20)
                $AlphaDLL = BitOR($AlphaDLL, 0x00080000)
                DllCall("user32.dll", "long", "SetWindowLongA", "hwnd", $aForm1, "int", -20, "long", $AlphaDLL)
                DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $aForm1, "int", 0, "int", $i, "int", 0x00000002)
        Next
        GUISetState(@SW_ENABLE)
        #EndRegion ### END Koda GUI section ###
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "StartButton_Show_Hide", "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "Taskbar_Show_Hide", "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "CtrlAltDel_Enable_Disable", "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "AltTab1_Enable_Disable", "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "AltTab2_Enable_Disable", "int", 0, "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "TaskSwitching_Enable_Disable", "int", 0)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "TaskManager_Enable_Disable", "int", 0)
        While 1
                If GUICtrlRead($Slider1) <> $SliderAlpha Then
                        $SliderAlpha = GUICtrlRead($Slider1)
                        $AlphaDLL = DllCall("user32.dll", "long", "GetWindowLongA", "hwnd", $aForm1, "int", -20)
                        $AlphaDLL = BitOR($AlphaDLL, 0x00080000)
                        DllCall("user32.dll", "long", "SetWindowLongA", "hwnd", $aForm1, "int", -20, "long", $AlphaDLL)
                        DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $aForm1, "int", 0, "int", GUICtrlRead($Slider1), "int", 0x00000002)
                EndIf
                $nMsg = GUIGetMsg()
                GUICtrlSetData($Label1, "��ǰϵͳʱ��:" & @HOUR & ':' & @MIN & ':' & @SEC)
                Sleep(50)
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE

                        Case $Button1
                                $pass2 = RegRead("HKLM\Software\pclock", "password")
                                $pass3 = GUICtrlRead($Input1)
                                If $pass2 = $pass3 Then
                                        quit1()
                                Else
                                        MsgBox(16 + 262144, "ע��!", "��������벻��ȷ!" & @LF & "����������!!")
                                        ContinueLoop
                                EndIf
                EndSwitch
        WEnd
EndFunc   ;==>_beijing
Func quit1()
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "StartButton_Show_Hide", "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "Taskbar_Show_Hide", "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "CtrlAltDel_Enable_Disable", "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "AltTab1_Enable_Disable", "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "AltTab2_Enable_Disable", "int", 1, "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "TaskSwitching_Enable_Disable", "int", 1)
        DllCall(@TempDir & "\WinLockDLL.dll", "int", "TaskManager_Enable_Disable", "int", 1)
        FileDelete(@TempDir & "\WinLockDll.dll")
        quit()
EndFunc   ;==>quit1
Func quit()
        FileDelete(@TempDir & "\WinLockDll.dll")
        Exit
EndFunc   ;==>quit

