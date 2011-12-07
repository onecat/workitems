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

#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

脚本目的:利用.she换肤窗口
    准备工作：
                1.必须文件：皮肤文件.she和USkin.dll；
    窗口换肤过程：
                1.fileinstall()所需文件；
                2.定义变量$skins和$DLL_存储换肤文件；
                3.利用DLLCALL()启用皮肤。
        注意事项：
                1。注意用fileinstall()载入文件的源路径必须是字符不能有变量；
                2.注意路径“\”符号必须存在，否则因路径导致无法找到更换皮肤所需文件；
                3.注意退出时将载入文件删除。
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=

FileInstall("aero.she",@TempDir & "\aero.she")
FileInstall("Skin.dll",@TempDir & "\Skin.dll")
$skins=@TempDir & "\aero.she"
$Dll = DllOpen(@TempDir & "\Skin.dll")
DllCall($Dll, "int", "SkinH_AttachEx", "str", $skins, "str", "mhgd")
DllCall($Dll, "int", "SkinH_SetAero", "int", 1)

$Form1 = GUICreate("test .she skin", 633, 454, 192, 114)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
