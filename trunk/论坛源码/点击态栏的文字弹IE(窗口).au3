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

#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)


Local $Debug_SB = False ; Check ClassName being passed to functions, set to True and use a handle to another control to see it work

        Local $hGUI, $hProgress, $hButton, $Button, $progress, $hStatus,$Msgbox
        Local $aParts[4] = [80, 160, 300, -1]
        $hGUI = GUICreate("StatusBar Embed Control", 400, 300)
        $hStatus = _GUICtrlStatusBar_Create ($hGUI)
        _GUICtrlStatusBar_SetMinHeight ($hStatus, 20)
        GUISetState()
        _GUICtrlStatusBar_SetParts ($hStatus, $aParts)
        _GUICtrlStatusBar_SetText ($hStatus, "Part 1")
        _GUICtrlStatusBar_SetText ($hStatus, "Part 2", 1)
        _GUICtrlStatusBar_SetText ($hStatus, "Part 3", 2)
        _GUICtrlStatusBar_SetText ($hStatus, "Part 4", 3)
        GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
        While 1
                $Msgbox=GUIGetMsg()
                Switch $Msgbox
                        Case $GUI_EVENT_CLOSE
                                        GUIDelete()
                                Exit
                EndSwitch
        WEnd

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
  #forceref $hWnd, $iMsg, $iwParam
  Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo

  $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
  $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
  $iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
  $iCode = DllStructGetData($tNMHDR, "Code")
  Switch $hWndFrom
    Case $hStatus
      Switch $iCode
        Case $NM_CLICK ; �����������Ŀʱ�ɿؼ�����
         $tInfo = DllStructCreate($tagNMMOUSE, $ilParam)
                 Select
                        Case DllStructGetData($tInfo, "ItemSpec")=0 
                                ;MsgBox(0,0,"ѡ�е�һ��")
								ShellExecute("http://www.baidu.com")
                        Case DllStructGetData($tInfo, "ItemSpec")=1
                                MsgBox(0,0,"ѡ�еڶ���")
                        Case DllStructGetData($tInfo, "ItemSpec")=2
                                MsgBox(0,0,"ѡ�е�����")
                        Case DllStructGetData($tInfo, "ItemSpec")=3
                                MsgBox(0,0,"ѡ�е�����")
                EndSelect
         Return TRUE ; ��ʾ�ѻ�ȡ���������ϵͳ��ֹĬ�ϲ���
      EndSwitch
  EndSwitch
  Return $GUI_RUNDEFMSG
EndFunc ;==>WM_NOTIFY