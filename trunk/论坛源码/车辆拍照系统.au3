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
#include <GUIListView.au3>
#include <Access.au3>
#include <Excel.au3>

#Region ### START Koda GUI section ### Form=c:\users\administrator\desktop\�½��ļ���\form.kxf
$Form1 = GUICreate("��������ϵͳ", 782, 567, 316, 304)
$Label1 = GUICtrlCreateLabel("���ƺ���", 16, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input1 = GUICtrlCreateInput("", 88, 16, 97, 21)
$Label2 = GUICtrlCreateLabel("��������", 248, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input2 = GUICtrlCreateInput("", 320, 16, 97, 21)
$Label3 = GUICtrlCreateLabel("��������", 480, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input3 = GUICtrlCreateInput("", 560, 16, 209, 21)
$Label4 = GUICtrlCreateLabel("Ʒ������", 16, 55, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input4 = GUICtrlCreateInput("", 88, 55, 97, 21)
$Label5 = GUICtrlCreateLabel("��������", 248, 55, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input5 = GUICtrlCreateInput("", 320, 55, 145, 21)
$Label6 = GUICtrlCreateLabel("��ʶ�����", 479, 55, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input6 = GUICtrlCreateInput("", 568, 55, 201, 21)
$Label7 = GUICtrlCreateLabel("�ֻ�����", 16, 90, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input7 = GUICtrlCreateInput("", 88, 90, 130, 21)
$Label8 = GUICtrlCreateLabel("¼��ʱ��", 248, 90, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Input8 = GUICtrlCreateInput("", 320, 90, 145, 21)
$Button1 = GUICtrlCreateButton("�� ��", 23, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Button2 = GUICtrlCreateButton("�� ��", 100, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Button3 = GUICtrlCreateButton("", 177, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Button4 = GUICtrlCreateButton("", 254, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Button5 = GUICtrlCreateButton("��  ��", 331, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$Button6 = GUICtrlCreateButton("����Excel", 408, 118, 75, 25)
GUICtrlSetFont(-1, 12, 400, 0, "΢���ź�")
$ListView1 = GUICtrlCreateListView("���|���ƺ���|��������|��������|��������|��ʶ�����|�ֻ�����|¼��ʱ��", 4, 150, 775, 413 ,BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
GUICtrlSendMsg(-1, 0x101E, 0, 40)
GUICtrlSendMsg(-1, 0x101E, 1, 90)
GUICtrlSendMsg(-1, 0x101E, 2, 90)
GUICtrlSendMsg(-1, 0x101E, 3, 100)
GUICtrlSendMsg(-1, 0x101E, 4, 140)
GUICtrlSendMsg(-1, 0x101E, 5, 170)
GUICtrlSendMsg(-1, 0x101E, 6, 110)
GUICtrlSendMsg(-1, 0x101E, 7, 110)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$mdb_data_path = @ScriptDir & "\DetectData.mdb"
$mdb_data_pwd='vpte'
$adTable = "Receipt"
$t='*'

shuaxin()

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                            Case $Button1       ;�½����ݿ�
                   If Not FileExists($mdb_data_path) Then
                           new()
                   Else
                           MsgBox(0,'���ڡ�����','��ϵͳ�����ڿƼ���������'&@CR&''&@CR&'�汾:KF-0378-T1'&@CR&''&@CR&'@ ��Ȩ���� ��������')
                                        EndIf
                                Case $Button2  ;�鿴
                                        chakan()
                                Case $Button5  ;д���µļ�¼
                                        xieru()
                                Case $Button6  ;����Excel��
                                $LL=_GUICtrlListView_GetSelectedCount($ListView1)
                        If $LL=0 Then
                                MsgBox(48,'��ʾ:','������ѡ��һ����¼,�� Ctrl �� Shift ���Զ�ѡ')
                        Else
                                newxls()
                        EndIf
                                
                        EndSwitch
WEnd
                
Func shuaxin()  ;ˢ��ѡ���
                If Not FileExists($mdb_data_path) Then
                $msg=MsgBox(1,'��ӭʹ��','û���ҵ����ݿ��ļ�,�Ƿ񴴽�?')
                If $msg=1 Then
                        new()
                Else
                        Exit
                EndIf
        EndIf                
EndFunc 

Func new()   ;�½����ݿ�ͱ�
        $time=@MIN&@SEC&'-'&@MDAY&@HOUR&'-'&@YEAR
        $newMdb = ObjCreate('ADOX.Catalog')
        $newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $newmdb.ActiveConnection.Close;�����ݿ�
        $addtbl = ObjCreate("ADODB.Connection")
        $addTbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addTbl.Execute("CREATE TABLE " & $adTable)
        $addtbl.Close;����
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addfld.Execute("ALTER TABLE " & $adTable & " ADD ID identity(1, 1) primary key,DET_PLATE text(255),DET_PCLASS text(255),DET_MINGZI text(255),DET_PINGPAI text(255),DET_FADONGJIHAO text(255),DET_VIN text(255),DET_HAOMA text(255),DET_DATE text(255)")
        $addfld.Close;���б���
        MsgBox(0,'��ʾ','���ݿⴴ���ɹ�!'&@CR&''&@CR&'ϵͳ��Ȩ��:KF-'&$time&@CR&''&@CR&'@ ��Ȩ���� ��������')
EndFunc

Func xieru() ;�����ݿ�������µ���Ŀ
        If GUICtrlRead($Input1)<>'' And GUICtrlRead($Input3)<>'' And GUICtrlRead($Input4)<>'' And GUICtrlRead($Input5)<>'' And GUICtrlRead($Input6)<>'' And GUICtrlRead($Input7)<>'' And GUICtrlRead($Input8)<>'' Then
                $read1=GUICtrlRead($Input1)
                $read2=GUICtrlRead($Input2)
                $read3=GUICtrlRead($Input3)
                $read4=GUICtrlRead($Input4)
                $read5=GUICtrlRead($Input5)
                $read6=GUICtrlRead($Input6)
                $read7=GUICtrlRead($Input7)
                $read8=GUICtrlRead($Input8)
                $addfld = ObjCreate("ADODB.Connection")
                $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)  ;Ҫд���ݣ�����Ҫ���ӵ����ݿ�
                $addfld.Execute("insert into "&$adTable&" (DET_PLATE,DET_PCLASS,DET_MINGZI,DET_PINGPAI,DET_FADONGJIHAO,DET_VIN,DET_HAOMA,DET_DATE) values('"&$read1&"','"&$read2&"','"&$read3&"','"&$read4&"','"&$read5&"','"&$read6&"','"&$read7&"','"&$read8&"')")  ;�����Ǹ������ݿ�Ҫд��ʲôλ�á�Ҫдʲôֵ��
                $addfld.close  ;д��������е�����
                                MsgBox(48,'��ʾ','��Ӻͷ��ͼ�¼�ɹ���')
                                GUICtrlSetData($Input1,'')
                                GUICtrlSetData($Input2,'')
                                GUICtrlSetData($Input3,'')
                                GUICtrlSetData($Input4,'')
                                GUICtrlSetData($Input5,'')
                                GUICtrlSetData($Input6,'')
                                GUICtrlSetData($Input7,'')
                                GUICtrlSetData($Input8,'')
                                GUICtrlSetState($Input1,$GUI_FOCUS)
                        Else
                MsgBox(48, "��ʾ", "���ʧ��,������Ŀ��д��ʽ�Ƿ���ȷ!�������������ƺ�")
                GUICtrlSetState($Input5,$GUI_FOCUS)
        EndIf
        
EndFunc
        
Func chakan() ;�鿴���ݿ������еļ�¼
        GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
         $addfld = ObjCreate("ADODB.Connection")
     $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)  ;��仰����һ��һ�������ӵ����ݿ�
     $RS =ObjCreate("ADODB.Recordset")
         $RS.ActiveConnection = $addfld
         $RS.Open ("Select "&$t & " From " & $adTable )     ;$t : ��ʾһ������  $adtable :��ʾ��������������   ��仰�ǣ���$adtable��ĵ�һ����ʼ��ȡ��ֱ������  $t���Ǻ������е���˼
      while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
            GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value&"|"& $RS.Fields (4).value&"|"& $RS.Fields (5).value&"|"& $RS.Fields (6).value&"|"& $RS.Fields (7).value&"|"& $RS.Fields (8).value,$ListView1 ) 
              ; $RS.Fields (0).value;��ʾ���ǵ�һ�����ݣ������������ƣ��ڶ����������������Ѷ�ȡ����ֵ�� | �������������Ƿŵ���Ӧ��ListView���档
             $rs.movenext  ;
              WEnd
               $rs.close
              $addfld.Close  ;��ȡ������������е����ӣ����ѻ����������ա�
EndFunc

Func newxls()  
        Local $array[1],$L
        $L='���|���ƺ���|��������|��������|��������|��ʶ�����|�ֻ�����|¼��ʱ��'
        $Selected = _GUICtrlListView_GetSelectedIndices($ListView1, 1)
        _ArrayAdd($array,$L)
        For $I = 1 To $Selected[0]
                $SelectedItem = _GUICtrlListView_GetItemTextString($ListView1, $Selected[$I])
                ;MsgBox(0, 0, $SelectedItem)
                _ArrayAdd($array,$SelectedItem)
        Next
        $excel=_ExcelBookNew(1)  ;����һ���µĹ�����������ʾ��(0=���ɼ�, 1=�ɼ�)
        For $i=0 To UBound($array)-1   ;��������ά�ȵĴ�С
                $htest=StringSplit($array[$i],'|')  ;��ָ���ָ������ַ�����ֳ������Ӵ�
                For $ii=0 To $htest[0]
                        _ExcelWriteCell($excel,$htest[$ii],$i,$ii)  ;���һ�����ݵ��򿪵�EXCEL(�򿪵�excel,Ҫ��ӵ�����,Ҫд�����,Ҫд�����)
                Next
        Next
EndFunc