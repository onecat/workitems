#region ACN预处理程序参数(常用参数)
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
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiTreeView.au3>

Dim $Item1[10], $Item2[10], $Item3[10]
;Local $treeview, $generalitem, $displayitem, $aboutitem, $compitem
;Local $useritem, $resitem, $otheritem, $startlabel, $aboutlabel, $compinfo
;Local $togglebutton, $infobutton, $statebutton, $cancelbutton
;Local $msg, $item, $hItem, $text


#region ### START Koda GUI section ### Form=E:\AU3 study\档案管理软件\Demo\树搜索\Form1.kxf
$FrmTree = GUICreate("树查询", 169, 347, 614, 246, -1, BitOR($WS_EX_TOOLWINDOW,$WS_EX_WINDOWEDGE))
$TreeView= GUICtrlCreateTreeView(8, 8, 153, 329)
addTree()
GUISetState(@SW_SHOW)
GUIRegisterMsg($WM_NOTIFY, 'MY_WM')
#endregion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

Func addTree()
	For $i = 0 To 4
		$Item1[$i] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] 爷爷", $i), $treeview)
		For $j = 0 To 5
			$Item2[$j] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] 爸爸", $j), $Item1[$i])
			For $k = 0 To 5
				GUICtrlCreateTreeViewItem(StringFormat("[%02d] 儿子", $k), $Item2[$j])
			Next
		Next
	Next
EndFunc   ;==>addTree

Func MY_WM($hWnd, $msg, $wParam, $lParam)
	Local $tNMHdr = DllStructCreate($tagNMHDR, $lParam), $tNM_TREEVIEW
	Local $hWndFrom = DllStructGetData($tNMHdr, 'hWndFrom')
	Local $iIDFrom = DllStructGetData($tNMHdr, 'IDFrom')
	Local $iCode = DllStructGetData($tNMHdr, 'Code')

	If $iIDFrom = $treeview Then
		Switch $iCode
			Case $TVN_SELCHANGEDA, $TVN_SELCHANGEDW
				If GUICtrlRead($treeview) > 0 Then
					$ID1=Number(GUICtrlRead($treeview))
					
					$Text1=GUICtrlRead($treeview, 1)
					$Parent= _GUICtrlTreeView_GetParentParam($treeview,$ID1)
					$ParentName= _GUICtrlTreeView_GetText($treeview,$Parent)
					$Parent2= _GUICtrlTreeView_GetParentParam($treeview,$Parent)
					$ParentName2= _GUICtrlTreeView_GetText($treeview,$Parent2)
					MsgBox(0, 0, 'ID:   ' & $ID1& @CRLF & 'Text:   ' & $Text1&@CRLF&"Parent：   "&$Parent&$ParentName&@CRLF&"Parent2：  "&$Parent2&$ParentName2)
					
				EndIf
		EndSwitch
	EndIf

	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_WM


