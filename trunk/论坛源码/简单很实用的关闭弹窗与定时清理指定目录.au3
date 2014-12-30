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

;关闭弹窗与定时清理指定目录
;支持多任务,均为逗号分隔:
;文件夹路径: 清理目录1,清理目录2,清理目录3,清理目录4,,,
;指定分钟值: 格式: 00,05,20,,,
;标题或类名: 标题或类名1,标题或类名2,标题或类名3,,,
;所有输入内容经启动后即会自动保存，需要修改时先终止再修改再启动即可

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
$Form1 = GUICreate("关闭弹窗与定时清理", 337, 250)
GUICtrlCreateLabel("定时清理指定文件夹", 112, 24, 120, 17)
GUICtrlCreateLabel("文件夹路径(,):", 16, 66, 86, 17)
$Input1 = GUICtrlCreateInput("", 102, 64, 220, 21)
GUICtrlCreateLabel("指定分钟值(,):", 16, 104, 86, 17)
$Input2 = GUICtrlCreateInput("", 102, 100, 220, 21)
$Button2 = GUICtrlCreateButton("立即清理", 16, 140, 85, 25)
$Button3 = GUICtrlCreateButton("自动清理", 128, 140, 85, 25)
$Button4 = GUICtrlCreateButton("终止自动清理", 238, 140, 85, 25)
GUICtrlCreateLabel("关闭弹窗", 147, 188, 80, 17)
GUICtrlCreateLabel("标题或类名(,):", 16, 214, 86, 17)
$Input3 = GUICtrlCreateInput("", 102, 210, 186, 21)
$Button6 = GUICtrlCreateButton("启动", 292, 210, 30, 21)
GUISetState(@SW_SHOW)
GUICtrlSetData($Input1,IniRead("ljmin.ini","ljmin","lj","")) 
GUICtrlSetData($Input2,IniRead("ljmin.ini","ljmin","min","")) 
GUICtrlSetData($Input3,IniRead("ljmin.ini","ljmin","Popup",""))  
Local $Dira ,$fzjsa,$Dir ,$fzjs,$Dir1 ,$fzjs1,$qddszdql = 0,$qddszdq2 = 0,$sfqlg = 0,$xyql = 0
Local $Button6x = 0 ,$tcbt,$tcbt1,$tcbt2,$jccklm = 0,$jcckbt = 0,$timejs1 = 0
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button2
            $qddszdq2 = 1
            GUICtrlSetState($Button2, $GUI_DISABLE)
                        mlmin()        
                Case $Button3
            $qddszdql = 1
            GUICtrlSetState($Button3, $GUI_DISABLE)
            mlmin()                
                Case $Button4 
            $qddszdql = 0 
                        GUICtrlSetState($Button3, $GUI_ENABLE)
                Case $Button6
            If $Button6x = 0 Then 
                GUICtrlSetData($Button6,"停止")         
                                $tcbt2 = GUICtrlRead($Input3)   
                                $tcbt = StringSplit($tcbt2,",")
                    $tcbt1 = UBound($tcbt)-1
                                IniWrite("ljmin.ini","ljmin","Popup",$tcbt2)
                $Button6x = 1                                
                        Else 
                                GUICtrlSetData($Button6,"启动") 
                                $Button6x = 0
            EndIf  
                EndSwitch
        If $timejs1 >= 40 Then 
            If $Dir1 >= 1 And $fzjs1 >= 1 Then
                    For $i = 1 To $fzjs[0]
                            If $fzjs[$i] = @MIN Then 
                                    $xyql = 1
                                    ExitLoop
                            Else 
                                    $xyql = 0                                        
                            EndIf
                    Next
                    If $xyql = 0 Then $sfqlg = 0                                
            If $qddszdql = 1 And $xyql = 1 And $sfqlg = 0 Or $qddszdq2 = 1 Then 
                            For $i = 1 To $Dir[0]
                                    RunWait(@ComSpec & ' /c rd /q /s ' & $Dir[$i], '', 0) 
                            Next         
                            If $qddszdql = 1 And $qddszdq2 <> 1 Then $sfqlg = 1
                            If  $qddszdq2 = 1 Then 
                                $qddszdq2 = 0 
                                GUICtrlSetState($Button2, $GUI_ENABLE)
                        EndIf 
            EndIf 
            EndIf
                $timejs1 = 0
            If $tcbt1 >= 1 And $Button6x = 1 Then
                    For $i = 1 To $tcbt[0]
                            $jccklm = WinExists("[CLASS:"&$tcbt[$i]&"]")
                            $jcckbt = WinExists($tcbt[$i])
                If $jccklm = 1 Then 
                                    WinClose("[CLASS:"&$tcbt[$i]&"]")
                            $jccklm = 0
                EndIf
                            If $jcckbt = 1 Then 
                                    WinClose($tcbt[$i])
                            $jcckbt = 0
                EndIf
            Next 
        EndIf
            $timejs2 = 0
    EndIf         
    Sleep(50)
        $timejs1 += 1
WEnd
Func mlmin()
        $Dira = GUICtrlRead($Input1)
    $Dir = StringSplit($Dira,",")
    $Dir1 = UBound($Dir)-1
        $fzjsa = GUICtrlRead($Input2)
    $fzjs = StringSplit($fzjsa,",")
    $fzjs1 = UBound($fzjs)-1
        IniWrite("ljmin.ini","ljmin","lj",$Dira)
        IniWrite("ljmin.ini","ljmin","min",$fzjsa)
EndFunc 