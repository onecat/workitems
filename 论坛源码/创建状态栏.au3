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

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>
#include <GuiStatusBar.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

Example()
Func Example()
        Local $defaultstatus = "Ready", $filemenu, $fileitem
        Local $helpmenu, $infoitem, $exititem, $recentfilesmenu
        Local $viewmenu, $viewstatusitem, $cancelbutton
        Local $statuslabel, $msg, $file
        Local $mainUI = GUICreate("My GUI menu", 300, 200)
        $filemenu = GUICtrlCreateMenu("&File")
        $fileitem = GUICtrlCreateMenuItem("Open", $filemenu)
        GUICtrlSetState(-1, $GUI_DEFBUTTON)
        $helpmenu = GUICtrlCreateMenu("?")
        GUICtrlCreateMenuItem("Save", $filemenu)
        GUICtrlSetState(-1, $GUI_DISABLE)
        $infoitem = GUICtrlCreateMenuItem("Info", $helpmenu)
        $exititem = GUICtrlCreateMenuItem("Exit", $filemenu)
        $recentfilesmenu = GUICtrlCreateMenu("Recent Files", $filemenu, 1)
        GUICtrlCreateMenuItem("", $filemenu, 2) ; create a separator line
        $viewmenu = GUICtrlCreateMenu("View", -1, 1) ; is created before "?" menu
        $viewstatusitem = GUICtrlCreateMenuItem("Statusbar", $viewmenu)
        GUICtrlSetState(-1, $GUI_CHECKED)
        GUICtrlCreateButton("OK", 50, 130, 70, 20)
        GUICtrlSetState(-1, $GUI_FOCUS)
        $cancelbutton = GUICtrlCreateButton("Cancel", 180, 130, 70, 20)

        Local $PC_StatusBar1 = _GUICtrlStatusBar_Create($mainUI, -1, "", BitOR($WS_VISIBLE, $WS_CHILD), $WS_EX_STATICEDGE)
        Dim $PC_StatusBar1_PartsWidth[2] = [260, -1]
        _GUICtrlStatusBar_SetParts($PC_StatusBar1, $PC_StatusBar1_PartsWidth)
        _GUICtrlStatusBar_SetText($PC_StatusBar1, "123", 0)
        _GUICtrlStatusBar_SetText($PC_StatusBar1, "234", 1)
        _GUICtrlStatusBar_SetMinHeight($PC_StatusBar1, 15)

        ; $statuslabel = GUICtrlCreateLabel($defaultstatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))
        GUISetState(@SW_SHOW)
        ; Loop until the user exits.
        While 1
                $msg = GUIGetMsg()
                If $msg = $fileitem Then
                        $file = FileOpenDialog("Choose file...", @TempDir, "All (*.*)")
                        If @error <> 1 Then GUICtrlCreateMenuItem($file, $recentfilesmenu)
                EndIf
                If $msg = $viewstatusitem Then
                        If BitAND(GUICtrlRead($viewstatusitem), $GUI_CHECKED) = $GUI_CHECKED Then
                                GUICtrlSetState($viewstatusitem, $GUI_UNCHECKED)
                                GUICtrlSetState($statuslabel, $GUI_HIDE)
                        Else
                                GUICtrlSetState($viewstatusitem, $GUI_CHECKED)
                                GUICtrlSetState($statuslabel, $GUI_SHOW)
                        EndIf
                EndIf
                If $msg = $GUI_EVENT_CLOSE Or $msg = $cancelbutton Or $msg = $exititem Then ExitLoop
                If $msg = $infoitem Then MsgBox($MB_SYSTEMMODAL, "Info", "Only a test...")
        WEnd
        GUIDelete()
EndFunc   ;==>Example