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

#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <GuiListView.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiDateTimePicker.au3>
#include <GuiListBox.au3>
 
$SQLite_Data_Path = "BellDB.db"
$SQLite_Table_Name = "示范铃声列表"
$SQLite_Table_Name_Insert = "名称最多八位"
Global $hListBox, $hListView, $hInput
 
Global $h_InputDefProcedure = DllCallbackRegister("__InputDefProcedure", "int", "hWnd;uint;wparam;lparam")
Global $p_InputDefProcedure = DllCallbackGetPtr($h_InputDefProcedure)
Global $h_InputDefCall
 
_SQLite_Startup("") ;加载 SQLite.dll
BellDBSetupWin(0)
_WinAPI_SetWindowLong(GUICtrlGetHandle($hInput), -4, $h_InputDefCall)
Func BellDBSetupWin($FW)
        If Not SQLiteSearchTable($SQLite_Table_Name) Then
                SQLiteCreateTable($SQLite_Table_Name)
        EndIf
        GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
        GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
        $hSetupWin = GUICreate("铃声计划设置", 600, 410, -1, -1, _
                        BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_CLIPSIBLINGS), -1, $FW)
        GUICtrlCreateGroup("计划列表", 2, 2, 100, 200)
        $hListBox = GUICtrlCreateList("", 7, 20, 90, 175)
        SQLiteListTable($hListBox)
        _GUICtrlListBox_SelectString($hListBox, $SQLite_Table_Name)
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        $hInput = GUICtrlCreateInput("", 0, 0, 20, 10)
        GUICtrlSetLimit($hInput, 8)
        _WinAPI_SetParent(GUICtrlGetHandle($hInput), GUICtrlGetHandle($hListBox))
        GUICtrlSetState(-1, $GUI_HIDE)
        $h_InputDefCall = _WinAPI_SetWindowLong(GUICtrlGetHandle($hInput), -4, $p_InputDefProcedure)
        
        GUICtrlCreateGroup("计划列表内容", 110, 2, 488, 400)
        $hListView = GUICtrlCreateListView("", 115, 20, 478, 375, 0x0010, 0x00000021)
        GUICtrlSetBkColor($hListView, $GUI_BKCOLOR_LV_ALTERNATE)
        _GUICtrlListView_AddColumn($hListView, "开始时间", 70, 0)
        _GUICtrlListView_AddColumn($hListView, "文件名", 100, 1)
        _GUICtrlListView_AddColumn($hListView, "结束时间", 70, 2)
        _GUICtrlListView_AddColumn($hListView, "音量", 30, 3)
        _GUICtrlListView_AddColumn($hListView, "1", 4, 4)
        _GUICtrlListView_AddColumn($hListView, "2", 4, 5)
        _GUICtrlListView_AddColumn($hListView, "3", 4, 6)
        _GUICtrlListView_AddColumn($hListView, "4", 4, 7)
        _GUICtrlListView_AddColumn($hListView, "5", 4, 8)
        _GUICtrlListView_AddColumn($hListView, "6", 4, 9)
        _GUICtrlListView_AddColumn($hListView, "7", 4, 10)
        SQLiteReadTableToListView($SQLite_Table_Name, $hListView)
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        GUICtrlCreateGroup("功能区", 2, 207, 100, 193)
        $Jh_Button1 = GUICtrlCreateButton("添加计划", 10, 230, 60, 22)
        $Jh_Button2 = GUICtrlCreateButton("删除计划", 10, 260, 60, 22)
        $Nr_Button1 = GUICtrlCreateButton("添加条目", 10, 290, 60, 22)
        $Nr_Button2 = GUICtrlCreateButton("删除条目", 10, 320, 60, 22)
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        GUISetState()
        While 1
                $Msg = GUIGetMsg()
                Switch $Msg
                        Case $GUI_EVENT_CLOSE
                                _SQLite_Shutdown()
                                ExitLoop
                        Case $Jh_Button1
                                SQLiteCreateTable($SQLite_Table_Name_Insert)
                                SQLiteListTable($hListBox)
                                _GUICtrlListBox_SelectString($hListBox, $SQLite_Table_Name_Insert)
                                $SQLite_Table_Name = $SQLite_Table_Name_Insert
                                SQLiteReadTableToListView($SQLite_Table_Name, $hListView)
                                EditSchName()
                        Case $Jh_Button2
                                BellSchListTableDelete($hListBox)
                                SQLiteListTable($hListBox)
                                _GUICtrlListBox_SetCurSel($hListBox, 0)
                                $SQLite_Table_Name = GUICtrlRead($hListBox)
                                SQLiteReadTableToListView($SQLite_Table_Name, $hListView)
                        Case $Nr_Button1
                                BellSchSetupWin($hSetupWin, $hListView)
                        Case $Nr_Button2
                                BellSchDeleteSelItem($SQLite_Table_Name, $hListView)
                                SQLiteReadTableToListView($SQLite_Table_Name, $hListView)
                EndSwitch
        WEnd
EndFunc   ;==>BellDBSetupWin
 
Func __InputDefProcedure($hWnd, $iMsg, $iwParam, $ilParam)
        If $iwParam = 13 Then;回车键
                GUICtrlSetState($hInput, $GUI_HIDE)
        EndIf
        If $iMsg = $WM_KILLFOCUS Then
                EditSchNameDel()
                GUICtrlSetState($hInput, $GUI_HIDE)
        EndIf
        Return _WinAPI_CallWindowProc($h_InputDefCall, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc   ;==>__InputDefProcedure
 
Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
        #forceref $hWnd, $iMsg, $iwParam
        Local $iIDFrom, $iCode, $hWndListBox
        $hWndListBox = $hListBox
        If Not IsHWnd($hListBox) Then $hWndListBox = GUICtrlGetHandle($hListBox)
        $iIDFrom = _WinAPI_LoWord($iwParam)
        $iCode = _WinAPI_HiWord($iwParam)
        Switch $ilParam
                Case $hWndListBox
                        Switch $iCode
                                Case $LBN_SELCHANGE
                                        $SQLite_Table_Name = GUICtrlRead($hListBox)
                                        SQLiteReadTableToListView($SQLite_Table_Name, $hListView)
                                Case $LBN_DBLCLK
                                        EditSchName($SQLite_Table_Name)
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
 
Func EditSchName($sText = $SQLite_Table_Name_Insert)
        Local $iIndex = _GUICtrlListBox_GetCurSel($hListBox)
        Local $xy = _GUICtrlListBox_GetItemRect($hListBox, $iIndex)
        GUICtrlSetPos($hInput, $xy[0], $xy[1] - 2, $xy[2] - $xy[0], $xy[3] - $xy[1] + 4)
        GUICtrlSetData($hInput, $sText)
        GUICtrlSendMsg($hInput, 0xB1, 0, -1);EM_SETSEL消息，input选中文字
        GUICtrlSetState($hInput, BitOR($GUI_FOCUS, $GUI_SHOW))
EndFunc   ;==>EditSchName
 
Func EditSchNameDel()
        Local $iText = GUICtrlRead($hInput)
        $iText = StringReplace($iText, " ", "")
        $iText = StringReplace($iText, "　", "")
        If $SQLite_Table_Name <> $iText Then
                SQLiteModifyTable($SQLite_Table_Name, $iText)
                $SQLite_Table_Name = $iText
                _GUICtrlListBox_BeginUpdate($hListBox)
                SQLiteListTable($hListBox)
                _GUICtrlListBox_EndUpdate($hListBox)
                _GUICtrlListBox_SelectString($hListBox, $iText)
        EndIf
EndFunc   ;==>EditSchNameDel
 
 
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
        #forceref $hWnd, $iMsg, $iwParam
        Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListBox, $tInfo
        Local $iIndex
        $hWndListView = $hListView
        If Not IsHWnd($hListView) Then $hWndListView = GUICtrlGetHandle($hListView)
        $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
        $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
        $iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
        $iCode = DllStructGetData($tNMHDR, "Code")
        Switch $hWndFrom
                Case $hWndListView
                        Switch $iCode
                                Case $NM_DBLCLK
                                        $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
                                        $iIndex = DllStructGetData($tInfo, "Index")
                                        BellSchModifyWin($hWnd, $hListView, $iIndex)
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
 
Func BellSchModifyWin($FW, $ListView, $iIndex)
        Local $Sch_Gui, $SchMsg
        Local $hDTP1, $hDTP2, $a_Date[7] = [False, @YEAR, @MON, @MDAY, 6, 0, 0]
        Local $FileIn, $JsTCheck, $SoundLever, $Week1, $Week2, $Week3, $Week4, $Week5, $Week6, $Week7, $Ok, $Cancle
        Local $a, $b, $c, $d, $e
        Local $oldRec = _GUICtrlListView_GetItemText($ListView, $iIndex)
        Local $tmp, $Temp
        $tmp = SQLiteSelect($SQLite_Table_Name, $oldRec)
        $Sch_Gui = GUICreate("铃声列表修改", 400, 170, -1, -1, _
                        BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_CLIPSIBLINGS), -1, $FW)
        GUICtrlCreateGroup("", 5, 2, 390, 130)
        GUICtrlCreateLabel("开始时间", 15, 17)
        $hDTP1 = _GUICtrlDTP_Create($Sch_Gui, 70, 15, 73, 21, $DTS_TIMEFORMAT)
        $Temp = StringSplit($tmp[0], ":")
        $a_Date[4] = $Temp[1]
        $a_Date[5] = $Temp[2]
        $a_Date[6] = $Temp[3]
        $Temp = 0
        _GUICtrlDTP_SetSystemTime($hDTP1, $a_Date)
        $JsTCheck = GUICtrlCreateCheckbox("结束时间", 210, 17)
        $hDTP2 = _GUICtrlDTP_Create($Sch_Gui, 280, 15, 73, 21, BitOR($DTS_TIMEFORMAT, $WS_DISABLED))
        $Temp = StringSplit($tmp[2], ":")
        If $Temp[0] = 1 Then
                _GUICtrlDTP_SetSystemTime($hDTP2, $a_Date)
        Else
                $a_Date[4] = $Temp[1]
                $a_Date[5] = $Temp[2]
                $a_Date[6] = $Temp[3]
                _GUICtrlDTP_SetSystemTime($hDTP2, $a_Date)
                ControlEnable($Sch_Gui, "", $hDTP2)
                GUICtrlSetState(-1, $GUI_CHECKED)
        EndIf
        GUICtrlCreateLabel("文件名 ", 15, 49)
        $FileIn = GUICtrlCreateCombo("铃声一", 70, 45, 300, 20)
        GUICtrlSetData(-1, "铃声二|铃声三|铃声四|铃声五|铃声六|铃声七|铃声八|铃声九|铃声十|播放文件|播放文件夹", $tmp[1])
        GUICtrlCreateLabel("音量", 15, 79)
        $SoundLever = GUICtrlCreateInput($tmp[3], 70, 75, 50, -1, 0x2000)
        GUICtrlCreateUpdown($SoundLever)
        GUICtrlSetLimit(-1, 100, 10)
        
        $Temp = duigou($tmp[4])
        $tmp = StringSplit($Temp, "|")
        GUICtrlCreateLabel("周期 ", 15, 109)
        $Week1 = GUICtrlCreateCheckbox("周一", 50, 105)
        GUICtrlSetState(-1, $tmp[2] = "√");$GUI_CHECKED
        $Week2 = GUICtrlCreateCheckbox("周二", 100, 105)
        GUICtrlSetState(-1, $tmp[3] = "√")
        $Week3 = GUICtrlCreateCheckbox("周三", 150, 105)
        GUICtrlSetState(-1, $tmp[4] = "√")
        $Week4 = GUICtrlCreateCheckbox("周四", 200, 105)
        GUICtrlSetState(-1, $tmp[5] = "√")
        $Week5 = GUICtrlCreateCheckbox("周五", 250, 105)
        GUICtrlSetState(-1, $tmp[6] = "√")
        $Week6 = GUICtrlCreateCheckbox("周六", 300, 105)
        GUICtrlSetState(-1, $tmp[7] = "√")
        $Week7 = GUICtrlCreateCheckbox("周日", 350, 105)
        GUICtrlSetState(-1, $tmp[8] = "√")
        GUICtrlCreateGroup("", -99, -99, 1, 1)
        $Ok = GUICtrlCreateButton("确定", 200, 140, 60)
        $Cancle = GUICtrlCreateButton("取消", 320, 140, 60)
        GUISetState(@SW_SHOW, $Sch_Gui)
        GUISetState(@SW_DISABLE, $FW)
        While 1
                $SchMsg = GUIGetMsg()
                Switch $SchMsg
                        Case $GUI_EVENT_CLOSE, $Cancle
                                ExitLoop
                        Case $Ok
                                $a = GetTimeStr(_GUICtrlDTP_GetSystemTime($hDTP1))
                                $b = GUICtrlRead($FileIn)
                                If BitAND(GUICtrlRead($JsTCheck), $GUI_CHECKED) Then
                                        $c = GetTimeStr(_GUICtrlDTP_GetSystemTime($hDTP2))
                                Else
                                        $c = ""
                                EndIf
                                $d = GUICtrlRead($SoundLever)
                                $e = BitOR(BitShift(BitAND(GUICtrlRead($Week1), $GUI_CHECKED), -6), _
                                                BitShift(BitAND(GUICtrlRead($Week2), $GUI_CHECKED), -5), _
                                                BitShift(BitAND(GUICtrlRead($Week3), $GUI_CHECKED), -4), _
                                                BitShift(BitAND(GUICtrlRead($Week4), $GUI_CHECKED), -3), _
                                                BitShift(BitAND(GUICtrlRead($Week5), $GUI_CHECKED), -2), _
                                                BitShift(BitAND(GUICtrlRead($Week6), $GUI_CHECKED), -1), _
                                                BitAND(GUICtrlRead($Week7), $GUI_CHECKED))
                                If $a <> $oldRec Then SQLiteDelete($SQLite_Table_Name, $oldRec);如果改了开始时间，则删除旧的开始时间内容
                                SQLiteInsertTable($SQLite_Table_Name, $a, $b, $c, $d, $e);开始时间没有改的话，会替换内容
                                SQLiteReadTableToListView($SQLite_Table_Name, $ListView)
                                ExitLoop
                        Case $JsTCheck
                                If BitAND(GUICtrlRead($JsTCheck), $GUI_CHECKED) Then
                                        ControlEnable($Sch_Gui, "", $hDTP2)
                                Else
                                        ControlDisable($Sch_Gui, "", $hDTP2)
                                EndIf
                EndSwitch
        WEnd
        GUISetState(@SW_ENABLE, $FW)
        GUIDelete($Sch_Gui)
EndFunc   ;==>BellSchModifyWin
 
Func BellSchSetupWin($FW, $ListView)
        Local $Sch_Gui, $SchMsg
        Local $hDTP1, $hDTP2, $a_Date[7] = [False, @YEAR, @MON, @MDAY, 6, 0, 0]
        Local $FileIn, $JsTCheck, $SoundLever, $Week1, $Week2, $Week3, $Week4, $Week5, $Week6, $Week7, $Ok, $Cancle
        Local $a, $b, $c, $d, $e
        $Sch_Gui = GUICreate("铃声列表设置", 400, 170, -1, -1, _
                        BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_CLIPSIBLINGS), -1, $FW)
        GUICtrlCreateGroup("", 5, 2, 390, 130)
        GUICtrlCreateLabel("开始时间", 15, 19)
        $hDTP1 = _GUICtrlDTP_Create($Sch_Gui, 70, 15, 73, 21, $DTS_TIMEFORMAT)
        _GUICtrlDTP_SetSystemTime($hDTP1, $a_Date)
        $JsTCheck = GUICtrlCreateCheckbox("结束时间", 210, 17)
        $hDTP2 = _GUICtrlDTP_Create($Sch_Gui, 280, 15, 73, 21, BitOR($DTS_TIMEFORMAT, $WS_DISABLED))
        _GUICtrlDTP_SetSystemTime($hDTP2, $a_Date)
        GUICtrlCreateLabel("文件名 ", 15, 49)
        $FileIn = GUICtrlCreateCombo("铃声一", 70, 45, 300, 20)
        GUICtrlSetData(-1, "铃声二|铃声三|铃声四|铃声五|铃声六|铃声七|铃声八|铃声九|铃声十|播放文件|播放文件夹", "铃声一")
        GUICtrlCreateLabel("音量", 15, 79)
        $SoundLever = GUICtrlCreateInput("80", 70, 75, 50, -1, 0x2000)
        GUICtrlCreateUpdown($SoundLever)
        GUICtrlSetLimit(-1, 100, 10)
 
        GUICtrlCreateLabel("周期 ", 15, 109)
        $Week1 = GUICtrlCreateCheckbox("周一", 50, 105)
        GUICtrlSetState(-1, $GUI_CHECKED)
        $Week2 = GUICtrlCreateCheckbox("周二", 100, 105)
        GUICtrlSetState(-1, $GUI_CHECKED)
        $Week3 = GUICtrlCreateCheckbox("周三", 150, 105)
        GUICtrlSetState(-1, $GUI_CHECKED)
        $Week4 = GUICtrlCreateCheckbox("周四", 200, 105)
        GUICtrlSetState(-1, $GUI_CHECKED)
        $Week5 = GUICtrlCreateCheckbox("周五", 250, 105)
        GUICtrlSetState(-1, $GUI_CHECKED)
        $Week6 = GUICtrlCreateCheckbox("周六", 300, 105)
        $Week7 = GUICtrlCreateCheckbox("周日", 350, 105)
        GUICtrlCreateGroup("", -99, -99, 1,1)
        $Ok = GUICtrlCreateButton("确定添加", 200, 140, 60)
        $Cancle = GUICtrlCreateButton("添加完成", 320, 140, 60)
        GUISetState(@SW_SHOW, $Sch_Gui)
        GUISetState(@SW_DISABLE, $FW)
        While 1
                $SchMsg = GUIGetMsg()
                Switch $SchMsg
                        Case $GUI_EVENT_CLOSE, $Cancle
                                ExitLoop
                        Case $Ok
                                $a = GetTimeStr(_GUICtrlDTP_GetSystemTime($hDTP1))
                                $b = GUICtrlRead($FileIn)
                                If BitAND(GUICtrlRead($JsTCheck), $GUI_CHECKED) Then
                                        $c = GetTimeStr(_GUICtrlDTP_GetSystemTime($hDTP2))
                                Else
                                        $c = ""
                                EndIf
                                $d = GUICtrlRead($SoundLever)
                                $e = BitOR(BitShift(BitAND(GUICtrlRead($Week1), $GUI_CHECKED), -6), _
                                                BitShift(BitAND(GUICtrlRead($Week2), $GUI_CHECKED), -5), _
                                                BitShift(BitAND(GUICtrlRead($Week3), $GUI_CHECKED), -4), _
                                                BitShift(BitAND(GUICtrlRead($Week4), $GUI_CHECKED), -3), _
                                                BitShift(BitAND(GUICtrlRead($Week5), $GUI_CHECKED), -2), _
                                                BitShift(BitAND(GUICtrlRead($Week6), $GUI_CHECKED), -1), _
                                                BitAND(GUICtrlRead($Week7), $GUI_CHECKED))
                                SQLiteInsertTable($SQLite_Table_Name, $a, $b, $c, $d, $e)
                                SQLiteReadTableToListView($SQLite_Table_Name, $ListView)
                        Case $JsTCheck
                                If BitAND(GUICtrlRead($JsTCheck), $GUI_CHECKED) Then
                                        ControlEnable($Sch_Gui, "", $hDTP2)
                                Else
                                        ControlDisable($Sch_Gui, "", $hDTP2)
                                EndIf
                EndSwitch
        WEnd
        GUISetState(@SW_ENABLE, $FW)
        GUIDelete($Sch_Gui)
EndFunc   ;==>BellSchSetupWin
 
;删除计划条目
Func BellSchDeleteSelItem($TableName, $ListBox)
        Local $iIndex, $sText
        _SQLite_Open($SQLite_Data_Path)
        Do
                $iIndex = _GUICtrlListView_GetNextItem($ListBox)
                $sText = _GUICtrlListView_GetItemText($ListBox, $iIndex)
                _GUICtrlListView_DeleteItem($ListBox, $iIndex)
                _SQLite_Exec(-1, "DELETE FROM  " & $TableName & " WHERE StartTime = '" & $sText & "';")
        Until $iIndex = -1
        _SQLite_Close()
EndFunc   ;==>BellSchDeleteSelItem
 
;删除计划表
Func BellSchListTableDelete($ListBox)
        Local $sText = GUICtrlRead($ListBox)
        If $sText = "" Then Return False
        SQLiteDropTable(GUICtrlRead($ListBox))
        SQLiteListTable($ListBox)
        Return True
EndFunc   ;==>BellSchListTableDelete
 
;创建空计划表
Func SQLiteCreateTable($TableName)
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Exec(-1, "Create Table IF NOT Exists " & $TableName & " (StartTime TEXT PRIMARY KEY, FileName TEXT, EndTime TEXT, Level INTEGER, Week NUMERIC);")
        _SQLite_Close()
EndFunc   ;==>SQLiteCreateTable
 
;删除表名
Func SQLiteDropTable($TableName)
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Exec(-1, "DROP TABLE " & $TableName)
        _SQLite_Close()
EndFunc   ;==>SQLiteDropTable
 
;修改表名
Func SQLiteModifyTable($OldName, $NewName)
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Exec(-1, "ALTER TABLE " & $OldName & " RENAME TO " & $NewName)
        _SQLite_Close()
EndFunc   ;==>SQLiteModifyTable
 
;读取表内容按起始时间排序
Func SQLiteReadTableToListView($TableName, $ListView)
        Local $hQuery, $aRow
        _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($ListView))
        _GUICtrlListView_BeginUpdate($ListView)
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Query(-1, "SELECT * FROM " & $TableName & " ORDER BY StartTime DESC;", $hQuery)
        While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
                GUICtrlCreateListViewItem($aRow[0] & "|" & $aRow[1] & "|" & $aRow[2] & "|" & $aRow[3] & duigou($aRow[4]), $ListView)
                GUICtrlSetBkColor(-1, 0xEEEEEE)
        WEnd
        _GUICtrlListView_EndUpdate($ListView)
        _SQLite_Close()
EndFunc   ;==>SQLiteReadTableToListView
 
Func duigou($N)
        Local $ret = "", $i, $k = 64
        For $i = 0 To 6
                If BitAND($N, $k) Then
                        $ret &= "|√"
                Else
                        $ret &= "| "
                EndIf
                $k = BitShift($k, 1)
        Next
        Return $ret
EndFunc   ;==>duigou
 
;添加表条目
Func SQLiteInsertTable($TableName, $a, $b, $c, $d, $e)
        Local $Temp, $aRow
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_QuerySingleRow(-1, "SELECT StartTime FROM " & $TableName & " WHERE StartTime = '" & $a & "';", $aRow)
        $Temp = $aRow[0]
        If $Temp = "" Then
                _SQLite_Exec(-1, "INSERT INTO " & $TableName & " (StartTime) values ('" & $a & "');")
        EndIf
        _SQLite_Exec(-1, "UPDATE " & $TableName & " SET FileName = '" & $b & "' WHERE StartTime = '" & $a & "';")
        _SQLite_Exec(-1, "UPDATE " & $TableName & " SET EndTime = '" & $c & "' WHERE StartTime = '" & $a & "';")
        _SQLite_Exec(-1, "UPDATE " & $TableName & " SET Level = '" & $d & "' WHERE StartTime = '" & $a & "';")
        _SQLite_Exec(-1, "UPDATE " & $TableName & " SET Week = '" & $e & "' WHERE StartTime = '" & $a & "';")
        _SQLite_Close()
EndFunc   ;==>SQLiteInsertTable
 
;搜索表条目
Func SQLiteSelect($TableName, $a)
        Local $Temp, $aRow
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_QuerySingleRow(-1, "SELECT * FROM " & $TableName & " WHERE StartTime = '" & $a & "';", $aRow)
;~      $Temp = $aRow[0]
;~      If $Temp = "" Then
;~              MsgBox(262208, "查找结果...", "数据库中开始时间为 [" & $a & "] 的计划不存在！")
;~      Else
;~              _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($ListBox))
;~              GUICtrlCreateListViewItem($aRow[0] & "|" & $aRow[1] & "|" & $aRow[2] & "|" & $aRow[3] & "|" & $aRow[4], $ListBox)
;~      EndIf
        _SQLite_Close()
        Return $aRow
EndFunc   ;==>SQLiteSelect
 
;删除表记录
Func SQLiteDelete($TableName, $a)
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Exec(-1, "DELETE FROM  " & $TableName & " WHERE StartTime = '" & $a & "';")
        _SQLite_Close()
EndFunc   ;==>SQLiteDelete
 
;搜寻计划表是否存在
Func SQLiteSearchTable($TableName)
        Local $rt = False, $hQuery, $aRow
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Query(-1, "SELECT COUNT(*) as CNT FROM sqlite_master where type='table' and name='" & $TableName & "';", $hQuery)
        While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
                If $aRow[0] = 1 Then $rt = True
        WEnd
        _SQLite_Close()
        Return $rt
EndFunc   ;==>SQLiteSearchTable
 
;列出所有计划表名
Func SQLiteListTable($List)
        Local $hQuery, $aRow
        GUICtrlSetData($List, "")
        _SQLite_Open($SQLite_Data_Path)
        _SQLite_Query(-1, "select name from sqlite_master where type='table' order by name;", $hQuery)
        While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
                GUICtrlSetData($List, $aRow[0])
        WEnd
        _SQLite_Close()
EndFunc   ;==>SQLiteListTable
 
Func GetTimeStr($aDate)
        Return StringFormat("%02d:%02d:%02d", $aDate[3], $aDate[4], $aDate[5])
EndFunc   ;==>GetTimeStr
