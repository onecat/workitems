#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <WinAPIEx.au3>
#Include <WinAPI.au3>
#Include <Constants.au3>
$Form1 = GUICreate("测试",400,300)
GUISetState(@SW_SHOW, $Form1)
$pid = Run('notepad.exe',"",@SW_HIDE)
Opt("WinTitleMatchMode", 4) 
$hChild=WinWait("[Class:Notepad]",'')                        ;取窗口句柄
_WinAPI_SetParent($hChild, $Form1)                			;将记事本窗口设置为 $Form1 的字窗口               
_WinAPI_SetWindowLong($hChild,$GWL_STYLE,BitOR($WS_SYSMENU, $WS_POPUP))    ;设置记事本窗口样式
_WinAPI_MoveWindow($hChild,0,0,400,300)										;移动窗口,刷新窗口,否则子窗口内容 可能显示不正常 
WinSetState($hChild,"",@SW_SHOW)                                              ;使记事本窗口可见
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ProcessClose($pid)
			ExitLoop
	EndSwitch
WEnd