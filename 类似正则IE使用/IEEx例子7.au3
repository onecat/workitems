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
;~ 模拟点击滚动条
;~ _IEScrollClick(滚动条所属对象, 模拟的动作)
;~ 模拟的动作：
;~ scrollbarHThumb Horizontal scroll thumb or box is at the specified location.
;~ scrollbarLeft Left scroll arrow is at the specified location.
;~ scrollbarPageDown Page-down scroll bar shaft is at the specified location.
;~ scrollbarPageLeft Page-left scroll bar shaft is at the specified location.
;~ scrollbarPageRight Page-right scroll bar shaft is at the specified location.
;~ scrollbarPageUp Page-up scroll bar shaft is at the specified location.
;~ scrollbarRight Right scroll arrow is at the specified location.
;~ scrollbarUp Up scroll arrow is at the specified location.
;~ scrollbarVThumb Vertical scroll thumb or box is at the specified location.
;~ down Composite reference to scrollbarDown.
;~ left Composite reference to scrollbarLeft.
;~ pageDown Composite reference to scrollbarPageDown.
;~ pageLeft Composite reference to scrollbarPageLeft.
;~ pageRight Composite reference to scrollbarPageRight.
;~ pageUp Composite reference to scrollbarPageUp.
;~ right Composite reference to scrollbarRight.
;~ up Composite reference to scrollbarUp.
 
#include <WindowsConstants.au3>
#include <IEEX.au3>
Opt("GUIResizeMode",1)
 
Global $oIE = _IECreateEmbedded()
Global $hGui = GUICreate("测试", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://au3.cc/")
 GUISetState() ;显示窗口
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;模拟点击滚动条向下5次
Local $doc = $oIE.document.documentElement
For $i = 1 To 5
        Sleep(1000)
         _IEScrollClick($doc,"down")
Next
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536  ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc

