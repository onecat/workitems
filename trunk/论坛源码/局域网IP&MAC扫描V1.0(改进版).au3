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

GUICreate("������IP&MACɨ�� V1.0", 511, 460)
GUISetBkColor(0x66CD00);���ô�����ɫ
GUICtrlCreateGroup(" ������IP��Χ��", 2, 5, 190, 105)
GUICtrlSetColor(-1, 0XFF0000);��ɫ
$Label1 = GUICtrlCreateLabel("��������Ϊ�˷�������ά���͹���,�������÷Ƿ�����!����Ը��� ", 200, 25, 190, 115)
GUICtrlSetColor(-1, 0XFF0000);��ɫ
$Input1 = GUICtrlCreateInput("192.168.0.1", 70, 30, 100, 20)
$Input2 = GUICtrlCreateInput("192.168.0.254", 70, 70, 100, 20)
$Label2 = GUICtrlCreateLabel("��ʼ��ַ��", 10, 35, 60, 20)
GUICtrlSetColor(-1, 0x0000ff)
$Label3 = GUICtrlCreateLabel("������ַ��", 10, 75, 60, 20)
GUICtrlSetColor(-1, 0x0000ff)
$Button1 = GUICtrlCreateButton("��ʼɨ��", 420, 110, 70, 25)
GUICtrlSetBkColor(-1, 0xE8E8E8)
$Pro = GUICtrlCreateProgress(5, 438, 500, 20)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label6 = GUICtrlCreateLabel("��ǰ�r�g:", 200, 100, 170, 15)
GUICtrlSetData($Label6, "����ʱ��:"& @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & "")
GUICtrlSetColor(-1,0x0000ff)    ; ��ɫ
$Label7 = GUICtrlCreateLabel("��ά���Թ�����  ���ߣ���˹_Easy",200, 60, 200, 15)
GUICtrlSetColor(-1,0x0000ff)   ; ��ɫ
$Label8 = GUICtrlCreateLabel("http://ywwlgzs.blog.163.com/",200, 80, 250, 15)
GUICtrlSetColor(-1,0x0000ff)   ; ��ɫ
$Label8 = GUICtrlCreateLabel("˵����",200, 10, 190, 15)
GUICtrlSetColor(-1,0XFF0000)   ; ��ɫ
$Combo1 = GUICtrlCreateCombo("", 5, 115, 395, 35, 0x0003)
$listview1 = GUICtrlCreateListView("�������                 |IP��ַ                               |MAC��ַ                            ", 5, 136, 500, 300)
GUICtrlSetColor(-1, 0XFF0000)    ; ��ɫ
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
GUICtrlSendMsg($listview1, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_GRIDLINES, $LVS_EX_GRIDLINES)
GUICtrlSendMsg($listview1, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_FULLROWSELECT, $LVS_EX_FULLROWSELECT)

GUISetState(@SW_SHOW)

$T3 = ""
$T4 = ""
;_wmiset()


While 1

$T3 = @HOUR & ":" & @MIN & ":" & @SEC
If $T3 <> $T4 Then
   $T4 = $T3
   GUICtrlSetData($Label6, "����ʱ��:"& @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & "")
EndIf


$nMsg = GUIGetMsg()
Select
   Case $nMsg = $GUI_EVENT_CLOSE
    Exit
   Case $nMsg = $Button1
    FileDelete("IP&MAC.ini")
    _GUICtrlListView_DeleteAllItems($listview1)
    $StartIp = GUICtrlRead($Input1)
    $StopIp = GUICtrlRead($Input2)
    _IpScan($StartIp, $StopIp)
     
EndSelect
WEnd

Func _IpScan($sIP, $eIP, $FilePath = @ScriptDir)
$sIP = _StringIsIP($sIP)
$eIP = _StringIsIP($eIP)
If $sIP = "" Or $eIP = "" Then
   MsgBox(64, '����', ' ip ��ַ��ʽ����!')
Else
   $ss = StringSplit($sIP, ".")
   $es = StringSplit($eIP, ".")
   If $ss[1] <> $es[1] Or $ss[2] <> $es[2] Then
    MsgBox(64, '����', ' ip ��ַ��Χ����!')
   Else
    If $es[3] < $ss[3] Or ($es[4] < $ss[4] And ($es[3] > $ss[3] Or $es[3] = $ss[3])) Then
     MsgBox(64, '����', '�����IP��ַ��Χ!')
    Else
     For $n = $ss[3] To $es[3]
      For $i = $ss[4] To $es[4]
       $p = ($n + 1) * ($i + 1)
       $sp = ($es[4] - $ss[4] + 1) * ($es[3] - $ss[3] + 1)
       $per = $p / $sp * 254
       $res = StringLeft($per, 3)
       $sIP = $ss[1] & "." & $ss[2] & "." & $n & "." & $i
       $MAC = _GetMAC($sIP)
       If $MAC <> "00-00-00-00-00-00" Then
        $hostname = _TCPIpToName ($sIp)
        FileWriteLine("IP&MAC.ini", ''&$hostname&'   ' & $sIP & '   ' & $MAC)
        GUICtrlCreateListViewItem($hostname & "|" & $sIP & "|" & $MAC, $listview1)
       Else
        GUICtrlCreateListViewItem('δ��⵽' & "|" & $sIP & "|" & 'δ��⵽', $listview1)
       EndIf
       GUICtrlSetData($Pro, $res)
      Next
     Next
     GUICtrlSetData($Pro, "���")
    EndIf
   EndIf
EndIf
EndFunc   ;==>_IpScan

Func _GetMAC($sIP)
Local $MAC, $MACSize
Local $i, $s, $r, $iIP

$MAC = DllStructCreate("byte[6]")
$MACSize = DllStructCreate("int")
DllStructSetData($MACSize, 1, 6)
$r = DllCall("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
$iIP = $r[0]
$r = DllCall("iphlpapi.dll", "int", "SendARP", "int", $iIP, "int", 0, "ptr", DllStructGetPtr($MAC), "ptr", DllStructGetPtr($MACSize))
$s = ""
For $i = 0 To 5
   If $i Then $s = $s & "-"
   $s = $s & Hex(DllStructGetData($MAC, 1, $i + 1), 2)
  
Next
Return $s
EndFunc   ;==>_GetMAC

Func _StringIsIP($strIP)
$str = StringSplit($strIP, ".")
If $str[0] <> 4 Then
   Return ("")
ElseIf StringIsDigit($str[1]) <> 1 Or StringIsDigit($str[2]) <> 1 Or StringIsDigit($str[3]) <> 1 Or StringIsDigit($str[4]) <> 1 Then
   Return ("")
ElseIf $str[1] > 255 Or $str[2] > 255 Or $str[3] > 255 Or $str[4] > 255 Then
   Return ("")

Else
   $strIP = Int($str[1]) & "." & Int($str[2]) & "." & Int($str[3]) & "." & Int($str[4])
   Return $strIP

EndIf
EndFunc   ;==>_StringIsIP

Func Shutdown_()
	Local $computer, $Input3, $Input4
$objlocator = ObjCreate("wbemscripting.swbemlocator")
    $objWMIService = $objlocator.connectserver($computer, "root/cimv2", $Input3, $Input4)
$colItems = $objWMIService.ExecQuery("SELECT * FROM win32_operatingsystem where primary= true")


For $objItem In $colItems
   ;$objItem.win32shutdown(X_())
Next
EndFunc