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
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\Users\Administrator\Desktop\Icon_1.ico
#AutoIt3Wrapper_outfile=睡眠唤醒方式设置.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>

Local $SubKey0="CurrentControlSet"
While 1
Local $RootKey1e = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey0&"\Enum\HID"
Local $ie=1
While 1
        Local $SubKey11e = RegEnumKey($RootKey1e, $ie)
        If @error <> 0 Then ExitLoop
        Local $RootKey11e = $RootKey1e & "\" & $SubKey11e
                Local $je=1
                While 1
                    Local $SubKey12e=RegEnumKey($RootKey11e,$je)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey12e=$RootKey11e & "\" & $SubKey12e
                        Local $RootKey13e=$RootKey12e & "\Device Parameters"
                            $val=RegRead($RootKey13e,"RemoteWakeEnabled")
                                If @error <> 0 or $val="0x00000000" Then ExitLoop
                                RegWrite($RootKey13e,"RemoteWakeEnabled","REG_DWORD","0x00000000")
                        $je += 1
                WEnd
        $ie += 1
WEnd
If $SubKey0="ControlSet001" Then ExitLoop
Local $SubKey0="ControlSet001"
WEnd

Opt("GUIOnEventMode", 1)  ; 切换为 OnEvent 模式 
$mainwindow = GUICreate("睡眠唤醒方式设置", 380, 250) ; 创建窗口并返回窗口句柄
GUICtrlCreateLabel("笔记本“禁用从端口设备唤醒”可能无效", 20, 13)
GUICtrlCreateLabel("端口设备重启后生效,USB设备重启或拔出再插入即可生效", 20, 30)
$button1 = GUICtrlCreateButton("禁用从端口鼠标唤醒", 20, 50, 160, 40)
$button2 = GUICtrlCreateButton("启用从端口鼠标唤醒", 200, 50, 160, 40)
$button3 = GUICtrlCreateButton("禁用从端口键盘唤醒", 20, 100, 160, 40)
$button4 = GUICtrlCreateButton("启用从端口键盘唤醒", 200, 100, 160, 40)
$button5 = GUICtrlCreateButton("禁用从USB鼠标唤醒", 20, 150, 160, 40)
$button6 = GUICtrlCreateButton("启用从USB鼠标唤醒", 200, 150, 160, 40)
$button7 = GUICtrlCreateButton("禁用从USB键盘唤醒", 20, 200, 160, 40)
$button8 = GUICtrlCreateButton("启用从USB键盘唤醒", 200, 200, 160, 40)
GUICtrlSetOnEvent($button1, "Button1")
GUICtrlSetOnEvent($button2, "Button2")
GUICtrlSetOnEvent($button3, "Button3")
GUICtrlSetOnEvent($button4, "Button4")
GUICtrlSetOnEvent($button5, "Button5")
GUICtrlSetOnEvent($button6, "Button6")
GUICtrlSetOnEvent($button7, "Button7")
GUICtrlSetOnEvent($button8, "Button8")
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked") ; 设置窗口关闭事件Show and hide
GUISetState(@SW_SHOW)
Global $SubKey="CurrentControlSet"
Global $t1=10
Global $t2=1

While 1
  Sleep(1000)  ; 不做任何事
WEnd

Func Button1()
        While 1
Local $RootKey1a = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96F-E325-11CE-BFC1-08002BE10318}"
Local $ia=1
While 1
        Local $SubKey11a = RegEnumKey($RootKey1a, $ia)
        If @error <> 0 Then ExitLoop
        Local $RootKey12a = $RootKey1a & "\" & $SubKey11a
        $Info1a=RegRead($RootKey12a,"LocationInformationOverride")
        $Info2a=RegRead($RootKey12a,"MatchingDeviceId")
        $Info3a=RegRead($RootKey12a,"DriverDesc")
        If $Info1a = "插入的 PS/2 鼠标端口" Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"鼠标类型","您的鼠标类型是："&$Info1a&"    "&$Info3a,$t1)
                $Info4a=StringTrimLeft($Info2a,1)
                $SubKey21a=StringUpper($Info4a) 
                Local $ja=1
                While 1
                        Local $RootKey2a="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\ACPI"
                    Local $RootKey22a=$RootKey2a & "\" & $SubKey21a
                    Local $SubKey22a=RegEnumKey($RootKey22a,$ja)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey23a=$RootKey22a & "\" & $SubKey22a
                    $Cls1a=RegRead($RootKey23a,"Class")
                    $Driver1a=RegRead($RootKey23a,"Driver")
                    If $Cls1a="Mouse"And $Driver1a="{4d36e96f-e325-11ce-bfc1-08002be10318}\"&$SubKey11a Then 
                                Local $RootKey24a=$RootKey23a&"\Device Parameters"
                                RegWrite($RootKey24a,"WaitWakeEnabled","REG_DWORD","0x00000000")
                        EndIf
                        $ja += 1
                WEnd
        EndIf
        $ia += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button2()
                While 1
Local $RootKey1a = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96F-E325-11CE-BFC1-08002BE10318}"
Local $ia=1
While 1
        Local $SubKey11a = RegEnumKey($RootKey1a, $ia)
        If @error <> 0 Then ExitLoop
        Local $RootKey12a = $RootKey1a & "\" & $SubKey11a
        $Info1a=RegRead($RootKey12a,"LocationInformationOverride")
        $Info2a=RegRead($RootKey12a,"MatchingDeviceId")
        $Info3a=RegRead($RootKey12a,"DriverDesc")
        If $Info1a = "插入的 PS/2 鼠标端口" Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"鼠标类型","您的鼠标类型是："&$Info1a&"    "&$Info3a,$t1)
                $Info4a=StringTrimLeft($Info2a,1)
                $SubKey21a=StringUpper($Info4a) 
                Local $ja=1
                While 1
                        Local $RootKey2a="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\ACPI"
                    Local $RootKey22a=$RootKey2a & "\" & $SubKey21a
                    Local $SubKey22a=RegEnumKey($RootKey22a,$ja)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey23a=$RootKey22a & "\" & $SubKey22a
                    $Cls1a=RegRead($RootKey23a,"Class")
                    $Driver1a=RegRead($RootKey23a,"Driver")
                    If $Cls1a="Mouse"And $Driver1a="{4d36e96f-e325-11ce-bfc1-08002be10318}\"&$SubKey11a Then 
                                Local $RootKey24a=$RootKey23a&"\Device Parameters"
                                RegWrite($RootKey24a,"WaitWakeEnabled","REG_DWORD","0x00000001")
                        EndIf
                        $ja += 1
                WEnd
        EndIf
        $ia += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button3()
While 1
Local $RootKey1b = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96B-E325-11CE-BFC1-08002BE10318}"
Local $ib=1
While 1
        Local $SubKey11b = RegEnumKey($RootKey1b, $ib)
        If @error <> 0 Then ExitLoop
        Local $RootKey12b = $RootKey1b & "\" & $SubKey11b
        $Info1b=RegRead($RootKey12b,"LocationInformationOverride")
        $Info2b=RegRead($RootKey12b,"MatchingDeviceId")
        $Info3b=RegRead($RootKey12b,"DriverDesc")
        If $Info1b = "插入键盘端口" Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"键盘类型","您的键盘类型是："&$Info1b&"    "&$Info3b,$t1)
                $Info4b=StringTrimLeft($Info2b,1)
                $SubKey21b=StringUpper($Info4b)
                Local $jb=1
                While 1
                        Local $RootKey2b="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\ACPI"
                    Local $RootKey22b=$RootKey2b & "\" & $SubKey21b
                    Local $SubKey22b=RegEnumKey($RootKey22b,$jb)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey23b=$RootKey22b & "\" & $SubKey22b
                    $Cls1b=RegRead($RootKey23b,"Class")
                    $Driver1b=RegRead($RootKey23b,"Driver")
                    If $Cls1b="Keyboard"And $Driver1b="{4d36e96b-e325-11ce-bfc1-08002be10318}\"&$SubKey11b Then 
                                Local $RootKey24b=$RootKey23b&"\Device Parameters"
                                RegWrite($RootKey24b,"WaitWakeEnabled","REG_DWORD","0x00000000")
                        EndIf
                        $jb += 1
                WEnd
        EndIf
        $ib += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button4()
        While 1
Local $RootKey1b = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96B-E325-11CE-BFC1-08002BE10318}"
Local $ib=1
While 1
        Local $SubKey11b = RegEnumKey($RootKey1b, $ib)
        If @error <> 0 Then ExitLoop
        Local $RootKey12b = $RootKey1b & "\" & $SubKey11b
        $Info1b=RegRead($RootKey12b,"LocationInformationOverride")
        $Info2b=RegRead($RootKey12b,"MatchingDeviceId")
        $Info3b=RegRead($RootKey12b,"DriverDesc")
        If $Info1b = "插入键盘端口" Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"键盘类型","您的键盘类型是："&$Info1b&"    "&$Info3b,$t1)
                $Info4b=StringTrimLeft($Info2b,1)
                $SubKey21b=StringUpper($Info4b)
                Local $jb=1
                While 1
                        Local $RootKey2b="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\ACPI"
                    Local $RootKey22b=$RootKey2b & "\" & $SubKey21b
                    Local $SubKey22b=RegEnumKey($RootKey22b,$jb)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey23b=$RootKey22b & "\" & $SubKey22b
                    $Cls1b=RegRead($RootKey23b,"Class")
                    $Driver1b=RegRead($RootKey23b,"Driver")
                    If $Cls1b="Keyboard"And $Driver1b="{4d36e96b-e325-11ce-bfc1-08002be10318}\"&$SubKey11b Then 
                                Local $RootKey24b=$RootKey23b&"\Device Parameters"
                                RegWrite($RootKey24b,"WaitWakeEnabled","REG_DWORD","0x00000001")
                        EndIf
                        $jb += 1
                WEnd
        EndIf
        $ib += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button5()
        While 1
Local $RootKey1c = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96F-E325-11CE-BFC1-08002BE10318}"
Local $ic=1
While 1
        Local $SubKey11c = RegEnumKey($RootKey1c, $ic)
        If @error <> 0 Then ExitLoop
        Local $RootKey12c = $RootKey1c & "\" & $SubKey11c
        $Info1c=RegRead($RootKey12c,"LocationInformationOverride")
        $Info2c=RegRead($RootKey12c,"MatchingDeviceId")
        $Info3c=RegRead($RootKey12c,"DriverDesc")
        $result2c = StringInStr($Info2c,"hid",0)
        $result3c = StringInStr($Info3c,"HID",0)
        If $Info2c="hid_device_system_mouse" Or $Info3c="HID-compliant mouse" Or $result2c>0 Or $result3c>0 Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"鼠标类型","您的鼠标类型是：USB输入设备"&"    "&$Info3c,$t1)
                Local $jc=1
                While 1
                        Local $RootKey2c="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\HID"
                    Local $SubKey21c=RegEnumKey($RootKey2c,$jc)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey22c=$RootKey2c & "\" & $SubKey21c
                        Local $kc=1
                        While 1
                                Local $SubKey22c=RegEnumKey($RootKey22c,$kc)
                                If @error <> 0 Then ExitLoop
                            Local $RootKey23c=$RootKey22c & "\" & $SubKey22c
                                $Cls1c=RegRead($RootKey23c,"Class")
                                $Driver1c=RegRead($RootKey23c,"Driver")
                        If $Cls1c="Mouse"And $Driver1c="{4d36e96f-e325-11ce-bfc1-08002be10318}\"&$SubKey11c Then 
                                        Local $RootKey24c=$RootKey23c&"\Device Parameters"
                                        RegWrite($RootKey24c,"WaitWakeEnabled","REG_DWORD","0x00000000")
                                EndIf
                                $kc += 1
                        WEnd
                        $jc += 1
                WEnd
        EndIf
        $ic += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc
        
Func Button6()
        While 1
Local $RootKey1c = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96F-E325-11CE-BFC1-08002BE10318}"
Local $ic=1
While 1
        Local $SubKey11c = RegEnumKey($RootKey1c, $ic)
        If @error <> 0 Then ExitLoop
        Local $RootKey12c = $RootKey1c & "\" & $SubKey11c
        $Info1c=RegRead($RootKey12c,"LocationInformationOverride")
        $Info2c=RegRead($RootKey12c,"MatchingDeviceId")
        $Info3c=RegRead($RootKey12c,"DriverDesc")
        $result2c = StringInStr($Info2c,"hid",0)
        $result3c = StringInStr($Info3c,"HID",0)
        If $Info2c="hid_device_system_mouse" Or $Info3c="HID-compliant mouse" Or $result2c>0 Or $result3c>0 Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"鼠标类型","您的鼠标类型是：USB输入设备"&"    "&$Info3c,$t1)
                Local $jc=1
                While 1
                        Local $RootKey2c="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\HID"
                    Local $SubKey21c=RegEnumKey($RootKey2c,$jc)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey22c=$RootKey2c & "\" & $SubKey21c
                        Local $kc=1
                        While 1
                                Local $SubKey22c=RegEnumKey($RootKey22c,$kc)
                                If @error <> 0 Then ExitLoop
                            Local $RootKey23c=$RootKey22c & "\" & $SubKey22c
                                $Cls1c=RegRead($RootKey23c,"Class")
                                $Driver1c=RegRead($RootKey23c,"Driver")
                        If $Cls1c="Mouse"And $Driver1c="{4d36e96f-e325-11ce-bfc1-08002be10318}\"&$SubKey11c Then 
                                        Local $RootKey24c=$RootKey23c&"\Device Parameters"
                                        RegWrite($RootKey24c,"WaitWakeEnabled","REG_DWORD","0x00000001")
                                EndIf
                                $kc += 1
                        WEnd
                        $jc += 1
                WEnd
        EndIf
        $ic += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button7()
        While 1
Local $RootKey1d = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96B-E325-11CE-BFC1-08002BE10318}"
Local $id=1
While 1
        Local $SubKey11d = RegEnumKey($RootKey1d, $id)
        If @error <> 0 Then ExitLoop
        Local $RootKey12d = $RootKey1d & "\" & $SubKey11d
        $Info1d=RegRead($RootKey12d,"LocationInformationOverride")
        $Info2d=RegRead($RootKey12d,"MatchingDeviceId")
        $Info3d=RegRead($RootKey12d,"DriverDesc")
        $result2d = StringInStr($Info2d,"hid",0)
        $result3d = StringInStr($Info3d,"HID",0)
        If $Info2d="hid_device_system_keyboard" Or $Info3d="HID Keyboard Device" Or $result2d>0 Or $result3d>0 Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"键盘类型","您的键盘类型是：USB输入设备"&"    "&$Info3d,$t1)
                Local $jd=1
                While 1
                        Local $RootKey2d="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\HID"
                    Local $SubKey21d=RegEnumKey($RootKey2d,$jd)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey22d=$RootKey2d & "\" & $SubKey21d
                        Local $kd=1
                        While 1
                                Local $SubKey22d=RegEnumKey($RootKey22d,$kd)
                                If @error <> 0 Then ExitLoop
                            Local $RootKey23d=$RootKey22d & "\" & $SubKey22d
                                $Cls1d=RegRead($RootKey23d,"Class")
                                $Driver1d=RegRead($RootKey23d,"Driver")
                        If $Cls1d="Keyboard"And $Driver1d="{4d36e96b-e325-11ce-bfc1-08002be10318}\"&$SubKey11d Then 
                                        Local $RootKey24d=$RootKey23d&"\Device Parameters"
                                        RegWrite($RootKey24d,"WaitWakeEnabled","REG_DWORD","0x00000000")
                                EndIf
                                $kd += 1
                        WEnd
                        $jd += 1
                WEnd
        EndIf
        $id += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func Button8()
        While 1
Local $RootKey1d = "HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Control\Class\{4D36E96B-E325-11CE-BFC1-08002BE10318}"
Local $id=1
While 1
        Local $SubKey11d = RegEnumKey($RootKey1d, $id)
        If @error <> 0 Then ExitLoop
        Local $RootKey12d = $RootKey1d & "\" & $SubKey11d
        $Info1d=RegRead($RootKey12d,"LocationInformationOverride")
        $Info2d=RegRead($RootKey12d,"MatchingDeviceId")
        $Info3d=RegRead($RootKey12d,"DriverDesc")
        $result2d = StringInStr($Info2d,"hid",0)
        $result3d = StringInStr($Info3d,"HID",0)
        If $Info2d="hid_device_system_keyboard" Or $Info3d="HID Keyboard Device" Or $result2d>0 Or $result3d>0 Then 
                If $SubKey="CurrentControlSet" Then MsgBox(4096,"键盘类型","您的键盘类型是：USB输入设备"&"    "&$Info3d,$t1)
                Local $jd=1
                While 1
                        Local $RootKey2d="HKEY_LOCAL_MACHINE\SYSTEM\"&$SubKey&"\Enum\HID"
                    Local $SubKey21d=RegEnumKey($RootKey2d,$jd)
                    If @error <> 0 Then ExitLoop
                    Local $RootKey22d=$RootKey2d & "\" & $SubKey21d
                        Local $kd=1
                        While 1
                                Local $SubKey22d=RegEnumKey($RootKey22d,$kd)
                                If @error <> 0 Then ExitLoop
                            Local $RootKey23d=$RootKey22d & "\" & $SubKey22d
                                $Cls1d=RegRead($RootKey23d,"Class")
                                $Driver1d=RegRead($RootKey23d,"Driver")
                        If $Cls1d="Keyboard"And $Driver1d="{4d36e96b-e325-11ce-bfc1-08002be10318}\"&$SubKey11d Then 
                                        Local $RootKey24d=$RootKey23d&"\Device Parameters"
                                        RegWrite($RootKey24d,"WaitWakeEnabled","REG_DWORD","0x00000001")
                                EndIf
                                $kd += 1
                        WEnd
                        $jd += 1
                WEnd
        EndIf
        $id += 1
WEnd
If $SubKey="ControlSet001" Then MsgBox(4096,"提示","完成设置",$t2)
If $SubKey="ControlSet001" Then ExitLoop
Local $SubKey="ControlSet001"
WEnd
        DllCall("shell32.dll","none","SHChangeNotify","long",0x8000000,"int",0,"ptr",0,"ptr", 0)
EndFunc

Func CLOSEClicked()
        Exit
EndFunc

