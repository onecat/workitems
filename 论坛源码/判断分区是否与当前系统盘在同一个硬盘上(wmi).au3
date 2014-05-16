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
;功  能：判断分区是否与当前系统盘在同一个硬盘上(如果在同一个硬盘上且分区未格式化则格式化为"NTFS")
;参  数：$Temp  - 请使用以"*:"开头的绝对地址
;返回值：0 = 分区与当前系统盘不在同一个硬盘上或其他错误
;        1 = 分区与当前系统盘在同一个硬盘上,(如果分区未格式化则格式化为"NTFS")
;作  者：天堂使者
;版  本：2009.02.02.0
Func thisDisk($Temp)
    $Temp = StringLeft($Temp, 2)
    If StringRight($Temp, 1)<>":" Then Return 0
    If StringIsLower(StringLeft($Temp, 1))=0 And StringIsUpper(StringLeft($Temp, 1))=0 Then Return 0;判断驱动器号是否为英文
 
    Local $ThisDisk = "";系统分区所在硬盘号
    Local $objWMIService = ObjGet("winmgmts:\\.\root\CIMV2")
    ;判断系统分区所在硬盘号
    Local $colDiskDrives = $objWMIService.ExecQuery("Associators of {win32_LogicalDisk.DeviceID='" & @HomeDrive & "'} where ResultClass = Win32_DiskPartition")
    For $objDrive In $colDiskDrives
        $ThisDisk = $objDrive.DiskIndex
    Next
    ;判断"$Temp"是否在当前系统分区所在硬盘上
    $colDiskDrives = $objWMIService.ExecQuery("Associators of {win32_LogicalDisk.DeviceID='" & StringLeft($Temp, 2) & "'} where ResultClass = Win32_DiskPartition")
    For $objDrive In $colDiskDrives
        If $ThisDisk = $objDrive.DiskIndex Then
            If DriveStatus($Temp)="UNKNOWN" Then RunWait(@ComSpec & " /c FORMAT " &$Temp& " /FS:NTFS /Q /Y", "", @SW_HIDE);判断分区是否格式化
            If DriveStatus($Temp)="READY" Then Return 1
        EndIf
    Next
    Return 0
EndFunc   ;==>thisDisk

