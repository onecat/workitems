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
;ע���
Func _rename($Hostname) ;������������
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters","Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Control\ComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\Tcpip\Parameters","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\Tcpip\Parameters","Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName\ComputerName","ComputerName","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\","NV Hostname","REG_SZ",$Hostname)
RegWrite("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\","Hostname","REG_SZ",$Hostname)
 EndFunc

;WMI����
Func _QueryWmiStatus()

$foo = Run(@ComSpec & ' /c sc query winmgmt|find "STATE"  ', @SystemDir, @SW_HIDE, $STDOUT_CHILD)
ProcessWaitClose($foo)
$result = StdoutRead($foo)
If @error Then 
        MsgBox(0,"ERRO!","can't get STDOUT'")
EndIf
$aArray=_StringExplode($result, ":", 0)
$aArray1=_StringExplode($aArray[1]," ", 0)
If $aArray1[1]=4 Then
        Return 1
ElseIf $aArray1[1]=1 Then
        RunWait(@ComSpec & ' /c sc config winmgmt start= auto', @SystemDir, @SW_HIDE)
        RunWait(@ComSpec & ' /c sc start winmgmt', @SystemDir, @SW_HIDE)
        Return 1
Else
        Return 0
EndIf
EndFunc
