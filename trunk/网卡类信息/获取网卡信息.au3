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

$wbemFlagReturnImmediately = 0x10
$wbemFlagForwardOnly = 0x20
$colItems = ""
$strComputer = "localhost"
$file = FileOpen(@ScriptDir & "\MAC.txt", 10)
$Output=""


$Output = $Output & "�������" & $strComputer & @CRLF
$Output = $Output & "==========================================" & @CRLF
$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", _
$wbemFlagReturnImmediately + $wbemFlagForwardOnly)

If IsObj($colItems) then
For $objItem In $colItems
$Output = $Output & "������ " & $objItem.Description & @CRLF
;$strDefaultIPGateway = $objItem.DefaultIPGateway(0)
$Output = $Output & "Ĭ�����أ� " & $objItem.DefaultIPGateway(0) & @CRLF


$Output = $Output & "��������� " & $objItem.DNSHostName & @CRLF
$strIPAddress = $objItem.IPAddress(0)
$Output = $Output & "IP��ַ�� " & $strIPAddress & @CRLF
$strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(0)
$Output = $Output & "Ĭ��DNS�� " & $strDNSServerSearchOrder & @CRLF
$strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(1)
$Output = $Output & "����DNS�� " & $strDNSServerSearchOrder & @CRLF

$strIPSubnet = $objItem.IPSubnet(0)
$Output = $Output & "�������룺 " & $strIPSubnet & @CRLF
$Output = $Output & "MAC��ַ�� " & $objItem.MACAddress & @CRLF

if FileWrite($file, $Output)= 1 then ExitLoop
$Output=""
Next
Else

Msgbox(0,"WMI Output","No WMI Objects Found for class: " & "Win32_NetworkAdapterConfiguration" )
endif
FileClose($file)
ShellExecute( "MAC.txt", "", @ScriptDir, "edit")
