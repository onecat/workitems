#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=L:\���Խű�\��������.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\������������.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#region ACNԤ����������(���ò���)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

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

Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�.
Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����

_IEErrorHandlerRegister()

$oIE = _IECreateEmbedded()
$gx = GUICreate("����", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
$GUIActiveX = GUICtrlCreateObj($oIE, 10, 40, 600, 360)

GUISetState(@SW_HIDE,$gx)
;GUISetState() ;��ʾGUI

_IENavigate($oIE, "http://zh-hr.com")

$username = '�û���'
$password = '����'
$Ele = _IEGetObjById($oIE,"loginname")
_IEFormElementSetValue($Ele,$username)
$Ele = _IEGetObjById($oIE,"loginpwd")
_IEFormElementSetValue($Ele,$password)
$Ele = _IETagNameGetCollection($oIE,"SPAN",18)
_IEAction($Ele,"click") ;���
_IELoadWait($oIE,1000)
Send("{enter}")
;����
$Ele = _IETagNameGetCollection($oIE,"SPAN",19)
_IEAction($Ele, "click")



_IELoadWait ($oIE)




GUISetOnEvent( $GUI_EVENT_MINIMIZE, "suoxiao")
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xiaozhan") ;ע��������˫���¼�(ֻ���� TrayOnEventMode ����Ϊ 1 ʱ����ʹ��)
$Start = TrayCreateItem("����") ;������һ���˵���
TrayItemSetOnEvent(-1,"qiyong") ;ע���һ���˵���ģ������£��¼�  
;TrayItemSetOnEvent = ��ϵͳ���̷���һ�������¼���ִ��һ���û��Զ��庯��
TrayCreateItem("") ;����һ���հ׵Ĳ˵������б�ָܷ���� 
;TrayCreateItem = ��ϵͳ�������洴��һ���˵���Ŀ�ؼ�
$Quit = TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"ExitScript") ;ע��ڶ����˵���ģ������£��¼�


TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()



While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			Exit

	EndSelect
WEnd

Func _Exit()
        
     ; DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $gx, "int", 1000, "long", 0x00090000);����

        Exit
        
 EndFunc
 

 
Func xiaozhan()
   GUISetState(@SW_SHOW, $gx)   ;�������ڵ�״̬
   GUISetState(@SW_RESTORE, $gx)
 
EndFunc   ;==>����(˫�����)

Func suoxiao()
 GUISetState(@SW_HIDE,$gx)
EndFunc

Func qiyong()
   GUISetState(@SW_SHOW, $gx)    ;�������ڵ�״̬    
   GUISetState(@SW_RESTORE, $gx)
  
EndFunc  ;==>����

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>�˳�