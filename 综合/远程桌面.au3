#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\工具\综合软件\3D风格ICO图标\earth.ico
#PRE_Outfile=远程桌面(chtyal50).exe
#PRE_UseUpx=n
#PRE_Res_Comment=小站制作
#PRE_Res_Description=小站制作
#PRE_Res_Fileversion=2.0.0.0
#PRE_Res_LegalCopyright=小站制作
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <Process.au3>
ShellExecute("mstsc.exe","","C:\Windows\System32")
WinWait("远程桌面连接")
WinActivate("远程桌面连接")
ControlClick("远程桌面连接","选项(&O)","[ID:5017]")
Sleep(500)
ControlClick("远程桌面连接","","[ID:13050]","left")
ControlSetText("远程桌面连接","","[ID:13050]","192.168.2.50")
ControlClick("远程桌面连接","","[ID:13064]")
ControlSetText("远程桌面连接","","[ID:13064]","chtyal")
ControlClick("远程桌面连接","连接(&N)","[ID:1]")
WinWait("Windows 安全")
ControlClick("Windows 安全","","Edit1")
Send("123456")
Sleep(500)
ControlClick("Windows 安全","确定","Button2")
WinWait("远程桌面连接")
Sleep(500)
ControlClick("远程桌面连接","是(&Y)","Button5")