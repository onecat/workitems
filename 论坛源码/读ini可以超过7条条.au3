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

#include <Array.au3>

Const $sFilePath = @ScriptDir & "\Config.ini"
Local $aList = __IniReadToArray($sFilePath, 'FastStart')
_ArrayDisplay($aList, '')

;===================读'|'分隔符非标准ini文件成二维数组的函数==================================
Func __IniReadToArray($sIniFile, $Section, $sDecimal = '|')
        ;ini文件路径        ;字段名        ;分隔符
        Local $sIni = FileRead($sIniFile)
        Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
        $_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
        $sIni = StringRegExpReplace($sIni, '(?mi)[\s\S]*?^\h*\[' & $_Section & '\]\V*\v+([\s\S]+?)(?=\r\n\h*\[|\z)[\s\S]*', '\1')
        Local $aLine = StringRegExp($sIni, '\V+', 3)
        If @error Then Return SetError(1)
        Local $i, $afg, $j, $iMax = 1, $iC = 1
        Local $aData[UBound($aLine)][$iMax]
        For $i = 0 To UBound($aLine) - 1
                $afg = StringSplit($aLine[$i], $sDecimal, 1)
                For $j = 1 To $afg[0]
                        If $afg[0] > $iMax Then
                                $iMax = $afg[0]
                                ReDim $aData[UBound($aData)][$iMax]
                        EndIf
                        $aData[$i][$j - 1] = $afg[$j]
                Next
        Next
        ReDim $aData[UBound($aData)][$iMax]
        Return $aData
	EndFunc   ;==>__IniReadToArray
	
	
;ini
;Config.ini
#cs
[FastStart]
mydn|explorer|::{20D04FE0-3AEA-1069-A2D8-08002B30309D} ||||||我的电脑
hsz|explorer|::{645FF040-5081-101B-9F08-00AA002F954E} ||||||回收站
wslj|explorer|::{208D2C60-3AEA-1069-A2D7-08002B30309D} ||||||网上邻居
wllj|explorer|::{7007ACC7-3202-11D1-AAD2-00805FC1270E} ||||||网络连接
print|explorer|::{2227A280-3AEA-1069-A2DE-08002B30309D} ||||||打印机与传真
rwjh|explorer|::{D6277990-4C6A-11CF-8D87-00AA0060F5BF} ||||||任务计划
bd|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.baidu.com/baidu?wd=%s&cl=3
gg|C:\Program Files\Mozilla Firefox\firefox.exe|https://www.google.com.hk/search ... 2.2.484.v3a8e3RZXxU
dict|C:\Program Files\Mozilla Firefox\firefox.exe|http://dictionary.reference.com/search?q=%s
iciba|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.iciba.com/search?s=%s&t=word&lang=utf-8
mywd|explorer|::{450D8FBA-AD25-11D0-98A8-0800361B1103} ||||||我的文档
sx|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.acronymfinder.com/af- ... xact&Acronym=%1|||||||缩写搜索
fy|C:\Program Files\Mozilla Firefox\firefox.exe|http://fanyi.baidu.com/translate#en/zh/%s
lx|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.55188.com/forum-68-1.html
chen|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.worldlingo.com/wl/mst ... %s&wlg_table=-3 
ruen|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.translate.ru/url/tran ... 0&psubmit2.y=12
gh|C:\Program Files\Mozilla Firefox\firefox.exe|https://vip.icbc.com.cn/icbc/perbank/index.jsp
jh|C:\Program Files\Mozilla Firefox\firefox.exe|https://ibsbjstar.ccb.com.cn/app/V5/CN/STY1/login.jsp
nh|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.abchina.com/cn/wydl/grwydl/default.htm#
zh|C:\Program Files\Mozilla Firefox\firefox.exe|https://ebsnew.boc.cn/boc15/login.html
ie|C:\Program Files\Internet Explorer\IEXPLORE.EXE
#ce