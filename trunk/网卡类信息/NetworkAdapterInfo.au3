#Include <Array.au3>

Func _NetworkAdapterInfo()
;======================================================
;
; 函数名称:        _NetworkAdapterInfo()
; 详细信息:        获取系统所有网卡信息
; 返回值说明:
; 以二维数组方式返回.例如 $info=_NetworkAdapterInfo()
; $info[0][0] 网卡数量
; $info[1][0] 第一块网卡的标志1
; $info[1][1] 第一块网卡的状态 
; 状态说明：7为网卡未插网线,2为网卡连接正常
; $info[1][2] 第一块网卡的网卡名称
; $info[1][3] 第一块网卡的连接名称
; $info[1][4] 第一块网卡的MAC地址
; $info[1][5] 第一块网卡的IP地址
; $info[1][6] 第一块网卡的默认网关
; $info[1][7] 第一块网卡的子网掩码
; $info[1][8] 第一块网卡的主DNS
; $info[1][9] 第一块网卡的次DNS
; $info[1][10] 第一块网卡的ID
; $info[1][11] 第一块网卡机器名
; 第二块网卡：
; $info[2][0] 第二块网卡的标志1
; $info[2][9] 第二块网卡的次DNS
; $info[2][10] 第二块网卡的ID

; 其他网卡信息依次类推。。。
; 注意，此UDF不会获取已经禁用的网卡。
; 作者:      Sanhen (gxbeiliu@163.com)
; 网站: www.lunhui.net.cn  www.autoit.net.cn
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