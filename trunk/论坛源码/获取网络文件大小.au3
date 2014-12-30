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

#include <WinHTTP.au3>
MsgBox(0, "", _FileSize("http://www.baidu.com/img/bdlogo.png")  / 1024 & "KB")
Func _FileSize($url, $username = "", $password = "")
        Local $hOpen, $hConnect, $hRequest, $LENGTH
        Local $File, $hS
        If StringInStr($url, "http://") Then $url = StringTrimLeft($url, 7)
        $hS = StringSplit($url, "/")
        If @error Then
                MsgBox(0, "error", "格式错误！")
                Return SetError(0, 0, 0)
        EndIf
        $File = StringRegExpReplace($url, "^(.*?)/", "/")
        $hOpen = _WinHttpOpen()
        $hConnect = _WinHttpConnect($hOpen, $hS[1])
        $hRequest = _WinHttpOpenRequest($hConnect, "head", $File)
        _WinHttpSetCredentials($hRequest, $WINHTTP_AUTH_TARGET_SERVER, $WINHTTP_AUTH_SCHEME_BASIC, $username, $password)
        _WinHttpSendRequest($hRequest)
        _WinHttpReceiveResponse($hRequest)
        If _WinHttpQueryDataAvailable($hRequest) Then $LENGTH = _WinHttpQueryHeaders($hRequest, $WINHTTP_QUERY_CONTENT_LENGTH)
        _WinHttpCloseHandle($hRequest)
        _WinHttpCloseHandle($hConnect)
        _WinHttpCloseHandle($hOpen)
        $LENGTH = $LENGTH
        Return $LENGTH
EndFunc   ;==>_FileSize
