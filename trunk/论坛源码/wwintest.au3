#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <WinAPIEx.au3>
#Include <WinAPI.au3>
#Include <Constants.au3>
$Form1 = GUICreate("����",400,300)
GUISetState(@SW_SHOW, $Form1)
$pid = Run('notepad.exe',"",@SW_HIDE)
Opt("WinTitleMatchMode", 4) 
$hChild=WinWait("[Class:Notepad]",'')                        ;ȡ���ھ��
_WinAPI_SetParent($hChild, $Form1)                			;�����±���������Ϊ $Form1 ���ִ���               
_WinAPI_SetWindowLong($hChild,$GWL_STYLE,BitOR($WS_SYSMENU, $WS_POPUP))    ;���ü��±�������ʽ
_WinAPI_MoveWindow($hChild,0,0,400,300)										;�ƶ�����,ˢ�´���,�����Ӵ������� ������ʾ������ 
WinSetState($hChild,"",@SW_SHOW)                                              ;ʹ���±����ڿɼ�
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ProcessClose($pid)
			ExitLoop
	EndSwitch
WEnd