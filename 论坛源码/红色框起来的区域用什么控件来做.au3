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

#include <GuiStatusBar.au3>
 
Global Const $WM_SIZE = 0x05
Global Const $WM_GETMINMAXINFO = 0x0024
Global Const $GUI_RUNDEFMSG = 'GUI_RUNDEFMSG'
 
$width = 588
$hight = 500
 
$pichight = 459
$labelhight = 460
$labelhight2 = 80
 
$GUI = GUICreate('Low Cost Gramload Tester Program (Ver2.2A)', $width, $hight, -1, -1, 0x00070000)
 
$menu1 = GUICtrlCreateMenu("&File")
$menu2 = GUICtrlCreateMenu("Set-&Up")
$menu3 = GUICtrlCreateMenu("&Production")
$menu4 = GUICtrlCreateMenu("&Window")
$menu5 = GUICtrlCreateMenu("&Help")
 
GUICtrlCreatePic("", 0, -1, $width, $hight - $pichight, 0x08000000, 0x0007)
GUICtrlSetResizing(-1, 512 + 32)
 
$ico1 = GUICtrlCreateIcon("shell32.dll", -1, 5, 2, 32, 32, -1, 0x0007)
GUICtrlSetResizing(-1, 770 + 32)
$ico2 = GUICtrlCreateIcon("shell32.dll", -2, 38, 2, 32, 32, -1, 0x0007)
GUICtrlSetResizing(-1, 770 + 32)
$ico3 = GUICtrlCreateIcon("shell32.dll", -3, 70, 2, 32, 32, -1, 0x0007)
GUICtrlSetResizing(-1, 770 + 32)
$ico4 = GUICtrlCreateIcon("shell32.dll", -4, 102, 2, 32, 32, -1, 0x0007)
GUICtrlSetResizing(-1, 770 + 32)
 
$Graphic = GUICtrlCreateGraphic(0, $hight - $labelhight, $width, $hight - $labelhight2, -1)
GUICtrlSetBkColor(-1, 0x848285)
GUICtrlSetResizing(-1, 32)
 
$hStatus = _GUICtrlStatusBar_Create($GUI, -1, '', $SBARS_SIZEGRIP, 0x0007)
;===============================================================================
_GUICtrlStatusBar_SetParts($hStatus, -1)
 
GUISetState()
 
;注册Windows消息函数
GUIRegisterMsg($WM_SIZE, "WM_SIZE")
GUIRegisterMsg($WM_GETMINMAXINFO, "WM_GETMINMAXINFO")
 
While 1
        $msg = GUIGetMsg()
        Select
                Case $msg = -3
                        Exit
                Case $msg = $ico1
                        ButtonAnime($GUI, $ico1)
                Case $msg = $ico2
                        ButtonAnime($GUI, $ico2)
                Case $msg = $ico3
                        ButtonAnime($GUI, $ico3)
                Case $msg = $ico4
                        ButtonAnime($GUI, $ico4)
        EndSelect
WEnd
 
Func ButtonAnime($_Hwd, $_Botton)
        Local $_pos = ControlGetPos($_Hwd, "", $_Botton)
        GUICtrlSetPos($_Botton, $_pos[0] + 1, $_pos[1] + 1)
        Sleep(100)
        GUICtrlSetPos($_Botton, $_pos[0], $_pos[1])
EndFunc   ;==>ButtonAnime
 
 
;根据窗口大小，调整状态栏
Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
        #forceref $hWnd, $iMsg, $iwParam, $ilParam
        _GUICtrlStatusBar_Resize($hStatus)
        GUICtrlSetPos($Graphic, 0, $hight - $labelhight, @DesktopWidth * 3, @DesktopHeight * 3)
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE
 
Func WM_GETMINMAXINFO($hWnd, $msg, $wparam, $lparam)
        Local $tagMINMAXINFO = "int;int;int;int;int;int;int;int;int;int"
        $MINMAXINFO = DllStructCreate($tagMINMAXINFO, $lparam)
        DllStructSetData($MINMAXINFO, 7, 300) ;minx
        DllStructSetData($MINMAXINFO, 8, 200) ;miny
        DllStructSetData($MINMAXINFO, 9, @DesktopWidth) ;maxx
        DllStructSetData($MINMAXINFO, 10, @DesktopHeight - 30) ;maxy
EndFunc   ;==>WM_GETMINMAXINFO