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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=ico\12.ICO
#AutoIt3Wrapper_Outfile=D:\定时器.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Description=程序定时运行器
#AutoIt3Wrapper_Res_Fileversion=2.0
#AutoIt3Wrapper_Res_LegalCopyright=crwmart
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>

Local $Runtime = 0, $sleep = 0, $Start = 0, $DJS, $sRun = 0, $EXEFile, $Stoptime, $Starttime, $TrayMini = 0, $sFile

Opt("TrayMenuMode", 1)
Local $item_0 = TrayCreateItem("显示界面")
TrayCreateItem("")
Local $item_1 = TrayCreateItem("退出")

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("程序定时运行", 326, 130, -1, -1)
$Input1 = GUICtrlCreateInput("", 8, 9, 249, 20)
$Button2 = GUICtrlCreateButton("...", 268, 8, 50, 22)
$Label1 = GUICtrlCreateLabel("运行该程序", 8, 44, 60, 14)
$Combo1 = GUICtrlCreateCombo("", 73, 40, 55, 25)
GUICtrlSetData($Combo1, "00:15|00:30|01:00|01:30|02:00|02:30|03:00", "01:00")
$Label2 = GUICtrlCreateLabel("( 时:分)后暂停", 131, 44, 84, 14)
$Combo2 = GUICtrlCreateCombo("", 220, 40, 55, 25)
GUICtrlSetData($Combo2, "00:15|00:30|01:00|01:30|02:00|02:30|03:00", "01:00")
$Label3 = GUICtrlCreateLabel("再运行", 280, 44, 36, 14)
$Label4 = GUICtrlCreateLabel("在以下时间段内不运行该程序:", 8, 75, 170, 14)
$Input2 = GUICtrlCreateInput("11:00", 177, 72, 40, 16)
$Input3 = GUICtrlCreateInput("13:00", 244, 72, 40, 16)
$Label5 = GUICtrlCreateLabel("至", 225, 75, 16, 14)
$Label6 = GUICtrlCreateLabel("期间", 292, 75, 24, 14)
$Button3 = GUICtrlCreateButton("托盘显示", 150, 100, 80, 22)
$Button1 = GUICtrlCreateButton("开始运行", 240, 100, 80, 22)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
 If $Start = 1 Then
  If $sRun = 0 Then
   Run($EXEFile)
   $sRun = 1
  EndIf
  If $DJS + $Runtime = (@HOUR * 3600 + @MIN * 60 + @SEC) Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 2
  EndIf
 EndIf
 If $Start = 2 Then
  If $sRun = 1 Then
   ProcessClose($sFile)
   $sRun = 0
  EndIf
  If $DJS + $sleep = (@HOUR * 3600 + @MIN * 60 + @SEC) Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 1
  EndIf
 EndIf
 If (@HOUR * 3600 + @MIN * 60 + @SEC) = $Stoptime Then
  If $Start = 1 Or $Start = 2 Then
   $Start = 0
   $sRun = 0
   ProcessClose($sFile)
  EndIf
 EndIf
 If (@HOUR * 3600 + @MIN * 60 + @SEC) = $Starttime Then
  If $Start = 0 Then
   $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
   $Start = 1
  EndIf
 EndIf
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE
   Exit
  Case $Button2
   $EXEFile = FileOpenDialog("选取一个可执行文件", @ProgramFilesDir & "\", "程序文件(*.exe)", 1 + 2)
   If $EXEFile <> "" Then GUICtrlSetData($Input1, $EXEFile)
  Case $Button3
   $TrayMini = 1
   GUISetState(@SW_HIDE, $Form1)
  Case $Button1
   If FileExists(GUICtrlRead($Input1)) Then
    $EXEFile = GUICtrlRead($Input1)
    $sFile = StringRegExpReplace($EXEFile, '.+\\', '')
    $Runtime = _Split(GUICtrlRead($Combo1))
    $sleep = _Split(GUICtrlRead($Combo2))
    $DJS = (@HOUR * 3600 + @MIN * 60 + @SEC)
    $Stoptime = _Split(GUICtrlRead($Input2))
    $Starttime = _Split(GUICtrlRead($Input3))
    $Start = 1
    $TrayMini = 1
    GUICtrlSetState($Button1, $GUI_DISABLE)
    GUISetState(@SW_HIDE, $Form1)
   Else
    MsgBox(0, "错误", "所运行的程序不存在，请重新选择！")
   EndIf
 EndSwitch
 $Traymsg = TrayGetMsg()
 If $Traymsg = $item_0 And $TrayMini = 1 Then
  GUISetState(@SW_SHOW, $Form1)
  $TrayMini = 0
 ElseIf $Traymsg = $item_1 Then
  Exit
 EndIf
 _ReduceMemory(@AutoItPID)
WEnd

Func _Split($Time)
 If $Time <> "" Then
  Local $Data = StringSplit($Time, ":")
  If IsArray($Data) And Not @error Then
   Return $Data[1] * 3600 + $Data[2] * 60
  EndIf
 EndIf
EndFunc   ;==>_Split

Func _ReduceMemory($i_PID = -1);整理内存
 If $i_PID <> -1 Then
  Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
  Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
  DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
 Else
  Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
 EndIf
 Return $ai_Return[0]
EndFunc   ;==>_ReduceMemory