#Include <Array.au3>

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
; $info[1][10] ��һ��������ID
; $info[1][11] ��һ������������
; �ڶ���������
; $info[2][0] �ڶ��������ı�־1
; $info[2][9] �ڶ��������Ĵ�DNS
; $info[2][10] �ڶ���������ID

; ����������Ϣ�������ơ�����
; ע�⣬��UDF�����ȡ�Ѿ����õ�������
; ����:      Sanhen (gxbeiliu@163.com)
; ��վ: www.lunhui.net.cn  www.autoit.net.cn
;======================================================
    Local $colItem
    Local $objItem
    Local $colItems 
    Local $objItems
    Local $objWMIService 
    Local $Adapters[1][12]
    $Adapters[0][0] = 0
    $objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
    $colItem  = $objWMIService.ExecQuery("Select * FROM Win32_NetworkAdapter Where NetConnectionStatus >0", "WQL", 0x30)
    If IsObj($colItem) Then
        For $objItem In $colItem
            If $objItem.MACAddress = "00:00:00:00:00:00" Then ContinueLoop
            $Adapters[0][0] += 1
            ReDim $Adapters[UBound($Adapters) + 1][12]
            $Adapters[$Adapters[0][0]][0] += $Adapters[0][0]
            $Adapters[$Adapters[0][0]][1] = $objItem.NetConnectionStatus
            $Adapters[$Adapters[0][0]][2] = $objItem.Description
            $Adapters[$Adapters[0][0]][3] = $objItem.NetConnectionID
            $Adapters[$Adapters[0][0]][4] = $objItem.MACAddress 
			$Adapters[$Adapters[0][0]][11] = $objItem.PNPDeviceID 
            $colItems  = $objWMIService.ExecQuery('Select * FROM Win32_NetworkAdapterConfiguration Where MACAddress = "'&$Adapters[$Adapters[0][0]][4]&'" And IPEnabled = True ' , "WQL", 0x30)                     
            If IsObj($colItems) Then
                For $objItems In $colItems
                    ;if $objItem1.IPAddress(0) = "0.0.0.0" Then ContinueLoop
                    $Adapters[$Adapters[0][0]][5] = $objItems.IPAddress(0)
                    $Adapters[$Adapters[0][0]][6] = $objItems.DefaultIPGateway(0)
                    $Adapters[$Adapters[0][0]][7] = $objItems.IPSubnet(0)
                    $Adapters[$Adapters[0][0]][8] = $objItems.DNSServerSearchOrder(0)
                    $Adapters[$Adapters[0][0]][9] = $objItems.DNSServerSearchOrder(1)
					$Adapters[$Adapters[0][0]][10] = $objItems.SettingID
                Next    
            EndIf
        Next
    EndIf
    
Return $Adapters

EndFunc