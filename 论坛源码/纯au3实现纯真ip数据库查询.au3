#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

Dim $OffSet,$FirstStartIP,$file,$EndIPOff,$OffSet,$LastStartIP ,$RecordCount,$ContryFlag,$my_ip_contry,$my_ip_LocalStr


$myipadress=QQWry("125.89.62.181")
MsgBox(0,"",$myipadress)



Func QQWry($dotip)
        Dim $ip,$nRet,$RangB,$RangE,$RecNo
        If FileExists(@ScriptDir&"\QQWry.DAT")=0 Then
                MsgBox(0,"警告","请将纯真ip数据库QQWry.DAT放于程序根目录")
                Exit
                EndIf
$ip=IPToInt($dotip)        
$file=FileOpen(@ScriptDir&"\QQWry.DAT",16)
$Buf=FileRead($file,8)
$FirstStartIP = AscB(BinaryMid($Buf, 1, 1)) + (AscB(BinaryMid($Buf, 2, 1))*256) + (AscB(BinaryMid($Buf, 3, 1))*256*256) + (AscB(BinaryMid($Buf, 4, 1))*256*256*256)
$LastStartIP = AscB(BinaryMid($Buf, 5, 1)) + (AscB(BinaryMid($Buf, 6, 1))*256) + (AscB(BinaryMid($Buf, 7, 1))*256*256) + (AscB(BinaryMid($Buf, 8, 1))*256*256*256)
$RecordCount = Int(($LastStartIP - $FirstStartIP)/7)
If $RecordCount<=1 Then
        Return "未知地区！"
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