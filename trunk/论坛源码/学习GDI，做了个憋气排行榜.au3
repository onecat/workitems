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
#include <APIConstants.au3>
#include <WinAPIEx.au3>
#include <GDIPlus.au3>
#include <GDIPlusEx.au3>
#include <Array.au3>
 
Global $1DArray = _GetBieQiDatato1DArray()
Global $2DArray = _1DArrayAvailableDataTo2DArray($1DArray)
If @error Then Exit
_ArraySort($2DArray,1,0,0,1)
Global $Final2DArray = _2DArrayDeleteRepeatValue($2DArray)
;If Not @error Then _ArrayDisplay($final2DArray)
 
Global $hCallback = DllCallbackRegister("YourFunc", "int", "hWnd;uint;wparam;lparam");������������ֵ������
Global $ptrCallback = DllCallbackGetPtr($hCallback)
 
GUICreate("", 500, 500)
$nCtrlId = GUICtrlCreatePic("", 0, 0, 500, 500)
$hPicWnd = GUICtrlGetHandle($nCtrlId)
;����lable�ؼ��Ĵ�������Ҳ������ν�Ŀؼ����໯
Global $hOldProc = _WinAPI_SetWindowLong($hPicWnd, $GWL_WNDPROC, $ptrCallback)
 
GUISetState()
 
While 1
        $Msg = GUIGetMsg()
        Switch $Msg
                Case -3
                        ExitLoop
        EndSwitch
WEnd
GUIDelete()
Exit
 
Func YourFunc($hWnd, $iMsg, $wParam, $lParam)
        Local $au3Dir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\Autoit", "InstallDir");au3��װĿ¼
        Switch $iMsg
                Case $WM_PAINT
                        Local $tPAINTSTRUCT
                        Local $hDC = _WinAPI_BeginPaint($hWnd, $tPAINTSTRUCT)
                        ;��ȡ�ؼ�����
                        Local $HWND_CX = _WinAPI_GetWindowWidth($hWnd)
                        Local $HWND_CY = _WinAPI_GetWindowHeight($hWnd)
                        ConsoleWrite($HWND_CX & "x" & $HWND_CY)
                        ;��ʼGDI+
                        _GDIPlus_Startup()
                        ;��ȡ���������Ǵ�DC��ȡ����������_GDIPlus_GraphicsCreateFromHWND($hWnd)�ӿؼ������ȡ��ʹ�����Ҫ�ͷŻ���_GDIPlus_GraphicsDispose($hGraphics)
                        $hGraphics = _GDIPlus_GraphicsCreateFromHDC($hDC)
                        ;���ݻ�������λͼ����,���ǵȻ�Ļ�ͼ�������λͼ�������ģ�Ҳ����û��ֱ�ӻ��ڻ����ϣ�������ν��˫���廭ͼ
                        $hBitmap = _GDIPlus_BitmapCreateFromGraphics($HWND_CX, $HWND_CY, $hGraphics)
                        ;��ȡλͼ����Ļ�����ͼ�ͻ���λͼ�Ļ�����
                        $hBackbuffer = _GDIPlus_ImageGetGraphicsContext($hBitmap)
                        ;����ɫ0xFFE0E0E0���������GDI+����ɫȫ��ARGB��ʽ��A��͸���ȣ�RGB�Ǻ�����������FF���ǲ�͸����E0E0E0�Ǻ������ɷ�
                        _GDIPlus_GraphicsClear($hBackbuffer, 0xFFE0E0E0)
                        _GDIPlus_GraphicsSetSmoothingMode($hBackbuffer, 2);ƽ��ģʽ��2Ϊ8*8�����
                        
                        $hPen = _GDIPlus_PenCreate("0xFF000000", 2) ;����ɫ����
                        ;��ɫ��ˢ_GDIPlus_BrushGetType($hBrush)����ֵ��0
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFF483D8B)
                        ;��������_GDIPlus_BrushSetFillColor($hBrush, $iARGB)������ɫ
                        _GDIPlus_GraphicsDrawRect($hBackbuffer, 0, 0, $HWND_CX - 1, 50, $hPen)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 1, 1, $HWND_CX - 2, 49, $hBrush); GDI+�������в�������ָ�����ʻ��߻�ˢ�ģ�����Ҫ��GDI���Ȱѻ��ʡ���ˢѡ��DC
                        ;_GDIPlus_BrushDispose($hBrush);��ˢ����Ҫ�ͷ�
                        
                        ; _GDIPlus_GraphicsDrawString($hBackbuffer, "�����������а� ( Top 10 )", 20, 10,"Arial",20)
                        
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFF274E8B)
                        _GDIPlus_GraphicsDrawRect($hBackbuffer, 0, 50, $HWND_CX - 1, 449, $hPen)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 1, 50, $HWND_CX - 3, 448, $hBrush)
                        ;_GDIPlus_BrushDispose($hBrush)
                        
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFFE0FFFF)
                        _GDIPlus_GraphicsFillRect($hBackbuffer, 100, 70, $HWND_CX - 130, 380, $hBrush)
                        ;_GDIPlus_BrushDispose($hBrush)
                        
                        ;���ư�ɫ�ָ���
                        $hPen = _GDIPlus_PenCreate("0xFFFFFFFF", 1) ;����ɫ����
                        _GDIPlus_GraphicsDrawLine($hBackbuffer, 1, 50, 498, 50, $hPen)
                        
                        ;GDI�����ַ���
                        $hBrush = _GDIPlus_BrushCreateSolid(0xFFFFFFFF) ;���ð�ɫ��ˢ��Ϊ�������ɫ
                        $hFormat = _GDIPlus_StringFormatCreate()
                        $hFamily = _GDIPlus_FontFamilyCreate("Arial")
                        $hFont = _GDIPlus_FontCreate($hFamily, 20, 1)
                        $tLayout = _GDIPlus_RectFCreate(20, 10, 400, 40)
                        _GDIPlus_GraphicsDrawStringEx($hBackbuffer, "�����������а� ( Top 10 )", $hFont, $tLayout, $hFormat, $hBrush)
                        _GDIPlus_FontDispose($hFont)
                        $hFont = _GDIPlus_FontCreate($hFamily, 10, 1)
                        ;_GDIPlus_FontFamilyDispose($hFamily)
                        ;_GDIPlus_StringFormatDispose($hFormat)
                        ;_GDIPlus_BrushDispose($hBrush)
                        _GDIPlus_StringFormatSetAlign($hFormat, 2) ;���������Ҷ���
                        For $i = 0 To 9
                                $tLayout = _GDIPlus_RectFCreate(10, 80 + $i * 38, 80, 80 + $i * 38)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $Final2DArray[$i][0], $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        _GDIPlus_StringFormatSetAlign($hFormat, 1) ;���������Ҷ���
                        For $i = 0 To 6
                                $tLayout = _GDIPlus_RectFCreate(70 + $i * 40, 450, 70 + $i * 40, 460)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $i * 1000, $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        
                        ;���ƾ�����������
                        _GDIPlus_StringFormatSetAlign($hFormat, 2) ;���������Ҷ���
                        Local $PixsPerCount = 370/6000
                        $hPen = _GDIPlus_PenCreate("0xFFFFFFFF", 1) 
                        For $i = 0 To 9
                                $hBrush = _GDIPlus_BrushCreateSolid(0xFF4169E1) 
                                _GDIPlus_GraphicsDrawRect($hBackbuffer, 101, 80+$i*38, Int($PixsPerCount*$final2DArray[$i][1]), 15, $hPen)
                                _GDIPlus_GraphicsFillRect($hBackbuffer, 102, 81+$i*38, Int($PixsPerCount*$final2DArray[$i][1])-2, 13, $hBrush)
                                $tLayout = _GDIPlus_RectFCreate(76+Int($PixsPerCount*$final2DArray[$i][1]),80+$i*38,60,20)
                                _GDIPlus_GraphicsDrawStringEx($hBackbuffer, $final2DArray[$i][1], $hFont, $tLayout, $hFormat, $hBrush)
                        Next
                        
                        ;����λͼ�����ϵ�ͼ�Σ���$hBitap�ϣ���$hBitmap����DC�Ļ�����Ҳ����DC����ʾ�ˣ�˫���廭ͼʱ���ٳ�������DC������һ�β�����ͼ�β�����˸
                        _GDIPlus_GraphicsDrawImageRect($hGraphics, $hBitmap, 0, 0, 500, 500)
                        _GDIPlus_BitmapDispose($hBitmap)
                        _GDIPlus_GraphicsDispose($hBackbuffer)
                        _GDIPlus_GraphicsDispose($hGraphics)
                        _GDIPlus_FontFamilyDispose($hFamily)
                        _GDIPlus_StringFormatDispose($hFormat)
                        _GDIPlus_BrushDispose($hBrush)
                        _GDIPlus_PenDispose($hPen)
                        _GDIPlus_Shutdown()
                        _WinAPI_EndPaint($hWnd, $tPAINTSTRUCT)
                        Return 0
        EndSwitch
        Return _WinAPI_CallWindowProc($hOldProc, $hWnd, $iMsg, $wParam, $lParam);û�д������Ϣ��ԭ�ȵĴ��������
EndFunc   ;==>YourFunc
 
Func _GetBieQiDatato1DArray()
        $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")
        $oHTTP.Option(4) = 13056 ;���Դ����־
        $oHTTP.Option(6) = True ;�Ƿ�����ض����ַ��Ϣ
        $oHTTP.SetTimeouts(30000, 30000, 30000, 30000);��ʱʱ������
        $oHTTP.Open('GET', 'http://www.autoitx.com/viewthread.php?tid=38541&extra=&page=1', False)
        $oHTTP.Send()
        $Respond = BinaryToString($oHTTP.ResponseBody, 1)
        Local $text = $Respond
        Local $RegReturn = StringRegExp($Respond, 'page=(\d+)&sid=\w+', 3) ;ȡ����ҳ��
        If @error Then Return SetError(1)
        Local $Maxpage = _ArrayMax($RegReturn) ;���ҳ��
        
        For $i = 2 To $Maxpage
                $oHTTP.Open('GET', 'http://www.autoitx.com/viewthread.php?tid=38541&extra=&page=' & $i, False)
                $oHTTP.Send()
                $Respond = BinaryToString($oHTTP.ResponseBody, 1)
                ;MsgBox(0,0,$Respond)
                $text &= $Respond
        Next
        
        FileWrite(FileOpen(@ScriptDir & "\bieqi.txt", 10), $text)
        $Return = StringRegExp($text, '(?s)<a href="space.*? target="_blank">([^<]+)</a>\s.*?postmessage_\d+">(.*?)</td>', 3)
        If @error Then Return SetError(1)
        Return $Return
EndFunc   ;==>_GetBieQiDatato1DArray
 
Func _1DArrayAvailableDataTo2DArray($iArray1D)
        Local $iArray_username[1] = [0], $iArray_0Count[1] = [0], $temp, $0Count
        If Not IsArray($iArray1D) Then Return SetError(1, 0, 0)
        Local $N = UBound($iArray1D) - 1
        For $i = 1 To $N Step 2
                $temp = StringRegExp($iArray1D[$i], '((\d)\2{50,})', 3)
                If @error Then
                        ContinueLoop
                Else
                        $0Count = StringLen($temp[0])
                        _ArrayAdd($iArray_username, $iArray1D[$i - 1])
                        $iArray_username[0] += 1
                        _ArrayAdd($iArray_0Count, $0Count)
                EndIf
        Next
        Dim $Return2DArray[$iArray_username[0]][2]
        For $i = 0 To $iArray_username[0] - 1
                $Return2DArray[$i][0] = $iArray_username[$i + 1]
                $Return2DArray[$i][1] = $iArray_0Count[$i + 1]
        Next
        Return $Return2DArray
EndFunc   ;==>_1DArrayAvailableDataTo2DArray
 
Func _2DArrayDeleteRepeatValue($i2DArray)
        If Not IsArray($i2DArray) Then Return SetError(1, 0, 0)
        Local $2DArrayNoRepeat[1][2], $N = 1
        For $i = 0 To UBound($i2DArray) - 1
                If IsDeclared($i2DArray[$i][0]) Then
                        ContinueLoop
                Else
                        Assign($i2DArray[$i][0], "")
                        If $2DArrayNoRepeat[0][0] = "" Then
                                $2DArrayNoRepeat[0][0] = $i2DArray[$i][0]
                                $2DArrayNoRepeat[0][1] = $i2DArray[$i][1]
                        Else
                                $N += 1
                                ReDim $2DArrayNoRepeat[$N][2]
                                $2DArrayNoRepeat[$N - 1][0] = $i2DArray[$i][0]
                                $2DArrayNoRepeat[$N - 1][1] = $i2DArray[$i][1]
                        EndIf
                EndIf
        Next
        Return $2DArrayNoRepeat
EndFunc   ;==>_2DArrayDeleteRepeatValue
