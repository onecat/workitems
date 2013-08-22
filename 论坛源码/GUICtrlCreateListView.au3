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

#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global Const $LVTVIF_AUTOSIZE = 0x00000000
Global Const $LVTVIF_FIXEDWIDTH = 0x00000001
Global Const $LVTVIF_FIXEDHEIGHT = 0x00000002
Global Const $LVTVIF_FIXEDSIZE = 0x00000003
Global Const $LVTVIF_EXTENDED = 0x00000004

Global Const $LVTVIM_TILESIZE = 0x00000001
Global Const $LVTVIM_COLUMNS = 0x00000002
Global Const $LVTVIM_LABELMARGIN = 0x00000004

Global Const $tagLVTILEINFO = "uint Size; int Item; uint Count; ptr Columns; ptr ColFmt"
Global Const $tagLVTILEVIEWINFO = "uint Size; dword Mask; dword Flags; " & $tagSIZE & "; int Lines; " & $tagRECT

_Main()

Func _Main()
        Local $hGUI, $hListView, $aiSize

        $hGUI = GUICreate("ListView get tile size", 400, 300)

        $hListView = _GUICtrlListView_Create($hGUI, "Item|Price", 2, 2, 394, 268)
        _GUICtrlListView_SetView($hListView, 4)
        _GUICtrlListView_SetTileSize($hListView, 390, 50)

        _AddItem($hListView, "第一项目第二行crlf无效"&@CRLF&'第二行', '??')
        _AddItem($hListView, "11111111111111111111111111111111"&@CRLF&'换行换行', '??')
        GUISetState()

        While 1
                Switch GUIGetMsg()
                        Case $GUI_EVENT_CLOSE
                                ExitLoop
                EndSwitch
        WEnd
        GUIDelete()
EndFunc

Func _AddItem($hWnd, $sItem, $sPrice)
        Local $iItem, $aiCols[1]
        $iItem = _GUICtrlListView_AddItem($hWnd, $sItem)
        _GUICtrlListView_AddSubItem($hWnd, $iItem, $sPrice, 1)
        $aiCols[0] = 1
        _GUICtrlListView_SetTileInfo($hWnd, $iItem, $aiCols)
EndFunc

Func _GUICtrlListView_SetTileSize($hWnd, $iTileWidth = Default, $iTileHeight = Default)
        If $Debug_LV Then __UDF_ValidateClassName($hWnd, $__LISTVIEWCONSTANT_ClassName)
        Local $tLVTVI, $iFlags, $fResult
        $tLVTVI = DllStructCreate($tagLVTILEVIEWINFO)
        DllStructSetData($tLVTVI, "Size", DllStructGetSize($tLVTVI))
        DllStructSetData($tLVTVI, "Mask", $LVTVIM_TILESIZE)
        $iFlags = $LVTVIF_AUTOSIZE
        If $iTileWidth <> Default Then
                $iFlags = BitOR($iFlags, $LVTVIF_FIXEDWIDTH)
                DllStructSetData($tLVTVI, "X", $iTileWidth)
        EndIf
        If $iTileHeight <> Default Then
                $iFlags = BitOR($iFlags, $LVTVIF_FIXEDHEIGHT)
                DllStructSetData($tLVTVI, "Y", $iTileHeight)
        EndIf
        DllStructSetData($tLVTVI, "Flags", $iFlags)
        If Not IsHWnd($hWnd) Then
                $fResult = GUICtrlSendMsg($hWnd, $LVM_SETTILEVIEWINFO, 0, DllStructGetPtr($tLVTVI))
        Else
                $fResult = _SendMessage($hWnd, $LVM_SETTILEVIEWINFO, 0, DllStructGetPtr($tLVTVI))
        EndIf
        Return $fResult <> 0
EndFunc

Func _GUICtrlListView_GetTileSize($hWnd)
        If $Debug_LV Then __UDF_ValidateClassName($hWnd, $__LISTVIEWCONSTANT_ClassName)
        Local $tLVTVI, $fResult, $aRet[2]
        $tLVTVI = DllStructCreate($tagLVTILEVIEWINFO)
        DllStructSetData($tLVTVI, "Size", DllStructGetSize($tLVTVI))
        DllStructSetData($tLVTVI, "Mask", $LVTVIM_TILESIZE)
        If Not IsHWnd($hWnd) Then
                $fResult = GUICtrlSendMsg($hWnd, $LVM_GETTILEVIEWINFO, 0, DllStructGetPtr($tLVTVI))
        Else
                $fResult = _SendMessage($hWnd, $LVM_GETTILEVIEWINFO, 0, DllStructGetPtr($tLVTVI))
        EndIf
        If Not $fResult Then Return SetError(1, 0, 0)
        If BitAND(DllStructGetData($tLVTVI, "Flags"), $LVTVIF_FIXEDWIDTH) Then
                $aRet[0] = DllStructGetData($tLVTVI, "X")
        Else
                $aRet[0] = Default
        EndIf
        If BitAND(DllStructGetData($tLVTVI, "Flags"), $LVTVIF_FIXEDHEIGHT) Then
                $aRet[1] = DllStructGetData($tLVTVI, "Y")
        Else
                $aRet[1] = Default
        EndIf
        Return $aRet
EndFunc

Func _GUICtrlListView_SetTileInfo($hWnd, $iItem, $aiCols, $iStart = 0)
        If $Debug_LV Then __UDF_ValidateClassName($hWnd, $__LISTVIEWCONSTANT_ClassName)
        Local $tLVTI, $tCols, $fResult
        $tLVTI = DllStructCreate($tagLVTILEINFO)
        DllStructSetData($tLVTI, "Size", DllStructGetSize($tLVTI))
        DllStructSetData($tLVTI, "Item", $iItem)
        DllStructSetData($tLVTI, "Count", UBound($aiCols) - $iStart)
        $tCols = DllStructCreate("uint[" & (UBound($aiCols) - $iStart) & "]")
        For $i = $iStart To UBound($aiCols) - 1
                DllStructSetData($tCols, 1, Int($aiCols[$i]), $i - $iStart + 1)
        Next
        DllStructSetData($tLVTI, "Columns", DllStructGetPtr($tCols))
        If Not IsHWnd($hWnd) Then
                $fResult = GUICtrlSendMsg($hWnd, $LVM_SETTILEINFO, 0, DllStructGetPtr($tLVTI))
        Else
                $fResult = _SendMessage($hWnd, $LVM_SETTILEINFO, 0, DllStructGetPtr($tLVTI))
        EndIf
        Return $fResult <> 0
EndFunc