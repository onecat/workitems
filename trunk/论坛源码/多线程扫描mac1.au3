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
#AutoIt3Wrapper_UseX64=y        ; x86ϵͳӦ��=y��Ϊ=n��

#include <Thread.au3>
#include <Array.au3>

Const $tagSCAN_MAC = "PTR inet_addr;PTR SendARP;ULONG_PTR Breakpoint;UBYTE code[128]"
Const $tagSCAN_PARAMS = "CHAR szIPAddress[16];UBYTE bPhysicalAddress[8];ULONG ulLength;ULONG ulStatus"

; ��DLL����DLL������������̿ռ䡣��
; ======================================================
DllOpen("Ws2_32.dll")
DllOpen("Iphlpapi.dll")
; ======================================================

; ��ʼ���̺߳�����
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

; ѭ������255���̣߳�һ���̸߳���һ��IP��ɨ�衣
; ======================================================
For $i = 0 To $iUBound - 1
        $aBuffer[$i][0] = StringFormat("192.168.18.%d", $i + 1)
        $aBuffer[$i][2] = DllStructCreate($tagSCAN_PARAMS)

        DllStructSetData($aBuffer[$i][2], "szIPAddress", $aBuffer[$i][0])

        $aBuffer[$i][3] = _RTCreateThread($pProcedure, DllStructGetPtr($aBuffer[$i][2]))
Next
; ======================================================

; �ȴ������߳����н�����
; ======================================================
For $i = 0 To $iUBound - 1
        _RTWaitForObject($aBuffer[$i][3])
        _RTCloseHandle($aBuffer[$i][3])

        ; ����ɨ������
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