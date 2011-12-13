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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=34650.ico
#AutoIt3Wrapper_outfile=新浪音乐盒.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=新浪音乐盒本地版
#AutoIt3Wrapper_Res_Description=jienis原创，SANMOKING增强。
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=autoitx.com
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
_MyProExists() ;禁止重复运行(增加了激活之前运行窗口的功能^_^)
HotKeySet ( "{MEDIA_PLAY_PAUSE}", "play")
HotKeySet ( "{MEDIA_STOP}", "stop")
HotKeySet ( "{MEDIA_NEXT}", "nextt")
HotKeySet ( "{MEDIA_PREV}", "prev")
HotKeySet ( "^{F5}", "new")
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1);窗口点击模式
Opt("TrayOnEventMode", 1);托盘菜单点击模式
Opt("GUIEventOptions", 1);菜单点击选项
Opt("TrayMenuMode", 3);托盘菜单点击选项
TraySetClick(64) ; 单击右键将显示托盘菜单.
$item00 = TrayCreateItem("暂停∥")
TrayItemSetOnEvent(-1, "play")
TrayCreateItem("上一首﹤")
TrayItemSetOnEvent(-1, "prev")
TrayCreateItem("下一首﹥")
TrayItemSetOnEvent(-1, "nextt")
TrayCreateItem("换一批∫")
TrayItemSetOnEvent(-1, "new")
 
 
TrayCreateItem("静音￠")
TrayItemSetOnEvent(-1, "mun")
 
 
TrayCreateItem("");托盘菜单分隔符
 
 
$item03 = TrayCreateItem("隐藏窗口⌒");创建托盘菜单开始
TrayItemSetOnEvent(-1, "mini")
$item04 = TrayCreateItem("取消置顶≒");创建托盘菜单开始
TrayItemSetOnEvent(-1, "Top")
TrayCreateItem("退出程序∝")
TrayItemSetOnEvent(-1, "Exitt")
TraySetState();创建托盘菜单结束
 
 
#include <IE.au3>
$Form1 = GUICreate("新浪音乐盒", 300,375)
GUISetBkColor(0x004E98)
GUISetOnEvent($GUI_EVENT_MINIMIZE, "mini");最小化时执行"显示隐藏界面"函数
GUISetOnEvent($GUI_EVENT_CLOSE, "Exitt");点击关闭时执行"显示隐藏界面"函数
$oIE = _IECreateEmbedded ()
 
$GUIActiveX= GUICtrlCreateObj($oIE, 3000,-27 ,307,500)
$txt=GUICtrlCreateLabel ( "【正在载入播放器】",100, 140) 
GUICtrlSetColor(-1, 0x9DB9EB)
GUISetState(@SW_SHOW)
_IENavigate ($oIE,"http://music.sina.com.cn/iframe/yueku/msnshell/msnshellplayer.shtml")
GUICtrlSetPos ($txt,3000,1000) 
GUICtrlSetPos ($GUIActiveX,-3,-27 ,307,500) 
$mini = 1
$play = 1
$mun = 1
$top = 0
Top()
new()
While 1
Sleep(10)
WEnd
 
 
Func play()
 
if $play = 0 Then
TrayItemSetText($item00, "暂停∥")
 
_IEImgClick($oIE, "bfq_icon_01.gif","src")
$play = 1 
Else
TrayItemSetText($item00, "播放≈")
 
_IEImgClick($oIE, "bfq_icon_08.gif","src")
 
$play = 0 
endif
EndFunc
Func stop()
_IEImgClick($oIE, "bfq_icon_02.gif","src")
 
EndFunc
Func prev()
_IEImgClick($oIE, "bfq_icon_03.gif","src")
 
EndFunc
Func nextt()
_IEImgClick($oIE, "bfq_icon_04.gif","src")
 
EndFunc
Func new()
_IEImgClick($oIE, "icon_21.gif","src")
 
EndFunc
Func mun();静音
 
If $mun = 1 Then
 
_IEImgClick($oIE, "bfq_icon_05.gif","src")
 
 
$mun = 0
 
Else
 
_IEImgClick($oIE, "bfq_icon_09.gif","src")
 
 
$mun = 1
 
EndIf
EndFunc   
Func Top();置顶
 
If $top = 1 Then
 
WinSetOnTop ($Form1 , "", 0) 
 
TrayItemSetText($item04, "置顶显示≡")
 
$top = 0
 
 
Else
 
WinSetOnTop ($Form1 , "", 1) 
 
TrayItemSetText($item04, "取消置顶≒")
 
$top = 1
 
EndIf
EndFunc  
 
 
Func mini();最小化窗体函数
 
If $mini = 1 Then;如果窗体是显示状态
 
GUISetState(@SW_HIDE, $Form1);隐藏窗体
 
TrayItemSetText($item03, "显示窗口∩");修改托盘菜单第一行的文字
 
$mini = 0;修改窗体的状态记录
 
Else
 
mini2();显示窗体界面
 
EndIf
EndFunc   ;==>Form1Minimize
Func mini2();还原窗体函数,同时给重复打开程序时的快捷键用
 
GUISetState(@SW_SHOW, $Form1);显示窗体
 
TrayItemSetText($item03, "隐藏窗口⌒");修改托盘菜单第一行的文字
 
$mini = 1;修改窗体的状态记录
EndFunc   ;==>Form1mize
 
 
Func Exitt()
 
Exit
EndFunc
Func _MyProExists() ;重复打开程序检测的函数
 
$my_Version = "sanmoking的新浪音乐盒本地工具xzfdsgdfgdf";设置个变量,尽量复杂哈
 
If WinExists($my_Version) Then ;检测到有该变量命名的窗体,基本上就是同一个程序重复运行了
 
Send("^+!{NUMPADADD}");按下还原窗口的快捷键,当然还原的是之前运行的那个程序的窗口啦,^_^
 
Exit;退出本程序
 
EndIf
 
AutoItWinSetTitle($my_Version);设置autoit程序的标题,autoit程序都有这个
 
HotKeySet("^+!{NUMPADADD}", "mini2");设置一个能吧隐藏窗体还原的快捷键,其实这一行放到gui创建好之后的位置最好了.主while循环前面..
EndFunc   ;==>_MyProExists
