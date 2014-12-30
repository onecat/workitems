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

#include <Date.au3>
#include <StaticConstants.au3>
 
Global $bState = True
 
GUICreate('计时+时间循环', 300, 200)
GUICtrlCreateLabel('系统时间：', 10, 10, 60, 50)
$Time = GUICtrlCreateLabel(_Now(), 70, 10)
 
$Label1 = GUICtrlCreateLabel('准备就绪', 10, 60, 280, 50, $SS_CENTER)
GUICtrlSetFont(-1, 15, 800, 0, '楷体_GB2312')
 
$Button1 = GUICtrlCreateButton('开始', 40, 130, 100, 30)
$Button2 = GUICtrlCreateButton('暂停', 160, 130, 100, 30)
GUISetState()
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
                Case $Button1
                        $i = 1
                        AdlibRegister('cont', 1000)
                Case $Button2
                        If $bState = True Then
                                AdlibUnRegister('cont')
                                GUICtrlSetData($Label1, '暂停至' & $i & '秒')
                                GUICtrlSetData($Button2, '继续')
                                $bState = False
                        Else
                                $bState = True
                                GUICtrlSetData($Button2, '暂停')
                                AdlibRegister('cont', 1000)
                        EndIf
        EndSwitch
        
        If _Now() <> GUICtrlRead($Time) Then GUICtrlSetData($Time, _Now())
WEnd
 
Func cont()
        GUICtrlSetData($Label1, '已开始' & $i & '秒')
        $i += 1
EndFunc   ;==>cont
