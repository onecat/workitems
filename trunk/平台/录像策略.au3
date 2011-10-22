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
#include <SendMessage.au3>

;;录像策略
WinActivate("RVMS平台--管理端")
$hTab = ControlGetHandle("RVMS平台--管理端", "", "SysTabControl322")
_GUICtrlTab_ClickTab($hTab, 1, "left", True, 1)

$1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321");获取树形列表控件句柄
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView321", "Expand", "universe")
$2 =_GUICtrlTreeView_FindItem($1, "universe")
_GUICtrlTreeView_ClickItem($1,$2,"left",True,2,2);点击树形列表项目

;----------------------------------------------------------------------------------------------------
;9104B
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9104B0" & $k)
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9104B0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9104B0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8


;----------------------------------------------------------------------------------------------------
;9108

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D91080" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D91080" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D910809" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D910809|录像服务器")

$i = 0
Do
If $k <=16 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9108" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9108" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;9108B

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9108B0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9108B0" & $k & "|录像服务器")
   
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9108B09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9108B09|录像服务器")
$i = 0
Do
If $k <=16 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9108B" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9108B" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;D9604L
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9604L0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9604L0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;D9604B
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9604B0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9604B0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;D9608L

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9608L0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9608L0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9608L09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9608L09|录像服务器")
$i = 0
Do
If $k <=16 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9608L" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9608L" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;D9216H

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9216H0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9216H0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9216H09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9216H09|录像服务器")
$i = 0
Do
If $k <=32 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9216H" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9216H" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 24

;----------------------------------------------------------------------------------------------------
;D9316H

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9316H0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9316H0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9316H09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9316H09|录像服务器")
$i = 0
Do
If $k <=32 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9316H" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9316H" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 24

;----------------------------------------------------------------------------------------------------
;D9104
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D91040" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D91040" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

;----------------------------------------------------------------------------------------------------
;D9616L

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9616L0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9616L0" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9616L09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9616L09|录像服务器")
$i = 0
Do
If $k <=32 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9616L" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9616L" & $k & "|录像服务器")
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 24

;----------------------------------------------------------------------------------------------------
;D9016H

WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表")
$k=1
$i = 0
Do
If $k <=8 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9016H0" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9016H0" & $k & "|录像服务器")
   
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 8

WinActivate("RVMS平台--管理端")
$k=9
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9016H09" )
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9016H09|录像服务器")
$i = 0
Do
If $k <=32 Then 
	ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9016H" & $k)
   ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Check", "通道列表|D9016H" & $k & "|录像服务器")
     
   $k=$k+1
EndIf
    $i = $i + 1
Until $i = 24

;定时录像
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9104B01")
  $1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321")
   $2 =_GUICtrlTreeView_FindItem($1, "录像服务器")
  _GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2)
  
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "时间段一:", "Button15")
ControlClick( "RVMS平台--管理端", "时间段二:", "Button16")
ControlClick( "RVMS平台--管理端", "时间段三:", "Button17")
ControlClick( "RVMS平台--管理端", "时间段四:", "Button18")
ControlClick( "RVMS平台--管理端", "应用于每一天", "Button27")

WinWait("RVMS平台--管理端提示信息")
ControlClick("RVMS平台--管理端提示信息","确定","Button1")

WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "时间段一:", "Button19")
ControlClick( "RVMS平台--管理端", "时间段二:", "Button20")
ControlClick( "RVMS平台--管理端", "时间段三:", "Button21")
ControlClick( "RVMS平台--管理端", "时间段四:", "Button22")
ControlClick( "RVMS平台--管理端", "应用于每一天", "Button28")

WinWait("RVMS平台--管理端提示信息")
ControlClick("RVMS平台--管理端提示信息","确定","Button1")
ControlClick( "RVMS平台--管理端", "确定", "Button29")
