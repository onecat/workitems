HotKeySet("!1", "xiaozhan") 
HotKeySet("!2", "suoxiao") 
HotKeySet("!3", "ExitScript") 


#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <array.au3>
#include <IE.au3>
#include <IEEx.au3>

Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘


$oIE = _IECreateEmbedded()
$gx = GUICreate("更新", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
$GUIActiveX = GUICtrlCreateObj($oIE, 10, 40, 640, 400)

GUISetState(@SW_HIDE,$gx)
;GUISetState() ;显示GUI

_IENavigate($oIE, "http://zh-hr.com")

$username = 'zhqf2001'
$password = 'zhqf19831022'
$Ele = _IEGetObjById($oIE,"loginname")
_IEFormElementSetValue($Ele,$username)
$Ele = _IEGetObjById($oIE,"loginpwd")
_IEFormElementSetValue($Ele,$password)
$Ele = _IETagNameGetCollection($oIE,"SPAN",18)
_IEAction($Ele,"click") ;点击

_IELoadWait($oIE,1000)

 $Ele = _IEQuery($oIE,"SPAN",'OuterText="刷新简历"')
;~  If IsObj($Ele) Then MsgBox(64,"对象",$Ele.outerhtml)
_IEAction($Ele,"click")


GUISetOnEvent( $GUI_EVENT_MINIMIZE, "suoxiao")
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xiaozhan") ;注册鼠标左键双击事件(只能在 TrayOnEventMode 设置为 1 时才能使用)
$Start = TrayCreateItem("启用") ;创建第一个菜单项
TrayItemSetOnEvent(-1,"qiyong") ;注册第一个菜单项的（被点下）事件  
;TrayItemSetOnEvent = 当系统托盘发生一个特殊事件就执行一个用户自定义函数
TrayCreateItem("") ;创建一个空白的菜单项（即横斜杠分割符） 
;TrayCreateItem = 在系统托盘上面创建一个菜单项目控件
$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ExitScript") ;注册第二个菜单项的（被点下）事件


TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()



While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			Exit

	EndSelect
WEnd

Func _Exit()
        
     ; DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $gx, "int", 1000, "long", 0x00090000);渐隐

        Exit
        
 EndFunc
 

 
Func xiaozhan()
   GUISetState(@SW_SHOW, $gx)   ;调整窗口的状态
   GUISetState(@SW_RESTORE, $gx)
 
EndFunc   ;==>启用(双击鼠标)

Func suoxiao()
 GUISetState(@SW_HIDE,$gx)
EndFunc

Func qiyong()
   GUISetState(@SW_SHOW, $gx)    ;调整窗口的状态    
   GUISetState(@SW_RESTORE, $gx)
  
EndFunc  ;==>启用

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>退出