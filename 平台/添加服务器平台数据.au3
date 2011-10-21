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
#include <GuiListView.au3>
#Include <GuiTreeView.au3>
#Include <GuiTab.au3>
Local $Paused

HotKeySet("{ESC}", "Terminate")
HotKeySet("{F2}", "Togglepause")


;点击树形列表到universe选中状态
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "universe")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2);点击树形列表项目
Sleep(1000)

;----------------------------------机构配置---------------------------------------
;机构配置
WinActivate("RVMS平台--管理端")
ControlClick("RVMS平台--管理端","机构管理","Button34")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
ControlClick( "RVMS平台--管理端", "", "SysListView3229","right",1,1429, 207)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("广东省")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)
$hListView1 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3229")
_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("广西省")
ControlClick("添加机构信息","确定","Button1")

;----------------------------------------------------------------------------------------------------
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "广东省")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2);点击树形列表项目
Sleep(1000)

$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
ControlClick( "RVMS平台--管理端", "", "SysListView3229","right",1,1429, 207)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("珠海市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)
$hListView1 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3229")
_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("深圳市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)

_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("汕头市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)

_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("江门市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)

_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("广州市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)

_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("东莞市")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)

;---------------------------------------------------------------------------------------------
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "珠海市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2);点击树形列表项目
Sleep(1000)

$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
ControlClick( "RVMS平台--管理端", "", "SysListView3229","right",1,1429, 207)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("香洲区")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)
$hListView1 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3229")
_GUICtrlListView_ClickItem($hListView1, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加机构信息")
ControlClick("添加机构信息","","Edit1")
Send("斗门区")
ControlClick("添加机构信息","确定","Button1")
Sleep(1000)


;管理员配置
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "universe")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2);点击树形列表项目
Sleep(1000)

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 1, "left", True, 1)
Sleep(1000)

$hListView2 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3228")
_GUICtrlListView_ClickItem($hListView2, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加管理员")
ControlClick("添加管理员","","Edit1")
Send("1")
ControlClick("添加管理员","","Edit2")
Send("1")
ControlClick("添加管理员","超级管理员","Button1")
ControlClick("添加管理员","确定","Button2")
Sleep(1000)

_GUICtrlListView_ClickItem($hListView2, 0, "right", True, 1)
Send("{down}")
Send("{enter}")
WinWait("添加管理员")
ControlClick("添加管理员","","Edit1")
Send("chtybox")
ControlClick("添加管理员","","Edit2")
Send("1")
ControlClick("添加管理员","超级管理员","Button1")
ControlClick("添加管理员","确定","Button2")

;-------------------------------------服务器管理-----------------------------------------------------------------
;转发服务器
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
$2 =_GUICtrlTreeView_FindItem($1, "universe")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2);点击树形列表项目
Sleep(1000)

ControlClick("RVMS平台--管理端","服务器管理","Button41")
WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3226","right",1,1325, 160)
Send("{down}")
Send("{enter}")

WinWait("添加MTDU信息")
ControlClick("添加MTDU信息","","Edit1")
Send("转发服务器")
;ControlClick("添加MTDU信息","","Edit2")
;Send("100002")
ControlClick("添加MTDU信息","确定","Button1")
Sleep(1000)

$hListView3=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3226")
_GUICtrlListView_ClickItem($hListView3, 0, "left", True, 1)

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3227","right",1,991, 215)

Send("{down}")
Send("{enter}")

WinWait("路由信息")
ControlClick("路由信息","","Edit1")
Send("192.168.1.200")
ControlClick("路由信息","","Edit2")
Send("192.168.1.200")
ControlClick("路由信息","确定","Button1")
Sleep(1000)

;录像服务器
WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl327")
_GUICtrlTab_ClickTab($hTab, 1, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3224","right",1,1235, 803)
Send("{down}")
Send("{enter}")

WinWait("添加MSU信息")
ControlClick("添加MSU信息","","Edit1")
Send("录像服务器")
ControlClick("添加MSU信息","确定","Button1")
Sleep(1000)

;---------------------------------设备管理-------------------------------------------
;设备设置
;广东省
;D9104B 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "广东省")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9104B")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000002")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104B")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")




$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104B")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 3


;D9104B 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104B")
Send("0")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 4
;-------------------------------------------------------------------------------------------------------------
;珠海
;D9108 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省|珠海市")
$2 =_GUICtrlTreeView_FindItem($1, "珠海市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9108")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000003")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)



WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D910801")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7


;D9108 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108")
Send("09")

ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")

$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")


$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7
;--------------------------------------------------------------------------------------------------
;珠海香洲
;D9108B 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省|珠海市")
$2 =_GUICtrlTreeView_FindItem($1, "香洲区")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9108B")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000004")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7


;D9108B 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B")
Send("09")

ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")

$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")



$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9108B")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;-------------------------------------------------------------------------------------------------------------
;珠海香斗门
;D9604L 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省|珠海市")
$2 =_GUICtrlTreeView_FindItem($1, "斗门区")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目

ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9604L")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000005")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604L01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604L")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 3


;D9604L 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604L")
Send("0")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 4

;--------------------------------------------------------------------------------------------------------------
;深圳市
;D9604B 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "深圳市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9604B")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000006")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604B01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604B")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 3


;D9604B 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9604B")
Send("0")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 4

;-------------------------------------------------------------------------------------------------
;汕头市
;D9608L 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "汕头市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9608L")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000007")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9608L01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9608L")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7


;D9608L 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9608L")
Send("09")

ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")

$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")


$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9608L")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;----------------------------------------------------------------------------------------------
;江门市
;D9216H 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "江门市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9216H")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000008")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)


;通道
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9216H01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9216H")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9216H")
Send("09")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")

$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9216H")
Send($j)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;D9216H 从

$j=17
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9216H")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 16

;-------------------------------------------------------------------------------------------------------------
;广州市
;D9316H 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "广州市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9316H")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000009")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)


;通道
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9316H01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9316H")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9316H")
Send("09")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")

$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9316H")
Send($j)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;D9216H 从

$j=17
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9316H")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 16

;-------------------------------------------------------------------------------------------------
;东莞市
;D9104 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "东莞市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9104")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000001")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 0, "left", True, 1)

;通道

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104001")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")




$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 3


;D9104 从
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9104")
Send("0")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 4

;-------------------------------------------------------------------------------------------------
;广西省
;D9616L 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "广州市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9616L")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000010")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 1, "left", True, 1)


;通道
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9616L01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9616L")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9616L")
Send("09")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")

$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9616L")
Send($j)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;D9616L 从
$j=17
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9616L")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 16

;---------------------------------------------------------------
;D9616L 主
WinActivate("RVMS平台--管理端")
$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄

ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe|广东省")
$2 =_GUICtrlTreeView_FindItem($1, "广州市")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目


ControlClick("RVMS平台--管理端","设备管理","Button35")

WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl325")
_GUICtrlTab_ClickTab($hTab, 0, "left", True, 1)
Sleep(1000)

ControlClick( "RVMS平台--管理端", "", "SysListView3222","right",1,1608, 117)
Send("{down}")
Send("{enter}")
WinWait("添加设备信息")
ControlClick( "添加设备信息", "", "Edit1")
Send("D9016H")
ControlClick( "添加设备信息", "", "Edit2")
Send("000000000000000011")
ControlClick( "添加设备信息", "确定", "Button3")

$hListView4=ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3222")
_GUICtrlListView_ClickItem($hListView4, 1, "left", True, 1)


;通道
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "", "SysListView3223","right",1,1608, 117)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9016H01")


$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
$j=2
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9016H")
Send("0")
Send($j)
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9016H")
Send("09")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")

$j=10
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9016H")
Send($j)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 7

;D9016H 从
$j=17
$i = 0
Do
	WinActivate("RVMS平台--管理端")
$hListView6 = ControlGetHandle ( "RVMS平台--管理端", "List1", "SysListView3223")
_GUICtrlListView_ClickItem($hListView6, 0, "right", True, 1)
Send("{down}")
Send("{enter}")

WinWait("添加通道")
ControlClick( "添加通道", "", "Edit2")
Send("D9016H")
Send($j)
ControlClick("添加通道","","ComboBox1","left",2)
Send("{down}")
$hListView5 = ControlGetHandle ( "添加通道", "List1", "SysListView321")
 _GUICtrlListView_SetItemChecked($hListView5, 0)
ControlClick( "添加通道", "确定", "Button1")
         $j=$j+1
    $i = $i + 1
Until $i = 16

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
