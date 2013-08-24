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

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <Memory.au3>
#include <WindowsConstants.au3>
 
Global Const $IMAGE_BITMAP = 0, $STM_SETIMAGE = 0x0172, $SC_DRAGMOVE = 0xF012
_GDIPlus_Startup()
Global Const $hHBITMAP = _GDIPlus_BMPFromMemory(_Beetle(), True)
Global $aMask = _PixelCoordinates()
Global Const $aSize = StringSplit($aMask[0], ",", 2)
Global Const $iW = $aSize[0]
Global Const $iH = $aSize[1]
Global Const $hGUI = GUICreate("", $iW, $iH, -1, -1, $WS_POPUP)
Global Const $iPic = GUICtrlCreatePic("", 0, 0, $iW, $iH)
GUICtrlSetState(-1, $GUI_DISABLE)
_WinAPI_DeleteObject(GUICtrlSendMsg($iPic, $STM_SETIMAGE, $IMAGE_BITMAP, $hHBITMAP))
Global Const $iBtn = GUICtrlCreateButton("退出", $iW / 2 - 24, $iH / 2 - 24, 48, 48)
Global Const $iInp = GUICtrlCreateInput("www.autoitx.com", 185, $iH - 50, 200, 20)
Global Const $hRegion = _WinAPI_GuiImageHole($hGUI, $aMask, 0, 0, $iW, $iH, 1, 0)
GUISetState()
GUIRegisterMsg($WM_LBUTTONDOWN, "_WM_LBUTTONDOWN")
Do
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE, $iBtn
                        ExitLoop
        EndSwitch
Until False
_WinAPI_DeleteObject($hHBITMAP)
_GDIPlus_Shutdown()
GUIDelete()
Exit
 
Func _WM_LBUTTONDOWN($hWnd, $iMsg, $wParam, $lParam)
        _SendMessage($hGUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
EndFunc   ;==>_WM_LBUTTONDOWN
 
Func _GDIPlus_BMPFromMemory($bImage, $hHBITMAP = False)
        If Not IsBinary($bImage) Then Return SetError(1, 0, 0)
        Local $aResult
        Local Const $memBitmap = Binary($bImage)
        Local Const $len = BinaryLen($memBitmap)
        Local Const $hData = _MemGlobalAlloc($len, $GMEM_MOVEABLE)
        Local Const $pData = _MemGlobalLock($hData)
        Local $tMem = DllStructCreate("byte[" & $len & "]", $pData)
        DllStructSetData($tMem, 1, $memBitmap)
        _MemGlobalUnlock($hData)
        $aResult = DllCall("ole32.dll", "int", "CreateStreamOnHGlobal", "handle", $pData, "int", True, "ptr*", 0)
        If @error Then Return SetError(2, 0, 0)
        Local Const $hStream = $aResult[3]
        $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromStream", "ptr", $hStream, "int*", 0)
        If @error Then Return SetError(3, 0, 0)
        Local Const $hBitmap = $aResult[2]
        Local $tVARIANT = DllStructCreate("word vt;word r1;word r2;word r3;ptr data; ptr")
        DllCall("oleaut32.dll", "long", "DispCallFunc", "ptr", $hStream, "dword", 8 + 8 * @AutoItX64, _
                        "dword", 4, "dword", 23, "dword", 0, "ptr", 0, "ptr", 0, "ptr", DllStructGetPtr($tVARIANT))
        $tMem = 0
        $tVARIANT = 0
        If $hHBITMAP Then
                Local Const $hHBmp = _WinAPI_BitmapCreateDIBFromBitmap($hBitmap)
                _GDIPlus_BitmapDispose($hBitmap)
                Return $hHBmp
        EndIf
        Return $hBitmap
EndFunc   ;==>_GDIPlus_BMPFromMemory
 
Func _WinAPI_BitmapCreateDIBFromBitmap($hBitmap)
        Local $tBIHDR, $aRet, $tData, $pBits, $hResult = 0
        $aRet = DllCall($ghGDIPDll, 'uint', 'GdipGetImageDimension', 'ptr', $hBitmap, 'float*', 0, 'float*', 0)
        If (@error) Or ($aRet[0]) Then Return 0
        $tData = _GDIPlus_BitmapLockBits($hBitmap, 0, 0, $aRet[2], $aRet[3], $GDIP_ILMREAD, $GDIP_PXF32ARGB)
        $pBits = DllStructGetData($tData, 'Scan0')
        If Not $pBits Then Return 0
        $tBIHDR = DllStructCreate('dword bV5Size;long bV5Width;long bV5Height;word bV5Planes;word bV5BitCount;dword bV5Compression;' & _ ;[url]http://msdn.microsoft.com/en-us/library/windows/desktop/dd183381[/url](v=vs.85).aspx
                        'dword bV5SizeImage;long bV5XPelsPerMeter;long bV5YPelsPerMeter;dword bV5ClrUsed;dword bV5ClrImportant;' & _
                        'dword bV5RedMask;dword bV5GreenMask;dword bV5BlueMask;dword bV5AlphaMask;dword bV5CSType;' & _
                        'int bV5Endpoints[3];dword bV5GammaRed;dword bV5GammaGreen;dword bV5GammaBlue;dword bV5Intent;' & _
                        'dword bV5ProfileData;dword bV5ProfileSize;dword bV5Reserved')
        DllStructSetData($tBIHDR, 'bV5Size', DllStructGetSize($tBIHDR))
        DllStructSetData($tBIHDR, 'bV5Width', $aRet[2])
        DllStructSetData($tBIHDR, 'bV5Height', $aRet[3])
        DllStructSetData($tBIHDR, 'bV5Planes', 1)
        DllStructSetData($tBIHDR, 'bV5BitCount', 32)
        DllStructSetData($tBIHDR, 'bV5Compression', 0)
        DllStructSetData($tBIHDR, 'bV5SizeImage', $aRet[3] * DllStructGetData($tData, 'Stride'))
        DllStructSetData($tBIHDR, 'bV5AlphaMask', 0xFF000000)
        DllStructSetData($tBIHDR, 'bV5RedMask', 0x00FF0000)
        DllStructSetData($tBIHDR, 'bV5GreenMask', 0x0000FF00)
        DllStructSetData($tBIHDR, 'bV5BlueMask', 0x000000FF)
        DllStructSetData($tBIHDR, 'bV5CSType', 2)
        DllStructSetData($tBIHDR, 'bV5Intent', 4)
        $hResult = DllCall('gdi32.dll', 'ptr', 'CreateDIBSection', 'hwnd', 0, 'ptr', DllStructGetPtr($tBIHDR), 'uint', 0, 'ptr*', 0, 'ptr', 0, 'dword', 0)
        If (Not @error) And ($hResult[0]) Then
                DllCall('gdi32.dll', 'dword', 'SetBitmapBits', 'ptr', $hResult[0], 'dword', $aRet[2] * $aRet[3] * 4, 'ptr', DllStructGetData($tData, 'Scan0'))
                $hResult = $hResult[0]
        Else
                $hResult = 0
        EndIf
        _GDIPlus_BitmapUnlockBits($hBitmap, $tData)
        $tData = 0
        $tBIHDR = 0
        Return $hResult
EndFunc   ;==>_WinAPI_BitmapCreateDIBFromBitmap
 
Func _WinAPI_GuiImageHole($hWnd, $aPixelArray, $iX, $iY, $iWidth, $iHeight, $fScale = 1, $bCorrection = True)
        Local $size = WinGetPos(HWnd($hWnd))
        Local $iHwndWidth = $size[2]
        Local $iHwndHeight = $size[3]
        If $bCorrection Then
                $iX += _WinAPI_GetSystemMetrics(7)
                $iY += _WinAPI_GetSystemMetrics(8) + _WinAPI_GetSystemMetrics($SM_CYSIZE) + 1
        EndIf
        Local $aM_Mask = DllCall('gdi32.dll', 'long', 'CreateRectRgn', 'long', 0, 'long', 0, 'long', 0, 'long', 0)
        $aMask = DllCall('gdi32.dll', 'long', 'CreateRectRgn', 'long', 0, 'long', 0, 'long', $iX, 'long', $iHwndHeight)
        DllCall('gdi32.dll', 'long', 'CombineRgn', 'long', $aM_Mask[0], 'long', $aMask[0], 'long', $aM_Mask[0], 'int', 2)
        $aMask = DllCall('gdi32.dll', 'long', 'CreateRectRgn', 'long', 0, 'long', 0, 'long', $iHwndWidth, 'long', $iY)
        DllCall('gdi32.dll', 'long', 'CombineRgn', 'long', $aM_Mask[0], 'long', $aMask[0], 'long', $aM_Mask[0], 'int', 2)
        $aMask = DllCall('gdi32.dll', 'long', 'CreateRectRgn', 'long', $iX + $iWidth, 'long', 0, 'long', $iHwndWidth, 'long', $iHwndHeight)
        DllCall('gdi32.dll', 'long', 'CombineRgn', 'long', $aM_Mask[0], 'long', $aMask[0], 'long', $aM_Mask[0], 'int', 2)
        $aMask = DllCall('gdi32.dll', 'long', 'CreateRectRgn', 'long', 0, 'long', $iY + $iHeight, 'long', $iHwndWidth, 'long', $iHwndHeight)
        DllCall('gdi32.dll', 'long', 'CombineRgn', 'long', $aM_Mask[0], 'long', $aMask[0], 'long', $aM_Mask[0], 'int', 2)
        Local $i, $aBlock, $aRet, $hDLL = DllOpen('gdi32.dll')
        For $i = 1 To UBound($aPixelArray) - 1
                $aBlock = StringSplit($aPixelArray[$i], ',', 2)
                $aRet = DllCall($hDLL, 'long', 'CreateRectRgn', 'long', $iX + $aBlock[0] * $fScale, 'long', $iY + $aBlock[1] * $fScale, 'long', $iX + $aBlock[2] * $fScale, 'long', $iY + $aBlock[3] * $fScale)
                DllCall($hDLL, 'long', 'CombineRgn', 'long', $aM_Mask[0], 'long', $aRet[0], 'long', $aM_Mask[0], 'int', 2)
                _WinAPI_DeleteObject($aRet[0])
        Next
        DllClose($hDLL)
        DllCall('user32.dll', 'long', 'SetWindowRgn', 'hwnd', $hWnd, 'long', $aM_Mask[0], 'int', 1)
        Return $aM_Mask[0]
EndFunc   ;==>_WinAPI_GuiImageHole
 
Func _PixelCoordinates()
        #Region pixel coordinates
        Local $sPixelRect
        $sPixelRect &= "556,255;418,2,422,5;419,1,421,2;420,0,421,1;415,5,420,8;416,4,418,5;417,3,418,4;420,5,421,6;412,9,416,12;413,7,415,9;414,6,415,7;416,8,418,10;415,8,416,9;418,8,419,9;409,12,414,15;410,11,412,12;411,10,412,11;416,10,417,11;414,12,415,14;406,15,410,20;407,14,409,15;408,13,409,14;410,15,412,17;412,15,413,16;402,20,407,23;404,18,406,20;405,17,406,18;410,17,411,18;403,19,404,20;407,20,409,21;399,23,404,27;400,22,402,23;401,21,402,22;407,21,408,22;404,23,406,25;396,27,401,31;397,26,399,27;398,25,399,26;404,25,405,26;401,27,403,28;392,31,398,34;394,29,396,31;395,28,396,29;401,28,402,29;393,30,394,31;398,31,400,32;398,32,399,33;389,35,394,39;390,34,397,35;391,33,392,34;394,35,396,37;396,35,397,36;385,39,391,43;387,37,389,39;388,36,389,37;394,37,395,38;386,38,387,39;391,39,393,40;382,43,387,48;384,40,385,43;391,40,392,42;383,42,384,43;387,43,389,45;389,43,390,44;212,59,399,231;277,45,317,59;290,44,297,45;367,48,383,59;380,45,382,48;381,44,382,45;387,45,388,47;261,47,277,59;266,46,277,47;317,46,331,59;371,47,380,48;379,46,380,47;331,47,344,59;250,49,261,59;256,48,261,49;344,48,356,59;383,48,385,50;385,48,386,49;356,50,367,59;356,49,360,50;363,49,367,50;239,51,250,59;245,50,250,51;383,50,384,51;231,53,239,59;234,52,239,53;383,54,387,59;383,53,384,54;227,54,231,59;221,56,227,59;224,55,227,56;387,55,390,59;390,56,393,59;219,57,221,59;393,57,395,59;215,58,219,59;395,58,397,59;158,93,212,229;200,66,212,93;208,61,212,66;209,60,212,61;399,90,457,231;399,65,412,90;399,61,403,65;399,60,401,61;205,63,208,66;206,62,208,63;403,62,405,65;405,63,408,65;203,64,205,66;408,64,410,65;202,65,203,66;412,70,422,90;412,67,416,70;412,66,414,67;191,72,200,93;197,68,200,72;198,67,200,68;416,68,418,70;195,69,197,72;418,69,420,70;192,71,195,72;194,70,195,71;422,74,431,90;422,71,425,74;425,72,427,74;183,77,191,93;188,74,191,77;189,73,191,74;427,73,429,74;186,75,188,77;431,77,437,90;431,75,433,77;185,76,186,77;433,76,435,77;177,81,183,93;181,78,183,81;437,80,442,90;437,78,439,80;178,80,181,81;"
        $sPixelRect &= "180,79,181,80;439,79,441,80;442,83,447,90;442,81,444,83;172,84,177,93;175,82,177,84;444,82,445,83;174,83,175,84;447,85,449,90;447,84,448,85;167,87,172,93;169,86,172,87;171,85,172,86;449,87,452,90;449,86,451,87;164,89,167,93;166,88,167,89;452,88,454,90;454,89,455,90;161,91,164,93;163,90,164,91;457,125,505,237;457,98,468,125;457,92,459,98;457,91,458,92;160,92,161,93;459,94,462,98;459,93,461,94;110,117,158,229;150,98,158,117;155,95,158,98;157,94,158,95;462,95,464,98;153,96,155,98;464,96,465,98;152,97,153,98;465,97,467,98;143,103,150,117;147,100,150,103;149,99,150,100;468,104,477,125;468,100,471,104;468,99,470,100;144,102,147,103;146,101,147,102;471,101,472,104;472,102,474,104;474,103,475,104;138,106,143,117;141,104,143,106;140,105,141,106;477,109,484,125;477,106,480,109;477,105,478,106;133,109,138,117;136,107,138,109;480,107,481,109;135,108,136,109;481,108,482,109;130,111,133,117;132,110,133,111;484,113,489,125;484,110,485,113;485,111,487,113;127,113,130,117;129,112,130,113;487,112,488,113;115,114,119,117;124,115,127,117;126,114,127,115;489,116,493,125;489,114,491,116;113,116,115,117;114,115,115,116;119,115,123,117;491,115,492,116;123,116,124,117;493,118,496,125;493,117,494,118;60,127,110,232;102,118,110,127;92,120,102,127;97,119,102,120;496,120,498,125;496,119,497,120;82,122,92,127;87,121,92,122;498,122,501,125;498,121,499,122;77,123,82,127;501,123,502,125;72,124,77,127;502,124,503,125;67,125,72,127;62,126,67,127;505,150,535,223;505,131,512,150;505,127,507,131;505,126,506,127;28,148,60,227;52,131,60,148;57,128,60,131;59,127,60,128;507,128,508,131;55,129,57,131;508,129,510,131;54,130,55,131;510,130,511,131;45,135,52,148;50,132,52,135;512,136,518,150;512,133,515,136;512,132,513,133;47,134,50,135;49,133,50,134;515,134,516,136;516,135,517,136;40,138,45,148;43,136,45,138;42,137,43,138;518,140,523,150;518,137,520,140;520,138,521,140;36,141,40,148;38,140,40,141;39,139,40,140;521,139,522,140;523,143,527,150;523,141,525,143;32,144,36,148;34,143,36,144;35,142,36,143;"
        $sPixelRect &= "525,142,526,143;527,145,530,150;527,144,528,145;30,146,32,148;31,145,32,146;530,147,532,150;530,146,531,147;29,147,30,148;532,148,533,150;9,171,28,222;22,156,28,171;26,151,28,156;27,149,28,151;533,149,534,150;535,168,554,211;535,155,539,168;535,151,536,155;24,153,26,156;25,152,26,153;536,153,537,155;23,154,24,156;537,154,538,155;18,161,22,171;20,158,22,161;21,157,22,158;539,159,542,168;539,157,540,159;540,158,541,159;19,160,20,161;542,162,545,168;542,161,543,162;15,165,18,171;16,163,18,165;17,162,18,163;545,164,548,168;545,163,546,164;548,165,550,168;13,167,15,171;14,166,15,167;550,166,551,168;551,167,553,168;11,169,13,171;12,168,13,169;554,179,556,202;554,169,555,179;10,170,11,171;2,179,9,210;6,174,9,179;7,173,9,174;8,172,9,173;4,176,6,179;5,175,6,176;3,177,4,179;0,182,2,194;1,180,2,182;1,194,2,202;554,202,555,207;5,210,9,219;4,210,5,216;3,210,4,213;535,211,548,217;548,211,552,213;552,211,553,212;548,213,550,215;550,213,551,214;548,215,549,216;535,217,542,220;542,217,546,218;542,218,544,219;6,219,9,220;8,220,9,221;535,220,538,222;538,220,540,221;16,222,28,226;11,222,16,224;10,222,11,223;535,222,536,223;505,223,532,224;13,224,16,225;505,224,510,227;510,224,511,225;523,224,527,225;21,226,28,228;18,226,21,227;33,227,50,230;28,227,33,229;50,227,52,228;59,227,60,230;58,227,59,228;505,227,508,231;508,227,509,229;27,228,28,229;50,228,51,229;110,229,139,243;139,229,152,234;152,229,156,231;156,229,157,230;160,229,212,231;152,231,154,232;428,231,457,243;417,231,428,236;412,231,417,233;410,231,412,232;505,231,507,233;77,232,110,250;66,232,77,240;62,232,66,236;61,232,62,234;152,232,153,233;415,233,417,235;414,233,415,234;505,233,506,235;139,234,146,238;146,234,149,236;149,234,150,235;64,236,66,238;63,236,64,237;146,236,148,237;422,236,428,239;420,236,422,238;419,236,420,237;457,237,488,253;488,237,499,243;499,237,503,239;503,237,504,238;65,238,66,239;139,238,144,240;144,238,145,239;425,239,428,241;424,239,425,240;499,239,501,241;501,239,502,240;70,240,77,244;68,240,70,242;"
        $sPixelRect &= "67,240,68,241;139,240,141,242;141,240,142,241;427,241,428,242;499,241,500,242;69,242,70,243;110,243,129,251;129,243,135,246;135,243,137,245;137,243,138,244;440,243,457,251;434,243,440,247;431,243,434,245;430,243,431,244;488,243,495,247;495,243,497,245;497,243,498,244;73,244,77,246;71,244,73,245;433,245,434,246;495,245,496,246;75,246,77,248;74,246,75,247;129,246,133,248;133,246,134,247;437,247,440,249;435,247,437,248;488,247,493,249;493,247,494,248;76,248,77,249;129,248,131,249;129,249,130,250;438,249,440,250;488,249,491,251;491,249,492,250;83,250,110,253;81,250,83,252;79,250,81,251;110,251,125,253;125,251,127,252;445,251,457,255;443,251,445,253;441,251,443,252;488,251,489,252;444,253,445,254;457,253,485,255;485,253,486,254"
        #EndRegion pixel coordinates
        Local $aPixelRect = StringSplit($sPixelRect, ";", 2)
        Return $aPixelRect
EndFunc   ;==>_PixelCoordinates
 
Func _Beetle($bSaveBinary = False, $sSavePath = @ScriptDir)
        Local $Beetle
        $Beetle &= '/9j/4AAQSkZJRgABAQEASABIAAD//gATQ3JlYXRlZCB3aXRoIEdJTVD/2wBDACodICUgGiolIiUvLSoyP2lEPzo6P4FcYUxpmYagnpaGk5GovfLNqLPltZGT0v/V5fr/////o8v///////L/////2wBDAS0vLz83P3xERHz/rpOu////////////////////////////////////////////////////////////////////wgARCAD/AiwDASIAAhEBAxEB/8QAGQABAAMBAQAAAAAAAAAAAAAAAAECAwQF/8QAFwEBAQEBAAAAAAAAAAAAAAAAAAECA//aAAwDAQACEAMQAAAB6gAAAAAAAAAAAAAAAAAAAAAAAADMm4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACpFosAAAAAAAAAAAAAAAAAAAAAAAAAACCVbkJEJEAAEERXUAAAAAAAAAAAAAAAAAAAAAAAIlJpeDNfOpimZ0Tx1PQnzh6LzpPQnh0OpzXNs7THn6dgmMbGgUAAAAAAAAAAAAAAAAAAAAZJpmvVbc+FnThnBMBCRCRCRCRv1cvXHmSVO2A7dvNsejTDolynatkzgl3RMoAAAAAAAAAAAAAAAACtFkaRy2a86NSErISISISISWEiEjXq5unnfOmW5CVQkRaB1b+dtm9dJtm819crNnNvLYSgAAAAAAAAAAAADJL4ttSKVsZ16Yy5Ez3xVcUXFFxRcUXFFxRcW6MduWuGZnrmqwqmSsXgqsLdXHfGutE41TDqizPXmk6ETnQAAAAAAAkhMAqlpoEXGNN2pOWtI4uqMa688Jlz1nbecW4wdCOeOkczpk5XUOV1F5Z6Rz6aI5XRauZ0k5nSXmdI5p6BzugZ70nNlVFsrKm+d4JhQAAAABmmkY71EWFbESiSsXGNtKkK2pW1bJkMr8Wur1Z358unPTnNM9pOa9emmFOuMNoxNqWzTSaWFqwt2I2Y6FgAiq8tLWBKISKpUmOCX0I5OsAAATFUpXXLUbRaVJBEFmcl0CYCKaRUVEthvxaqndWpxrMdXPfI6JmsYdPN01ydnONuadYy01AJWJsuLbGubpx7dIGEI0glABGZqysXCstR5mvRyTXfPN1JAsEmfL2V1nLaZlEE44c5rkkheKjbGI9G/l9h0TEE56QM9OHTqthU6ozyLaZWNbZVi84XrenNvC2fNXbOVo2CVtWw4Ozj1e20xkrNomVYlHPWvJiCbVSNaDr44j1nnehFq2LhvERaCkREkoZth0jj388S3qL5Z2ehkyi2VNqxjSmb2dHl+kLwK8XZx7m1N0uda20Xm+U49HOTpz6GfRx99ODv4D0ImMAqtq2TGm62wki9LSpQYcNoGkXstfk0OzC3GdGGmhzb4xL6046xRZmidSGPDXqubpBBw4Wgt1Y62c0dtSlbzqc89KWvJ2ckV6uW8vpwFOLvy1M2srg66nNbQVrtMZ6hz22gng74LQQFlbVsAqJqk3iZXP0cMc8xaurDomzj16KWRzdNzk65pLz59GEu/f5fpwQpPF2TUeb6kXPB31rZetanDMJejK82Y9HP3S0lezlz3wrXLo5pYGXqTS1TlplZpOcl1BdSDRmNGY0ZjRmNGY0Zi1sxooL1gaqWled6PmFbVk2x6uQ26Mt7M6aXOC0arbn2yivp8m5dXSyuhnQEVuTOuyscuuJfL6+eLNt82pzunA6cLQOdObXbfplwtqsxbDBuMG4wbjBuMG4wbjBuMG4wbjBuMJ2GLYZNRlxelEeVPTzV0Rh0Wbcm+dZ9kRETHMV6+b0pZEoAAAAAFOD0oTy9ta1EWGNOmxz99pgFAAAAAAAAAAAAAAAAZ6Dzaerx2Y65wa1zgi1+4i5KAAB//8QAKBAAAgEDBAIDAQEBAAMAAAAAAQIAAxESECAhMRMyIjBAUEFgIzNC/9oACAEBAAEFAv6gN/8AhT8j/wAITALD/gyYBb/hCbQD+xcTIfWTYKLn+kWA'
        $Beetle &= 'mU+cs0wmCzFZYfS2UfMykMv6JIEBvreeRZ5J5TPIZmZkZkZmZmYHaZtPLM12liDn/NJtLkzGXAhqQuZf6qPs3rpeCoYKgnehUTEiBoDf+SWgWEgQ1Jf7aPs3rtvBUgIOhF4VtA0Bv/FJnLTqF/wUvZvXfeB9St4QRA38MtAsLWhN/wANL2b1+lWtAb6lYDaA3/eTO4BaM0xJhUj8NP2b1+oGA31IvOoG/aWncAtGeKLaHr8Cezev1gwG+wraBv0k2l4bwC56jGdFCCIzWAPNxLiXEuJcS4lxLy8vLy8vpzBcEkkcyxljLNMWmLTFpi0xaYtMGmBigg7MBAAPy5CZCZDUmDjS0aneYc2aYTCYiYiWEsJYSwlvrHX25CZTKZTIfhvpaYjZiJjORt/3R3xinJYjZaO2ILHHN55GMDPc8TNzMyDpc6jr6rzmYj8haA8/UROtf90N2akbMeqOlXpfQ9UdKnLxuVo9WnygDQCDpnCzyrPKs8qxWDbe/rYFWWpO/pbmf5b5fZ1oO5VPCPjGNzfJKPcrdL6Hqj3H/wDZD1TvjapEDX0HTIGniWeJY1r0gQNbfY65DqI1oOd/c6nZG28yWZDf1B3Pd8VjICKR55pN5FnNVuofWj3KiXgqiNUvEXEbB1pUNhTF21G688izyLM12suUsUKNztY2W5gBO1qgWGox2XIgqmKwbaODPgk8iwMplgCxAH/igdBAymEgQOgnkSAgxgkDUxPIk8iQOp1HWjG7IMV07OxnCw1WO0MRFrbCJ4xfaeZiBtepssdnUSpfYYI/uKXDU8RSNxV9lp3XxQUwDWiU8h4oy4G3kXxQ8HwwU7HQdRjZVF20MA2VKltlpidiPjAbj6b7Kj31CS4Epm4drN8TCLa0nvsHdT3FXhqmQoyr2tSy+UQEMKvVNhjksqMDEFkj++waVfWjr/8AWtV7DQLefFYjXaobDIGFNaTWOlubQQaf7La1DiuiiwZtKXVT2itGFjOopyGh7f3CLbBTKRs9b2RVwxXStEp5DxRhib3Ef32DQgMFULqup4BNzFFyzaU/ar6wNGFxpTbJdtxurH5RRcsLwqRonT9wIYy/DSiedG5V+WFXg1ZSXmr7LUsvlgqAmtKXpKvVI/GP7bBtPWtY/HRV+BRtE7fqBSYq2jCzSifltqj4yk99h5Mp95iXhtDLwTICZ31Q2bUKCMFmC6EAzBZgsCgQ87BxpYX2DrYdlY/LQvaZg6XggtMhPIJU0XhtSPmOAwuLSn76N66Uo2lM3JF4BGOlPs97R+MdbDsf3g7qdxTCIBaVDbQSrreX0sCdby8vD1pTNnqDmUlsCyqUsZUWxifFdV9dMRMVmKzFZisxWYrMVmKzFZisxWYrMVmKzFZisxWYrMVmKzFZisxWWGxvbR/kkprcuQIGDSotxYxBc1TdwLnxNOZYy27ETCYQU1lVABPdVWcwgiA2PYw+VQ6rTLQXAvLy8vLy8uZcy5lzLmXMuZcy5lzLmXMuZcy5lzOZzOZzOZzOZzHUqdKZhT5dAtc8wXs17eiyiPuPIZcSpxIN58gS/BWKCIXtp3EpW/gkXjUtQ8YEgLaB58iSbRjkVGRAsPuZQwZSpgqGeQTyQsToqloqhf4jIGjKV0DETyTyQ1Doqliq4j8BF4aM8JnhM8JnhMFGDj+N3HpTBpiZiZYxULRQFH0f/8QAHBEBAQACAwEBAAAAAAAAAAAAEQABEDBAUGBw/9oACAEDAQE/AfyZ6ryu3pHPjOiei6IiIiNERER5GPFz9VnHjHCRERERERER53//xAAkEQADAAEDBAEFAAAAAAAAAAAAAREQITAxAiBAQRIDIkJRcP/aAAgBAgEBPwH+AzyJtTM8OHJMQhCEIPMINZa34cYf1Etl89zWKTeufgilKUpSlxSlKUvivp0wsPujJ46PkqcaCw+ceuys6n63VtJUiEtYaHsiIJJmmen97rPu2ujk0PyHBcjgzp7LpNv4LdThoXWmh7xdIJzb'
        $Beetle &= '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'
        $Beetle &= 'D72OWhfohXnGwkuXRacTRXaQ05cOmWXhXS76jqvyXFIbzxTEESuM6uPcJRYWNIuzOY5YQQKwbQprElXTgYkyydsJbaGzdfYewqtxOEg3maEPInQxNFC5DWFUIZaEaEnY3HYz2EKoQ7m7kbjsbjsMoTc4+88ZpkIqS7xjkZK5HBc3XQtFGxV3IIIL2IU6UbkpqU6FyBDUNCWqTTLiRJDFYLhe9HXgTrN2GmrprFNtKN664pyIVLCyI3GdikJIlWuPEIpozsR+AsNs4LOoqKBHV2HI7GRYtpkfgJItD+IFracbY+88JlMMi2mo8GhESG8dw5svfFM7Jsh/4cDH1WghDVnwTvwNk/0EN+wnKlYzMrPfGlNK0MqSJ97jYDovYfya4wM7IgsXRQ664BCRO3cpCCEvPGFKaUG9K5MInSHJthylUlmQR3vh5A78FvV4Wwil4qsVXZwNSGLtq1JsKd2NWiLe5kSZIpq2xq67G44Tk5BQsDuRdJD+BLPwEqYc9dMV9iGNlx4fmVGqJKDk2WCbaURoYqFLOmHQS6g1sj1GIWtGeAPJIbNuJJKEkkWGooEfgNgCRSWeHkjvwW9XhGJdCRqrrjZOrxZMbyHPbPDkxBSwbktjz1YOTFZ1njebqmD4Gi7QodmnwyR0wgUQqo2ZcgRRUJdgy6KOZzDWNdrxRsi40pWZAidu5RsvWSbTFrkRTTjcj8hYTZSflPdwWpoTNow8sd+C3q+FoYVFAsIk1YwQs2LZTyEtRLiqkaLcItUvRE0sIt7gbSuxNNSqkzvBlVXLGR5XhSz2NIJXcQValQoKIkgrJId8xK0IOjwkW/AiwSqYNIy4WAZsTYjKUsiJIRMsoShYZQ6oRJCFhJIx8uH3nw29eCRVohCq0iXCSKycDad0mOSiIGgZss8houNAVtmmDyt8ZwhYESKGyuhXQyxbsY1NNi4RmQSJCrMNmMFk3MU5SeDGhtbkkk/Qe8+G7m4HnmYWBYCuMTFRCoyRJkWMLxIS7YK5ZgkrDVcWQxHl1tjEb0IWwqzuyBJDPgKQsNiSunB42DdCZy0f1JteTa8m15NrybXk/qT+pP6k/qTa8m15NrybXk2vJteTa8m15No2DYNg2COyQnjVzMUgcKwsRbINoQt90U5lBGHQKD84OV3EkUNCdkLXwtJ3WINgkqqWJCY1wmvkuQuX0G2UXDChj5kNraYn5BdLCviumy3IpmcaEv0Db9RL9RL9RL9RL9R8EfBHwR8EfBHwR8EfBHwR8EfBHwR8FiRbknVJ1SdUnVJ1SdUnVJ1TcDFdbDsdEJraQ6ZiTOhsdILDJoK2aM9dbC+/JesiYnZjoWNkC7b6FU12NhiG5t3FFbFcu/BJtCQjMPT7ChISUR1q2Ii+E9O8oCwlprKISk/Au++g2QNSghCWXrwBkQeCN+4kv5GxL+6YPKdxbS+v2RRW+o8rbXC+ha1IK3kM2jkwgAXEur+hQsJKK3vGyNkbI2RW9oRJCUL7M0khqUMValofwZtmwbQ80RCPRf/aAAwDAQACAAMAAAAQ888888888888888888888888848888888888888888888888888888888884c8888888888888888888888888804ww884088888888888888888888888xHAUOS/gFbvb0888888888888888888883KJXvPd9NJfvjalS088888888888888884m0+vNNNMMMqmMMQIYaS88888888888888/W8VF7/wB+8/8A/ekIpfmQSFLzzzzzzzzjTOdfE+nBFUNesd67x48zywyrtgfTzzzzzviG8uPr631A74zwJDDXj7rznqxPP2Fnzzykz4v/ALjfQboeqwMUMOs9s4Y4mTz3z+ZJ68456RBOcexiKgIs06Ume+99+U2nJF40t3IGY/oVN85Rd6lqdMA2waQ8+89Q9QFxvn9T9v6Tdx1x3nqcRpSd4CcG8uq+998tmr51zbtSjtJ5'
        $Beetle &= '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'
        $Beetle &= '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'
        $Beetle &= 'eJoNczUluoc4EBRblWadGUIcCzx6JcIbYYrnaBYsCX4QbDRVmqZJYGFaol4dp5Zr/nLB1kKcN53U2xRQjcxOF/0mj4+jNPCRfH9S89XZ4PTzV/v9Nq/DL9NyNQxDRsCoKOlOOXnwIa9BBWO7iK4ecpTozwxMxgiqtdO2YTphiOVOdpYZArUmEaLs8Iy2Tg+50cyoLYB3xLkAdzMwBkRhY2NPaK5QLTvLlxAKx091YRI+pul7SDyTT1OJjIq0URjO2wYIN6g2doiu83CZi5NjMxqDjMNhwxmQMGXVw3Cdh3cmmJ2nq/mJWefbFwBQGxBQqNL2n7x/M/eP5g8UaOtSnFu6SACANAOiCgE1EsYuAutHR74Swtt/RrfDL9OQOQe8DrUGn3Og90ZohdpvQ4cQiwDkuDSAdjeA13fRjKghzqhOE7RupF5YneFNPnMZ2yEuX0GmBrftOyhO54kbpB7kUwasr2ly5QndHWEHe7QVFqsYiY1WXtK3IVk07WQw1uqkxg0iGGg2ImLeiO3N1jBpud5AemiFGUlJSXLlkuXLly5cuX9PzO79LA+f6MGXLl38HpCOn4See9ISXiJFeFwYzszD9FNBmOeNVqFXFszrDcclWjFQYWLyXGAprAq6N+rrZSJGIt6H5JR1hDv6ZonaOPCHEBdP04Iwc85vyj4K3FzlBMFTSdWHj0ejtezpRylllLyzte6fIp8inyKfEp8ynbfVO2+qdn3Ts+6fEp8SnxKfEp8SnxKfEp8SgP8A0ztfVnyrO19Wdr6sGWR5I2jL6KxyvvCE1MNU+Py5ozFGHvErDYXC9bhuoBpNsNziXd93WIwK1faXgaGA4WodvA5imMaM1CnjCOX06IMW0s8GI2R4kSUDzJ455VlDcNAgo2akoJ06HMBz0cI4O2ekeVl3d4Dbx7wU67ERQzbDACuVy9GaA7TulmlhYselrex4p+xT9on7R0Z+wT9gn7JP2ToT9kn7J9ZCEIQn6Kfpp+ln62frZ+vn6WEECPySfvSYQxkJpDplPncMQo4tllv0KMd7TtMyTsQZjPqQDfXYQROAMVVVtcs0dr/0/wAwhWFMQbWjyQa2dzZiIYQsoKdxiWoyMJd3M4BbQjPN4iBWXDw8JcMKV0CVFGxsP4FORNmNZqctYpIETZhEI2TBy8YaMNfjKgINiWExmKugioUBsMRmpLZeBsQYddXghI0FH+etednclKcbOzBRsaeYPSB2Z9YhomGpgeLcwD9hgjKOcGq0JSBe5av8Jgytg1lGOWg0YTBKHDkib3wagaiIPpB2Z9Yqqqq7sAFnd2JqRXzP9GuyFlqDjZPgs+Cz4LPhsosCcboJMGgfwzkSajF9Q3OSJa+xE9feSn/olH/U2KGrcpF4vP8Ah//Z'
        Local $bString = Binary(_Base64Decode($Beetle))
        If $bSaveBinary Then
                Local $hFile = FileOpen($sSavePath & "\autoBert's beetle.jpg", 18)
                FileWrite($hFile, $bString)
                FileClose($hFile)
        EndIf
        Return $bString
EndFunc   ;==>_Beetle
 
Func _Base64Decode($sB64String)
        Local $a_Call = DllCall("Crypt32.dll", "bool", "CryptStringToBinaryA", "str", $sB64String, "dword", 0, "dword", 1, "ptr", 0, "dword*", 0, "ptr", 0, "ptr", 0)
        If @error Or Not $a_Call[0] Then Return SetError(1, 0, "")
        Local $a = DllStructCreate("byte[" & $a_Call[5] & "]")
        $a_Call = DllCall("Crypt32.dll", "bool", "CryptStringToBinaryA", "str", $sB64String, "dword", 0, "dword", 1, "struct*", $a, "dword*", $a_Call[5], "ptr", 0, "ptr", 0)
        If @error Or Not $a_Call[0] Then Return SetError(2, 0, "")
        Return DllStructGetData($a, 1)
EndFunc   ;==>_Base64Decode