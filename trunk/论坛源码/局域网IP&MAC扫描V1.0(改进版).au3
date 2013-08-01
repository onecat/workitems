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
#Include <GuiStatusBar.au3>
#include <file.au3>
#Include <GuiListView.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <iNet.au3>
#include <Constants.au3>

GUICreate("局域网IP&MAC扫描 V1.0", 511, 460)
GUISetBkColor(0x66CD00);设置窗体颜色
GUICtrlCreateGroup(" 请输入IP范围：", 2, 5, 190, 105)
GUICtrlSetColor(-1, 0XFF0000);红色
$Label1 = GUICtrlCreateLabel("本工具是为了方便网管维护和管理,不可利用非法操作!后果自负。 ", 200, 25, 190, 115)
GUICtrlSetColor(-1, 0XFF0000);红色
$Input1 = GUICtrlCreateInput("192.168.0.1", 70, 30, 100, 20)
$Input2 = GUICtrlCreateInput("192.168.0.254", 70, 70, 100, 20)
$Label2 = GUICtrlCreateLabel("开始地址：", 10, 35, 60, 20)
GUICtrlSetColor(-1, 0x0000ff)
$Label3 = GUICtrlCreateLabel("结束地址：", 10, 75, 60, 20)
GUICtrlSetColor(-1, 0x0000ff)
$Button1 = GUICtrlCreateButton("开始扫描", 420, 110, 70, 25)
GUICtrlSetBkColor(-1, 0xE8E8E8)
$Pro = GUICtrlCreateProgress(5, 438, 500, 20)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label6 = GUICtrlCreateLabel("當前時間:", 200, 100, 170, 15)
GUICtrlSetData($Label6, "现在时间:"& @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & "")
GUICtrlSetColor(-1,0x0000ff)    ; 蓝色
$Label7 = GUICtrlCreateLabel("易维电脑工作室  作者：迈斯_Easy",200, 60, 200, 15)
GUICtrlSetColor(-1,0x0000ff)   ; 蓝色
$Label8 = GUICtrlCreateLabel("http://ywwlgzs.blog.163.com/",200, 80, 250, 15)
GUICtrlSetColor(-1,0x0000ff)   ; 蓝色
$Label8 = GUICtrlCreateLabel("说明：",200, 10, 190, 15)
GUICtrlSetColor(-1,0XFF0000)   ; 蓝色
$Combo1 = GUICtrlCreateCombo("", 5, 115, 395, 35, 0x0003)
$listview1 = GUICtrlCreateListView("计算机名                 |IP地址                               |MAC地址                            ", 5, 136, 500, 300)
GUICtrlSetColor(-1, 0XFF0000)    ; 红色
Dim $Description[5], $ServiceName[5], $cards, $myipaddress, $mygeteway, $mysubnetmask
For $i = 1 To 4
$var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards", $i)
If @error <> 0 Then
   ExitLoop
Else
   $Description[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "Description")
   $ServiceName[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "ServiceName")
   If StringLen($Description[$i]) > 0 Then
    $cards = $cards & $Description[$i] & "|"
   EndIf
EndIf
Next

GUICtrlSetData($Combo1, $cards, $Description[1])
GUICtrlSendMsg($listview1, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_GRIDLINES, $LVS_EX_GRIDLINES)
GUICtrlSendMsg($listview1, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_FULLROWSELECT, $LVS_EX_FULLROWSELECT)

GUISetState(@SW_SHOW)

$T3 = ""
$T4 = ""
;_wmiset()


While 1

$T3 = @HOUR & ":" & @MIN & ":" & @SEC
If $T3 <> $T4 Then
   $T4 = $T3
   GUICtrlSetData($Label6, "现在时间:"& @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & "")
EndIf


$nMsg = GUIGetMsg()
Select
   Case $nMsg = $GUI_EVENT_CLOSE
    Exit
   Case $nMsg = $Button1
    FileDelete("IP&MAC.ini")
    _GUICtrlListView_DeleteAllItems($listview1)
    $StartIp = GUICtrlRead($Input1)
    $StopIp = GUICtrlRead($Input2)
    _IpScan($StartIp, $StopIp)
     
EndSelect
WEnd

Func _IpScan($sIP, $eIP, $FilePath = @ScriptDir)
$sIP = _StringIsIP($sIP)
$eIP = _StringIsIP($eIP)
If $sIP = "" Or $eIP = "" Then
   MsgBox(64, '错误', ' ip 地址格式错误!')
Else
   $ss = StringSplit($sIP, ".")
   $es = StringSplit($eIP, ".")
   If $ss[1] <> $es[1] Or $ss[2] <> $es[2] Then
    MsgBox(64, '错误', ' ip 地址范围过大!')
   Else
    If $es[3] < $ss[3] Or ($es[4] < $ss[4] And ($es[3] > $ss[3] Or $es[3] = $ss[3])) Then
     MsgBox(64, '错误', '错误的IP地址范围!')
    Else
     For $n = $ss[3] To $es[3]
      For $i = $ss[4] To $es[4]
       $p = ($n + 1) * ($i + 1)
       $sp = ($es[4] - $ss[4] + 1) * ($es[3] - $ss[3] + 1)
       $per = $p / $sp * 254
       $res = StringLeft($per, 3)
       $sIP = $ss[1] & "." & $ss[2] & "." & $n & "." & $i
       $MAC = _GetMAC($sIP)
       If $MAC <> "00-00-00-00-00-00" Then
        $hostname = _TCPIpToName ($sIp)
        FileWriteLine("IP&MAC.ini", ''&$hostname&'   ' & $sIP & '   ' & $MAC)
        GUICtrlCreateListViewItem($hostname & "|" & $sIP & "|" & $MAC, $listview1)
       Else
        GUICtrlCreateListViewItem('未检测到' & "|" & $sIP & "|" & '未检测到', $listview1)
       EndIf
       GUICtrlSetData($Pro, $res)
      Next
     Next
     GUICtrlSetData($Pro, "完成")
    EndIf
   EndIf
EndIf
EndFunc   ;==>_IpScan

Func _GetMAC($sIP)
Local $MAC, $MACSize
Local $i, $s, $r, $iIP

$MAC = DllStructCreate("byte[6]")
$MACSize = DllStructCreate("int")
DllStructSetData($MACSize, 1, 6)
$r = DllCall("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
$iIP = $r[0]
$r = DllCall("iphlpapi.dll", "int", "SendARP", "int", $iIP, "int", 0, "ptr", DllStructGetPtr($MAC), "ptr", DllStructGetPtr($MACSize))
$s = ""
For $i = 0 To 5
   If $i Then $s = $s & "-"
   $s = $s & Hex(DllStructGetData($MAC, 1, $i + 1), 2)
  
Next
Return $s
EndFunc   ;==>_GetMAC

Func _StringIsIP($strIP)
$str = StringSplit($strIP, ".")
If $str[0] <> 4 Then
   Return ("")
ElseIf StringIsDigit($str[1]) <> 1 Or StringIsDigit($str[2]) <> 1 Or StringIsDigit($str[3]) <> 1 Or StringIsDigit($str[4]) <> 1 Then
   Return ("")
ElseIf $str[1] > 255 Or $str[2] > 255 Or $str[3] > 255 Or $str[4] > 255 Then
   Return ("")

Else
   $strIP = Int($str[1]) & "." & Int($str[2]) & "." & Int($str[3]) & "." & Int($str[4])
   Return $strIP

EndIf
EndFunc   ;==>_StringIsIP

Func Shutdown_()
	Local $computer, $Input3, $Input4
$objlocator = ObjCreate("wbemscripting.swbemlocator")
    $objWMIService = $objlocator.connectserver($computer, "root/cimv2", $Input3, $Input4)
$colItems = $objWMIService.ExecQuery("SELECT * FROM win32_operatingsystem where primary= true")


For $objItem In $colItems
   ;$objItem.win32shutdown(X_())
Next
EndFunc