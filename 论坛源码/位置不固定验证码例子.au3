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

#include <Constants.au3>
#include <APIConstants.au3>
#include <GUIConstantsEx.au3>
#include <INet.au3>
#include <WinAPI.au3>
#include <WinAPIEx.au3>
#include <Memory.au3>
#include <GDIPlusex.au3>
;~ #include <Array.au3>
 
$s_FontFile = "CodeFont.txt"
 
Global $oldBitMap, $YzmArray, $hScaleBitmap, $DoneArray
Global $Scale = 4, $Coordinate = 20
Global $LoginYzmUrl = "http://www.sharebank.com.cn/members/authimg.php"
Global $learnedYzm[1][3]
Global $learninput[6]
Global $left, $top, $zhong, $ziwidth, $ziHeight, $zishu, $yzmclass = 10
 
$hGui = GUICreate("位置不固定验证码例子", 800, 400)
 
GUICtrlCreateGroup("验证码地址", 590, 5, 180, 45)
$InputYzmUrl = GUICtrlCreateInput($LoginYzmUrl, 600, 20, 160, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("放大验证码", 5, 5, 580, 255)
$Pic2 = GUICtrlCreatePic("", 20, 20, 500, 200)
Global $hPic2 = GUICtrlGetHandle(-1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("字型数据", 590, 60, 180, 110)
GUICtrlCreateLabel("左边空：", 600, 80)
GUICtrlCreateLabel("上边空：", 600, 110)
GUICtrlCreateLabel("字间空：", 600, 140)
GUICtrlCreateLabel("字符宽：", 680, 80)
GUICtrlCreateLabel("字符高：", 680, 110)
GUICtrlCreateLabel("字符数：", 680, 140)
$input1 = GUICtrlCreateInput("0", 650, 80, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
$input2 = GUICtrlCreateInput("0", 650, 110, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
$input3 = GUICtrlCreateInput("0", 650, 140, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
$input4 = GUICtrlCreateInput("0", 730, 80, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
$input5 = GUICtrlCreateInput("0", 730, 110, 20)
GUICtrlSetState(-1, $GUI_DISABLE)
$input6 = GUICtrlCreateInput("5", 730, 140, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("验证码类型", 590, 180, 180, 80)
GUIStartGroup()
$radio1 = GUICtrlCreateRadio("仅数字", 600, 200)
GUICtrlSetState(-1, $GUI_DISABLE)
$radio2 = GUICtrlCreateRadio("仅字母", 680, 200)
GUICtrlSetState(-1, $GUI_DISABLE)
$radio3 = GUICtrlCreateRadio("数字字母混合", 600, 230)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetState($radio1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("原始验证码", 5, 270, 180, 80)
$Pic = GUICtrlCreatePic("", 20, 290, 50, 20)
Global $hPic = GUICtrlGetHandle(-1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("功能区", 190, 270, 580, 80)
$MF = GUICtrlCreateCheckbox("中值滤波", 200, 320, 60)
$quse = GUICtrlCreateCheckbox("二色化", 280, 320, 60)
$InvertsColors = GUICtrlCreateCheckbox("反相", 360, 320, 60)
$qudian = GUICtrlCreateCheckbox("去噪点", 440, 320, 60)
$study = GUICtrlCreateButton("学习", 520, 320, 60)
$make = GUICtrlCreateButton("识别", 600, 320, 60)
 
GUIStartGroup()
$BGray = GUICtrlCreateRadio("蓝灰", 200, 290, 60)
$GGray = GUICtrlCreateRadio("绿灰", 280, 290, 60)
$RGray = GUICtrlCreateRadio("红灰", 360, 290, 60)
$AGray = GUICtrlCreateRadio("全灰", 440, 290, 60)
$MaxGray = GUICtrlCreateRadio("最大", 520, 290, 60)
$MinGray = GUICtrlCreateRadio("最小", 600, 290, 60)
$NGray = GUICtrlCreateRadio("原色", 680, 290, 60)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUISetState(@SW_SHOW)
;~ _INetGetSource(GUICtrlRead($InputYzmUrl), False)
showBitmap()
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        GUIDelete()
                        quit()
                Case $Pic, $Pic2
                        showBitmap()
                Case $quse, $BGray, $GGray, $RGray, $AGray, $MaxGray, $MinGray, $NGray, $MF, $InvertsColors, $qudian
                        $hScaleBitmap = ScaleImage()
                        SetPicBitmap($hPic2, $hScaleBitmap)
                Case $study
                        learn()
                Case $make
                        shibie()
        EndSwitch
WEnd
 
Func quit()
        Exit
EndFunc   ;==>quit
 
Func showBitmap()
        GetYzm()
        SetPicBitmap($hPic, $oldBitMap)
        $hScaleBitmap = ScaleImage()
        SetPicBitmap($hPic2, $hScaleBitmap)
EndFunc   ;==>showBitmap
 
Func learn()
        If BitAND(GUICtrlRead($quse), $GUI_UNCHECKED) Then
                MsgBox(0, "警告", "请先选择一个灰度方法，再进行二色化。然后才能学习特征码！", -1, $hGui)
                Return
        EndIf
        $a_Image = myArrayClearBG($DoneArray)
        For $i = 1 To GUICtrlRead($input6)
                $a = connectedComt($a_Image)
                $a_Image = myArrayXORarray($a_Image, $a)
                $a_Image = myArrayClearBG($a_Image)
                $a = myArrayClearBG($a)
                $s_code_string = myArrarOCR($s_FontFile, $a, 0)
                If $s_code_string = False Then ExitLoop
        Next
EndFunc   ;==>learn
 
Func shibie()
        If BitAND(GUICtrlRead($quse), $GUI_UNCHECKED) Then
                MsgBox(0, "警告", "请先选择一个灰度方法，再进行二色化。然后才能进行识别！", -1, $hGui)
                Return
        EndIf
        $begin = TimerInit()
        $a_Image = myArrayClearBG($DoneArray)
        $s_code = ""
        For $i = 1 To GUICtrlRead($input6)
                $a = connectedComt($a_Image)
                $a_Image = myArrayXORarray($a_Image, $a)
                $a_Image = myArrayClearBG($a_Image)
                $a = myArrayClearBG($a)
                $s_code_string = myArrarOCR($s_FontFile, $a, 1)
                $s_code &= $s_code_string
        Next
        MsgBox(4096, TimerDiff($begin), "识别结果:" & $s_code)
EndFunc   ;==>shibie
 
Func SetPicBitmap($hPic, $hBitMap)
        Local $oldObj = _SendMessage($hPic, 0x0172, 0, $hBitMap)
        _WinAPI_DeleteObject($oldObj)
        Local $hObj = _SendMessage($hPic, 0x0173)
        If $hObj <> $hBitMap Then
                _WinAPI_DeleteObject($hBitMap)
        EndIf
        Return 1
EndFunc   ;==>SetPicBitmap
 
Func GetYzm()
        Local $bImage = _INetGetSource(GUICtrlRead($InputYzmUrl), False)
        Local $bData = Binary($bImage)
        Local $Lenght = BinaryLen($bData)
        Local $hData = _MemGlobalAlloc($Lenght, 0x0002)
        Local $pData = _MemGlobalLock($hData)
        Local $tData = DllStructCreate('byte[' & $Lenght & ']', $pData)
        DllStructSetData($tData, 1, $bData)
        _MemGlobalUnlock($hData)
        Local $pStream = _WinAPI_CreateStreamOnHGlobal($hData)
        _GDIPlus_Startup()
        Local $hImage = _GDIPlus_BitmapCreateFromStream($pStream)
        $YzmArray = YzmToArray($hImage)
        $oldBitMap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
        _GDIPlus_ImageDispose($hImage)
        _MemGlobalFree($hData)
        _GDIPlus_Shutdown()
        DllCall('psapi.dll', 'int', 'EmptyWorkingSet', 'hWnd', -1)
        Return 1
EndFunc   ;==>GetYzm
 
Func YzmToArray($hImage, $func_bg = 0xffffff)
        Local $BitmapData, $iwidth, $iheight, $Scan0, $pixelData, $s_BMPData, $i_Stride
        $iwidth = _GDIPlus_ImageGetWidth($hImage)
        $iheight = _GDIPlus_ImageGetHeight($hImage)
        $BitmapData = _GDIPlus_BitmapLockBits($hImage, 0, 0, $iwidth, $iheight, $GDIP_ILMREAD, $GDIP_PXF24RGB)
        $i_Stride = DllStructGetData($BitmapData, "Stride");Stride - Offset, in bytes, between consecutive scan lines of the bitmap. If the stride is positive, the bitmap is top-down. If the stride is negative, the bitmap is bottom-up.
        $Scan0 = DllStructGetData($BitmapData, "Scan0");Scan0 - Pointer to the first (index 0) scan line of the bitmap.
        $pixelData = DllStructCreate("ubyte lData[" & (Abs($i_Stride) * $iheight) & "]", $Scan0)
        ;不要使用官方论坛上提供的Abs($i_Stride) * $iheight-1,否则无法正确处理gif冗余等情形
        $s_BMPData = DllStructGetData($pixelData, "lData")
        $s_BMPData = StringTrimLeft($s_BMPData, 2);去掉头部"0x"
        DllCall('psapi.dll', 'int', 'EmptyWorkingSet', 'hWnd', -1)
        ;处理图片数组
        Local $a_return[$iwidth][$iheight], $x, $y, $s
        For $y = 0 To $iheight - 1
                $s = StringMid($s_BMPData, $y * ($i_Stride * 2) + 1, $iwidth * 6)
                For $x = 0 To $iwidth - 1
                        $a_return[$x][$y] = Number("0x" & StringMid($s, $x * 6 + 1, 6))
                Next
        Next
        Local $xScale = Int(510 / $iwidth)
        Local $yScale = Int(180 / $iheight)
        $Scale = $xScale
        If $xScale > $yScale Then $Scale = $yScale
        GUICtrlSetPos($Pic2, 20, 20, $iwidth * $Scale + $Coordinate * 2, $iheight * $Scale + $Coordinate * 2)
        GUICtrlSetPos($Pic, 20, 290, $iwidth, $iheight)
        Return $a_return
EndFunc   ;==>YzmToArray
 
Func ArrayTo2Color($aArray, $threshold = 0x888888)
        Local $iwidth = UBound($aArray), $iheight = UBound($aArray, 2)
        Local $a_return[$iwidth][$iheight]
        For $y = 0 To $iheight - 1
                For $x = 0 To $iwidth - 1
                        If $aArray[$x][$y] < $threshold Then
                                $a_return[$x][$y] = 0x000000
                        Else
                                $a_return[$x][$y] = 0xFFFFFF
                        EndIf
                Next
        Next
        Return $a_return
EndFunc   ;==>ArrayTo2Color
 
Func InvertsColors($aArray)
        Local $iwidth = UBound($aArray), $iheight = UBound($aArray, 2)
        Local $a_return[$iwidth][$iheight]
        For $y = 0 To $iheight - 1
                For $x = 0 To $iwidth - 1
                        If $aArray[$x][$y] = 0x000000 Then
                                $a_return[$x][$y] = 0xFFFFFF
                        Else
                                $a_return[$x][$y] = 0x000000
                        EndIf
                Next
        Next
        Return $a_return
EndFunc   ;==>InvertsColors
 
Func Medianfilter($aArray)
        Local $iwidth = UBound($aArray), $iheight = UBound($aArray, 2)
        Local $a_return[$iwidth][$iheight]
        Local $window[9], $min, $temp, $k
        For $y = 1 To $iheight - 2
                For $x = 1 To $iwidth - 2
                        $k = 0
                        For $i = $x - 1 To $x + 1
                                For $j = $y - 1 To $y + 1
                                        $window[$k] = $aArray[$i][$j]
                                        $k += 1
                                Next
                        Next
                        For $m = 0 To 4
                                $min = $m
                                For $n = $m + 1 To 8
                                        If $window[$n] < $window[$min] Then
                                                $min = $n
                                                $temp = $window[$m]
                                                $window[$m] = $window[$min]
                                                $window[$min] = $temp
                                        EndIf
                                Next
                        Next
                        $a_return[$x][$y] = $window[4]
                Next
        Next
        For $x = 0 To $iwidth - 1
                $a_return[$x][0] = $aArray[$x][0]
                $a_return[$x][$iheight - 1] = $aArray[$x][$iheight - 1]
        Next
        For $y = 0 To $iheight - 1
                $a_return[0][$y] = $aArray[0][$y]
                $a_return[$iwidth - 1][$y] = $aArray[$iwidth - 1][$y]
        Next
        Return $a_return
EndFunc   ;==>Medianfilter
 
Func Graycolor($aArray, $color = "all")
        Local $iwidth = UBound($aArray), $iheight = UBound($aArray, 2)
        Local $a_return[$iwidth][$iheight], $b, $g, $r, $ret
        $func_bg = $aArray[1][1]
        For $y = 0 To $iheight - 1
                For $x = 0 To $iwidth - 1
                        Switch $color
                                Case "blue"
                                        $b = BitAND(0xFF, BitShift($aArray[$x][$y], 16))
                                        $a_return[$x][$y] = BitOR(BitShift($b, -16), BitShift($b, -8), $b)
                                Case "green"
                                        $g = BitAND(0xFF, BitShift($aArray[$x][$y], 8))
                                        $a_return[$x][$y] = BitOR(BitShift($g, -16), BitShift($g, -8), $g)
                                Case "red"
                                        $r = BitAND(0xFF, $aArray[$x][$y])
                                        $a_return[$x][$y] = BitOR(BitShift($r, -16), BitShift($r, -8), $r)
                                Case "all"
                                        $b = BitAND(0xFF, BitShift($aArray[$x][$y], 16))
                                        $g = BitAND(0xFF, BitShift($aArray[$x][$y], 8))
                                        $r = BitAND(0xFF, $aArray[$x][$y])
                                        $ret = Int((30 * $r + $g * 59 + $b * 11) / 100)
                                        $b = BitAND(0xFF0000, BitShift($ret, -16))
                                        $g = BitAND(0x00FF00, BitShift($ret, -8))
                                        $r = $ret
                                        $a_return[$x][$y] = BitOR($b, $g, $r)
                                Case "max"
                                        $b = BitAND(0xFF, BitShift($aArray[$x][$y], 16))
                                        $g = BitAND(0xFF, BitShift($aArray[$x][$y], 8))
                                        $r = BitAND(0xFF, $aArray[$x][$y])
                                        $ret = $b
                                        If $g > $ret Then $ret = $g
                                        If $r > $ret Then $ret = $r
                                        $b = BitAND(0xFF0000, BitShift($ret, -16))
                                        $g = BitAND(0x00FF00, BitShift($ret, -8))
                                        $r = $ret
                                        $a_return[$x][$y] = BitOR($b, $g, $r)
                                Case "min"
                                        $b = BitAND(0xFF, BitShift($aArray[$x][$y], 16))
                                        $g = BitAND(0xFF, BitShift($aArray[$x][$y], 8))
                                        $r = BitAND(0xFF, $aArray[$x][$y])
                                        $ret = $b
                                        If $g < $ret Then $ret = $g
                                        If $r < $ret Then $ret = $r
                                        $b = BitAND(0xFF0000, BitShift($ret, -16))
                                        $g = BitAND(0x00FF00, BitShift($ret, -8))
                                        $r = $ret
                                        $a_return[$x][$y] = BitOR($b, $g, $r)
                        EndSwitch
                Next
        Next
        Return $a_return
EndFunc   ;==>Graycolor
 
Func pingjunColor($aArray)
        Local $iwidth = UBound($aArray), $iheight = UBound($aArray, 2)
        Local $sret
        For $y = 0 To $iheight - 1
                For $x = 0 To $iwidth - 1
                        $sret += Hex($aArray[$x][$y], 6)
                Next
        Next
        Return $sret = Int($sret / $iwidth / $iheight)
EndFunc   ;==>pingjunColor
 
Func DrawCoordinate($hMemDC, $iwidth, $iheight)
        For $i = 0 To $iwidth
                If Mod($i, 5) = 0 Then
                        _WinAPI_DrawLine($hMemDC, $Coordinate + $i * $Scale - 1, 10, $Coordinate + $i * $Scale - 1, $Coordinate - 1)
                Else
                        _WinAPI_DrawLine($hMemDC, $Coordinate + $i * $Scale - 1, 15, $Coordinate + $i * $Scale - 1, $Coordinate - 1)
                EndIf
                If Mod($i, 10) = 0 Then
                        _WinAPI_TextOut($hMemDC, $i * $Scale + 10, 0, $i)
                EndIf
        Next
        For $i = 0 To $iheight
                If Mod($i, 5) = 0 Then
                        _WinAPI_DrawLine($hMemDC, 10, $Coordinate + $i * $Scale - 1, $Coordinate - 1, $Coordinate + $i * $Scale - 1)
                Else
                        _WinAPI_DrawLine($hMemDC, 15, $Coordinate + $i * $Scale - 1, $Coordinate - 1, $Coordinate + $i * $Scale - 1)
                EndIf
                If Mod($i, 10) = 0 And $i <> 0 Then
                        _WinAPI_TextOut($hMemDC, 0, $i * $Scale + 10, $i)
                EndIf
        Next
EndFunc   ;==>DrawCoordinate
 
Func ScaleImage()
        $DoneArray = $YzmArray
        If BitAND(GUICtrlRead($BGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "blue")
        If BitAND(GUICtrlRead($GGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "green")
        If BitAND(GUICtrlRead($RGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "red")
        If BitAND(GUICtrlRead($AGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "all")
        If BitAND(GUICtrlRead($MaxGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "max")
        If BitAND(GUICtrlRead($MinGray), $GUI_CHECKED) Then $DoneArray = Graycolor($DoneArray, "min")
        
        If BitAND(GUICtrlRead($MF), $GUI_CHECKED) Then $DoneArray = Medianfilter($DoneArray)
        If BitAND(GUICtrlRead($quse), $GUI_CHECKED) Then $DoneArray = ArrayTo2Color($DoneArray)
        If BitAND(GUICtrlRead($InvertsColors), $GUI_CHECKED) Then $DoneArray = InvertsColors($DoneArray)
        If BitAND(GUICtrlRead($qudian), $GUI_CHECKED) Then $DoneArray = myArrayNoDrop($DoneArray, 3)
        Local $iwidth = UBound($DoneArray), $iheight = UBound($DoneArray, 2)
        Local $tRECT, $pRECT
        Local $hBrush
        Local $hDC = _WinAPI_GetDC(0)
        Local $hMemDC = _WinAPI_CreateCompatibleDC($hDC);建立兼容DC,即内存中的DC
        Local $hBitMap = _WinAPI_CreateCompatibleBitmapEx($hDC, $iwidth * $Scale + $Coordinate * 2, $iheight * $Scale + $Coordinate * 2, 0xEEEEEE);创建hBitmap
        Local $hSv = _WinAPI_SelectObject($hMemDC, $hBitMap);调入DC作图对象，即把图形画在$hBitmap上
        _WinAPI_SetBkMode($hMemDC, $TRANSPARENT)
        DrawCoordinate($hMemDC, $iwidth, $iheight)
        For $i = 0 To $iwidth - 1
                For $j = 0 To $iheight - 1
                        $tRECT = _WinAPI_CreateRect($i * $Scale + $Coordinate, $j * $Scale + $Coordinate, _
                                        ($i + 1) * $Scale + $Coordinate - 1, ($j + 1) * $Scale + $Coordinate - 1)
                        $pRECT = DllStructGetPtr($tRECT)
                        $hBrush = _WinAPI_CreateBrushIndirect($BS_SOLID, _WinAPI_SwitchColor($DoneArray[$i][$j]), $HS_DIAGCROSS)
                        _WinAPI_FillRect($hMemDC, $pRECT, $hBrush)
                        _WinAPI_DeleteObject($hBrush)
                Next
        Next
        _WinAPI_SelectObject($hMemDC, $hSv)
        _WinAPI_DeleteDC($hMemDC)
        _WinAPI_ReleaseDC(0, $hDC)
        Return $hBitMap
EndFunc   ;==>ScaleImage
 
;提取连通分量
Func connectedComt($aArray)
        Local $x = UBound($aArray), $y = UBound($aArray, 2)
        Local $ConectArray[$x][$y]
        $ConectArray = myArrayInit($ConectArray)
        For $i = 0 To $x - 1
                For $j = 0 To $y - 1
                        If $aArray[$i][$j] = 0x000000 Then
                                connectCheck($ConectArray, $aArray, $i, $j)
                                ExitLoop (2)
                        EndIf
                        
                Next
        Next
        Return $ConectArray
EndFunc   ;==>connectedComt
 
Func connectCheck(ByRef $ConectArray, $aArray, $i, $j)
        Local $x = UBound($aArray), $y = UBound($aArray, 2)
        $ConectArray[$i][$j] = 0x000000
        If $i + 1 <= $x - 1 Then
                If $aArray[$i + 1][$j] = 0x000000 And $ConectArray[$i + 1][$j] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i + 1, $j)
        EndIf
        If $i - 1 >= 0 Then
                If $aArray[$i - 1][$j] = 0x000000 And $ConectArray[$i - 1][$j] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i - 1, $j)
        EndIf
        If $j + 1 <= $y - 1 Then
                If $aArray[$i][$j + 1] = 0x000000 And $ConectArray[$i][$j + 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i, $j + 1)
        EndIf
        If $j - 1 >= 0 Then
                If $aArray[$i][$j - 1] = 0x000000 And $ConectArray[$i][$j - 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i, $j - 1)
        EndIf
        If ($i + 1 <= $x - 1) And ($j + 1 <= $y - 1) Then
                If $aArray[$i + 1][$j + 1] = 0x000000 And $ConectArray[$i + 1][$j + 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i + 1, $j + 1)
        EndIf
        If ($i + 1 < $x - 1) And ($j - 1 >= 0) Then
                If $aArray[$i + 1][$j - 1] = 0x000000 And $ConectArray[$i + 1][$j - 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i + 1, $j - 1)
        EndIf
        If ($i - 1 >= 0) And ($j + 1 <= $y - 1) Then
                If $aArray[$i - 1][$j + 1] = 0x000000 And $ConectArray[$i - 1][$j + 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i - 1, $j + 1)
        EndIf
        If ($i - 1 >= 0) And ($j - 1 >= 0) Then
                If $aArray[$i - 1][$j - 1] = 0x000000 And $ConectArray[$i - 1][$j - 1] = 0xFFFFFF Then connectCheck($ConectArray, $aArray, $i - 1, $j - 1)
        EndIf
        Return True
EndFunc   ;==>connectCheck
 
;下面的函数来自阿福，稍做修改
Func myArrayToString($func_array, $show = False)
        Local $y, $x, $s = ""
        For $y = 0 To UBound($func_array, 2) - 1
                For $x = 0 To UBound($func_array, 1) - 1
                        $s &= Hex($func_array[$x][$y], 6)
                Next
                If $show Then $s &= @CRLF
        Next
        If $show Then
                $s = StringReplace($s, "FFFFFF", ChrW(0x3000))
                $s = StringReplace($s, "000000", ChrW(0x2588))
        Else
                $s = StringReplace($s, "000000", "1")
                $s = StringReplace($s, "FFFFFF", "0")
        EndIf
        Return $s
EndFunc   ;==>myArrayToString
 
Func myArrayXORarray($func_array, $func_array2, $func_bg = 0xFFFFFF, $func_type = True);用数组1加减数组2,得到一个新数组,数组2<=数组1
        If Not IsArray($func_array) Then Return 0
        If Not IsArray($func_array2) Then Return 0
        If UBound($func_array, 1) < UBound($func_array2, 1) Then Return 0
        If UBound($func_array, 2) < UBound($func_array2, 2) Then Return 0
        Local $x, $y
        For $x = 0 To UBound($func_array2, 1) - 1
                For $y = 0 To UBound($func_array2, 2) - 1
                        If $func_array2[$x][$y] <> $func_bg Then
                                If $func_type Then
                                        $func_array[$x][$y] = $func_bg;
                                Else
                                        $func_array[$x][$y] = $func_array2[$x][$y] ;BitXOR( $func_array2[$x][$y], $func_bg)
                                EndIf
                        EndIf
                Next
        Next
        Return $func_array
EndFunc   ;==>myArrayXORarray
 
Func myArrayNoDrop($func_array, $func_drop = 1, $func_bg = 0xFFFFFF);去干扰
        If Not IsArray($func_array) Then Return 0
        Local $x, $y, $i, $startx, $endx, $starty, $endy, $a, $b
        For $y = 0 To UBound($func_array, 2) - 1
                For $x = 0 To UBound($func_array, 1) - 1
                        If $func_array[$x][$y] = $func_bg Then ContinueLoop;底色,不处理
                        $startx = $x - 1
                        If $startx < 0 Then $startx = 0
                        $endx = $x + 1
                        If $endx > UBound($func_array, 1) - 1 Then $endx = UBound($func_array, 1) - 1
                        $starty = $y - 1
                        If $starty < 0 Then $starty = 0
                        $endy = $y + 1
                        If $endy > UBound($func_array, 2) - 1 Then $endy = UBound($func_array, 2) - 1
                        $i = 0
                        For $a = $startx To $endx
                                For $b = $starty To $endy
                                        If $func_array[$a][$b] <> $func_bg Then $i += 1;该点非底色
                                Next
                        Next
                        If $i > 0 And $i <= $func_drop Then;
                                $func_array[$x][$y] = $func_bg
                        EndIf
                Next
        Next
        Return $func_array
EndFunc   ;==>myArrayNoDrop
 
Func myArrayDelBox($func_array, $func_left = 0, $func_right = 0, $func_top = 0, $func_bottom = 0)
        If Not IsArray($func_array) Then Return $func_array;
        Local $a_msg[8]
        $a_msg[0] = 2;二维
        $a_msg[1] = UBound($func_array, 1)
        $a_msg[2] = UBound($func_array, 2)
        $a_msg[3] = $func_left
        $a_msg[4] = $func_right
        $a_msg[5] = $func_top
        $a_msg[6] = $func_bottom
        If $a_msg[1] <= $a_msg[3] + $a_msg[4] Or $a_msg[2] <= $a_msg[5] + $a_msg[6] Then Return $func_array;超界
        Local $a_return[$a_msg[1] - $a_msg[3] - $a_msg[4]][$a_msg[2] - $a_msg[5] - $a_msg[6]]
        Local $x, $y
        For $y = $a_msg[5] To $a_msg[2] - $a_msg[6] - 1
                For $x = $a_msg[3] To $a_msg[1] - $a_msg[4] - 1
                        $a_return[$x - $a_msg[3]][$y - $a_msg[5]] = $func_array[$x][$y]
                Next
        Next
        Return $a_return
EndFunc   ;==>myArrayDelBox
 
Func myArrayClearBG($func_array, $func_left = True, $func_right = True, $func_top = True, $func_bottom = True, $func_bg = 0xFFFFFF)
        Local $a_msg = myGetArrayMessage($func_array, $func_bg)
        If Not IsArray($a_msg) Or $a_msg[7] = 1 Then Return $func_array;$func_array不用判断是否数组了,因为myGetArrayMessage函数返回的值已经说明问题了
        If Not $func_left Then $a_msg[3] = 0
        If Not $func_right Then $a_msg[4] = 0
        If Not $func_top Then $a_msg[5] = 0
        If Not $func_bottom Then $a_msg[6] = 0
        If $a_msg[0] = 2 Then
                Local $a_return[$a_msg[1] - $a_msg[3] - $a_msg[4]][$a_msg[2] - $a_msg[5] - $a_msg[6]]
        Else
                Local $a_return[$a_msg[2] - $a_msg[5] - $a_msg[6]]
        EndIf
        Local $x, $y
        For $y = $a_msg[5] To $a_msg[2] - $a_msg[6] - 1
                If $a_msg[0] = 2 Then
                        For $x = $a_msg[3] To $a_msg[1] - $a_msg[4] - 1
                                $a_return[$x - $a_msg[3]][$y - $a_msg[5]] = $func_array[$x][$y]
                        Next
                Else
                        $a_return[$y - $a_msg[5]] = StringMid($func_array[$y], 6 * $a_msg[3] + 1, 6 * ($a_msg[1] - $a_msg[3] - $a_msg[4]))
                EndIf
        Next
        Return $a_return
EndFunc   ;==>myArrayClearBG
 
Func myGetArrayMessage($func_array, $func_bg = 0xFFFFFF);获取数组周边全为底色的信息,错误时返回非数组
        If UBound($func_array) = 0 Then Return $func_array
        Local $time = TimerInit()
        Local $a_return[11]
        If UBound($func_array, 2) = 0 Then
                Local $i_height = UBound($func_array)
                Local $i_width = StringLen($func_array[0]) / 6
                $a_return[0] = 1;一维
        Else
                Local $i_height = UBound($func_array, 2)
                Local $i_width = UBound($func_array, 1)
                $a_return[0] = 2;二维
        EndIf
        Local $x, $y, $s, $s1, $i_top = 0, $i_bottom = $i_height, $i_left = -1, $i_right = $i_width, $i_tmp, $s_all = ""
        $func_bg = Hex($func_bg, 6)
        For $y = 0 To $i_height - 1
                If $a_return[0] = 1 Then
                        $s = $func_array[$y]
                Else
                        $s = ""
                        For $x = 0 To $i_width - 1
                                $s &= Hex($func_array[$x][$y], 6)
                        Next
                EndIf
                $s_all &= $s
                ;左空几个位置
                If $i_left <> 0 Then;=0说明有一行左边第一个不为空,所以不用再找了
                        $s1 = StringRegExpReplace($s, "^(" & $func_bg & "){1,}", "")
                        If $i_left = -1 Or $i_left > (StringLen($s) - StringLen($s1)) / 6 Then $i_left = (StringLen($s) - StringLen($s1)) / 6
                EndIf
                ;ConsoleWrite($s&','&$i_left&@crlf)
                ;右空几个位置,经测试,用正则来做时,大文件极慢,所以不用正则
                $i_tmp = 0
                Do
                        $i_tmp += 1
                        $s1 = StringRight($s, 6 * $i_tmp)
                Until StringLeft($s1, 6) <> $func_bg Or $i_tmp > $i_right
                If $i_right > $i_tmp - 1 Then $i_right = $i_tmp - 1
                
                $s = StringReplace($s, $func_bg, "")
                If $s = "" Then
                        If $i_bottom = $i_height Then $i_bottom = $y;下面第几行开始空
                        If $i_top = $y Then $i_top += 1;上面有几行空
                Else
                        $i_bottom = $i_height
                EndIf
        Next
        $i_bottom = $i_height - $i_bottom;变化为结果,下空几行
        $a_return[1] = $i_width;宽
        $a_return[2] = $i_height;高
        $a_return[3] = $i_left;左空几个
        $a_return[4] = $i_right;右空几个
        $a_return[5] = $i_top;上空几个
        $a_return[6] = $i_bottom;下空几个
        $a_return[7] = 0;0不超界
        If $i_width <= $i_left Or $i_height <= $i_top Then $a_return[7] = 1;1超界
        $a_return[8] = 0;彩色
        If StringReplace(StringReplace($s_all, "FFFFFF", ""), "000000", "") = "" Then $a_return[8] = 1;1黑白
        $a_return[9] = $s_all;点阵串
        $a_return[10] = TimerDiff($time);运行时间多少毫秒
        ;ConsoleWrite($i_width&','&$i_height&','&$i_left&','&$i_right&','&$i_top&','&$i_bottom&@CRLF)
        Return $a_return
EndFunc   ;==>myGetArrayMessage
 
Func OcrCompStr($string1, $string2);返回多少个不同
        If $string1 = $string2 Then Return 0
        Local $i_return = 0, $i
        For $i = 1 To StringLen($string1)
                If StringMid($string1, $i, 1) <> StringMid($string2, $i, 1) Then $i_return += 1
        Next
        Return $i_return
EndFunc   ;==>OcrCompStr
 
Func myArrarOCR($s_code_file, $func_array, $Ocr)
        If $s_code_file = "" Or Not IsArray($func_array) Then Return ""
        Local $a_Code, $i, $s_code, $s
        Local $s_file = FileRead($s_code_file);只能用于英文验证码处理,中文处理FileRead函数对Pwin有BUG要修正
        If $Ocr Then
                Local $a_file = StringRegExp($s_file, "(.*)(?:\r\n)", 3)
                If Not IsArray($a_file) Then Return "";没有识别库
                Local $j, $i_code, $i_code_temp, $s_code_string = ""
        EndIf
        Local $a_msg[3]
        If UBound($func_array, 2) > 0 Then
                $a_msg[0] = 2;二维
                $a_msg[1] = UBound($func_array, 1)
                $a_msg[2] = UBound($func_array, 2)
        Else
                $a_msg[0] = 1;一维
                $a_msg[1] = StringLen($func_array[0]) / 6
                $a_msg[2] = UBound($func_array)
        EndIf
        Local $i_Ext
        $s = myArrayToString($func_array, False)
        StringReplace($s, "1", " ")
        $i_Ext = @extended ;为1个数,即点的数量
        If $Ocr Then;识别
                $i_code = $a_msg[1] * $a_msg[2]
                For $j = 0 To UBound($a_file) - 1
                        If Abs($i_Ext - Number(StringTrimLeft($a_file[$j], 2))) > 5 Then ContinueLoop;误差n(如50,此值待确定)个点以上的当做不对
                        $i_code_temp = OcrCompStr($s, StringTrimLeft($a_file[$j], StringInStr($a_file[$j], "|")))
                        If $i_code_temp < $i_code Then
                                $i_code = $i_code_temp
                                $s_code = StringLeft($a_file[$j], 1)
                                If $i_code <= 0 Then ExitLoop
                        EndIf
                Next
                $s_code_string &= $s_code
        Else;学习
                $s_code = ""
                Do
                        $s_code = InputBox("验证码学习", "请输入你所看到的验证码" & @CRLF & myArrayToString($func_array, True), "", "", 300, 300, @DesktopWidth / 2 - 150, @DesktopHeight / 2 - 150, -1, $hGui)
                        If @error = 1 Then Return False
                Until StringLen($s_code) = 1
                $s = myArrayToString($func_array, False)
                StringReplace(StringTrimLeft($s, StringInStr($s, "|")), "1", " ")
                $s = $s_code & "," & @extended & "|" & $s
                If StringInStr($s_file, $s) = 0 Then;未写过
                        FileWriteLine($s_code_file, $s)
                        $s_file &= $s & @CRLF
                EndIf
        EndIf
 
        If $Ocr Then
                Return $s_code_string
        Else
                Return 1
        EndIf
EndFunc   ;==>myArrarOCR
 
Func myArrayInit($func_array, $func_bg = 0xFFFFFF);将数组初始化为底色
        If Not IsArray($func_array) Then Return 0
        Local $x, $y
        For $y = 0 To UBound($func_array, 2) - 1
                For $x = 0 To UBound($func_array, 1) - 1
                        $func_array[$x][$y] = $func_bg;初始化为底色
                Next
        Next;数组初始化
        Return $func_array
EndFunc   ;==>myArrayInit