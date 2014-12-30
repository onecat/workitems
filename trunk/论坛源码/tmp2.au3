
;~ C++
;~ BOOL WINAPI ReadConsoleInput(
;~   _In_   HANDLE hConsoleInput,
;~   _Out_  PINPUT_RECORD lpBuffer,
;~   _In_   DWORD nLength,
;~   _Out_  LPDWORD lpNumberOfEventsRead
;~ );
;~ Kernel32.dll


;~ BOOL WINAPI ReadConsoleOutputCharacter(
;~   _In_   HANDLE hConsoleOutput,
;~   _Out_  LPTSTR lpCharacter,
;~   _In_   DWORD nLength,
;~   _In_   COORD dwReadCoord,
;~   _Out_  LPDWORD lpNumberOfCharsRead
;~ );


;~ BOOL WINAPI EnumProcessModules(
;~ _In_ HANDLE hProcess,
;~ _Out_ HMODULE * lphModule,
;~ _In_ DWORD cb,
;~ _Out_ LPDWORD lpcbNeeded
;~ );


Local $hProcess
Local $PERMISSION = BitOR(0x0002, 0x0400, 0x0008, 0x0010, 0x0020) ; CREATE_THREAD, QUERY_INFORMATION, VM_OPERATION, VM_READ, VM_WRITE

$iPID = ProcessExists("cmd.exe")

;Get Process Handle
If $iPID > 0 Then
	Local $hProcess = DllCall("kernel32.dll", "ptr", "OpenProcess", "dword", $PERMISSION, "int", 0, "dword", $iPID)
	If $hProcess[0] Then
		$hProcess = $hProcess[0]
	EndIf
EndIf

;call ReadConsoleOutputCharacter
;~ BOOL WINAPI ReadConsoleOutputCharacter(
;~   _In_   HANDLE hConsoleOutput,
;~   _Out_  LPTSTR lpCharacter,
;~   _In_   DWORD nLength,
;~   _In_   COORD dwReadCoord,
;~   _Out_  LPDWORD lpNumberOfCharsRead
;~ );
;~ typedef struct _COORD {
;~ SHORT X; // horizontal coordinate
;~ SHORT Y; // vertical coordinate
;~ } COORD;
;~ ;

$Buffer = DLLStructCreate("CHAR[1023] buff;int longthtmp")
$Buffer_Length = 0x00000200
$Coord_Struct =DllStructCreate("short;short")
DllStructSetData($Coord_Struct,1, 0)
DllStructSetData($Coord_Struct,2, 0)
$Coord_StructPtr=DllStructGetPtr($Coord_Struct)
Local $aCall = DllCall("Kernel32.dll", "int", "ReadConsoleOutputCharacter", "ptr", $hProcess, "str", DllStructGetPtr($Buffer, 1), "dword", $Buffer_Length, "ptr", $Coord_StructPtr, "dword*", DllStructGetPtr($Buffer, 2))
If $aCall = 0 Then
	ConsoleWrite($aCall & @CRLF)
EndIf
ConsoleWrite($Buffer & @CRLF)
ConsoleWrite("111" & DllStructGetData($Buffer, "buff") & @CRLF)
ConsoleWrite("111" & DllStructGetData($Buffer, "longthtmp") & @CRLF)


