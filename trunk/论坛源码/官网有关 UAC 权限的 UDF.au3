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
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#region ;**** Directives created by AutoIt3Wrapper_GUI ****s
#include <GUIButton.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Winapi.au3>

$sTitle = "UAC 权限提升与取消示例"

If StringRegExp(@OSVersion, "_(XP|200(0|3))") Then
    MsgBox(16 + 262144, $sTitle, "仅运行于 Vista+ 系统")
    Exit
ElseIf Not @Compiled Then
    MsgBox(16 + 262144, $sTitle, "必须编译为 exe 文件后运行")
    Exit
EndIf

$hGui = GUICreate($sTitle, 340, 90, Default,Default,Default, $WS_EX_TOPMOST)

If IsAdmin() Then
    GUICtrlCreateLabel("已提升脚本运行权限 (在管理员权限)", 10, 10, 320, 20, $SS_CENTER)
Else
    GUICtrlCreateLabel("未提升脚本运行权限 (在标准用户权限)", 10, 10, 320, 20, $SS_CENTER)
EndIf

$c_Btn_Elevate = GUICtrlCreateButton("提升脚本运行权限", 25, 30, 135, 30)
If IsAdmin() Then GUICtrlSetState(-1, $GUI_DISABLE)
_GUICtrlButton_SetShield(GUICtrlGetHandle($c_Btn_Elevate))

$c_Btn_DeElevate = GUICtrlCreateButton("删除已提升的权限", 180, 30, 135, 30)
If Not IsAdmin() Then GUICtrlSetState(-1, $GUI_DISABLE)

$c_ChkB_Elavate_Always = GUICtrlCreateCheckbox("启动时自动提升", 25, 65)
GUICtrlSetTip(-1, "选中此框将增加 ""程序兼容标志(AppCompatFlag)"" 到注册表" & @CRLF & @CRLF & _
        "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" & @CRLF & @CRLF & _
        ",添加可执行 URL 作为 RUNAS 系统管理员权限." & @CRLF & @CRLF & _
        "在移动或删除脚本时,需确保未选中此复选框 (相关注册表项" & @CRLF & _
        "将被删除) 不产生孤立的注册表键值.", "自动提升", 1, 1)
If Not IsAdmin() Then;如果没有管理员权限，则
    GUICtrlSetState(-1, $GUI_DISABLE);禁用 "自动提升" 复选框
Else;否则,
    If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", _
                        @ScriptFullPath) = "RUNASADMIN" Then GUICtrlSetState(-1, $GUI_CHECKED);选中 "自动提升" 复选框
EndIf

GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $c_Btn_Elevate;"提升脚本" 按钮
            If ShellExecute(@ScriptName, "", "", "runas") Then;@ScriptName=当前运行脚本的文件名
                Exit
            Else
                MsgBox(16 + 262144, $sTitle & " - 错误", "发生错误,你要取消 UAC 提示吗?")
            EndIf

        Case $c_Btn_DeElevate;"删除提升" 按钮
            $iPID = _RunWithReducedPrivileges(@ScriptName, "", @ScriptDir)
            $iError = @error
                        If $iError Then $iError &= @CRLF & _WinAPI_GetLastError() & @CRLF & _WinAPI_GetLastErrorMessage()
            If ProcessExists($iPID) Then
                Exit
            Else
                MsgBox(16 + 262144, $sTitle & " - 错误", "发生错误..." & @CRLF & "错误代码: " & $iError)
            EndIf

        Case $c_ChkB_Elavate_Always
            $sRegString = "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
            Switch GUICtrlRead($c_ChkB_Elavate_Always)
                Case 1
                    If Not RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptFullPath, "REG_SZ", "RUNASADMIN") Then
                        MsgBox(16 + 262144, $sTitle & " - 错误", "发生错误, 无法写入注册表的 AppCompatFlag 键项.")
                        GUICtrlSetState($c_ChkB_Elavate_Always, $GUI_UNCHECKED)
                    Else
                        MsgBox(16 + 262144, $sTitle, "已添加 'RUNASADMIN' 键值.")
                    EndIf

                Case Else
                    If Not RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptFullPath) Then
                        MsgBox(16 + 262144, $sTitle & " - 错误", "发生错误, 无法写入注册表的 AppCompatFlag 键项.")
                        GUICtrlSetState($c_ChkB_Elavate_Always, $GUI_UNCHECKED)
                    Else
                        MsgBox(16 + 262144, $sTitle & " - 错误", "已删除 'RUNASADMIN' 键值.")
                    EndIf

            EndSwitch

    EndSwitch
WEnd

Exit

; ===============================================================================================================================
; 以下可另存为包含文件, 名称: <_RunWithReducedPrivileges.au3>
;
; 为运行程序降低权限.
;   用于运行在一个高特权模式时, 降低权限运行程序.
;   - 存在的常见问题是 drag-and-drop 不工作, 与杂项函数 (sendmessage, 等等) 不工作.
;
; 函数:
;   _RunWithReducedPrivileges()     ; 如果目前在一个高特权模式下运行,降低权限运行程序
;
; 内部函数:
;   _RWRPCleanup()      ; 上述函数的辅助函数
;
; 参考:
;   See 'Creating a process with Medium Integration Level from the process with High Integration Level in Vista'
;       @ http://www.codeproject.com/KB/vista-security/createprocessexplorerleve.aspx
;     See Elmue's comment 'Here the cleaned and bugfixed code'
;   Also see: 'High elevation can be bad for your application: How to start a non-elevated process at the end of the installation'
;       @ http://www.codeproject.com/KB/vista-security/RunNonElevated.aspx
;     (Elmue has the same code here too in his response to FaxedHead's comment ('Another alternative to this method'))
;   Another alternative using COM methods:
;     'Getting the shell to run an application for you - Part 2:How | BrandonLive'
;       @ http://brandonlive.com/2008/04/27/gettin...o-run-an-application-for-you-p
;
; 作者: Ascend4nt, based on code by Elmue's fixed version of Alexey Gavrilov's code
; ===============================================================================================================================

; ===================================================================================================================
; 名称 ...: _RunWithReducedPrivileges($sPath,$sCmd='',$sFolder='',$iShowFlag=@SW_SHOWNORMAL,$bWait=False)
;
; 描述 ...: 以低权限运行程序. 用于运行在一个高特权模式时, 降低权限运行程序..
;   - 存在的常见问题是 drag-and-drop 不工作, 与杂项函数 (sendmessage, 等等) 不工作.
; 参数 ...:        $sPath = 可执行路径
;                         $sCmd = 命令行 (可选)
;                         $sFolder = 启动文件夹 (可选)
;                         $iShowFlag = 如何启动程序. 默认 @SW_SHOWNORMAL. 所有常规 @SW_SHOW* 宏在这里都能工作
;                         $bWait = 如为 True, 返回退出代码之前等待进程完成
;                                   如为 False, 无需等待过程结束,返回进程 ID #
; 返回 ...: 成功: 如果 $bWait=True, 返回进程的退出代码. 如果 $bWait=False, 返回进程 ID.
;                         失败: 0, @error 设置为:
;                               @error = 2 = DLLCall 错误. @extended 包含 DLLCall 错误代码 (见 AutoIt 帮助)
;                               @error = 3 = API 返回失败. 调用 'GetLastError' API 函数获取其它消息.
; 作者 ...: Ascend4nt, based on code by Elmue's fixed version of Alexey Gavrilov's code
; ===================================================================================================================

Func _RunWithReducedPrivileges($sPath, $sCmd = '', $sFolder = '', $iShowFlag = @SW_SHOWNORMAL, $bWait = False)
    Local $aRet, $iErr, $iRet = 1, $hProcess, $hToken, $hDupToken, $stStartupInfo, $stProcInfo
    Local $sCmdType = "wstr", $sFolderType = "wstr"

;~  正常运行,如果不是在一个提升状态,或 Vista 之前的系统
    If Not IsAdmin() Or StringRegExp(@OSVersion, "_(XP|200(0|3))") Then ; XP, XPe, 2000, 或 2003?
        If $bWait Then Return RunWait($sPath & ' ' & $sCmd, $sFolder)
        Return Run($sPath & ' ' & $sCmd, $sFolder)
    EndIf

;~  检查参数类型及调整相应的 DLLCall
    If Not IsString($sCmd) Or $sCmd = '' Then
        $sCmdType = "ptr"
        $sCmd = 0
    EndIf
    If Not IsString($sFolder) Or $sFolder = '' Then
        $sFolderType = "ptr"
        $sFolder = 0
    EndIf
    #cs
        ; STARTUPINFOW 结构: cb,lpReserved,lpDesktop,lpTitle,dwX,dwY,dwXSize,dwYSize,dwXCountChars,dwYCountChars,dwFillAttribute,
        ;   dwFlags,wShowWindow,cbReserved2,lpReserved2,hStdInput,hStdOutput,hStdError
        ;   注意: 这是创建进程的信息. 另外, 不知道 I/O 可以重定向..?
    #ce
    $stStartupInfo = DllStructCreate("dword;ptr[3];dword[7];dword;word;word;ptr;handle[3]")
    DllStructSetData($stStartupInfo, 1, DllStructGetSize($stStartupInfo))
    DllStructSetData($stStartupInfo, 4, 1) ; STARTF_USESHOWWINDOW
    DllStructSetData($stStartupInfo, 5, $iShowFlag)

    ; PROCESS_INFORMATION 结构: hProcess, hThread, dwProcessId, dwThreadId
    ;   这是 *receiving* 消息
    $stProcInfo = DllStructCreate("handle;handle;dword;dword")

;~  打开该进程的句柄
    ; 资源管理器在一个较低的权限下运行, 因此它是我们的安全信息的基础.
    ;   使用 PROCESS_QUERY_INFORMATION (0x0400) 访问权打开进程
    $aRet = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", 0x0400, "bool", False, "dword", ProcessExists("explorer.exe"))
    If @error Then Return SetError(2, @error, 0)
    If Not $aRet[0] Then Return SetError(3, 0, 0)
    $hProcess = $aRet[0]

;~  打开一个进程令牌句柄 (复制)
    ; TOKEN_DUPLICATE = 0x0002
    $aRet = DllCall("advapi32.dll", "bool", "OpenProcessToken", "handle", $hProcess, "dword", 2, "handle*", 0)
    If @error Then Return SetError(_RWRPCleanup($hProcess, 0, 0, 2, @error), @extended, 0)
    If $aRet[0] = 0 Then Return SetError(_RWRPCleanup($hProcess, 0, 0, 3), @extended, 0)
    $hToken = $aRet[3]

;~  复制令牌句柄
    ; TOKEN_ALL_ACCESS = 0xF01FF, SecurityImpersonation = 2, TokenPrimary = 1,
    $aRet = DllCall("advapi32.dll", "bool", "DuplicateTokenEx", "handle", $hToken, "dword", 0xF01FF, "ptr", 0, "int", 2, "int", 1, "handle*", 0)
    If @error Then Return SetError(_RWRPCleanup($hProcess, $hToken, 0, 2, @error), @extended, 0)
    If Not $aRet[0] Then Return SetError(_RWRPCleanup($hProcess, $hToken, 0, 3), @extended, 0)
    $hDupToken = $aRet[6]

;~  使用 'CreateProcessWithTokenW' 建立进程(Vista+ 系统函数)
    $aRet = DllCall("advapi32.dll", "bool", "CreateProcessWithTokenW", "handle", $hDupToken, "dword", 0, "wstr", $sPath, $sCmdType, $sCmd, _
            "dword", 0, "ptr", 0, $sFolderType, $sFolder, "ptr", DllStructGetPtr($stStartupInfo), "ptr", DllStructGetPtr($stProcInfo))
    $iErr = @error
    _RWRPCleanup($hProcess, $hToken, $hDupToken, 2, @error)
    If $iErr Then Return SetError(2, $iErr, 0)
    If Not $aRet[0] Then Return SetError(3, 0, 0)

;~  MsgBox(0,"信息","进程信息数据: 进程句柄:"&DllStructGetData($stProcInfo,1)&", 线程句柄:"&DllStructGetData($stProcInfo,2)& _
;~      ", 进程 ID:"&DllStructGetData($stProcInfo,3)&", 线程 ID:"&DllStructGetData($stProcInfo,4)&@CRLF)

    $iRet = DllStructGetData($stProcInfo, 3) ; 进程 ID

;~  如果调用 'RunWait' 模式, 等待进程结束
    If $bWait Then
        ProcessWaitClose($iRet)
        $iRet = @extended ; 退出代码
    EndIf

;~  关闭线程与进程句柄 (顺序很重要):
    _RWRPCleanup(0, DllStructGetData($stProcInfo, 2), DllStructGetData($stProcInfo, 1), 0)

    Return $iRet
EndFunc   ;==>_RunWithReducedPrivileges

; ===================================================================================================================
; Func _RWRPCleanup($hProcess,$hToken,$hDupToken,$iErr=0,$iExt=0)
;
; INTERNAL: _RunWithReducedPrivileges() 的辅助函数
;
; Author: Ascend4nt
; ===================================================================================================================

Func _RWRPCleanup($hProcess, $hToken, $hDupToken, $iErr = 0, $iExt = 0)
    Local $aHandles[3] = [$hToken, $hDupToken, $hProcess] ; order is important
    For $i = 0 To 2
        If $aHandles[$i] <> 0 Then DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $aHandles[$i])
    Next
    Return SetExtended($iExt, $iErr)
EndFunc   ;==>_RWRPCleanup
