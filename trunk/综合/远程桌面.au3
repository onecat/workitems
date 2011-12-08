#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=L:\工具\综合软件\3D风格ICO图标\rainmeter.ico
#AutoIt3Wrapper_Outfile=刷新DNS缓存.exe
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <Process.au3>
ShellExecute("mstsc.exe","","C:\Windows\System32")
WinWait("远程桌面连接")
WinActivate("远程桌面连接")
ControlClick("远程桌面连接","选项(&O)","[ID:5017]")
Sleep(500)
ControlClick("远程桌面连接","","[ID:13050]","left",2)
Send("192.168.2.40")
;~ ControlClick("远程桌面连接","","[ID:13064]")
;~ Send("chty")
ControlClick("远程桌面连接","连接(&N)","[ID:1]")
WinWait("Windows 安全")
ControlClick("Windows 安全","","Edit1")
Send("123456")
ControlClick("Windows 安全","确定","Button2")
WinWait("远程桌面连接")
ControlClick("远程桌面连接","是(&Y)","Button5")