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

#Include <Array.au3>
 
 
$NetworkAdapterInfo=_NetworkAdapterInfo()
 
_ArrayDisplay($NetworkAdapterInfo, "NetworkAdapterInfo")
 
Func _NetworkAdapterInfo()
;======================================================
;
; ��������:        _NetworkAdapterInfo()
; ��ϸ��Ϣ:        ��ȡϵͳ����������Ϣ
; ����ֵ˵��:
; �Զ�ά���鷽ʽ����.���� $info=_NetworkAdapterInfo()
; $info[0][0] ��������
; $info[1][0] ��һ�������ı�־1
; $info[1][1] ��һ��������״̬ 
; ״̬˵����7Ϊ����δ������,2Ϊ������������
; $info[1][2] ��һ����������������
; $info[1][3] ��һ����������������
; $info[1][4] ��һ��������MAC��ַ
; $info[1][5] ��һ��������IP��ַ
; $info[1][6] ��һ��������Ĭ������
; $info[1][7] ��һ����������������
; $info[1][8] ��һ����������DNS
; $info[1][9] ��һ�������Ĵ�DNS
; �ڶ���������
; $info[2][0] �ڶ��������ı�־1
; $info[2][9] �ڶ��������Ĵ�DNS
 
; ����������Ϣ�������ơ�����
; ע�⣬��UDF�����ȡ�Ѿ����õ�������
; ����:      Sanhen ([email]gxbeiliu@163.com[/email])
; ��վ: [url]www.lunhui.net.cn[/url]  [url]www.autoit.net.cn[/url]
;======================================================
        Local $colItem
        Local $objItem
        Local $colItems 
        Local $objItems
        Local $objWMIService 
        Local $Adapters[1][10]
        $Adapters[0][0] = 0
        $objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
        $colItem  = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionStatus >0", "WQL", 0x30)
        If IsObj($colItem) Then
                For $objItem In $colItem
                        If $objItem.MACAddress = "00:00:00:00:00:00" Then ContinueLoop
                        $Adapters[0][0] += 1
                        ReDim $Adapters[UBound($Adapters) + 1][10]
                        $Adapters[$Adapters[0][0]][0] += $Adapters[0][0]
                        $Adapters[$Adapters[0][0]][1] = $objItem.NetConnectionStatus
                        $Adapters[$Adapters[0][0]][2] = $objItem.Description
                        $Adapters[$Adapters[0][0]][3] = $objItem.NetConnectionID
                        $Adapters[$Adapters[0][0]][4] = $objItem.MACAddress     
                        $colItems  = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapterConfiguration WHERE MACAddress = "'&$Adapters[$Adapters[0][0]][4]&'" And IPEnabled = True ' , "WQL", 0x30)                                             
                        If IsObj($colItems) Then
                                For $objItems In $colItems
                                        ;if $objItem1.IPAddress(0) = "0.0.0.0" Then ContinueLoop
                                        $Adapters[$Adapters[0][0]][5] = $objItems.IPAddress(0)
                                        $Adapters[$Adapters[0][0]][6] = $objItems.DefaultIPGateway(0)
                                        $Adapters[$Adapters[0][0]][7] = $objItems.IPSubnet(0)
                                        $Adapters[$Adapters[0][0]][8] = $objItems.DNSServerSearchOrder(0)
                                        $Adapters[$Adapters[0][0]][9] = $objItems.DNSServerSearchOrder(1)
                                Next    
                        EndIf
                Next
        EndIf
        
Return $Adapters
 
EndFunc
