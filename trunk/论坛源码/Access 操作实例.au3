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

;#NoTrayIcon
#include <Date.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
 
$Form1 = GUICreate("Access ����ʵ��", 320, 455, 553, 128)
$ListView1 = GUICtrlCreateListView("���|����|��������|��������", 5, 5, 310, 200)
GUICtrlSendMsg(-1, 0x101E, 0, 50)
GUICtrlSendMsg(-1, 0x101E, 1, 70)
GUICtrlSendMsg(-1, 0x101E, 2, 50)
GUICtrlSendMsg(-1, 0x101E, 3, 100)
$Group1 = GUICtrlCreateGroup("����/��ȡ/�޸�/ɾ��", 5, 210, 310, 60)
GUICtrlSetColor(-1, 0x0000FF)
$Button1 = GUICtrlCreateButton("����", 10, 235, 75, 25)
$Button2 = GUICtrlCreateButton("��ȡ", 85, 235, 75, 25)
$Button3 = GUICtrlCreateButton("�޸�", 160, 235, 75, 25)
$Button4 = GUICtrlCreateButton(" ɾ��", 235, 235, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("���/�޸ļ�¼", 5, 275, 310, 135)
GUICtrlSetColor(-1, 0xFF00FF)
$Input1 = GUICtrlCreateInput("", 55, 295, 96, 21)
;$Input3 = GUICtrlCreateInput("", 55, 355, 96, 21);
$Date1 = GUICtrlCreateDate("", 35, 348, 120, 25)
$Label1 = GUICtrlCreateLabel("����:", 15, 300, 31, 17)
$Label2 = GUICtrlCreateLabel("��������:", 15, 330, 71, 17)
;$Label3 = GUICtrlCreateLabel("��������:", 20, 360, 23, 17);
$Input2 = GUICtrlCreateInput("", 210, 295, 91, 21)
;$Input4 = GUICtrlCreateInput("", 210, 355, 91, 21);
$Date2 = GUICtrlCreateDate("", 180, 348, 120, 25)
 
$Label4 = GUICtrlCreateLabel("����:", 170, 300, 31, 17)
$Label5 = GUICtrlCreateLabel("��������:", 170, 330, 71, 17)
;$Label6 = GUICtrlCreateLabel("��������:", 170, 360, 23, 17);
$Button5 = GUICtrlCreateButton("���", 45, 380, 75, 25)
$Button6 = GUICtrlCreateButton("�����޸�", 195, 380, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("��ѯ����10��ģ�", 5, 410, 310, 40)
$Button7 = GUICtrlCreateButton("��ѯ", 225, 420, 75, 25)
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
                                MsgBox(0, '��ӭʹ��', '��Ȩ���� ��������')
                        EndIf
                Case $Button2
                        du()
                Case $Button3
                        $Strn = GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin = StringSplit($Strn, "|")
                        If $Strnspin[1] = '0' Then
                                MsgBox(48, '��ʾ', '��ѡ��Ҫ���µ���Ŀ')
                        Else
 
                        EndIf
                Case $Button4
                        $Strn = GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin = StringSplit($Strn, "|")
                        If $Strnspin[1] = '0' Then
                                MsgBox(48, '��ʾ', '��ѡ��Ҫɾ������Ŀ')
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
