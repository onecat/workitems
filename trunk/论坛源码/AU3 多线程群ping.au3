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
#include <Thread.au3>
#include <Array.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiIPAddress.au3>


$Form1 = GUICreate("AU3局域网群Ping MAC地址扫描", 510, 420)
$ini = @ScriptDir&"\IPmac.txt"

dim $Button[256]
$h = 30
$s = 20
for $i = 1 to 255
$Button[$i] = GUICtrlCreateButton($i, $h, $s, 30, 20)
GUICtrlSetState(-1,$GUI_DISABLE)
$h = $h + 30
if $h > 450 then
$h = 30
$s = $s + 20
endif
next


$Label1 = GUICtrlCreateLabel("起始IP：", 40, 385, 50, 17)
$IPAddress1 = _GUICtrlIpAddress_Create($Form1, 90, 381, 153, 21)
_GUICtrlIpAddress_Set($IPAddress1, "192.168.1.1")
$Buttona1 = GUICtrlCreateButton("开始", 260, 380, 75, 25)
$Buttona2 = GUICtrlCreateButton("退出", 350, 380, 75, 25)


GUISetState(@SW_SHOW)
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                case $Buttona1
                        $zx = 0
                        p()
                        msgbox(0,"扫描完成","在线主机："&$zx&"台！",999,$Form1)
                case $Buttona2
                        Exit
        EndSwitch
WEnd


func p()
$hDll = DllOpen("iphlpapi.dll")
Const $pSendARP = _RTGetProcAddress("Iphlpapi.dll", "SendARP")
Const $pinet_addr = _RTGetProcAddress("Ws2_32.dll", "inet_addr")
Const $tagSEND_ARP = "char IpAddress[16];ubyte MacAddress[8];dword AddrLen;dword Error"
$pStartAddr = _RTVirtualAlloc(512)
$bCode = "0x" & _
        "55" & _                                        ; push ebp
        "8BEC" & _                                      ; mov ebp, esp
        "FF7508" & _                                    ; push dword ptr [ebp+8]
        "B8" & _RTLongPtrToBytes($pinet_addr) & _       ; mov eax, Ws2_32.inet_addr
        "FFD0" & _                                      ; call eax
        "8B5D08" & _                                    ; mov ebx, dword ptr [ebp+8]
        "53" & _                                        ; push ebx
        "8D7B18" & _                                    ; lea edi, dword ptr [ebx+18]
        "C70708000000" & _                              ; mov dword ptr [edi], 8
        "57" & _                                        ; push edi
        "8D7B10" & _                                    ; lea edi, dword ptr [ebx+10]
        "57" & _                                        ; push edi
        "6A00" & _                                      ; push 0
        "50" & _                                        ; push eax
        "B8" & _RTLongPtrToBytes($pSendARP) & _         ; mov eax, Iphlpapi.SendARP
        "FFD0" & _                                      ; call eax
        "5B" & _                                        ; pop ebx
        "89431C" & _                                    ; mov dword ptr [ebx+1c], eax
        "5D" & _                                        ; pop ebp
        "C20400"                                        ; ret 4
 
_RTInject($pStartAddr, $bCode)
 
Local $aBuffer[256], $iUBound = UBound($aBuffer)
Local $aThread[$iUBound], $aResult[$iUBound][3], $iTimer = TimerInit()

$ip = _GUICtrlIpAddress_GetArray($IPAddress1)
$ipd = $ip[0]&"."&$ip[1]&"."&$ip[2]&"."
For $i = $ip[3] To UBound($aBuffer) - 1
        $aBuffer[$i] = DllStructCreate($tagSEND_ARP)
        DllStructSetData($aBuffer[$i], "IpAddress",$ipd&$i)
 
        $aThread[$i] = _RTCreateThread($pStartAddr, DllStructGetPtr($aBuffer[$i]))
Next

For $i = $ip[3] To UBound($aBuffer) - 1
        _RTWaitForObject($aThread[$i])
        _RTCloseHandle($aThread[$i])
        $aResult[$i][0] = DllStructGetData($aBuffer[$i], "IpAddress")
        $aResult[$i][1] = DllStructGetData($aBuffer[$i], "MacAddress")
        $aResult[$i][2] = DllStructGetData($aBuffer[$i], "Error")
        if $aResult[$i][2] <> 31 then
        GUICtrlSetBkColor($Button[$i], 0x00ff00)
        $m = StringLeft(StringTrimLeft($aResult[$i][1], 2),12)
        $m = StringSplit($m, "")
        $m = $m[1]&$m[2]&"-"&$m[3]&$m[4]&"-"&$m[5]&$m[6]&"-"&$m[7]&$m[8]&"-"&$m[9]&$m[10]&"-"&$m[11]&$m[12]
        IniWrite($ini, "IP=MAC", $aResult[$i][0], $m)
        $zx = $zx + 1
        endif
        $aBuffer[$i] = 0
Next
DllClose($hDll)
;_Arraydisplay($aResult, TimerDiff($iTimer))
endfunc

;~ Func _RTInject($pStartAddr, $bBinaryCode)
;~         Local $fResult
;~         $fResult = _RTWriteBytes($pStartAddr, $bBinaryCode, "binary", BinaryLen($bBinaryCode))
;~         Return SetError(@error, @extended, $fResult)
;~ EndFunc        ;==>_RTInject
