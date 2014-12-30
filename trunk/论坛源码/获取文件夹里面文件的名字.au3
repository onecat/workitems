#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=1.0.0.1
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
;=============================
;例子1:显示当前目录中所有文件的文件名
;=============================
$path = FileSelectFolder("选择烧录程序文件夹", "", 2)
If @error = 1 Then Exit
Local $hSearch = FileFindFirstFile($path & "\*.*")

; 检查搜索是否成功
If $hSearch = -1 Then
    MsgBox(4096, "错误", "没有文件/目录 匹配搜索")
    Exit
EndIf

While 1
    Local $sFile = FileFindNextFile($hSearch)
    If @error Then ExitLoop

    MsgBox(4096, "找到的文件:", $sFile)
WEnd

; 关闭搜索句柄
FileClose($hSearch)

;~ ;=============================
;~ ;例子2:递归查找当前目录及其子目录下的所有文件
;~ ;=============================
;~ FindAllFile(@ScriptDir)
;~ Func FindAllFile($sDir)
;~     Local $hSearch = FileFindFirstFile($sDir & "\*.*")
;~     ; 检查搜索是否成功
;~     If $hSearch = -1 Then Return
;~     While 1
;~         Local $sFile = FileFindNextFile($hSearch)
;~         If @error Then ExitLoop
;~         
;~         If @extended Then 
;~             FindAllFile($sDir & "\" & $sFile)
;~             ContinueLoop
;~         EndIf
;~         FileWriteLine("找到的文件.txt",$sDir & "\" & $sFile)
;~     WEnd
;~     ; 关闭搜索句柄
;~     FileClose($hSearch)
;~ EndFunc
