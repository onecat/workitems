#Include <GuiTab.au3>
#include <GuiListView.au3>
#Include <GuiComboBox.au3>
#Include <GuiTreeView.au3>

Local $Paused 

HotKeySet("{F4}", "Terminate")
HotKeySet("{F2}", "Togglepause")


;解码器
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
;ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
;ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省|珠海市")
$2 =_GUICtrlTreeView_FindItem($1, "珠海市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("解码器")
ControlClick("添加设备信息","","ComboBox2","left",2)
Send("{down 2}")
Sleep(500)
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000001")

;~  $SBLX = ControlGetHandle ("添加设备信息","","ComboBox2")
;~ _GUICtrlComboBox_SetCurSel($SBLX,2)
;~ $1=_GUICtrlComboBox_GetMinVisible($SBLX)


ControlClick( "添加设备信息", "确定", "Button3")

 $hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 1, "left", True, 1)



WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("8分屏")


 $FP = ControlGetHandle ("添加通道","","ComboBox3")
_GUICtrlComboBox_SetCurSel($FP,3)
ControlClick( "添加通道", "确定", "Button1")

WinActivate("RVMS平台--管理端")
 $hListView5=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView5, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("9分屏")


 $FP = ControlGetHandle ("添加通道","","ComboBox3")
_GUICtrlComboBox_SetCurSel($FP,4)
ControlClick( "添加通道", "确定", "Button1")


Func Terminate()
	Exit 0
EndFunc

Func Togglepause()
    $Paused = NOT $Paused 
	
   While $Paused 
	tooltip("暂停一会",0,0)
	sleep(100)
   tooltip("")
   WEnd
EndFunc