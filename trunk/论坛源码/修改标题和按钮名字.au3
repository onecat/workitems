#include <GuiButton.au3>
Global Const $GUI_EVENT_CLOSE=-3
Opt("GUIOnEventMode",1)
$Form1 = GUICreate("测试", 615, 438, 192, 124)
;GUICreate("123")
$Form1 = GUICreate("测试", 615, 438, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE,"main")
$S=GUICtrlCreateButton("qwe","20","30","40","50")
GUICtrlSetOnEvent($s,"main")
$B = GUICtrlCreateButton("Button1", 80, 176, 105, 33)
GUICtrlSetOnEvent($B,"main")
GUISetState()
While 1
	Sleep(1000)
WEnd
Func main()
	Switch @GUI_CtrlId
		Case $GUI_EVENT_CLOSE
			Exit
		Case $s
			$NEWstring1 = InputBox("请输入修改后的名字","将“qwe”修改为：","","","260","150","233","275")
			_GUICtrlButton_SetText($S,$NEWstring1)
		Case $B
			$NEWstring2 = InputBox("请输入修改后的名字","将“qwe”修改为：","","","260","150","233","275")
			WinSetTitle($Form1,"",$NEWstring2)
			
	EndSwitch
EndFunc


