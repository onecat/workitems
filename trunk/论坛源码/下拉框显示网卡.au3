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

#include <GUIConstants.au3>
#Include <GuiStatusBar.au3>
#include <file.au3>
#Include <GuiListView.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <iNet.au3>
#include <Constants.au3>

GUICreate("��������ʾ���� V1.0", 511, 460)


$Combo1 = GUICtrlCreateCombo("", 5, 115, 395, 35, 0x0003)

Dim $Description[5], $ServiceName[5], $cards, $myipaddress, $mygeteway, $mysubnetmask
For $i = 1 To 4
$var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards", $i)
If @error <> 0 Then
   ExitLoop
Else
   $Description[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "Description")
   $ServiceName[$i] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\" & $var, "ServiceName")
   If StringLen($Description[$i]) > 0 Then
    $cards = $cards & $Description[$i] & "|"
   EndIf
EndIf
Next

GUICtrlSetData($Combo1, $cards, $Description[1])
GUISetState(@SW_SHOW)



While 1

$nMsg = GUIGetMsg()
Select
   Case $nMsg = $GUI_EVENT_CLOSE
    Exit
;~    Case $nMsg = $Button1
;~     FileDelete("IP&MAC.ini")
;~     _GUICtrlListView_DeleteAllItems($listview1)
;~     $StartIp = GUICtrlRead($Input1)
;~     $StopIp = GUICtrlRead($Input2)
;~     _IpScan($StartIp, $StopIp)
;~      
EndSelect
WEnd
