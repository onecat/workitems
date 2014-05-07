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
#include <WindowsConstants.au3>
Local $Pic = RegRead('HKLM\SOFTWARE\AutoIt v3\AutoIt', 'InstallDir') & '\Examples\GUI\msoobe.jpg'
If Not FileExists($Pic) Then Exit MsgBox(48, '', '图片不存在，请检查')
Local $hGUI = GUICreate('不闪...@afan', 380, 200, -1, -1, $WS_POPUP, $WS_EX_LAYERED)
GUICtrlCreatePic($Pic, -5, 0, 380 + 5, 200, -1, 0x00100000)
GUISetState()
Local $hCGui = GUICreate('', 300, 230, 0, 10, $WS_POPUP, $WS_EX_LAYERED + $WS_EX_MDICHILD, $hGUI)
GUISetBkColor(0x333333, $hCGui)
GUICtrlCreateLabel('Esc 键退出', 10, 0, 350, 12)
GUICtrlSetColor(-1, 0xEEEEEE)
Local $iLabel2 = GUICtrlCreateLabel('       ..........', 80, 110, 350, 20)
GUICtrlSetFont(-1, 12, 800, -1, '微软雅黑')
GUICtrlSetColor(-1, 0xFFFFFF)
_API_SetLayeredWindowAttributes($hCGui, 0x333333, 200)
GUISetState()
Local $sTime, $x = AdlibRegister('_MTimer', 100)
Do
Until GUIGetMsg() = -3
Func _MTimer() ;设置时钟
        Local $Time = StringFormat('%02s 时, %02s 分, %02s 秒, %02s 毫秒', @HOUR, @MIN, @SEC, @MSEC)
        If $sTime <> $Time Then ControlSetText($hCGui, '', $iLabel2, $Time)
        $sTime = $Time
EndFunc   ;==>_MTimer
Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255) ;设置前景窗口透明
        $i_transcolor = Hex(String($i_transcolor), 6)
        $i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
        DllCall('user32.dll', 'int', 'SetLayeredWindowAttributes', 'hwnd', $hwnd, 'long', $i_transcolor, 'byte', $Transparency, 'long', 3)
EndFunc   ;==>_API_SetLayeredWindowAttributes


