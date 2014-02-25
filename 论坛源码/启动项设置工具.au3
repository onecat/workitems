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

#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiListView.au3>
#include <ListViewConstants.au3>
 
$Version = 'AutoStartSettings'
If WinExists($Version) Then Exit
AutoItWinSetTitle($Version)
 
Global $Dll
Opt("OnExitFunc","Quit")
FileInstall("SkinCrafterDll.dll", @TempDir&"SkinCrafterDll.dll", 1)
FileInstall("vista.skf", @TempDir&"vista.skf", 1)
$MainWindow = GUICreate("AutoStart Settings", 610, 303)
_SkinGUI(@TempDir&"SkinCrafterDll.dll", @TempDir&"vista.skf", $MainWindow)
GUICtrlCreateGroup("启动项列表", 2, 8, 321, 273)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$List = GUICtrlCreateListView("位置   | 名称   | 路径  ",  4, 30, 313, 248)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("添加启动项", 326, 8, 282, 169)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
GUICtrlCreateLabel("创建位置:", 342, 48, 55, 17)
GUICtrlCreateLabel("启动项名称:", 342, 88, 67, 17)
GUICtrlCreateLabel("启动项路径:", 342, 128, 67, 17)
$Choose = GUICtrlCreateCombo("MACHINE → RUN", 416, 44, 185, 25)
GUICtrlSetColor(-1, 0x808080)
GUICtrlSetData(-1,"USER    → RUN") 
$Name = GUICtrlCreateInput("Defalut", 416, 85, 183, 21)
GUICtrlSetTip(-1,"输入您要创建的启动项的名称")
GUICtrlSetColor(-1, 0x808080)
$Path = GUICtrlCreateInput("点击浏览按钮选择文件...", 416, 125, 137, 21)
GUICtrlSetTip(-1,"输入您要创建的启动项的完整路径及文件名")
GUICtrlSetColor(-1, 0x808080)
$Browse = GUICtrlCreateButton("浏览", 558, 125, 41, 21, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Status = GUICtrlCreateLabel("", 0, 285, 320, 16, $SS_SUNKEN)
$Delete = GUICtrlCreateButton("删除(&D)", 330, 196, 121, 33, 0)
GUICtrlSetTip(-1, "删除选中的启动项")
$Add = GUICtrlCreateButton("添加(&C)", 480, 196, 121, 33, 0)
GUICtrlSetTip(-1, "按您输入的名称和路径添加启动项")
$Refresh = GUICtrlCreateButton("刷新(&R)", 330, 240, 121, 33, 0)
GUICtrlSetTip(-1, "刷新启动项列表")
$About = GUICtrlCreateButton("关于(&A)", 480, 240, 121, 33, 0)
GUICtrlSetTip(-1, "关于...")
$Tips = GUICtrlCreateLabel("提示:组策略和开始菜单启动目录也可设置开机启动。", 325, 288, 287, 16)
GUICtrlSetState($Tips, $GUI_DISABLE)
GUISetState(@SW_SHOW)
Read()
 
While 1
        $Msg = GUIGetMsg()
        Select
                Case $Msg = $GUI_EVENT_CLOSE
                        Exit
                Case $Msg = $Browse
                        $PathValue = FileOpenDialog("请选择需要开机启动的文件...", @ScriptDir, "可执行文件(*.exe;*.bat;*.vbs)")
                        GUICtrlSetData($Path, $PathValue)               
                Case $Msg = $Add
                        $Data = GUICtrlRead($Choose)
                        Select
                                Case GUICtrlRead($Path) = "" Or GUICtrlRead($Path) = "点击浏览按钮选择文件..." 
                                 MsgBox (0, "提示", "请输入正确的路径及文件名后再试！")
                            Case $Data = "MACHINE → RUN" 
                                 RegWrite("HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", GUICtrlRead($Name), "REG_SZ", GUICtrlRead($Path))
                                 MsgBox(0, "提示", "设置成功，重启生效！")
                                Case $Data = "USER    → RUN"
                                         RegWrite("HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", GUICtrlRead($Name), "REG_SZ", GUICtrlRead($Path))
                                 MsgBox(0, "提示", "设置成功，重启生效！")
                        EndSelect
                Case $Msg = $Refresh
                        ReMain()
                Case $Msg = $About
                        About()
                Case $Msg = $Delete
                        If GUICtrlRead($List) = 0 Then 
                           MsgBox(0, "提示", "请选择您需要删除的项目再进行操作！")
                    ElseIf GUICtrlRead($List) <> 0 Then
                            $answer = MsgBox(4, "提示", "删除后将不可恢复，只可手动添加，确认删除么？")
                            If $answer = 7 Then 
                              Remain()
                            Else   
                                    If StringLeft(GUICtrlRead(GUICtrlRead($List)),4) = "User" Then 
                                                $result = StringTrimLeft(GUICtrlRead(GUICtrlRead($List)), 9)
                                                $x = StringInStr ($result, "|")
                                                $y = StringLeft($result, $x - 1)
                                                RegDelete("HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", $y)
                        GUICtrlDelete(GUICtrlRead($List))
                                        MsgBox(0, "提示", "删除成功，重启生效！")
                                Else
                        $result = StringTrimLeft(GUICtrlRead(GUICtrlRead($List)), 9)
                                                $x = StringInStr ($result, "|")
                                                $y = StringLeft($result, $x - 1)
                        RegDelete("HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN", $y)
                        GUICtrlDelete(GUICtrlRead($List))
                                        MsgBox(0, "提示", "删除成功，重启生效！")
                                    EndIf
                EndIf
                        EndIf
        EndSelect
        _ReduceMemory(@AutoItPID)       
WEnd
 
Func Read()
        
        $Sum = 0
        $i = 1
        While 1
            $key=RegEnumVal('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$i)
            If @error <> 0 then ExitLoop
            GUICtrlCreateListViewItem('User    |'& $key & '|' & RegRead('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$key),$List)
            $i=$i+1
                $Sum = $Sum + 1
        WEnd
        
        $i = 1
        While 1
            $key=RegEnumVal('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$i)
            If @error <> 0 then ExitLoop
            GUICtrlCreateListViewItem('Machine |'& $key & '|' & RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',$key),$List)
            $i=$i+1
                $Sum = $Sum + 1
        WEnd
 
        GUICtrlSetData($Status, ' 读取启动项完毕! 共' & $Sum & '个项目...')
EndFunc
 
Func ReMain()
        _GUICtrlListView_DeleteAllItems($List)
        Read()
EndFunc
 
Func About()
        GUISetState(@SW_DISABLE,$Mainwindow)
        $Window = GUICreate("关于...", 235, 240)
        GUICtrlCreateIcon (@AutoItExe,-1,22,40)
        GUICtrlCreateGroup("", 8, 4, 220, 195)
        $Label1 = GUICtrlCreateLabel("启动项设置工具 V1.0", 70, 40, 142, 17, $WS_GROUP)
        GUICtrlSetFont(-1, 10, 800, 0, "宋体")
        GUICtrlCreateLabel("范统.贾", 70, 80, 100, 17)
        $Mail = GUICtrlCreateLabel("5i3p@sina.com", 70, 102, 100, 17)
        GuiCtrlSetCursor($Mail,0)
    GUICtrlSetColor(-1, 0x0000FF)
        GUICtrlCreateLabel("版权所有，盗版不究。", 20, 144, 124, 17, $WS_GROUP)
        GUICtrlCreateLabel("欢迎加入QQ群227200 (AU3技术交流)", 20, 168, 194, 17)
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        $OK = GUICtrlCreateButton("确定(&O)", 90, 208, 75, 25)
        GUISetState(@SW_SHOW)
 
        While 1
                Switch GUIGetMsg()
                        Case $GUI_EVENT_CLOSE
                                        GUISetState(@SW_ENABLE,$MainWindow)
                                        GUIDelete($Window)
                                        ExitLoop
                        Case $OK
                                        GUISetState(@SW_ENABLE,$MainWindow)
                                        GUIDelete($Window)
                                        ExitLoop
                        Case $Mail
                                        Run(@ComSpec & " /c " & 'start mailto:5i3p@sina.com?subject=Something', "", @SW_HIDE)
                EndSwitch
        WEnd
EndFunc
 
Func _SkinGUI($SkincrafterDll, $SkincrafterSkin, $Handle) 
   $Dll = DllOpen($SkincrafterDll) 
   DllCall($Dll, "int:cdecl", "InitLicenKeys", "wstr", "1", "wstr", "", "wstr", "1@1.com", "wstr", "1") 
   DllCall($Dll, "int:cdecl", "InitDecoration", "int", 1) 
   DllCall($Dll, "int:cdecl", "LoadSkinFromFile", "wstr", $SkincrafterSkin) 
   DllCall($Dll, "int:cdecl", "DecorateAs", "int", $Handle, "int", 25) 
   DllCall($Dll, "int:cdecl", "ApplySkin") 
EndFunc 
 
Func Quit()
    GUISetState(@SW_HIDE)
    DllCall($Dll, "int:cdecl", "DeInitDecoration")
    DllCall($Dll, "int:cdecl", "RemoveSkin")
    DllClose($Dll)
        FileDelete(@TempDir&"SkinCrafterDll.dll") 
        FileDelete(@TempDir&"vista.skf") 
        FileDelete(@TempDir&"eyes.jpg") 
    Exit
EndFunc
 
Func _ReduceMemory($i_PID = -1)
        If $i_PID <> -1 Then
                Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
                DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
        Else
                Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
        EndIf
 
        Return $ai_Return[0]
EndFunc
