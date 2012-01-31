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
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WinAPIEx.au3>
#include <Timers.au3>
 
Global $hGUI, $nButton, $GUIMsg, $Dx = 0, $iTimer;$Dx保存滚动条进度，$iTimer定时器标识
Global $cWnd, $cH, $cW, $startxy = 10, $myWidth;$startxy是滚动条的起始位置，$myWidth是滚动条长度
Example()
 
Func Example()
        $hGUI = GUICreate("自绘按钮", 300, 200)
 
        $nButton = GUICtrlCreateButton("滚动条按钮&X", 25, 25, 250, 40)
        $cWnd = _WinAPI_GetDlgItem($hGUI, $nButton);获取按钮句柄
        $cH = _WinAPI_GetClientHeight($cWnd);按钮高 
        $cW = _WinAPI_GetClientWidth($cWnd);按钮宽
        $myWidth = $cW - $startxy * 2;计算滚动条长度
        
        $nButton2 = GUICtrlCreateButton("正常按钮", 25, 75, 250, 40)
        GUISetState()
 
        While 1
                $GUIMsg = GUIGetMsg()
                
                Switch $GUIMsg
                        Case $GUI_EVENT_CLOSE
                                ExitLoop
                                
                        Case $nButton
                                GUICtrlSetState($nButton, $GUI_DISABLE)
                                $iTimer = _Timer_SetTimer($hGUI, 10, "DRAWDC");每10毫秒更新滚动条
                                
                        Case $nButton2
                                MsgBox(0, "点击消息", "按钮2点击了", -1, $hGUI)
                                
 
                EndSwitch
        WEnd
 
EndFunc   ;==>Example
 
Func DRAWDC($hWnd, $iMsg, $iTimerId, $iTime)
        $Dx += 1;滚动条进一
        If $Dx > 100 Then;如果完成 ，清除定时器，还愿按钮状态
                $Dx = 0
                _Timer_KillTimer($hGUI, $iTimer)
                GUICtrlSetState($nButton, $GUI_ENABLE)
                GUICtrlSetState($nButton, $GUI_FOCUS)
                Return
        EndIf
        ;获取按钮DC，并建立兼容DC
        $hBtDC = _WinAPI_GetDC($cWnd)
        $hDC = _WinAPI_CreateCompatibleDC($hBtDC)
        $hSource = _WinAPI_CreateCompatibleBitmapEx($hBtDC, $myWidth, 3, _WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_3DFACE)))
        $hSv = _WinAPI_SelectObject($hDC, $hSource)
        ;在兼容DC在画滚动条红底
        $hBrush = _WinAPI_CreatePen($PS_INSIDEFRAME, 3, 0x0000ff)
        $hOldBrush = _WinAPI_SelectObject($hDC, $hBrush)
        _WinAPI_MoveTo($hDC, 0, 0)
        _WinAPI_LineTo($hDC, $myWidth, 0)
        _WinAPI_SelectObject($hDC, $hOldBrush)
        _WinAPI_DeleteObject($hBrush)
        ;在兼容DC上画滚动条上层绿色位置
        $hBrush = _WinAPI_CreatePen($PS_SOLID, 3, 0x00ff00)
        $hOldBrush = _WinAPI_SelectObject($hDC, $hBrush)
        _WinAPI_MoveTo($hDC, 0, 0)
        _WinAPI_LineTo($hDC, $Dx * $myWidth / 100, 0)
        _WinAPI_SelectObject($hDC, $hOldBrush)
        _WinAPI_DeleteObject($hBrush)
        ;拷贝兼容DC到按钮DC适当位置
        _WinAPI_BitBlt($hBtDC, $startxy, $cH - $startxy, $myWidth, 2, $hDC, 0, 0, $MERGECOPY)
        ;释放操作
        _WinAPI_SelectObject($hDC, $hSv)
        _WinAPI_DeleteObject($hSource)
        _WinAPI_DeleteDC($hDC)  
        _WinAPI_ReleaseDC($cWnd, $hBtDC)
EndFunc   ;==>DRAWDC