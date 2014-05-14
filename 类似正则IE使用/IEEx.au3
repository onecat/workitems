;作者：风行者  version 3.1
;适用于AutoIt Version : 3.3.9++

#include-once
#include <IE.au3>
#include <ClipBoard.au3>
#include <ScreenCapture.au3>

;~ 大部分函数成功返回1，失败返回0并设置@error的值
;~ @error: 1 - 无效数据类型
;~ 2 - 无效对象类型
;~ 3 - 等待加载超时
;~ 4 - 9 - 其它错误，具体看函数说明

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

Func _IESaveImg($o_hwnd, ByRef $o_object, ByRef $oImg, $oSaveName, $flag = 1) ;保存图片，一般用于验证码图片保存
	If (Not IsObj($o_object)) Or (Not IsObj($oImg)) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	Local $hCtrl = ControlGetHandle($o_hwnd, "", "Internet Explorer_Server1")
	If Not IsHWnd($hCtrl) Then Return SetError(4, 0, 0) ;找不到控件句柄
	
	Switch $flag
		Case 1 ;后台 (au3版本不一样，后台可能不成功)
			Local $oControlRange = $o_object.Document.body.createControlRange()
			$oControlRange.add($oImg)
			Local $ClipData = ClipGet()
			If Not $oControlRange.execCommand("Copy") Then Return SetError(5, 0, 0) ;复制失败
			If Not _ClipBoard_IsFormatAvailable($CF_BITMAP) Then Return SetError(6, 0, 0) ;不是bmp图片数据
			If Not _ClipBoard_Open($hCtrl) Then Return SetError(7, 0, 0) ;打开剪贴板失败
			Local $hBitmap = _ClipBoard_GetDataEx($CF_BITMAP)
			_ScreenCapture_SaveImage($oSaveName, $hBitmap)
			_ClipBoard_Close()
		Case 2 ;前台
			;截图
			_IEscrollIntoView($oImg)
			WinActivate($hCtrl)
			Sleep(1000)
			;元素矩形
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

Func _IEDoScript($o_js, $o_func, $o_langue = "javascript") ;创建脚本对象执行脚本
	Local $msc = ObjCreate("ScriptControl")
	$msc.Language = $o_langue
	$msc.AddCode($o_js)
	Return $msc.eval($o_func)
EndFunc   ;==>_IEDoScript

Func _IEScroll(ByRef $o_object, $o_x, $o_y) ;_IEScroll(IE对象,x坐标,y坐标) 将窗口滚动到自左上角起指定的x和y偏移量
	If Not IsObj($o_object) Then Return SetError(1, 0, 0)
	If Not __IEIsObjType($o_object, "browser") Then Return SetError(2, 0, 0)
	$o_object.document.parentWindow.scroll($o_x, $o_y)
	Return 1
EndFunc   ;==>_IEScroll


;~ object.doScroll( [sScrollAction])

;~ 参数 Parameters
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

;~ _IEScrollClick(滚动条所属对象, 模拟的动作)
Func _IEScrollClick(ByRef $o_object, $sScrollAction) ;模拟点击滚动条
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

Func _IEscrollIntoView(ByRef $o_Ele, $bAlignToTop = False) ;_IEscrollIntoView(元素对象,$bAlignToTop = False)将对象滚动到可见范围。$bAlignToTop = True将其排列到窗口顶部,$bAlignToTop = False 窗口底部
	If Not IsObj($o_Ele) Then Return SetError(1, 0, 0)
	$o_Ele.scrollIntoView($bAlignToTop)
	Return 1
EndFunc   ;==>_IEscrollIntoView

Func _IEWaitEle(ByRef $o_object, $o_id, $complete = True, $TimeOut = $__IELoadWaitTimeout) ;_IEWaitEle(IE对象,元素id或name,是否等待加载完成,超时值)
	If Not IsObj($o_object) Then Return SetError(1, 0, 0) ;不是对象
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
	Return SetError(3, 0, 0) ;超时@error=3
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

Func _IEQuery(ByRef $o_object, $_Eletag, $_Elepro, $_mod = 1, $_Flag = True) ;_IEQuery(IE对象,标签名,属性列表,匹配模式=1,标志)
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
	;开始查找元素对象
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
				Case 1 ;完全匹配
					If $IE_pertyGet <> String($_Ele_Os[$j][1]) Then
						ContinueLoop 2 ;不相等下一个元素
					EndIf
				Case 2 ;部分匹配
					If Not StringInStr($IE_pertyGet, String($_Ele_Os[$j][1])) Then
						ContinueLoop 2 ;不相等下一个元素
					EndIf
				Case 3 ;正则匹配
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
			Return SetError(0, 0, $IE_array) ;成功返回元素对象数组
		Else
			Return SetError(0, 0, $IE_array[1]) ;只返回找到的第一个元素
		EndIf
	Else
		Return SetError(2, 0, 0) ;失败返回0，找不到元素
	EndIf
EndFunc   ;==>_IEQuery