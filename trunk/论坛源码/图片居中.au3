#include <GDIPlus.au3>

Opt('GUIOnEventMode', 1)

Dim $w_picctrl = 498, $h_picctrl = 298

$Form1 = GUICreate('居中显示图像例子 - afan', 600, 430, -1, -1, -1, 0x00000010)
GUISetOnEvent(-3, '_Exit')
GUISetOnEvent(-13, 'Show')
GUICtrlCreateGraphic(50, 50, $w_picctrl + 2, $h_picctrl + 2)
GUICtrlSetGraphic(-1, 10, 0, 0, $w_picctrl + 2, $h_picctrl + 2)
$ts = GUICtrlCreateLabel('请拖拽任意图片至本框中', 51, 51, $w_picctrl, $h_picctrl, 0x01 + 0x0200)
GUICtrlSetState(-1, 8)
$pic = GUICtrlCreatePic('', 51, 51, 1, 1)
GUICtrlCreateLabel('图片文件路径：', 50, 355, 90, 17)
$ts_File = GUICtrlCreateLabel('', 140, 355, 400, 17)
GUICtrlCreateLabel('图片原始尺寸：', 50, 370, 90, 17)
$ts_size = GUICtrlCreateLabel('', 140, 370, 200, 17)
GUICtrlCreateLabel('格式(后缀名)：', 50, 385, 90, 17)
$ts_hzm = GUICtrlCreateLabel('', 140, 385, 90, 17)

GUISetState()
WinSetOnTop($Form1, '', 1)

While 1
        Sleep(10)
WEnd

Func _Exit()
        GUIDelete()
        Exit
EndFunc   ;==>_Exit

Func Show()
        Local $imgfile = @GUI_DragFile, $hImage, $h_img
        _GDIPlus_Startup()
        $hImage = _GDIPlus_ImageLoadFromFile($imgfile)
        $w_img = _GDIPlus_ImageGetWidth($hImage)
        $h_img = _GDIPlus_ImageGetHeight($hImage)
        If $w_img * $h_img = 0 Then
                _GDIPlus_Shutdown()
                Return MsgBox(48, @error, '非图片格式', '', $Form1)
        EndIf
        GUICtrlSetData($ts, '')
        GUICtrlSetData($ts_size, $w_img & ' x ' & $h_img)
        GUICtrlSetData($ts_File, $imgfile)
        GUICtrlSetData($ts_hzm, StringRegExpReplace($imgfile, '.+\\.+\.', ''))
        Local $kgb = $h_picctrl / $w_picctrl
        Local $kgb1 = $h_img / $w_img
        Local $x_py = 0, $y_py = 0, $hBMP, $hObject
        If $w_img > $w_picctrl Or $h_img > $h_picctrl Then
                If $kgb1 > $kgb Then
                        $h_img = $h_picctrl
                        $w_img = Round(1 / $kgb1 * $h_img)
                        $x_py = ($w_picctrl - $w_img) / 2
                Else
                        $w_img = $w_picctrl
                        $h_img = Round($kgb1 * $w_img)
                        $y_py = ($h_picctrl - $h_img) / 2
                EndIf
        Else
                $x_py = ($w_picctrl - $w_img) / 2
                $y_py = ($h_picctrl - $h_img) / 2
        EndIf
        $hBMP = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
        $hObject = GUICtrlSendMsg($pic, 0x0172, 0, $hBMP)
        _WinAPI_DeleteObject($hObject)
        _GDIPlus_ImageDispose($hImage)
        _WinAPI_DeleteObject($hBMP)
        _GDIPlus_Shutdown()
        GUICtrlSetPos($pic, 51 + $x_py - 1, 51 + $y_py - 1, $w_img, $h_img)
        GUICtrlSetPos($pic, 51 + $x_py, 51 + $y_py)
EndFunc   ;==>Show