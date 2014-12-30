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
        Case $NM_CLICK ; 鼠标左键点击项目时由控件发送
         $tInfo = DllStructCreate($tagNMMOUSE, $ilParam)
                 Select
                        Case DllStructGetData($tInfo, "ItemSpec")=0 
                                ;MsgBox(0,0,"选中第一栏")
								ShellExecute("http://www.baidu.com")
                        Case DllStructGetData($tInfo, "ItemSpec")=1
                                MsgBox(0,0,"选中第二栏")
                        Case DllStructGetData($tInfo, "ItemSpec")=2
                                MsgBox(0,0,"选中第三栏")
                        Case DllStructGetData($tInfo, "ItemSpec")=3
                                MsgBox(0,0,"选中第四栏")
                EndSelect
         Return TRUE ; 表示已获取鼠标点击并由系统禁止默认操作
      EndSwitch
  EndSwitch
  Return $GUI_RUNDEFMSG
EndFunc ;==>WM_NOTIFY