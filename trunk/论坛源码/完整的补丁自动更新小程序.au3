
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=images\update.ico
#AutoIt3Wrapper_Res_Comment=�������³���
#AutoIt3Wrapper_Res_Description=�������³���
#AutoIt3Wrapper_Res_Fileversion=1.0.0.111
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=TSG-OA�����
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;����ǰ��������;;Ϊע����Ĳ���Ч���룬ֻ��һ��;��Ϊע��
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
Dim $displayitem = TrayCreateItem("��ʾ")
Dim $exititem = TrayCreateItem("�˳�")
$ftpname = IniRead(@ScriptDir&"\config\ftp.ini",1,"ftp","")
TraySetState()
TraySetClick(16)
FileInstall("images\logo2.jpg",@TempDir &"\logo2.jpg")
FileInstall("images\update.ico",@TempDir &"\update.ico")
#Region ### START Koda GUI section ### Form=c:\documents and settings\taotao_zhang\desktop\update.kxf
$Form1 = GUICreate("�������������¹���", 401, 301, 373, 184)
GuiSetIcon(@TempDir &"\update.ico", 0)
;;Dim $bf = "skin\WinterBlues.skf",$dll
;;_SkinGUI("SkinCrafterDll.dll", $bf, $Form1)
$Group1 = GUICtrlCreateGroup("", 8, 64, 289, 217)
$Label1 = GUICtrlCreateLabel("��װ���ȣ�", 16, 251, 64, 20)
$Pic1 = GUICtrlCreatePic(@TempDir &"\logo2.jpg", 0, 0, 400, 60, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Progress1 = GUICtrlCreateProgress(80, 241, 209, 20)
Dim $jishu = 0 ,$i,$j,$n 
$view = "�����: "&$jishu&" ��"
$Label3 = GUICtrlCreateLabel($view, 80, 263, 209, 15)
$ListView1 = GUICtrlCreateListView("����|��ȫ��ʾ��|��װ״̬", 16, 80, 273, 155)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("", 304, 64, 89, 217)
$Button1 = GUICtrlCreateButton("ɨ��©��", 312, 96, 73, 33, 0)
;;$Button2 = GUICtrlCreateButton("�˳�", 312, 224, 73, 33, 0)
GUICtrlCreateLabel("��Win+C��ǿ���˳���װ��",314, 224, 73, 33)
GUICtrlSetColor(-1, 0x008000)
GUICtrlSetFont(-1, 8.5, 400, 0, "Arial")
$Button3 = GUICtrlCreateButton("���²���", 312, 160, 73, 33, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetState(-1, $GUI_DISABLE) 
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;��������
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
            MsgBox(0,"��ʾ","©��ɨ�蹦����δ��ɣ���Ϊ�����Ӣ��ϵͳ,"& @CRLF &"�������������򸽼ӹ�����ѡ���ð�ȫ��ʿɨ��")
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
;update������
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
                traytip("��ʾ","������"&$ftpname&"\Patch\Auto-Update��ALLpatch�ļ���(������Ӧ�����ļ���)��������update.exeͬһĿ¼��",7,1)
                MsgBox(64,"��Ǹ��","��������·������Ԥ���FTP·����ǰ·��������ALLpatch�����ļ�")
                Exit
        EndIf
        If $sys = "WIN_2000" And $syslg = 0404   Then
                $osedition = "����2Kϵͳ"
                $patchadress = $path1&"\win2kTW"
        ElseIf $sys = "WIN_2000" And  $syslg = 0804   Then
                $osedition = "����2Kϵͳ"
                $patchadress = $path1&"\win2kcn"
        ElseIf $sys = "WIN_2000" And $syslg = 0409   Then
                $osedition = "Ӣ��2Kϵͳ"
                $patchadress = $path1&"\win2ken"
        ElseIf  $sys =        "WIN_XP" And $syslg = 0404 Then
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "����XP SP2ϵͳ"
                        $patchadress = $path1&"\winxpTW"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "����XP SP3ϵͳ"
                        $patchadress = $path1&"\winxptw-sp3"
                        ;MsgBox(64,"��ʾ","XP SP3Ŀ¼��δ�����в�������")
                EndIf
        ElseIf         $sys =        "WIN_XP" And $syslg = 0804 Then 
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "����XP SP2ϵͳ"
                        $patchadress = $path1&"\winxpcn"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "����XP SP3ϵͳ"
                        $patchadress = $path1&"\winxpcn-sp3"
                        ;MsgBox(64,"��ʾ","XP SP3Ŀ¼��δ�����в�������")
                EndIf
        ElseIf         $sys =        "WIN_XP" And $syslg = 0409 Then
                If @OSServicePack = "Service Pack 2" Then
                        $osedition = "Ӣ��XP SP2ϵͳ"
                        $patchadress = $path1&"\winxpen"
                ElseIf @OSServicePack = "Service Pack 3" Then
                        $osedition = "Ӣ��XP SP3ϵͳ"
                        $patchadress = $path1&"\winxpen-sp3"
                        ;MsgBox(64,"��ʾ","XP SP3Ŀ¼��δ�����в�������")
                EndIf
        ElseIf         $sys = "WIN_2003" And $syslg = 0409 Then
                $osedition = "Ӣ��2003ϵͳ"
                $patchadress = ""
                MsgBox(64,"��ʾ","win2003Ŀ¼��δ�����в����ļ�")
        ElseIf         $sys = "WIN_2003" And $syslg = 0804 Then
                $osedition = "����2003ϵͳ"
                $patchadress = ""
                MsgBox(64,"��ʾ","win2003Ŀ¼��δ�����в����ļ�")
        ElseIf         $sys = "WIN_2003" And $syslg = 0404 Then
                $osedition = "����2003ϵͳ"
                $patchadress = $path1&"\win2003tw"
                ;;MsgBox(64,"��ʾ","win2003Ŀ¼��δ�����в����ļ�")
        ElseIf $sys ="WIN_VISTA" Then
                $osedition ="VISTAϵͳ"
                $patchadress = ""
                MsgBox(64,"��ʾ","VISTA����Ŀ¼��δ�����в����ļ�")
        EndIf
        If $patchadress = "" Then
                GUICtrlCreateListViewItem("|��ǰϵͳ�汾Ϊ:|"&$osedition,$ListView1)
                GUICtrlCreateListViewItem("|��δ�ṩ�˰汾ϵͳ�İ�װ����رճ���|",$ListView1)
        Else
                ;;ProgressOn("��װ����","")
                GUICtrlCreateListViewItem("|��ǰϵͳ�汾Ϊ:|"&$osedition,$ListView1)
                If $sys ="WIN_XP" And  @OSServicePack = "Service Pack 2" Then
                        MsgBox(64,"����","����ȫ����ֱ�ӽ�SP2����ΪSP3��ʹ��XP SP3��װ�̰�װ������Ҫ��װ��ô�ಹ��Ŷ��",8)
                EndIf
                GUICtrlCreateListViewItem("|��װ��������׼��|",$ListView1)
                $i = 0
                $view = "���������Ѱ�װ�İ�ȫ����..."
                GUICtrlSetData($Label3,$view)
                ;���������Ѱ�װ����
                While 1
                        $i+=1
                        $var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\windows nt\Currentversion\Hotfix",$i)
                        If @error <> 0 then ExitLoop
                        FileWriteLine(@TempDir &"\file3.txt",  $var& @CRLF)        
                WEnd
                sleep(2000)
                $view = "�����Ѵ��ڵİ�ȫ���¸���:"&$i
                GUICtrlSetData($Label3,$view)
                sleep(3000)
                FileOpen(@TempDir &"\file3.txt",0)
                $file = FileRead(@TempDir &"\file3.txt")
                FileClose(@TempDir &"\file3.txt")
                $view = "�����������������ļ�..."
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
                $view = "��Ҫ��װ�Ĳ�������"&$n
                GUICtrlSetData($Label3,$view)
                sleep(2000)
                $view = "���ڿ�ʼ��װ"
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
                                ;;ProgressSet(100/$filelist[0]*$i, "�����"&100/$filelist[0] *$i& " �� ")
                                $wait = 100/$n*$m
                                GUICtrlSetData($Progress1, $wait)
                                $jishu = "�����: "&Round($wait,0)&" ��"
                                GUICtrlSetData($Label3,$jishu)
                                If $result = 1603 then  
                                        $state = "��װʧ��"
                                Else
                                        $state = "��װ�ɹ�"
                                EndIf
                                GUICtrlCreateListViewItem($m&"|"&$array[2]&"|"&$state,$ListView1)        
                        EndIf
                Next
                $jishu = "�����: 100"&" ��"
                GUICtrlSetData($Label3,$jishu)
                TrayTip("��ʾ","������������ɣ�����������",6,1)
                ;;ProgressSet(100 , "���", "���")
                ;;ProgressOff()
        EndIf
EndFunc