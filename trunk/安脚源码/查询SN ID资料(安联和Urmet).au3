#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=C:\Users\chtyfox\Desktop\查询SN ID资料(安联和Urmet).exe|-1
#PRE_Outfile=查询SN ID资料(安联和Urmet).exe
#PRE_UseUpx=n
#PRE_Res_Comment=小站
#PRE_Res_Description=小站
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_LegalCopyright=1.0.0.0
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $Title = "查询SN ID资料" ,$sText
$Form1 = GUICreate($Title, 428, 187, -1, -1)
GUICtrlCreateLabel("请输入SN ID:", 10, 8, 79, 17)
$Input1 = GUICtrlCreateInput("", 266, 2, 89, 21)
$Button1 = GUICtrlCreateButton("查询 >", 358, 0, 65, 25,0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Radio1 = GUICtrlCreateRadio("安联SN ID", 96, 5, 79, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("Urmet SN ID", 176, 5, 89, 17)
$Group1 = GUICtrlCreateGroup("显示区域", 16, 32, 401, 145)
$Label1 = GUICtrlCreateLabel("", 24, 56, 388, 108)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData ($Label1, SN())	
	EndSwitch
WEnd

Func SN()
	$SN = "外网IP:   " & RemoteIP() & @CRLF & _   
		  "内网IP:   " & LocalIP()	 & @CRLF & _   
		  "媒体端口: " & MediaPort()	 & @CRLF & _  
		  "IE端口:   " & HttpPort()	 & @CRLF & _  
		  "通道数:   " & ChannelNum()	 & @CRLF & _  
		  "设备类型: " & DevType()	 & @CRLF & _  
		  "设备名称: " & DevName()	 & @CRLF & _  
		  "MAC地址:  " & Mac()
	Return $SN
EndFunc	

Func WZ()
If GUICtrlRead($RADIO1) = $GUI_CHECKED Then
	$sUrl = "http://anlian.co/queryinfo.php?DevID=" & GUICtrlRead($Input1)
Else
	$sUrl = "http://www.urmetddns.com/queryinfo.php?DevID=" & GUICtrlRead($Input1)
EndIf	

$oHTTP = ObjCreate('microsoft.xmlhttp')
$oHTTP.Open('get', $sUrl, False)
$oHTTP.Send("")
$sText = BinaryToString($oHTTP.responseBody)
EndFunc

Func RemoteIP()
	WZ()
	Dim $nStart = StringInStr($sText, "<RemoteIP>", 1) + StringLen("<RemoteIP>")
	Dim $nEnd = StringInStr($sText, "</RemoteIP>", 1, 1, $nStart)
	Dim $RemoteIP = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $RemoteIP
EndFunc;外网IP

Func LocalIP()
	WZ()
	Dim $nStart = StringInStr($sText, "<LocalIP>", 1) + StringLen("<LocalIP>")
	Dim $nEnd = StringInStr($sText, "</LocalIP>", 1, 1, $nStart)
	Dim $LocalIP = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $LocalIP
EndFunc;本地IP

Func MediaPort()
	WZ()
	Dim $nStart = StringInStr($sText, "<MediaPort>", 1) + StringLen("<MediaPort>")
	Dim $nEnd = StringInStr($sText, "</MediaPort>", 1, 1, $nStart)
	Dim $MediaPort = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $MediaPort
EndFunc;媒体端口

Func HttpPort()
	WZ()
	Dim $nStart = StringInStr($sText, "<HttpPort>", 1) + StringLen("<HttpPort>")
	Dim $nEnd = StringInStr($sText, "</HttpPort>", 1, 1, $nStart)
	Dim $HttpPort = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $HttpPort
EndFunc;IE端口

Func ChannelNum()
	WZ()
	Dim $nStart = StringInStr($sText, "<ChannelNum>", 1) + StringLen("<ChannelNum>")
	Dim $nEnd = StringInStr($sText, "</ChannelNum>", 1, 1, $nStart)
	Dim $ChannelNum = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $ChannelNum
EndFunc;通道

Func DevType()
	WZ()
	Dim $nStart = StringInStr($sText, "<DevType>", 1) + StringLen("<DevType>")
	Dim $nEnd = StringInStr($sText, "</DevType>", 1, 1, $nStart)
	Dim $DevType = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $DevType
EndFunc;设备类型

Func DevName()
	WZ()
	Dim $nStart = StringInStr($sText, "<DevName>", 1) + StringLen("<DevName>")
	Dim $nEnd = StringInStr($sText, "</DevName>", 1, 1, $nStart)
	Dim $DevName = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $DevName
EndFunc;设备名称

Func Mac()
	WZ()
	Dim $nStart = StringInStr($sText, "<Mac>", 1) + StringLen("<Mac>")
	Dim $nEnd = StringInStr($sText, "</Mac>", 1, 1, $nStart)
	Dim $Mac = StringMid($sText, $nStart, $nEnd - $nStart)
	Return $Mac
EndFunc;MAC地址

