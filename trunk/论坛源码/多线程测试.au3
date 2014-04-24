#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_UseUpx=n
#PRE_UseX64=n
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;#include <Date.au3>
#include <winapi.au3>
Opt('GUIOnEventMode', 1)
#region ### START Koda GUI section ### Form=
GUICreate("", 200, @DesktopHeight * 0.125 * 0.5, 0, 0, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
Global $hStatic = GUICtrlCreateLabel("00:00:00", 0, 0, 200, @DesktopHeight * 0.125 * 0.5, $SS_CENTER, -1)
GUICtrlSetBkColor(-1, 0x00ff00)
GUICtrlSetColor(-1, 000000)
GUICtrlSetFont(-1, 32, 400, 0, "Arial Black")
GUISetOnEvent(-3, 'onEvent')
Global $hThread, $hExit
Global $sFormat = DllStructCreate('wchar[16]');全局指针，线程不退出时不允许释放
Global $pMsg = DllStructCreate('wchar[24]');全局指针，线程不退出时不允许释放
Global $pCode = DllStructCreate('ubyte[260]');存放线程运行函数的地址,线程不退出时不允许释放
DllStructSetData($sFormat, 1, '%02i:%02i:%02i')
GUISetState(@SW_SHOW)
TimerThread();单独的操作线程
#endregion ### END Koda GUI section ###
;Global $SideBar, $timer, $Secs, $Mins, $Hour, $Time;set for pass time count

;$timer = TimerInit() ;time count start here

While Sleep(100)
WEnd

Func onEvent()
	SetEvent($hExit);设置事件为有信号，通知线程退出
	_WinAPI_WaitForSingleObject($hThread);等待线程安全退出
	_WinAPI_CloseHandle($hThread);关闭线程句柄
	_WinAPI_CloseHandle($hExit);关闭事件对象句柄
	$sFormat = 0
	$pMsg = 0
	$pCode = 0
	GUIDelete()
	Exit
EndFunc   ;==>onEvent
#cs
	Func Timer()
	_TicksToTime(Int(TimerDiff($timer)), $Hour, $Mins, $Secs)
	Local $sTime = $Time
	$Time = StringFormat("%02i:%02i:%02i", $Hour, $Mins, $Secs)
	If $sTime <> $Time Then ControlSetText("", "", "Static1", $Time)
	EndFunc   ;==>Timer
#ce
Func TimerThread()
	Local $pGetTickCount = GetProcAddress(GetModuleHandle('Kernel32'), 'GetTickCount')
	Local $pWaitForSingleObject = GetProcAddress(GetModuleHandle('Kernel32'), 'WaitForSingleObject')
	Local $pwsprintfW = GetProcAddress(GetModuleHandle('User32'), 'wsprintfW')
	Local $pSendMessageTimeoutW = GetProcAddress(GetModuleHandle('User32'), 'SendMessageTimeoutW')
	Local $szCode = '0x'
	$szCode &= '55';              	PUSH EBP
	$szCode &= '8BEC';            	MOV EBP,ESP
	$szCode &= '83EC20';         	SUB ESP,20
	$szCode &= '8B4508';         	MOV EAX,DWORD PTR SS:[EBP+8]//取得第一个参数
	$szCode &= '8945F4';         	MOV DWORD PTR SS:[EBP-C],EAX//临时保存在第三个局部变量
	$szCode &= 'BB' & Hex(Binary($pGetTickCount)); MOV EBX,GetTickCount//第一次执行，记录下时间
	$szCode &= 'FFD3';				call	ebx                                    ; call ebx
	$szCode &= '8945F0';         	MOV DWORD PTR SS:[EBP-10],EAX//第4个局部变量临时存在GetTickCount的返回结果
	$szCode &= 'B901000000';     	MOV ECX,1
	$szCode &= '85C9';           	TEST ECX,ECX//while(true)
	$szCode &= '0F84BE000000';   	JE +0xBE(byte)//{
	$szCode &= '68E8030000';     	PUSH 3E8 //1000
	$szCode &= '8B55F4';         	MOV EDX,DWORD PTR SS:[EBP-C]//mov edx,$hExit
	$szCode &= '52';              	PUSH EDX
	$szCode &= 'BB' & Hex(Binary($pWaitForSingleObject));MOV EBX,WaitForSingleObject
	$szCode &= 'FFD3' ;				call	ebx //WaitForSingleObject($hExit,1000)
	$szCode &= '8945F8';         	MOV DWORD PTR SS:[EBP-8],EAX//第二个局部变量存放WaitForSingleObject的返回结果
	$szCode &= '837DF8FF';      	CMP DWORD PTR SS:[EBP-8],-1//如果WaitForSingleObject返回失败-1
	$szCode &= '7406';           	JZ SHORT +0x06(byte)//退出循环
	$szCode &= '837DF800';      	CMP DWORD PTR SS:[EBP-8],0//如果WaitForSingleObject返回0(成功等待到事件)
	$szCode &= '7505';           	JNZ SHORT +0x5(byte)//退出循环
	$szCode &= 'E99A000000';     	JMP +0x9a(byte)//跳出到循环体外
	$szCode &= 'BB' & Hex(Binary($pGetTickCount)); MOV EBX,GetTickCount,循环调用，以跟初始的时间进行对比
	$szCode &= 'FFD3' ;				CALL BEX
	$szCode &= '2B45F0';         	SUB EAX,DWORD PTR SS:[EBP-10]//第4个局部变量(最初的时间截),两时间相减
	$szCode &= '8945FC';         	MOV DWORD PTR SS:[EBP-4],EAX
	$szCode &= '8B45FC';         	MOV EAX,DWORD PTR SS:[EBP-4]
	$szCode &= '33D2';            	XOR EDX,EDX
	$szCode &= 'B980EE3600';     	MOV ECX,36EE80(3600000)
	$szCode &= 'F7F1';            	DIV ECX
	$szCode &= '8945E4';         	MOV DWORD PTR SS:[EBP-1C],EAX
	$szCode &= '8B45FC';         	MOV EAX,DWORD PTR SS:[EBP-4]
	$szCode &= '33D2';            	XOR EDX,EDX
	$szCode &= 'B980EE3600';     	MOV ECX,36EE80(3600000)
	$szCode &= 'F7F1';            	DIV ECX
	$szCode &= '8955FC';         	MOV DWORD PTR SS:[EBP-4],EDX
	$szCode &= '8B45FC';         	MOV EAX,DWORD PTR SS:[EBP-4]
	$szCode &= '33D2';            	XOR EDX,EDX
	$szCode &= 'B960EA0000';     	MOV ECX,0EA60(60000)
	$szCode &= 'F7F1';            	DIV ECX
	$szCode &= '8945E8';         	MOV DWORD PTR SS:[EBP-18],EAX
	$szCode &= '8B45FC';         	MOV EAX,DWORD PTR SS:[EBP-4]
	$szCode &= '33D2';            	XOR EDX,EDX
	$szCode &= 'B960EA0000';     	MOV ECX,0EA60(60000)
	$szCode &= 'F7F1';            	DIV ECX
	$szCode &= '8955FC';         	MOV DWORD PTR SS:[EBP-4],EDX
	$szCode &= '8B45FC';         	MOV EAX,DWORD PTR SS:[EBP-4]
	$szCode &= '33D2';            	XOR EDX,EDX
	$szCode &= 'B9E8030000';     	MOV ECX,3E8(1000)
	$szCode &= 'F7F1';            	DIV ECX
	$szCode &= '8945EC';         	MOV DWORD PTR SS:[EBP-14],EAX
	$szCode &= '8B55EC';         	MOV EDX,DWORD PTR SS:[EBP-14]
	$szCode &= '52';              	PUSH EDX
	$szCode &= '8B45E8';         	MOV EAX,DWORD PTR SS:[EBP-18]
	$szCode &= '50';              	PUSH EAX
	$szCode &= '8B4DE4';         	MOV ECX,DWORD PTR SS:[EBP-1C]
	$szCode &= '51';              	PUSH ECX
	$szCode &= '68' & Hex(Binary(DllStructGetPtr($sFormat)));PUSH $sFormat->指针
	$szCode &= '68' & Hex(Binary(DllStructGetPtr($pMsg)));PUSH $pMsg->指针
	$szCode &= 'BB' & Hex(Binary($pwsprintfW));MOV EBX,$pwsprintfW
	$szCode &= 'FFD3' ;				call	ebx//wsprintfW($pMsg,$sFormat,dwHour,dwMins,dwSecs);
	$szCode &= '83C414';         	ADD ESP,14
	$szCode &= '8D55E0';         	LEA EDX,DWORD PTR SS:[EBP-20]
	$szCode &= '52';              	PUSH EDX
	$szCode &= '6A64';           	PUSH 64
	$szCode &= '6A02';           	PUSH 2
	$szCode &= '68' & Hex(Binary(DllStructGetPtr($pMsg)));PUSH $pMsg->指针
	$szCode &= '6A00';           	PUSH 0
	$szCode &= '6A0C';           	PUSH 0C
	$szCode &= '68' & Hex(Binary(GUICtrlGetHandle($hStatic))) ;PUSH	$hStatic句柄
	$szCode &= 'BB' & Hex(Binary($pSendMessageTimeoutW));MOV EBX,SendMessageTimeoutW//SendMessageTimeoutW(hwnd,WM_SETTEXT,0,$pMsg,SMTO_ABORTIFHUNG,100,edx)
	$szCode &= 'FFD3' ;				call	ebx
	$szCode &= 'E935FFFFFF';    	JMP -0x35(byte) ->向后回跳Ox35字节，实现循环
	$szCode &= '33C0';          	XOR EAX,EAX
	$szCode &= '8BE5';          	MOV ESP,EBP
	$szCode &= '5D';            	POP EBP
	$szCode &= 'C20400';        	RETN 4
	DllStructSetData($pCode, 1, Binary($szCode))
	Local $lpThreadId = 0
	$hExit = CreateEvent(False, False, 0);创建事件对象，并将句柄作为线程参数传递给线程
	ConsoleWrite($hExit & @LF)
	MsgBox(0, 0, DllStructGetPtr($pCode))
	$hThread = CreateThread(DllStructGetPtr($pCode), $hExit, $lpThreadId);创建线程
	MsgBox(64, 'Result', StringFormat('线程创建结果：%s\n线程ID：%d', $hThread <> 0, $lpThreadId))
EndFunc   ;==>TimerThread

Func SetEvent($hEvent)
	Local $aRet = DllCall('Kernel32.dll', 'BOOL', 'SetEvent', 'HANDLE', $hEvent)
	If @error Then Return SetError(@error, @extended, 0)
	ConsoleWrite('setevent:' & $aRet[0] & @LF)
	Return $aRet[0]
EndFunc   ;==>SetEvent

Func CreateEvent($bManualReset, $bInitialState, $lpName)
	Local $aRet = DllCall('Kernel32.dll', 'HANDLE', 'CreateEventW', 'ptr', 0, 'BOOL', $bManualReset, 'BOOL', $bInitialState, 'ptr', $lpName)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc   ;==>CreateEvent

Func CreateThread($lpStartAddress, $lpParameter, ByRef $lpThreadId, $dwCreationFlags = 0)
	Local $aRet = DllCall('Kernel32.dll', 'HANDLE', 'CreateThread', 'ptr', 0, 'ULONG_PTR', 0, 'ptr', $lpStartAddress, 'ptr', $lpParameter, 'dword', $dwCreationFlags, 'dword*', 0)
	If @error Then Return SetError(@error, @extended, 0)
	If $aRet[0] = 0 Then Return SetError(-1, 0, 0)
	$lpThreadId = $aRet[6]
	Return $aRet[0]
EndFunc   ;==>CreateThread

Func GetModuleHandle($lpModuleName)
	Local $aRet = DllCall('Kernel32.dll', 'HANDLE', 'GetModuleHandleW', 'wstr', $lpModuleName)
	If @error Then Return SetError(@error, @extended, 0)
	If $aRet[0] = 0 Then Return SetError(-1, 0, 0)
	Return $aRet[0]
EndFunc   ;==>GetModuleHandle

Func GetProcAddress($hModule, $lpProcName)
	Local $aRet = DllCall('Kernel32.dll', 'ptr', 'GetProcAddress', 'HANDLE', $hModule, 'str', $lpProcName)
	If @error Then Return SetError(@error, @extended, 0)
	If $aRet[0] = 0 Then Return SetError(-1, 0, 0)
	Return $aRet[0]
EndFunc   ;==>GetProcAddress

Func GetCurrentProcess()
	Local $aRet = DllCall('Kernel32.dll', "handle", "GetCurrentProcess")
	If @error Then Return SetError(@error, @extended, 0)
	If $aRet[0] = 0 Then Return SetError(-1, 0, 0)
	Return $aRet[0]
EndFunc   ;==>GetCurrentProcess
