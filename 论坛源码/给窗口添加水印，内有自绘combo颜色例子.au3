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
Global $zhu_gui = GUICreate("窗口添加水印", $width, $height)
GUISetOnEvent($GUI_EVENT_CLOSE, "exitfunc")
 
GUICtrlCreateGroup("水印文字", 5, 10, 290, 55)
$title = GUICtrlCreateInput("沙子作品", 15, 30, 180, 24)
 
GUICtrlCreateButton("设置", 200, 29, 50)
GUICtrlSetOnEvent(-1, "_watermark")
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateGroup("其它设置", 5, 75, 290, 150)
GUICtrlCreateLabel("文本颜色:", 15, 104, 60, 24)
$titleColor = GUICtrlCreateCombo("0xFFFF00", 75, 100, 90, -1, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL, $CBS_OWNERDRAWFIXED, $CBS_HASSTRINGS))
GUICtrlSetData(-1, "0x00FFFF|0xFF00FF|0xFFFFFF", "0xFFFF00")
 
GUICtrlCreateLabel("文本透明:", 185, 104, 60, 24)
$titleTran = GUICtrlCreateInput("255", 245, 100, 40, 24, 0x2000);$ES_NUMBER=0x2000
 
GUICtrlCreateLabel("背景颜色:", 15, 144, 60, 24)
$BackColor = GUICtrlCreateCombo("0xFF0000", 75, 140, 90, -1, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL, $CBS_OWNERDRAWFIXED, $CBS_HASSTRINGS))
GUICtrlSetData(-1, "0x00FF00|0x0000FF|0x000000", "0xFF0000")
 
GUICtrlCreateLabel("背景透明:", 185, 144, 60, 24)
$BackTran = GUICtrlCreateInput("255", 245, 140, 40, 24, 0x2000);$ES_NUMBER=0x2000
 
GUICtrlCreateLabel("水印位置:", 15, 184, 60, 24)
$Offset = GUICtrlCreateCombo("右下角", 75, 180, 90)
GUICtrlSetData(-1, "左下角|右上角|左上角", "右下角")
 
GUICtrlCreateButton("设置", 200, 179, 50)
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
        ;设置平滑
        _GDIPlus_GraphicsSetSmoothingMode($hGraphic, 2)
        _GDIPlus_GraphicsSetInterpolationMode($hGraphic, 7)
        ;建立变形矩阵
        Local $hMatrix = _GDIPlus_MatrixCreate()
        Local $markOffset = _GUICtrlComboBox_GetCurSel($Offset)
        Switch $markOffset
                Case 0;右下角
                        $x = $width - 80
                        $y = $height
                        $ang = 315
                Case 1;左下角
                        $x = 0
                        $y = $height - 80
                        $ang = 45
                Case 2;右上角
                        $x = $width - 60
                        $y = -20
                        $ang = 45
                Case 3;左上角
                        $x = -20
                        $y = 60
                        $ang = 315
        EndSwitch
        _GDIPlus_MatrixTranslate($hMatrix, $x, $y)
        _GDIPlus_MatrixRotate($hMatrix, $ang)
        ;背景彩条路径，高为矩形，用上面的变形矩阵改变位置及旋转
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
        ;从界面读取颜色来设置颜色及透明
        Local $ilistcolor
        _GUICtrlComboBox_GetLBText($BackColor, _GUICtrlComboBox_GetCurSel($BackColor), $ilistcolor)
        $hBrush = _GDIPlus_BrushCreateSolid("0x" & Hex(GUICtrlRead($BackTran), 2) & Hex($ilistcolor, 6))
        _GDIPlus_GraphicsFillPath($hGraphic, $hPath, $hBrush)
        _GDIPlus_BrushDispose($hBrush)
        _GDIPlus_PathDispose($hPath)
        ;设置字体路径，用上面同样的变形矩阵变化，使其与背景同步
        $hFormat = _GDIPlus_StringFormatCreate()
        _GDIPlus_StringFormatSetAlign($hFormat, 1);1为设置居中显示
        $hFamily = _GDIPlus_FontFamilyCreate("黑体")
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