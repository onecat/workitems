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

#include <SQLite.au3>
#include <GuiConstantsEx.au3>
#include <GuiButton.au3>
#include <GUIComboBox.au3>
#Include <GuiTab.au3>
#include <GuiEdit.au3>
#include <EditConstants.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <DateTimeConstants.au3>
#include <GDIPlus.au3>
#include <Date.au3>
#include <WinAPI.au3>
#include <Misc.au3>
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Opt('MustDeclareVars', 1);������������
Opt("GUICloseOnESC", 0);ȡ��esc�˳�
Opt("TrayOnEventMode", 1);�����¼�ģʽ
Opt("TrayMenuMode", 1 + 2);���̲˵������ʽ

Global $sqlite_dll = @ScriptDir & "\lib\sqlite3.dll"
Global $data_base_file = @ScriptDir & "\Db\hnfilesys.db"
Global $hDb
Global $sTitle = "hn�ļ�����",$main_Form,$ListView1
Global $sn_input,$project_input,$department_input
Global $query_button,$export_button,$read_button,$add_button,$revise_button,$del_button 
Global $clear_screen_button
Local  $B_DESCENDING
Global $mainfunc_msg

_Initdata()
;;;;;;;;;;;;;;;;;;;
$main_Form = GUICreate($sTitle, 600,400,100, 60,BitOR($WS_MINIMIZEBOX,$WS_MAXIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU,$WS_SIZEBOX))
        $ListView1 = GUICtrlCreateListView("", 0, 0, 600, 300,BitOR($LVS_SORTDESCENDING, $LVS_REPORT),BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT  ));��չ��ʽ����SQLite��ѯ��ʽ����һ��
        Local $Label4,$Label5,$Label6,$Label7,$Label8,$Label9,$Label10,$Label11,$Label12,$Label13,$Label14,$Label15,$department_label
        $Label4=GUICtrlCreateLabel("sn",12,304,25,17)
    $Label5=GUICtrlCreateLabel("��Ŀ",40,304,43,17)
    $Label6=GUICtrlCreateLabel("��λ",100,304,43,17)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        _GUICtrlListView_AddColumn ($ListView1,"sn",30)
        _GUICtrlListView_AddColumn ($ListView1,"��Ŀ",60)
    _GUICtrlListView_AddColumn ($ListView1,"��λ",60)
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $sn_input = GUICtrlCreateInput("", 4, 330, 25.5, 20)
    $project_input = GUICtrlCreateInput("", 30.5, 330, 59.5, 20)
        $department_input = GUICtrlCreateInput("", 90.5,330, 59.5, 20)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $query_button = GUICtrlCreateButton("��  ��",4, 355, 60, 30)
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        $del_button = GUICtrlCreateButton("ɾ  ��", 70, 355, 60, 30)
        $add_button = GUICtrlCreateButton("��  ��", 138, 355, 60, 30)
        $read_button = GUICtrlCreateButton("��  ȡ", 210, 355, 60, 30)    
    $revise_button = GUICtrlCreateButton("��  ��", 280, 355, 60, 30)
        $clear_screen_button = GUICtrlCreateButton("��  ��",350, 355, 60, 30)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    GUISetState(@SW_SHOW)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
While 1
                $mainfunc_msg = GUIGetMsg()
                _deal_gen_msg($mainfunc_msg)
WEnd
Func _Initdata()
        _SQLite_Startup($sqlite_dll)
        If @error Then Exit (MsgBox(16, "SQLite Error", "SQLite3.dll Can't be Loaded!"))
        
        $hDb = _SQLite_Open($data_base_file)
        If @error Then Exit (MsgBox(16, "SQLite Error", "Can't Load Database!"))
        ;_SQLite_Exec($hDb, "DROP TABLE T_hn_file;")
        If Not FileExists($data_base_file) Or FileGetSize($data_base_file) = 0 Then
                _SQLite_Exec($hDb, "CREATE TABLE IF NOT EXISTS Test_table (F_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, F_project NVARCHAR(30), F_department NVARCHAR(30));")
        EndIf
EndFunc   ;==>_Initdata
Func _deal_gen_msg($mainfunc_msg)
        Switch $mainfunc_msg
                Case -3        
                           _SQLite_Open($data_base_file)
                           _SQLite_Shutdown()
                           Exit        
                Case $read_button                
                        _SQLiteRead_all()           
            Case $query_button                
                        _SQLite_Select()                                 
                Case $del_button                
                        Local $temp_sn = _SQLiteDelete()                                
                        _SQLiteRead_all()                         
                Case $add_button        
                        _SQLiteInsert()
                        _SQLiteRead_all()                                 
                Case $revise_button
                        _SQLite_update()
                        _SQLiteRead_all()
                Case $clear_screen_button
                        _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($ListView1))
        EndSwitch 
EndFunc        
Func _SQLiteRead_all()
        Local $temp_hQuery, $temp_aRow
    _GUICtrlListView_DeleteAllItems ( GUICtrlGetHandle($ListView1) )
        _SQLite_Query(-1, "SELECT * FROM Test_table ORDER BY F_id ASC limit 200;",$temp_hQuery)
        Local $temp_si,$temp_sqlstr
    While _SQLite_FetchData ($temp_hQuery, $temp_aRow) = $SQLITE_OK
                For $temp_si = 0 To 2
                        $temp_sqlstr  &=  $temp_aRow[$temp_si] &"|"            
                Next
                $temp_sqlstr = StringTrimRight($temp_sqlstr,1)
                GUICtrlCreateListViewItem ($temp_sqlstr,$ListView1)  
        $temp_sqlstr = ""                
    WEnd
EndFunc

Func _SQLiteInsert()
        
        Local  $xiangmu = StringStripWS(GUICtrlRead($project_input), 3),$danwei = StringStripWS(GUICtrlRead($department_input), 3)
    Local $insert_str_temp = "Insert into Test_table (F_project,F_department) values ('" & $xiangmu & "' ,'" & $danwei & "');"
        _SQLite_Exec(-1, $insert_str_temp)
	EndFunc
	
	Func _SQLite_Select()        
        Local $temp_hQuery, $temp_aRow        
        Local $hn_searchstr_temp = StringStripWS(GUICtrlRead($department_input), 3)
        Local $temp_si,$temp_sqlstr
                _SQLite_Query(-1, "SELECT * FROM Test_table where F_department LIKE '" & "%" & $hn_searchstr_temp & "%" & "';",$temp_hQuery)
        if _SQLite_FetchData ($temp_hQuery, $temp_aRow) <> $SQLITE_OK Then 
               Return MsgBox(262208, "��ѯ����...", " [" & $hn_searchstr_temp & "] �ļ�¼��",5)
                Else
                        _GUICtrlListView_DeleteAllItems (GUICtrlGetHandle($ListView1))
            _SQLite_QueryReset($temp_hQuery)
                        While _SQLite_FetchData ($temp_hQuery, $temp_aRow) = $SQLITE_OK
                                $temp_sqlstr  =  $temp_aRow[0] & "|" & $temp_aRow[1] & '|' & $temp_aRow[2]           
                GUICtrlCreateListViewItem ($temp_sqlstr,$ListView1)      
            WEnd
        EndIf
EndFunc
;~ Func _SQLite_Select()        
;~         Local $temp_hQuery, $temp_aRow        
;~         Local $hn_searchstr_temp = StringStripWS(GUICtrlRead($department_input), 3)
;~         Local $temp_si,$temp_sqlstr
;~                 _SQLite_Query(-1, "SELECT * FROM Test_table where F_department LIKE '" & "%" & $hn_searchstr_temp & "%" & "';",$temp_hQuery)
;~             Local $Temp_received = False 
;~             While _SQLite_FetchData ($temp_hQuery, $temp_aRow) = $SQLITE_OK
;~             $Temp_received = True
;~                     ExitLoop
;~         WEnd
;~             If $Temp_received = False Then 
;~                 MsgBox(262208, "��ѯ����...", " [" & $hn_searchstr_temp & "] �ļ�¼��",5)
;~         Else
;~                         _GUICtrlListView_DeleteAllItems (GUICtrlGetHandle($ListView1))
;~             While _SQLite_FetchData ($temp_hQuery, $temp_aRow) = $SQLITE_OK
;~                                 For $temp_si = 0 To 2
;~                                         $temp_sqlstr  &=  $temp_aRow[$temp_si] &"|"            
;~                         Next
;~                         $temp_sqlstr = StringTrimRight($temp_sqlstr,1)
;~                         GUICtrlCreateListViewItem ($temp_sqlstr,$ListView1)  
;~                 $temp_sqlstr = ""                
;~             WEnd
;~         EndIf
;~ EndFunc
Func _SQLite_update()
        Local  $sn = StringStripWS(GUICtrlRead($sn_input), 3), _  
                            $xiangmu = StringStripWS(GUICtrlRead($project_input), 3), _             
                                                $danwei = StringStripWS(GUICtrlRead($department_input), 3)
        Local $temp_sSql = "UPDATE Test_table SET F_project = '" & $xiangmu & "',  F_department = '" & $danwei & "' WHERE F_id = " & $sn & ";"
        _SQLite_Exec(-1, $temp_sSql)
EndFunc   ;==>_KehuInfoEdit
Func _SQLiteDelete()
        
        Local $sn = StringStripWS(GUICtrlRead($sn_input), 3)
    _SQLite_Exec(-1, "DELETE FROM  Test_table WHERE F_id = '" & $sn & "';")
    Return $sn
    
EndFunc