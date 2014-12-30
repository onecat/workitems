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

#include <MsgBoxConstants.au3>
#include <IE.au3> 
#include <INet.au3>
#include <GDIPlus.au3>
#include <Array.au3>
#include <Memory.au3>
#include <Clipboard.au3>
#include <Date.au3>
#include <String.au3>

HotKeySet("{ESC}", "HotKeyPressed")
Local $username = "51031318"
Local $passwd = "100"
Local $a_dateinfo = _getdateinfo()     ;获取检查日期，编号

;;_ArrayDisplay($a_dateinfo,"$a_dateinfo")
_IEErrorNotify (False)

$oIE = _IECreate("http://182.139.135.21:85/FrameSet/Login.aspx") ;返回指向 InternetExplorer.Application 对象的对象变量
If @error = 6 Then Send("{F5}")

$oForm = _IEFormGetObjByName($oIE, "form1");匹配表单的名称 ;返回IE指向的表单对象, @EXTENDED = 表单计数
$ouser = _IEFormElementGetObjByName($oForm, "txtUserName");匹配的表单元素的名称  从form1表单里找一个名字叫txtUserName的单元
$opasswd = _IEFormElementGetObjByName($oForm, "txtPwd");从上面的form表单里找一个名字叫txtPwd的单元
_IEFormElementSetValue($ouser, $username);设置值
_IEFormElementSetValue($opasswd, $passwd);设置值
$oSubmit = _IEFormElementGetObjByName($oForm, "ImageButton1");从上面的form表单里找一个名字叫ImageButton1的单元
_IEAction($oSubmit, "click");    模拟点击指定的元素. 叫做click的action元素

;======================================验证图片识别
$left = 3
$top = 4
$zhong = 1
$ziWidth = 7
$ziHeight = 11
$zishu = 4
Global $n[10][$ziHeight] = [["0011100", "0100010", "0100010", "0100001", "1100001", "1000001", "1100001", "0100001", "0100010", "0100010", "0011100"], _
                ["0001000", "0011000", "0001000", "0001000", "0001000", "0001000", "0001000", "0001000", "0001000", "0001000", "0011110"], _
                ["0011100", "0100110", "0000010", "0000010", "0000010", "0000000", "0000100", "0001000", "0010000", "0100001", "1111110"], _
                ["0011100", "0100110", "0000010", "0000000", "0000000", "0011110", "0000110", "0000010", "0000010", "0000000", "1111000"], _
                ["0000100", "0000100", "0001100", "0010100", "0000100", "0100100", "0000100", "1111111", "0000100", "0000100", "0000100"], _
                ["0001110", "0010000", "0000000", "0111000", "0001100", "0000010", "0000010", "0000010", "0000010", "0000000", "0111000"], _
                ["0000111", "0001100", "0010000", "0110000", "0101110", "1100011", "1100011", "1000001", "0100001", "0110010", "0011100"], _
                ["0111111", "0000000", "0000010", "0000010", "0000000", "0000100", "0000100", "0000000", "0001000", "0001000", "0000000"], _
                ["0011100", "0100010", "0100010", "0100010", "0010000", "0011100", "0010110", "0100010", "0100001", "0100010", "0011100"], _
                ["", "", "", "", "", "", "", "", "", "", ""]]


$Ele = _IEGetObjById($oIE, "txtValidateCode") ;匹配对像的ID.返回对象变量指向的特定对象

;这里该加上判断，如果验证码失败，重新点击图片获取
;如果是浏览器IE8，启用IE允许对剪贴版进行编程使用
_IEFormElementSetValue($Ele, myYzmShibie("vcodeImg")) ;设置验证码
Send("{ENTER}") ;发送回车。登陆进入网页
Sleep(3000)



$oIEdk = _IEAttach("http://182.139.135.21:85/FrameSet/frame_HJH.aspx", "url") ;匹配IE指定的对像
;成功返回所有指向 IE 对象的对象变量
;失败: @error 设置 为非 0 值.
;@error 5 ($_IEStatus_InvalidValue) - 无效值
;7 ($_IEStatus_NoMatch) - 没有匹配

$oIEjr = _IEFrameGetObjByName($oIEdk, "topFrame") ;匹配的框架的名称，返回框架内对象变量指向的窗口对象

;成功: 返回框架内对象变量指向的窗口对象, @EXTENDED = 框架计数
;失败: @error 设置 为非 0 值.
;@error: 3 ($_IEStatus_InvalidDataType) - 无效数据类型
;4 ($_IEStatus_InvalidObjectType) - 无效对象类型
;7 ($_IEStatus_NoMatch) - 没有匹配
;@Extended: 包含无效参数数量
_IELinkClickByText($oIEjr, " 消防工作记录  ") ;模拟鼠标点击匹配的网页链接文本
;MsgBox (0,"ts",@error)
If @error = 6 Then 
        Send("{F5}")
 _IELinkClickByText($oIEjr, " 消防工作记录  ")
EndIf
Sleep(1000) ;点击后等待1秒打开
_IELinkClickByText($oIEjr, "每日防火巡查 ") ;模拟鼠标点击匹配的网页链接文本
;MsgBox (0,"ts",@error)
If @error = 6 Then 
        Send("{F5}")
        _IELinkClickByText($oIEjr, "每日防火巡查 ")
EndIf
Sleep(1000) ;点击后等待1秒打开框架网页

$oIEmf = _IEFrameGetObjByName($oIEdk,"MainFrame")
$Eletd = _IETagNameGetCollection($oIEmf,"TD",14)
Local $sting=$Eletd.outerhtml
;MsgBox (0,"T",$sting)
Local $bhbegin=StringInStr ( $sting ,'"#">')
;MsgBox (0,"T",$bhbegin)
Local $webbh=StringMid ( $sting, $bhbegin+4, 5 )
;MsgBox (0,"T",$webbh)
Local $iIndex = _ArraySearch($a_dateinfo,$webbh)
TrayTip("提示", "已经录到数组的第"& $iIndex&"行", 1)
Sleep(1000)





$oIElr = _IEFrameGetObjByName($oIEdk, "MainFrame") ;匹配的框架的名称，返回框架内对象变量指向的窗口对象
$Elexz = _IEGetObjById($oIElr, "ctl00_MainContent_Button1") ;匹配对像的ID.返回对象变量指向的特定对象
_IEAction($Elexz, "click") ;点击
WinWaitActive("[class:titlepage_1]", "", 2) ;等待每日防火巡查记录表出现
; Local $cs=WinWaitActive("[class:titlepage_1]", "", 3)
;If $cs=0 Then
; _IEAction($Elexz, "click") ;点击新增
;EndIf

Local $XCCS = 4 ;设置巡查次数
Local $XCY = "张三,李四" ;设置巡查人
Local $JCR = "张三" ;设置检查人
Local $FXWT = "建筑消防设施设备完整好用" ;设置检查内容

Local $i = 1+$iIndex, $p = 257-$iIndex
While $i
        Local $EleRQ = _IEGetObjById($oIElr, "ctl00_MainContent_txtRQ")
        _IEFormElementSetValue($EleRQ, $a_dateinfo[$i][0])

        $EleBH = _IEGetObjById($oIElr, "ctl00_MainContent_txtBH")
        _IEFormElementSetValue($EleBH, $a_dateinfo[$i][2])

        $EleXCY = _IEGetObjById($oIElr, "ctl00_MainContent_txtXCY")
        _IEFormElementSetValue($EleXCY, $XCY)

        $EleXCCS = _IEGetObjById($oIElr, "ctl00_MainContent_txtXCCS")
        _IEFormElementSetValue($EleXCCS, $XCCS)

        $EleFXWT = _IEGetObjById($oIElr, "ctl00_MainContent_txtFXWT")
        _IEPropertySet($EleFXWT, "innertext", $FXWT)

        $EleJCR = _IEGetObjById($oIElr, "ctl00_MainContent_txtJCR")
        _IEFormElementSetValue($EleJCR, $JCR)

        $EleJCRQ = _IEGetObjById($oIElr, "ctl00_MainContent_txtJCRQ")
        _IEFormElementSetValue($EleJCRQ, $a_dateinfo[$i][1])

        $Eleadd = _IEGetObjById($oIElr, "ctl00_MainContent_btnAdd")
        _IEAction($Eleadd, "click") ;点击

        $i += 1
        $p -= 1
        WinWaitActive ( "[class:button]" , "来自网页的消息" , 1)
Send("{ENTER}") ;发送回车。确认
 TrayTip("次数", UBound($a_dateinfo)-$p-2&"次", 1)
 
Sleep(3000)
$oIElr = _IEFrameGetObjByName($oIEdk, "MainFrame") ;匹配的框架的名称，返回框架内对象变量指向的窗口对象
$Elexz = _IEGetObjById($oIElr, "ctl00_MainContent_Button1") ;匹配对像的ID.返回对象变量指向的特定对象
_IEAction($Elexz, "click") ;点击
WinWaitActive("[class:titlepage_1]", "", 2) ;等待每日防火巡查记录表出现
WEnd



;识别验证码程序

Func myYzmShibie($ImgId, $func_bg = 0x808080)
        Local $BitmapData, $i_width, $i_height, $Scan0, $pixelData, $s_BMPData, $i_Stride
        _GDIPlus_Startup() ;初始化 Microsoft Windows GDI+.
        ;获取图片
        $oImg = $oIE.Document.getElementById($ImgId)
        $oPic = $oIE.Document.body.createControlRange()
        $oPic.Add($oImg)
        $oPic.execCommand("Copy")
        _ClipBoard_Open(0)
        $ivpics = _ClipBoard_GetDataEx($CF_BITMAP)
        _ClipBoard_Close()
        $hImage = _GDIPlus_BitmapCreateFromHBITMAP($ivpics)
        ;把图片读入数组，来自阿福源码
        $i_width = _GDIPlus_ImageGetWidth($hImage)
        $i_height = _GDIPlus_ImageGetHeight($hImage)
        $BitmapData = _GDIPlus_BitmapLockBits($hImage, 0, 0, $i_width, $i_height, $GDIP_ILMREAD, $GDIP_PXF24RGB)
        $i_Stride = DllStructGetData($BitmapData, "Stride");Stride - Offset, in bytes, between consecutive scan lines of the bitmap. If the stride is positive, the bitmap is top-down. If the stride is negative, the bitmap is bottom-up.
        $Scan0 = DllStructGetData($BitmapData, "Scan0");Scan0 - Pointer to the first (index 0) scan line of the bitmap.
        $pixelData = DllStructCreate("ubyte lData[" & (Abs($i_Stride) * $i_height) & "]", $Scan0)
        ;不要使用官方论坛上提供的Abs($i_Stride) * $i_height-1,否则无法正确处理gif冗余等情形
        $s_BMPData = DllStructGetData($pixelData, "lData")
        $s_BMPData = StringTrimLeft($s_BMPData, 2);去掉头部"0x"
        _GDIPlus_ImageDispose($hImage)
        _GDIPlus_Shutdown()
        DllCall("psapi.dll", "int", "EmptyWorkingSet", "hWnd", -1)
        ;处理图片数组
        Local $a_return[$i_width][$i_height], $x, $y, $s
        Local $ls = "", $lls = ""
        For $y = $top To $top + $ziHeight - 1;５和４分别是图片上下的空边
                $s = StringMid($s_BMPData, $y * ($i_Stride * 2) + 1, $i_width * 6)
                For $x = $left To $left + $zishu * $ziWidth + ($zishu - 1) * $zhong - 1;６和９分别是图片左右的空边
                        $a_return[$x][$y] = Number("0x" & StringMid($s, $x * 6 + 1, 6))
                        $a_return[$x][$y] = Graycolor($a_return[$x][$y], "blue")
                        If $a_return[$x][$y] < $func_bg Then
                                $a_return[$x][$y] = 1
                        Else
                                $a_return[$x][$y] = 0
                        EndIf
                Next
        Next

        Local $Number = ""
        For $i = 0 To $zishu - 1;读取４个数字的值
                $sx = $left + $ziWidth * $i + $zhong * $i;6是第一个数字的起点，每个数字占9列，第９列是空白列
                For $y = $top To $top + $ziHeight - 1;５和４分别是图片上下的空边
                        $ls = ""
                        For $x = $sx To $sx + $ziWidth - 1;因为每个数字占9列，第９列是空白列，所以只读取８列

                                If $a_return[$x][$y] = 1 Then
                                        $ls &= "1"
                                Else
                                        $ls &= "0"
                                EndIf
                        Next
                        $ls &= "|"
                        $lls = $lls & $ls
                Next
                $Number &= WhatNumber($lls)
                $lls = ""
        Next
        Return $Number

EndFunc   ;==>myYzmShibie

Func WhatNumber($Sum)
        Local $checktotal, $aCheck = StringSplit($Sum, "|")
        For $i = 0 To 9 ;9是数字只有9个
                $checktotal = 0
                For $j = 0 To $ziHeight - 1
                        If $n[$i][$j] <> $aCheck[$j + 1] Then $checktotal += 1
                        If $checktotal > 1 Then ExitLoop
                Next
                If $checktotal < 2 Then Return $i
        Next
        Return -1
EndFunc   ;==>WhatNumber

Func Graycolor($color, $style = "all")
        Local $a_return, $b, $g, $r, $ret
        Switch $style
                Case "blue"
                        $b = BitAND(0xFF, BitShift($color, 16))
                        $a_return = BitOR(BitShift($b, -16), BitShift($b, -8), $b)
                Case "green"
                        $g = BitAND(0xFF, BitShift($color, 8))
                        $a_return = BitOR(BitShift($g, -16), BitShift($g, -8), $g)
                Case "red"
                        $r = BitAND(0xFF, $color)
                        $a_return = BitOR(BitShift($r, -16), BitShift($r, -8), $r)
                Case "all"
                        $b = BitAND(0xFF, BitShift($color, 16))
                        $g = BitAND(0xFF, BitShift($color, 8))
                        $r = BitAND(0xFF, $color)
                        $ret = Int((30 * $r + $g * 59 + $b * 11) / 100)
                        $b = BitAND(0xFF0000, BitShift($ret, -16))
                        $g = BitAND(0x00FF00, BitShift($ret, -8))
                        $r = $ret
                        $a_return = BitOR($b, $g, $r)
        EndSwitch
        Return $a_return
EndFunc   ;==>Graycolor

Func _getdateinfo()

Local $i=258,  $p=1
Local $a_dateinfo[$i][3]
        
        While $i
                
                Local $LrDate = _DateAdd('d', -$i, _NowCalcDate()) ;计算当前日期-258天得到的日期 YYYY/MM/DD
                Local $ArrayLrDate = _StringExplode($LrDate, "/", 0) ;拆分日期字符串，返回包含字符串拆分后的数组.

                ;Local $RQ = $a_dateinfo[0][0]&"年" &   $a_dateinfo[0][1] &"月" &  $a_dateinfo[0][2]&"日"     ;重新组合为YYYY年MM月DD日

                Local $JcDate = _DateAdd('d', -$i + 1, _NowCalcDate())
                Local $ArrayJcDate = _StringExplode($JcDate, "/", 0)

                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0201 Then
                        $ArrayJcDate[1] = "01"
                        $ArrayJcDate[2] = 31
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0301 Then
                        $ArrayJcDate[1] = "02"
                        $ArrayJcDate[2] = 28
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0401 Then
                        $ArrayJcDate[1] = "03"
                        $ArrayJcDate[2] = 31
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0501 Then
                        $ArrayJcDate[1] = "04"
                        $ArrayJcDate[2] = 30
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0601 Then
                        $ArrayJcDate[1] = "05"
                        $ArrayJcDate[2] = 31
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0701 Then
                        $ArrayJcDate[1] = "06"
                        $ArrayJcDate[2] = 30
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0801 Then
                        $ArrayJcDate[1] = "07"
                        $ArrayJcDate[2] = 31
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 0901 Then
                        $ArrayJcDate[1] = "08"
                        $ArrayJcDate[2] = 31
                EndIf
                If $ArrayJcDate[1] & $ArrayJcDate[2] = 1001 Then
                        $ArrayJcDate[1] = "09"
                        $ArrayJcDate[2] = 30
                EndIf
                ;        Local $JCRQ = $a_dateinfo[3] & "年" & $a_dateinfo[4] & "月" & $a_dateinfo[5] & "日"
                Local $bhV = 14269 - $i

                ReDim $a_dateinfo[$p + 1][3]
        $a_dateinfo[0][0] ="巡查日期"
        $a_dateinfo[0][1] ="检验日期"
        $a_dateinfo[0][2] ="自动编号"
                $a_dateinfo[$p][0] = $ArrayLrDate[0] & "年" & $ArrayLrDate[1] & "月" & $ArrayLrDate[2] & "日" ;重新组合为YYYY年MM月DD日
                $a_dateinfo[$p][1] = $ArrayJcDate[0] & "年" & $ArrayJcDate[1] & "月" & $ArrayJcDate[2] & "日"
                $a_dateinfo[$p][2] = $bhV
                
                $p += 1
                $i -= 1
        WEnd
        Return $a_dateinfo
EndFunc   ;==>_getdateinfo



Func HotKeyPressed()
        Switch @HotKeyPressed ; 最后按下的热键.
                Case "{ESC}" ; {ESC} 是"退出"热键.
                        Exit
        EndSwitch
EndFunc   ;==>HotKeyPressed