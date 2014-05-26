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

;#NoTrayIcon
#include <Date.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
 
$Form1 = GUICreate("Access 操作实例", 320, 455, 553, 128)
$ListView1 = GUICtrlCreateListView("编号|姓名|借书日期|超过天数", 5, 5, 310, 200)
GUICtrlSendMsg(-1, 0x101E, 0, 50)
GUICtrlSendMsg(-1, 0x101E, 1, 70)
GUICtrlSendMsg(-1, 0x101E, 2, 50)
GUICtrlSendMsg(-1, 0x101E, 3, 100)
$Group1 = GUICtrlCreateGroup("创建/读取/修改/删除", 5, 210, 310, 60)
GUICtrlSetColor(-1, 0x0000FF)
$Button1 = GUICtrlCreateButton("创建", 10, 235, 75, 25)
$Button2 = GUICtrlCreateButton("读取", 85, 235, 75, 25)
$Button3 = GUICtrlCreateButton("修改", 160, 235, 75, 25)
$Button4 = GUICtrlCreateButton(" 删除", 235, 235, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("添加/修改记录", 5, 275, 310, 135)
GUICtrlSetColor(-1, 0xFF00FF)
$Input1 = GUICtrlCreateInput("", 55, 295, 96, 21)
;$Input3 = GUICtrlCreateInput("", 55, 355, 96, 21);
$Date1 = GUICtrlCreateDate("", 35, 348, 120, 25)
$Label1 = GUICtrlCreateLabel("姓名:", 15, 300, 31, 17)
$Label2 = GUICtrlCreateLabel("借书日期:", 15, 330, 71, 17)
;$Label3 = GUICtrlCreateLabel("超过天数:", 20, 360, 23, 17);
$Input2 = GUICtrlCreateInput("", 210, 295, 91, 21)
;$Input4 = GUICtrlCreateInput("", 210, 355, 91, 21);
$Date2 = GUICtrlCreateDate("", 180, 348, 120, 25)
 
$Label4 = GUICtrlCreateLabel("姓名:", 170, 300, 31, 17)
$Label5 = GUICtrlCreateLabel("借书日期:", 170, 330, 71, 17)
;$Label6 = GUICtrlCreateLabel("超过天数:", 170, 360, 23, 17);
$Button5 = GUICtrlCreateButton("添加", 45, 380, 75, 25)
$Button6 = GUICtrlCreateButton("保存修改", 195, 380, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("查询超过10天的：", 5, 410, 310, 40)
$Button7 = GUICtrlCreateButton("查询", 225, 420, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState()
 
$mdb_data_path = @ScriptDir & "\DB0.mdb"
$mdb_data_pwd = "123"
$T = "*"
$tblname = "mydb"
If FileExists($mdb_data_path) Then du()
 
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        If Not FileExists($mdb_data_path) Then
 
                        Else
                                MsgBox(0, '欢迎使用', '版权公有 传播不究')
                        EndIf
                Case $Button2
                        du()
                Case $Button3
                        $Strn = GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin = StringSplit($Strn, "|")
                        If $Strnspin[1] = '0' Then
                                MsgBox(48, '提示', '请选择要更新的条目')
                        Else
 
                        EndIf
                Case $Button4
                        $Strn = GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin = StringSplit($Strn, "|")
                        If $Strnspin[1] = '0' Then
                                MsgBox(48, '提示', '请选择要删除的条目')
                        Else
                                ;del()
                                du()
                        EndIf
                Case $Button5
 
                Case $Button6
 
                Case $Button7
                        xun()
 
        EndSwitch
WEnd
 
Func du()
        GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $RS = ObjCreate("ADODB.Recordset")
        $RS.ActiveConnection = $addfld
        $RS.Open("Select " & $T & " From " & $tblname)
        While Not $RS.eof And Not $RS.bof
                If @error = 1 Then ExitLoop
                
                $iDate = StringRegExpReplace($RS.Fields(2).value, '\D', '/')
                $iDate = StringTrimRight($iDate, 1) & ' 00:00:00'
                $iDays = _DateDiff('D', $iDate, _NowCalc())
                GUICtrlCreateListViewItem($RS.Fields(0).value & "|" & $RS.Fields(1).value & "|" & $RS.Fields(2).value & '|' & $iDays, $ListView1)
                $RS.movenext
        WEnd
        $RS.close
        $addfld.Close
EndFunc   ;==>du
 
Func xun()
        Global $11
        $read10 = 10
        GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $RS = ObjCreate("ADODB.Recordset")
        $RS.ActiveConnection = $addfld
        $RS.Open("Select " & $T & " From " & $tblname & " WHERE ssex>'" & $read10 & "'")
        
        While Not $RS.eof And Not $RS.bof
                If @error = 1 Then ExitLoop
 
                $iDate = StringRegExpReplace($RS.Fields(2).value, '\D', '/')
                $iDate = StringTrimRight($iDate, 1) & ' 00:00:00'
                $iDays = _DateDiff('D', $iDate, _NowCalc())
                
                If $iDays > 9 Then
                        GUICtrlCreateListViewItem($RS.Fields(0).value & "|" & $RS.Fields(1).value & "|" & $RS.Fields(2).value & '|' & $iDays, $ListView1)
                        GUICtrlSetData($11, $RS.Fields(2).value)
                EndIf
                
                $RS.movenext
        WEnd
        $RS.close
        $addfld.close
EndFunc   ;==>xun
