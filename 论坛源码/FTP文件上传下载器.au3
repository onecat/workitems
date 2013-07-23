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
#Region 
#AutoIt3Wrapper_icon=d:\My Documents\icon\favicon.ico
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Res_Comment=要面包不要版权
#AutoIt3Wrapper_Res_Description=通过FTP上传下载文件
#AutoIt3Wrapper_Res_Fileversion=2.1.505
#AutoIt3Wrapper_Res_LegalCopyright=zeebit@hotmail.com Qme:1415020
#EndRegion
 
#cs 
----------------------------------------------------------------------------------------
在教学中，学生的作业需要保存
但保存在各自的计算机中不怎么安全，可能会被其他班的学生恶意修改甚至删除
        实现功能1：将文件拖动到本窗口的文本框中，点击上就传按钮可以上传
        实现功能2：将文件名写到文本框中，点击下载就可以将已经上传过的文件下载到桌面
2008-4-28
1、没有选择文件，就点击“上传”或“下载”，此时服务器仍会响应，所以加了个判断跳过
2、指定下载文件到桌面
3、加入“状态行”背景颜色
4、修改帮助信息
2008-5-5
判断配置文件是否存在

[serverinfo]
ip="127.0.0.1"----------------这个根据实际情况修改
name="ftp"
pass="ftp"
ctrlport="21"---------------这个暂时没用到
dataport="22"------------------这个暂时没用到
----------------------------------------------------------------------------------------
#CE
 
 
#NoTrayIcon
#include <GUIConstants.au3>
#include "ftp.au3"
#include <file.au3>
#include <ftpex.au3>
$z_ver = "V2.1.505"
$title = "FTP文件上传下载器 " & $z_ver
Global $ftpserverinfo = "ftp.ini"
If( Not FileExists($ftpserverinfo) ) Then
        MsgBox(48,"ERROR","配置文件 "&$ftpserverinfo&" 丢失！")
        Exit
EndIf
Dim $ftp_ip = IniRead($ftpserverinfo, "serverinfo", "ip", "")
Dim $ftp_name =  IniRead($ftpserverinfo, "serverinfo", "name", "")
Dim $ftp_pass = IniRead($ftpserverinfo, "serverinfo", "pass", "")
Dim $ftp_ctrlport = IniRead($ftpserverinfo, "serverinfo", "ctrlport", "")
Dim $ftp_dataport = IniRead($ftpserverinfo, "serverinfo", "dataport", "")
 
$gui_main = GUICreate($title, 320,130, @DesktopWidth/2-160, @DesktopHeight/2-45, -1, 0x00000018); WS_EX_ACCEPTFILES
;~ $Dummy1 = GUICtrlCreateDummy()
$Label_txt = GUICtrlCreateLabel("请将要上传的文件拖动到下面的文本框中", 11, 13, 220, 17)
$input_file = GUICtrlCreateInput ( "", 10,  35, 300, 20)
GUICtrlSetState(-1,$GUI_DROPACCEPTED)
GUICtrlCreateLabel("FTP服务器：" & $ftp_ip, 11, 78, 220, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateLabel("Powered by zeebit", 210, 116, 180, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$btn_upload = GUICtrlCreateButton ("上传", 160,  75, 49, 20)
$btn_download = GUICtrlCreateButton ("下载", 210,  75, 49, 20)
$btn_help = GUICtrlCreateButton ("帮助", 260,  75, 49, 20)
$Graphic1 = GUICtrlCreateGraphic(0, 98, 320, 18)
GUICtrlSetBkColor(-1, 0xD4D0C8)
$Label_stat = GUICtrlCreateLabel("欢迎使用 "&$title, 11, 101, 320, 14)
GUICtrlSetBkColor(-1, 0xD4D0C8)
GUISetState () 
 
$gui_help = GUICreate($title, 320,130, @DesktopWidth/2-160, @DesktopHeight/2-45, -1, 0x00000018); WS_EX_ACCEPTFILES
;~ $Icon = GUICtrlCreateIcon("d:\My Documents\icon\favicon.ico", 0, 288, 0, 32, 32, BitOR($SS_NOTIFY,$WS_GROUP))
;~ $Label_h0 = GUICtrlCreateLabel("注意：", 11, 13, 320, 17)
$Label_h1 = GUICtrlCreateLabel("1、正被打开着的文件，上传时可能会失败。", 12, 13, 270, 17)
$Label_h2 = GUICtrlCreateLabel("2、在文本框中输入完整准确的文件名，再点“下载”，可以从FTP服务器下载指定文件到桌面。", 12, 33, 300, 34)
$Label_h3 = GUICtrlCreateLabel("3、如果提示连接FTP服务器出错，请确定网络畅通且服务器运行正常。", 12, 66, 310, 27)
$btn_back = GUICtrlCreateButton ("返回", 250,  95, 60, 20)
GUICtrlCreateLabel("Powered by zeebit", 210, 116, 180, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_HIDE, $gui_help)
 
Local $nMsg
While 1
        $nMsg = GUIGetMsg()
        Select 
                Case $nMsg = $GUI_EVENT_CLOSE
                        Exit
                Case $nMsg =  $btn_help
                        GUISetState(@SW_HIDE, $gui_main)
                        GUISetState(@SW_SHOW, $gui_help)
					Case $nMsg =  $btn_back
                        GUISetState(@SW_HIDE, $gui_help)
                        GUISetState(@SW_SHOW, $gui_main)
                Case $nMsg =  $btn_download
                        $full_path = GUICtrlRead($input_file)
                        If($full_path=="") Then 
                                GUICtrlSetData($Label_stat,"请输入要下载的文件名！")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                                ContinueLoop
                        EndIf
                        GUICtrlSetState($btn_download, $GUI_DISABLE)
                        $array_filename = StringSplit($full_path,"\")
                        $file_name = $array_filename[$array_filename[0]] 
                        $error_i = 0
                        $dllhandle = DllOpen( 'wininet.dll' )
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllOpen wininet.dll Failed")
                                EndIf
                        $z_ftpOpen  = _FTPOpen('MyFTP_Control')
                                if @error then
                                        GUICtrlSetData($Label_stat,"打开FTP会话出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        $z_ftpConn  = _FTPConnect($z_ftpOpen, $ftp_ip, $ftp_name, $ftp_pass, $ftp_ctrlport)
                                if @error then
                                        GUICtrlSetData($Label_stat,"连接FTP服务器出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
;~                                      ContinueLoop 
                                EndIf 
                        If($error_i==0) Then
                                $z_ftpPut   = _FtpGetFile($z_ftpConn, '/'&$file_name, @DesktopDir & '\' & $file_name,1,0)
                                if @error then
                                        GUICtrlSetData($Label_stat,"从FTP服务器下载文件时出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
                                EndIf 
                        EndIf
                        $z_ftpColse = _FTPClose($z_ftpOpen)
                                if @error then
                                        GUICtrlSetData($Label_stat,"结束FTP会话出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        DllClose($dllhandle)
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllClose wininet.dll Failed")
                                EndIf
                        GUICtrlSetData($input_file,"")
                        If($error_i ==0) then 
                                GUICtrlSetData($Label_stat,"“"&$file_name&"”成功下载到桌面！")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                        EndIf
                        $error_i = 0
                        GUICtrlSetState($btn_download, $GUI_ENABLE)
                Case $nMsg =  $btn_upload
                        $full_path = GUICtrlRead($input_file)
                        If($full_path=="") Then 
                                GUICtrlSetData($Label_stat,"请选择要上传的文件！")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                                ContinueLoop
                        EndIf
                        GUICtrlSetState($btn_upload, $GUI_DISABLE)
                        $array_filename = StringSplit($full_path,"\")
                        $file_name = $array_filename[$array_filename[0]] 
                        $error_i = 0
                        $dllhandle = DllOpen( 'wininet.dll' )
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllOpen wininet.dll Failed")
                                EndIf
                        $z_ftpOpen  = _FTPOpen('MyFTP_Control')
                                if @error then
                                        GUICtrlSetData($Label_stat,"打开FTP会话出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        $z_ftpConn  = _FTPConnect($z_ftpOpen, $ftp_ip, $ftp_name, $ftp_pass, $ftp_ctrlport)
                                if @error then
                                        GUICtrlSetData($Label_stat,"连接FTP服务器出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
;~                                      ContinueLoop 
                                EndIf 
                        If($error_i==0) Then
                                $z_ftpPut   = _FtpPutFile($z_ftpConn, $full_path, '/'&$file_name)
                                if @error then
                                        GUICtrlSetData($Label_stat,"上传文件到FTP服务器时出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                        $error_i = $error_i+1
                                EndIf 
                        EndIf
                        $z_ftpColse = _FTPClose($z_ftpOpen)
                                if @error then
                                        GUICtrlSetData($Label_stat,"结束FTP会话出错！")
                                        GUICtrlSetBkColor(-1, 0xD4D0C8)
                                EndIf 
                        DllClose($dllhandle)
                                if @error then
                                        GUICtrlSetData($Label_stat,"DllClose wininet.dll Failed")
                                EndIf
                        GUICtrlSetData($input_file,"")
                        If($error_i ==0) then 
                                GUICtrlSetData($Label_stat,"“"&$file_name&"”上传成功！")
                                GUICtrlSetBkColor(-1, 0xD4D0C8)
                        EndIf
                        $error_i = 0
                        GUICtrlSetState($btn_upload, $GUI_ENABLE)
        EndSelect
WEnd
