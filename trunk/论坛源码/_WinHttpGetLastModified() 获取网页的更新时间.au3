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

#include <WinHttp.au3>
#include <Date.au3>

;例子
Local $sLastModified = _WinHttpGetLastModified('http://news.163.com/')
If Not @error Then MsgBox(64, '网页最近更新时间', $sLastModified)

Func _WinHttpGetLastModified($sURL)
        ;afan 提示：获取静态网页或网络文件最近一次修改(更新)时间
        ;$sURL - 网址或网络文件地址
        ;返回值：成功 - 返回北京时间；失败 - 返回空，并设置 @Error=1 网址有误、@Error=2 无有效报头信息

        Local $aSR = StringRegExp($sURL, '(?i)\h*(?:(?:ftp|http)://)?([^\\/\s]+)/?(\H+)?', 1)
        If @error Then Return SetError(1, 0, '')
        Local $sObjectName = ''
        If UBound($aSR) = 2 Then $sObjectName = $aSR[1]
        Local $hOpen = _WinHttpOpen()
        Local $hConnect = _WinHttpConnect($hOpen, $aSR[0])
        Local $hRequest = _WinHttpOpenRequest($hConnect, 'GET', $sObjectName)
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        Local $sHeader = _WinHttpQueryHeaders($hRequest)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        Local $aSR = StringRegExp($sHeader, '(?i)(?:Last-Modified): (.+?), (\d+) (\H+) (\d+) (\d+):(\d+):(\d+)\h+GMT\h*((?:[+-]?\h*\d+)?)', 3)
        If @error Then Return SetError(2, 0, '')
        Local $sMon = 'Jan01,Feb02,Mar03,Apr04,May05,Jun06,Jul07,Aug08,Sep09,Oct10,Nov11,Dec12'
        Local $s_Mon = StringRegExpReplace($sMon, '(?i).*?' & $aSR[2] & '(\d+).*', '$1')
        Local $sTimer = $aSR[3] & '/' & $s_Mon & '/' & $aSR[1] & ' ' & $aSR[4] & ':' & $aSR[5] & ':' & $aSR[6]
        If Number($aSR[7]) = 8 Then Return $sTimer
        Local $sNewDate = _DateAdd('h', 8 - Number($aSR[7]), $sTimer)
        Return $sNewDate
EndFunc   ;==>_WinHttpGetLastModified