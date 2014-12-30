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

;程序名锁定
$name = "远程桌面(chty40).exe"
_File_NameLock($name)
;$name = 你锁定的程序名
;       如果当前程序名与你设定的文件名不一至
;       此函数将自动还原程序名
;       注:使用时放到 你程序的开头
;绿色风's Blog  [url]www.JianYiIT.com[/url]
;                               2014/11/8 
Func _File_NameLock($name)
        If @ScriptName <> $name Then ;如果程序名 不是 
                Local $str = "@echo off" & @CRLF
                $str &= "ping -n 3 127.0.0.1>nul" & @CRLF ;延时 大约3秒
                $str &= 'ren "' & @ScriptName & '" '&$name & @CRLF ;改名 还原程序名
                $str &= "ping -n 1 127.0.0.1>nul" & @CRLF ;延时 大约1秒
                $str &= "start "&$name & @CRLF ;重新启动 程序
                $str &= "del /f /q %0" & @CRLF ;删除临时文件
                $str &= "exit"
                Local   $file = @ScriptDir & "\"&$name&".ren.bat"
                FileDelete($file) ;预删除临时文件
                FileWrite($file, $str) ;写入临时文件
                Run($file, "", @SW_HIDE) ;调用临时文件
                Exit ;退出
        EndIf
EndFunc   ;==>_File_NameLock
