#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\recycle full.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\浏览器例子.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_requestedExecutionLevel=requireAdministrator
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
 
Global $Title = "启动手机软件就会push注册到服务器", $URLClick = 0
 
$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 679, 244, -1, -1, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
GUICtrlCreateLabel("请输入推送ID:", 10, 7, 87, 17)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Input1 = GUICtrlCreateInput("", 98, 2, 513, 21)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKRIGHT+$GUI_DOCKTOP+$GUI_DOCKHEIGHT)
$Button5 = GUICtrlCreateButton("查看 >", 614, 0, 65, 25, 0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateObj($oIE, 0, 25, 800, 244)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 


 
While 1
        $MouseInfo = GUIGetCursorInfo($Form1)
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] = $Input1 Then $URLClick = 1
        EndIf
        If $MouseInfo[2] = 1 Or $MouseInfo[3] = 1 Then
                If $MouseInfo[4] <> $Input1 And $MouseInfo[4] <> $Button5 Then $URLClick = 0
        EndIf
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
                                Exit
				Case $Button5 
                        _IENavigate($oIE, "http://121.199.60.164/tpns/apns.php?cmd=reg_mapping&token=a3dc0053a361eb8192904d3d407f8a09e169c5978ff1d24d8b021e7157433b29&uid=" & GUICtrlRead($Input1) & "&appid=com.lttkrx.push")
                        $URLClick = 0
        EndSwitch
WEnd
 
