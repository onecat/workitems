
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=images\update.ico
#AutoIt3Wrapper_Res_Comment=补丁更新程序
#AutoIt3Wrapper_Res_Description=补丁更新程序
#AutoIt3Wrapper_Res_Fileversion=1.0.0.111
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=TSG-OA服务课
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
;代码前面有两个;;为注解掉的不生效代码，只有一个;的为注解
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include<file.au3>
#include <array.au3>
;Opt("OnExitFunc","Quit")
Opt("TrayMenuMode", 1)
HotKeySet("#c", "Quit")
Dim $displayitem = TrayCreateItem("显示")
Dim $exititem = TrayCreateItem("退出")
$ftpname = IniRead(@ScriptDir&"\config\ftp.ini",1,"ftp","")
TraySetState()
TraySetClick(16)
FileInstall("images\logo2.jpg",@TempDir &"\logo2.jpg")
FileInstall("images\update.ico",@TempDir &"\update.ico")
#Region ### START Koda GUI section ### Form=c:\documents and settings\taotao_zhang\desktop\update.kxf
$Form1 = GUICreate("局域网补丁更新工具", 401, 301, 373, 184)
GuiSetIcon(@TempDir &"\update.ico", 0)
;;Dim $bf = "skin\WinterBlues.skf",$dll
;;_SkinGUI("SkinCrafterDll.dll", $bf, $Form1)
$Group1 = GUICtrlCreateGroup("", 8, 64, 289, 217)
$Label1 = GUICtrlCreateLabel("安装进度：", 16, 251, 64, 20)
$Pic1 = GUICtrlCreatePic(@TempDir &"\logo2.jpg", 0, 0, 400, 60, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Progress1 = GUICtrlCreateProgress(80, 241, 209, 20)
Dim $jishu = 0 ,$i,$j,$n 
$view = "已完成: "&$jishu&" ％"
$Label3 = GUICtrlCreateLabel($view, 80, 263, 209, 15)
$ListView1 = GUICtrlCreateListView("计数|安全标示名|安装状态", 16, 80, 273, 155)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("", 304, 64, 89, 217)
$Button1 = GUICtrlCreateButton("扫描漏洞", 312, 96, 73, 33, 0)
;;$Button2 = GUICtrlCreateButton("退出", 312, 224, 73, 33, 0)
GUICtrlCreateLabel("按Win+C键强制退出安装！",314, 224, 73, 33)
GUICtrlSetColor(-1, 0x008000)
GUICtrlSetFont(-1, 8.5, 400, 0, "Arial")
$Button3 = GUICtrlCreateButton("更新补丁", 312, 160, 73, 33, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetState(-1, $GUI_DISABLE) 
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;主程序区
While 1
        $nMsg = GUIGetMsg()
    $Msg  = TrayGetMsg()
        Select
                Case $Msg = $displayitem
                        GUISetState(@SW_RESTORE, $Form1)
        Case $Msg = $exititem
                        Exit
                Case $nMsg = $GUI_EVENT_CLOSE
                        Exit
                Case $nMsg = $Button1
            MsgBox(0,"提示","漏洞扫描功能尚未完成，若为简体或英文系统,"& @CRLF &"您可以在主程序附加功能区选择用安全卫士扫描")
                ;;Case $nMsg = $Button2
            ;;Send("#c")
                Case $nMsg = $Button3
                        Update()
        EndSelect
WEnd
Func Quit()
        FileDelete(@TempDir &"\logo2.jpg")
        FileDelete(@TempDir &"\update.ico")
        FileDelete(@TempDir &"\file3.txt")
        Exit
EndFunc
;update函数区
Func update()
        Dim $szDrive, $szDir, $szFName, $szExt
        Dim $sys = @OSVersion ,$syslg = @OSLang ,$state,$osedition,$patchadress
        $TestPath = _PathSplit(@ScriptFullPath, $szDrive, $szDir, $szFName, $szExt)
        If  $szDrive&$szDir =$ftpname&"\Patch\Auto-Update\"   Then
                $path1 = $ftpname&"\Patch\Auto-Update\ALLpatch"
        ElseIf  $szDrive&$szDir =$ftpname&"\Patch\OARPT\new_tools\" Then
                $path1 = $ftpname&"\Patch\Auto-Update\ALLpatch"
        ElseIf FileExists(@ScriptDir&"\ALLpatch") Then                              
                $path1 = @ScriptDir&"\ALLpatch"
        Else 
                traytip("提示","请先至"&$ftpname&"\Patch\Auto-Update将ALLpatch文件夹(包含相应的子文件夹)拷贝至与update.exe同一目录下",7,1)
                MsgBox(64,"抱歉！","程序所在路径不是预设的FTP路径或当前路径不存在ALLpatch补丁文件")
                Exit
        EndIf
        If $sys = "WIN_2000" And $syslg = 0404   Then
                $osedition = "繁体2K系统"
                $patchadress = $path1&"\win2kTW"
        ElseIf $sys = "WIN_2000" And  $syslg = 0804   Then
                $osedition = "简体2K系统"
                $patchadress = $path1&"\win2kcn"
        ElseIf $sys = "WIN_2000" And $syslg = 0409   Then
                $osedition = "英文2K系统"
                $patchadress = $path1&"\win2ken"
        ElseIf  $sys =        "WIN_XP" And $syslg = 0404 Then
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "繁体XP SP2系统"
                        $patchadress = $path1&"\winxpTW"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "繁体XP SP3系统"
                        $patchadress = $path1&"\winxptw-sp3"
                        ;MsgBox(64,"提示","XP SP3目录下未发现有补丁更新")
                EndIf
        ElseIf         $sys =        "WIN_XP" And $syslg = 0804 Then 
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "简体XP SP2系统"
                        $patchadress = $path1&"\winxpcn"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "简体XP SP3系统"
                        $patchadress = $path1&"\winxpcn-sp3"
                        ;MsgBox(64,"提示","XP SP3目录下未发现有补丁更新")
                EndIf
        ElseIf         $sys =        "WIN_XP" And $syslg = 0409 Then
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "英文XP SP2系统"
                        $patchadress = $path1&"\winxpen"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "英文XP SP3系统"
                        $patchadress = $path1&"\winxpen-sp3"
                        ;MsgBox(64,"提示","XP SP3目录下未发现有补丁更新")
                EndIf
        ElseIf         $sys = "WIN_2003" And $syslg = 0409 Then
                $osedition = "英文2003系统"
                $patchadress = ""
                MsgBox(64,"提示","win2003目录下未发现有补丁文件")
        ElseIf         $sys = "WIN_2003" And $syslg = 0804 Then
                $osedition = "简体2003系统"
                $patchadress = ""
                MsgBox(64,"提示","win2003目录下未发现有补丁文件")
        ElseIf         $sys = "WIN_2003" And $syslg = 0404 Then
                $osedition = "繁体2003系统"
                $patchadress = $path1&"\win2003tw"
                ;;MsgBox(64,"提示","win2003目录下未发现有补丁文件")
        ElseIf $sys ="WIN_VISTA" Then
                $osedition ="VISTA系统"
                $patchadress = ""
                MsgBox(64,"提示","VISTA补丁目录下未发现有补丁文件")
        EndIf
        If $patchadress = "" Then
                GUICtrlCreateListViewItem("|当前系统版本为:|"&$osedition,$ListView1)
                GUICtrlCreateListViewItem("|尚未提供此版本系统的安装，请关闭程序|",$ListView1)
        Else
                ;;ProgressOn("安装进度","")
                GUICtrlCreateListViewItem("|当前系统版本为:|"&$osedition,$ListView1)
                If $sys ="WIN_XP" And  @OSServicePack = "Service Pack 2" Then
                        MsgBox(64,"提醒","您完全可以直接将SP2升级为SP3或使用XP SP3安装盘安装，不需要安装这么多补丁哦！",8)
                EndIf
                GUICtrlCreateListViewItem("|安装程序正在准备|",$ListView1)
                $i = 0
                $view = "正在搜素已安装的安全更新..."
                GUICtrlSetData($Label3,$view)
                ;搜索本机已安装补丁
                While 1
                        $i+=1
                        $var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\windows nt\Currentversion\Hotfix",$i)
                        If @error <> 0 then ExitLoop
                        FileWriteLine(@TempDir &"\file3.txt",  $var& @CRLF)        
                WEnd
                sleep(2000)
                $view = "本机已存在的安全更新个数:"&$i
                GUICtrlSetData($Label3,$view)
                sleep(3000)
                FileOpen(@TempDir &"\file3.txt",0)
                $file = FileRead(@TempDir &"\file3.txt")
                FileClose(@TempDir &"\file3.txt")
                $view = "正在搜索补丁更新文件..."
                GUICtrlSetData($Label3,$view)
                sleep(2000)
                $filelist=_FileListToArray($patchadress,"*.exe",1)
                $n = 0
                For $j =1 to $filelist[0]
                        $array = StringSplit($filelist[$j],"-")
                        If StringInStr ($file,$array[2]) = 0 then
                                $n+=1
                        EndIf
                Next
                $view = "需要安装的补丁数："&$n
                GUICtrlSetData($Label3,$view)
                sleep(2000)
                $view = "现在开始安装"
                GUICtrlSetData($Label3,$view)
                sleep(2000)
                $wait = 0
                Dim $m = 0 
                $start6 = GUICtrlSetData($Progress1, $wait)
                For $j =1 to $filelist[0]
                        $array = StringSplit($filelist[$j],"-")
                        If StringInStr($file,$array[2]) = 0 then
                                $result = RunWait($patchadress&"\"&$filelist[$j]&"  /u /z /n /o /q")
                                $m+=1
                                ;;ProgressSet(100/$filelist[0]*$i, "已完成"&100/$filelist[0] *$i& " ％ ")
                                $wait = 100/$n*$m
                                GUICtrlSetData($Progress1, $wait)
                                $jishu = "已完成: "&Round($wait,0)&" ％"
                                GUICtrlSetData($Label3,$jishu)
                                If $result = 1603 then  
                                        $state = "安装失败"
                                Else
                                        $state = "安装成功"
                                EndIf
                                GUICtrlCreateListViewItem($m&"|"&$array[2]&"|"&$state,$ListView1)        
                        EndIf
                Next
                $jishu = "已完成: 100"&" ％"
                GUICtrlSetData($Label3,$jishu)
                TrayTip("提示","补丁更新已完成，请重启电脑",6,1)
                ;;ProgressSet(100 , "完成", "完成")
                ;;ProgressOff()
        EndIf
EndFunc