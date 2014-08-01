#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=DocSwf.ico
#PRE_Outfile=DS文库服务端[1314注册版].exe
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $str = "1S8LX7HT42D5GI39BJMOQORCYFZUEVWN6KAP"  
$Form1 = GUICreate("DS文库服务端[1314注册版]", 275, 153, 796, 332)
$Input1 = GUICtrlCreateInput("", 24, 40, 209, 21)
$Label1 = GUICtrlCreateLabel("机器码", 24, 16, 40, 17)
$Label2 = GUICtrlCreateLabel("注册码", 24, 64, 40, 17)
$Edit1 = GUICtrlCreateEdit("",  24, 88, 209, 23,BitOR($WS_EX_CLIENTEDGE,$WS_EX_STATICEDGE,$ES_READONLY))
$Button1 = GUICtrlCreateButton("计算", 24, 120, 81, 25)
$Button2 = GUICtrlCreateButton("退出", 144, 120, 81, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData ($Edit1,zhucema())
		Case $Button2
			Exit
	EndSwitch
WEnd

Func zhucema()
Local  $machineMac = StringUpper(GUICtrlRead($Input1))

Local $result = ""
Local  $length = StringLen($machineMac)
For $i = 1 To $length Step 1
	Local $var = StringMid($machineMac, $i, 1)
	$result = $result & (StringInStr($str, $var) -1)
Next
Return ($result)
EndFunc