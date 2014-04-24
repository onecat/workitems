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
#include "Au3_Thread.au3"
#include <Sound.au3>

;����һ������,�����ӽ��̿���
_SetVar("AudioFile","C:\Windows\Media\ir_end.wav")

;����һ�����̺�̨��������
Global $Pid_PlayMusic = _CreateThread("PlayMusic")
Sleep(500)

;ɱ����̨�������ֵĽ���
_KillThread($Pid_PlayMusic)
xExit()


;�������ֺ���,������̨����ʱ���õ�
Func PlayMusic()
        SoundPlay(_GetVar("AudioFile"),1)
EndFunc

Func GetSoundLength($sFile)
        Local $sound = _SoundOpen($sFile)
If @error = 2 Then
        Return "0"
ElseIf @extended <> 0 Then
    Local $extended = @extended 
    Local $stText = DllStructCreate("char[128]")
    Local $errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
    MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
        Return "0"
Else
        Return _SoundLength($sound, 2)
EndIf
EndFunc

Func xExit()
        If Processexists($Pid_PlayMusic) Then ProcessClose($Pid_PlayMusic)
        _SetVar("AudioFile")
	EndFunc
	
	
#cs --------------------------------------------
AutoIT�汾: Au3_Thread.au3  on 3.3.7.15
  �ű�����: L4EVER
  �����ʼ�: ZC0629[at]Gmail.com
         QQ/TM: 425145
  �ű�˵��: ����̽�����̵߳�ȱ��
  
  �����߳� : _CreateThread("������")
                        ���ش������߳�pidֵ
                                
  �ر��߳� : _KillThread(��_CreateThread���ص�pid)
                        ����1�ɹ�,����0ʧ��,
  
  ����ȫ�ֱ��� : _SetVar("������","����ֵ")
                        ����ֵΪ�վ�����������
                        ����1�ɹ�,��������ʧ��
                        
  ��ȡȫ�ֱ��� : _GetVar("������")
                        ��������������,���򷵻�@error
  
#ce --------------------------------------------


#NoTrayIcon
If $cmdline[0] > 0 Then
        $str = call($cmdline[1])
        Exit
EndIf

Opt("TrayIconHide", 0)
Func _CreateThread($thread)
        if @compiled Then
        Return Run(@ScriptFullPath & " " & $thread)
Else
        Return ShellExecute (@ScriptFullPath,$thread)
EndIf

EndFunc

Func _KillThread($thread)
        If ProcessExists($thread) <> 0 Then
                ProcessClose($thread)
                Return 1
        Else
                Return 0
        EndIf
EndFunc

Func _SetVar($Str,$Key="")
        $AppKey = StringReplace(StringReplace(@ScriptName,".au3",""),".exe","")
        if $Key <> "" Then
        $RegWriteResult = Regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str,"REG_SZ", $Key)
        Else
        $RegWriteResult = RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str)
        EndIf

        if $RegWriteResult = 0  Then
                Return @Error
        Else
                Return $RegWriteResult
        EndIf
EndFunc

Func _GetVar($Str)
        $AppKey = StringReplace(StringReplace(@ScriptName,".au3",""),".exe","")
        $RegReadResult = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\L4EVER.cn\Thread\" & $AppKey,$Str)
        if $RegReadResult = "" Then
                        Return @error 
                Else
                        Return $RegReadResult
                EndIf
EndFunc	
