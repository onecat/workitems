#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

Opt("MustDeclareVars", 1)

Global $sFile = FileOpenDialog("Choose file", "", "All files (*)")
If @error Then Exit


Global $hTimer, $iTimer, $sData

;------------------------------------------------------------------------
; CRC32:
$hTimer = TimerInit()

$sData = _CRC32ForFile($sFile)
$iTimer = TimerDiff($hTimer)

ConsoleWrite("! CRC32 took " & $iTimer & " ms" & @CRLF)
ConsoleWrite("Result: " & $sData & @CRLF & @CRLF)
;------------------------------------------------------------------------
; MD4:
$hTimer = TimerInit()

$sData = _MD4ForFile($sFile)
$iTimer = TimerDiff($hTimer)

ConsoleWrite("! MD4 took " & $iTimer & " ms" & @CRLF)
ConsoleWrite("Result: " & $sData & @CRLF & @CRLF)
;------------------------------------------------------------------------
; MD5:
$hTimer = TimerInit()

$sData = _MD5ForFile($sFile)
$iTimer = TimerDiff($hTimer)

ConsoleWrite("! MD5 took " & $iTimer & " ms" & @CRLF)
ConsoleWrite("Result: " & $sData & @CRLF & @CRLF)
;------------------------------------------------------------------------
; SHA1:
$hTimer = TimerInit()

$sData = _SHA1ForFile($sFile)
$iTimer = TimerDiff($hTimer)

ConsoleWrite("! SHA1 took " & $iTimer & " ms" & @CRLF)
ConsoleWrite("Result: " & $sData & @CRLF & @CRLF)
;------------------------------------------------------------------------



; Functions...


; #FUNCTION# ;===============================================================================
;
; Name...........: _CRC32ForFile
; Description ...: Calculates CRC32 value for the specific file.
; Syntax.........: _CRC32ForFile ($sFile)
; Parameters ....: $sFile - Full path to the file to process.
; Return values .: Success - Returns CRC32 value in form of hex string
;                          - Sets @error to 0
;                  Failure - Returns empty string and sets @error:
;                  |1 - CreateFile function or call to it failed.
;                  |2 - CreateFileMapping function or call to it failed.
;                  |3 - MapViewOfFile function or call to it failed.
;                  |4 - RtlComputeCrc32 function or call to it failed.
; Author ........: trancexx
;
;==========================================================================================
Func _CRC32ForFile($sFile)

    Local $a_hCall = DllCall("kernel32.dll", "hwnd", "CreateFileW", _
            "wstr", $sFile, _
            "dword", 0x80000000, _ ; GENERIC_READ
            "dword", 1, _ ; FILE_SHARE_READ
            "ptr", 0, _
            "dword", 3, _ ; OPEN_EXISTING
            "dword", 0, _ ; SECURITY_ANONYMOUS
            "ptr", 0)

    If @error Or $a_hCall[0] = -1 Then
        Return SetError(1, 0, "")
    EndIf

    Local $hFile = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "CreateFileMappingW", _
            "hwnd", $hFile, _
            "dword", 0, _ ; default security descriptor
            "dword", 2, _ ; PAGE_READONLY
            "dword", 0, _
            "dword", 0, _
            "ptr", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)
        Return SetError(2, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)

    Local $hFileMappingObject = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "MapViewOfFile", _
            "hwnd", $hFileMappingObject, _
            "dword", 4, _ ; FILE_MAP_READ
            "dword", 0, _
            "dword", 0, _
            "dword", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(3, 0, "")
    EndIf

    Local $pFile = $a_hCall[0]
    Local $iBufferSize = FileGetSize($sFile)

    Local $a_iCall = DllCall("ntdll.dll", "dword", "RtlComputeCrc32", _
            "dword", 0, _
            "ptr", $pFile, _
            "int", $iBufferSize)

    If @error Or Not $a_iCall[0] Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(4, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)

    Local $iCRC32 = $a_iCall[0]

    Return SetError(0, 0, Hex($iCRC32))

EndFunc   ;==>_CRC32ForFile


; #FUNCTION# ;===============================================================================
;
; Name...........: _MD4ForFile
; Description ...: Calculates MD4 value for the specific file.
; Syntax.........: _MD4ForFile ($sFile)
; Parameters ....: $sFile - Full path to the file to process.
; Return values .: Success - Returns MD4 value in form of hex string
;                          - Sets @error to 0
;                  Failure - Returns empty string and sets @error:
;                  |1 - CreateFile function or call to it failed.
;                  |2 - CreateFileMapping function or call to it failed.
;                  |3 - MapViewOfFile function or call to it failed.
;                  |4 - MD4Init function or call to it failed.
;                  |5 - MD4Update function or call to it failed.
;                  |6 - MD4Final function or call to it failed.
; Author ........: trancexx
;
;==========================================================================================
Func _MD4ForFile($sFile)

    Local $a_hCall = DllCall("kernel32.dll", "hwnd", "CreateFileW", _
            "wstr", $sFile, _
            "dword", 0x80000000, _ ; GENERIC_READ
            "dword", 1, _ ; FILE_SHARE_READ
            "ptr", 0, _
            "dword", 3, _ ; OPEN_EXISTING
            "dword", 0, _ ; SECURITY_ANONYMOUS
            "ptr", 0)

    If @error Or $a_hCall[0] = -1 Then
        Return SetError(1, 0, "")
    EndIf

    Local $hFile = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "CreateFileMappingW", _
            "hwnd", $hFile, _
            "dword", 0, _ ; default security descriptor
            "dword", 2, _ ; PAGE_READONLY
            "dword", 0, _
            "dword", 0, _
            "ptr", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)
        Return SetError(2, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)

    Local $hFileMappingObject = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "MapViewOfFile", _
            "hwnd", $hFileMappingObject, _
            "dword", 4, _ ; FILE_MAP_READ
            "dword", 0, _
            "dword", 0, _
            "dword", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(3, 0, "")
    EndIf

    Local $pFile = $a_hCall[0]
    Local $iBufferSize = FileGetSize($sFile)

    Local $tMD4_CTX = DllStructCreate("dword i[2];" & _
            "dword buf[4];" & _
            "ubyte in[64];" & _
            "ubyte digest[16]")

    DllCall("advapi32.dll", "none", "MD4Init", "ptr", DllStructGetPtr($tMD4_CTX))

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(4, 0, "")
    EndIf

    DllCall("advapi32.dll", "none", "MD4Update", _
            "ptr", DllStructGetPtr($tMD4_CTX), _
            "ptr", $pFile, _
            "dword", $iBufferSize)

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(5, 0, "")
    EndIf

    DllCall("advapi32.dll", "none", "MD4Final", "ptr", DllStructGetPtr($tMD4_CTX))

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(6, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)

    Local $sMD4 = Hex(DllStructGetData($tMD4_CTX, "digest"))

    Return SetError(0, 0, $sMD4)

EndFunc   ;==>_MD4ForFile


; #FUNCTION# ;===============================================================================
;
; Name...........: _MD5ForFile
; Description ...: Calculates MD5 value for the specific file.
; Syntax.........: _MD5ForFile ($sFile)
; Parameters ....: $sFile - Full path to the file to process.
; Return values .: Success - Returns MD5 value in form of hex string
;                          - Sets @error to 0
;                  Failure - Returns empty string and sets @error:
;                  |1 - CreateFile function or call to it failed.
;                  |2 - CreateFileMapping function or call to it failed.
;                  |3 - MapViewOfFile function or call to it failed.
;                  |4 - MD5Init function or call to it failed.
;                  |5 - MD5Update function or call to it failed.
;                  |6 - MD5Final function or call to it failed.
; Author ........: trancexx
;
;==========================================================================================
Func _MD5ForFile($sFile)

    Local $a_hCall = DllCall("kernel32.dll", "hwnd", "CreateFileW", _
            "wstr", $sFile, _
            "dword", 0x80000000, _ ; GENERIC_READ
            "dword", 1, _ ; FILE_SHARE_READ
            "ptr", 0, _
            "dword", 3, _ ; OPEN_EXISTING
            "dword", 0, _ ; SECURITY_ANONYMOUS
            "ptr", 0)

    If @error Or $a_hCall[0] = -1 Then
        Return SetError(1, 0, "")
    EndIf

    Local $hFile = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "CreateFileMappingW", _
            "hwnd", $hFile, _
            "dword", 0, _ ; default security descriptor
            "dword", 2, _ ; PAGE_READONLY
            "dword", 0, _
            "dword", 0, _
            "ptr", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)
        Return SetError(2, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)

    Local $hFileMappingObject = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "MapViewOfFile", _
            "hwnd", $hFileMappingObject, _
            "dword", 4, _ ; FILE_MAP_READ
            "dword", 0, _
            "dword", 0, _
            "dword", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(3, 0, "")
    EndIf

    Local $pFile = $a_hCall[0]
    Local $iBufferSize = FileGetSize($sFile)

    Local $tMD5_CTX = DllStructCreate("dword i[2];" & _
            "dword buf[4];" & _
            "ubyte in[64];" & _
            "ubyte digest[16]")

    DllCall("advapi32.dll", "none", "MD5Init", "ptr", DllStructGetPtr($tMD5_CTX))

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(4, 0, "")
    EndIf

    DllCall("advapi32.dll", "none", "MD5Update", _
            "ptr", DllStructGetPtr($tMD5_CTX), _
            "ptr", $pFile, _
            "dword", $iBufferSize)

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(5, 0, "")
    EndIf

    DllCall("advapi32.dll", "none", "MD5Final", "ptr", DllStructGetPtr($tMD5_CTX))

    If @error Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(6, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)

    Local $sMD5 = Hex(DllStructGetData($tMD5_CTX, "digest"))

    Return SetError(0, 0, $sMD5)

EndFunc   ;==>_MD5ForFile


; #FUNCTION# ;===============================================================================
;
; Name...........: _SHA1ForFile
; Description ...: Calculates SHA1 value for the specific file.
; Syntax.........: _SHA1ForFile ($sFile)
; Parameters ....: $sFile - Full path to the file to process.
; Return values .: Success - Returns SHA1 value in form of hex string
;                          - Sets @error to 0
;                  Failure - Returns empty string and sets @error:
;                  |1 - CreateFile function or call to it failed.
;                  |2 - CreateFileMapping function or call to it failed.
;                  |3 - MapViewOfFile function or call to it failed.
;                  |4 - CryptAcquireContext function or call to it failed.
;                  |5 - CryptCreateHash function or call to it failed.
;                  |6 - CryptHashData function or call to it failed.
;                  |7 - CryptGetHashParam function or call to it failed.
; Author ........: trancexx
;
;==========================================================================================
Func _SHA1ForFile($sFile)

    Local $a_hCall = DllCall("kernel32.dll", "hwnd", "CreateFileW", _
            "wstr", $sFile, _
            "dword", 0x80000000, _ ; GENERIC_READ
            "dword", 1, _ ; FILE_SHARE_READ
            "ptr", 0, _
            "dword", 3, _ ; OPEN_EXISTING
            "dword", 0, _ ; SECURITY_ANONYMOUS
            "ptr", 0)

    If @error Or $a_hCall[0] = -1 Then
        Return SetError(1, 0, "")
    EndIf

    Local $hFile = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "CreateFileMappingW", _
            "hwnd", $hFile, _
            "dword", 0, _ ; default security descriptor
            "dword", 2, _ ; PAGE_READONLY
            "dword", 0, _
            "dword", 0, _
            "ptr", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)
        Return SetError(2, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFile)

    Local $hFileMappingObject = $a_hCall[0]

    $a_hCall = DllCall("kernel32.dll", "ptr", "MapViewOfFile", _
            "hwnd", $hFileMappingObject, _
            "dword", 4, _ ; FILE_MAP_READ
            "dword", 0, _
            "dword", 0, _
            "dword", 0)

    If @error Or Not $a_hCall[0] Then
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(3, 0, "")
    EndIf

    Local $pFile = $a_hCall[0]
    Local $iBufferSize = FileGetSize($sFile)

    Local $a_iCall = DllCall("advapi32.dll", "int", "CryptAcquireContext", _
            "ptr*", 0, _
            "ptr", 0, _
            "ptr", 0, _
            "dword", 1, _ ; PROV_RSA_FULL
            "dword", 0xF0000000) ; CRYPT_VERIFYCONTEXT

    If @error Or Not $a_iCall[0] Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        Return SetError(4, 0, "")
    EndIf

    Local $hContext = $a_iCall[1]

    $a_iCall = DllCall("advapi32.dll", "int", "CryptCreateHash", _
            "ptr", $hContext, _
            "dword", 0x00008004, _ ; CALG_SHA1
            "ptr", 0, _ ; nonkeyed
            "dword", 0, _
            "ptr*", 0)

    If @error Or Not $a_iCall[0] Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        DllCall("advapi32.dll", "int", "CryptReleaseContext", "ptr", $hContext, "dword", 0)
        Return SetError(5, 0, "")
    EndIf

    Local $hHashSHA1 = $a_iCall[5]

    $a_iCall = DllCall("advapi32.dll", "int", "CryptHashData", _
            "ptr", $hHashSHA1, _
            "ptr", $pFile, _
            "dword", $iBufferSize, _
            "dword", 0)

    If @error Or Not $a_iCall[0] Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        DllCall("advapi32.dll", "int", "CryptDestroyHash", "ptr", $hHashSHA1)
        DllCall("advapi32.dll", "int", "CryptReleaseContext", "ptr", $hContext, "dword", 0)
        Return SetError(6, 0, "")
    EndIf

    Local $tOutSHA1 = DllStructCreate("byte[20]")

    $a_iCall = DllCall("advapi32.dll", "int", "CryptGetHashParam", _
            "ptr", $hHashSHA1, _
            "dword", 2, _ ; HP_HASHVAL
            "ptr", DllStructGetPtr($tOutSHA1), _
            "dword*", 20, _
            "dword", 0)

    If @error Or Not $a_iCall[0] Then
        DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
        DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)
        DllCall("advapi32.dll", "int", "CryptDestroyHash", "ptr", $hHashSHA1)
        DllCall("advapi32.dll", "int", "CryptReleaseContext", "ptr", $hContext, "dword", 0)
        Return SetError(7, 0, "")
    EndIf

    DllCall("kernel32.dll", "int", "UnmapViewOfFile", "ptr", $pFile)
    DllCall("kernel32.dll", "int", "CloseHandle", "hwnd", $hFileMappingObject)

    DllCall("advapi32.dll", "int", "CryptDestroyHash", "ptr", $hHashSHA1)

    Local $sSHA1 = Hex(DllStructGetData($tOutSHA1, 1))

    DllCall("advapi32.dll", "int", "CryptReleaseContext", "ptr", $hContext, "dword", 0)

    Return SetError(0, 0, $sSHA1)

EndFunc   ;==>_SHA1ForFile