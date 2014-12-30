#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=N:\测试脚本\查询SN ID资料(多客户版)(加密版).exe|-1
#PRE_Outfile=查询SN ID资料(多客户版)(加密版).exe
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
#cs 加密和解密
	$anlian = "http://anlian.co/queryinfo.php?DevID="
    $urmet =  "http://www.urmetddns.com/queryinfo.php?DevID=" 
	$GTC =  "http://www.eye-gtc.co/queryinfo.php?DevID=" 
	$ALPHATECH = "http://www.pdvr.co/queryinfo.php?DevID=" 
	$String = 
	$Encryption = StringEncrypt(1, $String, 'abc', 1, 4) 加密
	$Decryption = StringEncrypt(0, $Encryption, 'abc', 1, 4) 解密

	MsgBox(0, '加密前：' & $String, '加密：' & $Encryption & @CRLF & @CRLF & '解密：' & $Decryption)
	FileWrite(@ScriptDir & "\text.txt",$Encryption)
#ce
$anlianjm = "604272D3F6724AD9F63FC41585A26A0C387E9473F549EBF1C2CBDAAB398E88F6A97A96EA1FF57947" & _
			"F2A85FA52369485C72AB39AAC5406DEA73F25758AB3E46D02AD05F2D020C85992A3C"
$urmetjm =  "604272D3F6724AD9F63FC41585A26B733F0C95038848EAF5C5BCA1AE39888986AD7197ED18877841" & _
			"F5DF5EAF236F482676A23ADDC2346C9672F85728D7383FA32AA85E5D7F0D849D2F39A0100BB33A91" & _
			"F41174060AC4C81A2742"
$GTCjm =    "604272D3F6724AD9F63FC41585A26B733F0C95038848EBF5C5B7A1D93DF98887AC71979363877941" & _
			"F1DE5AA320614B5772A83AD8C2476C9A73F45027D73E3BA329AA5E5A037CF9EB2D4CA3150FC33AE5" & _
			"F6100974" 
$ALPHAjm = 	"604272D3F6724AD9F63FC41585A26B733F0C95038848EAF0C2BAA0DA388F8CF7AD0F979F63847843" & _
            "F2D45ED220194B2272DD39ABC1316C9C77F45758D7393CD42DDA5C2F0479849B2D38DA140BB1"

$anlian = StringEncrypt(0, $anlianjm, 'abc', 1, 4)
$urmet = StringEncrypt(0, $urmetjm, 'abc', 1, 4)
$GTC = StringEncrypt(0, $GTCjm, 'abc', 1, 4)
$ALPHATECH = StringEncrypt(0, $ALPHAjm, 'abc', 1, 4)

Global $Title = "查询SN ID资料" ,$sText
$Form1 = GUICreate($Title, 429, 204, -1, -1)
GUICtrlCreateLabel("请输入SN ID:", 10, 8, 79, 17)
$Input1 = GUICtrlCreateInput("", 266, 2, 89, 21)
$Button1 = GUICtrlCreateButton("查询 >", 358, 0, 65, 25,0x01)
GUICtrlSetResizing(-1, $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Radio1 = GUICtrlCreateRadio("安联SN ID", 96, 5, 79, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("Urmet SN ID", 176, 5, 89, 17)
$Radio3 = GUICtrlCreateRadio("GTC SN ID", 96, 29, 79, 17)
$Radio4 = GUICtrlCreateRadio("PDVR  SN ID", 176, 29, 87, 17)
;~ $Radio5 = GUICtrlCreateRadio("2DVR SN ID", 264, 29, 81, 17)
$Group1 = GUICtrlCreateGroup("显示区域", 16, 48, 401, 145)
$Label1 = GUICtrlCreateLabel("", 24, 72, 388, 108)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData ($Label1,"")
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
If GUICtrlRead($Radio1) = $GUI_CHECKED Then $sUrl = $anlian & GUICtrlRead($Input1)
If GUICtrlRead($Radio2) = $GUI_CHECKED Then $sUrl = $urmet & GUICtrlRead($Input1) 	
If GUICtrlRead($Radio3) = $GUI_CHECKED Then $sUrl = $GTC & GUICtrlRead($Input1)
If GUICtrlRead($Radio4) = $GUI_CHECKED Then $sUrl = $ALPHATECH & GUICtrlRead($Input1)
;~ If GUICtrlRead($Radio5) = $GUI_CHECKED Then $sUrl = $2DVR & GUICtrlRead($Input1)
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

;加密和解密
Func StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1, $i_Flag = 1)
    If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
        SetError(1)
        Return ''
    ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
        SetError(1)
        Return ''
    Else
        If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
        Local $b_EncryptText
        Local $b_EncryptPassword
        Local $v_EncryptModified
        Local $i_EncryptCountH
        Local $i_EncryptCountG
        Local $v_EncryptSwap
        Local $av_EncryptBox[256][2]
        Local $i_EncryptCountA
        Local $i_EncryptCountB
        Local $i_EncryptCountC
        Local $i_EncryptCountD
        Local $i_EncryptCountE
        Local $v_EncryptCipher
        Local $v_EncryptCipherBy
        $b_EncryptText = StringToBinary($s_EncryptText, $i_Flag)
        $b_EncryptPassword = StringToBinary($s_EncryptPassword, $i_Flag)
        If $i_Encrypt = 1 Then
            For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                $i_EncryptCountG = ''
                $i_EncryptCountH = ''
                $v_EncryptModified = Binary('')
                For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
                    If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
                        $i_EncryptCountH = 1
                    Else
                        $i_EncryptCountH += 1
                    EndIf
                    $v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255),2))
                Next
                $b_EncryptText = $v_EncryptModified
                $i_EncryptCountA = ''
                $i_EncryptCountB = 0
                $i_EncryptCountC = ''
                $i_EncryptCountD = ''
                $i_EncryptCountE = ''
                $v_EncryptCipherBy = ''
                $v_EncryptCipher = ''
                $v_EncryptSwap = ''
                $av_EncryptBox = ''
                Local $av_EncryptBox[256][2]
                For $i_EncryptCountA = 0 To 255
                    $av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1),2))
                    $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                Next
                For $i_EncryptCountA = 0 To 255
                    $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                    $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                    $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                    $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                Next
                For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
                    $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                    $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                    $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
                    $v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
                    $v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy, 2))
                Next
                $b_EncryptText = StringTrimLeft($v_EncryptCipher,2)
            Next
        Else
            $b_EncryptText = $s_EncryptText
            For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                $b_EncryptText = Binary('0x' & $b_EncryptText)
                $i_EncryptCountB = 0
                $i_EncryptCountC = ''
                $i_EncryptCountD = ''
                $i_EncryptCountE = ''
                $v_EncryptCipherBy = ''
                $v_EncryptCipher = ''
                $v_EncryptSwap = ''
                $av_EncryptBox = ''
                Local $av_EncryptBox[256][2]
                For $i_EncryptCountA = 0 To 255
                    $av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1),2))
                    $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                Next
                For $i_EncryptCountA = 0 To 255
                    $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                    $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                    $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                    $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                Next
                For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
                    $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                    $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                    $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
                    $v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
                    $v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy,2))
                Next
                $b_EncryptText = $v_EncryptCipher
                $i_EncryptCountG = ''
                $i_EncryptCountH = ''
                $v_EncryptModified = ''
                For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
                    If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
                        $i_EncryptCountH = 1
                    Else
                        $i_EncryptCountH += 1
                    EndIf
                    $v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255),2))
                Next
                $b_EncryptText = BinaryToString($v_EncryptModified, $i_Flag)
            Next
        EndIf
        Return $b_EncryptText
    EndIf
EndFunc   ;==>_StringEncrypt


