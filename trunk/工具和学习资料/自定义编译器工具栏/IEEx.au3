;���ߣ�������  version 2.0
#include-once
#include <IE.au3>
#include <ClipBoard.au3>
#include <ScreenCapture.au3>

Func _IEExecScript(ByRef $o_object, $o_script, $o_langue = "javascript")
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	$o_object.document.parentwindow.execscript($o_script, $o_langue)
	Return 1
EndFunc   ;==>_IEExecScript

Func _IESaveImg(ByRef $o_object,ByRef $oImg,$oSaveName)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not IsObj($oImg) Then Return SetError(2, 0, 0)
	Local $oControlRange = $o_object.Document.body.createControlRange()
	$oControlRange.add($oImg)
	Local $ClipData = ClipGet()
	If Not $oControlRange.execCommand("Copy") Then Return SetError(3,0,0)
	If Not _ClipBoard_IsFormatAvailable($CF_BITMAP) Then Return SetError(4,0,0)
	_ClipBoard_Open(0)
	Local $hBitmap = _ClipBoard_GetDataEx($CF_BITMAP)
	_ScreenCapture_SaveImage($oSaveName, $hBitmap)
	_ClipBoard_Close()
	Return 1
EndFunc   ;==>code

Func _IEEvalScript(ByRef $o_object, $o_script, $o_langue = "javascript")
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	Return $o_object.document.parentwindow.eval($o_script, $o_langue)
EndFunc   ;==>_IEExecScript

Func _IEDoScript($o_js,$o_func,$o_langue = "javascript") ;�����ű�����ִ�нű�
	Local $msc = ObjCreate("ScriptControl")
	$msc.Language = $o_langue
	$msc.AddCode($o_js)
	Return $msc.eval($o_func)
EndFunc

Func _IEScroll(ByRef $o_object, $o_x, $o_y) ;_IEScroll(IE����,x����,y����) �����ڹ����������Ͻ���ָ����x��yƫ����
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	$o_object.document.parentWindow.scroll($o_x, $o_y)
	Return 1
EndFunc   ;==>_IEScroll

;~ ���� Parameters

;~ sScrollAction Optional. String that specifies how the object scrolls, using one of the following values: scrollbarDown Default. Down scroll arrow is at the specified location.
;~ scrollbarHThumb Horizontal scroll thumb or box is at the specified location.
;~ scrollbarLeft Left scroll arrow is at the specified location.
;~ scrollbarPageDown Page-down scroll bar shaft is at the specified location.
;~ scrollbarPageLeft Page-left scroll bar shaft is at the specified location.
;~ scrollbarPageRight Page-right scroll bar shaft is at the specified location.
;~ scrollbarPageUp Page-up scroll bar shaft is at the specified location.
;~ scrollbarRight Right scroll arrow is at the specified location.
;~ scrollbarUp Up scroll arrow is at the specified location.
;~ scrollbarVThumb Vertical scroll thumb or box is at the specified location.
;~ down Composite reference to scrollbarDown.
;~ left Composite reference to scrollbarLeft.
;~ pageDown Composite reference to scrollbarPageDown.
;~ pageLeft Composite reference to scrollbarPageLeft.
;~ pageRight Composite reference to scrollbarPageRight.
;~ pageUp Composite reference to scrollbarPageUp.
;~ right Composite reference to scrollbarRight.
;~ up Composite reference to scrollbarUp.

Func _IEScrollClick(ByRef $o_object, $sScrollAction)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	Switch $sScrollAction
		Case "scrollbarHThumb"
			$o_object.scrollbarHThumb
		Case "scrollbarLeft"
			$o_object.scrollbarLeft
		Case "scrollbarPageDown"
			$o_object.scrollbarPageDown
		Case "scrollbarPageLeft"
			$o_object.scrollbarPageLeft
		Case "scrollbarPageRight"
			$o_object.scrollbarPageRight
		Case "scrollbarPageUp"
			$o_object.scrollbarPageUp
		Case "scrollbarRight"
			$o_object.scrollbarRight
		Case "scrollbarUp"
			$o_object.scrollbarUp
		Case "scrollbarVThumb"
			$o_object.scrollbarVThumb
		Case "down"
			$o_object.down
		Case "left"
			$o_object.left
		Case "right"
			$o_object.right
		Case "up"
			$o_object.up
		Case "pageDown"
			$o_object.pageDown
		Case "pageLeft"
			$o_object.pageDown
		Case "pageRight"
			$o_object.pageDown
		Case "pageUp"
			$o_object.pageDown
	EndSwitch
EndFunc   ;==>_IEScrollClick

Func _IEScrollGet(ByRef $o_object, $flag)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	Local $doc = $o_object.document.documentElement
	Local $of
	Switch $flag
		Case "left"
			$of = $doc.scrollLeft
		Case "top"
			$of = $doc.scrollTop
		Case "width"
			$of = $doc.scrollWidth
		Case "height"
			$of = $doc.scrollHeight
		Case Else
			$of = -1 ;�ַ�������ȷ����-1
	EndSwitch
	Return $of
EndFunc   ;==>_IEScrollGet

Func _IEscrollIntoView(ByRef $o_Ele, $bAlignToTop = False) ;_IEscrollIntoView(Ԫ�ض���,$bAlignToTop = False)������������ɼ���Χ��$bAlignToTop = True�������е����ڶ���,$bAlignToTop = False ���ڵײ�
	If Not IsObj($o_Ele) Then Return SetError(1, 0, 0)
	$o_Ele.scrollIntoView($bAlignToTop)
	Return 1
EndFunc   ;==>_IEscrollIntoView

Func _IEWaitEle(ByRef $o_object, $o_id, $complete = True, $TimeOut = 300000) ;_IEWaitEle(IE����,Ԫ��id��name,�Ƿ�ȴ��������,��ʱֵ)
	If Not IsObj($o_object) Then SetError(1, 0, 0) ;���Ƕ���
	Local $o_Init = TimerInit()
	While TimerDiff($o_Init) < $TimeOut
		$o_doc = _IEDocGetObj($o_object)
		If IsObj($o_doc) Then
			$o_Ele = _IEGetObjById($o_object, $o_id)
			If Not IsObj($o_Ele) Then $o_Ele = _IEGetObjByName($o_object, $o_id)
			
			If IsObj($o_Ele) And ((Not $complete) Or ($o_Ele.readyState == 'loaded' Or $o_Ele.readyState == 'complete')) Then
				Return $o_Ele
			EndIf
		EndIf
		Sleep(100)
	WEnd
	Return SetError(2, 0, 0) ;��ʱ@error=2
EndFunc   ;==>_IEWaitEle

Func _IEWaitQuery(ByRef $o_object, $_Eletag, $_Elepro, $_Flag = True, $complete = True, $TimeOut = 300000)
	If Not IsObj($o_object) Then SetError(1, 0, 0)
	Local $o_Init = TimerInit()
	While TimerDiff($o_Init) < $TimeOut
		$o_doc = _IEDocGetObj($o_object)
		If IsObj($o_doc) Then
			$o_Ele = _IEQuery($o_object, $_Eletag, $_Elepro, $_Flag)
			If IsObj($o_Ele) And ((Not $complete) Or ($o_Ele.readyState == 'loaded' Or $o_Ele.readyState == 'complete')) Then
				Return $o_Ele
			EndIf
		EndIf
		Sleep(100)
	WEnd
	Return SetError(2, 0, 0)
EndFunc   ;==>_IEWaitQuery

Func _IEQuery(ByRef $o_object, $_Eletag, $_Elepro, $_Flag = True) ;_IEQuery(IE����,��ǩ��,�����б�,��־)
	If Not IsObj($o_object) Then SetError(1, 0, 0)
	
	Local $_EleStr = StringSplit($_Elepro, ",")
	Local $n = $_EleStr[0] + 1
	Local $_Ele_Os[$n][$n] = [[$_EleStr[0]]]
	For $i = 1 To $_EleStr[0]
;~ 		$tsp = StringSplit($_EleStr[$i],"=")
		$tsp = StringRegExp($_EleStr[$i], '(.+?)="*(.+?)"*$', 3)
		$_Ele_Os[$i][0] = $tsp[0]
		$_Ele_Os[$i][1] = $tsp[1]
	Next
	
	Local $IE_array[1], $IE_add = 1
	;��ʼ����Ԫ�ض���
	Local $tmp_objs = _IETagNameGetCollection($o_object, $_Eletag)
	Local $IE_pertyGet = ""
	For $_tmp_obj In $tmp_objs
		For $j = 1 To $_Ele_Os[0][0]
			Switch StringLower($_Ele_Os[$j][0])
				Case "name"
					$IE_pertyGet = String($_tmp_obj.name)
				Case "id"
					$IE_pertyGet = String($_tmp_obj.id)
				Case "type"
					$IE_pertyGet = String($_tmp_obj.type)
				Case "value"
					$IE_pertyGet = String($_tmp_obj.value)
				Case "class"
					$IE_pertyGet = String($_tmp_obj.classname)
				Case "title"
					$IE_pertyGet = String($_tmp_obj.title)
				Case "outertext"
					$IE_pertyGet = String($_tmp_obj.outertext)
				Case "outerhtml"
					$IE_pertyGet = String($_tmp_obj.outerhtml)
				Case "innertext"
					$IE_pertyGet = String($_tmp_obj.innertext)
				Case "innerhtml"
					$IE_pertyGet = String($_tmp_obj.innerhtml)
				Case "href"
					$IE_pertyGet = String($_tmp_obj.href)
				Case "src"
					$IE_pertyGet = String($_tmp_obj.src)
				Case "alt"
					$IE_pertyGet = String($_tmp_obj.alt)
			EndSwitch
			
			If $IE_pertyGet <> String($_Ele_Os[$j][1]) Then
				ContinueLoop 2 ;�������һ��Ԫ��
			EndIf
		Next
		$IE_add += 1
		ReDim $IE_array[$IE_add]
		$IE_array[$IE_add - 1] = $_tmp_obj
	Next
	If $IE_add > 1 Then
		$IE_array[0] = $IE_add - 1
		If $_Flag = False Then
			Return SetError(0, 0, $IE_array) ;�ɹ�����Ԫ�ض�������
		Else
			Return SetError(0, 0, $IE_array[1]) ;ֻ�����ҵ��ĵ�һ��Ԫ��
		EndIf
	Else
		Return SetError(2, 0, 0) ;ʧ�ܷ���0
	EndIf
EndFunc   ;==>_IEQuery

