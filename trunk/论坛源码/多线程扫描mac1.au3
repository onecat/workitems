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
#AutoIt3Wrapper_UseX64=y        ; x86系统应将=y改为=n。

#include <Thread.au3>
#include <Array.au3>

Const $tagSCAN_MAC = "PTR inet_addr;PTR SendARP;ULONG_PTR Breakpoint;UBYTE code[128]"
Const $tagSCAN_PARAMS = "CHAR szIPAddress[16];UBYTE bPhysicalAddress[8];ULONG ulLength;ULONG ulStatus"

; 打开DLL（将DLL加载至自身进程空间。）
; ======================================================
DllOpen("Ws2_32.dll")
DllOpen("Iphlpapi.dll")
; ======================================================

; 初始化线程函数。
; ======================================================
Local $pStartAddr = _RTVirtualAlloc(4096)
Local $tStartAddr = DllStructCreate($tagSCAN_MAC, $pStartAddr)
Local $pProcedure = DllStructGetPtr($tStartAddr, "code")

DllStructSetData($tStartAddr, "inet_addr", _RTGetProcAddress("Ws2_32.dll", "inet_addr"))
DllStructSetData($tStartAddr, "SendARP", _RTGetProcAddress("Iphlpapi.dll", "SendARP"))
DllStructSetData($tStartAddr, "Breakpoint", 0xCCCCCCCC)
DllStructSetData($tStartAddr, "code", _ScanMacGetShellX())
; ======================================================

Local $hTimerStamp = TimerInit(), $aBuffer[255][4], $iUBound = UBound($aBuffer)

; 循环创建255个线程，一个线程负责一个IP的扫描。
; ======================================================
For $i = 0 To $iUBound - 1
        $aBuffer[$i][0] = StringFormat("192.168.18.%d", $i + 1)
        $aBuffer[$i][2] = DllStructCreate($tagSCAN_PARAMS)

        DllStructSetData($aBuffer[$i][2], "szIPAddress", $aBuffer[$i][0])

        $aBuffer[$i][3] = _RTCreateThread($pProcedure, DllStructGetPtr($aBuffer[$i][2]))
Next
; ======================================================

; 等待所有线程运行结束。
; ======================================================
For $i = 0 To $iUBound - 1
        _RTWaitForObject($aBuffer[$i][3])
        _RTCloseHandle($aBuffer[$i][3])

        ; 读出扫描结果。
        $aBuffer[$i][1] = DllStructGetData($aBuffer[$i][2], "bPhysicalAddress")
        $aBuffer[$i][2] = DllStructGetData($aBuffer[$i][2], "ulStatus")
Next
; ======================================================

ReDim $aBuffer[$iUBound][3]
_ArrayDisplay($aBuffer, TimerDiff($hTimerStamp))

Func _ScanMacGetShellX($bX64 = @AutoItX64)

        If $bX64 Then
                Return Binary("0x5341544C8BE141554C8BEC4883EC404883E4F0E8000000005B4881E300F0FFFFFF13488BC833D24D8D4424104D8D4C241841C70108000000FF5308418944241C498BE5415D415C5BC3")
        Else
                Return Binary("0x558BEC568B750853E8000000005B83EB1956FF138D4E18516A088F0183E908516A0050FF530489461C5B5E5DC20400CCCCCCCCCC")
        EndIf
EndFunc        ;==>_ScanMacGetShellX