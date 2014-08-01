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

Local $sPath = 'C:\Users\chtyfox\Desktop\板端'
Local $sPathNew = 'C:\Users\chtyfox\Desktop\待测试'

$aLine = _FileFinDir($sPath)
If @error Then Exit

For $i = 0 To UBound($aLine) - 1
        MsgBox(0, '', $sPathNew & '\' & $aLine[$i])
        DirCreate($sPathNew & '\' & $aLine[$i])
Next

Func _FileFinDir($_Path)
        $_Path = StringRegExpReplace($_Path, '^\s+|\\+$|\s+$', '')
        Local $sFiles
        __FileFinda($_Path, $sFiles)
        Local $iLen = StringLen($_Path) + 1 ;下面注释
		;-StringLen($FILE2) $FILE2 = StringRight($sPath, StringLen($sPath) - StringInStr($sPath, "\", 1, -1))得出来原目录，然后看看原目录的字符串数量来相减
        $sFiles = StringRegExpReplace($sFiles, '(?m)^.{' & $iLen & '}', '')
        Local $aLine = StringRegExp($sFiles, '\V+', 3)
        If @error Then Return SetError(1)
        Return $aLine
EndFunc   ;==>_FileFinDir

Func __FileFinda($sDir, ByRef $sOut)
        Local $hSearch = FileFindFirstFile($sDir & '\*')
        If $hSearch = -1 Then Return
        While 1
                Local $sFile = FileFindNextFile($hSearch)
                If @error Then ExitLoop
                If Not @extended Then ContinueLoop
                __FileFinda($sDir & '\' & $sFile, $sOut)
                $sOut &= $sDir & '\' & $sFile & @CRLF
        WEnd
        FileClose($hSearch)
EndFunc   ;==>__FileFinda