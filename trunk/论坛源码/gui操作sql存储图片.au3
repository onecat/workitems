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

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>

Dim $databaseIp = '192.168.1.221', $databaseName = 'sa', $databasePwd ='abc123'
Global $name,$mainGUI,$tianjia,$Pic1,$shangchuan,$file,$var
Global $Conn=ObjCreate("ADODB.Connection")
$Conn.open("DRIVER={SQL Server};SERVER="& $databaseIp & ";UID="& $databaseName & ";PWD="& $databasePwd & ";")
$Conn.Execute("use tuku")
$Conn.Cursorlocation=3
Global $RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $Conn

mainGUI() 
Func mainGUI()
$mainGUI = GUICreate("����ͼƬ",600,500)

$tianjia = GUICtrlCreateButton("���ͼƬ", 5, 5)


$shangchuan = GUICtrlCreateButton("�ϴ�ͼƬ",70,5)




$Pic1 = GUICtrlCreatePic("",10,35,-1,-1)



GUISetState(@SW_SHOW)        



EndFunc



Func xieru()
$Path = FileGetLongName($var)
$sName = StringSplit($Path, "\")
$max = UBound($sName)
$GetText1 = $sName[$max - 1]
$hHandle = FileOpen($var,16)  
$fRead = FileRead($hHandle)   


 $RS.Open("select * from tupian where name='"&$GetText1&"'")  

If $RS.recordcount > 0  Then
        MsgBox(64,"����","�Ѿ�����")
   Return
EndIf
 
$RS.close


$sql = "insert into tupian (name,tupian) values ('" & $GetText1 & "',"& $fRead & ")"
$Conn.Execute($sql)
MsgBox(64,"ok","�Ѿ��ϴ�")
$Conn.Close 

EndFunc

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $tianjia
                        $var = FileOpenDialog("�����Ƭ", @DesktopCommonDir & "\", "ͼ���ļ� (*.jpg;*.bmp)", 1 + 4)
                        GUICtrlSetImage($Pic1, $var)
                        Case $shangchuan
                                xieru()

        EndSwitch

WEnd