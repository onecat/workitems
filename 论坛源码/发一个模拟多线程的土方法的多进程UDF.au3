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
#cs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  SMT - Simple Multi Threading  ;;;
;;;;;;;;;  By NoCow AKA Mea  ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
        Functions
        
        
        _CreateThread("Function")
        Creates a new thread of a function in the script
                Return: $PID of the new thread
        
        _KillThread($PID)
        Destroy the target Thread
                Return: 1 for success. 0 for failed
 
        _SetVar("var","value")
        Set Global var to the value, Can be get with _GetVar()
 
        _GetVar("var")
        Get a variable set by _SetVar()
 
 
        Examples
;=========================================================================================================
;  move the mouse random to 1-500,1-500 and sleep 10secounds for show its multitasking  
;=========================================================================================================
#include "smt.au3"                              ; Include the multithreaded libary maded by Mea(Aka NoCow)
$pid = _CreateThread("hookmouse")               ; Start new thread with the function hookmouse()
Sleep(10000)                                    ; Sleep in 10secounds
_KillThread($pid)                               ; Close the thread hookmouse()
 
 
Func hookmouse()                                ; Function hookmouse() start
        While 1
                MouseMove(Random(1,500),Random(1,500))  ; Move Mouse random on the screen
        WEnd
EndFunc                                         ; Function hookmouse() end      
;=========================================================================================================
 
 
;=========================================================================================================
;  Tooltip every 50milisecounds the variable text on 0,0 while change it every 4secound
;  For then force the thread to close
;=========================================================================================================
#include "smt.au3"
_SetVar("text","hello with a foo in a boo")
$pid = _CreateThread("showtooltip")
Sleep(4000)
_SetVar("text","lol this is too easy")
Sleep(4000)
_SetVar("text",InputBox("What you want to our tooltip message?","Text: "))
Sleep(10000)
_KillThread($pid)
 
Func showtooltip()
        While 1
                ToolTip(_GetVar("text"),0,0)
                Sleep(50)
        WEnd
EndFunc
;=========================================================================================================
 
 
 
 
#ce
 
 
#NoTrayIcon
 
If $cmdline[0] > 0 Then
 
        $str = call($cmdline[1])
        Exit
EndIf
 
GUICreate("threaded by mea")
GUICtrlCreateEdit("",0,0)
 
Func _GetVar($var)
        $text = ControlGetText("threaded by mea", "", "Edit1")
        $text = StringSplit($text,@CRLF)
        For $i = 1 To $text[0]
                If Not $text[$i] = "" Then
                        $temp = StringSplit($text[$i]," ")
                        If $temp[1] = $var Then Return StringMid($text[$i],StringLen($temp[1]) + 1)
                EndIf
        Next
EndFunc
 
Func _CreateThread($thread)
        Return Run(@AutoItExe & " " & $thread)
EndFunc
 
Func _KillThread($thread)
        If ProcessExists($thread) <> 0 Then
                ProcessClose($thread)
                Return 1
        Else
                Return 0
        EndIf
EndFunc
 
Func _SetVar($var,$it = "")
        $text = ControlGetText("threaded by mea", "", "Edit1")
        $text = StringSplit($text,@CRLF)
        $data = ""
        For $i = 1 To $text[0]
                $temp = StringSplit($text[$i]," ")
                If $temp[1] = $var Then
                 ;
                Else
                        If Not $text[$i] = "" Then $data = $data & @CRLF & $text[$i]
                EndIf
        Next
        ControlSetText("threaded by mea", "", "Edit1",$data & @CRLF & $var & " " & $it)
EndFunc

