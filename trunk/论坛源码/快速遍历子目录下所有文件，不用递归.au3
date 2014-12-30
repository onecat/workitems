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

$sDir = "c:\windows"

$t = TimerInit()
$sFiles = _FileListEx($sDir)
Select
Case @error
        ConsoleWrite("原始文件夹不存在"&@crlf)
Case $sFiles
        $aFiles = StringSplit($sFiles, "|")
        ConsoleWrite("耗时:"&TimerDiff($t)/1000&"秒,共有文件数:"&$aFiles[0]&@CRLF);耗时:1.04020835328356秒,共有文件数:9250
        ;$aFiles[1..n]: 带路径的文件名
Case Else;$sFiles=""
        ConsoleWrite("没有找到文件"&@CRLF)
EndSelect




Func _FileListEx($sDir)
        If StringInStr(FileGetAttrib($sDir),"D")=0 Then Return SetError(1,0,"")
        
        Local $oFSO = ObjCreate("Scripting.FileSystemObject")
        Local $objDir

        Local $aDir = StringSplit($sDir, "|", 2)
        Local $iCnt = 0
        Local $sFiles = ""
        Do
                $objDir = $oFSO.GetFolder($aDir[$iCnt])
                For $aItem In $objDir.SubFolders
                        ;扩展应用改下这句, 如指定文件夹 If StringInStr($aItem.Name, "XXX") Then
                        $sDir &= "|" & $aItem.Path
                        ;文件夹层数可以通过 StringReplace($aItem.Path, "\", "", 0, 1)的@extended值来判断
                Next
                ;如果仅找文件夹,不找文件,$sFiles的语句都不用,最后是 Return $sDir
                For $aItem In $objDir.Files
                        ;扩展应用改下面这句
                        $sFiles &= $aItem.Path & "|"
                        ;例如要找文件名中包含"kb"(不分大小写),改为: if StringInStr($aItem.Name, "kb") Then $sFiles &= $aItem.Path & "|"
                        ;其他应用请参照上例修改: $aItem.XXX
                        ;Attributes        设置或返回文件或文件夹的属性
                        ;DateCreated   返回指定的文件或文件夹的创建日期和时间。只读
                        ;DateLastAccessed 返回指定的文件或文件夹的上次访问日期(和时间)。只读
                        ;DateLastModified 返回指定的文件或文件夹的上次修改日期和时间。只读
                        ;ShortName   返回按照早期8.3文件命名约定转换的短文件名
                        ;ShortPath   返回按照早期8.3命名约定转换的短路径名
                        ;Size    对于文件返回指定文件的字节数；对于文件夹，返回文件夹所有的文件夹和子文件夹的字节数
                                ;Type    返回文件或文件夹的类型信息
                Next
                $iCnt += 1
                If UBound($aDir) <= $iCnt Then $aDir = StringSplit($sDir, "|", 2)
        Until UBound($aDir) <= $iCnt
        If $sFiles Then $sFiles = StringTrimRight($sFiles, 1);去掉最右边"|"
        Return $sFiles
EndFunc