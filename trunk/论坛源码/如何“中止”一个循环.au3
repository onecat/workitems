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
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>

$Form1 = GUICreate("Form1", 487, 98)
$Progress1 = GUICtrlCreateProgress(8, 72, 465, 17)
GUICtrlSetData(-1, 0)
$Button1 = GUICtrlCreateButton("��ʼ", 48, 16, 105, 33)
$Button2 = GUICtrlCreateButton("��ֹ", 168, 16, 105, 33)
GUICtrlSetState(-1, $gui_disable)
$Button3 = GUICtrlCreateButton("�˳�", 288, 16, 97, 33)
GUISetState(@SW_SHOW)
GUIRegisterMsg(0x0111, "WM_COMMAND")
Global $stop = True, $iSavePos = 1

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        gogo()
                Case $Button3
                        Exit
        EndSwitch
WEnd

Func WM_COMMAND($hWnd, $Msg, $wParam, $lParam)
        Local $nID = BitAND($wParam, 0x0000FFFF) ;�ؼ�ID
        Local $nNotifyCode = BitShift($wParam, 16) ;֪ͨ����
        If $nID = $Button2 Then $stop = True
EndFunc   ;==>WM_COMMAND

Func gogo()
        $stop = False
        GUICtrlSetState($Button1, $gui_disable)
        GUICtrlSetState($Button2, $gui_enable)
        GUICtrlSetState($Button3, $gui_disable)
        GUICtrlSetData($Progress1, 0)
        Local $i, $j = 30
        For $i = $iSavePos To $j
                GUICtrlSetData($Progress1, $i * 100 / $j)
                Sleep(200)
                ; ����Ҫ��ʲô���������ֹѭ��, ���õ���ǰ�� $i
                If $stop Then
                        $iSavePos = $i;���浱ǰ����λ�õ� $iSavPos
                        MsgBox(0, "��������ֹ", "��������ֹ, ���� $i �ǣ�" & $iSavePos)
                        ExitLoop
                EndIf
        Next
        If $i > $j Then $iSavePos = 1
        GUICtrlSetState($Button1, $gui_enable)
        GUICtrlSetState($Button2, $gui_disable)
        GUICtrlSetState($Button3, $gui_enable)
EndFunc   ;==>gogo



;~ #include <ButtonConstants.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <ProgressConstants.au3>
;~ #include <WindowsConstants.au3>
;~ Opt("GUIOnEventMode", 1)
;~  
;~ $Form1 = GUICreate("Form1", 487, 98)
;~ GUISetOnEvent($GUI_EVENT_CLOSE, "quit")
;~  
;~ $Progress1 = GUICtrlCreateProgress(8, 72, 465, 17)
;~ GUICtrlSetData(-1, 0)
;~ $Button1 = GUICtrlCreateButton("��ʼ", 48, 16, 105, 33)
;~ GUICtrlSetOnEvent(-1, "start")
;~ $Button2 = GUICtrlCreateButton("��ֹ", 168, 16, 105, 33)
;~ GUICtrlSetState(-1, $gui_disable)
;~ GUICtrlSetOnEvent(-1, "stop")
;~ $Button3 = GUICtrlCreateButton("�˳�", 288, 16, 97, 33)
;~ GUICtrlSetOnEvent(-1, "quit")
;~ Global $starti = 0, $stopi = 30
;~ GUISetState(@SW_SHOW)
;~  
;~ While 1
;~         Sleep(100)
;~ WEnd
;~  
;~ Func quit()
;~         Exit
;~ EndFunc   ;==>quit
;~  
;~ Func stop()
;~         AdlibUnRegister("Progress")
;~         setstate()
;~         MsgBox(0, "��������ֹ", "��������ֹ, ���� $i �ǣ�" & $starti)
;~ EndFunc   ;==>stop
;~  
;~ Func start()
;~         GUICtrlSetState($Button1, $gui_disable)
;~         GUICtrlSetState($Button2, $gui_enable)
;~         GUICtrlSetState($Button3, $gui_disable)
;~         GUICtrlSetData($Progress1, 0)
;~         $starti = 0
;~         AdlibRegister("Progress")
;~ EndFunc   ;==>start
;~  
;~ Func setstate()
;~         GUICtrlSetState($Button1, $gui_enable)
;~         GUICtrlSetState($Button2, $gui_disable)
;~         GUICtrlSetState($Button3, $gui_enable)
;~ EndFunc   ;==>setstate
;~  
;~ Func Progress()
;~         $starti += 1
;~         GUICtrlSetData($Progress1, $starti * 100 / $stopi)
;~         If $starti = $stopi Then
;~                 AdlibUnRegister("Progress")
;~                 setstate()
;~         EndIf
;~ EndFunc   ;==>Progress




;~ #include <ButtonConstants.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <ProgressConstants.au3>
;~ #include <WindowsConstants.au3>

;~ $Form1 = GUICreate("Form1", 487, 98)
;~ $Progress1 = GUICtrlCreateProgress(8, 72, 465, 17)
;~ GUICtrlSetData(-1, 0)
;~ $Button1 = GUICtrlCreateButton("��ʼ", 48, 16, 105, 33)
;~ $Button3 = GUICtrlCreateButton("�˳�", 288, 16, 97, 33)
;~ GUISetState(@SW_SHOW)

;~ While 1
;~         $nMsg = GUIGetMsg()
;~         Switch $nMsg
;~                 Case $GUI_EVENT_CLOSE
;~                         Exit
;~                 Case $Button1
;~                         gogo()
;~                 Case $Button3
;~                         Exit
;~         EndSwitch
;~ WEnd

;~ Func gogo()
;~         GUICtrlSetData($Button1, "��ֹ")
;~         GUICtrlSetState($Button3, $gui_disable)
;~         GUICtrlSetData($Progress1, 0)
;~         Local $i, $j = 30
;~         For $i = 1 To $j
;~                 GUICtrlSetData($Progress1, $i * 100 / $j)
;~                 Sleep(200)
;~                 $idM = GUIGetMsg()
;~                 If $idM = $Button1 Then
;~                         MsgBox(0, "��������ֹ", "��������ֹ, ���� $i �ǣ�" & $i)
;~                         GUICtrlSetData($Button1, "��ʼ")
;~                         ExitLoop
;~                 EndIf
;~         Next
;~         GUICtrlSetState($Button3, $gui_enable)
;~ EndFunc   ;==>gogo
