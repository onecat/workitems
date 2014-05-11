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

#include <IE.au3>
#include <MSHtml.au3>
Local $doc = _MHDocGetObj() ;创建document对象
_MHNavigate($doc, "http://www.baidu.com",4) ;网上获取百度源码并加载到mshtml,4 utf8编码转换

;取对象只提供这两种方法，其它基本跟IE的一样
;推荐使用IEEX.au3提供的通用获取元素方法
;~ $kw = _IEQuery($doc,"input","id=kw") ;需要#include <IEEX.au3>
;~ $kw = _MHGetObjById($doc, "kw") ;id方法
Local $kw = _MHGetObjByName($doc, "wd",1) ;name取输入框对象

;下面基本跟IE方法一样
Local $sHtml = _IEPropertyGet($kw,"outerhtml") ;取输入框html源码
MsgBox(0,"对象html源码",$sHtml)
Local $su = _MHGetObjById($doc,"seth") ;id方法对象
Local $sText = _IEPropertyGet($su,"outertext") ;取显示文本
MsgBox(0,"对象显示文本",$sText)