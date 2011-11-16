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

#include <GUIConstants.au3>
#NoTrayIcon
 
 
$g_szVersion = "info"
If WinExists($g_szVersion) Then Exit
AutoItWinSetTitle($g_szVersion)
 
Opt('GUICloseOnESC', 0)
 
 
GUICreate ("硬件信息查看器",500,350)
 
 
GUICtrlCreateLabel("B I O S：",10,30,60,30)
GUICtrlSetColor(-1,0x0000ff)
$bios=GUICtrlCreateInput("",80,20,250,25)
 
GUICtrlCreateLabel("主    板：",10,70,60,30)
GUICtrlSetColor(-1,0x0000ff)
$board=GUICtrlCreateInput("",80,60,250,25)
 
GUICtrlCreateLabel("C   P  U：",10,110,60,30)
GUICtrlSetColor(-1,0x0000ff)
$cpu=GUICtrlCreateInput("",80,100,250,25)
 
GUICtrlCreateLabel("显    卡：",10,150,60,30)
GUICtrlSetColor(-1,0x0000ff)
$display=GUICtrlCreateInput("",80,140,250,25)
 
GUICtrlCreateLabel("声    卡：",10,190,60,30)
GUICtrlSetColor(-1,0x0000ff)
$sound=GUICtrlCreateInput("",80,180,250,25)
 
GUICtrlCreateLabel("网    卡：",10,230,60,30)
GUICtrlSetColor(-1,0x0000ff)
$network=GUICtrlCreateInput("",80,220,250,25)
 
GUICtrlCreateLabel("内    存：",10,270,60,30)
GUICtrlSetColor(-1,0x0000ff)
$mem=GUICtrlCreateInput("",80,260,250,25)
 
GUICtrlCreateLabel("操作系统：",10,310,60,30)
GUICtrlSetColor(-1,0x0000ff)
$os=GUICtrlCreateInput("",80,300,250,25)
 
GUISetState( )
info()
 
While 1
    $msg = GUIGetMsg()
 
    Select
                          
      case $msg = $GUI_EVENT_CLOSE
        ExitLoop         
        EndSelect
Wend
 
 
Func info()
        
$objWMIService = objget("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
$colBios = $objWMIService.ExecQuery("Select * from Win32_BIOS")
$colBoard = $objWMIService.ExecQuery("SELECT * FROM Win32_BaseBoard")
$colSettings = $objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
$colMemory = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
$colCPU = $objWMIService.ExecQuery("Select * from CIM_Processor")
$colVideoinfo = $objWMIService.ExecQuery("Select * from Win32_VideoController")
$colSound = $objWMIService.ExecQuery("Select * from Win32_SoundDevice")
$colMouse = $objWMIService.ExecQuery("Select * from Win32_PointingDevice")
$colMonitor = $objWMIService.ExecQuery("Select * from Win32_DesktopMonitor")
$colNIC = $objWMIservice.ExecQuery("Select * from Win32_NetworkAdapter WHERE Netconnectionstatus = 2")
 
 
For $object in $colBios
        GUICtrlSetData($bios,StringMid($object.Caption,1))
Next
 
 
 
For $object in $colBoard
        GUICtrlSetData($board,$object.Product)
        
Next
 
 
For $object in $colCPU
        GUICtrlSetData($cpu, StringStripWS($object.Name,1))
Next
 
For $object in $colVideoinfo
        GUICtrlSetData($display, StringStripWS($object.Description ,1))
   
Next
 
For $object in $colSound
        GUICtrlSetData($sound, StringStripWS($object.Description ,1))
  Next
 
For $object in $colNIC
        GUICtrlSetData($network, StringStripWS($object.name ,1))
  
Next
 
 
For $objOperatingSystem in $colSettings
 
GUICtrlSetData($os,$objOperatingSystem.Caption & " Build " & $objOperatingSystem.BuildNumber & " Sp " & $objOperatingSystem.ServicePackMajorVersion & "." & $objOperatingSystem.ServicePackMinorVersion )
 
Next
for $object  in $colMemory
        GUICtrlSetData($mem,String(Int(Number($object.TotalPhysicalMemory) / (1024 * 1024))) & " Mb")
Next
 
EndFunc