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
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
$mdb_data_path="sky.mdb"
$mdb_data_pwd=""
$name="�����Ҳ�"
$pass="��ȥ"
$qq=25359272
$e_mail="xtybfgu@163.com"
$T="*"
$tblname="tywb"
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("���ݿ��������", 633, 454, 193, 115)
$ListView1 = GUICtrlCreateListView("   ID  |      ����  |    ����  |     QQ    |        E_mail ", 8, 24, 617, 361)
$Button0 = GUICtrlCreateButton("�������ݿ�", 20, 408, 97, 25, 0)
$Button1 = GUICtrlCreateButton("д��1000������", 130, 408, 130, 25, 0)
$Button2 = GUICtrlCreateButton("��������", 400, 408, 97, 25, 0)
$Button3 = GUICtrlCreateButton("ɾ������",510, 408, 113, 25, 0);280, 408, 113, 25, 0)
$Button4 = GUICtrlCreateButton("��ȡ����", 280, 408, 113, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;du()
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
         Case  $Button0
            data($mdb_data_path, $tblname)
         Case  $Button1;д��
            sx()
                   du()
        Case $Button2 ;����
                up()
                du()
 
    Case $Button3 ;ɾ��
               del()
              du()
 
    Case $Button4 ;��ȡ
 
              du()
 
 
 
        EndSwitch
WEnd
 
Func du()
     GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
          $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
         $RS =ObjCreate("ADODB.Recordset")
          $RS.ActiveConnection = $addfld
            $RS.Open ("Select "&$T & " From " & $tblname )
           while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
            GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value&"|"& $RS.Fields (4).value,$ListView1 )
 
              ; MsgBox(0, "", $RS.Fields (1).value);��ʾ���һ������
             $rs.movenext
              WEnd
               $rs.close
              $addfld.Close
EndFunc
 
Func del()
                $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")                
            $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
                        $sQuery ="DELETE FROM " & $tblname & " IN '" & $mdb_data_path & "' WHERE id" & " = " & $Strnspin[1] 
         ; MsgBox(0,"",$sQuery)
           $addfld.execute($sQuery)
           $addfld.close
 MsgBox(4096, "��ʾ:",$Strnspin[1]&"    ɾ���ɹ�!!!")
 
EndFunc
 
 
Func up()
         $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")                
            $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
                        $sQuery ="update " & $tblname & " set  name='С��Sky',pass='good',e_mail='25359272@qq.com' WHERE id" & " = " & $Strnspin[1] 
         ;  MsgBox(0,"",$sQuery)
           $addfld.execute($sQuery)
           $addfld.close
    MsgBox(4096, "��ʾ:",$Strnspin[1]&"    ���³ɹ�!!!")
EndFunc
 
 
Func sx()
         $addfld = ObjCreate("ADODB.Connection")
      
       $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
      $x=0
       While 1
        $x+=1
       if $x >1000 Then ExitLoop
      $addfld.Execute("insert into tywb (name,pass,qq,e_mail) values('"&$name&"','"&$pass&"','"&$qq&"','"&$e_mail&"')")
     WEnd
      ; $conn.Execute("insert into tywb (name,pass,qq,e_mail) values('"&$name&"','"&$pass&"','"&$qq&"','"&$e_mail&"')")
     ;  $RS.close
          $addfld.close
         MsgBox(4096, "��ʾ:"," �ɹ�д�����ݿ⣡")  
EndFunc
 
Func data($mdb_data_path, $tblname)
if not FileExists($mdb_data_path) Then
$newMdb = ObjCreate("ADOX.Catalog")
$newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$newmdb.ActiveConnection.Close;�����ݿ�
$addtbl = ObjCreate("ADODB.Connection")
$addTbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$addTbl.Execute("CREATE TABLE " & $tblname)
$addtbl.Close;����
 
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$addfld.Execute("ALTER TABLE " & $tblname & " ADD id identity(1, 1) primary key,name char ,pass char ,qq int,e_mail char");id identity(1, 1) primary keyΪ�Զ���ź�����
$addfld.Close;���б���
MsgBox(64,"��ʾ","�������ݿ�ɹ�",5)
Else
MsgBox(64,"��ʾ","���Ѿ�������һ�����ݿ���",5)
EndIf
EndFunc
