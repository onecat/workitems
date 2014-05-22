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

#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=14065.ico
#AutoIt3Wrapper_outfile=WxTmpCard.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Description=万象上机辅助
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Copyright AmibeCode.com
#AutoIt3Wrapper_Res_Field=公司名称|AmibeCode.com
#AutoIt3Wrapper_Res_Field=产品版本|2.0.0.0
#AutoIt3Wrapper_Res_Field=前台版本|1.5.0.0
#AutoIt3Wrapper_Res_Field=传输版本|1.0.0.0
#AutoIt3Wrapper_Res_Field=产品名称|万象上机辅助
#AutoIt3Wrapper_Res_Field=内部名称|WxTmpCard
#AutoIt3Wrapper_Res_Field=版权声明|Amibe All Rights Reserved
#AutoIt3Wrapper_Res_Field=免责声明|只做技术研究，不得触犯相关法律。
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ;**** 参数创建于 ACNWrapper_GUI ***
#include <Array.au3>
#include <Constants.au3>
#include <GUIListView.au3>
#include <GuiIPAddress.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ProgressConstants.au3>
Opt('MustDeclareVars',1)  ;强制声明变量
Opt("GUICloseOnESC",0)    ;==>关闭ESC退出
Opt("GUIOnEventMode",1)   ;==>开启事件驱动模式
Opt("TrayAutoPause",0)    ;当单击托盘图标时不暂停 
Opt("TrayMenuMode",1+2)   ;去除状态栏图标点击状态。
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
If WinGetHandle("万象上机辅助  PowerBy Amibe") Then
        MsgBox(0,"","程序已经运行，"&@CRLF&"请勿重复执行！")
        Exit
EndIf
Global $GUI_MAINFORM_FORM=GUICreate("万象上机辅助  PowerBy Amibe",350,400,-1,-1)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
Global $GUI_MAINFORM_LISTVIEW_USERS=GUICtrlCreateListView("",5,5,340,370)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "身份证号码", 150)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "姓名", 80)
_GUICtrlListView_AddColumn($GUI_MAINFORM_LISTVIEW_USERS, "密码", 80)
Global $GUI_CONTEXTMENU=GUICtrlCreateContextMenu($GUI_MAINFORM_LISTVIEW_USERS)
Global $GUI_CONTEXTMENU_LOGIN=GUICtrlCreateMenuItem("登记上机",$GUI_CONTEXTMENU)
GUICtrlSetOnEvent($GUI_CONTEXTMENU_LOGIN,"GUI_MAINFORM_MENU_SERVICE_LOGIN")
Global $GUI_CONTEXTMENU_ADDED=GUICtrlCreateMenuItem("添加信息",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_ADDED,"GUI_MAINFORM_MENU_SETTING_SCANID_INPUT")
Global $GUI_CONTEXTMENU_DELED=GUICtrlCreateMenuItem("删除记录",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_DELED,"DELETECARD")
Global $GUI_CONTEXTMENU_REFRE=GUICtrlCreateMenuItem("刷新列表",$GUI_CONTEXTMENU) 
GUICtrlSetOnEvent($GUI_CONTEXTMENU_REFRE,"GUI_MAINFORM_MENU_SERVICE_REFRESHLIST")
Global $GUI_MAINFORM_MENU_SETTING=GUICtrlCreateMenu("设置(&C)")
Global $GUI_MAINFORM_MENU_SETTING_SETTING=GUICtrlCreateMenuItem("系统设置",$GUI_MAINFORM_MENU_SETTING)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SETTING_SETTING,"GUI_MAINFORM_MENU_SETTING_SETTING")
Global $GUI_MAINFORM_MENU_SETTING_INPUTID=GUICtrlCreateMenuItem("录入信息",$GUI_MAINFORM_MENU_SETTING)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SETTING_INPUTID,"GUI_MAINFORM_MENU_SETTING_SCANID_INPUT")
Global $GUI_MAINFORM_MENU_SERVICE=GUICtrlCreateMenu("连接(&S)")
Global $GUI_MAINFORM_MENU_SERVICE_CONNETMDB=GUICtrlCreateMenuItem("连接卡库",$GUI_MAINFORM_MENU_SERVICE)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SERVICE_CONNETMDB,"GUI_MAINFORM_MENU_SERVICE_REFRESHLIST")
Global $GUI_MAINFORM_MENU_SERVICE_CONNETWX=GUICtrlCreateMenuItem("连接收费",$GUI_MAINFORM_MENU_SERVICE)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_SERVICE_CONNETWX,"GUI_MAINFORM_MENU_SERVICE_GETWXINFO")
Global $GUI_MAINFORM_MENU_HELP = GUICtrlCreateMenu("帮助(&H)")
Global $GUI_MAINFORM_MENU_HELP_HELP = GUICtrlCreateMenuItem("使用说明",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_HELP,"GUI_MAINFORM_MENU_HELP_HELP")
Global $GUI_MAINFORM_MENU_HELP_BUY = GUICtrlCreateMenuItem("购买使用",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_BUY,"GUI_MAINFORM_MENU_HELP_BUY")
Global $GUI_MAINFORM_MENU_HELP_ABOUT = GUICtrlCreateMenuItem("关于软件",$GUI_MAINFORM_MENU_HELP)
GUICtrlSetOnEvent($GUI_MAINFORM_MENU_HELP_ABOUT,"GUI_MAINFORM_MENU_HELP_ABOUT") 
GUISetState(@SW_SHOW)
While 1
  Sleep(1000)
WEnd
Func GUI_MAINFORM_MENU_SETTING_SCANID_INPUT()
$GUI_INPUTID_FORM=GUICreate("录入身份证信息",270,170)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("身份证信息：",5, 5, 260, 125)
GUICtrlCreateLabel("身份证姓名：",26, 35, 80, 17)
GUICtrlCreateLabel("身份证号码：",26, 65, 80, 17)
GUICtrlCreateLabel("身份证密码：",26, 95, 80, 17)
$GUI_INPUTID_USERNAME=GUICtrlCreateInput("",100,30,150,21)
$GUI_INPUTID_IDNUMBER=GUICtrlCreateInput("",100,60,150,21)
$GUI_INPUTID_PASSWORD=GUICtrlCreateInput("",100,90,150,21)
Local $GUI_SETTING_FORM_BUTTONRESET = GUICtrlCreateButton("重置", 155, 140, 50, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONRESET,"GUI_INPUTID_FORM_RESET")
Local $GUI_SETTING_FORM_BUTTONOK = GUICtrlCreateButton("确认", 215, 140, 50, 25)
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
        MsgBox(0+16+262144,"错误","没有找到实名卡库,请联系客服索取")
Else
        If GUICtrlRead($GUI_INPUTID_IDNUMBER)="" Or GUICtrlRead($GUI_INPUTID_USERNAME)="" Or GUICtrlRead($GUI_INPUTID_PASSWORD)="" then
                MsgBox(0+48+262144,"提示","所有选项都不能为空")
        Else
                Local        $INSETCARDINFO
                $INSETCARDINFO=ObjCreate("ADODB.Connection")
                $INSETCARDINFO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&$MDBDATABASE_PATH&";Jet Oledb:Database Password=''")
                $INSETCARDINFO.Execute("insert into CardInFo(sIDCard,sName,sPassWord) values ('"&GUICtrlRead($GUI_INPUTID_IDNUMBER)&"','"&GUICtrlRead($GUI_INPUTID_USERNAME)&"','"&GUICtrlRead($GUI_INPUTID_PASSWORD)&"')")
                $INSETCARDINFO.Close
                GUI_INPUTID_FORM_RESET()
                ControlFocus("录入身份证信息","",$GUI_INPUTID_USERNAME)
        EndIf
EndIf
EndFunc
Func GUI_MAINFORM_MENU_HELP_ABOUT()
Local $GUI_ABOUTBOX_SRVSOFT_VESION="2.0.0.0"
Local $GUI_ABOUTBOX_CONSOLE_VESION="1.5.0.0"
Local $GUI_ABOUTBOX_TRANFER_VESION="1.0.0.0"
$GUI_ABOUTBOX=GUICreate("关于",300,250,-1,-1,BitOR($WS_SYSMENU,$WS_CAPTION,$WS_POPUP, _
                                                                                                                                                                        $WS_POPUPWINDOW,$WS_BORDER,$WS_CLIPSIBLINGS))
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("产品信息", 5, 5, 290, 110)
GUICtrlCreateLabel("万象计费系统上机辅助", 15, 24, 184, 17)
GUICtrlCreateLabel("广西 AmibeCode 技术团队", 15, 45, 223, 17)
GUICtrlCreateLabel("Copyright@2011 Amibe Inc. All Rights Reserved", 15, 66, 270, 17)
GUICtrlCreateLabel("付费用户提供技术支持：QQ 455196881", 15, 88, 250, 17)
GUICtrlCreateGroup("服务端版本", 5, 120, 140, 92)
GUICtrlCreateLabel("主程序版本：", 16, 144, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_SRVSOFT_VESION, 96, 144, 45, 17)
GUICtrlCreateLabel("服务器传输：", 16, 176, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_TRANFER_VESION, 96, 176, 45, 17)
GUICtrlCreateGroup("控制台版本", 156, 120, 140, 92)
GUICtrlCreateGroup("控制台版本", 312, 240, 140, 92)
GUICtrlCreateLabel("主程序版本：", 167, 144, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_CONSOLE_VESION, 247, 144, 45, 17)
GUICtrlCreateLabel("控制台传输：", 167, 176, 76, 17)
GUICtrlCreateLabel($GUI_ABOUTBOX_TRANFER_VESION, 247, 176, 45, 17)
Local $GUI_ABOUTBOX_BUTTON_OK = GUICtrlCreateButton("确定", 220, 220, 75, 25)
GUICtrlSetOnEvent($GUI_ABOUTBOX_BUTTON_OK,"GUI_ABOUTBOX_CLOSE") 
GUISetState(@SW_SHOW)        
EndFunc
Func GUI_ABOUTBOX_CLOSE()
        GUIDelete($GUI_ABOUTBOX)
EndFunc
Func GUI_MAINFORM_MENU_HELP_BUY()
$GUI_BUY_FORM = GUICreate("购买使用",300, 200, -1, -1,BitOR($WS_SYSMENU,$WS_CAPTION,$WS_POPUP,$WS_POPUPWINDOW,$WS_BORDER,$WS_CLIPSIBLINGS))
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("购买须知", 5, 5, 290, 100)
GUICtrlCreateLabel("软件支持以下收费环境:", 21, 29, 200, 17)
GUICtrlCreateLabel("万象2004-2008 所有使用SQLSERVER数据库的版本", 20, 53, 260, 17)
GUICtrlCreateLabel("其他收费系统及其他数据库版本请联系作者定制.", 20, 80, 260, 17)
GUICtrlCreateGroup("收费价格", 5, 116, 290, 50)
GUICtrlCreateLabel("软件定价为800元", 90, 140, 150, 17)
GUICtrlCreateLabel("购买请联系QQ:455196881", 90, 178, 150, 17)
Local $GUI_BUY_FORM_BUTTON=GUICtrlCreateButton("确定",245,170,50,25)
GUICtrlSetOnEvent($GUI_BUY_FORM_BUTTON,"HELP_BUY_FORM_CLOSE") 
GUISetState(@SW_SHOW)
EndFunc
Func HELP_BUY_FORM_CLOSE()
        GUIDelete($GUI_BUY_FORM)
EndFunc
Func GUI_MAINFORM_MENU_HELP_HELP()
        MsgBox(0+64,"提示","付费用户提供技术支持"&@CRLF&"咨询请提供您的购买ID"&@CRLF&"请联系QQ 455196881")
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
$GUI_SETTING_FORM=GUICreate("设置",300,175)
GUISetOnEvent($GUI_EVENT_CLOSE, "GUI_FORM_CLOSE")
GUICtrlCreateGroup("数据库设置", 5, 5, 290, 130)
GUICtrlCreateLabel("数据库地址：", 26, 30, 80, 17)
GUICtrlCreateLabel("数据库版本：",26, 55, 80, 17)
GUICtrlCreateLabel("数据库用户：", 26, 80, 80, 17)
GUICtrlCreateLabel("数据库密码：", 26, 105, 80, 17)
$GUI_SETTING_FORM_SQLIPADDRESS = _GUICtrlIpAddress_Create($GUI_SETTING_FORM, 110, 25, 170, 21)
_GUICtrlIpAddress_Set($GUI_SETTING_FORM_SQLIPADDRESS,"0.0.0.0")
$GUI_SETTING_FORM_SQLVESION = GUICtrlCreateCombo("", 110, 50, 170, 25)
GUICtrlSetData(-1, "万象2004SQL数据库|万象2008系列SQL数据库")
$GUI_SETTING_FORM_SQLUSERNAME = GUICtrlCreateInput("", 110, 75, 170, 21)
$GUI_SETTING_FORM_SQLPASSWORD = GUICtrlCreateInput("", 110, 100, 170, 21)
Local $GUI_SETTING_FORM_BUTTONOK = GUICtrlCreateButton("确认", 130, 145, 75, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONOK,"GUI_SETTING_FORM_SAVESETTING")
Local $GUI_SETTING_FORM_BUTTONCANAL= GUICtrlCreateButton("取消", 220, 145, 75, 25)
GUICtrlSetOnEvent($GUI_SETTING_FORM_BUTTONCANAL,"GUI_SETTING_FORM_CLOSE")
GUISetState(@SW_SHOW)
EndFunc
Func GUI_SETTING_FORM_CLOSE()
        GUIDelete($GUI_SETTING_FORM)
EndFunc
Func GUI_SETTING_FORM_SAVESETTING()
If  _GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)="" Or _GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)="0.0.0.0" or _
                                                                                GUICtrlRead($GUI_SETTING_FORM_SQLVESION)="" Or GUICtrlRead($GUI_SETTING_FORM_SQLUSERNAME)="" Or GUICtrlRead($GUI_SETTING_FORM_SQLPASSWORD)="" Then
        MsgBox(0+48+262144,"提示","请填写完整的配置信息")
Else
        If FileExists($SQLDATABASE_CONFIG) Then
                FileDelete($SQLDATABASE_CONFIG)
        EndIf
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLIPADDRESS",StringMid(StringToBinary(_GUICtrlIpAddress_Get($GUI_SETTING_FORM_SQLIPADDRESS)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLUSERNAME",StringMid(StringToBinary(GUICtrlRead($GUI_SETTING_FORM_SQLUSERNAME)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLPASSWORD",StringMid(StringToBinary(GUICtrlRead($GUI_SETTING_FORM_SQLPASSWORD)),3))
        IniWrite($SQLDATABASE_CONFIG,"SQLCONFIG","SQLVESION",GUICtrlRead($GUI_SETTING_FORM_SQLVESION))
        If @error Then
                MsgBox(0+48+262144,"错误","保存出错啦！")
                Exit
        Else
                Local $msgsetsave=MsgBox(1+64+262144,"设置完成","设置已经保存，请自己保证数据库连接信息的正确性"&@CRLF _
                                                                        &"如果您不清楚您数据库的密码，请询问技术人员，或"&@CRLF _
                                                                        &"查阅帮助文档寻找相关的数据库默认密码。"&@CRLF&@CRLF _
                                                                        &"完成设置请点确定，重设请取消"        )
                If $msgsetsave=1 Then
                        GUIDelete($GUI_SETTING_FORM)        
                EndIf
        EndIf
EndIf        
EndFunc
Func GUI_MAINFORM_MENU_SERVICE_GETWXINFO()
If Not FileExists($SQLDATABASE_CONFIG) Then
        MsgBox(0+16+262144,"错误","没有找到数据库连接配置,请检查设置")
Else
        Local $SQLVESION
        $SQLIPADDRESS=BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLIPADDRESS",""))
        $SQLUSERNAME =BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLUSERNAME",""))
        $SQLPASSWORD =BinaryToString("0x"&IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLPASSWORD",""))
        $SQLVESION   =IniRead($SQLDATABASE_CONFIG,"SQLCONFIG","SQLVESION","")
        If $SQLIPADDRESS="" Or $SQLUSERNAME="" Or $SQLPASSWORD="" Or $SQLVESION="" Then
                MsgBox(0+16+262144,"错误","数据库连接参数不完整")
        Else
                If $SQLVESION="万象2004SQL数据库" Then
                        $SQLDATABASE_NAME="wx2004mem"
                Else
                        If $SQLVESION="万象2008系列SQL数据库" Then
                                $SQLDATABASE_NAME="wx2008db"
                        EndIf
                endIf
        EndIf
EndIf        
EndFunc
Func GUI_MAINFORM_MENU_SERVICE_REFRESHLIST()
If Not FileExists($MDBDATABASE_PATH) Then
        MsgBox(0+16+262144,"错误","没有找到实名卡库")
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
        MsgBox(0+16+262144,"错误","请先连接收费")
Else
        Local $cRemain=Int(InputBox("输入金额","上机金额:","","",100,50,-1,-1))
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
                $SQL_CONNECTION.Execute("insert into tTmpCard values ('"&$sCardID&"','"&$sCardID&"','',"&$cRemain&",'计费卡',0,'身份证','"&$sName&"','"&$dtTime&"',0,2,NULL,'0:00:00','0:00:00','',0,0,'"&$sGuid&"',NULL,0,NULL,0,0,'',0)") ;iState设置为0表示未上机
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