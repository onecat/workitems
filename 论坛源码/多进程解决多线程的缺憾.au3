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
#include "Au3_Thread.au3"
#include <Sound.au3>

;设置一个变量,所有子进程可用
_SetVar("AudioFile","C:\Windows\Media\ir_end.wav")

;创建一个进程后台播放音乐
Global $Pid_PlayMusic = _CreateThread("PlayMusic")
Sleep(500)

;杀掉后台播放音乐的进程
_KillThread($Pid_PlayMusic)
xExit()


;播放音乐函数,创建后台进程时会用到
Func PlayMusic()
        SoundPlay(_GetVar("AudioFile"),1)
EndFunc

Func GetSoundLength($sFile)
        Local $sound = _SoundOpen($sFile)
If @error = 2 Then
        Return "0"
ElseIf @extended <> 0 Then
    Local $extended = @extended 
    Local $stText = DllStructCreate("char[128]")
    Local $errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
    MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
        Return "0"
Else
        Return _SoundLength($sound, 2)
EndIf
EndFunc

Func xExit()
        If Processexists($Pid_PlayMusic) Then ProcessClose($Pid_PlayMusic)
        _SetVar("AudioFile")
	EndFunc
	
	
#cs --------------------------------------------
AutoIT版本: Au3_Thread.au3  on 3.3.7.15
  脚本作者: L4EVER
  电子邮件: ZC0629[at]Gmail.com
         QQ/TM: 425145
  脚本说明: 多进程解决多线程的缺憾
  
  创建线程 : _CreateThread("函数名")
                        返回创建的线程pid值
                                
  关闭线程 : _KillThread(由_CreateThread返回的pid)
                        返回1成功,返回0失败,
  
  创建全局变量 : _SetVar("变量名","变量值")
                        变量值为空就清除这个变量
                        返回1成功,返回其他失败
                        
  获取全局变量 : _GetVar("变量名")
                        返回数据则正常,否则返回@error
  
#ce --------------------------------------------


#NoTrayIcon
If $cmdline[0] > 0 Then
        $str = call($cmdline[1])
        Exit
EndIf

Opt("TrayIconHide", 0)
Func _CreateThread($thread)
        if @compiled Then
        Return Run(@ScriptFullPath & " " & $thread)
Else
        Return ShellExecute (@ScriptFullPath,$thread)
EndIf

EndFunc

Func _KillThread($thread)
        If ProcessExists($thread) <> 0 Then
                ProcessClose($thread)
                Return 1
        Else
                Return 0
        EndIf
EndFunc

Func _SetVar($Str,$Key="")
        $AppKey = StringReplace(StringReplace(@ScriptName,".au3",""),".exe","")
        if $Key <> "" Then
        $RegWriteResult = Regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str,"REG_SZ", $Key)
        Else
        $RegWriteResult = RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str)
        EndIf

        if $RegWriteResult = 0  Then
                Return @Error
        Else
                Return $RegWriteResult
        EndIf
EndFunc

Func _GetVar($Str)
        $AppKey = StringReplace(StringReplace(@ScriptName,".au3",""),".exe","")
        $RegReadResult = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str)
        if $RegReadResult = "" Then
                        Return @error 
                Else
                        Return $RegReadResult
                EndIf
EndFunc	
