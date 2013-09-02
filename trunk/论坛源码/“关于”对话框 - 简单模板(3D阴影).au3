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
#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <File.au3>
#include <BorderConstants.au3> ;for _WinAPI_DrawEdge
 
Opt("MustDeclareVars", 1)
Opt("GUIOnEventMode", 1)
 
#region ### Const & variable definition
Global Const $AppName = "Ӧ�ó�������"
Global Const $version = '1.0'
Global Const $logfile = @ScriptDir & '\About.log'
Global $hAbout
#endregion ### Const & variable definition
 
Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 3)
TraySetClick(16) ;�ͷ�����Ҽ���ʾ���̲˵�
Local $TrayAbout = TrayCreateItem("����")
TrayItemSetOnEvent(-1, "_About")
TrayCreateItem("")
Local $TrayExit = TrayCreateItem("�˳�")
TrayItemSetOnEvent(-1, "_Exit")
TraySetState()
 
While 1
        Sleep(100)
WEnd
 
Func _About()
        TrayItemSetState($TrayAbout, $TRAY_DISABLE)
        _FileWriteLog($logfile, '��"����"�Ի���')
        
        $hAbout = GUICreate("����", 300, 200, -1, -1, Bitor($WS_CAPTION,$WS_SYSMENU), $WS_EX_TOPMOST)
        GUISetOnEvent($GUI_EVENT_CLOSE, "DestroyAboutDialog")   
        _3DTEXT($AppName, 60, 30, 180, 35, 0xFF0000, 0xBBBBBB, 20)
        GUICtrlCreateLabel("Version " & $version, 100, 80, 100, 25, $SS_CENTER + $SS_CENTERIMAGE)
        GUICtrlSetFont(-1, 9.5, 800, 0, "Arial") ;bold
        GUICtrlCreateLabel("Copyright (C) 2012-2013 ACN Forum", 0, 135, 300, 20, $SS_CENTER + $SS_CENTERIMAGE)
        GUICtrlCreateLabel("Support Email: ", 0, 160, 132, 20, $SS_RIGHT + $SS_CENTERIMAGE)
        GUICtrlCreateLabel("xiehuahere@163.com", 132, 159, 180, 20, $SS_LEFT + $SS_CENTERIMAGE)
        GUICtrlSetFont(-1, 8.5, -1, 4) ;underlined
        GUICtrlSetColor(-1, 0x0000FF) ;blue
        GUICtrlSetCursor(-1, 0)
        GUICtrlSetOnEvent(-1, "OnEmail")
                
        GUIRegisterMsg($WM_PAINT, "WM_PAINT")
        GUISetState()
EndFunc
 
Func OnEmail()
        Local $Address, $Subject, $Body, $Attachment = ''       
        $Address = 'xiehuahere@163.com'
        $Subject = 'APP support issue'
        $Body = 'Version ' & $version & @CRLF & @CRLF & _
                'Please make some descriptions here:' & @CRLF & _
                '(attach a screenshot as well if necessary)' & @CRLF & @CRLF & @CRLF & @CRLF & @CRLF
        $Attachment = $logfile
        _INetMail($Address, $Subject, $Body, $Attachment)
EndFunc
 
Func DestroyAboutDialog()
        GUIDelete($hAbout)
        TrayItemSetState($TrayAbout, $TRAY_ENABLE)
        _FileWriteLog($logfile, '�ر�"����"�Ի���')
EndFunc
 
Func _Exit()
        If FileExists($logfile) Then FileDelete($logfile)
        Exit
EndFunc
 
Func WM_PAINT($hWnd, $msg, $wParam, $lParam)
    #forceref $hWnd, $Msg, $wParam, $lParam
    _WinAPI_RedrawWindow($hAbout, 0, 0, $RDW_UPDATENOW)
        
        Global $tRECT, $hDC
        ;GUICreate��ָ���Ĵ��ڴ�СΪ�ͻ�����С����$tagRECTҪ�������������������λ��
        $tRECT = DllStructCreate($tagRECT)
        DllStructSetData($tRECT, "Left", 40)
        DllStructSetData($tRECT, "Top", 50)
        DllStructSetData($tRECT, "Right", _WinAPI_GetWindowWidth($hAbout) - 40) ;��ʹ��GUICreateʱ�Ŀ��������ᷢ������߾಻��
        DllStructSetData($tRECT, "Bottom", 145)
        $hDC = _WinAPI_GetWindowDC($hAbout)
        _WinAPI_DrawEdge($hDC, DllStructGetPtr($tRECT), $BDR_RAISEDINNER + $BDR_SUNKENOUTER, $BF_RECT) ;��ʽͼ�� [url]http://goo.gl/TVRfv[/url]
        _WinAPI_ReleaseDC($hAbout, $hDC) ;�ͷ��豸����
        $tRECT = 0 ;�ͷ�Ϊ���ݽṹ������ڴ�
        
        _WinAPI_RedrawWindow($hAbout, 0, 0, $RDW_VALIDATE)
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_PAINT
 
Func _INetMail($s_MailTo, $s_MailSubject, $s_MailBody, $s_Attachment)
        Local $prev = Opt("ExpandEnvStrings", 1)
        Local $var, $dflt = RegRead('HKCU\Software\Clients\Mail', "")
        If $dflt = "Windows Live Mail" Then
                $var = RegRead('HKCR\WLMail.Url.Mailto\Shell\open\command', "")
        Else
                $var = RegRead('HKCR\mailto\shell\open\command', "")
        EndIf
        Local $strMailto = _INetExplorerCapable('mailto:' & $s_MailTo & '?subject=' & $s_MailSubject & '&body=' & $s_MailBody & '&attach=' & $s_Attachment)
        Local $ret = Run(StringReplace($var, '%1', $strMailto))
        Local $nError = @error, $nExtended = @extended
        Opt("ExpandEnvStrings", $prev)
        Return SetError($nError, $nExtended, $ret)
EndFunc   ;==>_INetMail
 
Func _INetExplorerCapable($s_IEString)
        If StringLen($s_IEString) <= 0 Then Return SetError(1, 0, '')
        Local $s_IEReturn
        Local $n_IEChar
        For $i_IECount = 1 To StringLen($s_IEString)
                $n_IEChar = '0x' & Hex(Asc(StringMid($s_IEString, $i_IECount, 1)), 2)
                If $n_IEChar < 0x21 Or $n_IEChar = 0x25 Or $n_IEChar = 0x2f Or $n_IEChar > 0x7f Then
                        $s_IEReturn = $s_IEReturn & '%' & StringRight($n_IEChar, 2)
                Else
                        $s_IEReturn = $s_IEReturn & Chr($n_IEChar)
                EndIf
        Next
        Return $s_IEReturn
EndFunc   ;==>_INetExplorerCapable
 
Func _3DTEXT($text, $top, $left, $length = 100, $height = 20, $Font_Color = "", $Shadow_Color = 0xBBBBBB, $Font_Size = 20, $style = 1, $adj = 2.5)
    Local $Ret[2], $adj2 = $adj
    If $style = 2 Or $style = 5 Then $adj2 = 0
    If $style = 3 Or $style = 6 Then $adj = 0
    If $style <= 3 Then $Ret[0] = GUICtrlCreateLabel($text, $top + $adj, $left + $adj2, $length, $height, $SS_CENTER + $SS_CENTERIMAGE)
    If $style >= 4 Then $Ret[0] = GUICtrlCreateLabel($text, $top - $adj, $left - $adj2, $length, $height, $SS_CENTER + $SS_CENTERIMAGE)
    GUICtrlSetColor(-1, $Shadow_Color)
    GUICtrlSetFont(-1, $Font_Size, 700)
    $Ret[1] = GUICtrlCreateLabel($text, $top, $left, $length, $height, $SS_CENTER + $SS_CENTERIMAGE)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
    GUICtrlSetColor(-1, $Font_Color)
    GUICtrlSetFont(-1, $Font_Size, 700)
    Return $Ret
EndFunc   ;==>_3DTEXT