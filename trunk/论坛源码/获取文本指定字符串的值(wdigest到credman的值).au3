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
#include <File.au3>
Local  $aFiles=@ScriptDir&"\HQMM.txt"
Local $bFiles=@ScriptDir&"\HQ.txt"
$aFile=FileOpen($aFiles)
$aFileStrings=FileRead($aFile)
$splitaFileStrings=StringSplit($aFileStrings,"wdigest :",1);获取wdigest值
For $i=1 To $splitaFileStrings[0];可以通过$i得出来的值来判断你需要的值第几次出现。如wdigest的值是第二次出现所以把$i改成2
     $pw = $splitaFileStrings[2];2是获取wdigest后面值
 Next
 $pws=StringSplit($pw,"credman :",1);获取credman值
 For $i=1 To $pws[0];可以通过$i得出来的值来判断你需要的值第几次出现。如credman的值是第一次出现所以把$i改成1
      $pwsd = $pws[1];1获取credman前面的制
 Next
FileClose($aFile)
;~ $bFile=FileOpen($bFiles)
;~ $bFileStrings=FileRead($bFile)
;~ $FinalString=$pwsd & @CRLF & $bFileStrings
;~ FileClose($bFiles)
;~ $bFile2=FileOpen($bFiles,2);以写入模式打开，先清空里面的数据
;~ FileWrite($bFile2,$FinalString)
;~ FileClose($bFile2)

