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
#AutoIt3Wrapper_Icon=2.ico
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=Windows注册表离线加载辅助工具
#AutoIt3Wrapper_Res_Description=Windows注册表离线加载辅助工具
#AutoIt3Wrapper_Res_LegalCopyright=虫子樱桃
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <Constants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#Include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Dim $resultStr,$unloadresultStr
Opt("GUIOnEventMode", 1)
$Form1 = GUICreate("Windows注册表离线加载辅助工具", 620, 451, 274, 151,BitOR($GUI_SS_DEFAULT_GUI,$WS_SIZEBOX,$WS_THICKFRAME))
GUICtrlCreateGroup("工具模式设置", 8, 8, 589, 41)
$mountMode = GUICtrlCreateRadio("挂载模式(对系统中已经挂载的Wim进行处理)", 16, 24, 249, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1,"modeCheck")
$simpleMode = GUICtrlCreateRadio("简易模式(对单个注册表配置单元文件进行处理)", 281, 24, 297, 17)
GUICtrlSetOnEvent(-1,"modeCheck")
$getMountedInfoGroup = GUICtrlCreateGroup("获取已挂载镜像信息", 9, 55, 589, 105)
$mounted_wiminfo = GUICtrlCreateEdit("", 17, 71, 481, 81)
GUICtrlSetData(-1, "")
GUICtrlSetColor(-1, 0x0000FF)
$get_mounted_wiminfo = GUICtrlCreateButton("获取信息", 505, 71, 75, 81)
GUICtrlSetOnEvent($get_mounted_wiminfo,'getMountedWim')
$manualGetRight = GUICtrlCreateLabel('[1]选中要获取权限注册表项，右键选择"权限-高级-所有者"，选中当前登录用户名并勾选"替换子容器'&@LF&'和对象的所有者",按确定退出。'&@LF&'[2]再次选中要获取权限注册表项，右键选择"权限-高级-权限-添加"，输入当前登录用户名并点击"检查'&@LF&'名称"完成后点击确定。'&@LF&'[3]勾选"完全控制-允许"，点击确定即可。', 16, 80, 570, 73)
$loadOptionGroup = GUICtrlCreateGroup("可加载配置单元列表", 9, 236, 589, 145)
$ListView1 = GUICtrlCreateListView("文件位置|配置单元名称|配置单元说明|加载名称", 17, 252, 570, 118, BitOR($GUI_SS_DEFAULT_LISTVIEW,$LVS_AUTOARRANGE), BitOR($WS_EX_CLIENTEDGE,$LVS_EX_CHECKBOXES,$LVS_EX_FULLROWSELECT ))
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 146)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 90)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 250)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 80)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 146)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 90)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 250)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 80)
$ListView1_0 = GUICtrlCreateListViewItem("Users\Default\NTUSER.DAT|Default User|该配置单元记录了系统中Default用户的设置|WIM_Default", $ListView1)
$ListView1_1 = GUICtrlCreateListViewItem("Windows\System32\Config\SOFTWARE|Software|HKLM\SOFTWARE|WIM_Software", $ListView1)
$ListView1_2 = GUICtrlCreateListViewItem("Windows\System32\Config\SYSTEM|System|HKLM\SYSTEM|WIM_System", $ListView1)
$ListView1_3 = GUICtrlCreateListViewItem("Users\Administrator\NTUSER.DAT|Administrator|该配置单元记录了系统中Administrator用户的设置|WIM_Admin", $ListView1)
$ListView1_4 = GUICtrlCreateListViewItem("Windows\System32\Config\COMPONENTS|Components|HKLM\COMPONENTS|WIM_Components", $ListView1)
$ListView1_5 = GUICtrlCreateListViewItem("Windows\System32\Config\SAM|Sam|HKLM\SAM|WIM_SAM", $ListView1)
$setregLoadedNameLabel = GUICtrlCreateLabel("加载到注册表中的名称:", 24, 256, 127, 17)
$regLoadedName = GUICtrlCreateInput("", 160, 254, 121, 21)
$openInRegedit = GUICtrlCreateCheckbox("加载成功后自动在注册表编辑器中打开", 312, 256, 233, 17)
$selectRegGroup = GUICtrlCreateGroup("选择要离线加载注册表的wim挂载目录", 9, 168, 590, 57)
$select_loadregpath = GUICtrlCreateLabel("未选择", 25, 192, 500, 17)
GUICtrlSetColor(-1, 0xFF0000)
$select_regpath = GUICtrlCreateButton("浏览", 505, 184, 75, 25)
GUICtrlSetOnEvent($select_regpath,'detecHivPath')
$loadSelected = GUICtrlCreateButton("加载所选", 8, 392, 99, 41)
GUICtrlSetOnEvent($loadSelected,'HivLoadFunc')
$loadAll = GUICtrlCreateButton("全部加载", 130, 392, 99, 41)
GUICtrlSetOnEvent($loadAll,'HivLoadAll')
$unloadSelected = GUICtrlCreateButton("卸载所选", 252, 392, 99, 41)
GUICtrlSetOnEvent($unloadSelected,'HivUnLoadFunc')
$unloadAll = GUICtrlCreateButton("全部卸载", 375, 392, 99, 41)
GUICtrlSetOnEvent($unloadAll,'HivUnloadAll')
$quittool = GUICtrlCreateButton("退出", 499, 392, 99, 41)
GUICtrlSetOnEvent($quittool,'quittool')
modeCheck()
GUISetState(@SW_SHOW)
GUISetOnEvent($GUI_EVENT_CLOSE,"quittool")
While 1
        Sleep(100)
WEnd
;===============================================================================
; 功能函数开始
;===============================================================================
 
;退出时的函数
Func quittool()
        cleanUpini()
        Exit
EndFunc
;获取系统中已经挂载的Wim信息
Func  getMountedWim()
        GUICtrlSetData($mounted_wiminfo,'')
        $cmdhandle = Run(@ComSpec&' /c dism /Get-MountedWimInfo',"",@SW_HIDE, $STDOUT_CHILD)
        ProcessWaitClose($cmdhandle)
        GUICtrlSetData($mounted_wiminfo,StdoutRead($cmdhandle))
EndFunc
;选择注册表配置单元的目录或者文件
Func detecHivPath()
        If GUICtrlRead($simpleMode) = $GUI_CHECKED Then
                GUICtrlSetData($select_loadregpath,FileOpenDialog('请选择您要加载的注册表配置单元文件','','(*.*;*.hiv)注册表配置单元文件',1+2))
        ElseIf GUICtrlRead($mountMode) = $GUI_CHECKED Then
                GUICtrlSetData($select_loadregpath,FileSelectFolder('请选择已经挂载的wim挂载点','',1+2+4))
        Else
        EndIf
EndFunc
 
;获取注册表单元文件项目的选中状态以及未选中状态
Func HivLoadFunc()
        If GUICtrlRead($mountMode) = $GUI_CHECKED Then
                If FileExists(GUICtrlRead($select_loadregpath))Then
                        $resultStr = ''
                        For $i = 0 To 5
                           If _GUICtrlListView_GetItemChecked($ListView1, $i) = True Then
                                $str = _GUICtrlListView_GetItemTextArray($ListView1,$i)
                                   If FileExists(GUICtrlRead($select_loadregpath)&'\'&$str[1]) Then
                                         $regloadcmd = Run(@ComSpec&' /c REG LOAD HKLM\'&$str[4]&' '&GUICtrlRead($select_loadregpath)&'\'&$str[1],'',@SW_HIDE)
                                         ProcessWaitClose($regloadcmd)
                                         $resultStr &= '位于'&GUICtrlRead($select_loadregpath)&'\'&$str[1]&'的注册表文件被成功加载到HKEY_LOCAL_MACHINE\'&$str[4]&@LF
                                   Else
                                          $resultStr &= '文件'&GUICtrlRead($select_loadregpath)&'\'&$str[1]&'不存在，故未能成功加载！'&@LF
                                   EndIf
                           EndIf
                   Next
                   MsgBox(0,'提示',$resultStr,5)
           Else
                   MsgBox(16,"错误","Wim挂载目录未能正确设置，请检查！",3)
           EndIf
   ElseIf GUICtrlRead($simpleMode) = $GUI_CHECKED Then
           If GUICtrlRead($select_loadregpath) = '未选择' Or FileExists(GUICtrlRead($select_loadregpath))=0 Then
                   MsgBox(16,'错误','请选择正确的注册表配置单元文件',3)
           ElseIf GUICtrlRead($regLoadedName) = '' Then
                   MsgBox(16,'错误','请务必填写加载到注册表中的名称！',3)
           ElseIf GUICtrlRead($select_loadregpath) <> '未选择' And FileExists(GUICtrlRead($select_loadregpath))=1 And GUICtrlRead($regLoadedName) <>'' Then
                   IniWrite(@ScriptDir&'\History.ini','HivLoadedHistory','HivPath',GUICtrlRead($select_loadregpath))
                   IniWrite(@ScriptDir&'\History.ini','HivLoadedHistory','HivloadedValue',GUICtrlRead($regLoadedName))
                   $regloadcmd = Run(@ComSpec&' /c REG LOAD HKLM\'&GUICtrlRead($regLoadedName)&' '&GUICtrlRead($select_loadregpath),'',@SW_HIDE)
                   ProcessWaitClose($regloadcmd)
                   IniWrite(@ScriptDir&'\History.ini','HivLoadedHistory','HivloadedValue',GUICtrlRead($regLoadedName))
                   IniWrite(@ScriptDir&'\History.ini','HivLoadedHistory','HivUnload','false')
                   GUICtrlSetState($regLoadedName,$GUI_DISABLE)
                   If GUICtrlRead($openInRegedit) = $GUI_CHECKED Then
                           RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit", "LastKey", "REG_SZ","HKEY_LOCAL_MACHINE\"&GUICtrlRead($regLoadedName))
                           Run('regedit.exe -m')
                   EndIf
           Else
           EndIf
   Else
   EndIf
EndFunc
;全部加载
Func HivLoadAll()
        GUICtrlSetState($simpleMode,$GUI_DISABLE)
        _GUICtrlListView_SetItemChecked($ListView1,-1,True)
        HivLoadFunc()
        GUICtrlSetState($simpleMode,$GUI_ENABLE)
EndFunc
;卸载已经加载键值
Func HivUnLoadFunc()
If GUICtrlRead($mountMode) = $GUI_CHECKED Then
        $t = 1
        Do
                $regEnumedKey = RegEnumKey("HKEY_LOCAL_MACHINE",$t)
                For $i = 0 To 5
                        $str = _GUICtrlListView_GetItemTextArray($ListView1,$i)
                        If _GUICtrlListView_GetItemChecked($ListView1, $i) = True Then
                                If $str[4] = $regEnumedKey Then
                                        If ProcessExists('regedit.exe') Then ProcessClose('regedit.exe')
                                   $regloadcmd = Run(@ComSpec&' /c REG UNLOAD HKLM\'&$regEnumedKey,'',@SW_HIDE)
                                   ProcessWaitClose($regloadcmd)
                                   $unloadresultStr &= '位于HKEY_LOCAL_MACHINE\'&$regEnumedKey&'的注册表配置单元已经被成功卸载!'&@LF
                                   Run('regedit.exe')
                                EndIf
                        EndIf
                Next
                $t += 1
        Until $regEnumedKey = ''
        If $unloadresultStr <> '' Then
           MsgBox(0,'提示',$unloadresultStr,5)
    Else
           MsgBox(0,'提示','未在注册表中发现被加载的注册表配置单元！',5)
   EndIf
ElseIf GUICtrlRead($simpleMode) = $GUI_CHECKED Then
                If ProcessExists('regedit.exe') Then ProcessClose('regedit.exe')
           $regloadcmd = Run(@ComSpec&' /c REG UNLOAD HKLM\'&GUICtrlRead($regLoadedName),'',@SW_HIDE)
           ProcessWaitClose($regloadcmd)
           MsgBox(0,'提示','位于HKEY_LOCAL_MACHINE\'&GUICtrlRead($regLoadedName)&'的注册表配置单元已经被成功卸载！',5)
           GUICtrlSetState($regLoadedName,$GUI_ENABLE)
           Run('regedit.exe')
           IniWrite(@ScriptDir&'\History.ini','HivLoadedHistory','HivUnload','true')
           GUICtrlSetData($regLoadedName,'')
           GUICtrlSetData($select_loadregpath,'未选择')
           GUICtrlSetState($regLoadedName,$GUI_ENABLE)
Else
EndIf
EndFunc
;全部卸载已经加载的注册表配置单元
Func HivUnloadAll()
        GUICtrlSetState($simpleMode,$GUI_DISABLE)
        _GUICtrlListView_SetItemChecked($ListView1,-1,True)
        HivUnLoadFunc()
        GUICtrlSetState($simpleMode,$GUI_ENABLE)
EndFunc
;创建ini配置文件
Func iniCheck()
        If FileExists(@ScriptDir&'\History.ini') = 0 Then
                $fhandle = FileOpen(@ScriptDir&'\History.ini',1+8)
                FileWrite($fhandle,'[HivLoadedHistory]'&@LF&'HivPath ='&@LF&'HivloadedValue ='&@LF&'HivUnload =')
                FileClose($fhandle)
        EndIf
EndFunc
;当处于简易模式时，加载历史记录
Func HistoryLoadFunc()
        iniCheck()
        If GUICtrlRead($simpleMode) = $GUI_CHECKED Then
                If IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivUnload','') = 'false' Then
                        GUICtrlSetState($regLoadedName,$GUI_DISABLE)
                        GUICtrlSetData($select_loadregpath,IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivPath',''))
                        GUICtrlSetData($regLoadedName,IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivloadedValue',''))
                        Run('regedit.exe -m')
        ElseIf IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivUnload','') = 'true' Then
            FileDelete(@ScriptDir&'\History.ini')
                        iniCheck()
        Else                    
                EndIf
        EndIf
EndFunc
;模式监测
Func modeCheck()
        If GUICtrlRead($simpleMode) = $GUI_CHECKED Then
                HistoryLoadFunc()
                GUICtrlSetState($mounted_wiminfo,$GUI_HIDE)
                GUICtrlSetState($get_mounted_wiminfo,$GUI_HIDE)
                GUICtrlSetState($ListView1,$GUI_HIDE)
                GUICtrlSetState($loadAll,$GUI_HIDE)
                GUICtrlSetState($unloadAll,$GUI_HIDE)
                GUICtrlSetData($getMountedInfoGroup,'手工获取注册表权限方法')
                GUICtrlSetState($manualGetRight,$GUI_SHOW)
                GUICtrlSetData($loadOptionGroup,'加载选项设置')
                GUICtrlSetPos($loadOptionGroup,9, 236, 589, 49)
                GUICtrlSetState($setregLoadedNameLabel,$GUI_SHOW)
                GUICtrlSetState($regLoadedName,$GUI_SHOW)
                GUICtrlSetState($openInRegedit,$GUI_SHOW)
                GUICtrlSetData($selectRegGroup,'请选择您要进行离线加载的注册表配置单元文件')
                GUICtrlSetData($loadSelected,'开始加载')
                GUICtrlSetData($unloadSelected,'开始卸载')
                GUICtrlSetPos($loadSelected,130)
                GUICtrlSetPos($quittool,375)
        Else
                GUICtrlSetState($mounted_wiminfo,$GUI_SHOW)
                GUICtrlSetState($getMountedInfoGroup,$GUI_SHOW)
                GUICtrlSetState($get_mounted_wiminfo,$GUI_SHOW)
                GUICtrlSetState($ListView1,$GUI_SHOW)
                GUICtrlSetState($loadAll,$GUI_SHOW)
                GUICtrlSetState($unloadAll,$GUI_SHOW)
                GUICtrlSetData($getMountedInfoGroup,'获取已挂载镜像信息')
                GUICtrlSetState($manualGetRight,$GUI_HIDE)
                GUICtrlSetData($loadOptionGroup,'可加载配置单元列表')
                GUICtrlSetPos($loadOptionGroup, 9, 236, 589, 145)
                GUICtrlSetState($setregLoadedNameLabel,$GUI_HIDE)
                GUICtrlSetState($regLoadedName,$GUI_HIDE)
                GUICtrlSetState($openInRegedit,$GUI_HIDE)
                GUICtrlSetData($selectRegGroup,'选择要离线加载注册表的wim挂载目录')
                GUICtrlSetData($loadSelected,'加载所选')
                GUICtrlSetData($unloadSelected,'卸载所选')
                GUICtrlSetPos($loadSelected,8)
                GUICtrlSetPos($quittool,499)
        EndIf   
EndFunc
 
Func cleanUpini()
        If IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivPath','') = '' And IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivloadedValue','') = '' And IniRead(@ScriptDir&'\History.ini','HivLoadedHistory','HivUnload','') = '' Then
                FileDelete(@ScriptDir&'\History.ini')
        EndIf
EndFunc