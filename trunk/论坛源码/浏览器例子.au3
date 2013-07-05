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
#include <StaticConstants.au3>
#include <IE.au3>
 
Global $Title = "史上最烂最无聊的浏览器", $URLClick = 0
 
_IEErrorHandlerRegister()
$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 800, 600, -1, -1, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button1 = GUICtrlCreateButton("后退", 0, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button2 = GUICtrlCreateButton("前进", 48, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button3 = GUICtrlCreateButton("刷新", 96, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Button4 = GUICtrlCreateButton("主页", 144, 0, 49, 25)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateGraphic(197, 2, 2, 23, BitOR($SS_NOTIFY,$SS_SUNKEN))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateLabel("转到:", 202, 7, 31, 17)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Input1 = GUICtrlCreateInput("http://www.google.com.hk/", 234, 2, 521, 21)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKRIGHT+$GUI_DOCKTOP+$GUI_DOCKHEIGHT)
$Button5 = GUICtrlCreateButton("Go >", 758, 0, 41, 25, 0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
GUICtrlCreateObj($oIE, 0, 25, 800, 575)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
AdlibRegister("Timer")
 
_IENavigate($oIE, "http://baidu.com")
 
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
                        If MsgBox(1 + 32, $Title, "确定要退出？") = 1 Then
                                AdlibUnRegister()
                                Exit
                        EndIf
                Case $Button1
                        _IEAction($oIE, "back")
                Case $Button2
                        _IEAction($oIE, "forward")
                Case $Button3
                        _IEAction($oIE, "refresh")
                Case $Button4
                        _IENavigate($oIE, "http://www.google.cn")
                Case $Button5 
                        _IENavigate($oIE, GUICtrlRead($Input1))
                        $URLClick = 0
        EndSwitch
WEnd
 
Func Timer()
        $WinPos = WinGetPos($Form1)
        If $WinPos[2] < 415 Then WinMove($Form1, "", $WinPos[0], $WinPos[1], 415, $WinPos[3])
        If $WinPos[3] < 61 Then WinMove($Form1, "", $WinPos[0], $WinPos[1], $WinPos[2], 61)
        If WinGetTitle($Form1) <> _IEPropertyGet($oIE, "title") Then
                If _IEPropertyGet($oIE, "title") = "" Then
                        WinSetTitle($Form1, "", _IEPropertyGet($oIE, "locationurl") & " - " & $Title)
                Else
                        WinSetTitle($Form1, "", _IEPropertyGet($oIE, "title") & " - " & $Title)
                EndIf
        EndIf
        If GUICtrlRead($Input1) <> _IEPropertyGet($oIE, "locationurl") And $URLClick = 0 Then GUICtrlSetData($Input1, _IEPropertyGet($oIE, "locationurl"))
EndFunc