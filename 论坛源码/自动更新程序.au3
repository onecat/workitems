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

#include <GUIConstants.au3>
#include <Misc.au3>
Opt ("GUIOnEventMode", 1)
 
Dim $Title = "AutoUpdata"
Dim $FilePath_Server = "http://mail.126.com";;伺服器新檔案
Dim $FilePath_Local = "k:\run.exe" ;;需要更新程式的路徑
 
_Singleton ($Title);;僅允許程式單獨執行
 
_Check();;前置檢查作業
 
GUICreate ( $Title, 280, 80)
 
GUICtrlCreateLabel ("更新進度", 10, 20)
 
$Progres = GUICtrlCreateProgress ( 70, 15, 200, 20)
GUICtrlCreateButton ("開始更新", 70, 50, 60, 20)
        GUICtrlSetOnEvent ( -1, "_Start")
GUICtrlCreateButton ( "離開", 150, 50, 60, 20)
        GUICtrlSetOnEvent ( -1, "_Exit")
 
GUISetState ()
 
While True
        Sleep (50)
WEnd
 
Func _Exit()
        Exit
EndFunc
 
Func _Start()
        $TotalSize = InetGetSize ($FilePath_Server) ;; 取得總容量
        $hDownload = InetGet ($FilePath_Server, $FilePath_Local, 1, 1) ;;開始下載
 
        Do
                Sleep (50)
                $NowDownload = InetGetInfo($hDownload, 0)
 
                $per = Int ($NowDownload/$TotalSize*100) ;;計算百分比
                $res = Int (StringLeft ( $per, 3)) ;;百分值
                GUICtrlSetData ($progres , $res) ;;下載進度
 
                TrayTip ( "正在下載更新中", "已下載 " & ($NowDownload/1024)&" kB", 1) ;;監視已下載大小
 
        Until InetGetInfo ( $hDownload, 2)
 
        GuiCtrlSetData ( $progres , 0)
 
        If $TotalSize = FileGetSize ($FilePath_Local) Then
                MsgBox ( 0, "更新完成", "檔案大小：" &Int ($TotalSize/1024)&" kB"&@CRLF&"已下載大小：" & Int ($NowDownload/1024)&" kB")
                Run($FilePath_Local) ;;執行程序
                Exit
        Else
                MsgBox ( 16, "錯誤", "更新失敗。")
        EndIf
 
EndFunc
 
Func _Check()
        $Ping = Ping ( "8.8.8.8", 500) ;;;檢查網路是否通暢
 
        If $Ping Then
                TrayTip ( "自動更新程序", "正在檢查檔案...", 2)
        Else
                MsgBox ( 16, "警告", "網路連結失敗，請稍後再嘗試。")
                Exit
        EndIf
 
        $FileSize_Server = InetGetSize ($FilePath_Server);;取得伺服器新檔案的大小
        If @error Then
                MsgBox ( 36, "警告", "無法取得伺服器訊息，")
                Exit
        EndIf
 
        $FileSize_Local = FileGetSize ("run.exe");;取得本機檔案大小
        If @error Then
                If MsgBox ( 36, "警告", "無法取得檔案資訊，是否繼續下載。") = 7 Then Exit
        EndIf
 
        If $FileSize_Server = $FileSize_Local Then
            MsgBox( 0, "提示", "檔案檢查完成"&@CRLF&"目前已為最新版。")
            Exit
        EndIf
EndFunc