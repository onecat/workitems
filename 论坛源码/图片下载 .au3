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
$Form1 = GUICreate("图片批量下载器 by ilv", 482, 322, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "Form1PRIMARYDOWN")
;~ $GUI_EVENT_CLOSE ---------- 窗口关闭
;~ $GUI_EVENT_MINIMIZE ------- 窗口最小化
;~ $GUI_EVENT_RESTORE -------- 窗口还原
;~ $GUI_EVENT_MAXIMIZE ------- 窗口最大化
;~ $GUI_EVENT_PRIMARYDOWN ---- 鼠标左键按下
;~ $GUI_EVENT_PRIMARYUP ------ 鼠标左键释放
;~ $GUI_EVENT_SECONDARYDOWN -- 鼠标右键按下
;~ $GUI_EVENT_SECONDARYUP ---- 鼠标右键释放
;~ $GUI_EVENT_MOUSEMOVE ------ 鼠标移动
;~ $GUI_EVENT_RESIZED -------- 调整大小
;~ $GUI_EVENT_DROPPED -------- 拖动操作

$input1 = GUICtrlCreateInput("请输入地址或ID", 22, 16, 369, 21)
GUICtrlSetColor(-1, 0x800080)
GUICtrlSetData($input1, "http://www.28lu.com/cy/182419718_2.html")
;GUICtrlSetOnEvent(-1, "input1Change")
$Button1 = GUICtrlCreateButton("创建", 415, 14, 41, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
;~ _GUICtrlStatusBar_SetSimple($StatusBar1, True);这段代码 放到了后面 解决 不能显示状态栏的问题
;~ _GUICtrlStatusBar_SetText($StatusBar1, "就绪！")
;~ _GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)
;GUICtrlCreateLabel()
GUICtrlSetState(-1, $GUI_FOCUS)
$MenuItem0 = GUICtrlCreateMenu("选项(&Z)")
$MenuItem4 = GUICtrlCreateMenuItem("任务创建后自动下载", $MenuItem0)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "MenuItem4Click")
$MenuItem1 = GUICtrlCreateMenuItem("创建批量任务", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem2 = GUICtrlCreateMenuItem("载入进度", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("关于", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$ListView1 = GUICtrlCreateListView("", 12, 56, 457, 217, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
_GUICtrlListView_AddColumn($ListView1, "标题", 150);添加列
_GUICtrlListView_AddColumn($ListView1, "源地址", 230)
_GUICtrlListView_AddColumn($ListView1, "状态", 80)
;~ $a=_GUICtrlListView_AddItem($ListView1,"test");添加项目
;~ _GUICtrlListView_AddSubItem($ListView1,$a,"test",2);添加子项目
GUICtrlSetOnEvent(-1, "ListView1Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;这段代码 放到了这里 解决 不能显示状态栏的问题
_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "就绪！");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)

While 1
	Sleep(100)
WEnd
Func Button1Click()
	Local $dir = @ScriptDir & "\pic\", $str = GUICtrlRead($input1), $jb[0], $y, $x, $n
	If DirGetSize($dir) = -1 Then DirCreate($dir)
	If StringRegExp($str, "http://www.28lu.com.+\d{9,12}") Then
		_GUICtrlStatusBar_SetText($StatusBar1, "获取信息...")
		Sleep(300)
		$su = StringRegExp($str, "http://www.28lu.com.+\d{9,12}", 3)[0]
		$Source = GetSource($str)
		ConsoleWrite($str & @CRLF)
		;FileWrite("1.txt", $Source)
		$nu = _StringBetween($Source, "共", "页")[0]
		$ti = _StringBetween($Source, "<title>", "-28路")[0]

		;ConsoleWrite($su & @CRLF)
		;ConsoleWrite($nu & @CRLF)
		;ConsoleWrite($ti & @CRLF)
		
		
		If DirGetSize($dir & "\" & $ti) = -1 Then
			DirCreate($dir & "\" & $ti)
		Else
			_GUICtrlStatusBar_SetText($StatusBar1, "")
			Sleep(300)
			_GUICtrlStatusBar_SetText($StatusBar1, "当前任务已存在")
			Sleep(300)
			_GUICtrlStatusBar_SetText($StatusBar1, "")
			Beep(2500, 500)
			_GUICtrlStatusBar_SetText($StatusBar1, "当前任务已存在")
			
			Return
		EndIf
		
		
		$x = _GUICtrlListView_AddItem($ListView1, $ti)
		_GUICtrlListView_AddSubItem($ListView1, $x, $su, 1)
		_GUICtrlListView_AddSubItem($ListView1, $x, "未下载", 2)
		Switch GUICtrlRead($MenuItem4)
			Case 65
				;_GUICtrlStatusBar_SetText($StatusBar1, "任务创建完成!")
				
				_GUICtrlStatusBar_SetText($StatusBar1, "准备下载...")
				_GUICtrlListView_AddSubItem($ListView1, $x, "正在下载", 2)
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
						_GUICtrlStatusBar_SetText($StatusBar1, "正在创建下载第" & $y & "个图片")
						$a = InetGet("http://www.28lu.com" & $picu[$m], $dir & "\" & $ti & "\" & $y & ".jpg", 0, 1)
						$str &= $y & " = http://www.28lu.com" & $picu[$m] & @CRLF
						_ArrayAdd($jb, $a)
						
						Sleep(500)
						
					Next
					
				Next
				FileDelete($dir & "\" & $ti & "\图片列表.txt")
				FileWrite($dir & "\" & $ti & "\图片列表.txt", $str)
				_GUICtrlStatusBar_SetText($StatusBar1, "等待完成...")
				While 1
					
					$m = 1
					Sleep(100)
					For $n = 0 To $y - 1
						$m *= InetGetInfo($jb[$n])[2]
					Next
					
					
					If $m Then ExitLoop
					
				WEnd
				
				Beep()
				_GUICtrlListView_AddSubItem($ListView1, $x, "下载完成", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "当前任务下载完成/共" & $y & "个图片")
				
			Case 68
				_GUICtrlListView_AddSubItem($ListView1, $x, "正在创建", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "准备创建下载...")
				
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
						_GUICtrlStatusBar_SetText($StatusBar1, "正在创建下载第" & $y & "个图片")
						$str &= $y & " = http://www.28lu.com" & $picu[$m] & @CRLF

						Sleep(100)
						
					Next
					
				Next
				FileDelete($dir & "\" & $ti & "\图片列表.txt")
				FileWrite($dir & "\" & $ti & "\图片列表.txt", $str)

				Beep()
				_GUICtrlListView_AddSubItem($ListView1, $x, "创建完成", 2)
				_GUICtrlStatusBar_SetText($StatusBar1, "当前任务创建完成/共" & $y & "个图片")
				
				
		EndSwitch
		
		
		
	Else
		
		MsgBox(16, "提示", "输入的网页地址无效！")
		
	EndIf

EndFunc   ;==>Button1Click
Func Form1PRIMARYDOWN()
	$Pos = GUIGetCursorInfo($Form1);获取鼠标位置
	If $Pos[4] = $input1 And GUICtrlRead($input1) = "请输入地址或ID" Then
		GUICtrlSetData($input1, "")
		
	EndIf

EndFunc   ;==>Form1PRIMARYDOWN
Func Form1Close()

	Exit
EndFunc   ;==>Form1Close
Func ListView1Click()

EndFunc   ;==>ListView1Click
Func MenuItem1Click()
	$re = MsgBox(1 + 64, "创建批量任务", "注意：" & @CRLF & '点击"确认"--从文本文件读取创建' & @CRLF & _
			'点击"取消"--从剪辑版读取创建' & @CRLF & "*网页地址一行每条 不要有空行*")
	Switch $re
		Case 1
			$lujing = FileOpenDialog("选择多行地址文本文件", @WorkingDir, "文本文件 (*.txt)")
			If @error Then Return
			$strb = FileReadToArray($lujing)
			If StringInStr($strb[0], "http://www.28lu.com") = 0 Then
				MsgBox(16, "提示", "文本文件未包含有效的文本行")
			Else
				For $n1 = 0 To UBound($strb) - 1
					
					
					If StringRegExp($strb[$n1], "http://www.28lu.com.+html") Then
						GUICtrlSetData($input1, StringRegExp($strb[$n1], "http://www.28lu.com.+html", 3)[0])
						Button1Click()
					EndIf
					
					Sleep(100)
					
				Next
				_GUICtrlStatusBar_SetText($StatusBar1, "批量任务创建完成/共" & $n1+1& "项")
			EndIf
			
			
			
			
		Case 2
			
			If StringInStr(_ClipBoard_GetData(), "http://www.28lu.com") = 0 Then
				MsgBox(16, "提示", "剪辑版未包含有效的文本行")
				
				
				
			Else
				$stra = StringSplit(_ClipBoard_GetData(), @CRLF)
				For $n2 = 1 To $stra[0]
					If StringRegExp($stra[$n2], "http://www.28lu.com.+html") Then
						GUICtrlSetData($input1, StringRegExp($stra[$n2], "http://www.28lu.com.+html", 3)[0])
						Button1Click()
					EndIf
				Next
				_GUICtrlStatusBar_SetText($StatusBar1, "批量任务创建完成/共" & $n2& "项")
			EndIf
			
			
			
	EndSwitch

	
	
	

EndFunc   ;==>MenuItem1Click
Func MenuItem2Click()

EndFunc   ;==>MenuItem2Click
Func MenuItem3Click()
	MsgBox(64, "关于", "图片批量下载 by ilv" & @CRLF & "QQ：914004582")
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
		$n3 += 1000;判断超时时间
		Sleep(1000)
	Until $n3 > 1000
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource
;======================================================================
