#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <Date.au3>
Local Const $NETWORK_ALIVE_LAN = 0x1 
;=========================================================================================
;У׼ϵͳʱ��
;=========================================================================================
Func SynSysTime()
        ;���ж������Ƿ����ӣ�0��ʾ�Ͽ���1��ʾ����
        Local $NetCon = DllCall("sensapi.dll", "int", "IsNetworkAlive", "str", $NETWORK_ALIVE_LAN)
        $x = $NetCon[0]
        If $x = 1 Then
                ;Ԥ�ȶ�ȡʱ���ʽ
                Local $Regkey = 'HKEY_CURRENT_USER\Control Panel\International'
                Local $sShortDate = RegRead($Regkey, 'sShortDate')
                Local $sLongDate = RegRead($Regkey, 'sLongDate')
                Local $sTimeFormat = RegRead($Regkey, 'sTimeFormat')
                Local $sShortTime = RegRead($Regkey, 'sShortTime')
                ;������Ǳ�׼ʱ���ʽ����ô���޸�Ϊ��׼ʱ���ʽ�����ʹ�����Զ����ʱ���ʽ����ʱ��ͬ��ʧ��
                If $sShortDate <> 'yyyy/M/d' Then
                        RegWrite($Regkey, 'sShortDate', 'REG_SZ', 'yyyy/M/d')
                EndIf
                If $sLongDate <> "yyyy'��'M'��'d'��'" Then
                        RegWrite($Regkey, 'sLongDate', 'REG_SZ', "yyyy'��'M'��'d'��'")
                EndIf
                If $sTimeFormat <> 'H:mm:ss' Then
                        RegWrite($Regkey, 'sTimeFormat', 'REG_SZ', 'H:mm:ss')
                EndIf
                If $sShortTime <> 'H:mm' Then
                        RegWrite($Regkey, 'sShortTime', 'REG_SZ', 'H:mm')
                EndIf
                ;��ʼͬ��ʱ��
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
                ;��ԭʱ���ʽ����
                RegWrite($Regkey, 'sShortDate', 'REG_SZ', $sShortDate)
                RegWrite($Regkey, 'sLongDate', 'REG_SZ', $sLongDate)
                RegWrite($Regkey, 'sTimeFormat', 'REG_SZ', $sTimeFormat)
                RegWrite($Regkey, 'sShortTime', 'REG_SZ', $sShortTime)
                MsgBox(64, "�ҵ�С��飡", "��ǰϵͳ��ʱ���Ѿ�У׼��ɣ�", 5)
        Else
                MsgBox(16, '�ҵ�С��飡', 'ò�Ƶ�ǰû�����ӵ�������' & @LF & 'Ŷ������У׼����ʱ�䣡', 5)
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
;~         ConsoleWrite('��['&$x&']��OK '&$data&@lf)
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
