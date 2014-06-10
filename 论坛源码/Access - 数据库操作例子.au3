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

#include <Access.au3>
#include <GUIListView.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>
 
Global $adSource = "MyDatabase.mdb"
Global $adTable = "数据库"
Global $DatabasePassword = "admin"
Global $adCol = 'ID CURRENCY |第一列 TEXT(255)|第二列 TEXT(255)|第三列 TEXT(255)|第四列 TEXT(255)|第五列 TEXT(255)'
Global $sFieldNames = "ID|第一列|第二列|第三列|第四列|第五列"
Global $bTF = True
 
$MyGui = GUICreate("Access - 数据库操作例子", 800, 600)
$ListView1 = GUICtrlCreateListView("ID|第一列|第二列|第三列|第四列|第五列", 10, 10, 780, 530)
 
_GUICtrlListView_SetColumn($ListView1, 0, 'ID', 150, 2)
_GUICtrlListView_SetColumn($ListView1, 1, '第一列', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 2, '第二列', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 3, '第三列', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 4, '第四列', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 5, '第五列', 100, 2)
 
$Button0 = GUICtrlCreateButton("创建数据库", 20, 560, 100, 25, 0)
$Button1 = GUICtrlCreateButton("获取表名称", 130, 560, 100, 25, 0)
$Button2 = GUICtrlCreateButton("获取字段名", 240, 560, 100, 25, 0)
 
$Button3 = GUICtrlCreateButton("添加数据", 350, 560, 100, 25, 0)
$Button4 = GUICtrlCreateButton("读取数据", 460, 560, 100, 25, 0)
$Button5 = GUICtrlCreateButton("更新数据", 570, 560, 100, 25, 0)
$Button6 = GUICtrlCreateButton("删除数据", 680, 560, 100, 25, 0)
 
If FileExists($adSource) Then
        $sTableName = _ListTables($adSource)
        If $sTableName Then _ReadData($adSource, $adTable, $DatabasePassword)
Else    
        If MsgBox(52, '提示！', '未检测到数据库，是否立即创建？') = 6 Then
                _CreateDB($adSource, $DatabasePassword)
                _CreateTable($adSource, $adTable, $adCol, $DatabasePassword)
                MsgBox(0, '提示！', '数据库创建完成')
        EndIf
EndIf   
GUISetState()
 
 
$Form2 = GUICreate('', 300, 300, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_GROUP, $WS_BORDER, $WS_CLIPSIBLINGS), -1, WinGetHandle(AutoItWinGetTitle()))
GUICtrlCreateLabel("第一列：", 50, 40, 50, 17)
GUICtrlCreateLabel("第二列：", 50, 80, 50, 17)
GUICtrlCreateLabel("第三列：", 50, 120, 50, 17)
GUICtrlCreateLabel("第四列：", 50, 160, 50, 17)
GUICtrlCreateLabel("第五列：", 50, 200, 50, 17)
 
$Input1 = GUICtrlCreateInput("", 100, 38, 150, 21)
$Input2 = GUICtrlCreateInput("", 100, 78, 150, 21)
$Input3 = GUICtrlCreateInput("", 100, 118, 150, 21)
$Input4 = GUICtrlCreateInput("", 100, 158, 150, 21)
$Input5 = GUICtrlCreateInput("", 100, 198, 150, 21)
 
$Button11 = GUICtrlCreateButton("添加", 50, 250, 80, 30)
$Button21 = GUICtrlCreateButton("取消", 170, 250, 80, 30)
 
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
 
                Case $Button21
                        GUISetState(@SW_ENABLE, $MyGui)
                        GUISetState(@SW_HIDE, $Form2)
 
                        For $i = $Input1 To $Input5
                                GUICtrlSetData($i, '')
                        Next
 
                Case $Button0
                        If Not FileExists($adSource) Then
                                _CreateDB($adSource, $DatabasePassword)
                                _CreateTable($adSource, $adTable, $adCol, $DatabasePassword)
                                MsgBox(0, '提示！', '数据库创建完成')
                        EndIf
 
                Case $Button1
                        $sTableName = _ListTables($adSource)
                        If $sTableName Then
                                MsgBox(0, '', $sTableName)
                        EndIf
 
                Case $Button2
                        $sFieldNames = _ListFields($adSource, $adTable)
                        If $sFieldNames Then
                                MsgBox(0, '', $sFieldNames)
                        EndIf
 
                Case $Button3 ;添加
                        _AddOrUpdate('添加')
 
                Case $Button11 ;写入
                        _WriteOrUpdate()
 
                Case $Button4 ;读取
                        _ReadData($adSource, $adTable, $DatabasePassword)
 
                Case $Button5 ;更新
                        _AddOrUpdate('更新')
 
                Case $Button6 ;删除
                        $iIndex = GUICtrlRead($ListView1)
 
                        If $iIndex Then
                                $iItemID = StringRegExpReplace(GUICtrlRead($iIndex), '\|.+', '')
                                _DeleteData($adSource, $adTable, $iItemID, $DatabasePassword)
                                _ReadData($adSource, $adTable, $DatabasePassword)
                        Else
                                MsgBox(48, '提示！', '请选择需要删除的数据。')
                        EndIf
 
        EndSwitch
WEnd
 
Func _CreateDB($adSource, $DatabasePassword = '');创建数据库
        ;=======================函数说明==========
        ;函数作用：创建 Access数据库
        ;参数说明：
        ;1：$adSource = 数据库*.mdb文件路径、
        ;2：$DatabasePassword = 数据库访问密码（可选）
        ;=========================================
 
        $oADO = ObjCreate("ADOX.Catalog")
        $oADO.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.ActiveConnection.Close
EndFunc   ;==>_CreateDB
 
Func _CreateTable($adSource, $adTable, $adCol, $DatabasePassword = '');创建表和列
        ;=======================函数说明==========================================
        ;函数作用：创建 表和列
        ;参数说明：
        ;1：$adSource = 数据库*.mdb文件路径、
        ;2：$adTable = 创建表名称、
        ;3：$adCol = 创建的列，多列以“|”隔开 — 如：第一列|第二列|……
        ;4：$DatabasePassword = 数据库访问密码（可选）
        ;=========================================================================
 
        $adCol = StringRegExpReplace($adCol, '\|', ',')
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.Execute("CREATE TABLE " & $adTable)
        $oADO.Close;创建表
 
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.Execute("ALTER TABLE " & $adTable & " ADD " & $adCol)
        $oADO.Close;创建列
EndFunc   ;==>_CreateTable
 
Func _AddData($adSource, $adTable, $sFieldNames, $rData, $DatabasePassword = '')
        ;=======================函数说明==========================================
        ;函数作用：Access添加数据
        ;参数说明：
        ;1：$adSource = 数据库*.mdb文件路径、
        ;2：$adTable = 表名称、
        ;3：$sFieldNames = 添加数据的列，多列以“|”隔开 — 如：第一列|第二列|……
        ;4：$rData = 添加的数据，多列数据以“|”隔开 - 如：第一列数据|第二列数据|……
        ;5：$DatabasePassword = 数据库访问密码（可选）
        ;注意：第3个参数和第4个参数需“对齐”，其结构如下。
        ;第一列     |第二列     |第三列     |……
        ;第一列数据 |第二列数据 |第三列数据 |……
        ;=========================================================================
 
        $sFieldNames = StringRegExpReplace($sFieldNames, '\|', ',')
        $rData = StringRegExpReplace($rData, '\|', "','")
 
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.Execute("Insert Into " & $adTable & " (" & $sFieldNames & ") values('" & $rData & "')")
        $oADO.close
EndFunc   ;==>_AddData
 
Func _DeleteData($adSource, $adTable, $iIndex, $DatabasePassword = '')
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.execute("DELETE FROM " & $adTable & " IN '" & $adSource & "' WHERE ID" & " = " & $iIndex)
        $oADO.close
EndFunc   ;==>_DeleteData
 
Func _UpdateData($adSource, $adTable, $sFieldNames, $sNewData, $adQuery);更新数据
        Local $sUpdateText
        $aFieldNames = StringSplit($sFieldNames, '|')
        $aUpdateText = StringSplit($sNewData, '|')
 
        If $aFieldNames[0] <> $aUpdateText[0] Then Return 0
 
        For $i = 1 To $aFieldNames[0]
                $sUpdateText &= $aFieldNames[$i] & '=' & "'" & $aUpdateText[$i] & "',"
        Next
 
        $sUpdateText = StringTrimRight($sUpdateText, 1)
 
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.execute("Update " & $adTable & " Set " & $sUpdateText & " WHERE ID" & " = " & $adQuery)
        $oADO.close
EndFunc   ;==>_UpdateData
 
Func _ReadData($adSource, $adTable, $DatabasePassword = '')
        _GUICtrlListView_BeginUpdate($ListView1)
        _GUICtrlListView_DeleteAllItems($ListView1)
 
        ;=======================函数说明==========================================
        ;函数作用：Access添加数据
        ;参数说明：
        ;1：$adSource = 数据库*.mdb文件路径、
        ;2：$adTable = 表名称、
        ;3：$DatabasePassword = 数据库访问密码（可选）
        ;注意：该函数为环视，循环读取数据库中的所有项目。
        ;=========================================================================
 
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oRec = ObjCreate("ADODB.Recordset")
        $oRec.ActiveConnection = $oADO
        $oRec.Open("Select * From " & $adTable)
        While Not $oRec.eof And Not $oRec.bof
                If @error = 1 Then ExitLoop
                GUICtrlCreateListViewItem($oRec.Fields(0).value & "|" & $oRec.Fields(1).value & "|" & $oRec.Fields(2).value & "|" & $oRec.Fields(3).value & "|" & $oRec.Fields(4).value & "|" & $oRec.Fields(5).value, $ListView1)
                $oRec.movenext
        WEnd
        $oRec.close
        $oADO.Close
        
        _GUICtrlListView_EndUpdate($ListView1)
EndFunc   ;==>_ReadData
 
 
Func _AddOrUpdate($sType)
        WinSetTitle($Form2, '', $sType & '数据')
        GUICtrlSetData($Button11, $sType)
 
        If $sType = '更新' Then
                $bTF = False
                $iIndex = GUICtrlRead($ListView1)
                If $iIndex = 0 Then Return MsgBox(48, '提示！', '请选择需要查询的数据。')
                $sItemText = GUICtrlRead($iIndex)
                $aItemText = StringSplit($sItemText, '|')
                For $i = 0 To $aItemText[0] - 3
                        GUICtrlSetData($Input1 + $i, $aItemText[$i + 2])
                Next
        Else
                $bTF = True
        EndIf
 
        GUISetState(@SW_DISABLE, $MyGui)
        GUISetState(@SW_SHOW, $Form2)
        ControlFocus($Form2, '', $Input1)
EndFunc   ;==>_AddOrUpdate
 
Func _WriteOrUpdate()
        $sDate1 = GUICtrlRead($Input1)
        $sDate2 = GUICtrlRead($Input2)
        $sDate3 = GUICtrlRead($Input3)
        $sDate4 = GUICtrlRead($Input4)
        $sDate5 = GUICtrlRead($Input5)
 
        $iID = StringTrimLeft(@YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & @MSEC, 2)
        $sDateAll = $iID & '|' & $sDate1 & '|' & $sDate2 & '|' & $sDate3 & '|' & $sDate4 & '|' & $sDate5
 
        If $bTF Then
                _AddData($adSource, $adTable, $sFieldNames, $sDateAll, $DatabasePassword)
        Else
                $iIndex = StringRegExpReplace(GUICtrlRead(GUICtrlRead($ListView1)), '\|.+', '')
                _UpdateData($adSource, $adTable, $sFieldNames, $sDateAll, $iIndex)
        EndIf
        _ReadData($adSource, $adTable, $DatabasePassword)
 
        GUISetState(@SW_ENABLE, $MyGui)
        GUISetState(@SW_HIDE, $Form2)
 
        For $i = $Input1 To $Input5
                GUICtrlSetData($i, '')
        Next
EndFunc   ;==>_WriteOrUpdate
 
 
Func _ListTables($adSource) ;获取表名称
        Local $oList = ''
        $oADO = 'ADODB.Connection'
        If IsObj($oADO) Then
                $oADO = ObjGet('', $oADO)
        Else
                $oADO = _Open($adSource)
        EndIf
        If IsObj($oADO) = 0 Then Return SetError(1)
        $oRec = $oADO.OpenSchema($adSchemaTables)
        While Not $oRec.EOF
                If StringLen( $oRec('TABLE_TYPE' ).value) > 5 Then;; Skip the hidden internal tables
                        $oRec.movenext
                        ContinueLoop
                EndIf
                $oList = $oList & $oRec('TABLE_NAME' ).value & '|'
                $oRec.movenext
        WEnd
        If $oList <> '' Then
                $oADO.close
                Return '|' & StringTrimRight($oList, 1)
        Else
                SetError(3, 0, 0)
                $oADO.close
                Return $oList
        EndIf
EndFunc   ;==>_ListTables
 
Func _ListFields($adSource, $adTable) ;获取数据库中所指定的表中的所有字段名称
        Local $Rtn = ''
        $oADO = 'ADODB.Connection'
        If IsObj($oADO) Then
                $oADO = ObjGet('', $oADO)
        Else
                $oADO = _Open($adSource)
        EndIf
        If IsObj($oADO) = 0 Then Return SetError(1)
        $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
        If IsObj($oRec) = 0 Then Return SetError(2)
        ;With $oRec
        $oRec.Open($adTable, $oADO, $adOpenStatic, $adLockOptimistic)
        $Fc = $oRec.fields.count
        If $Fc > 0 Then
                For $i = 0 To $Fc - 1
                        $Rtn &= $oRec.fields($I).name & '|'
                Next
        EndIf
        $oRec.Close
        ;EndWith
        $oADO.Close
        If $Rtn Then
                Return StringTrimRight($Rtn, 1)
        EndIf
EndFunc   ;==>_ListFields
 
Func _Open($adSource)
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        Return $oADO
EndFunc   ;==>_Open
