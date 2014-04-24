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
 
For $i = 0 To UBound($aBuffer) - 1
        $aBuffer[$i] = DllStructCreate($tagSEND_ARP)
        DllStructSetData($aBuffer[$i], "IpAddress", "192.168.18." & $i)
 
        $aThread[$i] = _RTCreateThread($pStartAddr, DllStructGetPtr($aBuffer[$i]))
Next
 
For $i = 0 To UBound($aBuffer) - 1
        _RTWaitForObject($aThread[$i])
        _RTCloseHandle($aThread[$i])
 
        $aResult[$i][0] = DllStructGetData($aBuffer[$i], "IpAddress")
        $aResult[$i][1] = DllStructGetData($aBuffer[$i], "MacAddress")
        $aResult[$i][2] = DllStructGetData($aBuffer[$i], "Error")
 
        $aBuffer[$i] = 0
Next
DllClose($hDll)
_Arraydisplay($aResult, TimerDiff($iTimer))

