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
#include <WinAPI.au3>
#include <GUIEdit.au3>
#include <GUIConstants.au3>
#include <StaticConstants.au3>

#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)
Local $input, $btn, $msg, $dat, $len, $ctrlhandle

GUICreate("input", 130, 80)
$input = GUICtrlCreateInput("", 10, 5, 110, 20)
GUICtrlSetLimit(-1, 17)
$btn = GUICtrlCreateButton("Ok", 35, 45, 60, 20)
GUISetState()
While $msg <> $GUI_EVENT_CLOSE
        $msg = GUIGetMsg()
        Switch $msg
                Case $btn
                        MsgBox(4096, "", GUICtrlRead($input))
        EndSwitch
        reinput($input)
WEnd

Func reinput($ctrlhandle)
        $dat = GUICtrlRead($ctrlhandle)
        $len = StringLen($dat)
        If $len = 2 Or $len = 5 Or $len = 8 Or $len = 11 Or $len = 14 Then
                GUICtrlSetData($ctrlhandle, $dat & "-")
        EndIf
EndFunc   ;==>reinput





;~ If Not IsDeclared("WM_CHAR") Then $WM_CHAR = 0x102

;~ $hGUI = GUICreate("Test", 180, 100)

;~ GUICtrlCreateLabel("", 20, 20, 140, 20, $SS_SUNKEN)
;~ $hParent = GUICtrlGetHandle(-1)
;~ GUICtrlSetBkColor(-1, 0xFFFFFF)

;~ $hCall = DllCallbackRegister("_IptProc", "int", "hWnd;uint;wparam;lparam")
;~ $pCall = DllCallbackGetPtr($hCall)

;~ Dim $iPos = 0
;~ For $i = 0 to 5
;~         GUICtrlCreateInput("00", $iPos, 3, 20, 17, 1, 4)
;~         GUICtrlSetLimit(-1, 2)
;~         GUICtrlSetFont(-1, 10, 800, "", "Garamond")
;~         _WinAPI_SetParent(GUICtrlGetHandle(-1), $hParent)
;~         If $i = 0 Then
;~                 $hOldC = _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pCall)
;~         Else
;~                 _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pCall)
;~         EndIf
;~         GUICtrlCreateLabel("-", $iPos + 41, 30, 4, 2, $SS_SUNKEN)
;~         GUICtrlSetFont(-1, 10, 800, "", "Garamond")
;~         $iPos += 23
;~ Next


;~ GUICtrlDelete(-1)
;~ $iBtnRead = GUICtrlCreateButton("Read", 20, 60, 140, 20)
;~ GUISetState()
;~ GUIRegisterMsg(0x111, "_WMCOMMAND")

;~ Do
;~         $iMsg = guiGetMsg()
;~         Switch $iMsg
;~         Case $iBtnRead
;~                 Dim $sData = ""
;~                 For $i = 4 to 14 Step 2
;~                         $sData &= GUICtrlRead($i) & "-"
;~                 Next
;~                 Msgbox(0, '', StringTrimRight($sData, 1))
;~         EndSwitch
;~ Until $iMsg = -3

;~ Func _IptProc($hWnd, $iMsg, $wparam, $lparam)
;~         If $iMsg = $WM_CHAR Then
;~                 If StringIsXDigit(Chr($wparam)) = 0 And $wparam <> 8 Then Return 0
;~         EndIf
;~         Return _WinAPI_CallWindowProc($hOldC, $hWnd, $iMsg, $wparam, $lparam)
;~ EndFunc        ;==>_IptProc

;~ Func _WMCOMMAND($hWnd, $iMsg, $wparam, $lparam)
;~         Local $nID, $iNotifyCode
;~         $nID = bitAND($wparam, 0xFFFF)
;~         $iNotifyCode = bitShift($wparam, 0x10)
;~         If $iNotifyCode = $EN_CHANGE Then
;~                 If StringLen(GUICtrlRead($nID)) >= 2 Then
;~                         GUICtrlSetState($nID + 2, $GUI_FOCUS)
;~                         _GUICtrlEdit_SetSel($nID + 2, 1, 2)
;~                 EndIf
;~         EndIf
;~ EndFunc        ;==>_WMCOMMAND
