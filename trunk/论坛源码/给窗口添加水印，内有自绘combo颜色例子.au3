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

#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinapiEx.au3>
#include <GDIPlusEx.au3>
#include <GuiComboBoxEx.au3>
 
Global Const $ODT_COMBOBOX = 3
Global Const $ODA_DRAWENTIRE = 0x1
Global Const $ODA_FOCUS = 0x4
Global Const $ODA_SELECT = 0x2
Global Const $ODS_SELECTED = 0x1
Opt('GUIOnEventMode', 1)
GUIRegisterMsg($WM_DRAWITEM, "WM_DRAWITEM")
Global $width = 300, $height = 240
Global $zhu_gui = GUICreate("�������ˮӡ", $width, $height)
GUISetOnEvent($GUI_EVENT_CLOSE, "exitfunc")
 
GUICtrlCreateGroup("ˮӡ����", 5, 10, 290, 55)
$title = GUICtrlCreateInput("ɳ����Ʒ", 15, 30, 180, 24)
 
GUICtrlCreateButton("����", 200, 29, 50)
GUICtrlSetOnEvent(-1, "_watermark")
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("��������", 5, 75, 290, 150)
GUICtrlCreateLabel("�ı���ɫ:", 15, 104, 60, 24)
$titleColor = GUICtrlCreateCombo("0xFFFF00", 75, 100, 90, -1, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL, $CBS_OWNERDRAWFIXED, $CBS_HASSTRINGS))
GUICtrlSetData(-1, "0x00FFFF|0xFF00FF|0xFFFFFF", "0xFFFF00")
 
GUICtrlCreateLabel("�ı�͸��:", 185, 104, 60, 24)
$titleTran = GUICtrlCreateInput("255", 245, 100, 40, 24, 0x2000);$ES_NUMBER=0x2000
 
GUICtrlCreateLabel("������ɫ:", 15, 144, 60, 24)
$BackColor = GUICtrlCreateCombo("0xFF0000", 75, 140, 90, -1, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL, $CBS_OWNERDRAWFIXED, $CBS_HASSTRINGS))
GUICtrlSetData(-1, "0x00FF00|0x0000FF|0x000000", "0xFF0000")
 
GUICtrlCreateLabel("����͸��:", 185, 144, 60, 24)
$BackTran = GUICtrlCreateInput("255", 245, 140, 40, 24, 0x2000);$ES_NUMBER=0x2000
 
GUICtrlCreateLabel("ˮӡλ��:", 15, 184, 60, 24)
$Offset = GUICtrlCreateCombo("���½�", 75, 180, 90)
GUICtrlSetData(-1, "���½�|���Ͻ�|���Ͻ�", "���½�")
 
GUICtrlCreateButton("����", 200, 179, 50)
GUICtrlSetOnEvent(-1, "_watermark")
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
 
GUISetState(@SW_SHOW, $zhu_gui)
Global $mark_gui = GUICreate("", $width, $height, 0, 0, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD, $WS_EX_TRANSPARENT), $zhu_gui)
GUISetState(@SW_SHOW, $mark_gui)
 
_watermark()
While 1
        Sleep(100)
WEnd
 
Func exitfunc()
        Exit
EndFunc   ;==>exitfunc
 
Func _watermark()
        _GDIPlus_Startup()
        Local $hBITMAP = _WinAPI_CreateBitmap($width, $height, 1, 32)
        Local $hCDC = _WinAPI_CreateCompatibleDC(0)
        Local $hOld = _WinAPI_SelectObject($hCDC, $hBITMAP)
        Local $hGraphic = _GDIPlus_GraphicsCreateFromHDC($hCDC)
        ;����ƽ��
        _GDIPlus_GraphicsSetSmoothingMode($hGraphic, 2)
        _GDIPlus_GraphicsSetInterpolationMode($hGraphic, 7)
        ;�������ξ���
        Local $hMatrix = _GDIPlus_MatrixCreate()
        Local $markOffset = _GUICtrlComboBox_GetCurSel($Offset)
        Switch $markOffset
                Case 0;���½�
                        $x = $width - 80
                        $y = $height
                        $ang = 315
                Case 1;���½�
                        $x = 0
                        $y = $height - 80
                        $ang = 45
                Case 2;���Ͻ�
                        $x = $width - 60
                        $y = -20
                        $ang = 45
                Case 3;���Ͻ�
                        $x = -20
                        $y = 60
                        $ang = 315
        EndSwitch
        _GDIPlus_MatrixTranslate($hMatrix, $x, $y)
        _GDIPlus_MatrixRotate($hMatrix, $ang)
        ;��������·������Ϊ���Σ�������ı��ξ���ı�λ�ü���ת
        Local $hPath = _GDIPlus_PathCreate()
        Local $aPoints[5][5]
        $aPoints[0][0] = 4
        $aPoints[1][0] = 0
        $aPoints[1][1] = 0
        $aPoints[2][0] = 114
        $aPoints[2][1] = 0
        $aPoints[3][0] = 114
        $aPoints[3][1] = 20
        $aPoints[4][0] = 0
        $aPoints[4][1] = 20
        _GDIPlus_PathAddLines($hPath, $aPoints)
        _GDIPlus_PathTransform($hPath, $hMatrix)
        ;�ӽ����ȡ��ɫ��������ɫ��͸��
        Local $ilistcolor
        _GUICtrlComboBox_GetLBText($BackColor, _GUICtrlComboBox_GetCurSel($BackColor), $ilistcolor)
        $hBrush = _GDIPlus_BrushCreateSolid("0x" & Hex(GUICtrlRead($BackTran), 2) & Hex($ilistcolor, 6))
        _GDIPlus_GraphicsFillPath($hGraphic, $hPath, $hBrush)
        _GDIPlus_BrushDispose($hBrush)
        _GDIPlus_PathDispose($hPath)
        ;��������·����������ͬ���ı��ξ���仯��ʹ���뱳��ͬ��
        $hFormat = _GDIPlus_StringFormatCreate()
        _GDIPlus_StringFormatSetAlign($hFormat, 1);1Ϊ���þ�����ʾ
        $hFamily = _GDIPlus_FontFamilyCreate("����")
        $tLayout = _GDIPlus_RectFCreate(114 / 2, 2)
        $hPath = _GDIPlus_PathCreate()
        _GDIPlus_PathAddString($hPath, GUICtrlRead($title), $tLayout, $hFamily, 1, 16, $hFormat)
        _GDIPlus_PathTransform($hPath, $hMatrix)
        _GDIPlus_MatrixDispose($hMatrix)
        _GUICtrlComboBox_GetLBText($titleColor, _GUICtrlComboBox_GetCurSel($titleColor), $ilistcolor)
        $hBrush = _GDIPlus_BrushCreateSolid("0x" & Hex(GUICtrlRead($titleTran), 2) & Hex($ilistcolor, 6))
        _GDIPlus_GraphicsFillPath($hGraphic, $hPath, $hBrush)
        _GDIPlus_BrushDispose($hBrush)
        _GDIPlus_PathDispose($hPath)
        _GDIPlus_FontFamilyDispose($hFamily)
        _GDIPlus_StringFormatDispose($hFormat)
        _GDIPlus_GraphicsDispose($hGraphic)
        _WinAPI_SelectObject($hCDC, $hOld)
        _WinAPI_DeleteDC($hCDC)
        _GDIPlus_Shutdown()
        _WinAPI_UpdateLayeredWindowEx($mark_gui, -1, -1, $hBITMAP, 255, 1)
        _WinAPI_DeleteObject($hBITMAP)
EndFunc   ;==>_watermark
 
Func WM_DRAWITEM($hWnd, $Msg, $wParam, $lParam)
        #forceref $hWnd, $wParam
;~      If $wParam <> $titleColor Then Return $GUI_RUNDEFMSG
        Local $tDRAWITEMS = DllStructCreate("uint cType;" & _
                        "uint cID;" & _
                        "uint itmID;" & _
                        "uint itmAction;" & _
                        "uint itmState;" & _
                        "hwnd hItm;" & _
                        "handle hDC;" & _
                        "dword itmRect[4];" & _
                        "ulong_ptr itmData", _
                        $lParam)
        If DllStructGetData($tDRAWITEMS, "cType") <> $ODT_COMBOBOX Then Return $GUI_RUNDEFMSG
        Local $itmID = DllStructGetData($tDRAWITEMS, "itmID")
        Local $itmAction = DllStructGetData($tDRAWITEMS, "itmAction")
        Local $itmState = DllStructGetData($tDRAWITEMS, "itmState")
        Local $hItm = DllStructGetData($tDRAWITEMS, "hItm")
        Local $hDC = DllStructGetData($tDRAWITEMS, "hDC")
        
        Switch $itmAction
                Case $ODA_DRAWENTIRE;, $ODA_SELECT
                        Local $ilistcolor
                        Local $tRECT = DllStructCreate("int;int;int;int", DllStructGetPtr($tDRAWITEMS, "itmRect"))
                        _GUICtrlComboBox_GetLBText($hItm, $itmID, $ilistcolor)
                        Local $aBrush = _WinAPI_CreateSolidBrush(_WinAPI_SwitchColor($ilistcolor))
                        _WinAPI_FillRect($hDC, DllStructGetPtr($tRECT), $aBrush)
                        _WinAPI_DeleteObject($aBrush)
        EndSwitch
        Return 1
EndFunc   ;==>WM_DRAWITEM