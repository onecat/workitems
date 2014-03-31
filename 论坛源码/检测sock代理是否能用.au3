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

#include <winapi.au3>
$a = CheckSocks("173.3.220.236:32819")


Func CheckSocks($socks)
        Local $fault, $fault2
        TCPStartup()
        $_socks = StringSplit($socks, ":", 1)
        If $_socks[0] == 2 Then
                $ip = $_socks[1]
                ; ConsoleWrite($ip & @CRLF)
                $port = $_socks[2]
                ; ConsoleWrite($port & @CRLF)
                $socket = TCPConnect($ip, $port)
                $fault2 = _WSAGetLastError()
                If @extended Then
                        MsgBox(262144, "Fault", "WSAGetLastError failed")
                        $fault2 = 'unknown'
                EndIf

                If $socket = -1 Then
                        Switch @error
                                Case 1
                                        $fault = "Incorrect IP"
                                Case 2
                                        $fault = "Incorrect port"
                                Case Else
                                        $fault = "Valid IP and Port"
                        EndSwitch
                        MsgBox(262144, "Failed to connect", "Error = " & $fault2 & @CRLF & $fault)
                EndIf

        Else
                $socket = -1
        EndIf
        TCPShutdown()
        Return $socket
EndFunc   ;==>CheckSocks

Func _WSAGetLastError()
        Local $Res = DllCall("Ws2_32.dll", "int", "WSAGetLastError")
        If @error Then
                SetExtended(1)
                Return 0
        EndIf
        Return $Res[0]
EndFunc   ;==>_WSAGetLastError
