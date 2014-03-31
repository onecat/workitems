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
Local Const $NETWORK_ALIVE_LAN = 0x1 
;=========================================================================================
;校准系统时间
;=========================================================================================
Func SynSysTime()
        ;先判定网络是否连接，0表示断开，1表示连接
        Local $NetCon = DllCall("sensapi.dll", "int", "IsNetworkAlive", "str", $NETWORK_ALIVE_LAN)
        $x = $NetCon[0]
        If $x = 1 Then
                ;预先读取时间格式
                Local $Regkey = 'HKEY_CURRENT_USER\Control Panel\International'
                Local $sShortDate = RegRead($Regkey, 'sShortDate')
                Local $sLongDate = RegRead($Regkey, 'sLongDate')
                Local $sTimeFormat = RegRead($Regkey, 'sTimeFormat')
                Local $sShortTime = RegRead($Regkey, 'sShortTime')
                ;如果不是标准时间格式，那么就修改为标准时间格式，如果使用了自定义的时间格式，会时间同步失败
                If $sShortDate <> 'yyyy/M/d' Then
                        RegWrite($Regkey, 'sShortDate', 'REG_SZ', 'yyyy/M/d')
                EndIf
                If $sLongDate <> "yyyy'年'M'月'd'日'" Then
                        RegWrite($Regkey, 'sLongDate', 'REG_SZ', "yyyy'年'M'月'd'日'")
                EndIf
                If $sTimeFormat <> 'H:mm:ss' Then
                        RegWrite($Regkey, 'sTimeFormat', 'REG_SZ', 'H:mm:ss')
                EndIf
                If $sShortTime <> 'H:mm' Then
                        RegWrite($Regkey, 'sShortTime', 'REG_SZ', 'H:mm')
                EndIf
                ;开始同步时间
                $_Now_date = _GetSrv_Date()
                $_Now_Splt = StringSplit($_Now_date, " ")
                If StringInStr($_Now_Splt[1], '/') Then
                        $NowData = StringSplit($_Now_Splt[1], "/")
                Else
                        $NowData = StringSplit($_Now_Splt[1], "-")
                EndIf
                $NowTime = StringSplit($_Now_Splt[2], ":")
                _SetDate($NowData[3], $NowData[2], $NowData[1])
                _SetTime($NowTime[1], $NowTime[2], $NowTime[3])
                ;还原时间格式设置
                RegWrite($Regkey, 'sShortDate', 'REG_SZ', $sShortDate)
                RegWrite($Regkey, 'sLongDate', 'REG_SZ', $sLongDate)
                RegWrite($Regkey, 'sTimeFormat', 'REG_SZ', $sTimeFormat)
                RegWrite($Regkey, 'sShortTime', 'REG_SZ', $sShortTime)
                MsgBox(64, "我滴小伙伴！", "当前系统的时间已经校准完成！", 5)
        Else
                MsgBox(16, '我滴小伙伴！', '貌似当前没能连接到互联网' & @LF & '哦！所以校准不了时间！', 5)
        EndIf
EndFunc   ;==>SynSysTime

Func _GetSrv_Date()
        Local $_Srvlist[15] = ["ntp.api.bz", _
                        "time-nw.nist.gov", _
                        "time-a.nist.gov", _
                        "time-b.nist.gov", _
                        "time-a.timefreq.bldrdoc.gov", _
                        "time-b.timefreq.bldrdoc.gov", _
                        "time-c.timefreq.bldrdoc.gov", _
                        "utcnist.colorado.edu", _
                        "time.nist.gov", _
                        "nist1.datum.com", _
                        "nist1.dc.glassey.com", _
                        "nist1.ny.glassey.com", _
                        "nist1.sj.glassey.com", _
                        "nist1.aol-ca.truetime.com", _
                        "nist1.aol-va.truetime.com"]
        UDPStartup()
        Local $_Time_Srv
        For $x = 0 To UBound($_Srvlist) - 1
                $_Time_Srv = $_Srvlist[$x]
                Local $Socket = UDPOpen(TCPNameToIP($_Time_Srv), 123)
                If @error <> 0 Then ContinueLoop
                $Status = UDPSend($Socket, MakePacket())
                If $Status = 0 Then ContinueLoop
                Local $data = "", $i = 0
                While $data = ""
                        $i += 1
                        $data = UDPRecv($Socket, 100)
                        If $i = 5 Then ContinueLoop (2)
                        Sleep(88)
                WEnd
                UDPCloseSocket($Socket)
                UDPShutdown()
                ExitLoop
        Next
        If $data = "" Then Return 0
        $data = UnsignedHexToDec(StringMid($data, 83, 8))
        $data = _DateTimeFormat(_DateAdd("s", $data, "1900/01/01 08:00:00"), 0)
;~         ConsoleWrite('第['&$x&']个OK '&$data&@lf)
        Return $data
EndFunc   ;==>_GetSrv_Date

Func MakePacket()
        Local $P, $D = "1b0e01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
        While $D
                $P &= Chr(Dec(StringLeft($D, 2)))
                $D = StringTrimLeft($D, 2)
        WEnd
        Return $P
EndFunc   ;==>MakePacket

Func UnsignedHexToDec($_Data)
        Return Dec(StringTrimRight($_Data, 1)) * 16 + Dec(StringRight($_Data, 1))
EndFunc   ;==>UnsignedHexToDec
