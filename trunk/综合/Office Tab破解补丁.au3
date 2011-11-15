#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=J:\Office Tab\OfficeTabCenter(Admin).exe
#AutoIt3Wrapper_Outfile=Office Tab破解补丁.exe
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Opt("TrayIconHide",1)
$I1 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{DE469D65-1DEB-4058-BF95-C642D733668D}_is1", "InstallLocation")
$Form1_1 = GUICreate("Office Tab破解补丁",  330, 205, 332, 189)
$Input2 = GUICtrlCreateInput($I1,  120, 96, 169, 21)
$Button1 = GUICtrlCreateButton("确定", 64, 136, 65, 25)
$Button2 = GUICtrlCreateButton("取消", 188, 136, 65, 25)
$Label3 = GUICtrlCreateLabel("Office Tab  路径", 12, 100, 96, 17)
$Label1 = GUICtrlCreateLabel("1 如果路径获取失败请手动添加路径" & @CRLF & "2 使用本补丁之前记得要保存office文件" & @CRLF & "3 退出office文件本补丁才能生效" & @CRLF & "4 Excel,PowerPoint,Word,Access本补丁会自    动关闭,数据没保存后果自负", 24, 16, 248, 65)
$Label2 = GUICtrlCreateLabel("小站制作:破解文件来源于网络", 8, 176, 163, 17)
;$Pic1 = GUICtrlCreatePic("C:\Users\chtyfox\Desktop\1\Penguins.jpg", 0, 0, 329, 201, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS));在GUI上创建一个图片控件
;GUICtrlSetCursor (-1, 0)  ;特定控件指定一个鼠标指针
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
$nMsg = GUIGetMsg()
	Select 
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button2
			Exit
		Case $nMsg = $Button1
			pj()
			Exit
	EndSelect
WEnd

Func pj()
	ProcessClose("OfficeTabCenter.exe")
	ProcessClose("OfficeTabCenter(Admin).exe")
	ProcessClose("EXCEL.exe")
	ProcessClose("WINWORD.exe")
	ProcessClose("POWERPNT.exe")
	ProcessClose("MSACCESS.exe")
	FileInstall("OfficeTabFunction.dll","C:\Windows\System32\",1)
	FileInstall("TabsforAccess.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforExcel.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforPowerPoint.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforProject.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforPublisher.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforVisio.dll", GUICtrlRead ($Input2),1) 
	FileInstall("TabsforWord.dll", GUICtrlRead ($Input2),1) 
EndFunc