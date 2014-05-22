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
#AutoIt3Wrapper_outfile=代理设置.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
Opt("TrayIconHide", 1) 
Example()
 
Func Example()
        Local $file, $btn, $btn2, $msg
 
        GUICreate(" 代理设置", 320, 60)
        WinSetOnTop(" 代理设置", '', 1)
        $file = GUICtrlCreateInput("", 10, 5, 300, 20)
        $btn = GUICtrlCreateButton("确定", 40, 35, 60, 20)
        $btn2 = GUICtrlCreateButton("删除", 120, 35, 60, 20)
        If RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings','ProxyEnable') = 0 Then
        GUICtrlCreateLabel('无使用代理服务器',190, 40)
        Else
        GUICtrlCreateLabel('正在使用代理服务器',190, 40)
        EndIf
        GUISetState()
 
        $msg = 0
        While 1
 
                $msg = GUIGetMsg()
                Select
                        Case $msg = $GUI_EVENT_CLOSE
                                Exit
                        Case $msg = $btn
                                If GUICtrlRead($file) = '' Then
                                        MsgBox(16, '警告', '请输入代理IP地址')
                                        ContinueLoop
                                Else
                                        $a = StringReplace(StringStripWS(GUICtrlRead($file), 3), " ", ":")
                                        RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000001)
                                        RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", $a)
                                        $a = Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE", '', @SW_HIDE)
                                        ProcessWait ($a)
                                        If ProcessExists($a) Then ProcessClose($a)
                                        GUICtrlCreateLabel('正在使用代理服务器',190, 40)
                                EndIf
                        Case $msg = $btn2
                                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable", "REG_DWORD", 0x00000000)
                                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyServer", "REG_SZ", "")
                                $a = Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE", '', @SW_HIDE)
                                ProcessWait ($a)
                                If ProcessExists($a) Then ProcessClose($a)
                                GUICtrlCreateLabel(' 无使用代理服务器',190, 40)
                EndSelect
        WEnd
 
EndFunc   ;==>Example
