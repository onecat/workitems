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
Global $Paused
HotKeySet("{F2}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("{F1}", "MouseC")

While 1
   Sleep(500)
WEnd

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
		$t = IniRead ( @ScriptDir & "\myfile.ini", "运行", "次数", "" )
		;MsgBox(0,"脚本暂停中", "运行次数" & MouseC())
        ToolTip('脚本暂停中' & "脚本运行到第" & $t & "次" ,250,250)
    WEnd
    ToolTip("")
EndFunc;


Func Terminate()
    Exit 0
EndFunc 

Func MouseC()
Local $i = 1
While $i <= 6000
WinActivate("车辆智能监管系统","")
ControlClick("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,422, 93)
ControlSend ("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("车辆智能监管系统","")
ControlClick("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,440, 121)
ControlSend ("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("车辆智能监管系统","")
ControlClick("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,910, 65)
ControlSend ("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
WinActivate("车辆智能监管系统","")
ControlClick("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",2,881, 93)
ControlSend ("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]",$i)
Sleep(500)
ControlClick("车辆智能监管系统","","[CLASS:Qt5QWindowIcon; INSTANCE:11]","left",1,585, 185)
Sleep(500)

IniWrite(@ScriptDir & "\myfile.ini", "运行", "次数",$i)

If Not ProcessExists("SmartGIS.exe")  Then
	IniWrite(@ScriptDir & "\myfile.ini", "崩溃啦", "崩溃","第" &  $i & "次崩溃")
	Exit
EndIf	

WinActivate("车辆智能监管系统","")
If Not WinExists ("车辆智能监管系统","")  Then
	IniWrite(@ScriptDir & "\myfile.ini", "崩溃啦", "崩溃","第" &  $i & "次崩溃")
	Exit
EndIf	

 $i = $i + 1
WEnd
Exit
EndFunc 