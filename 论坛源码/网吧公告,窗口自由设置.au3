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

#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
Dim $GetFile = @ScriptDir & "\Status.ini", $GetStatus = "公告状态"
If Not FileExists($GetFile) Then
        ;        MsgBox(48,"温馨提醒您:", "未找到程序配置文件,程序将自动创建."& @CRLF &"请将文件内的服务器路径修改成自己的实际路径.")
        IniWrite($GetFile, $GetStatus, "是否开启", "是")
        IniWrite($GetFile, $GetStatus, "窗口宽度", "300")
        IniWrite($GetFile, $GetStatus, "窗口高度", "200")
        IniWrite($GetFile, $GetStatus, "网吧标题", "网吧欢迎您")
        IniWrite($GetFile, $GetStatus, "公告标题", "网吧最新公告")
        IniWrite($GetFile, $GetStatus, "字体颜色", "0xB50101")
        IniWrite($GetFile, $GetStatus, "字体大小", "9")
        IniWrite($GetFile, $GetStatus, "延时关闭", "30")
        IniWrite($GetFile, $GetStatus, "使用字体", "宋体")
        IniWrite($GetFile, $GetStatus, "更新时间", "2011-03-08")
        IniWrite($GetFile, $GetStatus, "公告路径", "\\game\zh29$\Notice")
EndIf

;定义变量
Global $Switch = IniRead($GetFile, $GetStatus, "是否开启", "")
Global $Width = IniRead($GetFile, $GetStatus, "窗口宽度", "")
Global $Height = IniRead($GetFile, $GetStatus, "窗口高度", "")
Global $WbTitle = IniRead($GetFile, $GetStatus, "网吧标题", "")
Global $NtTitle = IniRead($GetFile, $GetStatus, "公告标题", "")
Global $Color = IniRead($GetFile, $GetStatus, "字体颜色", "")
Global $Size = IniRead($GetFile, $GetStatus, "字体大小", "")
Global $GetTime = IniRead($GetFile, $GetStatus, "延时关闭", "")
Global $Fonts = IniRead($GetFile, $GetStatus, "使用字体", "")
Global $GetDate = IniRead($GetFile, $GetStatus, "更新时间", "")
Global $GetPath = IniRead($GetFile, $GetStatus, "公告路径", "")
Global $Content = IniRead($GetFile, $GetStatus, "公告内容", "")
Global $Reate = GUICreate($WbTitle, $Width, $Height, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_POPUP, $WS_GROUP), BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST, $WS_EX_WINDOWEDGE), WinGetHandle(AutoItWinGetTitle()))
If $Switch <> "是" Then _Exit()
If FileExists($GetPath) Then
        If StringRight($GetPath, 3) <> "txt" Then $GetPath = $GetPath & "\网吧公告.txt"
        If FileExists($GetPath) Then
                FileCopy($GetPath, @ScriptDir & "\Status.txt", "1")
                $GetPath = @ScriptDir & "\Status.txt"
                Global $ReadTxt = FileRead($GetPath, FileGetSize($GetPath))
        Else
                Global $ReadTxt = $Content
        EndIf
Else
        Global $ReadTxt = $Content
EndIf

Global $Group = GUICtrlCreateGroup("", 5, 28, $Width - 10, $Height - 50);美化框

Global $Label = GUICtrlCreateLabel($NtTitle, 10, 10, $Width - 20, 20);标题栏
GUICtrlSetStyle(-1, 0x01)
GUICtrlSetFont(-1, 12, 800, 0, $Fonts)
GUICtrlSetColor(-1, 0xff0000)

Global $Edit1 = GUICtrlCreateEdit("", 10, 40, $Width - 21, $Height - 69, $ES_READONLY, 0)
GUICtrlSetData(-1, StringFormat($ReadTxt))
GUICtrlSetFont(-1, $Size, 0, 0, $Fonts)
GUICtrlSetColor(-1, $Color)

;Global $Labe2 = GUICtrlCreateLabel($GetDate, 343, 453, 100, 15);读取INI文件的更新时间信息
;GUICtrlSetColor(-1, $Color)

Global $Time_Labe1 = GUICtrlCreateLabel("", 8, $Height - 16, $Width - 95, 20);时间倒计时控件
GUICtrlSetColor(-1, 0xff0033);设置控件文本颜色
Global $Time_Labe2 = GUICtrlCreateButton("暂停", $Width - 90, $Height - 22, 40, 20)
Global $Time_Labe3 = GUICtrlCreateButton("关闭", $Width - 45, $Height - 22, 40, 20)


GUISetState(@SW_SHOW);调整窗口的状态,@SW_SHOW表示"使已隐藏窗口显示出来"
If $GetTime > 1 Then AdlibRegister("time", 1000)
If $GetTime = "" Or $GetTime <= 0 Then GUICtrlSetState($Time_Labe2, $GUI_HIDE)
If $GetTime > 1 Then Global $x = $GetTime

While 1;基于表达式循环
        $nMsg = GUIGetMsg();捕获窗口消息
        Select;条件选择语句
                Case $nMsg = $GUI_EVENT_CLOSE
                        _Exit()
                Case $nMsg = $Time_Labe2
                        If GUICtrlRead($Time_Labe2) = "暂停" Then
                                AdlibUnRegister()
                                GUICtrlSetData($Time_Labe2, "继续")
                                GUICtrlSetData($Time_Labe1, "已关闭自动倒计时退出程序.")
                        Else
                                AdlibRegister("time", 1000)
                                GUICtrlSetData($Time_Labe2, "暂停")
                        EndIf
                Case $nMsg = $Time_Labe3
                        _Exit()
        EndSelect
WEnd

Func Time();倒计时执行语句
        If $x = 0 Then
                _Exit()
        EndIf
        GUICtrlSetData($Time_Labe1, "程序将在 " & $x & " 秒后自动关闭.")
        $x -= 1
EndFunc   ;==>Time

;------------------------------关闭窗口调用---------------------------------------------------------
Func _Exit()
        DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $Reate, "int", 500, "long", 0x00090000)
        Exit
EndFunc   ;==>_Exit