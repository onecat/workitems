#region ACN预处理程序参数(常用参数)
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
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <array.au3>
#include <file.au3>
Local $aA, $aB
_FileReadToArray('2.txt', $aA)
$aB = _ArrayFindAll($aA, 'Mobile', 0, 0, 0, 1)

$file = FileOpen('3.txt', 2)
For $i = 0 To UBound($aB) - 1
	FileWrite('3.txt', $aA[$aB[$i]] & @CRLF)
Next
_ReplaceStringInFile('3.txt','"','')

FileClose($file)



;删除搜索出来的字符串
;~ Local $aA, $aB
;~ _FileReadToArray('2.txt', $aA)
;~ $aB = _ArrayFindAll($aA, 'Linux', 0, 0, 0, 1)

;~  $file = FileOpen('1.txt', 2)
;~ For $i = 0 To UBound($aA) - 1
;~ 	If _ArraySearch($aB, $i) = -1 Then 
;~ 	FileWrite('1.txt', $aA[$i] & @CRLF)
;~  EndIf
;~ Next

;~ _ReplaceStringInFile('1.txt','"','')



;~ FileClose($file)
;~ FileDelete(@ScriptDir & "\2.txt")
;~ FileMove(@ScriptDir & "\1.txt",@ScriptDir & "\2.txt")

