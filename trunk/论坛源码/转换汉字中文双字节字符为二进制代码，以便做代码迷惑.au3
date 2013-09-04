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

;============这一段可用于支持直接拖放文件至本脚本图标即可自动转换========;
If $CmdLine[0] > 0 Then
        For $i = 1 To $CmdLine[0]
                _FileReplaceWcharToBinary(FileGetLongName($CmdLine[$i]))
        Next
EndIf
;========================================================================;

Func _FileReplaceWcharToBinary($sFile, $OutFlag = 1, $sFileNew = '')
        ;afan提示：本函数用于将au3文件中含有双字节字符的引号内字符串转换为二进制代码，以便做代码迷惑
        ;$sFile - au3文件路径
        ;$OutFlag - 输出标志。=1(默认) 输出转换后的文件；=2 返回转换后的字符串
        ;$sFileNew - 转换后的au3文件路径, 留空(默认)则默认输出为“原au3文件名_转换后.au3”
        ;返回值 - 正确：根据标志输出转换后的文件或返回转换后的字符串
        ;　　　 - 错误：返回空。并设置@Error =1 不包含引号双字节字符
        Local $str = FileRead($sFile)
        Local $aSR = StringRegExp($str, '("|' & "')(?:(?!\1).)*?[^\x00-\xff](?:(?!\1).)*\1", 4)
        If @error Then Return SetError(1, 0, '') ;---- 不包含引号双字节字符，返回错误及空字符串
        Local $i, $aTmp = 0, $_s = ''
        For $i = 0 To UBound($aSR) - 1
                $aTmp = $aSR[$i]
                $_s = StringTrimRight(StringTrimLeft($aTmp[0], 1), 1)
                $Str = StringReplace($Str, $aTmp[0], 'BinaryToString("' & StringToBinary($_s) & '")')
        Next

        If $OutFlag = 2 Then Return $str
        If $sFileNew = '' Then $sFileNew = StringTrimRight($sFile, 4) & '_转换后.au3'
        FileDelete($sFileNew)
        FileWrite($sFileNew, $str)
EndFunc   ;==>_FileReplaceWcharToBinary