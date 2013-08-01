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

#include <INet.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ACN_NET.au3>
 
$ip = _GetIP ( )
$ip1 = @IPAddress1
$ip2 = @IPAddress2
$mac1 = _API_Get_NetworkAdapterMAC (@IPAddress1)
$mac2 = _API_Get_NetworkAdapterMAC (@IPAddress2)               
$CPname = @ComputerName
$UserName = @UserName

$Form1_1 = GUICreate("获取内外网IP", 328, 255, 365, 331)
$Group1 = GUICtrlCreateGroup("", 8, 3, 313, 245)
$Label1 = GUICtrlCreateLabel("公网IP地址：", 24, 100, 74, 17)
$Label2 = GUICtrlCreateLabel("本机网卡1 IP地址：", 24, 136, 128, 17)
$Label3 = GUICtrlCreateLabel("本机网卡1 MAC：", 24, 192, 90, 17)
$Input1 = GUICtrlCreateInput($ip, 112, 96, 169, 21)
$Input2 = GUICtrlCreateInput($ip1, 24, 160, 129, 21)
$Input3 = GUICtrlCreateInput($mac1, 24, 216, 129, 21)
$Label4 = GUICtrlCreateLabel("本机网卡2 IP地址：", 176, 136, 128, 17)
$Label5 = GUICtrlCreateLabel("本机网卡2 MAC：", 176, 192, 90, 17)
$Input4 = GUICtrlCreateInput($ip2, 176, 160, 129, 21)
$Input5 = GUICtrlCreateInput($mac2, 176, 216, 129, 21)
$Label6 = GUICtrlCreateLabel("主机名称：", 25, 37, 68, 17)
$Input6 = GUICtrlCreateInput($CPname, 112, 32, 121, 21)
$Label7 = GUICtrlCreateLabel("当前登录用户：", 24, 68, 88, 17)
$Input7 = GUICtrlCreateInput($UserName, 112, 64, 121, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
	WEnd
	
