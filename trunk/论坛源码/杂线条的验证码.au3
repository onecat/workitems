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
Local $a_dateinfo = _getdateinfo()     ;��ȡ������ڣ����

;;_ArrayDisplay($a_dateinfo,"$a_dateinfo")
_IEErrorNotify (False)

$oIE = _IECreate("http://182.139.135.21:85/FrameSet/Login.aspx") ;����ָ�� InternetExplorer.Application ����Ķ������
If @error = 6 Then Send("{F5}")

$oForm = _IEFormGetObjByName($oIE, "form1");ƥ��������� ;����IEָ��ı�����, @EXTENDED = ������
$ouser = _IEFormElementGetObjByName($oForm, "txtUserName");ƥ��ı�Ԫ�ص�����  ��form1������һ�����ֽ�txtUserName�ĵ�Ԫ
$opasswd = _IEFormElementGetObjByName($oForm, "txtPwd");�������form������һ�����ֽ�txtPwd�ĵ�Ԫ
_IEFormElementSetValue($ouser, $username);����ֵ
_IEFormElementSetValue($opasswd, $passwd);����ֵ
$oSubmit = _IEFormElementGetObjByName($oForm, "ImageButton1");�������form������һ�����ֽ�ImageButton1�ĵ�Ԫ
_IEAction($oSubmit, "click");    ģ����ָ����Ԫ��. ����click��actionԪ��

;======================================��֤ͼƬʶ��
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


$Ele = _IEGetObjById($oIE, "txtValidateCode") ;ƥ������ID.���ض������ָ����ض�����

;����ü����жϣ������֤��ʧ�ܣ����µ��ͼƬ��ȡ
;����������IE8������IE����Լ�������б��ʹ��
_IEFormElementSetValue($Ele, myYzmShibie("vcodeImg")) ;������֤��
Send("{ENTER}") ;���ͻس�����½������ҳ
Sleep(3000)



$oIEdk = _IEAttach("http://182.139.135.21:85/FrameSet/frame_HJH.aspx", "url") ;ƥ��IEָ���Ķ���
;�ɹ���������ָ�� IE ����Ķ������
;ʧ��: @error ���� Ϊ�� 0 ֵ.
;@error 5 ($_IEStatus_InvalidValue) - ��Чֵ
;7 ($_IEStatus_NoMatch) - û��ƥ��

$oIEjr = _IEFrameGetObjByName($oIEdk, "topFrame") ;ƥ��Ŀ�ܵ����ƣ����ؿ���ڶ������ָ��Ĵ��ڶ���

;�ɹ�: ���ؿ���ڶ������ָ��Ĵ��ڶ���, @EXTENDED = ��ܼ���
;ʧ��: @error ���� Ϊ�� 0 ֵ.
;@error: 3 ($_IEStatus_InvalidDataType) - ��Ч��������
;4 ($_IEStatus_InvalidObjectType) - ��Ч��������
;7 ($_IEStatus_NoMatch) - û��ƥ��
;@Extended: ������Ч��������
_IELinkClickByText($oIEjr, " ����������¼  ") ;ģ�������ƥ�����ҳ�����ı�
;MsgBox (0,"ts",@error)
If @error = 6 Then 
        Send("{F5}")
 _IELinkClickByText($oIEjr, " ����������¼  ")
EndIf
Sleep(1000) ;�����ȴ�1���
_IELinkClickByText($oIEjr, "ÿ�շ���Ѳ�� ") ;ģ�������ƥ�����ҳ�����ı�
;MsgBox (0,"ts",@error)
If @error = 6 Then 
        Send("{F5}")
        _IELinkClickByText($oIEjr, "ÿ�շ���Ѳ�� ")
EndIf
Sleep(1000) ;�����ȴ�1��򿪿����ҳ

$oIEmf = _IEFrameGetObjByName($oIEdk,"MainFrame")
$Eletd = _IETagNameGetCollection($oIEmf,"TD",14)
Local $sting=$Eletd.outerhtml
;MsgBox (0,"T",$sting)
Local $bhbegin=StringInStr ( $sting ,'"#">')
;MsgBox (0,"T",$bhbegin)
Local $webbh=StringMid ( $sting, $bhbegin+4, 5 )
;MsgBox (0,"T",$webbh)
Local $iIndex = _ArraySearch($a_dateinfo,$webbh)
TrayTip("��ʾ", "�Ѿ�¼������ĵ�"& $iIndex&"��", 1)
Sleep(1000)





$oIElr = _IEFrameGetObjByName($oIEdk, "MainFrame") ;ƥ��Ŀ�ܵ����ƣ����ؿ���ڶ������ָ��Ĵ��ڶ���
$Elexz = _IEGetObjById($oIElr, "ctl00_MainContent_Button1") ;ƥ������ID.���ض������ָ����ض�����
_IEAction($Elexz, "click") ;���
WinWaitActive("[class:titlepage_1]", "", 2) ;�ȴ�ÿ�շ���Ѳ���¼�����
; Local $cs=WinWaitActive("[class:titlepage_1]", "", 3)
;If $cs=0 Then
; _IEAction($Elexz, "click") ;�������
;EndIf

Local $XCCS = 4 ;����Ѳ�����
Local $XCY = "����,����" ;����Ѳ����
Local $JCR = "����" ;���ü����
Local $FXWT = "����������ʩ�豸��������" ;���ü������

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
        _IEAction($Eleadd, "click") ;���

        $i += 1
        $p -= 1
        WinWaitActive ( "[class:button]" , "������ҳ����Ϣ" , 1)
Send("{ENTER}") ;���ͻس���ȷ��
 TrayTip("����", UBound($a_dateinfo)-$p-2&"��", 1)
 
Sleep(3000)
$oIElr = _IEFrameGetObjByName($oIEdk, "MainFrame") ;ƥ��Ŀ�ܵ����ƣ����ؿ���ڶ������ָ��Ĵ��ڶ���
$Elexz = _IEGetObjById($oIElr, "ctl00_MainContent_Button1") ;ƥ������ID.���ض������ָ����ض�����
_IEAction($Elexz, "click") ;���
WinWaitActive("[class:titlepage_1]", "", 2) ;�ȴ�ÿ�շ���Ѳ���¼�����
WEnd



;ʶ����֤�����

Func myYzmShibie($ImgId, $func_bg = 0x808080)
        Local $BitmapData, $i_width, $i_height, $Scan0, $pixelData, $s_BMPData, $i_Stride
        _GDIPlus_Startup() ;��ʼ�� Microsoft Windows GDI+.
        ;��ȡͼƬ
        $oImg = $oIE.Document.getElementById($ImgId)
        $oPic = $oIE.Document.body.createControlRange()
        $oPic.Add($oImg)
        $oPic.execCommand("Copy")
        _ClipBoard_Open(0)
        $ivpics = _ClipBoard_GetDataEx($CF_BITMAP)
        _ClipBoard_Close()
        $hImage = _GDIPlus_BitmapCreateFromHBITMAP($ivpics)
        ;��ͼƬ�������飬���԰���Դ��
        $i_width = _GDIPlus_ImageGetWidth($hImage)
        $i_height = _GDIPlus_ImageGetHeight($hImage)
        $BitmapData = _GDIPlus_BitmapLockBits($hImage, 0, 0, $i_width, $i_height, $GDIP_ILMREAD, $GDIP_PXF24RGB)
        $i_Stride = DllStructGetData($BitmapData, "Stride");Stride - Offset, in bytes, between consecutive scan lines of the bitmap. If the stride is positive, the bitmap is top-down. If the stride is negative, the bitmap is bottom-up.
        $Scan0 = DllStructGetData($BitmapData, "Scan0");Scan0 - Pointer to the first (index 0) scan line of the bitmap.
        $pixelData = DllStructCreate("ubyte lData[" & (Abs($i_Stride) * $i_height) & "]", $Scan0)
        ;��Ҫʹ�ùٷ���̳���ṩ��Abs($i_Stride) * $i_height-1,�����޷���ȷ����gif���������
        $s_BMPData = DllStructGetData($pixelData, "lData")
        $s_BMPData = StringTrimLeft($s_BMPData, 2);ȥ��ͷ��"0x"
        _GDIPlus_ImageDispose($hImage)
        _GDIPlus_Shutdown()
        DllCall("psapi.dll", "int", "EmptyWorkingSet", "hWnd", -1)
        ;����ͼƬ����
        Local $a_return[$i_width][$i_height], $x, $y, $s
        Local $ls = "", $lls = ""
        For $y = $top To $top + $ziHeight - 1;���ͣ��ֱ���ͼƬ���µĿձ�
                $s = StringMid($s_BMPData, $y * ($i_Stride * 2) + 1, $i_width * 6)
                For $x = $left To $left + $zishu * $ziWidth + ($zishu - 1) * $zhong - 1;���ͣ��ֱ���ͼƬ���ҵĿձ�
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
        For $i = 0 To $zishu - 1;��ȡ�������ֵ�ֵ
                $sx = $left + $ziWidth * $i + $zhong * $i;6�ǵ�һ�����ֵ���㣬ÿ������ռ9�У��ڣ����ǿհ���
                For $y = $top To $top + $ziHeight - 1;���ͣ��ֱ���ͼƬ���µĿձ�
                        $ls = ""
                        For $x = $sx To $sx + $ziWidth - 1;��Ϊÿ������ռ9�У��ڣ����ǿհ��У�����ֻ��ȡ����

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
        For $i = 0 To 9 ;9������ֻ��9��
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
                
                Local $LrDate = _DateAdd('d', -$i, _NowCalcDate()) ;���㵱ǰ����-258��õ������� YYYY/MM/DD
                Local $ArrayLrDate = _StringExplode($LrDate, "/", 0) ;��������ַ��������ذ����ַ�����ֺ������.

                ;Local $RQ = $a_dateinfo[0][0]&"��" &   $a_dateinfo[0][1] &"��" &  $a_dateinfo[0][2]&"��"     ;�������ΪYYYY��MM��DD��

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
                ;        Local $JCRQ = $a_dateinfo[3] & "��" & $a_dateinfo[4] & "��" & $a_dateinfo[5] & "��"
                Local $bhV = 14269 - $i

                ReDim $a_dateinfo[$p + 1][3]
        $a_dateinfo[0][0] ="Ѳ������"
        $a_dateinfo[0][1] ="��������"
        $a_dateinfo[0][2] ="�Զ����"
                $a_dateinfo[$p][0] = $ArrayLrDate[0] & "��" & $ArrayLrDate[1] & "��" & $ArrayLrDate[2] & "��" ;�������ΪYYYY��MM��DD��
                $a_dateinfo[$p][1] = $ArrayJcDate[0] & "��" & $ArrayJcDate[1] & "��" & $ArrayJcDate[2] & "��"
                $a_dateinfo[$p][2] = $bhV
                
                $p += 1
                $i -= 1
        WEnd
        Return $a_dateinfo
EndFunc   ;==>_getdateinfo



Func HotKeyPressed()
        Switch @HotKeyPressed ; ����µ��ȼ�.
                Case "{ESC}" ; {ESC} ��"�˳�"�ȼ�.
                        Exit
        EndSwitch
EndFunc   ;==>HotKeyPressed