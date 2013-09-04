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
#include<ie.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
 
$oIE = _IECreateEmbedded()
$Form1 = GUICreate("专用", 750, 550, -1, -3,0x00070000); $WS_SIZEBOX)
$B1 = GUICtrlCreateButton("百度", 5, 90, 58, 25)
$B2 = GUICtrlCreateButton("新浪", 65, 90, 58, 25)
GUICtrlCreateLabel("", 5, 10, 740, 3, $SS_ETCHEDHORZ)
GUICtrlCreateLabel("Don't say let me to see what help files, can understand will not come" & @CRLF & _
                "here, can't, the brain stupid, will only pick up the ready-made", 10, 20)
GUICtrlCreateLabel("", 5, 80, 740, 3, $SS_ETCHEDHORZ)
 
$ClearEdit1 = GUICtrlCreateLabel("www.autoitx.com", 10, 57, 120)
GUICtrlSetFont($ClearEdit1, 10, 800)
GUICtrlSetColor($ClearEdit1, 0x000090)
 
$GUIActiveX = GUICtrlCreateObj($oIE, 0, 120, 750, 550) ; GUICtrlCreateObj($oIE, 0, 120, 1000, 1000)==>GUICtrlCreateObj($oIE, 0, 120, 750, 550)
GUICtrlSetResizing(-1, 1) ;添加了GUICtrlSetResizing(按照新窗口的大小重新设置窗口大小和坐标.)
GUISetState()
 
Local $hWndb, $sTafa = True, $sTafb = True
 
While 1
        $Pos = GUIGetCursorInfo($Form1)
        If Not @error Then _Hyperlink($Pos[4])
 
        $msg = GUIGetMsg()
        Select
                Case $msg = $GUI_EVENT_CLOSE
                        Exit
                Case $msg = $B1
                        _IENavigate($oIE, "http://www.baidu.com")
                Case $msg = $B2
                        _IENavigate($oIE, "http://www.sina.com.cn")
                Case $msg = $ClearEdit1
                        ShellExecute("www.autoitx.com")
        EndSelect
WEnd
 
Func _Hyperlink($hWnda)
        If $hWnda = 8 Then
                If $sTafb = True Then
                        GUICtrlSetFont($hWnda, 10, 800, 4)
;~                      GUICtrlSetColor($hWnda, 0x0080CC)
                        $hWndb = $hWnda
                        $sTafb = False
                        $sTafa = False
                EndIf
        Else
                If $sTafa = False Then
                        GUICtrlSetFont($hWndb, 10, 800)
;~                      GUICtrlSetColor($hWndb, 0x000000)
                        $sTafa = True
                        $sTafb = True
                EndIf
        EndIf
EndFunc   ;==>_Hyperlink