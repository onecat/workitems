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

Opt("TrayMenuMode", 1)
dim $oldver,$newver,$sFile1,$aArray1 ,$aArray,$sFile,$Input_Down
$sFile1 = @ScriptDir & "\ver.txt" ;<--你要读的文件
$aArray1 = StringSplit(FileRead($sFile1), @CRLF, 1)
$oldver=$aArray1[1]
;$oldver= FileGetVersion("我的程序.exe")
Reate_update($oldver)
 Func Reate_update($oldver)
                if InetGetSize("http://www.43979.cn/ver.txt")>0 then   ;<--判断是否连网或是否服务器能连上
        InetGet("http://www.43979.cn/ver.txt", @ScriptDir & "\ver.txt", 1, 1)   ;<--下载版本信息
        TraySetState(4)
        While @InetGetActive
                TrayTip("正在检查新版本", "目前版本为"&$oldver&",正在检查新版本", 1)
        WEnd
        
        TraySetState(8)

$sFile = @ScriptDir& "\ver.txt" ;<--你要读的文件
$aArray = StringSplit(FileRead($sFile), @CRLF, 1)
$newver=$aArray[1]
        TrayTip("最新版本为"&$newver,  "最新版本为"&$newver, 1)
        if $newver<>$oldver then
        If Not IsDeclared("iMsgBoxAnswer2") Then Local $iMsgBoxAnswer2
$iMsgBoxAnswer2 = MsgBox(1,"提示有最新版本存在","当前版本为"&$oldver&" ，最新版本为"&$newver & @CRLF & "是否自动更新，按确定按钮更新" & @CRLF & "取消按钮不更新")
Select
        Case $iMsgBoxAnswer2 = 1 ;OK
Reate_down()
        Case $iMsgBoxAnswer2 = 2 ;Cancel
exit
EndSelect
        
        
Else
        TrayTip("当前版本为最新版本",  "当前版本为最新版本，暂时不需要更新", 1)        
exit

endif
Else
TrayTip("获取版本失败",  "获取版本失败", 1)        
exit
endif
EndFunc


         Func Reate_down()
                if InetGetSize("http://www.43979.cn/main.exe")>0 then
        InetGet("http://www.43979.cn/main.exe", @ScriptDir & "\我的程序.exe", 1, 1)
        TraySetState(4)
        While @InetGetActive
                TrayTip("正在下载最新版本", "正在下载最新版本", 1)
        WEnd
        
        TraySetState(8)
        TrayTip("获取新版本成功",  "获取新版本成功", 1)        
        
                exit
Else
TrayTip("获取新版本失败",  "获取新版本失败，启动老版本", 1)        

        exit
endif
EndFunc