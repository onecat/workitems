#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <String.au3>
#include <Array.au3>
#include <Clipboard.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ###
$Form1 = GUICreate("ͼƬ���������� by ilv", 482, 322, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "Form1PRIMARYDOWN")
;~ $GUI_EVENT_CLOSE ---------- ���ڹر�
;~ $GUI_EVENT_MINIMIZE ------- ������С��
;~ $GUI_EVENT_RESTORE -------- ���ڻ�ԭ
;~ $GUI_EVENT_MAXIMIZE ------- �������
;~ $GUI_EVENT_PRIMARYDOWN ---- ����������
;~ $GUI_EVENT_PRIMARYUP ------ �������ͷ�
;~ $GUI_EVENT_SECONDARYDOWN -- ����Ҽ�����
;~ $GUI_EVENT_SECONDARYUP ---- ����Ҽ��ͷ�
;~ $GUI_EVENT_MOUSEMOVE ------ ����ƶ�
;~ $GUI_EVENT_RESIZED -------- ������С
;~ $GUI_EVENT_DROPPED -------- �϶�����

$input1 = GUICtrlCreateInput("�������ַ��ID", 22, 16, 369, 21)
GUICtrlSetColor(-1, 0x800080)
GUICtrlSetData($input1, "http://www.28lu.com/cy/182419718_2.html")
;GUICtrlSetOnEvent(-1, "input1Change")
$Button1 = GUICtrlCreateButton("����", 415, 14, 41, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
;~ _GUICtrlStatusBar_SetSimple($StatusBar1, True);��δ��� �ŵ��˺��� ��� ������ʾ״̬��������
;~ _GUICtrlStatusBar_SetText($StatusBar1, "������")
;~ _GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)
;GUICtrlCreateLabel()
GUICtrlSetState(-1, $GUI_FOCUS)
$MenuItem0 = GUICtrlCreateMenu("ѡ��(&Z)")
$MenuItem4 = GUICtrlCreateMenuItem("���񴴽����Զ�����", $MenuItem0)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "MenuItem4Click")
$MenuItem1 = GUICtrlCreateMenuItem("������������", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem2 = GUICtrlCreateMenuItem("�������", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("����", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$ListView1 = GUICtrlCreateListView("", 12, 56, 457, 217, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
_GUICtrlListView_AddColumn($ListView1, "����", 150);�����
_GUICtrlListView_AddColumn($ListView1, "Դ��ַ", 230)
_GUICtrlListView_AddColumn($ListView1, "״̬", 80)
;~ $a=_GUICtrlListView_AddItem($ListView1,"test");�����Ŀ
;~ _GUICtrlListView_AddSubItem($ListView1,$a,"test",2);�������Ŀ
GUICtrlSetOnEvent(-1, "ListView1Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;��δ��� �ŵ������� ��� ������ʾ״̬��������
_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "������");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)

While 1
	Sleep(100)
WEnd
Func Button1Click()
	Local $dir = @ScriptDir & "\pic\", $str = GUICtrlRead($input1), $jb[0], $y, $x, $n
	If DirGetSize($dir) = -1 Then DirCreate($dir)
	If StringRegExp($str, "http://www.28lu.com.+\d{9,12}") Then
		_GUICtrlStatusBar_SetText($StatusBar1, "��ȡ��Ϣ...")
		Sleep(300)
		$su = StringRegExp($str, "http://www.28lu.com.+\d{9,12}", 3)[0]
		$Source = GetSource($str)
		ConsoleWrite($str & @CRLF)
		;FileWrite("1.txt", $Source)
		$nu = _StringBetween($Source, "��", "ҳ")[0]
		$ti = _StringBetween($Source, "<title>", "-28·")[0]

		;ConsoleWrite($su & @CRLF)
		;ConsoleWrite($nu & @CRLF)
		;ConsoleWrite($ti & @CRLF)
		
		
		If DirGetSize($dir & "\" & $ti) = -1 Then
			DirCreate($dir & "\" & $ti)
		Else
			_GUICtrlStatusBar_SetText($StatusBar1, "")
			Sleep(300)
			_GUICtrlStatusBar_SetText($StatusBar1, "��ǰ�����Ѵ���")
			Sleep(300)
			_GUICtrlStatusBar_SetText($StatusBar1, "")
			Beep(2500, 500)
			_GUICtrlStatusBar_SetText($StatusBar1, "��ǰ�����Ѵ���")
			
			Return
		EndIf
		
		
		$x = _GUICtrlListView_AddItem($ListView1, $ti)
		_GUICtrlListView_AddSubItem($ListView1, $x, $su, 1)
		_GUICtrlListView_AddSubItem($ListView1, $x, "δ����", 2)
		Switch GUICtrlRead($MenuItem4)
			Case 65
				;_GUICtrlStatusBar_SetText($StatusBar1, "���񴴽����!")
				
				_GUICtrlStatusBar_SetText($StatusBar1, "׼������...")
				_GUICtrlListView_AddSubItem($ListView1, $x, "��������", 2)
				$str = ""
				For $n = 1 To $nu
					
					If $n = 1 Then
						$picu = StringRegExp(GetSource($su & ".html"), 'src="(/UploadFiles.+?jpg)"', 3)
					Else
						$picu = StringRegExp(GetSource($su & "_" & $n & ".html"), 'src="(/UploadFiles.+?jpg)"', 3)
					EndIf
					
					Sleep(100)
					
					For $m = 0 To UBound($picu) - 1
						
						$y = $n * 5 + $m + 1 - 5
						_GUICtrlStatusBar_SetText($StatusBar1, "���ڴ������ص�" & $y & "��ͼƬ")
						$a = InetGet("http://www.28lu.com" & $picu[$m], $dir & "\" & $ti & "\" & $y & ".jpg", 0, 1)
						$str &= $y & " = http://www.28lu.com" & $picu[$m] & @CRLF
						_ArrayAdd($jb, $a)
						
						Sleep(500)
						
					Next
					
				Next
				FileDelete($dir & "\" & $ti & "\ͼƬ�б�.txt")
				FileWrite($dir & "\" & $ti & "\ͼƬ�б�.txt", $str)
				_GUICtrlStatusBar_SetText($StatusBar1, "�ȴ����...")
				While 1
					
					$m = 1
					Sleep(100)
					For $n = 0 To $y - 1
						$m *= InetGetInfo($jb[$n])[2]
					Next
					
					
					If $m Then ExitLoop
					
				WEnd
				
				Beep()
				_GUICtrlListView_AddSubItem($ListView1, $x, "�������", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "��ǰ�����������/��" & $y & "��ͼƬ")
				
			Case 68
				_GUICtrlListView_AddSubItem($ListView1, $x, "���ڴ���", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "׼����������...")
				
				$str = ""
				For $n = 1 To $nu
					
					If $n = 1 Then
						$picu = StringRegExp(GetSource($su & ".html"), '/UploadFiles.+?jpg', 3)
					Else
						$picu = StringRegExp(GetSource($su & "_" & $n & ".html"), '/UploadFiles.+?jpg', 3)
					EndIf
					
					Sleep(100)
					
					For $m = 0 To UBound($picu) - 1
						
						$y = $n * 5 + $m + 1 - 5
						_GUICtrlStatusBar_SetText($StatusBar1, "���ڴ������ص�" & $y & "��ͼƬ")
						$str &= $y & " = http://www.28lu.com" & $picu[$m] & @CRLF

						Sleep(100)
						
					Next
					
				Next
				FileDelete($dir & "\" & $ti & "\ͼƬ�б�.txt")
				FileWrite($dir & "\" & $ti & "\ͼƬ�б�.txt", $str)

				Beep()
				_GUICtrlListView_AddSubItem($ListView1, $x, "�������", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "��ǰ���񴴽����/��" & $y & "��ͼƬ")
				
				
		EndSwitch
		
		
		
	Else
		
		MsgBox(16, "��ʾ", "�������ҳ��ַ��Ч��")
		
	EndIf

EndFunc   ;==>Button1Click
Func Form1PRIMARYDOWN()
	$Pos = GUIGetCursorInfo($Form1);��ȡ���λ��
	If $Pos[4] = $input1 And GUICtrlRead($input1) = "�������ַ��ID" Then
		GUICtrlSetData($input1, "")
		
	EndIf

EndFunc   ;==>Form1PRIMARYDOWN
Func Form1Close()

	Exit
EndFunc   ;==>Form1Close
Func ListView1Click()

EndFunc   ;==>ListView1Click
Func MenuItem1Click()
	$re = MsgBox(1 + 64, "������������", "ע�⣺" & @CRLF & '���"ȷ��"--���ı��ļ���ȡ����' & @CRLF & _
			'���"ȡ��"--�Ӽ������ȡ����' & @CRLF & "*��ҳ��ַһ��ÿ�� ��Ҫ�п���*")
	Switch $re
		Case 1
			$lujing = FileOpenDialog("ѡ����е�ַ�ı��ļ�", @WorkingDir, "�ı��ļ� (*.txt)")
			If @error Then Return
			$strb = FileReadToArray($lujing)
			If StringInStr($strb[0], "http://www.28lu.com") = 0 Then
				MsgBox(16, "��ʾ", "�ı��ļ�δ������Ч���ı���")
			Else
				For $n1 = 0 To UBound($strb) - 1
					
					
					If StringRegExp($strb[$n1], "http://www.28lu.com.+html") Then
						GUICtrlSetData($input1, StringRegExp($strb[$n1], "http://www.28lu.com.+html", 3)[0])
						Button1Click()
					EndIf
					
					Sleep(100)
					
				Next
				_GUICtrlStatusBar_SetText($StatusBar1, "�������񴴽����/��" & $n1+1& "��")
			EndIf
			
			
			
			
		Case 2
			
			If StringInStr(_ClipBoard_GetData(), "http://www.28lu.com") = 0 Then
				MsgBox(16, "��ʾ", "������δ������Ч���ı���")
				
				
				
			Else
				$stra = StringSplit(_ClipBoard_GetData(), @CRLF)
				For $n2 = 1 To $stra[0]
					If StringRegExp($stra[$n2], "http://www.28lu.com.+html") Then
						GUICtrlSetData($input1, StringRegExp($stra[$n2], "http://www.28lu.com.+html", 3)[0])
						Button1Click()
					EndIf
				Next
				_GUICtrlStatusBar_SetText($StatusBar1, "�������񴴽����/��" & $n2& "��")
			EndIf
			
			
			
	EndSwitch

	
	
	

EndFunc   ;==>MenuItem1Click
Func MenuItem2Click()

EndFunc   ;==>MenuItem2Click
Func MenuItem3Click()
	MsgBox(64, "����", "ͼƬ�������� by ilv" & @CRLF & "QQ��914004582")
EndFunc   ;==>MenuItem3Click
Func MenuItem4Click()
	If GUICtrlRead($MenuItem4) = 65 Then
		GUICtrlSetState($MenuItem4, 68)
	Else
		GUICtrlSetState($MenuItem4, 65)
	EndIf
	
	;ConsoleWrite(GUICtrlRead($MenuItem4))
EndFunc   ;==>MenuItem4Click
;======================================================================
Func GetSource($url)
	Local $n3
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	Do
		$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
		If $return Then ExitLoop
		$n3 += 1000;�жϳ�ʱʱ��
		Sleep(1000)
	Until $n3 > 1000
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;======================================================================
