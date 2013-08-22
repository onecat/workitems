#NoTrayIcon
#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=H:\Users\总\AppData\Local\Microsoft\Windows\INetCache\IE\IML8DHRJ\faviconQUF31YEZ.ico
#PRE_Outfile=论坛网站登录功能增强版.exe
#PRE_Res_requestedExecutionLevel=None
#PRE_Res_File_Add=SkinCrafterDll_31.dll
#PRE_Run_Tidy=y
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本: 3.3.6.1
	脚本作者: 風冄·訴華年
	网站支持: [url]http://www.autoitx.com/[/url]
	论坛账户:lsb968
	
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#region
#endregion

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <GuiTreeView.au3>
#include <_StringEncryptX.au3>
#include <Array.au3>
#include <Process.au3>



;~ FileInstall("SkinCrafterDll_31.dll", @TempDir & "SkinCrafterDll_31.dll", 1)
;~ FileInstall("Fabre.skf", @TempDir & "Fabre.skf", 1)
Opt("MustDeclareVars", 1)
Opt("TrayIconHide", 1)
OnAutoItExitRegister("_OnExit")
Dim $dll

;~ Opt("OnExitFunc", "Quit");设置在 AutoIt 退出时将调用的函数(Quit).
Global Const $gc_FormName = "论坛网站登陆器            ->>>>>>>>>>  風冄·訴華年  <<<<<<<<<<-"
Global Const $gc_IniFile = _
		@ScriptDir & "\IniFileshe.ini"





#region

Dim $bf = _
		IniRead($gc_IniFile, "skin", "DefaultSet", "") ;$gc_IniFile = @ScriptDir & "\IniFileshe.ini 设置文件安装 的路径

Global $gu_MainForm = _
		GUICreate($gc_FormName, 592, 430, -1, -1)
Skin("［X.o］-QQ影音.she")
Global $gu_Group1 = _
		GUICtrlCreateGroup("", 8, 0, 577, 369)
Global $gu_TreeView1 = _
		GUICtrlCreateTreeView(16, 16, 177, 342, _
		BitOR($GUI_SS_DEFAULT_TREEVIEW, _  ;BitOR 按位"或"运算.
		$TVS_CHECKBOXES, $WS_BORDER)) ;BitOR ( 值1, 值2 [, 值 n] );$TVS_CHECKBOXES 启用树形视图控件中的检查框
;$WS_BORDER 创建一个细边框的窗口.

Global $gu_List1 = _
		GUICtrlCreateList("", 200, 16, 377, 342, _
		BitOR($LBS_NOTIFY, $WS_VSCROLL))
GUICtrlSetColor(-1, 0xDEB887)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_Button1 = _
		GUICtrlCreateButton("自动登陆", 512, 376, 73, 33)

Global $gu_Menu1 = _
		GUICtrlCreateMenu("文件")

Global $gu_MenuItem11 = _
		GUICtrlCreateMenuItem("退出", $gu_Menu1)
Global $gu_Menu2 = _
		GUICtrlCreateMenu("窗口")
Global $gu_MenuItem21 = _
		GUICtrlCreateMenuItem("设备管理器", $gu_Menu2)
Global $gu_MenuItem22 = _
		GUICtrlCreateMenuItem("待用", $gu_Menu2)
Global $gu_MenuItem23 = _
		GUICtrlCreateMenuItem("", $gu_Menu2)
Global $gu_MenuItem24 = _
		GUICtrlCreateMenuItem("待用", $gu_Menu2)
Global $gu_Menu3 = _
		GUICtrlCreateMenu("工具")
Global $gu_MenuItem31 = _
		GUICtrlCreateMenuItem("关于本程序", $gu_Menu3)
Global $gu_MenuItem32 = _
		GUICtrlCreateMenuItem("", $gu_Menu3)
Global $gu_MenuItem33 = _
		GUICtrlCreateMenuItem("表单信息查找", $gu_Menu3)
Global $gu_MenuItem34 = _
		GUICtrlCreateMenuItem("RC4加密工具", $gu_Menu3)
Global $gu_Menu4 = _
		GUICtrlCreateMenu("皮肤")
Global $k = 0
Global $search = FileFindFirstFile(@ScriptDir & "\Skinshe\*.she")
While 1
	Global $file = FileFindNextFile($search)
	If @error Then ExitLoop
	Global $pfName = StringTrimRight($file, 4)
	Global $gu_MenuItem41 = GUICtrlCreateMenuItem($pfName, $gu_Menu4)

	$k += 1
WEnd
FileClose($search)

Global $gu_MenuItem42 = GUICtrlCreateMenuItem('', $gu_Menu4)
Global $gu_MenuItem43 = GUICtrlCreateMenuItem('官方皮肤下载', $gu_Menu4)


#endregion
HotKeySet("{ESC}", "Form1_1Close")
_Main()



Exit

Func _Main()
	Global $s, $ds
	Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
	_CreateTreeviewNodes($a_Nodes)
	_DisplaywebsiteList($gu_List1, $a_Nodes) ;$gu_List1 = GUICtrlCreateList("", 200, 16, 377, 342, BitOR($LBS_NOTIFY, $WS_VSCROLL))

	GUISetState(@SW_SHOW) ;GUISetState===>调整窗口的状态
	;@SW_SHOW==> 激活指定窗口并使其以当前大小和位置信息显示.

	Local $nMsg
	While 1
		$nMsg = GUIGetMsg() ;捕获窗口消息
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUISetState(@SW_HIDE)
;~                              Quit()
				Exit
			Case $gu_MenuItem11
				Exit
			Case $gu_MenuItem21
				Run(@ScriptDir & '\IniFile\设备管理\设备管理器.exe')

			Case 21 To 20 + $k
				$bf = GUICtrlRead($nMsg, 1) & ".she"

				IniWrite(@ScriptDir & "\IniFileshe.ini", 'skin', 'DefaultSet', $bf)
				Skin($bf)


			Case $gu_MenuItem43
				_RunDOS("start [url]http://skincrafter.com/gallery[/url]")
			Case $gu_MenuItem31
				MsgBox(0 + 64, $gc_FormName, _
						"本软件用于软件批量自动登陆", _
						0, $gu_MainForm)
			Case $gu_MenuItem33
				formtool()

			Case $gu_MenuItem34
				Encryptiontool()

			Case $gu_Button1
;~                                 Local $r = _
				_Installlogins($a_Nodes, "Auto")
;~                                 If $r = 1 Then Exit
		EndSwitch
		_TreeViewControl($a_Nodes, $nMsg)
	WEnd
EndFunc   ;==>_Main

Func _ReadwebsiteNodes($IniFile)
	Local Const $N = 10
	Local $a_Nodes[1][$N], $p = 1
	Local $SwDir = @ScriptDir & "\IniFile"
	Local $i = 1

	While 1
		Local $Allchoice
		Local $ClsName = _
				IniRead($IniFile, $i, $i & ".Name", "") ;????
		If $ClsName = "" Then ExitLoop ;        Then ExitLoop===>终止一个 While/Do/For 循环.
		ReDim $a_Nodes[$p + 1][$N] ;ReDim====>调整一个已经存在的数组的大小
		$a_Nodes[$p][1] = "root" ;$a_Nodes00;$a_Nodes10

		$a_Nodes[$p][2] = _     ;$a_Nodes00;$a_Nodes10;$a_Nodes10;$a_Nodes11 ；默认勾选中的所有根项目 (1/0),(是/否)
				IniRead($IniFile, $i, $i & ".Rootchoice", "")
		If $a_Nodes[$p][2] = 0 Then $Allchoice = 0 ;其中一项根项目勾选时其他根项目子项目不选
		If $a_Nodes[$p][2] = 1 Then $Allchoice = 1 ;根项目勾选时子项目全选

		$a_Nodes[$p][3] = _       ;$a_Nodes00;$a_Nodes10;$a_Nodes01;$a_Nodes11;$a_Nodes02;$a_Nodes12
				IniRead($IniFile, $i, $i & ".Name", "")
		$a_Nodes[$p][4] = _         ;$a_Nodes00;$a_Nodes11;$a_Nodes01;$a_Nodes11;$a_Nodes02;$a_Nodes12;$a_Nodes03;$a_Nodes13
				$SwDir & "\" & _
				IniRead($IniFile, $i, $i & ".Icon", "")
		$a_Nodes[$p][5] = _
				IniRead($IniFile, $i, $i & ".Expand", "")
		$p += 1 ;$p=$p+1

		Local $j = 1
		While 1
			Local $i
			Local $SwName = _
					IniRead($IniFile, $i, _
					$i & "-" & $j & ".Name", "")
			If $SwName = "" Then ExitLoop
			ReDim $a_Nodes[$p + 1][$N]
			$a_Nodes[$p][1] = "sub"
;~                                              For $i = UBound($a_Nodes, 1) - 1 To 1 Step -1
			If $Allchoice = 1 Then
				$a_Nodes[$p][2] = 1
			Else
				$a_Nodes[$p][2] = _    ;设置默认勾选中所有子项目 (1/0),(是/否)
						IniRead($IniFile, $i, _
						$i & "-" & $j & ".subchoice", "")
			EndIf
;~                                      Next
			$a_Nodes[$p][3] = _
					IniRead($IniFile, $i, _          ;读取文本，区别以下
					$i & "-" & $j & ".Name", "")
			$a_Nodes[$p][4] = $SwDir & "\" & _              ;文件的路径，@ScriptDir是宏相关编写进代码才能返回数据
					IniRead($IniFile, $i, _
					$i & "-" & $j & ".Icon", "")
			$a_Nodes[$p][5] = $SwDir & "\" & _
					IniRead($IniFile, $i, _
					$i & "-" & $j & ".Usermame", "")
			$a_Nodes[$p][6] = $SwDir & "\" & _
					IniRead($IniFile, $i, _
					$i & "-" & $j & ".Password", "")
			$a_Nodes[$p][7] = $SwDir & "\" & _
					IniRead($IniFile, $i, _
					$i & "-" & $j & ".Http", "")
;~                                                         IniWrite(@ScriptDir & "\IniFileshe.ini", $i, $i & ".Rootchoice",'0')
;~                                                         IniWrite(@ScriptDir & "\IniFileshe.ini", $i,$i & "-" & $j & ".subchoice",'0')

			$p += 1
			$j += 1
		WEnd
		$i += 1
	WEnd
	$a_Nodes[0][0] = UBound($a_Nodes, 1) - 1
	Return $a_Nodes
EndFunc   ;==>_ReadwebsiteNodes

Func _CreateTreeviewNodes(ByRef $a_Nodes) ;$a_Nodes = _ReadwebsiteNodes($gc_IniFile)
	_GUICtrlTreeView_BeginUpdate($gu_TreeView1) ;开始控件更新,直到 EndUpdate 函数被调用
	Local $i
	For $i = 1 To UBound($a_Nodes, 1) - 1
		Local $Root
		If $a_Nodes[$i][1] = "root" Then
			$a_Nodes[$i][0] = _
					GUICtrlCreateTreeViewItem( _      ;在GUI上创建一个 TreeViewItem 控件.
					$a_Nodes[$i][3], $gu_TreeView1) ;GUICtrlCreateTreeViewItem ( "文本", 列表视图ID )
			GUICtrlSetImage( _                                 ;设置指定控件的位图或图标
					$a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( 控件ID, 文件名 [, 图标名 [, 图标类型]] )
			$Root = $a_Nodes[$i][0]
		Else
			$a_Nodes[$i][0] = _
					GUICtrlCreateTreeViewItem( _     ;在GUI上创建一个 TreeViewItem 控件.
					$a_Nodes[$i][3], $Root) ; GUICtrlCreateTreeViewItem ( "文本", 列表视图ID )
			GUICtrlSetImage( _                               ;设置指定控件的位图或图标
					$a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( 控件ID, 文件名 [, 图标名 [, 图标类型]] )
		EndIf
	Next
	Local $i
	For $i = UBound($a_Nodes, 1) - 1 To 1 Step -1
		If $a_Nodes[$i][2] = 1 Then
			_GUICtrlTreeView_SetChecked( _                ;设置项目复选框选中
					$gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_SetChecked(控件句柄, 项目句柄 [, 展开或折叠标志])
		EndIf


		If $a_Nodes[$i][1] = "root" And _
				$a_Nodes[$i][5] = 1 Then
			_GUICtrlTreeView_Expand( _                     ;展开或折叠父项目相关的子项列表
					$gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_Expand(控件句柄[, 项目句柄 = 0[, 展开或折叠标志]])
		EndIf
	Next
	_GUICtrlTreeView_EndUpdate($gu_TreeView1)
EndFunc   ;==>_CreateTreeviewNodes

Func _TreeViewControl(ByRef $a_Nodes, $iMsg)
	Local $i
	For $i = 1 To $a_Nodes[0][0]
		Switch $iMsg
			Case $a_Nodes[$i][0]
				If $a_Nodes[$i][1] = "root" Then
					If _GUICtrlTreeView_GetChecked( _                ;设置项目复选框选中
							$gu_TreeView1, $a_Nodes[$i][0]) = True _  ;_GUICtrlTreeView_GetChecked($hWnd, $hItem)
							And $a_Nodes[$i][2] = 0 Then
						$a_Nodes[$i][2] = 1
						Local $j
						For $j = $i + 1 To $a_Nodes[0][0]
							If $a_Nodes[$j][1] = "sub" Then
								_GUICtrlTreeView_SetChecked( _
										$gu_TreeView1, _
										$a_Nodes[$j][0], True)
								$a_Nodes[$j][2] = 1
							Else
								ExitLoop
							EndIf
						Next
						_DisplaywebsiteList($gu_List1, $a_Nodes)
					ElseIf _GUICtrlTreeView_GetChecked( _
							$gu_TreeView1, $a_Nodes[$i][0]) = False _
							And $a_Nodes[$i][2] = 1 Then
						$a_Nodes[$i][2] = 0
						Local $j
						For $j = $i + 1 To $a_Nodes[0][0]
							If $a_Nodes[$j][1] = "sub" Then
								_GUICtrlTreeView_SetChecked( _
										$gu_TreeView1, _
										$a_Nodes[$j][0], False)
								$a_Nodes[$j][2] = 0
							Else
								ExitLoop
							EndIf
						Next
						_DisplaywebsiteList($gu_List1, $a_Nodes)
					EndIf
				ElseIf $a_Nodes[$i][1] = "sub" Then
					If _GUICtrlTreeView_GetChecked( _
							$gu_TreeView1, $a_Nodes[$i][0]) = True _
							And $a_Nodes[$i][2] = 0 Then
						$a_Nodes[$i][2] = 1

						_DisplaywebsiteList($gu_List1, $a_Nodes)
					ElseIf _GUICtrlTreeView_GetChecked( _
							$gu_TreeView1, $a_Nodes[$i][0]) = False _
							And $a_Nodes[$i][2] = 1 Then
						$a_Nodes[$i][2] = 0
						Local $RootHdl
						Local $flag = 0
						Local $j
						For $j = $i + 1 To $a_Nodes[0][0]
							If $a_Nodes[$j][1] = "root" Then
								ExitLoop
							Else
								If _GUICtrlTreeView_GetChecked( _
										$gu_TreeView1, _
										$a_Nodes[$j][0]) = True Then
									$flag = 1
									ExitLoop
								EndIf
							EndIf
						Next
						For $j = $i - 1 To 1 Step -1
							If $a_Nodes[$j][1] = "root" Then
								$RootHdl = $a_Nodes[$j][0]
								ExitLoop
							Else
								If _GUICtrlTreeView_GetChecked( _
										$gu_TreeView1, _
										$a_Nodes[$j][0]) = True Then
									$flag = 1
									ExitLoop
								EndIf
							EndIf
						Next
						If $flag = 0 Then
							_GUICtrlTreeView_SetChecked( _
									$gu_TreeView1, _
									$RootHdl, False)
							$a_Nodes[$j][2] = 0
						EndIf
						_DisplaywebsiteList($gu_List1, $a_Nodes)
					EndIf
				EndIf
		EndSwitch
	Next
EndFunc   ;==>_TreeViewControl

Func _DisplaywebsiteList($gu_List1, $a_Nodes)

	Local $s = ""
	Local $i, $p = 1
	For $i = 1 To UBound($a_Nodes, 1) - 1
		If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
			Local $Index
			If $p < 10 Then
				$Index = "0" & String($p) ;返回某表达式的字符串结果
			Else
				$Index = String($p)
			EndIf
			$s &= "[" & $Index & "] " & $a_Nodes[$i][3] & "|"
			$p += 1
		EndIf
	Next
	$s = StringTrimRight($s, 1)
	GUICtrlSetData($gu_List1, "", "")
	GUICtrlSetData($gu_List1, $s)
EndFunc   ;==>_DisplaywebsiteList
Func _Installlogins($a_Nodes, $Mode) ;Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
	Local Const $N = 4 ;ini配置文件里的项数
	Local $a_SwList[1][$N], $p = 1
	Local $i
	For $i = 1 To UBound($a_Nodes, 1) - 1
		If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
			ReDim $a_SwList[$p + 1][$N]
			$a_SwList[$p][0] = $a_Nodes[$i][3] ;Name
			$a_SwList[$p][1] = $a_Nodes[$i][5] ;Usermame
			$a_SwList[$p][2] = $a_Nodes[$i][6] ;Password
			$a_SwList[$p][3] = $a_Nodes[$i][7] ;Http
			$p += 1
		EndIf
	Next


	;;_ArrayDisplay($a_SwList)
	If UBound($a_SwList, 1) - 1 = 0 Then
		MsgBox(0 + 64, $gc_FormName, _
				"未选中任何项目哦!", 0, $gu_MainForm)
		Return 0
	EndIf

	Local $httpname, $username, $Http, $password, $usernamedecryption, $passworddecryption
	For $i = 1 To UBound($a_SwList, 1) - 1
		_DisplayloginProgress($a_SwList, $i) ;显示表单是否执行完毕
		Select
			Case $Mode = "Manual"
				RunWait($a_SwList[$i][1])
			Case $Mode = "Auto"

				$httpname = StringRegExpReplace($a_SwList[$i][0], '^.+\\', '')
				$username = StringRegExpReplace($a_SwList[$i][1], '^.+\\', '')
				$password = StringRegExpReplace($a_SwList[$i][2], '^.+\\', '')
				$Http = StringRegExpReplace($a_SwList[$i][3], '^.+\\', '')
				$usernamedecryption = _StringEncryptX(0, $username, "XXX", 3)
				$passworddecryption = _StringEncryptX(0, $password, "XXX", 3)


				Global $oIE, $c, $YXMima, $oForm, $oQuery
				$oIE = _IECreate($Http, 0, 1, 1, 0)
				_IELoadWait($oIE)
				_IEPropertySet($oIE, "width", 800)
				_IEPropertySet($oIE, "height", 600)
				Local $oInputs = _IETagNameGetCollection($oIE, "INPUT")
				Local $sHTML = _IEDocReadHTML($oIE)
				Local $zc21, $zc22, $zc31, $zc41, $zc51, $da11, $da12, $z1, $z2
				$zc21 = 'userid'
				$zc22 = 'username'
				$zc31 = 'password'
				$da11 = StringInStr($sHTML, '<FORM')
				$da12 = StringInStr($sHTML, '<input')
				$z1 = StringInStr($sHTML, $zc21)
				$z2 = StringInStr($sHTML, $zc22)



				Select

					Case $da12 > 0 And $z1 > 0
						$zc51 = "此网站我第一种源码"
						MsgBox(0 + 64, " 風冄·訴華年 ", $zc51, 3)
						For $oInput In $oInputs
							If $oInput.name = $zc21 Then
								$oInput.value = $usernamedecryption
							EndIf
						Next
						For $oInput In $oInputs
							If $oInput.name = $zc31 Then
								$oInput.value = $passworddecryption
							EndIf
						Next
						$oIE.document.getElementsByTagName('button').item(0).click

						For $oInput In $oInputs
							If $oInput.type = "submit" Then
								_IEAction($oInput, "click")
							EndIf
						Next
						_IELoadWait($oIE)

					Case $da12 > 0 And $z2 > 0
						$zc51 = '此网站我第二种源码'
						MsgBox(0 + 64, "風冄·訴華年", $zc51, 3)
						For $oInput In $oInputs
							If $oInput.name = $zc22 Then
								$oInput.value = $usernamedecryption
							EndIf
						Next
						For $oInput In $oInputs
							If $oInput.name = $zc31 Then
								$oInput.value = $passworddecryption
							EndIf
						Next
						$oIE.document.getElementsByTagName('button').item(0).click
						For $oInput In $oInputs
							If $oInput.type = "submit" Then
								$oInput.value = "登陆"
								_IEAction($oInput, "click")
							EndIf
						Next
						_IELoadWait($oIE)
;~
					Case $da12 = 0 And $z2 > 0
						$zc51 = '此网站我第三种源码'
						MsgBox(0 + 64, " 風冄·訴華年 ", $zc51, 3)
						For $oInput In $oInputs
							If $oInput.name = $zc22 Then
								$oInput.value = $usernamedecryption
							EndIf
						Next
						For $oInput In $oInputs
							If $oInput.name = $zc31 Then
								$oInput.value = $passworddecryption
							EndIf
						Next

						For $oInput In $oInputs
							If $oInput.type = "submit" Then
								$oInput.value = "登陆"
								_IEAction($oInput, "click")
							EndIf
						Next
						_IELoadWait($oIE)

					Case Else
						$zc51 = "网站已经登陆或者参数有误"
						MsgBox(0 + 64, " 風冄·訴華年 ", $zc51, 3)
				EndSelect

		EndSelect
		Sleep(200)
	Next
	$s = StringReplace($s, "正在登陆... -->", "登陆完成 ===>")
	GUICtrlSetData($gu_List1, "", "")
	GUICtrlSetData($gu_List1, $s, $ds);修改指定控件的数据 ;GUICtrlSetData ( 控件ID, 数据 [, 默认值] )
	MsgBox(0 + 64, $gc_FormName, _
			"网站登陆结束!", 0, $gu_MainForm)
	Return
EndFunc   ;==>_Installlogins

Func _DisplayloginProgress($a_SwList, $ii)

	$s = ""
	Local $i, $p = 1
	$ds = ""
	For $i = 1 To UBound($a_SwList, 1) - 1
		Local $Index
		If $p < 10 Then
			$Index = "0" & String($p)
		Else
			$Index = String($p)
		EndIf
		If $i < $ii Then
			$s &= "登陆完成 ===> " & _
					"[" & $Index & "] " & $a_SwList[$i][0] & "|"
		ElseIf $i = $ii Then
			$ds = "正在登陆... --> " & _
					"[" & $Index & "] " & $a_SwList[$i][0]
			$s &= "正在登陆... --> " & _
					"[" & $Index & "] " & $a_SwList[$i][0] & "|"
		Else
			$s &= "[" & $Index & "] " & $a_SwList[$i][0] & "|"
		EndIf
		$p += 1
	Next
	$s = StringTrimRight($s, 1)
	GUICtrlSetData($gu_List1, "", "")
	GUICtrlSetData($gu_List1, $s, $ds);修改指定控件的数据 ;GUICtrlSetData ( 控件ID, 数据 [, 默认值] )
EndFunc   ;==>_DisplayloginProgress

Func Form1_1Close()
	Exit
EndFunc   ;==>Form1_1Close



;=============================================皮肤=========================================================
Func Skin($She)
	$dll = DllOpen(@ScriptDir & '\Skinshe\Skin.dll')
	DllCall($dll, "int", "SkinH_AttachEx", "str", @ScriptDir & '\Skinshe\' & $She, "str", "mhgd")
	DllCall($dll, "int", "SkinH_SetAero", "int", 1)
EndFunc   ;==>Skin

;=============================================表单信息查找=========================================================
Func formtool()
	Local $Http = InputBox('表单信息查找', '请输入网址')
	If @error Then Return
	If $Http = "" Then Return
	Local $oForms, $oInputs, $Forms, $oQuerys, $oFormshu, $Http, $oIE
	$oIE = _IECreate($Http)
	$oForms = _IEFormGetCollection($oIE)
	$oFormshu = "这个页面上共有" & @extended & "个表单"
	MsgBox(0, "表单信息", "这个页面上共有" & @extended & "个表单")
	FileWriteLine("表单信息.txt", '_______________________________________________________________________________')
	FileWriteLine("表单信息.txt", $Http & @CRLF & @CRLF)
	FileWriteLine("表单信息.txt", $oFormshu & @CRLF & @CRLF)
	$oInputs = _IETagNameGetCollection($oIE, "INPUT")
	For $oInput In $oInputs
		FileWriteLine("表单信息.txt", 'Input === ' & $oInput.name)
		FileWriteLine("表单信息.txt", "   id === " & $oInput.id)
		FileWriteLine("表单信息.txt", " type === " & $oInput.type & @CRLF & @CRLF)
	Next
	For $Form In $oForms
		FileWriteLine("表单信息.txt", 'Form === ' & $Form.name & @CRLF & @CRLF)
		$oQuerys = _IEFormElementGetCollection($Form)
		For $Query In $oQuerys
			FileWriteLine("表单信息.txt", "控件 === " & $Query.name)
			FileWriteLine("表单信息.txt", "  id === " & $Query.id)
			FileWriteLine("表单信息.txt", "type === " & $Query.type & @CRLF & @CRLF)
		Next
	Next
	FileWriteLine("表单信息.txt", '_______________________________________________________________________________' & @CRLF & @CRLF)
	_IEQuit($oIE)
EndFunc   ;==>formtool

;===============================================密码加密====================================================================
Func Encryptiontool()
	Opt("MustDeclareVars", 1)
	Opt("TrayIconHide", 1)
	Local $WinMainv, $EditText, $InputPass, $InputLevel, $UpDownLevel, $EncryptButton, $DecryptButton, $string
	Local $WinMain = GUICreate('加密工具', 400, 405)
	$EditText = GUICtrlCreateEdit('', 5, 5, 380, 350)
	$InputPass = GUICtrlCreateInput('', 5, 360, 100, 20, 0x21)
	$InputLevel = GUICtrlCreateInput(1, 110, 360, 50, 20, 0x2001)
	$UpDownLevel = GUICtrlSetLimit(GUICtrlCreateUpdown($InputLevel), 10, 1)
	$EncryptButton = GUICtrlCreateButton('加密', 170, 360, 105, 35)
	$DecryptButton = GUICtrlCreateButton('解密', 285, 360, 105, 35)
	GUICtrlCreateLabel('密码', 5, 385)
	GUICtrlCreateLabel('等级', 110, 385)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				GUIDelete($WinMain)
				Return
			Case $EncryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; Stops you from changing anything
				$string = GUICtrlRead($EditText) ; Saves the editbox for later
				GUICtrlSetData($EditText, 'Please wait while the text is Encrypted/Decrypted.') ; Friendly message
				GUICtrlSetData($EditText, _StringEncryptX(1, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				GUISetState(@SW_ENABLE, $WinMain) ; This turns the window back on
			Case $DecryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; Stops you from changing anything
				$string = GUICtrlRead($EditText) ; Saves the editbox for later
				GUICtrlSetData($EditText, 'Please wait while the text is Encrypted/Decrypted.') ; Friendly message
				GUICtrlSetData($EditText, _StringEncryptX(0, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				GUISetState(@SW_ENABLE, $WinMain) ; This turns the window back on
		EndSwitch
	WEnd ; Continue loop untill window is closed
	Exit
EndFunc   ;==>Encryptiontool
