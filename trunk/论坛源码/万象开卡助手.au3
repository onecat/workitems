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

#NoTrayIcon
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=14065.ico
#AutoIt3Wrapper_outfile=WxTmpCard.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Description=�����ϻ�����
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Copyright AmibeCode.com
#AutoIt3Wrapper_Res_Field=��˾����|AmibeCode.com
#AutoIt3Wrapper_Res_Field=��Ʒ�汾|2.0.0.0
#AutoIt3Wrapper_Res_Field=ǰ̨�汾|1.5.0.0
#AutoIt3Wrapper_Res_Field=����汾|1.0.0.0
#AutoIt3Wrapper_Res_Field=��Ʒ����|�����ϻ�����
#AutoIt3Wrapper_Res_Field=�ڲ�����|WxTmpCard
#AutoIt3Wrapper_Res_Field=��Ȩ����|Amibe All Rights Reserved
#AutoIt3Wrapper_Res_Field=��������|ֻ�������о������ô�����ط��ɡ�
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#Region ;**** ���������� ACNWrapper_GUI ***
#include <Array.au3>
#include <Constants.au3>
#include <GUIListView.au3>
#include <GuiIPAddress.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>
Opt('MustDeclareVars',1)  ;ǿ����������
Opt("GUICloseOnESC",0)    ;==>�ر�ESC�˳�
Opt("GUIOnEventMode",1)   ;==>�����¼�����ģʽ
Opt("TrayAutoPause",0)    ;����������ͼ��ʱ����ͣ 
Opt("TrayMenuMode",1+2)   ;ȥ��״̬��ͼ����״̬��
Global $GUI_ABOUTBOX
Global $GUI_BUY_FORM
Global $GUI_SETTING_FORM
Global $GUI_INPUTID_FORM
Global $GUI_INPUTID_USERNAME
Global $GUI_INPUTID_IDNUMBER
Global $GUI_INPUTID_PASSWORD
Global $GUI_SETTING_FORM_SQLVESION
Global $GUI_SETTING_FORM_SQLUSERNAME
Global $GUI_SETTING_FORM_SQLPASSWORD
Global $GUI_SETTING_FORM_SQLIPADDRESS
Global $MDBDATABASE_PATH="WxTmpCard.mdb"
Global $SQLDATABASE_CONFIG="SrvInFo.ini"
Global $SQLIPADDRESS=""
Global $SQLUSERNAME=""
Global $SQLPASSWORD=""
Global $SQLDATABASE_NAME=""
If WinGetHandle("�����ϻ�����  PowerBy Amibe") Then
        MsgBox(0,"","�����Ѿ����У�"&@CRLF&"�����ظ�ִ�У�")
        Exit
EndIf
Global $GUI_MAINFORM_FORM=GUICreate("�����ϻ�����  PowerBy Amibe",350,400,-1,-1)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
Global $GUI_MAINFORM_LISTVIEW_USERS=GUICtrlCreateListView("",5,5,340,370)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "���֤����", 150)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "����", 80)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "����", 80)
Global $GUI_CONTEXTMENU=GUICtrlCreateContextMenu($GUI_MAINFORM_LISTVIEW_USERS)
Global $GUI_CONTEXTMENU_LOGIN=GUICtrlCreateMenuItem("�Ǽ��ϻ�",$GUI_CONTEXTMENU)
GUICtrlSetOnEvent($GUI_CONTEXTMENU_LOGIN,"GUI_MAINFORM_MENU_SERVICE_LOGIN")
Global $GUI_CONTEXTMENU_ADDED=GUICtrlCreateMenuItem("�����Ϣ",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_ADDED,"GUI_MAINFORM_MENU_SETTING_SCANID_INPUT")
Global $GUI_CONTEXTMENU_DELED=GUICtrlCreateMenuItem("ɾ����¼",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_DELED,"DELETECARD")
Global $GUI_CONTEXTMENU_REFRE=GUICtrlCreateMenuItem("ˢ���б�",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_REFRE,"GUI_MAINFORM_MENU_SERVICE_REFRESHLIST")
Global $GUI_MAINFORM_MENU_SETTING=GUICtrlCreateMenu("����(&C)")
Global $GUI_MAINFORM_MENU_SETTING_SETTING=GUICtrlCreateMenuItem("ϵͳ����",$GUI_MAINFORM_MENU_SETTING)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SETTING_SETTING,"GUI_MAINFORM_MENU_SETTING_SETTING")
Global $GUI_MAINFORM_MENU_SETTING_INPUTID=GUICtrlCreateMenuItem("¼����Ϣ",$GUI_MAINFORM_MENU_SETTING)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SETTING_INPUTID,"GUI_MAINFORM_MENU_SETTING_SCANID_INPUT")
Global $GUI_MAINFORM_MENU_SERVICE=GUICtrlCreateMenu("����(&S)")
Global $GUI_MAINFORM_MENU_SERVICE_CONNETMDB=GUICtrlCreateMenuItem("���ӿ���",$GUI_MAINFORM_MENU_SERVICE)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SERVICE_CONNETMDB,"GUI_MAINFORM_MENU_SERVICE_REFRESHLIST")
Global $GUI_MAINFORM_MENU_SERVICE_CONNETWX=GUICtrlCreateMenuItem("�����շ�",$GUI_MAINFORM_MENU_SERVICE)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SERVICE_CONNETWX,"GUI_MAINFORM_MENU_SERVICE_GETWXINFO")
Global $GUI_MAINFORM_MENU_HELP = GUICtrlCreateMenu("����(&H)")
Global $GUI_MAINFORM_MENU_HELP_HELP = GUICtrlCreateMenuItem("ʹ��˵��",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_HELP,"GUI_MAINFORM_MENU_HELP_HELP")
Global $GUI_MAINFORM_MENU_HELP_BUY = GUICtrlCreateMenuItem("����ʹ��",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_BUY,"GUI_MAINFORM_MENU_HELP_BUY")
Global $GUI_MAINFORM_MENU_HELP_ABOUT = GUICtrlCreateMenuItem("�������",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_ABOUT,"GUI_MAINFORM_MENU_HELP_ABOUT") 
GUISetState(@SW_SHOW)
While 1
  Sleep(1000)
WEnd
Func GUI_MAINFORM_MENU_SETTING_SCANID_INPUT()
$GUI_INPUTID_FORM=GUICreate("¼�����֤��Ϣ",270,170)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("���֤��Ϣ��",5, 5, 260, 125)
GUICtrlCreateLabel("���֤������",26, 35, 80, 17)
GUICtrlCreateLabel("���֤���룺",26, 65, 80, 17)
GUICtrlCreateLabel("���֤���룺",26, 95, 80, 17)
$GUI_INPUTID_USERNAME=GUICtrlCreateInput("",100,30,150,21)
$GUI_INPUTID_IDNUMBER=GUICtrlCreateInput("",100,60,150,21)
$GUI_INPUTID_PASSWORD=GUICtrlCreateInput("",100,90,150,21)
Local $GUI_SETTING_FORM_BUTTONRESET = GUICtrlCreateButton("����", 155, 140, 50, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONRESET,"GUI_INPUTID_FORM_RESET")
Local $GUI_SETTING_FORM_BUTTONOK = GUICtrlCreateButton("ȷ��", 215, 140, 50, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONOK,"GUI_INPUTID_FORM_SAVEID")
GUISetState(@SW_SHOW)        
EndFunc
Func GUI_INPUTID_FORM_RESET()
GUICtrlSetData($GUI_INPUTID_USERNAME,"")        
GUICtrlSetData($GUI_INPUTID_IDNUMBER,"")
GUICtrlSetData($GUI_INPUTID_PASSWORD,"")
EndFunc
Func GUI_INPUTID_FORM_SAVEID()
if Not FileExists($MDBDATABASE_PATH) Then
        MsgBox(0+16+262144,"����","û���ҵ�ʵ������,����ϵ�ͷ���ȡ")
Else
        If GUICtrlRead($GUI_INPUTID_IDNUMBER)="" Or GUICtrlRead($GUI_INPUTID_USERNAME)="" Or GUICtrlRead($GUI_INPUTID_PASSWORD)="" then
                MsgBox(0+48+262144,"��ʾ","����ѡ�����Ϊ��")
        Else
                Local        $INSETCARDINFO
                $INSETCARDINFO=ObjCreate("ADODB.Connection")
                $INSETCARDINFO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&$MDBDATABASE_PATH&";Jet Oledb:Database Password=''")
                $INSETCARDINFO.Execute("insert into CardInFo(sIDCard,sName,sPassWord) values ('"&GUICtrlRead($GUI_INPUTID_IDNUMBER)&"','"&GUICtrlRead($GUI_INPUTID_USERNAME)&"','"&GUICtrlRead($GUI_INPUTID_PASSWORD)&"')")
                $INSETCARDINFO.Close
                GUI_INPUTID_FORM_RESET()
                ControlFocus("¼�����֤��Ϣ","",$GUI_INPUTID_USERNAME)
        EndIf
EndIf
EndFunc
Func GUI_MAINFORM_MENU_HELP_ABOUT()
Local $GUI_ABOUTBOX_SRVSOFT_VESION="2.0.0.0"
Local $GUI_ABOUTBOX_CONSOLE_VESION="1.5.0.0"
Local $GUI_ABOUTBOX_TRANFER_VESION="1.0.0.0"
$GUI_ABOUTBOX=GUICreate("����",300,250,-1,-1,BitOR($WS_SYSMENU,$WS_CAPTION,$WS_POPUP, _
                                                                                                                                                                        $WS_POPUPWINDOW,$WS_BORDER,$WS_CLIPSIBLINGS))
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("��Ʒ��Ϣ", 5, 5, 290, 110)
GUICtrlCreateLabel("����Ʒ�ϵͳ�ϻ�����", 15, 24, 184, 17)
GUICtrlCreateLabel("���� AmibeCode �����Ŷ�", 15, 45, 223, 17)
GUICtrlCreateLabel("Copyright@2011 Amibe Inc. All Rights Reserved", 15, 66, 270, 17)
GUICtrlCreateLabel("�����û��ṩ����֧�֣�QQ 455196881", 15, 88, 250, 17)
GUICtrlCreateGroup("����˰汾", 5, 120, 140, 92)
GUICtrlCreateLabel("������汾��", 16, 144, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_SRVSOFT_VESION, 96, 144, 45, 17)
GUICtrlCreateLabel("���������䣺", 16, 176, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_TRANFER_VESION, 96, 176, 45, 17)
GUICtrlCreateGroup("����̨�汾", 156, 120, 140, 92)
GUICtrlCreateGroup("����̨�汾", 312, 240, 140, 92)
GUICtrlCreateLabel("������汾��", 167, 144, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_CONSOLE_VESION, 247, 144, 45, 17)
GUICtrlCreateLabel("����̨���䣺", 167, 176, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_TRANFER_VESION, 247, 176, 45, 17)
Local $GUI_ABOUTBOX_BUTTON_OK = GUICtrlCreateButton("ȷ��", 220, 220, 75, 25)
GUICtrlSetOnEvent($GUI_ABOUTBOX_BUTTON_OK,"GUI_ABOUTBOX_CLOSE") 
GUISetState(@SW_SHOW)        
EndFunc
Func GUI_ABOUTBOX_CLOSE()
        GUIDelete($GUI_ABOUTBOX)
EndFunc
Func GUI_MAINFORM_MENU_HELP_BUY()
$GUI_BUY_FORM = GUICreate("����ʹ��",300, 200, -1, -1,BitOR($WS_SYSMENU,$WS_CAPTION,$WS_POPUP,$WS_POPUPWINDOW,$WS_BORDER,$WS_CLIPSIBLINGS))
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("������֪", 5, 5, 290, 100)
GUICtrlCreateLabel("���֧�������շѻ���:", 21, 29, 200, 17)
GUICtrlCreateLabel("����2004-2008 ����ʹ��SQLSERVER���ݿ�İ汾", 20, 53, 260, 17)
GUICtrlCreateLabel("�����շ�ϵͳ���������ݿ�汾����ϵ���߶���.", 20, 80, 260, 17)
GUICtrlCreateGroup("�շѼ۸�", 5, 116, 290, 50)
GUICtrlCreateLabel("�������Ϊ800Ԫ", 90, 140, 150, 17)
GUICtrlCreateLabel("��������ϵQQ:455196881", 90, 178, 150, 17)
Local $GUI_BUY_FORM_BUTTON=GUICtrlCreateButton("ȷ��",245,170,50,25)
GUICtrlSetOnEvent($GUI_BUY_FORM_BUTTON,"HELP_BUY_FORM_CLOSE") 
GUISetState(@SW_SHOW)
EndFunc
Func HELP_BUY_FORM_CLOSE()
        GUIDelete($GUI_BUY_FORM)
EndFunc
Func GUI_MAINFORM_MENU_HELP_HELP()
        MsgBox(0+64,"��ʾ","�����û��ṩ����֧��"&@CRLF&"��ѯ���ṩ���Ĺ���ID"&@CRLF&"����ϵQQ 455196881")
EndFunc
Func GUI_FORM_CLOSE()
Switch @GUI_CtrlId
        Case $GUI_EVENT_CLOSE
                Switch @GUI_WinHandle
                        Case $GUI_MAINFORM_FORM 
                                Exit
                        Case $GUI_ABOUTBOX
                                GUIDelete($GUI_ABOUTBOX)
                        Case $GUI_BUY_FORM
                                GUIDelete($GUI_BUY_FORM)
                        Case $GUI_SETTING_FORM
                                GUIDelete($GUI_SETTING_FORM)
                        Case $GUI_INPUTID_FORM
                                GUIDelete($GUI_INPUTID_FORM)
                EndSwitch                
EndSwitch        
EndFunc
Func GUI_MAINFORM_MENU_SETTING_SETTING()
$GUI_SETTING_FORM=GUICreate("����",300,175)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("���ݿ�����", 5, 5, 290, 130)
GUICtrlCreateLabel("���ݿ��ַ��", 26, 30, 80, 17)
GUICtrlCreateLabel("���ݿ�汾��",26, 55, 80, 17)
GUICtrlCreateLabel("���ݿ��û���", 26, 80, 80, 17)
GUICtrlCreateLabel("���ݿ����룺", 26, 105, 80, 17)
$GUI_SETTING_FORM_SQLIPADDRESS = _GUICtrlIpAddress_Create($GUI_SETTING_FORM, 110, 25, 170, 21)
_GUICtrlIpAddress_Set($GUI_SETTING_FORM_SQLIPADDRESS,"0.0.0.0")
$GUI_SETTING_FORM_SQLVESION = GUICtrlCreateCombo("", 110, 50, 170, 25)
GUICtrlSetData(-1, "����2004SQL���ݿ�|����2008ϵ��SQL���ݿ�")
$GUI_SETTING_FORM_SQLUSERNAME = GUICtrlCreateInput("", 110, 75, 170, 21)
$GUI_SETTING_FORM_SQLPASSWORD = GUICtrlCreateInput("", 110, 100, 170, 21)
Local $GUI_SETTING_FORM_BUTTONOK = GUICtrlCreateButton("ȷ��", 130, 145, 75, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONOK,"GUI_SETTING_FORM_SAVESETTING")
Local $GUI_SETTING_FORM_BUTTONCANAL= GUICtrlCreateButton("ȡ��", 220, 145, 75, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONCANAL,"GUI_SETTING_FORM_CLOSE")
GUISetState(@SW_SHOW)
EndFunc
Func GUI_SETTING_FORM_CLOSE()
        GUIDelete($GUI_SETTING_FORM)
EndFunc
Func GUI_SETTING_FORM_SAVESETTING()
If  _GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)="" Or _GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)="0.0.0.0" or _
                                                                                GUICtrlRead($GUI_SETTING_FORM_SQLVESION)="" Or GUICtrlRead($GUI_SETTING_FORM_SQLUSERNAME)="" Or GUICtrlRead($GUI_SETTING_FORM_SQLPASSWORD)="" Then
        MsgBox(0+48+262144,"��ʾ","����д������������Ϣ")
Else
        If FileExists($SQLDATABASE_CONFIG) Then
                FileDelete($SQLDATABASE_CONFIG)
        EndIf
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLIPADDRESS",StringMid(StringToBinary(_GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLUSERNAME",StringMid(StringToBinary(GUICtrlRead($GUI_SETTING_FORM_SQLUSERNAME)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLPASSWORD",StringMid(StringToBinary(GUICtrlRead($GUI_SETTING_FORM_SQLPASSWORD)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLVESION",GUICtrlRead($GUI_SETTING_FORM_SQLVESION))
        If @error Then
                MsgBox(0+48+262144,"����","�����������")
                Exit
        Else
                Local $msgsetsave=MsgBox(1+64+262144,"�������","�����Ѿ����棬���Լ���֤���ݿ�������Ϣ����ȷ��"&@CRLF _
                                                                        &"���������������ݿ�����룬��ѯ�ʼ�����Ա����"&@CRLF _
                                                                        &"���İ����ĵ�Ѱ����ص����ݿ�Ĭ�����롣"&@CRLF&@CRLF _
                                                                        &"����������ȷ����������ȡ��"        )
                If $msgsetsave=1 Then
                        GUIDelete($GUI_SETTING_FORM)        
                EndIf
        EndIf
EndIf        
EndFunc
Func GUI_MAINFORM_MENU_SERVICE_GETWXINFO()
If Not FileExists($SQLDATABASE_CONFIG) Then
        MsgBox(0+16+262144,"����","û���ҵ����ݿ���������,��������")
Else
        Local $SQLVESION
        $SQLIPADDRESS=BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLIPADDRESS",""))
        $SQLUSERNAME =BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLUSERNAME",""))
        $SQLPASSWORD =BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLPASSWORD",""))
        $SQLVESION   =IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLVESION","")
        If $SQLIPADDRESS="" Or $SQLUSERNAME="" Or $SQLPASSWORD="" Or $SQLVESION="" Then
                MsgBox(0+16+262144,"����","���ݿ����Ӳ���������")
        Else
                If $SQLVESION="����2004SQL���ݿ�" Then
                        $SQLDATABASE_NAME="wx2004mem"
                Else
                        If $SQLVESION="����2008ϵ��SQL���ݿ�" Then
                                $SQLDATABASE_NAME="wx2008db"
                        EndIf
                endIf
        EndIf
EndIf        
EndFunc
Func GUI_MAINFORM_MENU_SERVICE_REFRESHLIST()
If Not FileExists($MDBDATABASE_PATH) Then
        MsgBox(0+16+262144,"����","û���ҵ�ʵ������")
Else
        _GUICtrlListView_DeleteAllItems($GUI_MAINFORM_LISTVIEW_USERS)
        Local $addfld
        Local $RS
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&$MDBDATABASE_PATH&";Jet Oledb:Database Password=''")
        $RS =ObjCreate("ADODB.Recordset")
        $RS.ActiveConnection = $addfld
        $RS.Open ("Select * From CardInFo") 
        while Not $RS.eof And Not $RS.bof
                if @error =1 Then ExitLoop
                        GUICtrlCreateListViewItem($RS.Fields(1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value,$GUI_MAINFORM_LISTVIEW_USERS)                
                $RS.movenext 
        WEnd
        $RS.close
        $addfld.Close
EndIf
EndFunc
Func DELETECARD()
Local $LISTALL=GUICtrlRead(GUICtrlRead($GUI_MAINFORM_LISTVIEW_USERS))
Local $LISTALL_ARRAY=StringSplit($LISTALL,"|")
Local $addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&$MDBDATABASE_PATH& ";Jet Oledb:Database Password=''")
$addfld.execute("DELETE FROM CardInFo WHERE sIDCard='"&$LISTALL_ARRAY[1]&"'")
$addfld.close 
GUI_MAINFORM_MENU_SERVICE_REFRESHLIST()
EndFunc
Func GUI_MAINFORM_MENU_SERVICE_LOGIN()
If $SQLIPADDRESS="" Or $SQLUSERNAME="" Or $SQLPASSWORD="" Or $SQLDATABASE_NAME="" Then
        MsgBox(0+16+262144,"����","���������շ�")
Else
        Local $cRemain=Int(InputBox("������","�ϻ����:","","",100,50,-1,-1))
        If Not @error Then
                Local $sGuid=CREATEGUID()
                Local $LISTALL=GUICtrlRead(GUICtrlRead($GUI_MAINFORM_LISTVIEW_USERS))
                Local $LISTALL_ARRAY=StringSplit($LISTALL,"|")
                Local $sCardID=$LISTALL_ARRAY[1]
                Local $sName=$LISTALL_ARRAY[2]
                Local $dtTime=@YEAR&"-"&@MON&"-"&@MDAY&" "&@HOUR&":"&@MIN&":"&@SEC
                Local $SQL_CONNECTION = ObjCreate("ADODB.Connection")
                $SQL_CONNECTION.Open("DRIVER={SQL Server};SERVER="&$SQLIPADDRESS&";UID="&$SQLUSERNAME&";PWD="&$SQLPASSWORD&';"')
                $SQL_CONNECTION.Execute("use "&$SQLDATABASE_NAME)
                $SQL_CONNECTION.Execute("insert into tTmpCard values ('sCardID','sIDCard','sMemo','cRemain','sType','iRest','sCardType','sName','dtTime','iState','wbbh','sPwd','dtUp','dtDown','sArea','isBJ','iRType','sGuid','sRNCard','iRNLen','sRNPwd','cAttRN','bDisAttFee','sShiftGuid','iCardInputType')")
                $SQL_CONNECTION.Execute("insert into tTmpCard values ('"&$sCardID&"','"&$sCardID&"','',"&$cRemain&",'�Ʒѿ�',0,'���֤','"&$sName&"','"&$dtTime&"',0,2,NULL,'0:00:00','0:00:00','',0,0,'"&$sGuid&"',NULL,0,NULL,0,0,'',0)") ;iState����Ϊ0��ʾδ�ϻ�
                $SQL_CONNECTION.close        
        EndIf
EndIf
EndFunc
Func CREATEGUID()
Const $ERROR_SUCCESS = 0
Const $RPC_S_OK = $ERROR_SUCCESS
Const $RPC_S_UUID_LOCAL_ONLY = 1824
Const $RPC_S_UUID_NO_ADDRESS = 1739
Local $_GUID = DllStructCreate("uint;ushort;ushort;ubyte[8]")
If @error Then Exit
Local $GUIDRETURN= DllCall("Rpcrt4.dll","ptr","UuidCreate","ptr",DllStructGetPtr($_GUID))
If Not @error Then
        If $GUIDRETURN[0] = $ERROR_SUCCESS Then
                Local $UUID = Hex(DllStructGetData($_GUID,1),8) & "-" & _ 
                Hex(DllStructGetData($_GUID,2),4) & "-" & _
                Hex(DllStructGetData($_GUID,3),4) & "-" & _
                Hex(DllStructGetData($_GUID,4,1),2) & Hex(DllStructGetData($_GUID,4,2),2) & "-"
                For $x =3 to 8
                        $UUID = $UUID & Hex(DllStructGetData($_GUID,4,$x),2)
                Next
        EndIf
        Return $UUID
EndIf
EndFunc