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

