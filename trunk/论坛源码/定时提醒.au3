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
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <StatusBarConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiStatusBar.au3>
#include <Timers.au3>
Opt("guicloseonesc",0)        ;Opt�����������ֺ���/������������ʽ
                               ;�˴�Ϊ��������ʱ����ESC��������Ϣ��������ESC�����˳�����
#NoTrayIcon                    ;�ű���ʼִ��ʱ����ʾ���̵�ͼ��
Global $itime_rst,$i
$i=-1

$Form1 = GUICreate("��ʱ����", 230, 230, 463, 119)
$Group1 = GUICtrlCreateGroup(" ��ǰʱ�� ", 8, 7, 209, 49)
$Lab_now = GUICtrlCreateLabel("   " & @YEAR &"��" & @MON & "��" & @MDAY & "��   "& StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 16,25, 193, 22,$SS_SUNKEN)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup(" �趨ʱ�� ", 8, 59, 209, 87)
$Label1 = GUICtrlCreateLabel("��ʱ", 21, 84, 28, 17)
$Combo_min = GUICtrlCreateCombo("", 51, 81, 57, 25)
GUICtrlSetData($Combo_min,"00|01|03|05|10|15|20|25|30|35|40|45|50|55|60","10")
$Label2 = GUICtrlCreateLabel("��", 113, 84, 16, 17)
$Combo_sec = GUICtrlCreateCombo("", 133, 82, 56, 25)
GUICtrlSetData($Combo_sec,"00|03|05|10|15|20|25|30|35|40|45|50|55|59","00")
$Label3 = GUICtrlCreateLabel("��", 193, 84, 16, 17)
$Label5 = GUICtrlCreateLabel("ʣ��ʱ�䣨�룩", 21, 119, 88, 17)
$Lab_end = GUICtrlCreateLabel("", 112, 115, 97, 21,$SS_SUNKEN)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button_ok = GUICtrlCreateButton("ȷ ��(&O)", 20, 170, 70, 25, 0)
ControlFocus("��ʱ����","",$Button_ok)
$Button_exit = GUICtrlCreateButton("�� ��(&X)", 129, 170, 70, 25, 0)
$Label4 = GUICtrlCreateLabel("____________________________________", 6, 150, 220, 15)
GUICtrlSetColor(-1, 0x9DB9EB)
;����״̬��
Local $Form1 
Local $aparts[2]=[150,-1]
$Status = _GUICtrlStatusBar_Create ($Form1)
_GUICtrlStatusBar_SetParts($Status,$aparts)
_GUICtrlStatusBar_SetText($status," ��ʱ���� Ver.2.01",0)
_GUICtrlStatusBar_SetText($status," BYСǿ",1)
GUISetState(@SW_SHOW)

_Timer_SetTimer($Form1, 1000, "_UpdateClock") ; create timer
While 1
$nMsg = GUIGetMsg()
Switch $nMsg
        Case $GUI_EVENT_CLOSE
         Exit
    Case $Button_exit
         Exit
    Case $Button_ok
                 _endtime()
EndSwitch
WEnd
Func _UpdateClock($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    GUICtrlSetData($Lab_now ,"   " & @YEAR &"��" & @MON & "��" & @MDAY & "��   "& StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC))
EndFunc   ;==>_UpdateClock
Func _endtime()
    MsgBox(64,"��ʾ��Ϣ","���趨��ʱ��Ϊ" & GUICtrlRead($Combo_min) & "��" & GUICtrlRead($Combo_sec) & "��")
    GUICtrlSetState($button_ok,$gui_disable)
    _Timer_SetTimer($Form1, 1000, "_downClock") ; create timer
EndFunc
;����ʱ
Func _downClock($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    $i=$i+1 
    GUICtrlSetData($Lab_end," " & GUICtrlRead($Combo_min)*60+GUICtrlRead($Combo_sec)-$i)
if GUICtrlRead($Lab_end)=0 Then
    GUICtrlSetData($Lab_end," 0 ")
     _Timer_KillAllTimers($Form1)
     _Timer_SetTimer($Form1, 1000, "_UpdateClock") ; create timer
    MsgBox(48,"����","���趨��ʱ���ѵ�!!!") 
        _Timer_SetTimer($Form1, 10000, "_info") ; create timer
endif
EndFunc   ;==>_DownClock

Func _info($hWnd, $Msg, $iIDTimer, $dwTime)
    #forceref $hWnd, $Msg, $iIDTimer, $dwTime
    MsgBox(48,"����","���趨��ʱ���ѵ�!!!") 
EndFunc   ;==>
