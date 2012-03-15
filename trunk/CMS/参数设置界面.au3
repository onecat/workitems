#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
;#include<MsgBoxDJS.au3>
#Include <GuiTreeView.au3>
HotKeySet("{ESC}", "Terminate")
HotKeySet("{F2}", "Togglepause")

Local $Paused ,$h
$i = 0
Do
WinActivate("Video surveillance client")
$1= ControlGetHandle("Video surveillance client", "", "SysTreeView321");获取树形列表控件句柄
ControlTreeView ("Video surveillance client", "", "SysTreeView321", "Expand", "Device list")
ControlTreeView ("Video surveillance client", "", "SysTreeView321", "Expand", "Device list|181");181新修改成自己要用的
$2 =_GUICtrlTreeView_FindItem($1, "181");181新修改成自己要用的
;$2=_GUICtrlTreeView_FindItemEx($1, "珠海市|D9616L (17/17)|监控点 (17/17)|1001");找到要点击的树形的 根|根项目名字如 1|2,这是获取项目句柄
_GUICtrlTreeView_ClickItem($1,$2,"right",True,1,2);点击树形列表项目
Send("{down 7}");旧UI
;Send("{down 6}");新UI
Sleep(1000)
Send("{enter}")

WinWait("Remote Setup(125.89.62.181)")
Sleep(2000)
WinClose("Remote Setup(125.89.62.181)")

;新UI
;~ WinWait("Remote Setup(181)");设备配置参数标题
;~ Sleep(3000)
;~ WinClose("Remote Setup(181)")

;$msg = MsgBoxDJS(0 + 48 + 4, '界面是否全部出现', '界面全部实现请点击确定，' & @CRLF & '是否继续？', 5, 2)
$i = $i + 1
Until $i = 100



Func Terminate()
	Exit 0
EndFunc

Func Togglepause()
    $Paused = NOT $Paused 
	
   While $Paused 
	tooltip("暂停一会",0,0)
	sleep(100)
   tooltip("")
   WEnd
EndFunc



;If $4 = False Then
;	ControlTreeView ("Video surveillance client", "", "SysTreeView325", "Select", "珠海市|D9616L (17/17)|监控点 (17/17)")
;ElseIf 	$4 = True  Then
;$2=_GUICtrlTreeView_FindItemEx($1, "珠海市|D9616L (17/17)|监控点 (17/17)|1001");找到要点击的树形的 根|根项目名字如 1|2,这是获取项目句柄
;_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


;EndIf