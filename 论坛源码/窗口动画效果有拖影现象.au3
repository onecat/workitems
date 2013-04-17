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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_UseX64=n
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Opt("MustDEClareVars", 1)
Opt("GUIOnEventMode", 1)

Local $MSGWIN, $Lbl[5]
Local $GetPos = WinGetPos("[class:Shell_TrayWnd]") ;获取任务栏的信息

Local $gu_Main = GUICreate("测试窗口", 520, 522, -1, -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Gui")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "_Gui")
Local $gu_Main_But1 = GUICtrlCreateButton("多点几次 ", 200, 200, 100, 32)
GUICtrlSetOnEvent($gu_Main_But1, "_Gui")

GUISetState(@SW_SHOW)

While 1
        Sleep(100)
WEnd


Func _Gui()
        Switch @GUI_CtrlId
                Case $GUI_EVENT_CLOSE
                        Switch @GUI_WinHandle
                                Case $gu_Main
                                        Exit
                                Case Else
                                        GUIDelete(@GUI_WinHandle)
                        EndSwitch
                Case $gu_Main_But1
                        _GETMSG("XP下有拖影现象，win7下没有，各位大侠有没有好的解决办法啊，拜托了！", "动画窗口")
        EndSwitch
EndFunc   ;==>_Gui


Func _GETMSG($sText, $sTitle);加载通知窗口
        If $sTitle = "" Then $sTitle = "系统消息";默认消息标题
        FileInstall("Msgbg.jpg", @TempDir & "\Msgbg.jpg");载入公告板背景图片
        $MSGWIN = GUICreate("", 256, 111, @DesktopWidth - 256, @DesktopHeight - 111 - $GetPos[3], _
                        $WS_POPUP, $WS_EX_TOPMOST, WinGetHandle(AutoItWinGetTitle()));窗体在托盘栏上
        GUICtrlCreatePic(@TempDir & "\Msgbg.jpg", 0, 0, 0, 0)
        GUICtrlSetState(-1, $GUI_DISABLE) ;设置为背景图片
        FileDelete(@TempDir & "\Msgbg.jpg");删除背景图
        $Lbl[1] = GUICtrlCreateLabel("", 240, 5, 10, 10);关闭按钮
        GUICtrlSetOnEvent(-1, "_MSGWIN_Close")
        GUICtrlSetCursor(-1, 0)
        $Lbl[2] = GUICtrlCreateLabel($sTitle, 14, 32, 228, 12);标题栏
        GUICtrlSetColor(-1, 0x1E5883)
        $Lbl[3] = GUICtrlCreateLabel($sText, 14, 52, 228, 24);信息栏
        GUICtrlSetColor(-1, 0x3A90D9)
        $Lbl[4] = GUICtrlCreateLabel("", 50, 88, 228, 12);倒计时栏
        GUICtrlSetColor(-1, 0x1E5883)
        For $i = 1 To 3
                GUICtrlSetBkColor($Lbl[$i], $GUI_BKCOLOR_TRANSPARENT)
        Next
        
        DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $MSGWIN, "int", 1000, "long", 0x00040008);窗体下进
        GUISetState(@SW_SHOWNA)
        _RoundGUI($MSGWIN, 0, 0, 5, 5) ;窗体圆角
        
EndFunc   ;==>_GETMSG

Func _MSGWIN_Close()
        Local $hWin = @GUI_WinHandle, $aWPos = WinGetPos($hWin), $i, $ts
        If Not IsArray($aWPos) Then Return
        For $i = $aWPos[1] + 10 to @DesktopHeight
                WinMove($hWin, '', DeFault, $i)
                $ts = TimerInIt()
                Do
                Until TimerDiff($ts) > 5
        Next
        If IsHWnd($hWin) Then GUIDelete($hWin)
EndFunc   ;==>_MSGWIN_Close



Func _RoundGUI($h_win, $i_x1, $i_y1, $i_x3, $i_y3) ;窗体圆角API
        Local $pos, $ret, $ret2
        $pos = WinGetPos($h_win)
        $ret = DllCall("gdi32.dll", "long", "CreateRoundRectRgn", "long", $i_x1, "long", $i_y1, "long", $pos[2], "long", $pos[3], "long", $i_x3, "long", $i_y3)
        If $ret[0] Then
                $ret2 = DllCall("user32.dll", "long", "SetWindowRgn", "hwnd", $h_win, "long", $ret[0], "int", 1)
                If $ret2[0] Then
                        Return 1
                Else
                        Return 0
                EndIf
        Else
                Return 0
        EndIf
EndFunc   ;==>_RoundGUI