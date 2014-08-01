#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=C:\WINDOWS\system32\SHELL32.dll|-122
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Dim $Get_Dat;下载au3更新文件用的

Dim $s_url,$md,$s_Size,$temp_file,$V_V,$Get_size
#Region ### START Koda GUI section ### Form=D:\自动更新程序\更新程序v1.kxf
$Form1 = GUICreate("程序更新器简单示例", 245, 341, -1, -1)
$Group1 = GUICtrlCreateGroup("本地程序", 8, 8, 225, 129)
GUICtrlCreateLabel("版本:", 16, 32, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("日期:", 16, 56, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("路径:", 16, 80, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("备注:", 16, 104, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("", 50, 32, 175, 17) ;版本
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label6 = GUICtrlCreateLabel("", 50, 56, 175, 17) ;日期
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label7 = GUICtrlCreateLabel("", 50, 80, 175, 17) ;路径
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x800080)
$Label8 = GUICtrlCreateLabel("", 50, 104, 175, 17) ;备注
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000080)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Group2 = GUICtrlCreateGroup("最新程序", 8, 144, 225, 129)
GUICtrlSetColor(-1, 0x0000ff)
GUICtrlCreateLabel("版本:", 16, 168, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("日期:", 16, 192, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("地址:", 16, 216, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlCreateLabel("备注:", 16, 240, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label13 = GUICtrlCreateLabel("", 50, 168, 175, 17) ;新版本
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label14 = GUICtrlCreateLabel("", 50, 192, 175, 17) ;新日期
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label15 = GUICtrlCreateLabel("", 50, 216, 175, 17) ;下载地址
GUICtrlSetFont(-1, 8, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0x800080)
$Label16 = GUICtrlCreateLabel("", 50, 240, 175, 17) ;备注信息
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000080)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Button1 = GUICtrlCreateButton("下载", 194, 280, 41, 25)
$Progress1 = GUICtrlCreateProgress(50, 284, 140, 17)
$Label17 = GUICtrlCreateLabel("", 8, 285, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
GUICtrlCreateLabel("",8,310, 230, 17, $SS_ETCHEDHORZ)
GUICtrlCreateLabel("AutoIT V3 更新器 【范例】  by:绿色风", 12,320, 240, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Dim $md = RegRead64('HKLM\Software\AutoIt v3\AutoIt', 'InstallDir') & '\AutoIt3.exe' ;获取autoit3的路径
_GetVer($md)
_getNew();获取更新


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Label7 ;本地地址
			ClipPut($md)
			MsgBox(0,"提示",$md&@CRLF&"路径已复制到剪贴板",2)
		Case $Label15 ;远程地址
			ClipPut($s_url)
			MsgBox(0,"提示",$s_url&@CRLF&"网址已复制到剪贴板",2)
		Case $Button1 ;下载
			_getDown()
	EndSwitch
WEnd

;获取本地程序信息
Func _GetVer($md)
	Local $ver = FileGetVersion($md, "FileVersion") ;获取文件版本信息
	Local $beij = FileGetVersion($md, "FileDescription") ;获取文件备注信息
	Local $md83 = FileGetShortName($md) ;返回 8.3格式路径
	Local $tarr = FileGetTime($md) ;修改时间
	If @error <> 0 Then
		GUICtrlSetData($Label6, "null")
	Else
		GUICtrlSetData($Label6, $tarr[0] & "年" & $tarr[1] & "月" & $tarr[2] & "日  " & $tarr[3] & ":" & $tarr[4] & ":" & $tarr[5]) ;修改时间
	EndIf
	GUICtrlSetData($Label5, $ver) ;版本
	If FileExists($md) Then
		If StringLen($md) > 25 Then
			GUICtrlSetData($Label7, StringLeft($md83, 22) & "...")
			GUICtrlSetTip($Label7, $md)
		Else
			GUICtrlSetData($Label7, $md)
		EndIf
	Else
		GUICtrlSetData($Label7, "nul")
	EndIf
	If StringLen($beij) > 25 Then
		GUICtrlSetData($Label8, StringLeft($beij, 22) & "...")
		GUICtrlSetTip($Label8, $beij)
	Else
		GUICtrlSetData($Label8, $beij)
	EndIf
EndFunc   ;==>_GetVer
;
;~ ===================================================================================示例用
;
;在注册表中获取  Autoit3的路径
Func RegRead64($sKeyname, $sValue)
	Local $res = RegRead($sKeyname, $sValue)
	If @error And @AutoItX64 Then
		$sKeyname = StringReplace($sKeyname, "HKEY_LOCAL_MACHINE", "HKLM")
		$sKeyname = StringReplace($sKeyname, "HKLM\SOFTWARE\", "HKLM\SOFTWARE\Wow6432Node\")
		$res = RegRead($sKeyname, $sValue)
		If @error Then
			SetError(1)
			Return ""
		EndIf
	EndIf
	SetError(0)
	Return $res
EndFunc   ;==>RegRead64
;
;获取更新的信息
Func _getNew()
	GUICtrlSetData($Label17, "检测中")
	Dim $V_V = 1 ;一个开关而以
	Local $url = "http://www.autoitscript.com/autoit3/files/beta/update.dat"
	Dim $Get_size = InetGetSize($url, 1)
	Dim $temp_file =  @TempDir & "\Au3_upDate.ini"
	Dim $Get_Dat = InetGet($url, $temp_file, 1, 1)
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	AdlibRegister("_getCK", 1000) ;检测下载
EndFunc   ;==>_getNew
;
;下载新程序
Func _getDown()
	GUICtrlSetData($Label17, "下载中")
	Local $url =  $s_url  ;下载地址
	Dim $V_V = 0 ;开关
	Dim $Get_size = $s_Size
	Dim $temp_file = @ScriptDir & "\Au3UP.exe"
	Dim $Get_Dat = InetGet($url, $temp_file, 1, 1)
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	AdlibRegister("_getCK", 1000) ;检测下载
EndFunc   ;==>_getNew
;
;检测下载
Func _getCK()
	GUICtrlSetData($Progress1, int (InetGetInfo($Get_Dat,0)/$Get_size * 100))
	If InetGetInfo($Get_Dat, 2) Then
		If InetGetInfo($Get_Dat, 3) = False Then
			$i_Res = MsgBox(5 + 16 + 8192, '出错啦!', '无法连接到官方服务器.' & @LF & _
					'请尝试下列操作:' & @LF & _
					' - 确认电脑已经连接到因特网' & @LF & _
					' - 防火墙不要禁止本程序连接到因特网' & @CRLF & _
					' - 登录 官方网站或者中文论坛 进行软件下载' & @LF & _
					' - 确认官方或者中文论坛还没有倒闭	ε|^_^|з')
			If $i_Res = 4 Then
				AdlibUnRegister("_getCK");取消检测
				_getNew()
			Else
				Exit ;退出程序
			EndIf
		Else
			InetClose($Get_Dat)
			AdlibUnRegister("_getCK") ;取消检测
			If $V_V = 1 Then _set_new() ;添加信息到gui中
			If $V_V = 0 Then _DownRun() ;下载完成
			GUICtrlSetData($Label17, "完成")
		EndIf
	EndIf
EndFunc   ;==>_getCK
;
;设置新的信息到gui中
Func _set_new()
	Dim $s_Ver = IniRead($temp_file, 'AutoIt', 'version', "nul")
	Dim $s_url = IniRead($temp_file, 'AutoIt', 'setup', 'nul')
	Dim $s_Page = IniRead($temp_file, 'AutoIt', 'index', 'http://www.autoitscript.com') ;这个改成你程序的备注设置
	Dim $s_Size = IniRead($temp_file, 'AutoIt', 'filesize', 0)
	$s_Date = IniRead($temp_file, 'AutoIt', 'filetime', 0)
	GUICtrlSetData($Label13, $s_Ver) ;版本
	GUICtrlSetData($Label14, StringLeft($s_Date,4)&"年"&StringRight(StringLeft($s_Date,6),2)&"月"&StringRight(StringLeft($s_Date,8),2)&"日 " & _ ;日期
					StringRight(StringLeft($s_Date,8),2)&":"&StringRight(StringLeft($s_Date,10),2)&":"&StringRight($s_Date,2)) ;时间
;~ 	GUICtrlSetData($Label15,$s_url)
	
	If StringLen($s_url) > 35 Then ;路径
		GUICtrlSetData($Label15, StringLeft($s_url, 32) & "...")
		GUICtrlSetTip($Label15, $s_url)
	Else
		GUICtrlSetData($Label15, $s_url)
	EndIf	
	If StringLen($s_Page) > 25 Then ;备注
		GUICtrlSetData($Label16, StringLeft($s_Page, 22) & "...")
		GUICtrlSetTip($Label16, $s_Page)
	Else
		GUICtrlSetData($Label16, $s_Page)
	EndIf
	FileDelete($temp_file)
EndFunc   ;==>_set_new
;
;运行下载的程序
Func _DownRun()
	Local $ver = MsgBox(1, "提示", $temp_file & @CRLF & "下载完成是否安装?")
	If $ver = 1 Then
		If @OSType = 'WIN32_NT' Then
			$s_StartStr = @ComSpec & ' /c start "" '
		Else
			$s_StartStr = @ComSpec & ' /c start '
		EndIf
		Run($s_StartStr & $temp_file, '', @SW_HIDE)
	EndIf
	Exit
EndFunc   ;==>_DownRun
 
