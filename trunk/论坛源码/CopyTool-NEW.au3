#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\SHELL32.dll
#AutoIt3Wrapper_outfile=CopyTool.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Fileversion=3.10.0.38
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
#include <Date.au3>
#include <CoProc.au3>
#include <Array.au3>
#include <WinAPIEx.au3>
#include <Misc.au3>


If _Singleton("CopyTool", 1) = 0 Then
	MsgBox(0, "CopyTool", '"CopyTool"已经运行')
	Exit
EndIf




#Region ### START Koda GUI section ### Form=Z:\AU3\Form2.kxf

$Form1_1 = GUICreate("CopyTool", 779, 257)
$Group1 = GUICtrlCreateGroup("196", 25, 84, 729, 45)
$Button1 = GUICtrlCreateButton("开始拷贝", 55, 99, 65, 25)
$Button2 = GUICtrlCreateButton("停止拷贝", 55, 99, 65, 25)
$Button3 = GUICtrlCreateButton("查看日志", 125, 99, 73, 25)
$Label1 = GUICtrlCreateLabel("状态：", 202, 105, 54, 17)
$Label2 = GUICtrlCreateLabel("Standby                                                                 ", 240, 105, 480, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000FFF)
$Checkbox1 = GUICtrlCreateCheckbox("", 35, 103, 17, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Group2 = GUICtrlCreateGroup("197", 25, 131, 729, 45)
$Button4 = GUICtrlCreateButton("开始拷贝", 55, 146, 65, 25)
$Button5 = GUICtrlCreateButton("停止拷贝", 55, 146, 65, 25)
$Button6 = GUICtrlCreateButton("查看日志", 125, 146, 73, 25)
$Label3 = GUICtrlCreateLabel("状态：", 202, 152, 64, 17)
$Label4 = GUICtrlCreateLabel("Standby                                                                 ", 240, 152, 480, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif");
GUICtrlSetColor(-1, 0x000FFF)
$Checkbox2 = GUICtrlCreateCheckbox("", 35, 149, 17, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)



$Group15 = GUICtrlCreateGroup("自定义", 25, 178, 729, 45)
$Button43 = GUICtrlCreateButton("开始拷贝", 55, 193, 65, 25)
$Button44 = GUICtrlCreateButton("停止拷贝", 55, 193, 65, 25)
$Button45 = GUICtrlCreateButton("查看日志", 125, 193, 73, 25)
$Label29 = GUICtrlCreateLabel("状态：", 202, 199, 64, 17)
$Label30 = GUICtrlCreateLabel("Standby                                                                 ", 240, 199, 480, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000FFF)
$Checkbox15 = GUICtrlCreateCheckbox("", 35, 196, 17, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Input1 = GUICtrlCreateInput("", 94, 14, 550, 21)
$Input2 = GUICtrlCreateInput("", 94, 49, 657, 21)
$Input3 = GUICtrlCreateInput("10", 715, 14, 35, 21,$ES_CENTER)
$Label31 = GUICtrlCreateLabel("源路径", 25, 14, 43, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label32 = GUICtrlCreateLabel("目的路径", 25, 49, 56, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label33 = GUICtrlCreateLabel("：", 77, 17, 16, 17)
$Label34 = GUICtrlCreateLabel("：", 77, 51, 16, 17)
$Label35 = GUICtrlCreateLabel("进程数：", 653, 15, 53, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")

_GUICtrlButton_Show($Button2, False)
_GUICtrlButton_Show($Button5, False)
_GUICtrlButton_Show($Button44, False);将所有的停止拷贝按扭隐藏

ControlDisable("CopyTool", "", $Button1)
ControlDisable("CopyTool", "", $Button4)
ControlDisable("CopyTool", "", $Button43);将所有的开始拷贝按扭变成灰色不可用状态


GUISetState(@SW_SHOW)

_CoProcReciver("Reciver")
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $Button1
			If FileExists(GUICtrlRead($Input1)) And GUICtrlRead($Input2) <> "" And GUICtrlRead($Input3) <> "" And GUICtrlRead($Input3) > 0 And GUICtrlRead($Input3) <= 10 Then
				FileDelete (@ScriptDir & "\CopyTool\196\CopyTool.log")
;~ 				FileMove(@ScriptDir & "\CopyTool\196\CopyTool.log", @ScriptDir & "\CopyTool\196\CopyTool" & _NowCalc() & ".log", 9)
				_GUICtrlButton_Show($Button1, False)
				_GUICtrlButton_Show($Button2, True)
				ControlDisable("CopyTool", "", $Checkbox1)
				IniWrite(@ScriptDir & "\config196.ini", "CopyPath", "Spath", GUICtrlRead($Input1))
				IniWrite(@ScriptDir & "\config196.ini", "CopyPath", "Dpath", GUICtrlRead($Input2))
				IniWrite(@ScriptDir & "\config196.ini", "CopyPath", "Process", GUICtrlRead($Input3))
				$copy_196 = _CoProc("copy_196")
				Sleep(800)
				GUICtrlSetColor($Label2, 0x008000)				
			Else
				MsgBox(48, "错误", "源路径或目的路径配置错误,进程数请填写1-10个之内")
			EndIf
		Case $Button2
			_GUICtrlButton_Show($Button2, False)
			_GUICtrlButton_Show($Button1, True)
			ControlEnable("CopyTool", "", $Checkbox1)
			ControlDisable("CopyTool", "", $Button1)
			_GUICtrlButton_SetCheck($Checkbox1, $BST_UNCHECKED)
			ProcessClose($copy_196)
			$search = FileFindFirstFile(@ScriptDir & "\CopyTool\196\log\*.log")  
			While 1
			$file = FileFindNextFile($search) 
			If @error Then ExitLoop
			$str=FileRead(@ScriptDir & "\CopyTool\196\log\"&$file) 
			$log=FileOpen(@ScriptDir & "\CopyTool\196\CopyTool.log", 1)
			FileWrite(@ScriptDir & "\CopyTool\196\CopyTool.log",$str)
			FileClose($log)
			FileDelete(@ScriptDir & "\CopyTool\196\log\"&$file) 
			WEnd
			FileClose($search) ; 关闭搜索句柄
			DirRemove(@ScriptDir & "\CopyTool\196\log", 1)

			Do
				If ProcessExists("xcopy196.exe")<>0 Then ProcessClose("xcopy196.exe")
			Until ProcessExists("xcopy196.exe")=0
			GUICtrlSetData($Label2, "Cancelled by User")
			GUICtrlSetColor($Label2, 0xFF0000)
		Case $Button3
			$readlog_196 = _CoProc("readlog_196")
			ControlDisable("CopyTool", "", $Button3)
		Case $Button4
			If FileExists(GUICtrlRead($Input1)) And GUICtrlRead($Input2) <> "" And GUICtrlRead($Input3) <> "" And GUICtrlRead($Input3) > 0 And GUICtrlRead($Input3) <= 10 Then
				FileDelete (@ScriptDir & "\CopyTool\197\CopyTool.log")
;~ 				FileMove(@ScriptDir & "\CopyTool\197\CopyTool.log", @ScriptDir & "\CopyTool\197\CopyTool" & _NowCalc() & ".log", 9)
				_GUICtrlButton_Show($Button4, False)
				_GUICtrlButton_Show($Button5, True)
				ControlDisable("CopyTool", "", $Checkbox2)
				IniWrite(@ScriptDir & "\config197.ini", "CopyPath", "Spath", GUICtrlRead($Input1))
				IniWrite(@ScriptDir & "\config197.ini", "CopyPath", "Dpath", GUICtrlRead($Input2))
				IniWrite(@ScriptDir & "\config197.ini", "CopyPath", "Process", GUICtrlRead($Input3))
				$copy_197 = _CoProc("copy_197")
				Sleep(800)
				GUICtrlSetColor($Label4, 0x008000)	
			Else
				MsgBox(48, "错误", "源路径或目的路径配置错误,进程数请填写1-10个之内")
			EndIf
		Case $Button5
			_GUICtrlButton_Show($Button5, False)
			_GUICtrlButton_Show($Button4, True)
			ControlEnable("CopyTool", "", $Checkbox2)
			ControlDisable("CopyTool", "", $Button4)
			_GUICtrlButton_SetCheck($Checkbox2, $BST_UNCHECKED)
			ProcessClose($copy_197)
			$search = FileFindFirstFile(@ScriptDir & "\CopyTool\197\log\*.log")  
			While 1
			$file = FileFindNextFile($search) 
			If @error Then ExitLoop
			$str=FileRead(@ScriptDir & "\CopyTool\197\log\"&$file) 
			$log=FileOpen(@ScriptDir & "\CopyTool\197\CopyTool.log", 1)
			FileWrite(@ScriptDir & "\CopyTool\197\CopyTool.log",$str)
			FileClose($log)
			FileDelete(@ScriptDir & "\CopyTool\197\log\"&$file) 
			WEnd
			FileClose($search) ; 关闭搜索句柄
			DirRemove(@ScriptDir & "\CopyTool\197\log", 1)

			Do
				If ProcessExists("xcopy197.exe")<>0 Then ProcessClose("xcopy197.exe")
			Until ProcessExists("xcopy197.exe")=0
			GUICtrlSetData($Label4, "Cancelled by User")
			GUICtrlSetColor($Label4, 0xFF0000)
		Case $Button6
			$readlog_197 = _CoProc("readlog_197")
			ControlDisable("CopyTool", "", $Button6)
		
		Case $Button43
			$resultIP = FileExists(@ScriptDir & "\IP.txt")
			If $resultIP = 1 Then
			If FileExists(GUICtrlRead($Input1)) And GUICtrlRead($Input2) <> "" And GUICtrlRead($Input3) <> "" And GUICtrlRead($Input3) > 0 And GUICtrlRead($Input3) <= 10 Then
					FileDelete (@ScriptDir & "\CopyTool\UserDefined\CopyTool.log")
;~ 					FileMove(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log", @ScriptDir & "\CopyTool\UserDefined\CopyTool" & _NowCalc() & ".log", 9)
					_GUICtrlButton_Show($Button43, False)
					_GUICtrlButton_Show($Button44, True)
					ControlDisable("CopyTool", "", $Checkbox15)
					IniWrite(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Spath", GUICtrlRead($Input1))
					IniWrite(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Dpath", GUICtrlRead($Input2))
					IniWrite(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Process", GUICtrlRead($Input3))
					$copy_UserDefined = _CoProc("copy_UserDefined")
					Sleep(800)
				GUICtrlSetColor($Label30, 0x008000)
				Else
					MsgBox(48, "错误", "源路径或目的路径配置错误,进程数请填写1-10个之内")
				EndIf
			Else
				MsgBox(16, "错误", "没有找到IP.txt文件")
			EndIf
		Case $Button44
			_GUICtrlButton_Show($Button44, False)
			_GUICtrlButton_Show($Button43, True)
			ControlEnable("CopyTool", "", $Checkbox15)
			ControlDisable("CopyTool", "", $Button43)
			_GUICtrlButton_SetCheck($Checkbox15, $BST_UNCHECKED)
			ProcessClose($copy_UserDefined)
			$search = FileFindFirstFile(@ScriptDir & "\CopyTool\UserDefined\log\*.log")  
			While 1
			$file = FileFindNextFile($search) 
			If @error Then ExitLoop
			$str=FileRead(@ScriptDir & "\CopyTool\UserDefined\log\"&$file) 
			$log=FileOpen(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log", 1)
			FileWrite(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log",$str)
			FileClose($log)
			FileDelete(@ScriptDir & "\CopyTool\UserDefined\log\"&$file) 
			WEnd
			FileClose($search) ; 关闭搜索句柄
			DirRemove(@ScriptDir & "\CopyTool\UserDefined\log", 1)

			Do
				If ProcessExists("xcopyUserDefined.exe")<>0 Then ProcessClose("xcopyUserDefined.exe")
			Until ProcessExists("xcopyUserDefined.exe")=0
			GUICtrlSetData($Label30, "Cancelled by User")
			GUICtrlSetColor($Label30, 0xFF0000)
		Case $Button45
			$readlog_UserDefined = _CoProc("readlog_UserDefined")
			ControlDisable("CopyTool", "", $Button45)
			
		Case $Checkbox1
			If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then
				ControlEnable("CopyTool", "", $Button1)
			Else
				ControlDisable("CopyTool", "", $Button1)
			EndIf
		Case $Checkbox2
			If GUICtrlRead($Checkbox2) = $GUI_CHECKED Then
				ControlEnable("CopyTool", "", $Button4)
			Else
				ControlDisable("CopyTool", "", $Button4)
			EndIf

		Case $Checkbox15
			If GUICtrlRead($Checkbox15) = $GUI_CHECKED Then
				ControlEnable("CopyTool", "", $Button43)
			Else
				ControlDisable("CopyTool", "", $Button43)
			EndIf
			
		Case $GUI_EVENT_CLOSE
			Local $vlan[3] = ["196","197","UserDefined"]
			
			For $i=0 To 2
			If FileExists(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\log") Then
			$search = FileFindFirstFile(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\log\*.log")  
			While 1
			$file = FileFindNextFile($search) 
			If @error Then ExitLoop
			$str=FileRead(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\log\"&$file) 
			$log=FileOpen(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\CopyTool.log", 1)
			FileWrite(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\CopyTool.log",$str)
			FileClose($log)
			FileDelete(@ScriptDir & "\CopyTool\"& $vlan[$i] & "\log\"&$file) 
			WEnd
			FileClose($search) ; 关闭搜索句柄
			DirRemove(@ScriptDir & "\CopyTool\"& $vlan[$i] &"\log", 1)
			EndIf
			Next
			
			$aChild = _WinAPI_EnumChildProcess(@AutoItPID)
			If @error Then
			$aProc=processlist()
			$aRes = _ArrayFindAll($aProc, 'xcopy', 0 , 0 , 0 , 1)
			$proces_sum=ubound($aRes)		;读取xcopy.exe 的进程数组(包含xcopy字母的exe进程数)
			if $proces_sum > 0 Then
			For $i=1 To $proces_sum
			ProcessClose($aProc[$aRes[$i]][1])
			next
			EndIf
				Exit
			Else
				If $aChild[0][0] <> 0 Then
					For $i = 1 To $aChild[0][0]
						ProcessClose($aChild[$i][0])
					Next
					
			$aProc=processlist()
			$aRes = _ArrayFindAll($aProc, 'xcopy', 0 , 0 , 0 , 1)
			$proces_sum=ubound($aRes)		;读取xcopy.exe 的进程数组(包含xcopy字母的exe进程数)
			if $proces_sum > 0 Then
			For $i=1 To $proces_sum
			ProcessClose($aProc[$aRes[$i]][1])
			next
			endif
				EndIf
				Exit
			EndIf
			Exit

	EndSwitch
WEnd

Func Reciver($vParameter)
	;$vParameter里就是子进程发来的消息
	$aParam = StringSplit($vParameter, "|")
	If $aParam[1] = "copy_196" And StringLeft ($aParam[2],7) = "The End" Then
		If StringLen ($aParam[2])> 80 Then
		$stringleft=StringLeft ( $aParam[2],30 )
		$stringright=StringRight($aParam[2], 40 )
		$aParam[2]=$stringleft&". . . . . ."&$stringright
		EndIf
		_GUICtrlButton_Show($Button2, False)
		_GUICtrlButton_Show($Button1, True)
		ControlEnable("CopyTool", "", $Checkbox1)
		ControlDisable("CopyTool", "", $Button1)
		_GUICtrlButton_SetCheck($Checkbox1, $BST_UNCHECKED)
		GUICtrlSetData($Label2, $aParam[2])
	ElseIf $aParam[1] = "copy_196" And $aParam[2] = "Log End" Then
		ControlEnable("CopyTool", "", $Button3)
	ElseIf $aParam[1] = "copy_196" And $aParam[2] <> "The End" Then
		If StringLen ($aParam[2])> 80 Then
		$stringleft=StringLeft ( $aParam[2],30 )
		$stringright=StringRight($aParam[2], 40 )
		$aParam[2]=$stringleft&". . . . . ."&$stringright
		EndIf
		GUICtrlSetData($Label2, $aParam[2])
		
	ElseIf $aParam[1] = "copy_197" And StringLeft ($aParam[2],7) = "The End" Then
		If StringLen ($aParam[2])> 80 Then
		$stringleft=StringLeft ( $aParam[2],30 )
		$stringright=StringRight($aParam[2], 40 )
		$aParam[2]=$stringleft&". . . . . ."&$stringright
		EndIf
		_GUICtrlButton_Show($Button5, False)
		_GUICtrlButton_Show($Button4, True)
		ControlEnable("CopyTool", "", $Checkbox2)
		ControlDisable("CopyTool", "", $Button4)
		_GUICtrlButton_SetCheck($Checkbox2, $BST_UNCHECKED)
		GUICtrlSetData($Label4, $aParam[2])
	ElseIf $aParam[1] = "copy_197" And $aParam[2] = "Log End" Then
		ControlEnable("CopyTool", "", $Button6)
	ElseIf $aParam[1] = "copy_197" And $aParam[2] <> "The End" Then
		If StringLen ($aParam[2])> 80 Then
		$stringleft=StringLeft ( $aParam[2],30 )
		$stringright=StringRight($aParam[2], 40 )
		$aParam[2]=$stringleft&". . . . . ."&$stringright
		EndIf
		GUICtrlSetData($Label4, $aParam[2])
		

		
	ElseIf $aParam[1] = "copy_UserDefined" And StringLeft ($aParam[2],7) = "The End" Then
			If StringLen ($aParam[2])> 80 Then
			$stringleft=StringLeft ( $aParam[2],30 )
			$stringright=StringRight($aParam[2], 40 )
			$aParam[2]=$stringleft&". . . . . ."&$stringright
			EndIf
		_GUICtrlButton_Show($Button44, False)
		_GUICtrlButton_Show($Button43, True)
		ControlEnable("CopyTool", "", $Checkbox15)
		ControlDisable("CopyTool", "", $Button43)
		_GUICtrlButton_SetCheck($Checkbox15, $BST_UNCHECKED)
		GUICtrlSetData($Label30, $aParam[2])
	ElseIf $aParam[1] = "copy_UserDefined" And $aParam[2] = "Log End" Then
		ControlEnable("CopyTool", "", $Button45)
	ElseIf $aParam[1] = "copy_UserDefined" And $aParam[2] <> "The End" Then
			If StringLen ($aParam[2])> 80 Then
			$stringleft=StringLeft ( $aParam[2],30 )
			$stringright=StringRight($aParam[2], 40 )
			$aParam[2]=$stringleft&". . . . . ."&$stringright
			EndIf
		GUICtrlSetData($Label30, $aParam[2])
	EndIf
EndFunc   ;==>Reciver

;~ --196---------------------------------------------------------------------------------------------------------------------------------------
Func copy_196()
	$Input1 = IniRead(@ScriptDir & "\config196.ini", "CopyPath", "Spath", "NotFound")
	$Input2 = IniRead(@ScriptDir & "\config196.ini", "CopyPath", "Dpath", "NotFound")
	$Process = IniRead(@ScriptDir & "\config196.ini", "CopyPath", "Process", "NotFound")

	FileDelete(@ScriptDir & "\config196.ini")
	FileInstall("D:\au3test\xcopy.exe", @ScriptDir & "\CopyTool\196\xcopy196.exe",1)
	If StringRight($Input2, 1) = "\" Then
		$Input2 = StringTrimRight($Input2, 1)
	EndIf
	If StringRight($Input1, 1) <> "\" Then
		$Input1 = $Input1&"\"
	EndIf
	$Input2 = StringReplace($Input2, ":", "$", 0)
	FileDelete(@ScriptDir&"\CopyTool\196\bat\*.*")
	FileDelete(@ScriptDir&"\CopyTool\196\log\*.*")
	DirCreate (@ScriptDir&"\CopyTool\196\log\")
	For $i = 1 To 68
	While 1
        Sleep(500)
		$proces_sum=ProcessList ( "xcopy196.exe" );读取xcopy.exe 的进程数组
		if $proces_sum[0][0] < $Process Then  ; 如果少于$Process个 xcopy.exe 进程 则再读取--运行
		$Dpath = "\\192.168.196." & $i & "\" & $Input2
		$result1 = Ping("192.168.196." & $i, 4000)
		$result2 = Ping("192.168.196." & $i, 4000)
			If $result1 = 0 And $result2=0 Then
			_CoProcSend($gi_CoProcParent, "copy_196|" & "目的路径：" & $Dpath & "                                 ")
			$log=FileOpen(@ScriptDir&"\CopyTool\196\log\196."&$i&".log", 1)
			FileWrite(@ScriptDir&"\CopyTool\196\log\196."&$i&".log", '[DestDir]  ' & $Dpath &	' [Result] : *Ping Time Out*' & @CRLF)
			FileClose($log)
			ExitLoop
		Else
			_CoProcSend($gi_CoProcParent, "copy_196|" & "目的路径：" & $Dpath & "                              ")
			$bat=FileOpen(@ScriptDir&"\CopyTool\196\bat\196."&$i&".bat", 9)
			
			FileWrite(@ScriptDir&"\CopyTool\196\bat\196."&$i&".bat", '@echo off' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & @CRLF & _
			 @ScriptDir & '\CopyTool\196\xcopy196.exe /r /e /i /y '&$Input1&'*.* '& $Dpath & @CRLF & _
			'if errorlevel 1 goto fail' & @CRLF & _
			':pass' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Successful* >>'& @ScriptDir&"\CopyTool\196\log\196."&$i&".log" & @CRLF & _
			'goto end' & @CRLF & _
			':fail' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Failure* >>'& @ScriptDir&"\CopyTool\196\log\196."&$i&".log" & @CRLF & _
			':end')
			
			FileClose($bat)
			Run(@ComSpec & " /c " & @ScriptDir&"\CopyTool\196\bat\196."&$i&".bat",@SystemDir,@SW_HIDE)
			ExitLoop
		EndIf
		EndIf
	WEnd
	Next
	Do
		If ProcessExists("xcopy196.exe")<>0 Then Sleep(500)
	Until ProcessExists("xcopy196.exe")=0

	_CoProcSend($gi_CoProcParent, "copy_196|The End 路径："&$Input2& "                              ")
EndFunc   ;==>copy_196

Func readlog_196()
	Local $a,$log,$str
	
	$search = FileFindFirstFile(@ScriptDir & "\CopyTool\196\log\*.log")  
	While 1
    $file = FileFindNextFile($search) 
    If @error Then ExitLoop
	$str=FileRead(@ScriptDir & "\CopyTool\196\log\"&$file) 
		$log=FileOpen(@ScriptDir & "\CopyTool\196\CopyTool.log", 1)
		FileWrite(@ScriptDir & "\CopyTool\196\CopyTool.log",$str)
		FileClose($log)
		FileDelete(@ScriptDir & "\CopyTool\196\log\"&$file) 
	WEnd
	FileClose($search) ; 关闭搜索句柄
 	$result = FileExists(@ScriptDir & "\CopyTool\196\CopyTool.log")
	If $result = 1 Then
		GUICreate("196 拷贝日志", 320, 620, 950)
		$listview = GUICtrlCreateListView("序号|IP地址|○成功/×失败", 10, 30, 300, 575)
		$Test = FileRead(@ScriptDir & "\CopyTool\196\CopyTool.log")
		$array = StringSplit($Test, @LF)
		$k = 1
		$Successful = 0
		$Fail = 0
		For $i = 1 To 68
			$ipadd = "192.168.196." & $i
			For $j = 1 To $array[0] - 1
				$a = 0
				$result1 = StringInStr($array[$j], $ipadd)
				$result2 = StringInStr($array[$j], "*Successful* ")
				If $result1 <> 0 And $result2 <> 0 Then
					$a = 1
					ExitLoop
				EndIf
			Next
			If $a = 1 Then
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|○○○", $listview)
				$Successful += 1
			Else
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|×××××", $listview)
				$Fail += 1
			EndIf
			$k += 1
		Next
		GUICtrlCreateLabel("共:" & $Successful + $Fail & "台", 10, 10)
		GUICtrlCreateLabel("成功:" & $Successful & "台", 80, 10) 
		GUICtrlCreateLabel("失败:" & $Fail & "台", 150, 10)
		$Button1 = GUICtrlCreateButton("打开日志文件", 230, 3)
		GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; 允许拖放
		GUISetState()
		Do
			$msg = GUIGetMsg()
			Select
				Case $msg = $Button1
					Run("Notepad.exe " & @ScriptDir & "\CopyTool\196\CopyTool.log", "", @SW_MAXIMIZE)
			EndSelect
		Until $msg = $GUI_EVENT_CLOSE
		_CoProcSend($gi_CoProcParent, "copy_196|Log End")
	Else
		MsgBox(16, "错误", "没有找到日志文件")
	EndIf
	_CoProcSend($gi_CoProcParent, "copy_196|Log End")
EndFunc   ;==>readlog_196
;~ --197---------------------------------------------------------------------------------------------------------------------------------------
Func copy_197()
	$Input1 = IniRead(@ScriptDir & "\config197.ini", "CopyPath", "Spath", "NotFound")
	$Input2 = IniRead(@ScriptDir & "\config197.ini", "CopyPath", "Dpath", "NotFound")
	$Process = IniRead(@ScriptDir & "\config197.ini", "CopyPath", "Process", "NotFound")

	FileDelete(@ScriptDir & "\config197.ini")
	FileInstall("D:\au3test\xcopy.exe", @ScriptDir & "\CopyTool\197\xcopy197.exe",1)
	If StringRight($Input2, 1) = "\" Then
		$Input2 = StringTrimRight($Input2, 1)
	EndIf
	If StringRight($Input1, 1) <> "\" Then
		$Input1 = $Input1&"\"
	EndIf
	$Input2 = StringReplace($Input2, ":", "$", 0)
	FileDelete(@ScriptDir&"\CopyTool\197\bat\*.*")
	DirCreate (@ScriptDir&"\CopyTool\197\log\")
	For $i = 51 To 218
	While 1
        Sleep(500)
		$proces_sum=ProcessList ( "xcopy197.exe" );读取xcopy.exe 的进程数组
		if $proces_sum[0][0] < $Process Then  ; 如果少于$Process个 xcopy.exe 进程 则再读取--运行
		$Dpath = "\\192.168.197." & $i & "\" & $Input2
		$result1 = Ping("192.168.197." & $i, 4000)
		$result2 = Ping("192.168.197." & $i, 4000)
		If $result1 = 0 And $result2=0 Then
			_CoProcSend($gi_CoProcParent, "copy_197|" & "目的路径：" & $Dpath & "                                 ")
			$log=FileOpen(@ScriptDir&"\CopyTool\197\log\197."&$i&".log", 1)
			FileWrite(@ScriptDir&"\CopyTool\197\log\197."&$i&".log", '[DestDir]  ' & $Dpath &	' [Result] : *Ping Time Out*' & @CRLF)
			FileClose($log)
			ExitLoop
		Else
			_CoProcSend($gi_CoProcParent, "copy_197|" & "目的路径：" & $Dpath & "                              ")
			$bat=FileOpen(@ScriptDir&"\CopyTool\197\bat\197."&$i&".bat", 9)
			
			FileWrite(@ScriptDir&"\CopyTool\197\bat\197."&$i&".bat", '@echo off' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & @CRLF & _
			 @ScriptDir & '\CopyTool\197\xcopy197.exe /r /e /i /y '&$Input1&'*.* '& $Dpath & @CRLF & _
			'if errorlevel 1 goto fail' & @CRLF & _
			':pass' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Successful* >>'& @ScriptDir&"\CopyTool\197\log\197."&$i&".log" & @CRLF & _
			'goto end' & @CRLF & _
			':fail' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Failure* >>'& @ScriptDir&"\CopyTool\197\log\197."&$i&".log" & @CRLF & _
			':end')
			
			FileClose($bat)
			Run(@ComSpec & " /c " & @ScriptDir&"\CopyTool\197\bat\197."&$i&".bat",@SystemDir,@SW_HIDE)
			ExitLoop
		EndIf
		EndIf
	WEnd
	Next
	Do
		If ProcessExists("xcopy197.exe")<>0 Then Sleep(500)
	Until ProcessExists("xcopy197.exe")=0

	_CoProcSend($gi_CoProcParent, "copy_197|The End 路径："&$Input2& "                              ")
EndFunc   ;==>copy_197

Func readlog_197()
	Local $a,$log,$str
	
	$search = FileFindFirstFile(@ScriptDir & "\CopyTool\197\log\*.log")  
	While 1
    $file = FileFindNextFile($search) 
    If @error Then ExitLoop
	$str=FileRead(@ScriptDir & "\CopyTool\197\log\"&$file) 
		$log=FileOpen(@ScriptDir & "\CopyTool\197\CopyTool.log", 1)
		FileWrite(@ScriptDir & "\CopyTool\197\CopyTool.log",$str)
		FileClose($log)
		FileDelete(@ScriptDir & "\CopyTool\197\log\"&$file) 
	WEnd
	FileClose($search) ; 关闭搜索句柄
 	$result = FileExists(@ScriptDir & "\CopyTool\197\CopyTool.log")
	If $result = 1 Then
		GUICreate("197 拷贝日志", 320, 620, 950)
		$listview = GUICtrlCreateListView("序号|IP地址|○成功/×失败", 10, 30, 300, 575)
		$Test = FileRead(@ScriptDir & "\CopyTool\197\CopyTool.log")
		$array = StringSplit($Test, @LF)
		$k = 1
		$Successful = 0
		$Fail = 0
		For $i = 51 To 218
			$ipadd = "192.168.197." & $i
			For $j = 1 To $array[0] - 1
				$a = 0
				$result1 = StringInStr($array[$j], $ipadd)
				$result2 = StringInStr($array[$j], "*Successful* ")
				If $result1 <> 0 And $result2 <> 0 Then
					$a = 1
					ExitLoop
				EndIf
			Next
			If $a = 1 Then
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|○○○", $listview)
				$Successful += 1
			Else
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|×××××", $listview)
				$Fail += 1
			EndIf
			$k += 1
		Next
		GUICtrlCreateLabel("共:" & $Successful + $Fail & "台", 10, 10)
		GUICtrlCreateLabel("成功:" & $Successful & "台", 80, 10) 
		GUICtrlCreateLabel("失败:" & $Fail & "台", 150, 10)
		$Button1 = GUICtrlCreateButton("打开日志文件", 230, 3)
		GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; 允许拖放
		GUISetState()
		Do
			$msg = GUIGetMsg()
			Select
				Case $msg = $Button1
					Run("Notepad.exe " & @ScriptDir & "\CopyTool\197\CopyTool.log", "", @SW_MAXIMIZE)
			EndSelect
		Until $msg = $GUI_EVENT_CLOSE
		_CoProcSend($gi_CoProcParent, "copy_197|Log End")
	Else
		MsgBox(16, "错误", "没有找到日志文件")
	EndIf
	_CoProcSend($gi_CoProcParent, "copy_197|Log End")
EndFunc   ;==>readlog_197

;~ --UserDefined---------------------------------------------------------------------------------------------------------------------------------------
Func copy_UserDefined()
	$Input1 = IniRead(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Spath", "NotFound")
	$Input2 = IniRead(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Dpath", "NotFound")
	$Process = IniRead(@ScriptDir & "\configUserDefined.ini", "CopyPath", "Process", "NotFound")

	FileDelete(@ScriptDir & "\configUserDefined.ini")
	FileInstall("D:\au3test\xcopy.exe", @ScriptDir & "\CopyTool\UserDefined\xcopyUserDefined.exe",1)
	If StringRight($Input2, 1) = "\" Then
		$Input2 = StringTrimRight($Input2, 1)
	EndIf
	If StringRight($Input1, 1) <> "\" Then
		$Input1 = $Input1&"\"
	EndIf
	$Input2 = StringReplace($Input2, ":", "$", 0)
	FileDelete(@ScriptDir&"\CopyTool\UserDefined\bat\*.*")
	FileDelete(@ScriptDir&"\CopyTool\UserDefined\log\*.*")
	DirCreate (@ScriptDir&"\CopyTool\UserDefined\log\")
	$file = FileOpen(@ScriptDir & "\IP.TXT", 0)
	While 1
		$line = FileReadLine($file)
		If @error = -1 Then ExitLoop
		If $line <> "" Then
	While 1
        Sleep(500)
		$proces_sum=ProcessList ( "xcopyUserDefined.exe" );读取xcopy.exe 的进程数组
		If $proces_sum[0][0] < $Process Then  ; 如果少于$Process个 xcopy.exe 进程 则再读取--运行
		$Dpath = "\\" & $line & "\" & $Input2
		$result1 = Ping($line, 4000)
		$result2 = Ping($line, 4000)
		If $result1 = 0 And $result2=0 Then
			_CoProcSend($gi_CoProcParent, "copy_UserDefined|" & "目的路径：" & $Dpath & "                                 ")
			$log=FileOpen(@ScriptDir&"\CopyTool\UserDefined\log\"&$line&".log", 1)
			FileWrite(@ScriptDir&"\CopyTool\UserDefined\log\"&$line&".log", '[DestDir]  ' & $Dpath &	' [Result] : *Ping Time Out*' & @CRLF)
			FileClose($log)
			ExitLoop
		Else
			_CoProcSend($gi_CoProcParent, "copy_UserDefined|" & "目的路径：" & $Dpath & "                              ")
			$bat=FileOpen(@ScriptDir&"\CopyTool\UserDefined\bat\"&$line&".bat", 9)
			
			FileWrite(@ScriptDir&"\CopyTool\UserDefined\bat\"&$line&".bat", '@echo off' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & @CRLF & _
			 @ScriptDir & '\CopyTool\UserDefined\xcopyUserDefined.exe /r /e /i /y '&$Input1&'*.* '& $Dpath & @CRLF & _
			'if errorlevel 1 goto fail' & @CRLF & _
			':pass' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Successful* >>'& @ScriptDir&"\CopyTool\UserDefined\log\"&$line&".log" & @CRLF & _
			'goto end' & @CRLF & _
			':fail' & @CRLF & _
			'echo [DestDir]  ' & $Dpath & ' [Result] : *Failure* >>'& @ScriptDir&"\CopyTool\UserDefined\log\"&$line&".log" & @CRLF & _
			':end')
			
			FileClose($bat)
			Run(@ComSpec & " /c " & @ScriptDir&"\CopyTool\UserDefined\bat\"&$line&".bat",@SystemDir,@SW_HIDE)
			ExitLoop
		EndIf
		EndIf
	WEnd
	EndIf
	WEnd
	Sleep(1000)
	Do
		If ProcessExists("xcopyUserDefined.exe")<>0 Then Sleep(500)
	Until ProcessExists("xcopyUserDefined.exe")=0

	_CoProcSend($gi_CoProcParent, "copy_UserDefined|The End 路径："&$Input2& "                              ")
EndFunc   ;==>copy_UserDefined

Func readlog_UserDefined()
	Local $a,$log,$str
	
	$search = FileFindFirstFile(@ScriptDir & "\CopyTool\UserDefined\log\*.log")  
	While 1
    $file = FileFindNextFile($search) 
    If @error Then ExitLoop
	$str=FileRead(@ScriptDir & "\CopyTool\UserDefined\log\"&$file) 
		$log=FileOpen(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log", 1)
		FileWrite(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log",$str)
		FileClose($log)
		FileDelete(@ScriptDir & "\CopyTool\UserDefined\log\"&$file) 
	WEnd
	FileClose($search) ; 关闭搜索句柄
 	$result = FileExists(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log")
	
	
	If $result = 1 Then
		GUICreate("自定义 拷贝日志", 320, 620, 950)
		$listview = GUICtrlCreateListView("序号|IP地址|○成功/×失败", 10, 30, 300, 575)
		$Test = FileRead(@ScriptDir & "\CopyTool\UserDefined\CopyTool.log")
		$array = StringSplit($Test, @LF)
		$k = 1
		$Successful = 0
		$Fail = 0
		
		
		$file = FileOpen(@ScriptDir & "\IP.TXT", 0)
		While 1
			$line = FileReadLine($file)
			If @error = -1 Then ExitLoop
			If $line <> "" Then $ipadd=$line
			For $j = 1 To $array[0] - 1
				$a = 0
				$result1 = StringInStr($array[$j], $ipadd)
				$result2 = StringInStr($array[$j], "*Successful* ")
				If $result1 <> 0 And $result2 <> 0 Then
					$a = 1
					ExitLoop
				EndIf
			Next
			If $a = 1 Then
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|○○○", $listview)
				$Successful += 1
			Else
				GUICtrlCreateListViewItem($k & "|" & $ipadd & "|×××××", $listview)
				$Fail += 1
			EndIf
			$k += 1
		WEnd
		GUICtrlCreateLabel("共:" & $Successful + $Fail & "台", 10, 10)
		GUICtrlCreateLabel("成功:" & $Successful & "台", 80, 10) 
		GUICtrlCreateLabel("失败:" & $Fail & "台", 150, 10)
		$Button1 = GUICtrlCreateButton("打开日志文件", 230, 3)
		GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; 允许拖放
		GUISetState()
		Do
			$msg = GUIGetMsg()
			Select
				Case $msg = $Button1
					Run("Notepad.exe " & @ScriptDir & "\CopyTool\UserDefined\CopyTool.log", "", @SW_MAXIMIZE)
			EndSelect
		Until $msg = $GUI_EVENT_CLOSE
		_CoProcSend($gi_CoProcParent, "copy_UserDefined|Log End")
	Else
		MsgBox(16, "错误", "没有找到日志文件")
	EndIf
	_CoProcSend($gi_CoProcParent, "copy_UserDefined|Log End")
EndFunc   ;==>readlog_UserDefined


