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

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#Region ### START Koda GUI section ### Form=
Local $get ,$size
$Form1 = GUICreate("测试", 623, 442, 192, 124)
$Progress1 = GUICtrlCreateProgress(72, 96, 393, 65)
$Button1 = GUICtrlCreateButton("", 104, 216, 305, 97)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

                Case $Button1
					rt()
        EndSwitch
WEnd

Func rt()
	                   $url = "http://cjxlist.googlecode.com/svn/CustomStrings.dat"
						;$url = "http://192.168.0.180:621/%E6%9D%BF%E7%AB%AF/CustomStrings.dat"
                        $get = InetGet($url, @ScriptDir & "\update.dat", 1, 1)
                       $size = Int(InetGetSize($url) / 1024)
;~                         AdlibRegister("Down")
;~ 							Do
;~ 							Sleep(250)
;~ 								
;~ 						Until InetGetInfo($get, 2)
;~ 						Local $nBytes = InetGetInfo($get, 0)
;~ 						InetClose($get) 
;~ 						MsgBox(0,"","1")
;~ 						MsgBox(0,"","2")
EndFunc

Func Down()
        $newsize = InetGetInfo($get)
        $pro = Int($newsize[0] / 1024) / $size
        GUICtrlSetData($Progress1, $pro * 100)
        GUICtrlSetData($Button1, "已下载 " & Int($pro * 100) & "%")
EndFunc   ;==>Down
	