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
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#region ;**** Directives created by AutoIt3Wrapper_GUI ****s
#include <GUIButton.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Winapi.au3>

$sTitle = "UAC Ȩ��������ȡ��ʾ��"

If StringRegExp(@OSVersion, "_(XP|200(0|3))") Then
    MsgBox(16 + 262144, $sTitle, "�������� Vista+ ϵͳ")
    Exit
ElseIf Not @Compiled Then
    MsgBox(16 + 262144, $sTitle, "�������Ϊ exe �ļ�������")
    Exit
EndIf

$hGui = GUICreate($sTitle, 340, 90, Default,Default,Default, $WS_EX_TOPMOST)

If IsAdmin() Then
    GUICtrlCreateLabel("�������ű�����Ȩ�� (�ڹ���ԱȨ��)", 10, 10, 320, 20, $SS_CENTER)
Else
    GUICtrlCreateLabel("δ�����ű�����Ȩ�� (�ڱ�׼�û�Ȩ��)", 10, 10, 320, 20, $SS_CENTER)
EndIf

$c_Btn_Elevate = GUICtrlCreateButton("�����ű�����Ȩ��", 25, 30, 135, 30)
If IsAdmin() Then GUICtrlSetState(-1, $GUI_DISABLE)
_GUICtrlButton_SetShield(GUICtrlGetHandle($c_Btn_Elevate))

$c_Btn_DeElevate = GUICtrlCreateButton("ɾ����������Ȩ��", 180, 30, 135, 30)
If Not IsAdmin() Then GUICtrlSetState(-1, $GUI_DISABLE)

$c_ChkB_Elavate_Always = GUICtrlCreateCheckbox("����ʱ�Զ�����", 25, 65)
GUICtrlSetTip(-1, "ѡ�д˿����� ""������ݱ�־(AppCompatFlag)"" ��ע���" & @CRLF & @CRLF & _
        "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" & @CRLF & @CRLF & _
        ",��ӿ�ִ�� URL ��Ϊ RUNAS ϵͳ����ԱȨ��." & @CRLF & @CRLF & _
        "���ƶ���ɾ���ű�ʱ,��ȷ��δѡ�д˸�ѡ�� (���ע�����" & @CRLF & _
        "����ɾ��) ������������ע����ֵ.", "�Զ�����", 1, 1)
If Not IsAdmin() Then;���û�й���ԱȨ�ޣ���
    GUICtrlSetState(-1, $GUI_DISABLE);���� "�Զ�����" ��ѡ��
Else;����,
    If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", _
                        @ScriptFullPath) = "RUNASADMIN" Then GUICtrlSetState(-1, $GUI_CHECKED);ѡ�� "�Զ�����" ��ѡ��
EndIf

GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $c_Btn_Elevate;"�����ű�" ��ť
            If ShellExecute(@ScriptName, "", "", "runas") Then;@ScriptName=��ǰ���нű����ļ���
                Exit
            Else
                MsgBox(16 + 262144, $sTitle & " - ����", "��������,��Ҫȡ�� UAC ��ʾ��?")
            EndIf

        Case $c_Btn_DeElevate;"ɾ������" ��ť
            $iPID = _RunWithReducedPrivileges(@ScriptName, "", @ScriptDir)
            $iError = @error
                        If $iError Then $iError &= @CRLF & _WinAPI_GetLastError() & @CRLF & _WinAPI_GetLastErrorMessage()
            If ProcessExists($iPID) Then
                Exit
            Else
                MsgBox(16 + 262144, $sTitle & " - ����", "��������..." & @CRLF & "�������: " & $iError)
            EndIf

        Case $c_ChkB_Elavate_Always
            $sRegString = "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
            Switch GUICtrlRead($c_ChkB_Elavate_Always)
                Case 1
                    If Not RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptFullPath, "REG_SZ", "RUNASADMIN") Then
                        MsgBox(16 + 262144, $sTitle & " - ����", "��������, �޷�д��ע���� AppCompatFlag ����.")
                        GUICtrlSetState($c_ChkB_Elavate_Always, $GUI_UNCHECKED)
                    Else
                        MsgBox(16 + 262144, $sTitle, "����� 'RUNASADMIN' ��ֵ.")
                    EndIf

                Case Else
                    If Not RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @ScriptFullPath) Then
                        MsgBox(16 + 262144, $sTitle & " - ����", "��������, �޷�д��ע���� AppCompatFlag ����.")
                        GUICtrlSetState($c_ChkB_Elavate_Always, $GUI_UNCHECKED)
                    Else
                        MsgBox(16 + 262144, $sTitle & " - ����", "��ɾ�� 'RUNASADMIN' ��ֵ.")
                    EndIf

            EndSwitch

    EndSwitch
WEnd

Exit

; ===============================================================================================================================
; ���¿����Ϊ�����ļ�, ����: <_RunWithReducedPrivileges.au3>
;
; Ϊ���г��򽵵�Ȩ��.
;   ����������һ������Ȩģʽʱ, ����Ȩ�����г���.
;   - ���ڵĳ��������� drag-and-drop ������, ������� (sendmessage, �ȵ�) ������.
;
; ����:
;   _RunWithReducedPrivileges()     ; ���Ŀǰ��һ������Ȩģʽ������,����Ȩ�����г���
;
; �ڲ�����:
;   _RWRPCleanup()      ; ���������ĸ�������
;
; �ο�:
;   See 'Creating a process with Medium Integration Level from the process with High Integration Level in Vista'
;       @ http://www.codeproject.com/KB/vista-security/createprocessexplorerleve.aspx
;     See Elmue's comment 'Here the cleaned and bugfixed code'
;   Also see: 'High elevation can be bad for your application: How to start a non-elevated process at the end of the installation'
;       @ http://www.codeproject.com/KB/vista-security/RunNonElevated.aspx
;     (Elmue has the same code here too in his response to FaxedHead's comment ('Another alternative to this method'))
;   Another alternative using COM methods:
;     'Getting the shell to run an application for you - Part 2:How | BrandonLive'
;       @ http://brandonlive.com/2008/04/27/gettin...o-run-an-application-for-you-p
;
; ����: Ascend4nt, based on code by Elmue's fixed version of Alexey Gavrilov's code
; ===============================================================================================================================

; ===================================================================================================================
; ���� ...: _RunWithReducedPrivileges($sPath,$sCmd='',$sFolder='',$iShowFlag=@SW_SHOWNORMAL,$bWait=False)
;
; ���� ...: �Ե�Ȩ�����г���. ����������һ������Ȩģʽʱ, ����Ȩ�����г���..
;   - ���ڵĳ��������� drag-and-drop ������, ������� (sendmessage, �ȵ�) ������.
; ���� ...:        $sPath = ��ִ��·��
;                         $sCmd = ������ (��ѡ)
;                         $sFolder = �����ļ��� (��ѡ)
;                         $iShowFlag = �����������. Ĭ�� @SW_SHOWNORMAL. ���г��� @SW_SHOW* �������ﶼ�ܹ���
;                         $bWait = ��Ϊ True, �����˳�����֮ǰ�ȴ��������
;                                   ��Ϊ False, ����ȴ����̽���,���ؽ��� ID #
; ���� ...: �ɹ�: ��� $bWait=True, ���ؽ��̵��˳�����. ��� $bWait=False, ���ؽ��� ID.
;                         ʧ��: 0, @error ����Ϊ:
;                               @error = 2 = DLLCall ����. @extended ���� DLLCall ������� (�� AutoIt ����)
;                               @error = 3 = API ����ʧ��. ���� 'GetLastError' API ������ȡ������Ϣ.
; ���� ...: Ascend4nt, based on code by Elmue's fixed version of Alexey Gavrilov's code
; ===================================================================================================================

Func _RunWithReducedPrivileges($sPath, $sCmd = '', $sFolder = '', $iShowFlag = @SW_SHOWNORMAL, $bWait = False)
    Local $aRet, $iErr, $iRet = 1, $hProcess, $hToken, $hDupToken, $stStartupInfo, $stProcInfo
    Local $sCmdType = "wstr", $sFolderType = "wstr"

;~  ��������,���������һ������״̬,�� Vista ֮ǰ��ϵͳ
    If Not IsAdmin() Or StringRegExp(@OSVersion, "_(XP|200(0|3))") Then ; XP, XPe, 2000, �� 2003?
        If $bWait Then Return RunWait($sPath & ' ' & $sCmd, $sFolder)
        Return Run($sPath & ' ' & $sCmd, $sFolder)
    EndIf

;~  ���������ͼ�������Ӧ�� DLLCall
    If Not IsString($sCmd) Or $sCmd = '' Then
        $sCmdType = "ptr"
        $sCmd = 0
    EndIf
    If Not IsString($sFolder) Or $sFolder = '' Then
        $sFolderType = "ptr"
        $sFolder = 0
    EndIf
    #cs
        ; STARTUPINFOW �ṹ: cb,lpReserved,lpDesktop,lpTitle,dwX,dwY,dwXSize,dwYSize,dwXCountChars,dwYCountChars,dwFillAttribute,
        ;   dwFlags,wShowWindow,cbReserved2,lpReserved2,hStdInput,hStdOutput,hStdError
        ;   ע��: ���Ǵ������̵���Ϣ. ����, ��֪�� I/O �����ض���..?
    #ce
    $stStartupInfo = DllStructCreate("dword;ptr[3];dword[7];dword;word;word;ptr;handle[3]")
    DllStructSetData($stStartupInfo, 1, DllStructGetSize($stStartupInfo))
    DllStructSetData($stStartupInfo, 4, 1) ; STARTF_USESHOWWINDOW
    DllStructSetData($stStartupInfo, 5, $iShowFlag)

    ; PROCESS_INFORMATION �ṹ: hProcess, hThread, dwProcessId, dwThreadId
    ;   ���� *receiving* ��Ϣ
    $stProcInfo = DllStructCreate("handle;handle;dword;dword")

;~  �򿪸ý��̵ľ��
    ; ��Դ��������һ���ϵ͵�Ȩ��������, ����������ǵİ�ȫ��Ϣ�Ļ���.
    ;   ʹ�� PROCESS_QUERY_INFORMATION (0x0400) ����Ȩ�򿪽���
    $aRet = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", 0x0400, "bool", False, "dword", ProcessExists("explorer.exe"))
    If @error Then Return SetError(2, @error, 0)
    If Not $aRet[0] Then Return SetError(3, 0, 0)
    $hProcess = $aRet[0]

;~  ��һ���������ƾ�� (����)
    ; TOKEN_DUPLICATE = 0x0002
    $aRet = DllCall("advapi32.dll", "bool", "OpenProcessToken", "handle", $hProcess, "dword", 2, "handle*", 0)
    If @error Then Return SetError(_RWRPCleanup($hProcess, 0, 0, 2, @error), @extended, 0)
    If $aRet[0] = 0 Then Return SetError(_RWRPCleanup($hProcess, 0, 0, 3), @extended, 0)
    $hToken = $aRet[3]

;~  �������ƾ��
    ; TOKEN_ALL_ACCESS = 0xF01FF, SecurityImpersonation = 2, TokenPrimary = 1,
    $aRet = DllCall("advapi32.dll", "bool", "DuplicateTokenEx", "handle", $hToken, "dword", 0xF01FF, "ptr", 0, "int", 2, "int", 1, "handle*", 0)
    If @error Then Return SetError(_RWRPCleanup($hProcess, $hToken, 0, 2, @error), @extended, 0)
    If Not $aRet[0] Then Return SetError(_RWRPCleanup($hProcess, $hToken, 0, 3), @extended, 0)
    $hDupToken = $aRet[6]

;~  ʹ�� 'CreateProcessWithTokenW' ��������(Vista+ ϵͳ����)
    $aRet = DllCall("advapi32.dll", "bool", "CreateProcessWithTokenW", "handle", $hDupToken, "dword", 0, "wstr", $sPath, $sCmdType, $sCmd, _
            "dword", 0, "ptr", 0, $sFolderType, $sFolder, "ptr", DllStructGetPtr($stStartupInfo), "ptr", DllStructGetPtr($stProcInfo))
    $iErr = @error
    _RWRPCleanup($hProcess, $hToken, $hDupToken, 2, @error)
    If $iErr Then Return SetError(2, $iErr, 0)
    If Not $aRet[0] Then Return SetError(3, 0, 0)

;~  MsgBox(0,"��Ϣ","������Ϣ����: ���̾��:"&DllStructGetData($stProcInfo,1)&", �߳̾��:"&DllStructGetData($stProcInfo,2)& _
;~      ", ���� ID:"&DllStructGetData($stProcInfo,3)&", �߳� ID:"&DllStructGetData($stProcInfo,4)&@CRLF)

    $iRet = DllStructGetData($stProcInfo, 3) ; ���� ID

;~  ������� 'RunWait' ģʽ, �ȴ����̽���
    If $bWait Then
        ProcessWaitClose($iRet)
        $iRet = @extended ; �˳�����
    EndIf

;~  �ر��߳�����̾�� (˳�����Ҫ):
    _RWRPCleanup(0, DllStructGetData($stProcInfo, 2), DllStructGetData($stProcInfo, 1), 0)

    Return $iRet
EndFunc   ;==>_RunWithReducedPrivileges

; ===================================================================================================================
; Func _RWRPCleanup($hProcess,$hToken,$hDupToken,$iErr=0,$iExt=0)
;
; INTERNAL: _RunWithReducedPrivileges() �ĸ�������
;
; Author: Ascend4nt
; ===================================================================================================================

Func _RWRPCleanup($hProcess, $hToken, $hDupToken, $iErr = 0, $iExt = 0)
    Local $aHandles[3] = [$hToken, $hDupToken, $hProcess] ; order is important
    For $i = 0 To 2
        If $aHandles[$i] <> 0 Then DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $aHandles[$i])
    Next
    Return SetExtended($iExt, $iErr)
EndFunc   ;==>_RWRPCleanup
