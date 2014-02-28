#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Outfile=11.exe
#PRE_Compression=4
#PRE_Res_Fileversion=0.0.0.5
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
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

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#Include <WinAPIEx.au3>
#Include <File.au3>
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘.
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("CJX规则更新小助手", 347, 215, 197, 124,$WS_SYSMENU)
$MenuItem = GUICtrlCreateMenu("选项")
$kjqd = GUICtrlCreateMenuItem("开机启动", $MenuItem)
$zdgx = GUICtrlCreateMenuItem("自动更新", $MenuItem)
$ljgx = GUICtrlCreateMenuItem("立即更新", $MenuItem)
$yctptb = GUICtrlCreateMenuItem("隐藏托盘图标", $MenuItem)
$gy = GUICtrlCreateMenuItem("关于", $MenuItem)
$tc = GUICtrlCreateMenuItem("退出", $MenuItem)
$Label1 = GUICtrlCreateLabel("规则更新状态：", 8, 24, 88, 17)
$Label2 = GUICtrlCreateLabel("", 120, 24, 112, 17)
$Label3 = GUICtrlCreateLabel("本地规则版本号：", 8, 56, 100, 17)
$Label4 = GUICtrlCreateLabel("", 120, 56, 108, 17)
$Button1 = GUICtrlCreateButton("立即更新", 8, 120, 73, 33)
$Button2 = GUICtrlCreateButton("代理更新", 104, 120, 73, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$tkjqd = TrayCreateItem("开机启动") ;创建第一个菜单项
TrayItemSetOnEvent(-1,"kjqd") ;注册第一个菜单项的（被点下）事件  
$tzdgx = TrayCreateItem("自动更新") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"zdgx") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("立即更新") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ljgx") ;注册第二个菜单项的（被点下）事件
$tyctptb = TrayCreateItem("隐藏托盘图标") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"yctptb") ;注册第二个菜单项的（被点下）事件
$tgy = TrayCreateItem("关于") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"guanyu") ;注册第二个菜单项的（被点下）事件
TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ExitScript") ;注册第二个菜单项的（被点下）事件
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xianshi")
TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()

If Not FileExists("CJX规则更新小助手.ini") Then
    Local $file = FileOpen("CJX规则更新小助手.ini", 1)
	FileWrite($file, ";此文件为CJX规则更新小助手的配置文件 请不要删除" & @CRLF)
	FileWrite($file, ";若被删除 将启用默认设置" & @CRLF)
	FileWrite($file, ";间隔时间 为检查规则更新的间隔时间 单位为秒" & @CRLF)
	FileWrite($file, ";隐藏托盘图标热键为：Ctrl+Q 立即更新热键为：Ctrl+U" & @CRLF)
	IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "开机启动", "真")
	IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "自动更新", "真")
	IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "隐藏托盘", "假")
	IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "首次运行", "假")
	IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "间隔时间", "1000")
	FileClose($file)
	ini1()
Else
	ini()
EndIf;判断结束


Local $str = 'CJX规则更新小助手 程序制作 by xiaozhan\n\n致谢：奶牛开发者 规则维护者\n以及做出相关贡献的朋！'
BDCJXGZ();获取本地版本号
While 1
	 	Switch GUIGetMsg()
	Case $GUI_EVENT_CLOSE
			suoxiao()
	Case $tc 
			Exit		
	Case $gy 
			guanyu()
	Case $kjqd
            kjqd()	
	Case $zdgx
			zdgx()
	Case $yctptb
			yctptb()
	Case $Button1
			ljgx()
	Case $Button2
			;BDCJXGZ()
			;GUICtrlSetData($Label4, $CJXBDGZ)
	EndSwitch	
WEnd



Func ini1();配置文件不存在就运行就显示状态
	$kj = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "开机启动", "")
	$zd = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "自动更新", "")
	$yt = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "隐藏托盘", "")
	If $kj = "真" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		;MsgBox(0,"设置开机启动","设置开机启动成功")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "真" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "真" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	


Func ini();配置文件存在就显示状态
	$kj = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "开机启动", "")
	$zd = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "自动更新", "")
	$yt = IniRead(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "隐藏托盘", "")
	If $kj = "真" Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
	EndIf	
	
	If $zd = "真" Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
	EndIf
	
	If $yt = "真" Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState ($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState ($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
	EndIf
EndFunc	

Func kjqd();开机启动
		$bt = _WinAPI_GetProcessName ()
	If BitAND(GUICtrlRead($kjqd) , $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($kjqd, $GUI_CHECKED)
		TrayItemSetState ($tkjqd, $GUI_CHECKED)
		;RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt, "REG_SZ", @ScriptDir & "\" & $bt & ".exe"  & " /start")
		MsgBox(0,"设置开机启动","设置开机启动成功")
       IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "开机启动", "真")
	Else
		GUICtrlSetState($kjqd, $GUI_UNCHECKED)
		TrayItemSetState ($tkjqd, $GUI_UNCHECKED)
		;RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$bt)
		MsgBox(0,"取消开机启动","取消开机启动成功")
		IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "开机启动", "假")
	EndIf
EndFunc


Func zdgx();自动更新
	If BitAND(GUICtrlRead($zdgx), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($zdgx, $GUI_CHECKED)
		TrayItemSetState ($tzdgx, $GUI_CHECKED)
		MsgBox(0,"","选中")
		IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "自动更新", "真")
	Else
		GUICtrlSetState($zdgx, $GUI_UNCHECKED)
		TrayItemSetState ($tzdgx, $GUI_UNCHECKED)
		MsgBox(0,"","没选中")
		IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "自动更新", "假")
	EndIf	
EndFunc	

Func yctptb();隐藏托盘
	If BitAND(GUICtrlRead($yctptb), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		GUICtrlSetState($yctptb, $GUI_CHECKED)
		TrayItemSetState($tyctptb, $GUI_CHECKED)
		Opt("TrayIconHide", 1) 
		MsgBox(0,"","选中")
		IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "隐藏托盘", "真")
	Else
		GUICtrlSetState($yctptb, $GUI_UNCHECKED)
		TrayItemSetState($tyctptb, $GUI_UNCHECKED)
		Opt("TrayIconHide", 0) 
		MsgBox(0,"","没选中")
		IniWrite(@ScriptDir & "\CJX规则更新小助手.ini", "配置", "隐藏托盘", "假")
	EndIf		
EndFunc	

Func ljgx();立即更新
	CJXBAK()
	CJZGX();这里在加个判断
EndFunc	

Func guanyu();关于
	TrayItemSetState($tgy, $GUI_UNCHECKED)
	MsgBox(0, '关于', StringFormat($str))
EndFunc	

Func suoxiao();缩小到托盘
 GUISetState(@SW_HIDE,$Form1)
EndFunc

Func xianshi();显示GUI界面
   GUISetState(@SW_SHOW, $Form1)   ;调整窗口的状态
   GUISetState(@SW_RESTORE, $Form1)
 
EndFunc   ;==>启用(双击鼠标)


Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>退出

Func CJXBAK();检测CJX备份文件是否存在
	If FileExists("CustomStrings.dat.BAK") Then
		FileDelete(@ScriptDir & "\CustomStrings.dat.BAK")
		FileCopy (@ScriptDir & "\CustomStrings.dat",@ScriptDir & "\CustomStrings.dat.BAK",1)
	Else
		FileCopy (@ScriptDir & "\CustomStrings.dat",@ScriptDir & "\CustomStrings.dat.BAK",1)
	EndIf
EndFunc	


	
Func CJZGX();CJX规则更新
	gzxz()
	bbhdb()
EndFunc

Func bbhdb();判断网络CJX规则和本地CJX规则
		If WLCJXGZ() <= BDCJXGZ() Then
			BDCJXGZ()
			GUICtrlSetData($Label2, "已是最新")
		Else
			THKS()
			THJGZ();这里面第2次会有问题
			BDCJXGZ()
			FileDelete(@TempDir & "\update.dat")
			GUICtrlSetData($Label2, "更新完成")
		EndIf	
EndFunc
	
Func THJGZ();更新奶牛CJX规则
		FileDelete(@ScriptDir & "\CustomStrings.dat")
		FileCopy (@TempDir & "\update.dat",@ScriptDir & "\CustomStrings.dat",1)
EndFunc	

Func gzxz();现在CJX规则文件
	GUICtrlSetData($Label2, "正在更新中")
	Local $hDownload = InetGet("http://cjxlist.googlecode.com/svn/CustomStrings.dat", @TempDir & "\update.dat", 1, 1)
Do
    Sleep(250)
Until InetGetInfo($hDownload, 2)    ; 检查下载是否完成.
	Local $nBytes = InetGetInfo($hDownload, 0)
	InetClose($hDownload)   ; 关闭句柄,释放资源.
	;MsgBox(4096, "", "字节读取: " & $nBytes)
EndFunc



Func WLCJXGZ();网络CJX规则
	$IniFile = @TempDir & "\update.dat"                                 ;文本路径
	$Lines = _FileCountLines($IniFile)                       ;读取文本行数
For $i=1 To $Lines-1                                           ;循环
        $ReadFile=FileReadLine($IniFile,$i)                       ;第1行开始读取
        If $ReadFile='' Then ExitLoop                                  ;文本空退出
        If stringinstr($ReadFile,"Xlist version") Then   			;返回带‘：’号的字符串
		Local $WLCJXGZ = StringRight($ReadFile, 6)
		Return($WLCJXGZ)
		ExitLoop
		;MsgBox(4096, "最右边三个字符为:", $GZ) 
		;MsgBox(4096, "最右边三个字符为:", $CJXBDGZ)   
	EndIf    

NEXT
EndFunc;获取本地CJX规则

Func BDCJXGZ();获取本地CJX规则
	$IniFile = @ScriptDir & "\CustomStrings.dat"                                 ;文本路径
	$Lines = _FileCountLines($IniFile)                       ;读取文本行数
For $i=1 To $Lines-1                                           ;循环
        $ReadFile=FileReadLine($IniFile,$i)                       ;第1行开始读取
        If $ReadFile='' Then ExitLoop                                  ;文本空退出
        If stringinstr($ReadFile,"Xlist version") Then   			;返回带‘：’号的字符串
		Local $BDCJXGZ = StringRight($ReadFile, 6)
		GUICtrlSetData($Label4, $BDCJXGZ)
		Return($BDCJXGZ)
		ExitLoop
		;MsgBox(4096, "最右边三个字符为:", $GZ) 

	EndIf    
 
NEXT
EndFunc;获取本地CJX规则


	
Func THKS();替换开始
	$IniFile = "CustomStrings.dat"                                 ;文本路径
	$Lines = _FileCountLines($IniFile)                       ;读取文本行数
For $i=1 To $Lines-1                                           ;循环

        $ReadFile=FileReadLine($IniFile,$i)                       ;第1行开始读取
		FileWriteLine(@TempDir & "\规则更新临时文件.txt", $ReadFile)
        If stringinstr($ReadFile,"Xlist version") Then                            ;返回带‘：’号的字符串
			 QCBBH()
			 WLTH()
			ExitLoop 
	EndIf     
NEXT
EndFunc

Func QCBBH();去除版本号
	Local Const $aFile = @TempDir & "\规则更新临时文件.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, 0, $file_begin)
	FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$last = FileRead($aFile,Filegetpos($hFile))
	FileOpen($aFile, 2)
	FileWrite($aFile,$last)
	FileClose($aFile)
	Return($last)
EndFunc

Func WLTH();把自定义规则写到CJX规则
Local Const $aFile3 = @TempDir & "\update.dat"
Local $hFile = FileOpen($aFile3, 1)
FileFlush($hFile)
FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile3), 2), Chr(13), 0, -1), $file_current)
$last = FileRead($aFile3,Filegetpos($hFile))
	FileOpen($aFile3, 2)
	FileWrite($aFile3,QCBBHGZ() & $last)
	FileClose($aFile3)
	FileDelete(@TempDir & "\规则更新临时文件.txt")
EndFunc

Func QCBBHGZ();读取没版本号的自定义规则
	Local Const $aFile = @TempDir & "\规则更新临时文件.txt"
	Local $hFile = FileOpen($aFile, 1)
	FileFlush($hFile)
	FileSetPos($hFile, StringInStr(stringstripws(FileRead($aFile), 2), Chr(13), 0, -1), $file_current)
	$QCBBHGZ = FileRead($aFile,Filegetpos($hFile))
	Return($QCBBHGZ)
EndFunc

;此文件为CJX规则更新小助手的配置文件 请不要删除 
;若被删除 将启用默认设置
;间隔时间 为检查规则更新的间隔时间 单位为秒
;隐藏托盘图标热键为：Ctrl+Q 立即更新热键为：Ctrl+U
;~ [配置]
;~ 开机启动=假
;~ 自动更新=假
;~ 首次运行=假 ;第一次运行就加入开机启动
;~ 间隔时间=1000 
;~ 隐藏托盘=假
