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

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#NoTrayIcon
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Access ����ʵ��", 320, 455, 553, 128)
$ListView1 = GUICtrlCreateListView("���|����|�Ա�|QQ", 5, 5, 310, 200)
GUICtrlSendMsg(-1, 0x101E, 0, 50)
GUICtrlSendMsg(-1, 0x101E, 1, 80)
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
$Input3 = GUICtrlCreateInput("", 55, 355, 96, 21,0X2000)
$Combo1 = GUICtrlCreateCombo("��", 55, 325, 95, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$Label1 = GUICtrlCreateLabel("����:", 15, 300, 31, 17)
$Label2 = GUICtrlCreateLabel("�Ա�:", 15, 330, 31, 17)
$Label3 = GUICtrlCreateLabel("QQ:", 20, 360, 23, 17)
$Input2 = GUICtrlCreateInput("", 210, 295, 91, 21)
$Input4 = GUICtrlCreateInput("", 210, 355, 91, 21,0X2000)
$Combo2 = GUICtrlCreateCombo("", 210, 325, 90, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "��|Ů", "Ů")
$Label4 = GUICtrlCreateLabel("����:", 170, 300, 31, 17)
$Label5 = GUICtrlCreateLabel("�Ա�:", 170, 330, 31, 17)
$Label6 = GUICtrlCreateLabel("QQ:", 170, 360, 23, 17)
$Button5 = GUICtrlCreateButton("���", 45, 380, 75, 25)
$Button6 = GUICtrlCreateButton("�����޸�", 195, 380, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("��ѯ", 5, 410, 310, 40)
$Input5 = GUICtrlCreateInput("", 95, 420, 121, 21)
$Button7 = GUICtrlCreateButton("��ѯ", 225, 420, 75, 25)
$Label7 = GUICtrlCreateLabel("����// �Ա�:", 10, 425, 81, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$mdb_data_path=@ScriptDir&"\DB0.mdb"
$mdb_data_pwd="test"
$T="*"
$tblname="mydb"

If FileExists($mdb_data_path) Then du()


While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        If Not FileExists($mdb_data_path) Then
                                new()
                        Else
                                MsgBox(0,'��ӭʹ��','��Ȩ���� ��������')
                        EndIf
                Case $Button2
                        du()                        
                Case $Button3
                        $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin=StringSplit($Strn,"|")
                        If $Strnspin[1]='0' Then
                                MsgBox(48,'��ʾ','��ѡ��Ҫ���µ���Ŀ')
                        Else
                                up()
                        EndIf
                Case $Button4
                        $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                        $Strnspin=StringSplit($Strn,"|")
                        If $Strnspin[1]='0' Then
                                MsgBox(48,'��ʾ','��ѡ��Ҫɾ������Ŀ')
                        Else
                                del()
                                du()
                        EndIf
                Case $Button5
                        xie()
                Case $Button6
                        back()
                Case $Button7
                        xun()

        EndSwitch
WEnd

Func new()
        $newMdb = ObjCreate('ADOX.Catalog')
        $newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $newmdb.ActiveConnection.Close;�����ݿ�
        $addtbl = ObjCreate("ADODB.Connection")
        $addTbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addTbl.Execute("CREATE TABLE " & $tblname)
        $addtbl.Close;����
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addfld.Execute("ALTER TABLE " & $tblname & " ADD id identity(1, 1) primary key,name text(255) ,ssex text(50),qq int");id identity(1, 1) primary keyΪ�Զ���ź�����
        $addfld.Close;���б���
        MsgBox(0,'��ʾ:','�����ɹ�������')
EndFunc

Func du()
     GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
          $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path& ";Jet Oledb:Database Password=" & $mdb_data_pwd)
         $RS =ObjCreate("ADODB.Recordset")
          $RS.ActiveConnection = $addfld
            $RS.Open ("Select "&$T & " From " & $tblname )
           while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
            GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value,$ListView1 )
             $rs.movenext
              WEnd
               $rs.close
              $addfld.Close
EndFunc        

Func up()   ;�������ݿ��ڵ�ĳ����¼���޸Ĵ���
        $Strn=GUICtrlRead(GUICtrlRead($ListView1))
        $Strnspin=StringSplit($Strn,"|")
        GUICtrlSetData($Input2,'')
        GUICtrlSetData($Input4,'')
          $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
         $RS =ObjCreate("ADODB.Recordset")
          $RS.ActiveConnection = $addfld
            $RS.Open ("Select "&$t & " From " & $tblname &  " WHERE id" & " = " & $Strnspin[1])     ;$t : ��ʾһ������  $adtable :��ʾ��������������
                          GUICtrlSetData($Input2,$RS.Fields (1).value)
                          GUICtrlSetData($Combo2,$RS.Fields (2).value)
                          GUICtrlSetData($Input4,$RS.Fields (3).value)
             $rs.movenext
               $rs.close
              $addfld.Close
EndFunc
                  
Func del()
                $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")                
            $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
                        $sQuery ="DELETE FROM " & $tblname & " IN '" & $mdb_data_path & "' WHERE id" & " = " & $Strnspin[1] 
           $addfld.execute($sQuery)
           $addfld.close
EndFunc

Func xie()
        If GUICtrlRead($Input1)<>'' And GUICtrlRead($Input3)<>'' Then
                $read1=GUICtrlRead($Input1)
                $read2=GUICtrlRead($Combo1)
                $read3=GUICtrlRead($Input3)
                $addfld = ObjCreate("ADODB.Connection")
                $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
                $addfld.execute("insert into "&$tblname&" (name,ssex,qq) values('"&$read1&"','"&$read2&"','"&$read3&"')")
                $addfld.close
                du()
        Else
                MsgBox(48,'������','���������Ƿ�����')
        EndIf
EndFunc

Func back()
        If GUICtrlRead($Input2)<>'' And GUICtrlRead($Input4)<>'' Then
                $read4=GUICtrlRead($Input2)
                $read5=GUICtrlRead($Combo2)
                $read6=GUICtrlRead($Input4)
                $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")
                $addfld = ObjCreate("ADODB.Connection")
                $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
                $addfld.execute("update " & $tblname & " set  name='"&$read4&"',ssex='"&$read5&"',qq='"&$read6&"' WHERE id" & " = " & $Strnspin[1])
                $addfld.close
                du()
                GUICtrlSetData($Input2,'')
                GUICtrlSetData($Input4,'')
        Else
                MsgBox(48,'������','���������Ƿ�����')
        EndIf
EndFunc

Func xun()
        If Not GUICtrlRead($Input5)='' Then
                $read10=GUICtrlRead($Input5)
                GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
                $addfld = ObjCreate("ADODB.Connection")
                $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
                $RS =ObjCreate("ADODB.Recordset")
          $RS.ActiveConnection = $addfld
                $rs.open("SELECT * FROM "&$tblname&" WHERE name='"&$read10&"' OR ssex='"&$read10&"'")
                while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
           GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value,$ListView1 )
             $rs.movenext
             WEnd
               $rs.close
                $addfld.close
        Else
                MsgBox(48,'������','����Ҫ����һ���ؼ���')
        EndIf
EndFunc