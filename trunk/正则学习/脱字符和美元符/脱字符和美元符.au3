#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiStatusBar.au3>
#Region ### START Koda GUI section ### Form=
Local $str, $n
$path = @ScriptDir & "\源代码.htm"
$Form1 = GUICreate("正则", 615, 450, 192, 124)
$Input1 = GUICtrlCreateInput('(?m)^<a href=".+?html">.+?</a>$', 120, 340, 305, 21);正则文本 加了(?m)多行模式选项
$Edit1 = GUICtrlCreateEdit("", 40, 48, 513, 280)
;GUICtrlSetData(-1, bb($path))
$Button1 = GUICtrlCreateButton("正则", 160, 384, 273, 33)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "就绪！");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			zz($str, $n)
			GUICtrlSetData($Edit1,$str)
			;MsgBox(0,"行数",$n & " 行")
			_GUICtrlStatusBar_SetText($StatusBar1, " 总共" &  $n & "行")
	EndSwitch
WEnd

Func bb($iDIR)
	$sFile = FileOpen($iDIR, 0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc   ;==>bb

Func zz(ByRef $str, ByRef $n)
	$str = ""
	Local $str1 = bb($path), $str2 = GUICtrlRead($Input1)
	If StringRegExp($str1, $str2) Then;加个判断 防止不匹配时直接退出
		$h = StringRegExp($str1, $str2, 3);第三个参数选择3 是全局匹配  返回的是数组
		
		;注意：查看au3的帮助  多行模式 需要开启才能匹配 以下是说明：
		;(?m) 多行: ^ 与 $ 匹配数据内的换行符. 默认多行是关闭的. 
		
		;_ArrayDisplay($h);列表视图查看数组 便于调试
		;ConsoleWrite($h[0]);输出调试文本  便于调试
		;MsgBox(0, "", $h[0])
	Else
		MsgBox(0, "", "不匹配")
	EndIf
	
		For $n = 0 To UBound($h) - 1
			$str &= $h[$n] & @CRLF
		Next
	Return $str

EndFunc   ;==>test