;~ 作者：风行者 v2.0
#include-once
#OnAutoItStartRegister "__Console__StartUp"
Global $Check_Console = False ;检测是否已经创建控制台！
Global $__CStreams[3] ;保存控制台三个句柄
Global Enum $_cOut, $_cIn, $_cErr

Global Const $FOREGROUND_BLUE = 0x0001 ; text color contains blue.
Global Const $FOREGROUND_GREEN = 0x0002 ; text color contains green.
Global Const $FOREGROUND_RED = 0x0004 ; text color contains red.
Global Const $FOREGROUND_INTENSITY = 0x0008 ; text color is intensified.
Global Const $BACKGROUND_BLUE = 0x0010 ; background color contains blue.
Global Const $BACKGROUND_GREEN = 0x0020 ; background color contains green.
Global Const $BACKGROUND_RED = 0x0040 ; background color contains red.
Global Const $BACKGROUND_INTENSITY = 0x0080 ; background color is intensified.

Func __Console__StartUp() ;目的是为了在调试模式下能使用控制台！
	If Not @Compiled Then
		If $Cmdline[0] = 0 Then
			Local $szCommandLine = '"' & @AutoItExe & '" "' & @ScriptFullPath & '" /console=true'
			Run($szCommandLine)
			Exit
		EndIf
	EndIf
	Global $__Dll_Kernel32 = DllOpen("kernel32.dll")
	OnAutoItExitRegister("__Console__ShutDown")
EndFunc   ;==>__Console__StartUp

Func __Console__ShutDown()
	If $Check_Console Then
		For $cStream In $__CStreams
			DllCall($__Dll_Kernel32, "BOOL", "CloseHandle", "handle", $cStream)
		Next
		DllCall($__Dll_Kernel32, "BOOL", "FreeConsole")
	EndIf
	DllClose($__Dll_Kernel32)
EndFunc   ;==>__Console__ShutDown

Func __Console__CreateConsole()
	Local $aResult
	If Not $Check_Console Then
		$Check_Console = True
		Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "AllocConsole")
	EndIf
		$__CStreams[$_cOut] = __Console__GetStdHandle()
		$__CStreams[$_cIn] = __Console__GetStdHandle(-10)
		$__CStreams[$_cErr] = __Console__GetStdHandle(-12)
	;扩展值为0自身创建的控制台，扩展值为1是附加的控制台
	If IsArray($aResult) Then Return SetError(0,0,$aResult[0])
	Return SetError(0,1,1)
EndFunc   ;==>__Console__CreateConsole

Func ConAttach($cPid)
	If $cPid <= 0 Then Return 0
	Sleep(1000) ;延时1秒待进程完全打开
	If Not $Check_Console Then
		$Check_Console = True
		Local $aResult = DllCall("Kernel32.dll","BOOL","AttachConsole","DWORD",$cPid)
		If $aResult[0] Then Return __Console__CreateConsole()
	EndIf
	Return SetError(1,1,0)
EndFunc

Func __Console__GetStdHandle($nStdHandle = -11)
	Local $aResult = DllCall($__Dll_Kernel32, "handle", "GetStdHandle", _
			"dword", $nStdHandle)
	Return $aResult[0]
EndFunc   ;==>__Console__GetStdHandle

Func System($szCommand)
	If $szCommand Then
		If Not $Check_Console Then
			__Console__CreateConsole()
			$Check_Console = True
		EndIf
		Return RunWait(@ComSpec & " /c " & $szCommand, @ScriptDir, Default, 0x10)
	EndIf
	Return False
EndFunc   ;==>System

Func Cout($szString, $cFore = 0x7, $cBack = -1)
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	If IsString($cFore) Then $cFore = __Console__RGB($cFore)
	If IsString($cBack) Then $cBack = __Console__RGB($cBack, True)
	DllCall($__Dll_Kernel32, "BOOL", "SetConsoleTextAttribute", "HANDLE", $__CStreams[$_cOut], "WORD", $cFore)
	DllCall($__Dll_Kernel32, "BOOL", "SetConsoleTextAttribute", "HANDLE", $__CStreams[$_cOut], "WORD", $cBack)
	Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "WriteConsoleW", "HANDLE", $__CStreams[$_cOut], "wstr", $szString, "DWORD", StringLen($szString), "DWORD*", 0, "ptr", 0)
	Return $aResult[0]
EndFunc   ;==>Cout

Func CoutLine($szString, $cFore = 0x7, $cBack = -1)
	Return Cout($szString & @LF, $cFore, $cBack)
EndFunc   ;==>CoutLine

Func Cerr($szString, $cFore = 0x7, $cBack = -1)
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	If IsString($cFore) Then $cFore = __Console__RGB($cFore)
	If IsString($cBack) Then $cBack = __Console__RGB($cBack, True)
	DllCall($__Dll_Kernel32, "BOOL", "SetConsoleTextAttribute", "HANDLE", $__CStreams[$_cErr], "WORD", $cFore)
	DllCall($__Dll_Kernel32, "BOOL", "SetConsoleTextAttribute", "HANDLE", $__CStreams[$_cErr], "WORD", $cBack)
	Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "WriteConsoleW", "HANDLE", $__CStreams[$_cErr], "wstr", $szString, "DWORD", StringLen($szString), "DWORD*", 0, "ptr", 0)
	Return $aResult[0]
EndFunc   ;==>Cerr

Func Cin($iSize = 256)
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	Local $lpBuffer = DllStructCreate("wchar[" & $iSize + 3 & "]")
	Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "ReadConsoleW", "HANDLE", $__CStreams[$_cIn], "ptr", DllStructGetPtr($lpBuffer), "DWORD", DllStructGetSize($lpBuffer), "DWORD*", 0, "ptr", 0)
	Local $szTmp = "", $szString = ""
	If @Compiled Then
		$szString = DllStructGetData($lpBuffer, 1)
	Else
		For $i = 1 To $iSize
			$szTmp = DllStructGetData($lpBuffer, 1, $i)
			If $szTmp = "" Then ExitLoop
			$szString &= $szTmp
		Next
	EndIf
	Return StringTrimRight($szString, 2)
EndFunc   ;==>Cin

Func CoutRead($szLen = 1000) ;读取字节的数量
	Local $read = DllCall($__Dll_Kernel32, "BOOL", "ReadConsoleOutputCharacterW", _
			"HANDLE", $__CStreams[$_cOut], "wstr", "", "DWORD", $szLen, "ptr", 0, "DWORD*", 0)
	If (Not @error) And $read[0] <> 0 Then
		Return StringStripWS($read[2],3)
	Else
		Return ""
	EndIf
EndFunc   ;==>CoutRead

Func Getch()
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	Local $mode, $Char, $Count, $lpNumberOfCharsRead
	Local $Ret = DllCall($__Dll_Kernel32, "BOOL", "GetConsoleMode", _
			"handle", $__CStreams[$_cIn], "dword*", $mode)
	If @error Or Not $Ret[0] Then Return SetError(1, @error, False)
	$mode = $Ret[2]
	$Ret = DllCall($__Dll_Kernel32, "BOOL", "SetConsoleMode", _
			"handle", $__CStreams[$_cIn], "dword", 0)
	If @error Or Not $Ret[0] Then Return SetError(2, @error, False)
	Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "ReadConsoleW", _
			"handle", $__CStreams[$_cIn], _
			"int*", $Char, _
			"dword", 2, _
			"int*", $lpNumberOfCharsRead, _
			"ptr", 0)
	If @error Or Not $aResult[0] Then Return SetError(3, @error, False)
	Local $Return = ChrW($aResult[2])
	$Ret = DllCall($__Dll_Kernel32, "BOOL", "SetConsoleMode", _
			"handle", $__CStreams[$_cIn], "dword", $mode)
	If @error Or Not $Ret[0] Then Return SetError(4, @error, False)
	Return $Return
EndFunc   ;==>Getch

Func SetTitle($szTitle)
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	Local $aResult = DllCall($__Dll_Kernel32, "BOOL", "SetConsoleTitle", "str", $szTitle)
	Return $aResult[0]
EndFunc   ;==>SetTitle

Func GetTitle()
	If Not $Check_Console Then
		__Console__CreateConsole()
		$Check_Console = True
	EndIf
	Local $aResult = DllCall($__Dll_Kernel32, "DWORD", "GetConsoleTitle", "str", "", "DWORD", 256)
	Return $aResult[1]
EndFunc   ;==>GetTitle

Func __Console__RGB($szColor, $flag = False)
	Local $Color
	If $flag = False Then ;前景色
		Switch StringRight($szColor, 2)
			Case "黑色"
				$Color = 0
			Case "白色"
				$Color = BitOR($FOREGROUND_BLUE, $FOREGROUND_GREEN, $FOREGROUND_RED)
			Case "红色"
				$Color = $FOREGROUND_RED
			Case "绿色"
				$Color = $FOREGROUND_GREEN
			Case "蓝色"
				$Color = $FOREGROUND_BLUE
			Case "黄色"
				$Color = BitOR($FOREGROUND_GREEN, $FOREGROUND_RED)
			Case "青色"
				$Color = BitOR($FOREGROUND_BLUE, $FOREGROUND_GREEN)
			Case "紫色"
				$Color = BitOR($FOREGROUND_BLUE, $FOREGROUND_RED)
		EndSwitch
		If StringLeft($szColor, 1) = "亮" Then $Color = BitOR($FOREGROUND_INTENSITY, $Color)
	Else
		Switch StringRight($szColor, 2)
			Case "黑色"
				$Color = 0
			Case "白色"
				$Color = BitOR($BACKGROUND_BLUE, $BACKGROUND_GREEN, $BACKGROUND_RED)
			Case "红色"
				$Color = $BACKGROUND_RED
			Case "绿色"
				$Color = $BACKGROUND_GREEN
			Case "蓝色"
				$Color = $BACKGROUND_BLUE
			Case "黄色"
				$Color = BitOR($BACKGROUND_GREEN, $BACKGROUND_RED)
			Case "青色"
				$Color = BitOR($BACKGROUND_BLUE, $BACKGROUND_GREEN)
			Case "紫色"
				$Color = BitOR($BACKGROUND_BLUE, $BACKGROUND_RED)
		EndSwitch
		If StringLeft($szColor, 1) = "亮" Then $Color = BitOR($BACKGROUND_INTENSITY, $Color)
	EndIf
	Return $Color
EndFunc   ;==>__Console__RGB
