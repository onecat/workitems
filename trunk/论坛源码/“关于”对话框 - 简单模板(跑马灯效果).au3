#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <File.au3>
#include <BorderConstants.au3> ;for _WinAPI_DrawEdge
#include "Marquee.au3" ;文字跑马灯
 
Opt("MustDeclareVars", 1)
Opt("GUIOnEventMode", 1)
 
#region ### Const & variable definition
Global Const $AppName = "应用程序名称"
Global Const $version = '1.0'
Global Const $logfile = @ScriptDir & '\About.log'
Global $hAbout, $aMarquee
#endregion ### Const & variable definition
 
Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 3)
TraySetClick(16) ;释放鼠标右键显示托盘菜单
Local $TrayAbout_3D = TrayCreateItem("关于 (3D文字)")
TrayItemSetOnEvent(-1, "_About")
Local $TrayAbout_Marquee = TrayCreateItem("关于 (跑马灯文字)")
TrayItemSetOnEvent(-1, "_About")
TrayCreateItem("")
Local $TrayExit = TrayCreateItem("退出")
TrayItemSetOnEvent(-1, "_Exit")
TraySetState()
 
While 1
        Sleep(100)
WEnd
 
Func _About()
        TrayItemSetState($TrayAbout_3D, $TRAY_DISABLE)
        TrayItemSetState($TrayAbout_Marquee, $TRAY_DISABLE)
        _FileWriteLog($logfile, '打开"关于"对话框')
        
        $hAbout = GUICreate("关于", 300, 200, -1, -1, Bitor($WS_CAPTION,$WS_SYSMENU), $WS_EX_TOPMOST)
        GUISetOnEvent($GUI_EVENT_CLOSE, "DestroyAboutDialog")   
        If @TRAY_ID = $TrayAbout_Marquee Then ;跑马灯文字
                $aMarquee = _GUICtrlMarquee_Init()
                _GUICtrlMarquee_SetScroll($aMarquee, Default, "alternate", "right", 1, 85)
                _GUICtrlMarquee_SetDisplay($aMarquee, 0, 0xFF0000, 0xECE9D8, 16, "Comic Sans MS") ;"Times New Roman"
                _GUICtrlMarquee_Create($aMarquee, $AppName, 80, 35, 140, 35)
        Else ;Default: 3D文字
                _3DTEXT($AppName, 60, 30, 180, 35, 0xFF0000, 0xBBBBBB, 20)
        EndIf
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
        If @TRAY_ID = $TrayAbout_Marquee Then
                _GUICtrlMarquee_Delete($aMarquee)
                _ReduceMemory(@AutoItPID) ;跑马灯文字效果启用微型浏览器会占用一定内存，需释放
        EndIf
        GUIDelete($hAbout)
        TrayItemSetState($TrayAbout_3D, $TRAY_ENABLE)
        TrayItemSetState($TrayAbout_Marquee, $TRAY_ENABLE)
        _FileWriteLog($logfile, '关闭"关于"对话框')
EndFunc
 
Func _Exit()
        If FileExists($logfile) Then FileDelete($logfile)
        Exit
EndFunc
 
Func WM_PAINT($hWnd, $msg, $wParam, $lParam)
    #forceref $hWnd, $Msg, $wParam, $lParam
    _WinAPI_RedrawWindow($hAbout, 0, 0, $RDW_UPDATENOW)
        
        Global $tRECT, $hDC
        ;GUICreate中指定的窗口大小为客户区大小，而$tagRECT要求的是相对于整个窗体的位置
        $tRECT = DllStructCreate($tagRECT)
        DllStructSetData($tRECT, "Left", 40)
        DllStructSetData($tRECT, "Top", 50)
        DllStructSetData($tRECT, "Right", _WinAPI_GetWindowWidth($hAbout) - 40) ;若使用GUICreate时的宽度来计算会发现两侧边距不等
        DllStructSetData($tRECT, "Bottom", 145)
        $hDC = _WinAPI_GetWindowDC($hAbout)
        _WinAPI_DrawEdge($hDC, DllStructGetPtr($tRECT), $BDR_RAISEDINNER + $BDR_SUNKENOUTER, $BF_RECT) ;样式图例 [url]http://goo.gl/TVRfv[/url]
        _WinAPI_ReleaseDC($hAbout, $hDC) ;释放设备环境
        $tRECT = 0 ;释放为数据结构分配的内存
        
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
 
Func _ReduceMemory($i_PID = -1)
        If $i_PID <> -1 Then
                Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
                DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
        Else
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
        EndIf
        Return $ai_Return[0]
EndFunc   ;==>_ReduceMemory