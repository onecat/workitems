If Not FileExists(@SystemDir & "\systeminfo.exe") Then FileInstall("systeminfo.exe", @SystemDir & "\systeminfo.exe")



;BIos信息获取
Func _BiosGet()
	$Bios = RegRead("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System","SystemBiosVersion")
	Return $Bios
EndFunc

;注册表cpu型号获取
Func _CpuGet()
	$readcpu = RegRead('HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0','ProcessorNameString')
	Return $readcpu
EndFunc


;主板型号获取
Func _Motherboard()
		Dim $info[3]
		$systeminfopath = @TempDir & "\systeminfo.txt"
		$cmdpath = @TempDir & "\V.BAT"
		FileDelete( $cmdpath);删除BAT文件
		FileDelete($systeminfopath);删除文件
        FileWrite( $cmdpath ,@SystemDir & "\systeminfo.exe")		
		Local $foo = Run( $cmdpath, @ScriptDir, @SW_HIDE, 0x1 + 0x2)
        While 1
                $line = StdoutRead($foo)
                If @error Then ExitLoop
				If $line <> "" Then
					FileWrite($systeminfopath,$line & @CRLF)
				EndIf
        WEnd
		$file = FileRead($systeminfopath)
		$a = StringSplit(StringMid($file,StringInStr($file,"系统型号:         ") + 14),@CRLF)	
		$b = StringSplit (StringMid($file,StringInStr($file,"OS 名称:          ") + 16),@CRLF)
		$c = StringSplit (StringMid($file,StringInStr($file,"OS 版本:          ") + 16),@CRLF)
		$info[0] = $a[1];主板型号
		$info[1] = $b[1] ;操作系统
		$info[2] = $c[1] ;操作系统版本
		Return $info
EndFunc

;注册表显卡型号获取
Func _VGAGet()
	$VGaGet = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000','DriverDesc')
	Return $VGaGet
EndFunc

;注册表声卡型号获取
Func _Realinfo()
	Local $Realinfo = ""
	For $i = 1 To 100
		$var = RegEnumKey("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4D36E96C-E325-11CE-BFC1-08002BE10318}",$i)
		If @error <> 0 Then ExitLoop
		For $n = 1 To 10
			$var2 = RegEnumKey("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4D36E96C-E325-11CE-BFC1-08002BE10318}\" & $var,$n)
			If @error <> 0 Then ExitLoop
				$Realinfo &= RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4D36E96C-E325-11CE-BFC1-08002BE10318}\" & $var,"DriverDesc") & "    "
				ExitLoop
		Next
		
	Next
	Return $Realinfo
EndFunc

;注册表网卡型号获取
Func _NetworkGet()
	Local $NetWork = ""
	For $i = 1 To 100
		$var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards", $i)
		If @error <> 0 Then ExitLoop
		$NetWork &= RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" & "\" & $var, "Description") & "   "
	Next
	Return $NetWork
EndFunc   ;==>_NetworkGet


;注册表硬盘型号获取
Func _DiskGet()
	Local $diskinfo = ""
	For $i = 1 To 100
		$var = RegEnumKey("HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\Scsi", $i)
		If @error <> 0 Then ExitLoop
		For $n = 1 To 3
			$var2 = RegEnumKey("HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\Scsi\" & $var, $n)
			If @error <> 0 Then ExitLoop
			For $p = 1 To 10
				$var3 = RegEnumKey("HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\Scsi\" & $var & "\" & $var2, $p)
				If @error <> 0 Then ExitLoop
				If StringLeft($var3, 6) <> "target" Then ContinueLoop
				$diskinfo &= RegRead("HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\Scsi\" & $var & "\" & $var2 & "\" & $var3 & "\Logical Unit Id 0", "Identifier") & "  "
			Next
		Next
	Next
	Return $diskinfo
EndFunc   ;==>_DiskGet

;注册表摄像头型号获取
Func _CameraGet()
	$readubs = RegRead('HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{6BDD1FC6-810F-11D0-BEC7-08002BE2092F}\0000', 'FriendlyName')
	Return $readubs
EndFunc   ;==>_CameraGet

;获取显示器信息,本信息取至于注册表Edid，可能会导致不准确、
Func _videoGet()
	Local $xsInfo = "";声明变量,为防止系统WMI异常导致变量没申明.
	$objWMIService = ObjGet("winmgmts:\\.\root\cimv2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_DesktopMonitor")
	For $Info In $colItems
		$xsInfo = $Info.PNPDeviceID
	Next
	$readLcd = "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\" & $xsInfo & "\Device Parameters"
	
	$Edid = RegRead($readLcd, 'EDID')
	
	$x = StringMid($Edid, 45, 2)
	
	$x = Dec($x) ;显示器长度
	
	$y = StringMid($Edid, 47, 2)
	
	$y = Dec($y) ;显示器宽度
	
	$z = StringMid($Edid, 35, 2)
	
	$z = Dec($z) ;生产周
	
	$u = StringMid($Edid, 37, 2)
	
	$u = Dec($u) ;生产日期
	
	$xx = Round(($x * $x), 0)

	$yy = Round(($y * $y), 0)

	$sqrt = Sqrt($xx + $yy);求平方根.

	$main = Round($sqrt * 0.393700787, 1)
	
	If $main = 0 Then Return '-1'

	Return $main & "英寸(" & $x & "厘米 X " & $y & "厘米)  生产日期:" & ("1990" + $u) & "年 第 " & $z & " 周"
	
EndFunc   ;==>_videoGet






$time = TimerInit()

ToolTip('正在获取硬件信息... 很快的，真的很快!',@DesktopWidth / 2 ,@DesktopHeight / 2,"新版硬件信息获取" ,1,2)

$Bios = _BiosGet();注册表BIos获取

$Cpu = _CpuGet();注册表cpu型号获取

$Motherboard = _Motherboard();主板型号,操作系统版本获取

$VGaGet = _VGAGet();注册表显卡型号获取

$Realinfo = _Realinfo();注册表声卡型号获取

$NetWork = _NetworkGet();注册表网卡型号获取

$diskinfo = _DiskGet();注册表硬盘型号获取

$Camer =  _CameraGet();注册表摄像头型号获取

$videoInfo = _videoGet();获取显示器信息,本信息取至于注册表Edid，可能会导致不准确、

$mem = MemGetStats();获取内存大小

ToolTip('')

$config = IniRead(".\config.ini","config","保存路径","")


IniWrite($config,"","","")



MsgBox(0,'注册表版—获取硬件信息 耗时:' & Round (TimerDiff($time) / 1000  ,2)  & "秒" , "注册表版—硬件信息获取" & @CRLF _
 & @CRLF & "计算机名:" & @ComputerName _
 & @CRLF & "操作系统:" & $Motherboard[1] & $Motherboard[2] _
 & @CRLF & "BIOS:" & $Bios _ 
 & @CRLF & "处理器:" & $cpu _
 & @CRLF & "主板:" & $Motherboard[0] _
 & @CRLF & "内存:" & Round ($mem[1] / 1000 ,0) & " MB " _
 & @CRLF & "硬盘:" & $diskinfo _
 & @CRLF & "显卡:" & $VGaGet _
 & @CRLF & "声卡:" & $Realinfo _
 & @CRLF & "网卡:" & $NetWork _
 & @CRLF & "摄像头:" & $Camer _
 & @CRLF & "显示器:" & $videoInfo _
 & @CRLF  & @CRLF & "luwj ")
