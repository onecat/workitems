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
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <Process.au3>
#include <WindowsConstants.au3>
#include <WindowsConstants.au3>
#include <Inet.au3>

Dim $OffSet,$FirstStartIP,$file,$EndIPOff,$OffSet,$LastStartIP ,$RecordCount,$ContryFlag,$my_ip_contry,$my_ip_LocalStr



$GUI_1 = GUICreate("IP��ַ������", 270, 159, 192, 125)
$IPAddress1 = _GUICtrlIpAddress_Create($GUI_1, 32, 16, 185, 25)
_GUICtrlIpAddress_Set($IPAddress1, "125.89.62.181")
$Label1 = GUICtrlCreateLabel("", 32, 64, 204, 28)
$Button1 = GUICtrlCreateButton("ȷ��", 26, 106, 94, 35,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("�˳�", 146, 106, 94, 35)
GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button1
			$connect = _GetNetworkConnect() 
			If  $connect Then 
				$T = _GUICtrlIpAddress_Get($IPAddress1)
				$ZXIP = _qq_query($T) 
				GUICtrlSetData ($Label1,$ZXIP)
			Else
				$T = _GUICtrlIpAddress_Get($IPAddress1)
				$myipadress=QQWry($T)
				GUICtrlSetData ($Label1,$myipadress)
		EndIf	
		Case $nMsg = $Button2
			Exit 
	EndSelect
WEnd

;~ $myipadress=QQWry("125.89.62.181")
;~ MsgBox(0,"",$myipadress)



Func QQWry($dotip)
        Dim $ip,$nRet,$RangB,$RangE,$RecNo
        If FileExists(@ScriptDir&"\QQWry.DAT")=0 Then
                MsgBox(0,"����","�뽫����ip���ݿ�QQWry.DAT���ڳ����Ŀ¼")
                Exit
                EndIf
$ip=IPToInt($dotip)        
$file=FileOpen(@ScriptDir&"\QQWry.DAT",16)
$Buf=FileRead($file,8)
$FirstStartIP = AscB(BinaryMid($Buf, 1, 1)) + (AscB(BinaryMid($Buf, 2, 1))*256) + (AscB(BinaryMid($Buf, 3, 1))*256*256) + (AscB(BinaryMid($Buf, 4, 1))*256*256*256)
$LastStartIP = AscB(BinaryMid($Buf, 5, 1)) + (AscB(BinaryMid($Buf, 6, 1))*256) + (AscB(BinaryMid($Buf, 7, 1))*256*256) + (AscB(BinaryMid($Buf, 8, 1))*256*256*256)
$RecordCount = Int(($LastStartIP - $FirstStartIP)/7)
If $RecordCount<=1 Then
        Return "δ֪������"
Else
$RangB=0
$RangE=$RecordCount
While $RangB<($RangE-1)
        $RecNo=Int(($RangB+$RangE)/2)
        $StartIp=GetStartIp($RecNo)
        If $IP=$StartIp Then
                $RangB=$RecNo
                ExitLoop
        EndIf
        
        If $IP>$StartIp Then
                $RangB=$RecNo
        Else
                $RangE=$RecNo
        EndIf
        WEnd

$StartIp=GetStartIp($RangB)
$Endip=GetEndIp()
If ($StartIp<=$ip) And ($Endip>=$ip) Then
        $nRet=0
Else
        $nRet=3
EndIf

 
Return GetContry($ip)
EndIf
EndFunc





Func GetContry($ip)

If ($ContryFlag=1 Or $ContryFlag=2) Then
        $Contry=GetFlagStr($EndIPOff+4)
        If $ContryFlag=1 Then
                $LocalStr=GetFlagStr(FileGetPos ($file))
                If $ip>=IPToInt("255.255.255.0") And $ip<=("255.255.255.255") Then
                        $LocalStr=GetFlagStr($EndIPOff+21)
                        $Contry=GetFlagStr($EndIPOff+12)
                EndIf
        Else
        $LocalStr=GetFlagStr($EndIPOff+8)
EndIf

Else
        $Contry=GetFlagStr($EndIPOff+4)
    $LocalStr=GetFlagStr(FileGetPos ($file))
EndIf

$Contry=StringStripWS($Contry,8)
$LocalStr=StringStripWS($LocalStr,8)
If StringInStr($Contry,"CZ88.NET") Then $Contry=""
If StringInStr($LocalStr,"CZ88.NET") Then $LocalStr=""

Return String($Contry)&String($LocalStr)
EndFunc

Func GetFlagStr($OffSet_my)
        Dim $offset_1=$OffSet_my
Dim $flag=0
While 1
        FileSetPos($file,$offset_1,0)
        $flag=FileRead($file,1)
        If $flag=1 Or $flag=2 Then
                $Buf=FileRead($file,3)
                If $flag=2 Then
                        $ContryFlag=2
                        $EndIPOff=$offset_1-4
                EndIf
        $offset_1=AscB(BinaryMid($Buf, 1, 1)) + (AscB(BinaryMid($Buf, 2, 1))*256) + (AscB(BinaryMid($Buf, 3, 1))*256*256)        
Else
        ExitLoop
EndIf
WEnd

If $offset_1<12 Then
        Return ""
Else
        FileSetPos($file,$offset_1,0)
        Return GetStr()
EndIf
EndFunc

Func GetStr()
Dim $C,$strs,$x
While 1
        $x=FileRead($file,1)
        $c=AscB($x)
        If $c=0 Then ExitLoop
                $strs=$strs&$x
        WEnd
        
        $getstr=StringReplace($strs,"0x","")
        $getstr=StringStripWS($getstr,8)
        
        Return BinaryToString(Binary("0x"&$getstr&"00"))
EndFunc




Func GetStartIp($RecNo1)
        $OffSet=$FirstStartIP+$RecNo1*7
        FileSetPos ($file, $OffSet, 0 )
    $Buf=FileRead($file,7)
$EndIPOff = AscB(BinaryMid($Buf, 5, 1)) + (AscB(BinaryMid($Buf, 6, 1))*256) + (AscB(BinaryMid($Buf, 7, 1))*256*256) 
$StartIp1 = AscB(BinaryMid($Buf, 1, 1)) + (AscB(BinaryMid($Buf, 2, 1))*256) + (AscB(BinaryMid($Buf, 3, 1))*256*256)  + (AscB(BinaryMid($Buf, 4, 1))*256*256*256)
Return $StartIp1
EndFunc

Func GetEndIp()

        FileSetPos ($file, $EndIPOff, 0 )
    $Buf=FileRead($file,5)
$Endip1 = AscB(BinaryMid($Buf, 1, 1)) + (AscB(BinaryMid($Buf, 2, 1))*256) + (AscB(BinaryMid($Buf, 3, 1))*256*256)  + (AscB(BinaryMid($Buf, 4, 1))*256*256*256)
$ContryFlag=AscB(BinaryMid($Buf, 5, 1))
Return $Endip1
EndFunc






Func IPToInt($IP)

$IPArray = StringSplit($IP,".")
$IPToInt = ($IPArray[1]*256*256*256) + ($IPArray[2]*256*256) + ($IPArray[3]*256) + $IPArray[4]
Return $IPToInt
EndFunc

Func IntToIP($IntValue)
$p4 = $IntValue - Fix($IntValue/256)*256
$IntValue = ($IntValue-$p4)/256
$p3 = $IntValue - Fix($IntValue/256)*256
$IntValue = ($IntValue-$p3)/256
$p2 = $IntValue - Fix($IntValue/256)*256
$IntValue = ($IntValue - $p2)/256
$p1 = $IntValue
$IntToIP = $p1 & "." & $p2 & "." & $p3 & "." & $p4
Return $IntToIP
EndFunc

Func Fix($num)
If StringInStr($num,".")>0 Then
$nums=StringSplit($num,".")
Return $nums[1]
Else
Return $num
EndIf
EndFunc


Func AscB($str)
Return Dec(StringReplace($str,"0x",""))        
EndFunc

Func _qq()
        Local $source = _INetGetSource("http://ip.qq.com")
        Local $sIP,$sLocation,$aIP,$aLocation
        $aIP = StringRegExp($source,'����ǰ��IPΪ.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "δ��ȡIP"
        EndIf
        $aLocation = StringRegExp($source,'��IP���ڵ�Ϊ.*?([^<>]+)</span>',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
                $sLocation = StringRegExpReplace($sLocation,'&nbsp;','')
        Else
                $sLocation = "δ��ȡ����λ��"
        EndIf
        Return $sIP & @CRLF & $sLocation
EndFunc

Func _qq_query($sHostName = "")
        Local $source = _INetGetSource('http://ip.qq.com/cgi-bin/searchip?searchip1=' & $sHostName)
        Local $sIP,$sLocation,$aIP,$aLocation
        $aIP = StringRegExp($source,'����ǰ��IPΪ.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "δ��ȡIP"
        EndIf
        $aLocation = StringRegExp($source,'��IP���ڵ�Ϊ.*?([^<>]+)</span>',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
                $sLocation = StringRegExpReplace($sLocation,'&nbsp;','')
        Else
                $sLocation = "δ��ȡ����λ��"
        EndIf
        Return $sIP & @CRLF & $sLocation
	EndFunc
	
	Func _GetNetworkConnect() 
    Local Const $NETWORK_ALIVE_LAN = 0x1  ;net card connection 
    Local Const $NETWORK_ALIVE_WAN = 0x2  ;RAS (internet) connection 
    Local Const $NETWORK_ALIVE_AOL = 0x4  ;AOL 
     
    Local $aRet, $iResult 
     
    $aRet = DllCall("sensapi.dll", "int", "IsNetworkAlive", "int*", 0) 
     
    If BitAND($aRet[1], $NETWORK_ALIVE_LAN) Then $iResult &= "LAN connected" & @LF 
    If BitAND($aRet[1], $NETWORK_ALIVE_WAN) Then $iResult &= "WAN connected" & @LF 
    If BitAND($aRet[1], $NETWORK_ALIVE_AOL) Then $iResult &= "AOL connected" & @LF 
     
    Return $iResult 
EndFunc