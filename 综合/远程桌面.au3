#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\QQ\3D风格ICO图标\earth.ico
#PRE_Outfile=远程桌面(xxiii30).exe
#PRE_UseUpx=n
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.1.0.0
#PRE_Res_LegalCopyright=小站制作
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <Process.au3>
ShellExecute("mstsc.exe","","C:\Windows\System32")
WinWait("远程桌面连接")
WinActivate("远程桌面连接")
Sleep(500)
ControlClick("远程桌面连接","选项(&O)","ToolbarWindow321")
Sleep(500)
ControlSetText("远程桌面连接","","Edit1","192.168.0.30")
ControlSetText("远程桌面连接","","Edit2","xxiii")
ControlClick("远程桌面连接","连接(&N)","[ID:1]")
WinWait("Windows 安全")
ControlSetText("Windows 安全","","Edit1","123456")
Sleep(500)
ControlClick("Windows 安全","确定","Button2")
WinWait("远程桌面连接")
Sleep(500)
ControlClick("远程桌面连接","是(&Y)","Button5")