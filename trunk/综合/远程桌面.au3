#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=L:\����\QQ\3D���ICOͼ��\earth.ico
#PRE_Outfile=Զ������(xxiii30).exe
#PRE_UseUpx=n
#PRE_Res_Comment=Сվ����
#PRE_Res_Description=Сվ����
#PRE_Res_Fileversion=2.1.0.0
#PRE_Res_LegalCopyright=Сվ����
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <Process.au3>
ShellExecute("mstsc.exe","","C:\Windows\System32")
WinWait("Զ����������")
WinActivate("Զ����������")
Sleep(500)
ControlClick("Զ����������","ѡ��(&O)","ToolbarWindow321")
Sleep(500)
ControlSetText("Զ����������","","Edit1","192.168.0.30")
ControlSetText("Զ����������","","Edit2","xxiii")
ControlClick("Զ����������","����(&N)","[ID:1]")
WinWait("Windows ��ȫ")
ControlSetText("Windows ��ȫ","","Edit1","123456")
Sleep(500)
ControlClick("Windows ��ȫ","ȷ��","Button2")
WinWait("Զ����������")
Sleep(500)
ControlClick("Զ����������","��(&Y)","Button5")