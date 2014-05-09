#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\mail-outlook.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\push推送测试工具.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
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
#include <StaticConstants.au3>
#include <IE.au3>
 
Global $Title = "push推送测试工具(显示外网IP地址才算可用推送)";, $URLClick = 0
 

$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 535, 560, -1, -1);, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button3 = GUICtrlCreateButton("刷新", 0, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateLabel("测试注意事项:测试1次后必须点击刷新在测试", 58, 7, 431, 17)
GUICtrlCreateObj($oIE, 0, 25, 800, 560)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
 
_IENavigate($oIE, "http://50.16.231.7/iotc/pl/uid.html")
 
While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
;~                         If MsgBox(1 + 32, $Title, "确定要退出？") = 1 Then
;~                                 AdlibUnRegister()
                                Exit
;~                         EndIf
                Case $Button3
                        _IEAction($oIE, "refresh")
        EndSwitch
WEnd