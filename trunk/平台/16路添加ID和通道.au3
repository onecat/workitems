#Include <GuiTab.au3>
#include <GuiListView.au3>
#Include <GuiComboBox.au3>
#Include <GuiTreeView.au3>

Local $Paused

HotKeySet("{F4}", "Terminate")
HotKeySet("{F2}", "Togglepause")


;D9316H 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "广州市")
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
Send("D9108B1")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000001")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 1, "left", True, 1)


;通道
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B101")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B1")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B1")
Send("09")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")

$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B1")
Send($j)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;D9316H 从
$j=17
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B1")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 16

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