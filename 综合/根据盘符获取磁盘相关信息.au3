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
#AutoIt3Wrapper_icon=..\..\..\Windows\system32\SHELL32.dll|-9
#AutoIt3Wrapper_Outfile=盘符获取.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#Include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <ListViewEditEvent.au3> 
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;----------------------------------------------------------------
Global $us = 0
Global $usb = ""
Global $pf[8] = [0, 0, 0, 0, 0, 0, 0, 0]
;------------------------------------------------
$Form1 = GUICreate("盘符获取", 800, 650,-1, -1, -1, -1, WinGetHandle(AutoItWinGetTitle()));不在任务栏显示的窗口
;------------------------------------------------------------------
$B1=GUICtrlCreateButton("刷 新", 690, 48, 60, 30) ;刷新
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
;---------------------------------------------------------------------------------
$Checkbox1 = GUICtrlCreateCheckbox("显示全部",565, 55, 82, 16) ;"显示全部"复选框
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
GUICtrlSetState($Checkbox1,$GUI_UNCHECKED) 
;-----------------------------------------------------------------------------------------------------------
$Combo1 = GUICtrlCreateCombo("", 50, 48, 500, 35,BitOR($GUI_SS_DEFAULT_COMBO, $CBS_DROPDOWNLIST)) ;盘符选择
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
_GUICtrlComboBox_SetDroppedWidth($Combo1,500);设置组合列边框的最大宽度
;-----------------------------------------------------------------------------------------------------------
$Disk = GUICtrlCreateListView("分区|卷标|类型|文件系统|可用空间|总大小", 50, 190, 700, 400) ;列表
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
_GUICtrlListView_SetExtendedListViewStyle($Disk, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES));添加网格
_GUICtrlListView_SetColumn($Disk, 0, "分区", 70, 2);设置列属性
_GUICtrlListView_SetColumn($Disk, 1, "卷标", 150, 2);
_GUICtrlListView_SetColumn($Disk, 2, "类型", 100, 2)
_GUICtrlListView_SetColumn($Disk, 3, "文件系统", 100, 2)
_GUICtrlListView_SetColumn($Disk, 4, "可用空间", 130, 2)
_GUICtrlListView_SetColumn($Disk, 5, "总大小", 126, 2)
GUICtrlSetColor($Disk, 0x0055ff);设置指定控件的文本颜色
GUICtrlSetResizing($Disk, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKMENUBAR)
;---------------------------------------------------------------------------
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
GUIRegisterMsg(0x0111,"WM_COMMAND")
GUISetState(@SW_SHOW)
;----------------------------------------
Alldisk()
GUISetState(@SW_SHOW)
;----------------------------------------
While 1 
   $nMsg = GUIGetMsg()
   Switch $nMsg        
Case $GUI_EVENT_CLOSE
                Exit
Case $B1 ;刷新
        GUICtrlSetState($B1, $GUI_DISABLE)
                Alldisk()
        GUICtrlSetState($B1, $GUI_ENABLE)
Case $Checkbox1 ;显示全部
                Alldisk() 
   EndSwitch
WEnd 
;--------------------------------------------------------------
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
        Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo ,$Menu
    $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
        $hWndFrom = DllStructGetData($tNMHDR, 2)
    $iCode = DllStructGetData($tNMHDR, 3)
        
    Switch $hWndFrom
Case $Disk
        Switch $iCode
Case $NM_CLICK,$NM_RCLICK,$NM_DBLCLK,$LVCF_UPARROW =1 ,$LVCF_DOWNARROW =2 ;响应鼠标左击、右击、双击及键盘上下键
        $Index = _GUICtrlListView_GetSelectedIndices($Disk) 
If $Index <> "" Then
        $L_Name = _GUICtrlListView_GetItemText($Disk,Number($Index))
        $DriveLabel = DriveGetLabel($L_Name);卷标
        $DriveFile = DriveGetFileSystem($L_Name) ;文件系统
        $DriveTotal = DriveSpaceTotal($L_Name) ;总大小
        $DriveTotalGB = ByteConversion($DriveTotal)
        $DriveType = DriveGetType($L_Name)                
If $DriveType = "Unknown" Then;判断驱动器是否 Unknown 类型
    $DriveTypeS = "未知设备"
ElseIf $DriveType = "Removable" Then;判断驱动器是否 Removable 类型
    $DriveTypeS = "可移动磁盘"
ElseIf $DriveType = "Fixed" Then;判断驱动器是否 Fixed 类型
        $DriveTypeS = "本地磁盘"
ElseIf $DriveType = "Network" Then;判断驱动器是否 Network 类型
        $DriveTypeS = "网络驱动器"
ElseIf $DriveType = "CDROM" Then;判断驱动器是否 CDROM 类型
            $DriveTypeS = "光驱"
ElseIf $DriveType = "RAMDiskk" Then;判断驱动器是否 RAMDiskk 类型
        $DriveTypeS = "内存盘"
EndIf
    GUICtrlSetData($Combo1,$L_Name & "[ 卷标:" & $DriveLabel & "  文件系统:" & $DriveFile & "  总大小:" & $DriveTotalGB & " ]  "&$DriveTypeS)
        ;检测到列表中的内容被选择时修改组合框列表数据
EndIf
    EndSwitch                                                                                
EndSwitch
         Return $GUI_RUNDEFMSG
EndFunc
;-------------------------------------------------------
Func WM_COMMAND($hWnd, $Msg, $wParam, $lParam)
    Local $IdFrom, $iCode
    $IdFrom = BitAnd($wParam, 0x0000FFFF)
    $iCode = BitShift($wParam, 16)        
   Switch $iCode
Case 1
        Switch $IdFrom
Case $Combo1
        $thesel=_GUICtrlComboBox_GetCurSel($Combo1);判断选中了盘符列表框中的第几项
        _GUICtrlListView_SetItemSelected($Disk,$thesel) ;选中盘符列表框中某项的同时选中列表中对应的项目   
EndSwitch
    EndSwitch
Endfunc
;-----------------------------------------------------------------------------------
Func Alldisk()
    _GUICtrlListView_DeleteAllItems($Disk) ;删除列表中的所有元素,防止刷新时数据叠加
        GUICtrlSetData($Combo1,"") ;清空组合框列表内容，防止刷新时数据叠加
If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then ;已经选中“显示全部”复选框
    $var = DriveGetDrive("ALL");返回一个含有指定驱动器盘符的数组
If Not @error Then
        For $i = 1 To $var[0]
                Dim $Vars[$var[0] + 1]
$Vars[$i] = StringUpper($var[$i]);转换字符串为大写字母
                $DriveType = DriveGetType($var[$i]);类型
                $DriveFile = DriveGetFileSystem($var[$i]);格式
                $DriveFree = DriveSpaceFree($var[$i]);可用空间
                $DriveFreeGB = ByteConversion($DriveFree);单位转换
                $DriveLabel =DriveGetLabel($var[$i]);卷标
                $DriveTotal = DriveSpaceTotal($var[$i]);总大小
                $DriveTotalGB = ByteConversion($DriveTotal);单位转换                        
If $DriveType = "Unknown" Then;判断驱动器是否 Unknown 类型
    $DriveTypeS = "未知设备"
ElseIf $DriveType = "Removable" Then;判断驱动器是否 Removable 类型
    $DriveTypeS = "可移动磁盘"
ElseIf $DriveType = "Fixed" Then;判断驱动器是否 Fixed 类型
        $DriveTypeS = "本地磁盘"
ElseIf $DriveType = "Network" Then;判断驱动器是否 Network 类型
        $DriveTypeS = "网络驱动器"
ElseIf $DriveType = "CDROM" Then;判断驱动器是否 CDROM 类型
            $DriveTypeS = "光驱"
ElseIf $DriveType = "RAMDiskk" Then;判断驱动器是否 RAMDiskk 类型
        $DriveTypeS = "内存盘"
EndIf
                GUICtrlSetData($Combo1, $Vars[$i] & "[ 卷标:" & $DriveLabel & "  文件系统:" & $DriveFile & "  总大小:" & $DriveTotalGB & " ]  "&$DriveTypeS, _
                $Vars[0] & "[ 卷标: "& $DriveLabel & "  文件系统:" & $DriveFile &  "  总大小:"& $DriveTotalGB & " ]  "&$DriveTypeS)
                GUICtrlCreateListViewItem($Vars[$i] & "|"&$DriveLabel & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $Disk)
        GUICtrlSetImage(-1, "shell32.dll", 8);修改组合框及列表数据并设置指定控件的位图或图标
Next
    EndIf
EndIf
    If GUICtrlRead($Checkbox1) = $GUI_UNCHECKED Then ;没有选中“显示全部”复选框则只显示USB存储设备
USBdisk()
   EndIf
EndFunc
;-------------------------------------------------------------------------------
Func USBdisk() 
   _GUICtrlListView_DeleteAllItems($Disk) ;删除列表中的所有元素,防止刷新时数据叠加
        GUICtrlSetData($Combo1,"") ;清空组合框列表内容，防止刷新时数据叠加
        $us = 0
        GetPartionMsg("USB")
If $us = 0 Then
        For $i = 1 To $us
$pf[$i] = StringUpper($pf[$i])
                Next
        EndIf
$usb = ""
        For $i = 1 To $us
                $usb = $pf[$i]
                $DriveType = DriveGetType($pf[$i]);类型
                $DriveFree = DriveSpaceFree($pf[$i]);可用空间
                $DriveFreeGB = ByteConversion($DriveFree);单位转换
                $DriveFile = DriveGetFileSystem($pf[$i]);文件系统
                $DriveLabel =DriveGetLabel($pf[$i]);卷标
                $DriveTotal = DriveSpaceTotal($pf[$i]);总大小
                $DriveTotalGB = ByteConversion($DriveTotal);                                        
If $DriveType = "Unknown" Then;判断驱动器是否 Unknown 类型
    $DriveTypeS = "未知设备"
ElseIf $DriveType = "Removable" Then;判断驱动器是否 Removable 类型
    $DriveTypeS = "可移动磁盘"
ElseIf $DriveType = "Fixed" Then;判断驱动器是否 Fixed 类型
        $DriveTypeS = "本地磁盘"
ElseIf $DriveType = "Network" Then;判断驱动器是否 Network 类型
        $DriveTypeS = "网络驱动器"
ElseIf $DriveType = "CDROM" Then;判断驱动器是否 CDROM 类型
            $DriveTypeS = "光驱"
ElseIf $DriveType = "RAMDiskk" Then;判断驱动器是否 RAMDiskk 类型
        $DriveTypeS = "内存盘"
EndIf
         GUICtrlSetData($Combo1, $pf[$i] & "[ 卷标:" & $DriveLabel & "  文件系统:" & $DriveFile & "  总大小:" & $DriveTotalGB & " ]  "&$DriveTypeS, _
                 $pf[0] & "[ 卷标: "  & $DriveLabel & "  文件系统: "  & $DriveFile & "  总大小: " & $DriveTotalGB & " ]  "&$DriveTypeS)
         GUICtrlCreateListViewItem($pf[$i] & "|"&$DriveLabel & "|" & $DriveTypeS & "|"& $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $Disk)                
                 GUICtrlSetImage(-1, "shell32.dll", 8);修改组合框及列表数据并设置指定控件的位图或图标        
   Next
EndFunc 
;------------------------------------单位转换函数-----------------------------------------
Func ByteConversion($lBytes)
        If $lBytes < 1024 Then
                Return Round($lBytes, 2) & "MB"
        ElseIf $lBytes < 1048576 Then
                Return Round($lBytes / 1024, 2) & "GB"
        EndIf
EndFunc  
;-----------------------------------------------------------------------------------------
Func GetPartionMsg($Interface)
        $objWMIService = ObjGet("winmgmts:\\.\root\cimv2")
        $colItems = $objWMIService.ExecQuery("Select * from Win32_LogicalDiskToPartition")
        For $objItem In $colItems
                $DiskFH = StringLeft(StringRight($objItem.Dependent, 3), 2)
                $PartNum = QueryDiskNum($DiskFH)
                If StringMid($PartNum, 2, 3) = $Interface Then
                        $us += 1
                        $pf[$us] = "(" & StringMid($PartNum, 6)
                        $pf[$us] = $DiskFH
                EndIf
        Next
EndFunc   

Func QueryDiskInterface($n)
        $objWMIService = ObjGet("winmgmts:\\.\root\cimv2")
        $colItems = $objWMIService.ExecQuery("Select * from Win32_DiskDrive Where Index=" & $n)
        For $objItem In $colItems
                Return $objItem.InterfaceType
        Next
EndFunc   

Func QueryDiskNum($d)
        $objWMIService = ObjGet("winmgmts:\\.\root\cimv2")
        $colItems = $objWMIService.ExecQuery("Associators of {win32_LogicalDisk.DeviceID='" & $d & "'} where ResultClass = Win32_DiskPartition")
        For $colItem In $colItems
                Return "(" & QueryDiskInterface($colItem.DiskIndex) & ":hd" & $colItem.DiskIndex & ")"
        Next
EndFunc 