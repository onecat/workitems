#include <GuiButton.au3>
#include <GuiImageList.au3>
 
GUICreate("设置按钮图标", 560, 100)
$But1 = GUICtrlCreateButton("图标靠左", 10, 20, 100, 60, $BS_FLAT)
_SetIcon(-1, 'shell32.dll', 22, 0, 20, 20)
 
$But2 = GUICtrlCreateButton("图标靠右", 120, 20, 100, 60, $BS_FLAT)
_SetIcon(-1, 'shell32.dll', 23, 1)
 
$But3 = GUICtrlCreateButton("图标靠上", 230, 20, 100, 60, $BS_FLAT)
_SetIcon(-1, "L:\测试脚本\Skin\tool.ico", 24, 2, 30, 30)
 
$But4 = GUICtrlCreateButton("图标靠下", 340, 20, 100, 60, $BS_FLAT)
_SetIcon(-1, 'shell32.dll', 25, 3, 35, 35)
 
$But5 = GUICtrlCreateButton("图标居中", 450, 20, 100, 60, $BS_FLAT)
_SetIcon(-1, 'shell32.dll', 26, 4, 40, 40)
GUISetState()
 
Do
Until GUIGetMsg() = -3
 
Func _SetIcon($hWnd, $sFile, $iIndex = 0, $nAlign = 0, $iWidth = 25, $iHeight = 25) ;控件句柄, 图标图像的路径, 图标索引, 图标在控件中的位置, 图标宽度, 图标高度
        $hImage1 = _GUIImageList_Create($iWidth, $iHeight, 5, 1, 0) ;创建图像列表控件
        _GUIImageList_AddIcon($hImage1, $sFile, $iIndex, True) ;向图像列表添加图标
        _GUICtrlButton_SetImageList($hWnd, $hImage1, $nAlign) ;分配一个图像列表到按钮控件，$nAlign 是图标位置参数
EndFunc