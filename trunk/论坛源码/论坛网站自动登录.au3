#NoTrayIcon
#region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=H:\Users\��\AppData\Local\Microsoft\Windows\INetCache\IE\IML8DHRJ\faviconQUF31YEZ.ico
#PRE_Outfile=��̳��վ��¼������ǿ��.exe
#PRE_Res_requestedExecutionLevel=None
#PRE_Res_File_Add=SkinCrafterDll_31.dll
#PRE_Run_Tidy=y
#endregion ;**** ���������� ACNWrapper_GUI ****
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾: 3.3.6.1
	�ű�����: �L�ѡ��V�A��
	��վ֧��: [url]http://www.autoitx.com/[/url]
	��̳�˻�:lsb968
	
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

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

;~ Opt("OnExitFunc", "Quit");������ AutoIt �˳�ʱ�����õĺ���(Quit).
Global Const $gc_FormName = "��̳��վ��½��            ->>>>>>>>>>  �L�ѡ��V�A��  <<<<<<<<<<-"
Global Const $gc_IniFile = _
		@ScriptDir & "\IniFileshe.ini"





#region

Dim $bf = _
		IniRead($gc_IniFile, "skin", "DefaultSet", "") ;$gc_IniFile = @ScriptDir & "\IniFileshe.ini �����ļ���װ ��·��

Global $gu_MainForm = _
		GUICreate($gc_FormName, 592, 430, -1, -1)
Skin("��X.o��-QQӰ��.she")
Global $gu_Group1 = _
		GUICtrlCreateGroup("", 8, 0, 577, 369)
Global $gu_TreeView1 = _
		GUICtrlCreateTreeView(16, 16, 177, 342, _
		BitOR($GUI_SS_DEFAULT_TREEVIEW, _  ;BitOR ��λ"��"����.
		$TVS_CHECKBOXES, $WS_BORDER)) ;BitOR ( ֵ1, ֵ2 [, ֵ n] );$TVS_CHECKBOXES ����������ͼ�ؼ��еļ���
;$WS_BORDER ����һ��ϸ�߿�Ĵ���.

Global $gu_List1 = _
		GUICtrlCreateList("", 200, 16, 377, 342, _
		BitOR($LBS_NOTIFY, $WS_VSCROLL))
GUICtrlSetColor(-1, 0xDEB887)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_Button1 = _
		GUICtrlCreateButton("�Զ���½", 512, 376, 73, 33)

Global $gu_Menu1 = _
		GUICtrlCreateMenu("�ļ�")

Global $gu_MenuItem11 = _
		GUICtrlCreateMenuItem("�˳�", $gu_Menu1)
Global $gu_Menu2 = _
		GUICtrlCreateMenu("����")
Global $gu_MenuItem21 = _
		GUICtrlCreateMenuItem("�豸������", $gu_Menu2)
Global $gu_MenuItem22 = _
		GUICtrlCreateMenuItem("����", $gu_Menu2)
Global $gu_MenuItem23 = _
		GUICtrlCreateMenuItem("", $gu_Menu2)
Global $gu_MenuItem24 = _
		GUICtrlCreateMenuItem("����", $gu_Menu2)
Global $gu_Menu3 = _
		GUICtrlCreateMenu("����")
Global $gu_MenuItem31 = _
		GUICtrlCreateMenuItem("���ڱ�����", $gu_Menu3)
Global $gu_MenuItem32 = _
		GUICtrlCreateMenuItem("", $gu_Menu3)
Global $gu_MenuItem33 = _
		GUICtrlCreateMenuItem("����Ϣ����", $gu_Menu3)
Global $gu_MenuItem34 = _
		GUICtrlCreateMenuItem("RC4���ܹ���", $gu_Menu3)
Global $gu_Menu4 = _
		GUICtrlCreateMenu("Ƥ��")
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
Global $gu_MenuItem43 = GUICtrlCreateMenuItem('�ٷ�Ƥ������', $gu_Menu4)


#endregion
HotKeySet("{ESC}", "Form1_1Close")
_Main()



Exit

Func _Main()
	Global $s, $ds
	Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
	_CreateTreeviewNodes($a_Nodes)
	_DisplaywebsiteList($gu_List1, $a_Nodes) ;$gu_List1 = GUICtrlCreateList("", 200, 16, 377, 342, BitOR($LBS_NOTIFY, $WS_VSCROLL))

	GUISetState(@SW_SHOW) ;GUISetState===>�������ڵ�״̬
	;@SW_SHOW==> ����ָ�����ڲ�ʹ���Ե�ǰ��С��λ����Ϣ��ʾ.

	Local $nMsg
	While 1
		$nMsg = GUIGetMsg() ;���񴰿���Ϣ
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUISetState(@SW_HIDE)
;~                              Quit()
				Exit
			Case $gu_MenuItem11
				Exit
			Case $gu_MenuItem21
				Run(@ScriptDir & '\IniFile\�豸����\�豸������.exe')

			Case 21 To 20 + $k
				$bf = GUICtrlRead($nMsg, 1) & ".she"

				IniWrite(@ScriptDir & "\IniFileshe.ini", 'skin', 'DefaultSet', $bf)
				Skin($bf)


			Case $gu_MenuItem43
				_RunDOS("start [url]http://skincrafter.com/gallery[/url]")
			Case $gu_MenuItem31
				MsgBox(0 + 64, $gc_FormName, _
						"�����������������Զ���½", _
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
		If $ClsName = "" Then ExitLoop ;        Then ExitLoop===>��ֹһ�� While/Do/For ѭ��.
		ReDim $a_Nodes[$p + 1][$N] ;ReDim====>����һ���Ѿ����ڵ�����Ĵ�С
		$a_Nodes[$p][1] = "root" ;$a_Nodes00;$a_Nodes10

		$a_Nodes[$p][2] = _     ;$a_Nodes00;$a_Nodes10;$a_Nodes10;$a_Nodes11 ��Ĭ�Ϲ�ѡ�е����и���Ŀ (1/0),(��/��)
				IniRead($IniFile, $i, $i & ".Rootchoice", "")
		If $a_Nodes[$p][2] = 0 Then $Allchoice = 0 ;����һ�����Ŀ��ѡʱ��������Ŀ����Ŀ��ѡ
		If $a_Nodes[$p][2] = 1 Then $Allchoice = 1 ;����Ŀ��ѡʱ����Ŀȫѡ

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
				$a_Nodes[$p][2] = _    ;����Ĭ�Ϲ�ѡ����������Ŀ (1/0),(��/��)
						IniRead($IniFile, $i, _
						$i & "-" & $j & ".subchoice", "")
			EndIf
;~                                      Next
			$a_Nodes[$p][3] = _
					IniRead($IniFile, $i, _          ;��ȡ�ı�����������
					$i & "-" & $j & ".Name", "")
			$a_Nodes[$p][4] = $SwDir & "\" & _              ;�ļ���·����@ScriptDir�Ǻ���ر�д��������ܷ�������
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
	_GUICtrlTreeView_BeginUpdate($gu_TreeView1) ;��ʼ�ؼ�����,ֱ�� EndUpdate ����������
	Local $i
	For $i = 1 To UBound($a_Nodes, 1) - 1
		Local $Root
		If $a_Nodes[$i][1] = "root" Then
			$a_Nodes[$i][0] = _
					GUICtrlCreateTreeViewItem( _      ;��GUI�ϴ���һ�� TreeViewItem �ؼ�.
					$a_Nodes[$i][3], $gu_TreeView1) ;GUICtrlCreateTreeViewItem ( "�ı�", �б���ͼID )
			GUICtrlSetImage( _                                 ;����ָ���ؼ���λͼ��ͼ��
					$a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( �ؼ�ID, �ļ��� [, ͼ���� [, ͼ������]] )
			$Root = $a_Nodes[$i][0]
		Else
			$a_Nodes[$i][0] = _
					GUICtrlCreateTreeViewItem( _     ;��GUI�ϴ���һ�� TreeViewItem �ؼ�.
					$a_Nodes[$i][3], $Root) ; GUICtrlCreateTreeViewItem ( "�ı�", �б���ͼID )
			GUICtrlSetImage( _                               ;����ָ���ؼ���λͼ��ͼ��
					$a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( �ؼ�ID, �ļ��� [, ͼ���� [, ͼ������]] )
		EndIf
	Next
	Local $i
	For $i = UBound($a_Nodes, 1) - 1 To 1 Step -1
		If $a_Nodes[$i][2] = 1 Then
			_GUICtrlTreeView_SetChecked( _                ;������Ŀ��ѡ��ѡ��
					$gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_SetChecked(�ؼ����, ��Ŀ��� [, չ�����۵���־])
		EndIf


		If $a_Nodes[$i][1] = "root" And _
				$a_Nodes[$i][5] = 1 Then
			_GUICtrlTreeView_Expand( _                     ;չ�����۵�����Ŀ��ص������б�
					$gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_Expand(�ؼ����[, ��Ŀ��� = 0[, չ�����۵���־]])
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
					If _GUICtrlTreeView_GetChecked( _                ;������Ŀ��ѡ��ѡ��
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
				$Index = "0" & String($p) ;����ĳ���ʽ���ַ������
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
	Local Const $N = 4 ;ini�����ļ��������
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
				"δѡ���κ���ĿŶ!", 0, $gu_MainForm)
		Return 0
	EndIf

	Local $httpname, $username, $Http, $password, $usernamedecryption, $passworddecryption
	For $i = 1 To UBound($a_SwList, 1) - 1
		_DisplayloginProgress($a_SwList, $i) ;��ʾ���Ƿ�ִ�����
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
						$zc51 = "����վ�ҵ�һ��Դ��"
						MsgBox(0 + 64, " �L�ѡ��V�A�� ", $zc51, 3)
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
						$zc51 = '����վ�ҵڶ���Դ��'
						MsgBox(0 + 64, "�L�ѡ��V�A��", $zc51, 3)
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
								$oInput.value = "��½"
								_IEAction($oInput, "click")
							EndIf
						Next
						_IELoadWait($oIE)
;~
					Case $da12 = 0 And $z2 > 0
						$zc51 = '����վ�ҵ�����Դ��'
						MsgBox(0 + 64, " �L�ѡ��V�A�� ", $zc51, 3)
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
								$oInput.value = "��½"
								_IEAction($oInput, "click")
							EndIf
						Next
						_IELoadWait($oIE)

					Case Else
						$zc51 = "��վ�Ѿ���½���߲�������"
						MsgBox(0 + 64, " �L�ѡ��V�A�� ", $zc51, 3)
				EndSelect

		EndSelect
		Sleep(200)
	Next
	$s = StringReplace($s, "���ڵ�½... -->", "��½��� ===>")
	GUICtrlSetData($gu_List1, "", "")
	GUICtrlSetData($gu_List1, $s, $ds);�޸�ָ���ؼ������� ;GUICtrlSetData ( �ؼ�ID, ���� [, Ĭ��ֵ] )
	MsgBox(0 + 64, $gc_FormName, _
			"��վ��½����!", 0, $gu_MainForm)
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
			$s &= "��½��� ===> " & _
					"[" & $Index & "] " & $a_SwList[$i][0] & "|"
		ElseIf $i = $ii Then
			$ds = "���ڵ�½... --> " & _
					"[" & $Index & "] " & $a_SwList[$i][0]
			$s &= "���ڵ�½... --> " & _
					"[" & $Index & "] " & $a_SwList[$i][0] & "|"
		Else
			$s &= "[" & $Index & "] " & $a_SwList[$i][0] & "|"
		EndIf
		$p += 1
	Next
	$s = StringTrimRight($s, 1)
	GUICtrlSetData($gu_List1, "", "")
	GUICtrlSetData($gu_List1, $s, $ds);�޸�ָ���ؼ������� ;GUICtrlSetData ( �ؼ�ID, ���� [, Ĭ��ֵ] )
EndFunc   ;==>_DisplayloginProgress

Func Form1_1Close()
	Exit
EndFunc   ;==>Form1_1Close



;=============================================Ƥ��=========================================================
Func Skin($She)
	$dll = DllOpen(@ScriptDir & '\Skinshe\Skin.dll')
	DllCall($dll, "int", "SkinH_AttachEx", "str", @ScriptDir & '\Skinshe\' & $She, "str", "mhgd")
	DllCall($dll, "int", "SkinH_SetAero", "int", 1)
EndFunc   ;==>Skin

;=============================================����Ϣ����=========================================================
Func formtool()
	Local $Http = InputBox('����Ϣ����', '��������ַ')
	If @error Then Return
	If $Http = "" Then Return
	Local $oForms, $oInputs, $Forms, $oQuerys, $oFormshu, $Http, $oIE
	$oIE = _IECreate($Http)
	$oForms = _IEFormGetCollection($oIE)
	$oFormshu = "���ҳ���Ϲ���" & @extended & "����"
	MsgBox(0, "����Ϣ", "���ҳ���Ϲ���" & @extended & "����")
	FileWriteLine("����Ϣ.txt", '_______________________________________________________________________________')
	FileWriteLine("����Ϣ.txt", $Http & @CRLF & @CRLF)
	FileWriteLine("����Ϣ.txt", $oFormshu & @CRLF & @CRLF)
	$oInputs = _IETagNameGetCollection($oIE, "INPUT")
	For $oInput In $oInputs
		FileWriteLine("����Ϣ.txt", 'Input === ' & $oInput.name)
		FileWriteLine("����Ϣ.txt", "   id === " & $oInput.id)
		FileWriteLine("����Ϣ.txt", " type === " & $oInput.type & @CRLF & @CRLF)
	Next
	For $Form In $oForms
		FileWriteLine("����Ϣ.txt", 'Form === ' & $Form.name & @CRLF & @CRLF)
		$oQuerys = _IEFormElementGetCollection($Form)
		For $Query In $oQuerys
			FileWriteLine("����Ϣ.txt", "�ؼ� === " & $Query.name)
			FileWriteLine("����Ϣ.txt", "  id === " & $Query.id)
			FileWriteLine("����Ϣ.txt", "type === " & $Query.type & @CRLF & @CRLF)
		Next
	Next
	FileWriteLine("����Ϣ.txt", '_______________________________________________________________________________' & @CRLF & @CRLF)
	_IEQuit($oIE)
EndFunc   ;==>formtool

;===============================================�������====================================================================
Func Encryptiontool()
	Opt("MustDeclareVars", 1)
	Opt("TrayIconHide", 1)
	Local $WinMainv, $EditText, $InputPass, $InputLevel, $UpDownLevel, $EncryptButton, $DecryptButton, $string
	Local $WinMain = GUICreate('���ܹ���', 400, 405)
	$EditText = GUICtrlCreateEdit('', 5, 5, 380, 350)
	$InputPass = GUICtrlCreateInput('', 5, 360, 100, 20, 0x21)
	$InputLevel = GUICtrlCreateInput(1, 110, 360, 50, 20, 0x2001)
	$UpDownLevel = GUICtrlSetLimit(GUICtrlCreateUpdown($InputLevel), 10, 1)
	$EncryptButton = GUICtrlCreateButton('����', 170, 360, 105, 35)
	$DecryptButton = GUICtrlCreateButton('����', 285, 360, 105, 35)
	GUICtrlCreateLabel('����', 5, 385)
	GUICtrlCreateLabel('�ȼ�', 110, 385)
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
