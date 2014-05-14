;���ߣ�������  version 3.1
;������AutoIt Version : 3.3.9++

#include-once
#include <IE.au3>
#include <ClipBoard.au3>
#include <ScreenCapture.au3>

;~ �󲿷ֺ����ɹ�����1��ʧ�ܷ���0������@error��ֵ
;~ @error: 1 - ��Ч��������
;~ 2 - ��Ч��������
;~ 3 - �ȴ����س�ʱ
;~ 4 - 9 - �������󣬾��忴����˵��

Func _IEExecScript(ByRef $o_object, $o_script, $o_langue = "javascript")
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	$o_object.document.parentwindow.execscript($o_script, $o_langue)
	Return 1
EndFunc   ;==>_IEExecScript

Func _IEGet(ByRef $o_object, $o_url, $o_headers, $o_target = "_self", $o_wait = 1)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	$o_object.Navigate($o_url, 0, $o_target, Null, $o_headers)
	If $o_wait Then
		_IELoadWait($o_object)
		If @error Then Return SetError(3, 0, 0)
	EndIf
	Return 1
EndFunc   ;==>_IEGet

Func _IEPost(ByRef $o_object, $o_url, $postdata, $o_headers = @CRLF & "Content-Type: application/x-www-form-urlencoded", $o_target = "_self", $o_wait = 1)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	$o_object.Navigate($o_url, 0, $o_target, $postdata, $o_headers)
	If $o_wait Then
		_IELoadWait($o_object)
		If @error Then Return SetError(3, 0, 0)
	EndIf
	Return 1
EndFunc   ;==>_IEPost

Func _IESaveImg($o_hwnd, ByRef $o_object, ByRef $oImg, $oSaveName, $flag = 1) ;����ͼƬ��һ��������֤��ͼƬ����
	If (Not IsObj($o_object)) Or (Not IsObj($oImg)) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	Local $hCtrl = ControlGetHandle($o_hwnd, "", "Internet Explorer_Server1")
	If Not IsHWnd($hCtrl) Then Return SetError(4, 0, 0) ;�Ҳ����ؼ����
	
	Switch $flag
		Case 1 ;��̨ (au3�汾��һ������̨���ܲ��ɹ�)
			Local $oControlRange = $o_object.Document.body.createControlRange()
			$oControlRange.add($oImg)
			Local $ClipData = ClipGet()
			If Not $oControlRange.execCommand("Copy") Then Return SetError(5, 0, 0) ;����ʧ��
			If Not _ClipBoard_IsFormatAvailable($CF_BITMAP) Then Return SetError(6, 0, 0) ;����bmpͼƬ����
			If Not _ClipBoard_Open($hCtrl) Then Return SetError(7, 0, 0) ;�򿪼�����ʧ��
			Local $hBitmap = _ClipBoard_GetDataEx($CF_BITMAP)
			_ScreenCapture_SaveImage($oSaveName, $hBitmap)
			_ClipBoard_Close()
		Case 2 ;ǰ̨
			;��ͼ
			_IEscrollIntoView($oImg)
			WinActivate($hCtrl)
			Sleep(1000)
			;Ԫ�ؾ���
			Local $dLeft = $oImg.getBoundingClientRect().left
			Local $dTop = $oImg.getBoundingClientRect().top
			Local $dRight = $oImg.getBoundingClientRect().right
			Local $dBottom = $oImg.getBoundingClientRect().bottom
			_ScreenCapture_CaptureWnd($oSaveName, $hCtrl, $dLeft, $dTop, $dRight, $dBottom)
	EndSwitch
	Return 1
EndFunc   ;==>_IESaveImg

Func _IEEvalScript(ByRef $o_object, $o_script, $o_langue = "javascript")
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	Return $o_object.document.parentwindow.eval($o_script, $o_langue)
EndFunc   ;==>_IEEvalScript

Func _IEDoScript($o_js, $o_func, $o_langue = "javascript") ;�����ű�����ִ�нű�
	Local $msc = ObjCreate("ScriptControl")
	$msc.Language = $o_langue
	$msc.AddCode($o_js)
	Return $msc.eval($o_func)
EndFunc   ;==>_IEDoScript

Func _IEScroll(ByRef $o_object, $o_x, $o_y) ;_IEScroll(IE����,x����,y����) �����ڹ����������Ͻ���ָ����x��yƫ����
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	$o_object.document.parentWindow.scroll($o_x, $o_y)
	Return 1
EndFunc   ;==>_IEScroll


;~ object.doScroll( [sScrollAction])

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

;~ _IEScrollClick(��������������, ģ��Ķ���)
Func _IEScrollClick(ByRef $o_object, $sScrollAction) ;ģ����������
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	$o_object.doScroll($sScrollAction)
	Return 1
EndFunc   ;==>_IEScrollClick

Func _IEScrollGet(ByRef $o_object, $sflag = "")
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If $sflag = "" Then
		Local $sArray[4]
		With $o_object
			$sArray[0] = .scrollLeft
			$sArray[1] = .scrollTop
			$sArray[2] = .scrollWidth
			$sArray[3] = .scrollHeight
		EndWith
		Return $sArray
	EndIf
	Local $of
	With $o_object
		Switch $sflag
			Case "left"
				$of = .scrollLeft
			Case "top"
				$of = .scrollTop
			Case "width"
				$of = .scrollWidth
			Case "height"
				$of = .scrollHeight
		EndSwitch
	EndWith
	Return $of
EndFunc   ;==>_IEScrollGet

Func _IEscrollIntoView(ByRef $o_Ele, $bAlignToTop = False) ;_IEscrollIntoView(Ԫ�ض���,$bAlignToTop = False)������������ɼ���Χ��$bAlignToTop = True�������е����ڶ���,$bAlignToTop = False ���ڵײ�
	If Not IsObj($o_Ele) Then Return SetError(1, 0, 0)
	$o_Ele.scrollIntoView($bAlignToTop)
	Return 1
EndFunc   ;==>_IEscrollIntoView

Func _IEWaitEle(ByRef $o_object, $o_id, $complete = True, $TimeOut = $__IELoadWaitTimeout) ;_IEWaitEle(IE����,Ԫ��id��name,�Ƿ�ȴ��������,��ʱֵ)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0) ;���Ƕ���
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
	Return SetError(3, 0, 0) ;��ʱ@error=3
EndFunc   ;==>_IEWaitEle

Func _IEWaitQuery(ByRef $o_object, $_Eletag, $_Elepro, $_mod = 1, $_Flag = True, $complete = True, $TimeOut = $__IELoadWaitTimeout)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	Local $o_Init = TimerInit()
	While TimerDiff($o_Init) < $TimeOut
		$o_doc = _IEDocGetObj($o_object)
		If IsObj($o_doc) Then
			$o_Ele = _IEQuery($o_object, $_Eletag, $_Elepro, $_mod, $_Flag)
			If IsObj($o_Ele) And ((Not $complete) Or ($o_Ele.readyState == 'loaded' Or $o_Ele.readyState == 'complete')) Then
				Return $o_Ele
			EndIf
		EndIf
		Sleep(100)
	WEnd
	Return SetError(3, 0, 0)
EndFunc   ;==>_IEWaitQuery

Func _IEQuery(ByRef $o_object, $_Eletag, $_Elepro, $_mod = 1, $_Flag = True) ;_IEQuery(IE����,��ǩ��,�����б�,ƥ��ģʽ=1,��־)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	
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
			If StringLower($_Ele_Os[$j][0]) = "class" Then
				$IE_pertyGet = String($_tmp_obj.getAttribute("classname"))
			Else
				$IE_pertyGet = String($_tmp_obj.getAttribute(StringLower($_Ele_Os[$j][0])))
			EndIf
			Switch $_mod
				Case 1 ;��ȫƥ��
					If $IE_pertyGet <> String($_Ele_Os[$j][1]) Then
						ContinueLoop 2 ;�������һ��Ԫ��
					EndIf
				Case 2 ;����ƥ��
					If Not StringInStr($IE_pertyGet, String($_Ele_Os[$j][1])) Then
						ContinueLoop 2 ;�������һ��Ԫ��
					EndIf
				Case 3 ;����ƥ��
					StringRegExp($IE_pertyGet, String($_Ele_Os[$j][1]), 3)
					If @error Then ContinueLoop 2
			EndSwitch
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
		Return SetError(2, 0, 0) ;ʧ�ܷ���0���Ҳ���Ԫ��
	EndIf
EndFunc   ;==>_IEQuery