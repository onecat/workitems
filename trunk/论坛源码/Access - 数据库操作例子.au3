#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <Access.au3>
#include <GUIListView.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>
 
Global $adSource = "MyDatabase.mdb"
Global $adTable = "���ݿ�"
Global $DatabasePassword = "admin"
Global $adCol = 'ID CURRENCY |��һ�� TEXT(255)|�ڶ��� TEXT(255)|������ TEXT(255)|������ TEXT(255)|������ TEXT(255)'
Global $sFieldNames = "ID|��һ��|�ڶ���|������|������|������"
Global $bTF = True
 
$MyGui = GUICreate("Access - ���ݿ��������", 800, 600)
$ListView1 = GUICtrlCreateListView("ID|��һ��|�ڶ���|������|������|������", 10, 10, 780, 530)
 
_GUICtrlListView_SetColumn($ListView1, 0, 'ID', 150, 2)
_GUICtrlListView_SetColumn($ListView1, 1, '��һ��', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 2, '�ڶ���', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 3, '������', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 4, '������', 100, 2)
_GUICtrlListView_SetColumn($ListView1, 5, '������', 100, 2)
 
$Button0 = GUICtrlCreateButton("�������ݿ�", 20, 560, 100, 25, 0)
$Button1 = GUICtrlCreateButton("��ȡ������", 130, 560, 100, 25, 0)
$Button2 = GUICtrlCreateButton("��ȡ�ֶ���", 240, 560, 100, 25, 0)
 
$Button3 = GUICtrlCreateButton("�������", 350, 560, 100, 25, 0)
$Button4 = GUICtrlCreateButton("��ȡ����", 460, 560, 100, 25, 0)
$Button5 = GUICtrlCreateButton("��������", 570, 560, 100, 25, 0)
$Button6 = GUICtrlCreateButton("ɾ������", 680, 560, 100, 25, 0)
 
If FileExists($adSource) Then
        $sTableName = _ListTables($adSource)
        If $sTableName Then _ReadData($adSource, $adTable, $DatabasePassword)
Else    
        If MsgBox(52, '��ʾ��', 'δ��⵽���ݿ⣬�Ƿ�����������') = 6 Then
                _CreateDB($adSource, $DatabasePassword)
                _CreateTable($adSource, $adTable, $adCol, $DatabasePassword)
                MsgBox(0, '��ʾ��', '���ݿⴴ�����')
        EndIf
EndIf   
GUISetState()
 
 
$Form2 = GUICreate('', 300, 300, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_GROUP, $WS_BORDER, $WS_CLIPSIBLINGS), -1, WinGetHandle(AutoItWinGetTitle()))
GUICtrlCreateLabel("��һ�У�", 50, 40, 50, 17)
GUICtrlCreateLabel("�ڶ��У�", 50, 80, 50, 17)
GUICtrlCreateLabel("�����У�", 50, 120, 50, 17)
GUICtrlCreateLabel("�����У�", 50, 160, 50, 17)
GUICtrlCreateLabel("�����У�", 50, 200, 50, 17)
 
$Input1 = GUICtrlCreateInput("", 100, 38, 150, 21)
$Input2 = GUICtrlCreateInput("", 100, 78, 150, 21)
$Input3 = GUICtrlCreateInput("", 100, 118, 150, 21)
$Input4 = GUICtrlCreateInput("", 100, 158, 150, 21)
$Input5 = GUICtrlCreateInput("", 100, 198, 150, 21)
 
$Button11 = GUICtrlCreateButton("���", 50, 250, 80, 30)
$Button21 = GUICtrlCreateButton("ȡ��", 170, 250, 80, 30)
 
 
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
                                MsgBox(0, '��ʾ��', '���ݿⴴ�����')
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
 
                Case $Button3 ;���
                        _AddOrUpdate('���')
 
                Case $Button11 ;д��
                        _WriteOrUpdate()
 
                Case $Button4 ;��ȡ
                        _ReadData($adSource, $adTable, $DatabasePassword)
 
                Case $Button5 ;����
                        _AddOrUpdate('����')
 
                Case $Button6 ;ɾ��
                        $iIndex = GUICtrlRead($ListView1)
 
                        If $iIndex Then
                                $iItemID = StringRegExpReplace(GUICtrlRead($iIndex), '\|.+', '')
                                _DeleteData($adSource, $adTable, $iItemID, $DatabasePassword)
                                _ReadData($adSource, $adTable, $DatabasePassword)
                        Else
                                MsgBox(48, '��ʾ��', '��ѡ����Ҫɾ�������ݡ�')
                        EndIf
 
        EndSwitch
WEnd
 
Func _CreateDB($adSource, $DatabasePassword = '');�������ݿ�
        ;=======================����˵��==========
        ;�������ã����� Access���ݿ�
        ;����˵����
        ;1��$adSource = ���ݿ�*.mdb�ļ�·����
        ;2��$DatabasePassword = ���ݿ�������루��ѡ��
        ;=========================================
 
        $oADO = ObjCreate("ADOX.Catalog")
        $oADO.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.ActiveConnection.Close
EndFunc   ;==>_CreateDB
 
Func _CreateTable($adSource, $adTable, $adCol, $DatabasePassword = '');���������
        ;=======================����˵��==========================================
        ;�������ã����� �����
        ;����˵����
        ;1��$adSource = ���ݿ�*.mdb�ļ�·����
        ;2��$adTable = ���������ơ�
        ;3��$adCol = �������У������ԡ�|������ �� �磺��һ��|�ڶ���|����
        ;4��$DatabasePassword = ���ݿ�������루��ѡ��
        ;=========================================================================
 
        $adCol = StringRegExpReplace($adCol, '\|', ',')
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.Execute("CREATE TABLE " & $adTable)
        $oADO.Close;������
 
        $oADO = ObjCreate("ADODB.Connection")
        $oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource & "; Jet OLEDB:Database Password=" & $DatabasePassword)
        $oADO.Execute("ALTER TABLE " & $adTable & " ADD " & $adCol)
        $oADO.Close;������
EndFunc   ;==>_CreateTable
 
Func _AddData($adSource, $adTable, $sFieldNames, $rData, $DatabasePassword = '')
        ;=======================����˵��==========================================
        ;�������ã�Access�������
        ;����˵����
        ;1��$adSource = ���ݿ�*.mdb�ļ�·����
        ;2��$adTable = �����ơ�
        ;3��$sFieldNames = ������ݵ��У������ԡ�|������ �� �磺��һ��|�ڶ���|����
        ;4��$rData = ��ӵ����ݣ����������ԡ�|������ - �磺��һ������|�ڶ�������|����
        ;5��$DatabasePassword = ���ݿ�������루��ѡ��
        ;ע�⣺��3�������͵�4�������衰���롱����ṹ���¡�
        ;��һ��     |�ڶ���     |������     |����
        ;��һ������ |�ڶ������� |���������� |����
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
 
Func _UpdateData($adSource, $adTable, $sFieldNames, $sNewData, $adQuery);��������
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
 
        ;=======================����˵��==========================================
        ;�������ã�Access�������
        ;����˵����
        ;1��$adSource = ���ݿ�*.mdb�ļ�·����
        ;2��$adTable = �����ơ�
        ;3��$DatabasePassword = ���ݿ�������루��ѡ��
        ;ע�⣺�ú���Ϊ���ӣ�ѭ����ȡ���ݿ��е�������Ŀ��
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
        WinSetTitle($Form2, '', $sType & '����')
        GUICtrlSetData($Button11, $sType)
 
        If $sType = '����' Then
                $bTF = False
                $iIndex = GUICtrlRead($ListView1)
                If $iIndex = 0 Then Return MsgBox(48, '��ʾ��', '��ѡ����Ҫ��ѯ�����ݡ�')
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
 
 
Func _ListTables($adSource) ;��ȡ������
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
 
Func _ListFields($adSource, $adTable) ;��ȡ���ݿ�����ָ���ı��е������ֶ�����
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
