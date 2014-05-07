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
;注册表
Func _rename($Hostname) ;重命名电脑名
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters","Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Control\ComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\Tcpip\Parameters","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\Tcpip\Parameters","Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\","Hostname","REG_SZ",$Hostname)
 EndFunc

;WMI改名
Func _QueryWmiStatus()

$foo = Run(@ComSpec & ' /c sc query winmgmt|find "STATE"  ', @SystemDir, @SW_HIDE, $STDOUT_CHILD)
ProcessWaitClose($foo)
$result = StdoutRead($foo)
If @error Then 
        MsgBox(0,"ERRO!","can't get STDOUT'")
EndIf
$aArray=_StringExplode($result, ":", 0)
$aArray1=_StringExplode($aArray[1]," ", 0)
If $aArray1[1]=4 Then
        Return 1
ElseIf $aArray1[1]=1 Then
        RunWait(@ComSpec & ' /c sc config winmgmt start= auto', @SystemDir, @SW_HIDE)
        RunWait(@ComSpec & ' /c sc start winmgmt', @SystemDir, @SW_HIDE)
        Return 1
Else
        Return 0
EndIf
EndFunc
