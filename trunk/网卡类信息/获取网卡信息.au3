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

$wbemFlagReturnImmediately = 0x10
$wbemFlagForwardOnly = 0x20
$colItems = ""
$strComputer = "localhost"
$file = FileOpen(@ScriptDir & "\MAC.txt", 10)
$Output=""


$Output = $Output & "计算机：" & $strComputer & @CRLF
$Output = $Output & "==========================================" & @CRLF
$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", _
$wbemFlagReturnImmediately + $wbemFlagForwardOnly)

If IsObj($colItems) then
For $objItem In $colItems
$Output = $Output & "网卡： " & $objItem.Description & @CRLF
;$strDefaultIPGateway = $objItem.DefaultIPGateway(0)
$Output = $Output & "默认网关： " & $objItem.DefaultIPGateway(0) & @CRLF


$Output = $Output & "计算机名： " & $objItem.DNSHostName & @CRLF
$strIPAddress = $objItem.IPAddress(0)
$Output = $Output & "IP地址： " & $strIPAddress & @CRLF
$strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(0)
$Output = $Output & "默认DNS： " & $strDNSServerSearchOrder & @CRLF
$strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(1)
$Output = $Output & "备用DNS： " & $strDNSServerSearchOrder & @CRLF

$strIPSubnet = $objItem.IPSubnet(0)
$Output = $Output & "子网掩码： " & $strIPSubnet & @CRLF
$Output = $Output & "MAC地址： " & $objItem.MACAddress & @CRLF

if FileWrite($file, $Output)= 1 then ExitLoop
$Output=""
Next
Else

Msgbox(0,"WMI Output","No WMI Objects Found for class: " & "Win32_NetworkAdapterConfiguration" )
endif
FileClose($file)
ShellExecute( "MAC.txt", "", @ScriptDir, "edit")
