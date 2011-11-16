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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=..\下载\好看的桌面\桌面图标\penguin\Pen1 006.ico
#AutoIt3Wrapper_outfile=检测硬件.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=f:\1\nbm\实验\个人作品\硬件检测.kxf
$Form1_1 = GUICreate("硬件测试V1.0                                  Made By :SUNNY BOY  Date:10.5/2010", 769, 482, 127, 65, BitOR($WS_MAXIMIZEBOX,$WS_MINIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_SYSMENU,$WS_CAPTION,$WS_OVERLAPPEDWINDOW,$WS_TILEDWINDOW,$WS_POPUP,$WS_POPUPWINDOW,$WS_GROUP,$WS_TABSTOP,$WS_BORDER,$WS_CLIPSIBLINGS), 0)
GUISetBkColor(0xD1FCF7)
$labelbios = GUICtrlCreateLabel("BIOS", 26, 32, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label2 = GUICtrlCreateLabel("CPU", 26, 104, 62, 39)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label3 = GUICtrlCreateLabel("显 卡", 21, 142, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label5 = GUICtrlCreateLabel("网 卡", 21, 222, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label4 = GUICtrlCreateLabel("声 卡", 22, 182, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label1 = GUICtrlCreateLabel("主板", 22, 62, 66, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label6 = GUICtrlCreateLabel("内 存", 22, 262, 62, 39)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Label7 = GUICtrlCreateLabel("系 统", 20, 305, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$INPUT0 = GUICtrlCreateInput("", 96, 32, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$input1 = GUICtrlCreateInput("", 416, 31, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input2 = GUICtrlCreateInput("", 96, 67, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input3 = GUICtrlCreateInput("", 416, 67, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
$Input4 = GUICtrlCreateInput("", 96, 107, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input5 = GUICtrlCreateInput("", 416, 107, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input6 = GUICtrlCreateInput("", 95, 147, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input7 = GUICtrlCreateInput("", 416, 148, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input8 = GUICtrlCreateInput("", 94, 187, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input9 = GUICtrlCreateInput("", 416, 187, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input10 = GUICtrlCreateInput("", 96, 226, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input11 = GUICtrlCreateInput("", 416, 227, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input12 = GUICtrlCreateInput("", 96, 267, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input13 = GUICtrlCreateInput("", 416, 265, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input14 = GUICtrlCreateInput("", 96, 306, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input15 = GUICtrlCreateInput("", 416, 307, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$BUTTON1 = GUICtrlCreateButton("上            传", 144, 432, 161, 33, $BS_DEFPUSHBUTTON)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x1A0EF8)
GUICtrlSetBkColor(-1, 0xF4EA9F)
GUICtrlSetCursor (-1, 0)
$Button2 = GUICtrlCreateButton("退            出", 484, 432, 185, 33, $BS_DEFPUSHBUTTON)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x1A0EF8)
GUICtrlSetBkColor(-1, 0xF4EA9F)
GUICtrlSetCursor (-1, 0)
$Label8 = GUICtrlCreateLabel("硬 盘", 20, 346, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Input16 = GUICtrlCreateInput("", 96, 346, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input17 = GUICtrlCreateInput("", 416, 346, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Label9 = GUICtrlCreateLabel("光 驱", 20, 386, 62, 31)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
$Input18 = GUICtrlCreateInput("", 96, 387, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Input19 = GUICtrlCreateInput("", 416, 387, 305, 21, $ES_AUTOVSCROLL)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetCursor (-1, 7)
$Group1 = GUICtrlCreateGroup("本机硬件信息", 88, 16, 318, 401, $BS_RIGHTBUTTON)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("标准硬件信息", 412, 16, 318, 401, $BS_RIGHTBUTTON)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
Dim $Form1_1_AccelTable[1][2] = [["^a", $Button2]]
GUISetAccelerators($Form1_1_AccelTable)
#EndRegion ### END Koda GUI section ###

$a = FileGetLongName((EnvGet("temp")) & "\a.ini")
$B = FileGetLongName((EnvGet("temp")) & "\B.ini")
$c = FileGetLongName((EnvGet("temp")) & "\c.ini")
if FileExists ($c) then FileDelete ($c)        

        
info()


$bios1 = iniread ($b, "bios", "1001", "0")
$board1 = iniread ($b, "bios", "1002", "0")
$cpu1 = iniread ($b, "bios", "1003", "0")
$display1 = iniread ($b, "bios", "1004", "0")
$sound1 = iniread ($b, "bios", "1005", "0")
$network1 = iniread ($b, "bios", "1006", "0")
$mem1 = iniread ($b, "bios", "1007", "0")
$os1 = iniread ($b, "bios", "1008", "0")
$CD1 = iniread ($b, "bios", "1009", "0")
$HD1 = iniread ($b, "bios", "1010", "0")

$bios = iniread ($a, "bios", "1001", "0")
$board = iniread ($a, "bios", "1002", "0")
$cpu = iniread ($A, "bios", "1003", "0")
$display = iniread ($a, "bios", "1004", "0")
$sound = iniread ($a, "bios", "1005", "0")
$network = iniread ($a, "bios", "1006", "0")
$mem = iniread ($a, "bios", "1007", "0")
$os = iniread ($a, "bios", "1008", "0")
$CD = iniread ($a, "bios", "1009", "0")
$HD = iniread ($a, "bios", "1010", "0")


GUICtrlSetData ($input1, $bios1)
GUICtrlSetData ($input3, $board1)
GUICtrlSetData ($input5, $cpu1)
GUICtrlSetData ($input7, $display1)
GUICtrlSetData ($input9, $sound1)
GUICtrlSetData ($input11, $network1)
GUICtrlSetData ($input13, $mem1)
GUICtrlSetData ($input15, $os1)
GUICtrlSetData ($input17, $CD1)
GUICtrlSetData ($input19, $HD1)


if $bios = $bios1 Then
        GUICtrlSetBkColor ($input0, 0x80FF00)
        GUICtrlSetBkColor ($input1, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input0, 0xFF0000)
        GUICtrlSetBkColor ($input1, 0xFF0000)
EndIf        


if $board = $board1 Then
        GUICtrlSetBkColor ($input2, 0x80FF00)
        GUICtrlSetBkColor ($input3, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input2, 0xFF0000)
        GUICtrlSetBkColor ($input3, 0xFF0000)
EndIf        


if $cpu = $cpu1 Then
        GUICtrlSetBkColor ($input4, 0x80FF00)
        GUICtrlSetBkColor ($input5, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input4, 0xFF0000)
        GUICtrlSetBkColor ($input5, 0xFF0000)
EndIf        

if $display = $display1 Then
        GUICtrlSetBkColor ($input6, 0x80FF00)
        GUICtrlSetBkColor ($input7, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input6, 0xFF0000)
        GUICtrlSetBkColor ($input7, 0xFF0000)
EndIf        

if $sound = $sound1 Then
        GUICtrlSetBkColor ($input8, 0x80FF00)
        GUICtrlSetBkColor ($input9, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input8, 0xFF0000)
        GUICtrlSetBkColor ($input9, 0xFF0000)
EndIf        


if $network = $network1 Then
        GUICtrlSetBkColor ($input10, 0x80FF00)
        GUICtrlSetBkColor ($input11, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input10, 0xFF0000)
        GUICtrlSetBkColor ($input11, 0xFF0000)
EndIf        


if $mem = $mem1 Then
        GUICtrlSetBkColor ($input12, 0x80FF00)
        GUICtrlSetBkColor ($input13, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input12, 0xFF0000)
        GUICtrlSetBkColor ($input13, 0xFF0000)
EndIf        


if $os = $os1 Then
        GUICtrlSetBkColor ($input14, 0x80FF00)
        GUICtrlSetBkColor ($input15, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input14, 0xFF0000)
        GUICtrlSetBkColor ($input15, 0xFF0000)
EndIf

if $CD = $CD1 Then
        GUICtrlSetBkColor ($input16, 0x80FF00)
        GUICtrlSetBkColor ($input17, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input16, 0xFF0000)
        GUICtrlSetBkColor ($input17, 0xFF0000)
EndIf        

if $HD = $HD1 Then
        GUICtrlSetBkColor ($input18, 0x80FF00)
        GUICtrlSetBkColor ($input19, 0x80FF00)
Else        
        GUICtrlSetBkColor ($input18, 0xFF0000)
        GUICtrlSetBkColor ($input19, 0xFF0000)
EndIf        





if $bios = $bios1 And $board = $board1 And $cpu = $cpu1 and $display = $display1 and $sound = $sound1 and $network = $network1 and $mem = $mem1 and $os = $os1 AND $CD = $CD1 AND $HD = $HD1 Then
        msgbox (0, "硬件检测", "硬件测试已全部通过" )        
Else
        msgbox (0, "硬件检测", "硬件测试  FAIL " )        
EndIf        

while 1
        $Msg = GUIGetMsg()
        Switch $msg
                Case $GUI_EVENT_CLOSE
                        if FileExists ($c) then FileDelete ($c)        
                        Exit

                case $BUTTON1
                        $VAR = inputbox ("密码检测", "请输入密码", "", "*", 70 , 39, 400,300, 20 )
                        IF $VAR = 123456 Then
                        
                                FileCopy ($A, $B, 1)
                                MsgBox (0, "上传提示", "上传成功,请退出重新打开!",10)
                                if FileExists ($c) then FileDelete ($c)
                                Exit
                        Else
                                MsgBox (0, "密码检测", "密码错误", 10)
                                ;EXIT
                        EndIf
                                
                Case $Button2
                        if FileExists ($c) then FileDelete ($c)        
                        Exit

                EndSwitch
WEnd


func info()
        
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

$colCDROM = $objWMIService.ExecQuery("SELECT * FROM Win32_CDROMDrive")

$coldisk = $objWMIService.ExecQuery("SELECT * FROM Win32_DiskDrive")



For $object in $colBios
        GUICtrlSetData($INPUT0,StringMid($object.Caption,1))
                
                iniWrite ($a, "bios", "1001", StringMid($object.Caption,1))
Next



For $object in $colBoard
        GUICtrlSetData($Input2,$object.Product)
                
                iniWrite ($a, "bios", "1002", $object.Product)
        
Next


For $object in $colCPU
        GUICtrlSetData($Input4, StringStripWS($object.Name,1))
        
                iniWrite ($a, "bios", "1003", stringStripWS($object.Name,1))
Next

For $object in $colVideoinfo
        GUICtrlSetData($Input6, StringStripWS($object.Description ,1))
        
                iniWrite ($a, "bios", "1004", StringStripWS($object.Description ,1))
  
Next

For $object in $colSound
        GUICtrlSetData($Input8, StringStripWS($object.Description ,1))

                iniWrite ($a, "bios", "1005", StringStripWS($object.Description ,1))
  Next

For $object in $colNIC
        GUICtrlSetData($Input10, StringStripWS($object.name ,1))
        
                iniWrite ($a, "bios", "1006", StringStripWS($object.name ,1))
   
Next

for $object  in $colMemory
        GUICtrlSetData($Input12, String(Int(Number($object.TotalPhysicalMemory) / (1024 * 1024))) & " Mb")
                
                iniWrite ($a, "bios", "1007", String(Int(Number($object.TotalPhysicalMemory) / (1024 * 1024))) & " Mb")
Next


For $objOperatingSystem in $colSettings

                GUICtrlSetData($Input14,$objOperatingSystem.Caption & " Build " & $objOperatingSystem.BuildNumber & " Sp " & $objOperatingSystem.ServicePackMajorVersion & "." & $objOperatingSystem.ServicePackMinorVersion )

                iniWrite ($a, "bios", "1008", $objOperatingSystem.Caption & " Build " & $objOperatingSystem.BuildNumber & " Sp " & $objOperatingSystem.ServicePackMajorVersion & "." & $objOperatingSystem.ServicePackMinorVersion)
Next


FOR $disk IN $coldisk

        FileWrite ($c,$disk.Caption & "  |  ")
        
        

Next        

GUICtrlSetData ($input18, FileReadLine ( $C))
IniWrite ($A, "BIOS", "1010", FileReadLine ( $C))



FOR $CDROM IN $colCDROM
        
        GUICtrlSetData ($Input16, $CDROM.Caption)
        IniWrite ($A, "BIOS", "1009", $CDROM.Caption)
        
Next        

EndFunc