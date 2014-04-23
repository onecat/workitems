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

$Form1 = GUICreate("多线程实例", 272, 139, -1, -1)


$Label1 = GUICtrlCreateLabel("00:00:00:00", 8, 8, 146, 17)



$Label2 = GUICtrlCreateLabel("0", 8, 56, 150, 17)



$Label3 = GUICtrlCreateLabel("", 8, 104, 148, 17)



$Button1 = GUICtrlCreateButton("关闭线程1", 168, 8, 89, 25, 0)


$Button2 = GUICtrlCreateButton("关闭线程2", 168, 48, 89, 25, 0)


$Button3 = GUICtrlCreateButton("关闭线程3", 168, 96, 89, 25, 0)



GUISetState(@SW_SHOW)



Global $t2, $t3 = 1



$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 1000, "ptr", DllCallbackGetPtr($Timer))



$Timer2 = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$Timer2DLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 200, "ptr", DllCallbackGetPtr($Timer2))



$Timer3 = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$Timer3DLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 500, "ptr", DllCallbackGetPtr($Timer3))



While 1



        Switch GUIGetMsg()


                Case - 3



                        Exit


                Case $Button1



                       DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $TimerDLL)


                        DllCallbackFree($Timer)



                Case $Button2



                        DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $Timer2DLL)


                        DllCallbackFree($Timer2)



                Case $Button3



                        DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $Timer3DLL)



                        DllCallbackFree($Timer3)



        EndSwitch



WEnd



Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)


        If $idEvent = $TimerDLL[0] Then



                GUICtrlSetData($Label1, @HOUR & ":" & @MIN & ":" & @SEC & ":" & @MSEC)



        ElseIf $idEvent = $Timer2DLL[0] Then



                $t2 += 1



                GUICtrlSetData($Label2, $t2)



        ElseIf $idEvent = $Timer3DLL[0] Then


                $t3 *= 2



                GUICtrlSetData($Label3, $t3)



        EndIf



EndFunc
