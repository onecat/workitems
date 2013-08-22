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
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListBoxConstants.au3>
#include <ProgressConstants.au3>
#Include <Constants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
 
Opt("TrayMenuMode", 1)
TraySetToolTip("自动更新下载程序")
 
$Name_U = "自动更新下载程序"
If WinExists($Name_U) Then Exit
AutoItWinSetTitle($Name_U)
 
FileInstall("MD5.dll", @TempDir & "\MD5.dll")
FileInstall("Server.ini", @ScriptDir & "\Server.ini")
 
$Dir = @ScriptDir & "\Server.ini"
 
$I_1 = @HOUR * 60 * 60
$S_1 = @MIN * 60
$X_1 = @SEC
 
$C_1 = $I_1 + $S_1 + $X_1
 
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "时间", "REG_SZ", $C_1)
 
If FileExists($Dir) = 0 Then
        IniWrite($Dir, "参数设置", "下载地址", "")
        IniWrite($Dir, "参数设置", "保存地址", "")
        IniWrite($Dir, "参数设置", "程序名称", "")
        IniWrite($Dir, "参数设置", "更新周期", "60000")
EndIf
 
$Down_0 = IniRead($Dir, "参数设置", "下载地址", "")
$Disk_0 = IniRead($Dir, "参数设置", "保存地址", "")
$Time_0 = IniRead($Dir, "参数设置", "更新周期", "")
$Name_0 = IniRead($Dir, "参数设置", "程序名称", "")
 
If $Down_0 = "" Then
        MsgBox(0, "提示:", "您未设置下载地址,此程序未能正常运行,请按提示正确填写!")
        $Input_Down = InputBox("下载地址", "请输入网络文件的下载地址:", "", " M", 250, 80, -1, -1, 20)
        If $Input_Down = "" Then
                MsgBox(0, "提示:", "未输入数据,程序将退出!")
                Exit
        EndIf
        IniWrite($Dir, "参数设置", "下载地址", $Input_Down)
EndIf
 
If $Disk_0 = "" Then IniWrite($Dir, "参数设置", "保存地址", @ScriptDir)
If $Time_0 = "" Then IniWrite($Dir, "参数设置", "更新周期", "1800")
If $Name_0 = "" Then
        MsgBox(0, "提示:", "您未设置下载程序的名称,将导致程序不能正常使用!")
        $Input_Name = InputBox("程序名称:", "请自定义下载文件的程序名称,请带后缀名.", "", " M", 280, 80, -1, -1, 20)
        If $Input_Name = "" Then
                MsgBox(0, "提示:", "未输入数据,程序将退出!")
                Exit
        EndIf
        IniWrite($Dir, "参数设置", "程序名称", $Input_Name)
EndIf
 
$Down = IniRead($Dir, "参数设置", "下载地址", "")
$Disk = IniRead($Dir, "参数设置", "保存地址", "")
$Time = IniRead($Dir, "参数设置", "更新周期", "")
$Name = IniRead($Dir, "参数设置", "程序名称", "")
 
$Reate = GUICreate("琴岛网络自动下载更新程序 V1.0", 350, 410, -1, -1)
 
$Input1 = GUICtrlCreateInput("", 150, 24, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input2 = GUICtrlCreateInput("", 150, 56, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input3 = GUICtrlCreateInput("", 150, 120, 180, 18, BitOR($ES_CENTER, $ES_UPPERCASE, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DISABLE)
$Input4 = GUICtrlCreateLabel(@YEAR & "年" & @MON & "月" & @MDAY & "日 " & @HOUR & ":" & @MIN & ":" & @SEC, 10, 382, 327, 20)
$List_0 = GUICtrlCreateLabel("", 265, 382, 100, 20)
 
$List = GUICtrlCreateList("", 10, 208, 329, 123)
 
$Progress1 = GUICtrlCreateProgress(150, 88, 180, 18)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
GUICtrlSetTip(-1, "下载地址: " & $Down & "")
$Progress2 = GUICtrlCreateProgress(150, 152, 180, 18)
 
$Label1 = GUICtrlCreateLabel("本地程序效验MD5值:", 18, 28, 110, 17)
$Label2 = GUICtrlCreateLabel("远程程序效验MD5值:", 18, 59, 110, 17)
$Label3 = GUICtrlCreateLabel("下载进度:", 18, 92, 110, 17)
$Label4 = GUICtrlCreateLabel("程序大小/剩余时间:", 18, 123, 110, 17)
$Label5 = GUICtrlCreateLabel("程序自动升级剩余时间:", 18, 155, 130, 17)
 
$Button1 = GUICtrlCreateButton("说明", 10, 344, 65, 25)
$Button2 = GUICtrlCreateButton("清除", 84, 344, 65, 25)
$Button3 = GUICtrlCreateButton("手动更新", 264, 344, 73, 25)
 
$Group1 = GUICtrlCreateGroup("", 10, 0, 329, 193)
 
GUISetState(@SW_HIDE)
 
$T1 = ""
$T2 = ""
 
$downsize = InetGetSize($Down)
Dim $File_2, $File
 
GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "首次启动,正在检查远程程序MD5值!|")
 
IF_Down()
 
While 1
        $tmsg = TrayGetMsg()
        $msg = GUIGetMsg()
        If $msg = $GUI_EVENT_CLOSE Then
                RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\TIME")
                FileDelete(@TempDir & "\MD5.dll")
                Exit
        EndIf
        If $msg = $Button3 Then
                Reate($Down, $Name, $downsize)
                GUICtrlSetData($Input1, _FileHash($Disk & "\" & $Name))
                Time_REG()
        EndIf
        If $msg = $Button2 Then GUICtrlSetData($List, "")
        If $msg = $GUI_EVENT_MINIMIZE Then
                opt("TrayIconHide",0)
                Opt("TrayMenuMode",1)
                GUISetState(@SW_HIDE, $Reate)
                TrayTip("定时自动更新工具", "已经最小化窗口了,点击这里可以还原!", 10, 1)
        EndIf
        If $msg = $Button1 Then
                $Box = MsgBox(0, "说明:", "这是一个能定时自动下载网络上的文件到本地的程序."& @CRLF & _
                                                   "简化了服务器上需要定时更新的麻烦,比如一些机器狗疫苗."& @CRLF & _
                                                   "但前提是配置文件上的地址需要固定..."& @CRLF & _
                                                   ""& @CRLF & _
                                                   "作者:破帽遮颜"& @CRLF & _
                                                   "QQ:780095"& @CRLF & _
                                                   "E-mail:maxxp@vip.qq.com"& @CRLF & _
                                                   ""& @CRLF & _
                                                   "欢迎热爱AU3的朋友加入QQ群:43194697,一起交流学习!")
                If $Box = 1 Then Run(@ProgramFilesDir & "\Internet Explorer\IEXPLORE.EXE 780095.qzone.qq.com")
        EndIf
        If $tmsg = $TRAY_EVENT_PRIMARYDOWN Then
                GUISetState(@SW_SHOW, $Reate)
        EndIf
        $T1 = @YEAR & "年" & @MON & "月" & @MDAY & "日 " & @HOUR & ":" & @MIN & ":" & @SEC
        If $T1 <> $T2 Then
                $T2 = $T1
                GUICtrlSetData($Input4, @YEAR & "年" & @MON & "月" & @MDAY & "日 " & @HOUR & ":" & @MIN & ":" & @SEC)
        EndIf
        Time_REG()
WEnd
 
Func Time_REG()
        $REG_C1 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "时间")
        $Time_REG = $Time + $REG_C1
        $I_2 = @HOUR * 60 * 60
        $S_2 = @MIN * 60
        $X_2 = @SEC
        $C_2 = $I_2 + $S_2 + $X_2
        $C_3 = $Time_REG - $C_2
;~      $C_4 = $C_3 / 60
;~      $C_5 = StringSplit($C_4, ".")
;~      GUICtrlSetData($List_0, "剩余" & $C_5[1] & "分更新")
        $P_0 = $Time / 10
        If $C_2 = $REG_C1 Then
                GUICtrlSetData($Progress2, 1)
        ElseIf $C_2 = $REG_C1 + $P_0 Then
                GUICtrlSetData($Progress2, 10)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 20)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 30)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 40)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 50)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 70)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 80)
        ElseIf $C_2 = $REG_C1 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 + $P_0 Then
                GUICtrlSetData($Progress2, 90)
        ElseIf $C_2 = $REG_C1 + $Time Then
                GUICtrlSetData($Progress2, 100)
        EndIf
        If $C_3 < 30 Then
                TrayTip("", "现在还剩余" & $C_3 & "秒即将开始执行更新任务.....", 10, 1)
        EndIf
        If $Time_REG = $C_2 Then
                RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\TIME", "时间", "REG_SZ", $C_2)
                IF_Down()
        EndIf
EndFunc
 
Func IF_Down()
        If FileExists($Disk & "\" & $Name) = 0 Then
                GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "未找到本地文件!|")
                GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "正从网络下载更新中!|")
                GUICtrlSetData($Input1, "获取本地文件MD5失败")
                Reate_Down($Down, $Name, $downsize)
                FileCopy(@WindowsDir & "\" & $Name, $Disk & "\" & $Name, 1)
                FileDelete(@WindowsDir & "\" & $Name)
                GUICtrlSetData($Input1, _FileHash($Disk & "\" & $Name))
        Else
                $File = _FileHash($Disk & "\" & $Name)
                GUICtrlSetData($Input1, $File)
                Reate_Down($Down, $Name, $downsize)
                If $File = $File_2 Then
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "MD5值相同,暂时不需要更新!|")
                        FileDelete(@WindowsDir & "\" & $Name)
                Else
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "MD5值对比不上,更在更新!|")
                        FileCopy(@WindowsDir & "\" & $Name, $Disk & "\" & $Name, 1)
                        FileDelete(@WindowsDir & "\" & $Name)
                        GUICtrlSetData($Input1, $File_2)
                        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "程序更新完毕!|")
                        GUICtrlSetData($Progress2, 0)
                EndIf
        EndIf
EndFunc
 
Func Reate($Down, $Name, $upd_Size)
        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "正在手动更新中!|")
        InetGet($Down, $Disk & "\" & $Name, 1, 1)
        TraySetState(4)
        While 1
                $DnPercent = Int(InetRead  / $upd_Size * 100)
                $DnBytes = Round(InetRead  / 1024) & ' KB'
                $DnSize = Round($upd_Size / 1024) & ' KB'
                GUICtrlSetData($Progress1, $DnPercent)
                GUICtrlSetData($Input3, $DnSize & " / " & $DnPercent & "%")
                TrayTip("更新情况:", "更新进度:" & $DnPercent & "% (当前更新:" & $DnBytes & "/文件大小:" & $DnSize & ")", 1)
                Sleep(250)
        WEnd
        GUICtrlSetData($Input3, $DnSize & " / " & "100%")
        TraySetState(8)
        $File_3 = _FileHash($Disk & "\" & $Name)
        GUICtrlSetData($Input2, $File_3)
        GUICtrlSetData($Progress1, 0)
        TrayTip("更新情况:", "更新进度:100% (当前更新:" & $DnBytes & "/文件大小:" & $DnBytes & ")", 1)
        TrayTip("", "", 1)
        GUICtrlSetData($List, @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & " " & "已下载完毕!|")
EndFunc
 
Func _FileHash($sFile, $iRunErrorsFatal = -1, $vEXEPath = -1)
        Local $sEXEPath, $hPID, $sLine, $iFileNameLen, $sHash, $iOPT, $iHashLen
        If Not FileExists($sFile) Or StringInStr(FileGetAttrib($sFile), "D") _
                        Or StringInStr($sFile, "*") _
                        Or StringInStr($sFile, "?") _
                        Or Not StringInStr($sFile, "\") Then
                SetError(1)
                Return ""
        EndIf
        $sEXEPath = @TempDir & "\MD5.dll"
        $iHashLen = 32
        If Not ($iRunErrorsFatal = 0 _
                        Or $iRunErrorsFatal = 1 _
                        Or $iRunErrorsFatal = -1) Then
                SetError(3)
                Return ""
        EndIf
        If $vEXEPath <> -1 Then
                $sEXEPath = $vEXEPath
        EndIf
        If (Not FileExists($sEXEPath)) _
                        Or StringInStr($sEXEPath, "*") _
                        Or StringInStr($sEXEPath, "?") Then
                SetError(4)
                Return ""
        EndIf
        $hPID = Run('"' & $sEXEPath & '" "' & $sFile & '"', @SystemDir, @SW_HIDE, 2)
        $iError = @error
        If $iError Then
                SetError(5)
                Return ""
        EndIf
        ProcessWaitClose($hPID)
        $sLine = StdoutRead($hPID)
        $iFileNameLen = StringLen($sFile)
        $sLine = StringTrimRight($sLine, 2)
        If Not StringLen($sLine) = $iHashLen + 1 + $iFileNameLen Then
                SetError(6)
                Return ""
        EndIf
        If StringRight($sLine, $iFileNameLen) <> $sFile Then
                SetError(6)
                Return ""
        EndIf
        $sHash = StringLeft($sLine, $iHashLen)
        If Not StringIsXDigit($sHash) Then
                SetError(6)
                Return ""
        EndIf
        SetError(0)
        Return $sHash
EndFunc
 
Func Reate_Down($Down, $Name, $upd_Size)
        InetGet($Down, @WindowsDir & "\" & $Name, 1, 1)
        TraySetState(4)
        While 1
                $DnPercent = Int(InetRead  / $upd_Size * 100)
                $DnBytes = Round(InetRead  / 1024) & ' KB'
                $DnSize = Round($upd_Size / 1024) & ' KB'
                GUICtrlSetData($Progress1, $DnPercent)
                GUICtrlSetData($Input3, $DnSize & " / " & $DnPercent & "%")
                TrayTip("更新情况:", "更新进度:" & $DnPercent & "% (当前更新:" & $DnBytes & "/文件大小:" & $DnSize & ")", 1)
                Sleep(250)
        WEnd
        GUICtrlSetData($Input3, $DnSize & " / " & "100%")
        TraySetState(8)
        $File_2 = _FileHash(@WindowsDir & "\" & $Name)
        GUICtrlSetData($Input2, $File_2)
        GUICtrlSetData($Progress1, 0)
        TrayTip("更新情况:", "更新进度:100% (当前更新:" & $DnBytes & "/文件大小:" & $DnBytes & ")", 1)
        Sleep(250)
        TrayTip("", "", 1)
        GUICtrlSetData($Progress2, 0)
EndFunc
