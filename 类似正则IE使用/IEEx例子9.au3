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
;~ 脚本解析器执行脚本并返回值
;~ _IEDoScript("添加代码","执行函数",语言 = "javascript")
;~ 成功返回函数返回值
;~ 失败返回0
 
;无需打开浏览器也可以
#include <IEEX.au3>
$string = _ 
'function myfunction(arg1, arg2){' & @CRLF & _
'   var r;' & @CRLF & _
'   r = arg1 * arg2;' & @CRLF & _
'   return(r);' & @CRLF & _
'}'
 
$sum = _IEDoScript($string,'myfunction(3,4)')
 
MsgBox(0,"3*4",$sum)
 
$string = _ 
'function eurl(URIString){' & @CRLF & _
'   var r;' & @CRLF & _
'   r = encodeURI(URIString);' & @CRLF & _
'   return(r);' & @CRLF & _
'}'
 
$url = _IEDoScript($string,'eurl("http://www.baidu.com/s?wd=双色球")')
MsgBox(0,"url编码",$url)

