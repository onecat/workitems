#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiEdit.au3>
Global $Label1,$Label2,$Label3,$Label4
Global $caput_text = False,$Title,$Name0
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("*** 调试操作向导 ***", 401, 170, (@DesktopWidth - 401) / 2, @DesktopHeight - 230)
	GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Edit1 = GUICtrlCreateEdit("", 2, 17, 396, 90, BitOR($ES_AUTOVSCROLL, $WS_HSCROLL, $WS_VSCROLL), _
		BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
	GUICtrlSetData(-1, "")
	GUICtrlSetOnEvent(-1, "Edit1Change")
$Input1 = GUICtrlCreateInput("窗口标题", 8, 120, 185, 17)
$Input2 = GUICtrlCreateInput("控件 ID", 208, 120, 185, 17)

$Label1 = GUICtrlCreateLabel("点击 [调试],观察光标的停留位置", 5, 2, 390, 15, $SS_CENTER)
	GUICtrlSetColor(-1, 0xFF0000)
GUICtrlCreateLabel("水平:", 8, 150, 31, 17)
GUICtrlCreateLabel("垂直:", 112, 150, 31, 17)
$Input3 = GUICtrlCreateInput("15", 40, 147, 50, 17)
$Input4 = GUICtrlCreateInput("35", 144, 147, 50, 17)
$Button1 = GUICtrlCreateButton("调 试", 256, 145, 50, 20)
	GUICtrlSetOnEvent(-1, "Button1Click")
$Button2 = GUICtrlCreateButton("确 认", 336, 145, 50, 20)
	GUICtrlSetOnEvent(-1, "Button2Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Edit1Change()

EndFunc
Func Form1Close()
	Exit
EndFunc

Func Button1Click() ; [调试] 按钮操作;文本在 '调试' 与 '没有' 间切换
	If $caput_text = False Then _caput_text()
	$Title = GUICtrlRead($Input1);读取窗口标题
	$Name0 = GUICtrlRead($Input2);读取控件 ID
	GUICtrlSetState($Button2, $GUI_HIDE);隐藏
	# 读取 $Button1 按钮文本, 确定后续操作
	Local $GetText = ControlGetText("*** 调试操作向导 ***", "", $Button1)	
	If $GetText = '调 试' Then
		$X = GUICtrlRead($Input3)
		$Y = GUICtrlRead($Input4)		
		$Title = $Title ;换为安装软件的标题！
		WinWait($Title, "")
		If Not WinActivate($Title, "") Then WinActivate($Title, "")
		WinWaitActive($Title, "")
		$WinPosArray = WinGetPos($Title)
		$TNewCheckListBoxArray = ControlGetPos($Title, "", $Name0)
		$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]
		$Height = $WinPosArray[1] + $TNewCheckListBoxArray[1]
		MouseClick("left", $Width + $X, $Height + $Y) ;执行鼠标点击
		_enquiry_Ok();转到 调试询问
	ElseIf $GetText = '未点中' Then
		_enquiry_Nay();转到 调试询问
	ElseIf $GetText = '没有了' Then
		WinClose("*** 调试操作向导 ***");关闭向导窗口
	EndIf
EndFunc   ;==>_Button1
Func Button2Click() ; [调试] 按钮操作;文本在 '确认' 与 '点中' 或 '还有' 间切换
	# 读取 $Button2 按钮文本, 确定后续操作
	Local $GetText02 = ControlGetText("*** 调试操作向导 ***", "", $Button2)
	If $GetText02 = '确 认' Then

	ElseIf $GetText02 = '点中了' Then
		$X = ""
		$Y = ""
		$X = GUICtrlRead($Input3)
		$Y = GUICtrlRead($Input4)
		_GUICtrlEdit_AppendText($Edit1, 'MouseClick ( "left", $Width + ' & $X & ', $Height + ' & $Y & ' )' & @CRLF);写入主窗编辑框
		# 修改标签01的文本
		ControlSetText("*** 调试操作向导 ***", "", $Label1, "还有选项需调试吗？")
		# 修改 '调试' 按钮文本
		ControlSetText("*** 调试操作向导 ***", "", $Button2, "还 有")
		# 修改 '调试' 按钮文本
		ControlSetText("*** 调试操作向导 ***", "", $Button1, "没有了")
	ElseIf $GetText02 = '还 有' Then
		# 隐藏 $Input3 	$Label3 水平调整组件
		GUICtrlSetState($Input3, $GUI_HIDE);隐藏
		GUICtrlSetState($Label3, $GUI_HIDE);隐藏
		GUICtrlSetState($Button2, $GUI_HIDE);隐藏
		# 修改 $Button1 为 '调试'
		ControlSetText("*** 调试操作向导 ***", "", $Button1, "调 试")
		_enquiry_Nay()
	EndIf
EndFunc   ;==>_Button2
Func _enquiry_Ok() ;按钮文本 = 调试 的调试询问
	;# 修改标签01的文本
	ControlSetText("*** 调试操作向导 ***", "", $Label1, "光标点中目标了吗？")
	# 修改 '调试' 按钮文本
	ControlSetText("*** 调试操作向导 ***", "", $Button1, "未点中")
	# 显示 '确认' 按钮
	GUICtrlSetState($Button2, $GUI_SHOW)
	ControlSetText("*** 调试操作向导 ***", "", $Button2, "点中了")
EndFunc   ;==>_enquiry_Ok
Func _enquiry_Nay() ;按钮文本 = 没有 的调试询问
	# 修改 '调试' 按钮文本
	ControlSetText("*** 调试操作向导 ***", "", $Button1, "调 试")
	# 修改标签01的文本
	ControlSetText("*** 调试操作向导 ***", "", $Label1, "再次输入适当的垂直参数;点击 [调试]")
	# 显示 $Button2 按钮
	GUICtrlSetState($Button2, $GUI_HIDE)
EndFunc   ;==>_enquiry_Nay
#EndRegion  "一控多选"
Func _caput_text()
	$Title = GUICtrlRead($Input1);读取窗口标题
	$Name0 = GUICtrlRead($Input2);读取控件 ID	
	GUICtrlSetData($Edit1, '	WinWait( "' & $Title & '" )' _
			 & @CRLF & '	If Not WinActivate ( "' & $Title & '","" ) Then WinActivate ( "' & $Title & '","" )' _
			 & @CRLF & '	WinWaitActive ( "' & $Title & '","" )' _
			 & @CRLF & '	$WinPosArray = WinGetPos ( "' & $Title & '" )' & @CRLF, 1)
	GUICtrlSetData($Edit1, '	$WinPosArray = WinGetPos ( "' & $Title & '" )' _
			 & @CRLF & '	$TNewCheckListBoxArray = ControlGetPos ( "' & $Title & '", "", ' & '"' & $Name0 & '" )' _
			 & @CRLF & '	$Width = $WinPosArray[0] + $TNewCheckListBoxArray[0]' _
			 & @CRLF & '	$Height =  $WinPosArray[1] + $TNewCheckListBoxArray[1]' & @CRLF, 1)
	$caput_text = True	
	;Button1Click()	
EndFunc	