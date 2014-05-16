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

#Include <Array.au3>
 
 
$NetworkAdapterInfo=_NetworkAdapterInfo()
 
_ArrayDisplay($NetworkAdapterInfo, "NetworkAdapterInfo")
 
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
; 第二块网卡：
; $info[2][0] 第二块网卡的标志1
; $info[2][9] 第二块网卡的次DNS
 
; 其他网卡信息依次类推。。。
; 注意，此UDF不会获取已经禁用的网卡。
; 作者:      Sanhen ([email]gxbeiliu@163.com[/email])
; 网站: [url]www.lunhui.net.cn[/url]  [url]www.autoit.net.cn[/url]
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
