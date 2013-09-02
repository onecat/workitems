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

$Msg = MsgBox(4 + 32, "建立宽带连接", "是否建立宽带连接？")
If $Msg = 7 Then
        Exit
Else
        Switch @OSVersion
                Case "WIN_7"
                        $rasphone = @AppDataDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk" ;当前用户 Application Data 目录所在路径
                        JLKD()
                Case "WIN_XP"
                        $rasphone = @AppDataCommonDir & "\Microsoft\Network\Connections\Pbk\rasphone.pbk"
                        JLKD()
        EndSwitch
EndIf

Func JLKD()
        FileOpen($rasphone, 1)
        If StringInStr(FileRead($rasphone), "[宽带连接]") = 0 Then
                FileWriteLine($rasphone, "[宽带连接]")
                FileWriteLine($rasphone, "Type=5")
                FileWriteLine($rasphone, "PreviewDomain=0")
                FileWriteLine($rasphone, "PreviewPhoneNumber=0" & @CRLF)
                FileWriteLine($rasphone, "NETCOMPONENTS=")
                FileWriteLine($rasphone, "ms_server=0")
                FileWriteLine($rasphone, "ms_msclient=0" & @CRLF)
                FileWriteLine($rasphone, "MEDIA=rastapi")
                FileWriteLine($rasphone, "Port=PPPoE6-0")
                FileClose($rasphone)
                FileCreateShortcut(@WindowsDir & "\system32\rasphone.exe", @DesktopDir & "\宽带连接.lnk", @WindowsDir,"-d, 宽带连接",@SystemDir & "\netshell.dll","","105")
                ;Run(@ComSpec & " /c " & 'rasphone -d ADSL', "", @SW_HIDE)
        Else
                MsgBox(64, "提示:", "宽带连接已建立,按确定退出!", 10)
                Exit
        EndIf
EndFunc   ;==>JLKD