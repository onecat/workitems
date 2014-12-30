#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\测试脚本\项目5.ico
#PRE_Outfile=安联客户超级密码.exe
#PRE_UseUpx=n
#PRE_Res_Comment=小站
#PRE_Res_Description=小站
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_LegalCopyright=1.0.0.0
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
;密码------------------------------------------------
$ty = "130901"
$SWANN = "664225"
$KGUARD	= "393856"
$ALPHATECH = "189102"
$OWL = "2x8axc"
$LEGRAND = "qf4F9v"
$GREATEK = "203gtk13"
$BOLIDE = "468186"
$URMET  = "11102012"
$ELKRON = "11102012"
$PROTECTRON = "Ab9842"
$BASSON = "12121212"
$Golmar = "11223344"
$COP = "CWA138"
$IQCCTV = "130812"
$BALANDI = "130801"


Global $Title = "客户超级密码" ,$sText
#Region ### START Koda GUI section ### Form=C:\Users\chtyfox\Desktop\Form1_1.kxf
$Form1_1 = GUICreate($Title, 408, 130, -1, -1)
$Button1 = GUICtrlCreateButton("查询 >", 326, 80, 73, 41, $BS_DEFPUSHBUTTON)
$Radio1 = GUICtrlCreateRadio("通用", 8, 5, 47, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("SWANN", 56, 5, 65, 17)
$Radio3 = GUICtrlCreateRadio("KGUARD", 122, 5, 71, 17)
$Radio4 = GUICtrlCreateRadio("ALPHATECH", 197, 5, 87, 17)
$Radio5 = GUICtrlCreateRadio("OWL", 285, 5, 47, 17)
$Radio6 = GUICtrlCreateRadio("LEGRAND", 333, 5, 73, 17)
$Radio7 = GUICtrlCreateRadio("GREATEK	", 8, 25, 73, 17)
$Radio8 = GUICtrlCreateRadio("BOLIDE	", 82, 25, 60, 17)
$Radio9 = GUICtrlCreateRadio("URMET", 146, 25, 60, 17)
$Radio10 = GUICtrlCreateRadio("ELKRON", 210, 25, 60, 17)
$Radio11 = GUICtrlCreateRadio("PROTECTRON", 274, 25, 100, 17)
$Radio12 = GUICtrlCreateRadio("BASSON", 8, 45, 60, 17)
$Radio13 = GUICtrlCreateRadio("Golmar", 72, 45, 52, 17)
$Radio14 = GUICtrlCreateRadio("COP", 128, 45, 44, 17)
$Radio15 = GUICtrlCreateRadio("IQCCTV", 176, 45, 60, 17)
$Radio16 = GUICtrlCreateRadio("BALANDI", 240, 45, 68, 17)
$Group1 = GUICtrlCreateGroup("显示区域", 8, 72, 313, 49)
$Edit1 = GUICtrlCreateEdit("", 16, 88, 297, 25,BitOR($ES_READONLY,$WS_BORDER,$ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData ($Edit1,"")
			GUICtrlSetData ($Edit1, MM())	
	EndSwitch
WEnd


Func MM()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $MM = $ty
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $MM = $SWANN
	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $MM = $KGUARD
	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $MM = $ALPHATECH
	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $MM = $OWL
	If GUICtrlRead($Radio6) = $GUI_CHECKED Then $MM = $LEGRAND
	If GUICtrlRead($Radio7) = $GUI_CHECKED Then $MM = $GREATEK
	If GUICtrlRead($Radio8) = $GUI_CHECKED Then $MM = $BOLIDE
	If GUICtrlRead($Radio9) = $GUI_CHECKED Then $MM = $URMET
	If GUICtrlRead($Radio10) = $GUI_CHECKED Then $MM = $ELKRON
	If GUICtrlRead($Radio11) = $GUI_CHECKED Then $MM = $PROTECTRON
	If GUICtrlRead($Radio12) = $GUI_CHECKED Then $MM = $BASSON
	If GUICtrlRead($Radio13) = $GUI_CHECKED Then $MM = $Golmar
	If GUICtrlRead($Radio14) = $GUI_CHECKED Then $MM = $COP
	If GUICtrlRead($Radio15) = $GUI_CHECKED Then $MM = $IQCCTV
	If GUICtrlRead($Radio16) = $GUI_CHECKED Then $MM = $BALANDI
	
Return $MM
EndFunc