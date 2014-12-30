#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_UseUpx=n
#PRE_Compile_Both=y
#PRE_Res_Comment=图片批量下载器 测试版 by ilv
#PRE_Res_Description=图片批量下载器 测试版 by ilv
#PRE_Res_Fileversion=1.0
#PRE_Res_LegalCopyright=（C）ilv@2014
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <String.au3>
#include <Array.au3>
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
GUICtrlSetData($input1, "http://www.28lu.com/yanyi/2242282858_26.html")
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
	Local $dir = @ScriptDir & "\pic\", $str = GUICtrlRead($input1), $jb[0], $y, $n
	If DirGetSize($dir) = -1 Then DirCreate($dir)
	If StringRegExp($str, "http://www.28lu.com.+\d{9,12}") Then
		_GUICtrlStatusBar_SetText($StatusBar1, "获取信息...")
		Sleep(300)
		Local $su = StringRegExp($str, "http://www.28lu.com.+\d{9,12}", 3)[0], _
				$Source = GetSource($str), $nu = _StringBetween($Source, "共", "页")[0], _
				$ti = _StringBetween($Source, "<title>", "-28路")[0]
		;ConsoleWrite($su & @CRLF)
		;ConsoleWrite($nu & @CRLF)
		;ConsoleWrite($ti & @CRLF)
		;FileWrite("1.txt", $su)
		$x = _GUICtrlListView_AddItem($ListView1, $ti)
		_GUICtrlListView_AddSubItem($ListView1, $x, $su, 1)
		_GUICtrlListView_AddSubItem($ListView1, $x, "未下载", 2)
		DirCreate($dir & "\" & $ti)
		_GUICtrlStatusBar_SetText($StatusBar1, "任务创建完成!")
		Sleep(300)
		_GUICtrlStatusBar_SetText($StatusBar1, "准备下载...")
		_GUICtrlListView_AddSubItem($ListView1, $x, "正在下载", 2)
		For $n = 1 To $nu
			
			If $n = 1 Then
				$picu = StringRegExp(GetSource($su & ".html"), 'img src="(/UploadFiles.+jpg)"', 3)
			Else
				$picu = StringRegExp(GetSource($su & "_" & $n & ".html"), 'img src="(/UploadFiles.+jpg)"', 3)
			EndIf
			
			Sleep(100)
			
			For $m = 0 To UBound($picu) - 1
				
				$y = $n * 5 + $m + 1 - 5
				_GUICtrlStatusBar_SetText($StatusBar1, "正在创建下载第" & $y & "个图片")
				$a = InetGet("http://www.28lu.com" & $picu[$m], $dir & "\" & $ti & "\" & $y & ".jpg", 0, 1)
				_ArrayAdd($jb, $a)
				
				Sleep(100)
				
			Next
			
		Next
		_GUICtrlStatusBar_SetText($StatusBar1, "等待完成...")
		While 1
			$m = 1
			
			For $n = 0 To $y - 1
				$m *= InetGetInfo($jb[$n])[2]
			Next
			
			
			If $m Then ExitLoop
			
		WEnd
		Sleep(300)
		Beep()
		_GUICtrlListView_AddSubItem($ListView1, $x, "下载完成", 2)
		_GUICtrlStatusBar_SetText($StatusBar1, "下载完成/共" & $y & "个图片")
		
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

EndFunc   ;==>MenuItem1Click
Func MenuItem2Click()

EndFunc   ;==>MenuItem2Click
Func MenuItem3Click()
	MsgBox(64, "关于", "图片批量下载 by ilv" & @CRLF & "QQ：914004582")
EndFunc   ;==>MenuItem3Click

;======================================================================
Func GetSource($url)
	Local $n
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	Do
		$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
		If $return Then ExitLoop
		$n += 1000;判断超时时间
		Sleep(1000)
	Until $n > 1000
	Return ($return)
EndFunc   ;==>GetSource
;======================================================================
