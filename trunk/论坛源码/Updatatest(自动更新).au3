;=====================================;
;qq150401022                          ;
;2008/12/13                           ;
;=====================================;

#include <Array.au3>
#NoTrayIcon
Opt("MustDeclareVars",1)
dim $Size,$i,$RemoteFile,$LoadFile,$File,$DownStatus,$IniStr,$begin,$dif, _
$g_szVersion ,$s,$s1,$s3;;;;;;;;;;;;;;;;全局变量

$g_szVersion = "进度条演示"

If WinExists($g_szVersion) Then Exit 

AutoItWinSetTitle($g_szVersion)




if 0=FileExists(@ScriptDir&"\adder.ini") Then
	IniWrite(@ScriptDir&"\adder.ini","在线下载进度条","adder", _
	"http://www.autoitscript.com/files/autoit3/autoit-v3-setup.exe")
	
	
EndIf

$IniStr=IniRead(@ScriptDir&"\adder.ini","在线下载进度条","adder","")
	if ""=$IniStr then 
		MsgBox(0,"提示","请在ini文件填写要下载文件地址")
	
	EndIf	
$RemoteFile=$IniStr
$File=StringSplit($RemoteFile,'/',1)
$LoadFile=@ScriptDir&"\"&$File[_ArrayMax($File)]
ConsoleWrite($File[_ArrayMax($File)])
ConsoleWrite($LoadFile)
$Size=InetGetSize($RemoteFile)

ProgressOn("在线更新进度", "", "" ,-1,-1,2+16)
$begin = TimerInit()
InetGet($RemoteFile,$LoadFile,1,1)

for $i=int(@InetGetBytesRead/$Size*100) to 100
	sleep(500)
	if -1=@InetGetBytesRead then Exit
	
	$i=@InetGetBytesRead/$Size*100
	
			if 1=@InetGetActive then 
				$DownStatus="下载中"
			Else
				$DownStatus="没下载.."
			EndIf
			$dif = TimerDiff($begin)
			$s=Round($dif/1000,0)
			$s1=MylBytes(@InetGetBytesRead)
			$s3=MylBytes(@InetGetBytesRead/$s)
				ProgressSet($i,"已下载" &$s1& " 总共" & MylBytes($Size)  & _
			@CRLF&"百分比  "&int($i)&"%",$DownStatus& " 用时间"&Round($dif/1000,0)&"秒"& _
			$s3 & "/s"& "剩"&MylBytes($Size-@InetGetBytesRead) &@CRLF& _
			"剩余时间"&int( MylBytes(($Size-@InetGetBytesRead)/(@InetGetBytesRead/$s)))&"秒")
		Next		
	ProgressSet($i, "完成下载 100%")
			sleep(2000)
	ProgressOff()	
Func MylBytes($lBytes)  
	
			if $lBytes<1024 Then
				
						Return ($lBytes & "b")
						
					ElseIf $lBytes<1048576 Then
						
						Return  int(($lBytes / 1024)) &"k"
						
					ElseIf  $Lbytes<536870912 Then
						
						Return  Round($lBytes / 1024 / 1024,2)&  "M"
					
					Else
						Return Round($lBytes/(1024^2) / 1024,2) & "G"
						
				EndIf
EndFunc
