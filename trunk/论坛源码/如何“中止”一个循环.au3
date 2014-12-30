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

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>

$Form1 = GUICreate("Form1", 487, 98)
$Progress1 = GUICtrlCreateProgress(8, 72, 465, 17)
GUICtrlSetData(-1, 0)
$Button1 = GUICtrlCreateButton("开始", 48, 16, 105, 33)
$Button2 = GUICtrlCreateButton("中止", 168, 16, 105, 33)
GUICtrlSetState(-1, $gui_disable)
$Button3 = GUICtrlCreateButton("退出", 288, 16, 97, 33)
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
        Local $nID = BitAND($wParam, 0x0000FFFF) ;控件ID
        Local $nNotifyCode = BitShift($wParam, 16) ;通知代码
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
                ; 这里要加什么命令才能中止循环, 并得到当前的 $i
                If $stop Then
                        $iSavePos = $i;保存当前进度位置到 $iSavPos
                        MsgBox(0, "操作被中止", "操作被中止, 最后的 $i 是：" & $iSavePos)
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
;~ $Button1 = GUICtrlCreateButton("开始", 48, 16, 105, 33)
;~ GUICtrlSetOnEvent(-1, "start")
;~ $Button2 = GUICtrlCreateButton("中止", 168, 16, 105, 33)
;~ GUICtrlSetState(-1, $gui_disable)
;~ GUICtrlSetOnEvent(-1, "stop")
;~ $Button3 = GUICtrlCreateButton("退出", 288, 16, 97, 33)
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
;~         MsgBox(0, "操作被中止", "操作被中止, 最后的 $i 是：" & $starti)
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
;~ $Button1 = GUICtrlCreateButton("开始", 48, 16, 105, 33)
;~ $Button3 = GUICtrlCreateButton("退出", 288, 16, 97, 33)
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
;~         GUICtrlSetData($Button1, "中止")
;~         GUICtrlSetState($Button3, $gui_disable)
;~         GUICtrlSetData($Progress1, 0)
;~         Local $i, $j = 30
;~         For $i = 1 To $j
;~                 GUICtrlSetData($Progress1, $i * 100 / $j)
;~                 Sleep(200)
;~                 $idM = GUIGetMsg()
;~                 If $idM = $Button1 Then
;~                         MsgBox(0, "操作被中止", "操作被中止, 最后的 $i 是：" & $i)
;~                         GUICtrlSetData($Button1, "开始")
;~                         ExitLoop
;~                 EndIf
;~         Next
;~         GUICtrlSetState($Button3, $gui_enable)
;~ EndFunc   ;==>gogo
