;~ 关于虚拟列表的一份说明
;~ http://blog.vckbase.com/iwaswzq/archive/2006/07/07/21113.aspx

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_UseX64=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

Local $tText = DllStructCreate("char Text[261]");建个结构，用来放listview列数据
Local $GUI, $hImage, $iITEM_COUNT = 10000000

$hGUI = GUICreate("ListView虚拟列表 加载[" & $iITEM_COUNT & "]数据", 500, 300)
$hListView = GUICtrlCreateListView("Item1|nSubItem1|nSubItem2", 2, 2, 494, 294, $LVS_SHOWSELALWAYS + $LVS_OWNERDATA, $LVS_EX_GRIDLINES + $LVS_EX_FULLROWSELECT + $LVS_EX_DOUBLEBUFFER)
;设置列宽
GUICtrlSendMsg($hListView, $LVM_SETCOLUMNWIDTH, 0, 150)
GUICtrlSendMsg($hListView, $LVM_SETCOLUMNWIDTH, 1, 150)
GUICtrlSendMsg($hListView, $LVM_SETCOLUMNWIDTH, 2, 150)

GUICtrlSendMsg($hListView, $LVM_SETITEMCOUNT, $iITEM_COUNT, 0);分配列表内存。 为什么要这样做？因为虚拟列表必须要知道数据总量

_GUICtrlListView_SetUnicodeFormat($hListView, False);设置为 ANSI 字符

;创建并关联图像列表
$hImage = _GUIImageList_Create()
_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 115)
_GUICtrlListView_SetImageList($hListView, $hImage, 1)
GUISetState()

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE
GUIDelete()

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo, $s

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $iIDFrom
		Case $hListView
			Switch $iCode
				Case - 150, -177 ;$LVN_GETDISPINFOA = -150, $LVN_GETDISPINFOW = -177
					$tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam)
					IF DllStructGetData($tInfo, "SubItem") THEN;子列
						IF BitAND(DllStructGetData($tInfo, "Mask"), $LVIF_TEXT) Then ;字符缓冲区
							IF DllStructGetData($tInfo, "SubItem") = 1 THEN;子列1
								$s =  "nSubItem1_"
							ELSEIF DllStructGetData($tInfo, "SubItem") = 2 THEN;子列2
								$s = "nSubItem2_"
							ENDIF
						ENDIF
					ELSE
						IF BitAND(DllStructGetData($tInfo, "Mask"), $LVIF_TEXT) Then ;字符缓冲区
							$s = "nItem"
							IF BitAND(DllStructGetData($tInfo, "Mask"), $LVIF_IMAGE) THEN DllStructSetData($tInfo, "Image", 0);设置列图像
;~ 							IF BitAND(DllStructGetData($tInfo, "Mask"), $LVIF_INDENT) THEN DllStructSetData($tInfo, "Indent", 0);设置列缩进
;~ 							IF BitAND(DllStructGetData($tInfo, "Mask"), $LVIF_STATE) THEN DllStructSetData($tInfo, "state", 0);设置列状态
						ENDIF
					ENDIF
					$s &= DllStructGetData($tInfo, "Item")
					DllStructSetData($tText, 1, $s);列数据放入$tText结构
					DllStructSetData($tInfo, "Text", DllStructGetPtr($tText));用$tText结构的指针来设置列数据
					DllStructSetData($tInfo, "TextMax", StringLen($s));设置列数据长度
			Case - 113 ;$LVN_OCACHEHINT = -113
				;缓存  还没弄懂这玩意
;~ 				Local $tInfo = DllStructCreate("hwnd hForm;int iForm;int iCode;int iFrom;int iTo", $ilParam)
;~ 				Local $iFrom = DllStructGetData($tInfo, "iFrom")
;~ 				Local $iTo = DllStructGetData($tInfo, "iTo")
;~ 				ConsoleWrite('chache: from ' & $iFrom & ' to ' & $iTo & @CRLF)
			Case -152, -179; $LVN_ODFINDITEM = -152, $LVN_ODFINDITEMW = -179
				;搜索 还没弄清这个是怎么玩的
;~ 				$tInfo = DllStructCreate($tagNMLVFINDITEM, $ilParam)
;~ 				If Not BitAND(DllStructGetData($tInfo, "Flags"), $LVFI_STRING) Then Return
;~ 				Local $iStartPos = DllStructGetData($tInfo, "Start") ;查找的起始位置
;~ 				If $iStartPos >= GUICtrlSendMsg($hListView, $LVM_GETITEMCOUNT, 0, 0) Then $iStartPos = 0 ;判断是否在最后一行
;~ 				Local $iResult = -1,$iCurrentPos = $iStartPos
;~ 				Local $sSearch = _GUICtrlListView_GetISearchString($hListView)
;~ 				Local $iSearch = StringLen($sSearch)
;~ 				ToolTip($sSearch)
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
