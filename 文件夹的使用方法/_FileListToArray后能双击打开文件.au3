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



;~   #Include <File.au3>
;~   #Include <Array.au3>
;~   Local $var
;~   $var = _FileListToArray("C:\Users\xiaozhan\Desktop\子电脑","*",2)
;~   MsgBox(0,"",$var[2])


#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <GuiListView.au3>

$FileList = _FileListToArray(@DesktopDir)
if isarray($FileList)  then
$Form1 = GUICreate("Form1", 246, 293, -1, -1)
$ListView1 = GUICtrlCreateListView("11111111111111111111111111111", 8, 16, 218, 270, $LVS_SINGLESEL, $LVS_EX_GRIDLINES)
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
For $i = 1 To $FileList[0]
        GUICtrlCreateListViewItem($FileList[$i], $ListView1)
Next
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
WEnd
endif


Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
        Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo, $Menu
        $hWndListView = $ListView1
        If Not IsHWnd($ListView1) Then $hWndListView = GUICtrlGetHandle($ListView1)
        $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
        $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
        $iCode = DllStructGetData($tNMHDR, "Code")
        Switch $hWndFrom
                Case $hWndListView
                        Switch $iCode
                                Case $NM_DBLCLK ; 响应 List1 范围内的双击
                                        $Index = _GUICtrlListView_GetSelectedIndices($hWndListView)
                                        If $Index <> "" Then
                                                $L_Name = _GUICtrlListView_GetItemText($hWndListView, $Index)
                                                Select
                                                        Case StringRight($L_Name, 4) = ".lnk"
                                                                $exe = FileGetShortcut(@DesktopDir & '\' & $L_Name)
                                                                RunWait($exe[0])
                                                        Case StringRight($L_Name, 4) = ".exe" Or StringRight($L_Name, 4) = ".com"
                                                                $exe = @DesktopDir & '\' & $L_Name
                                                                RunWait($exe)
                                                        Case Else
                                                                ShellExecuteWait(@DesktopDir & '\' & $L_Name)
                                                EndSelect

                                        EndIf
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY