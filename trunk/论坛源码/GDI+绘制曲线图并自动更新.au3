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

#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>
#include <Array.au3>
 
Opt("GUIOnEventMode", 1)
 
Local $hGUI, $hGraphic, $aPoints[42][2], $aPointsY[41]
 
$hGUI = GUICreate("GDI+", 400, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "close")
$StatLabel = GUICtrlCreateLabel("", 40, 30, 320, 240)
GUICtrlSetBkColor($StatLabel, 0xCCE8CF)
GUISetState()
 
_GDIPlus_Startup()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND(ControlGetHandle($hGUI, "", $StatLabel))
 
$aPoints[0][0] = 41
For $y = 1 To 41
        $aPointsY[$y - 1] = Random(20, 220)
Next
 
Func DefinePoint()
        For $i = 1 To 41
                $aPoints[$i][0] = 8 * ($i - 1)
                $aPoints[$i][1] = $aPointsY[$i - 1]
        Next
EndFunc   ;==>DefinePoint
 
;_AntiAlias($hGraphic, 4)
 
While 1
        DefinePoint()
        _GDIPlus_GraphicsDrawCurve($hGraphic, $aPoints)
        Sleep(1000)
        _GDIPlus_GraphicsClear($hGraphic, 0xFFCCE8CF)
        Dim $reYPoints = Random(20, 220)
        _ArrayPush($aPointsY, $reYPoints)
WEnd
 
Func close()
        _GDIPlus_GraphicsDispose($hGraphic)
        _GDIPlus_Shutdown()
        Exit
EndFunc   ;==>close
 
Func _AntiAlias($hGraphics, $mode)
        Local $aResult
        $aResult = DllCall($ghGDIPDll, "int", "GdipSetSmoothingMode", "hwnd", $hGraphics, "int", $mode)
        If @error Then Return SetError(@error, @extended, False)
        Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc   ;==>_AntiAlias
