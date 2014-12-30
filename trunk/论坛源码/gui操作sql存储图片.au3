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
$mainGUI = GUICreate("保存图片",600,500)

$tianjia = GUICtrlCreateButton("添加图片", 5, 5)


$shangchuan = GUICtrlCreateButton("上传图片",70,5)




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
        MsgBox(64,"错误","已经存在")
   Return
EndIf
 
$RS.close


$sql = "insert into tupian (name,tupian) values ('" & $GetText1 & "',"& $fRead & ")"
$Conn.Execute($sql)
MsgBox(64,"ok","已经上传")
$Conn.Close 

EndFunc

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $tianjia
                        $var = FileOpenDialog("浏览照片", @DesktopCommonDir & "\", "图像文件 (*.jpg;*.bmp)", 1 + 4)
                        GUICtrlSetImage($Pic1, $var)
                        Case $shangchuan
                                xieru()

        EndSwitch

WEnd