#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\mc.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\检测SN ID工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.8
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
 
Global $Title = "检测SN ID工具(DVR必须和电脑同一个局域网)"
 

$oIE = _IECreateEmbedded()
 
$Form1 = GUICreate($Title, 549, 562, -1, -1);, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS))
$Button1 = GUICtrlCreateButton("地址1", 0, 0, 49, 25)
$Button2 = GUICtrlCreateButton("地址2", 56, 0, 49, 25)
$Button3 = GUICtrlCreateButton("地址3", 112, 0, 49, 25)
$Button4 = GUICtrlCreateButton("地址4", 168, 0, 49, 25)
$Button5 = GUICtrlCreateButton("查看结果", 360, 30, 65, 25)
$Label1 = GUICtrlCreateLabel("地址1-地址4其中一个能出现外网IP地址即可,然后查看结果", 224, 8, 316, 17)
$Label2 = GUICtrlCreateLabel("请输入DVR SN ID(如sn12345678)", 0, 37, 180, 17)
$Input1 = GUICtrlCreateInput("", 184, 32, 161, 21)
$IE = GUICtrlCreateObj($oIE, 0, 56, 800, 562)
GUICtrlSetState($IE, $GUI_DISABLE)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKTOP+$GUI_DOCKBOTTOM)
GUISetState(@SW_SHOW)
 
 
;_IENavigate($oIE, "http://50.16.231.7/iotc/pl/uid.html")
 
While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE
						Exit
					Case $Button1	
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.checkrealip.com")	
					Case $Button2
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.dynamic.zoneedit.com/checkip.htmll")	
					Case $Button3
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.networksecuritytoolkit.org/nst/tools/ip.php")
					Case $Button4
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.checkip.dyndns.org")				
					Case $Button5
						RunWait(@ComSpec & ' /c ' & 'RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8', '', @SW_HIDE)
						_IENavigate($oIE, "http://www.anlian.co/queryinfo.php?DevID=" & GUICtrlRead($Input1))			
        EndSwitch
WEnd