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

        _AddItem($hListView, "��һ��Ŀ�ڶ���crlf��Ч"&@CRLF&'�ڶ���', '??')
        _AddItem($hListView, "11111111111111111111111111111111"&@CRLF&'���л���', '??')
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