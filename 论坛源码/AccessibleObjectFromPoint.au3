; Ссылка по которой были использованы материалы
; http://www.autoitx.com/archiver/tid-14317.html

#AutoIt3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/sf /sv /om /cs=0 /cn=0

#include <EditConstants.au3>
#include <WindowsConstants.au3>

;  opt("MustDeclareVars", 1)
Opt("GUIOnEventMode", 1)

Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
Global Const $hOLE32 = DllOpen("ole32.dll")
Global Const $hOLEACC = DllOpen("oleacc.dll")
Global Const $hOleAut = DllOpen("oleaut.dll")

Global Const $VT_I2 = 2
Global Const $VT_I4 = 3
Global Const $VT_R8 = 5
Global Const $VT_BSTR = 8
Global Const $VT_DISPATCH = 9
Global Const $VT_I1 = 16

Global Const $tagVARIANT = "ushort vt;ushort r1;ushort r2;ushort r3;uint64 data"
Global Const $tagLOOKUP_TABLE_ENTRY = "ptr name;ptr value;dword flags;"
Global Const $LOOKUP_TABLE_ENTRY_SIZE = DllStructGetSize(DllStructCreate($tagLOOKUP_TABLE_ENTRY))
Global Const $hOLEOUT = DllOpen("oleaut32.dll")
Global Const $SizeOfPtr = DllStructGetSize(DllStructCreate("ptr"))

Global $aCall, $oIAccesible
Global $oChild

Global Const $__Au3Obj_tagVARIANT = "ushort vt;ushort r1;ushort r2;ushort r3;ptr data; ptr"
Global $tVar = DllStructCreate($__Au3Obj_tagVARIANT)
Global $pVar = DllStructGetPtr($tVar)

Global $myEdit, $aMPx, $aMPy, $TmpEdit, $sbl=ChrW('0x25CF'), $sep=ChrW('0x25BA')&' '

GUICreate('Элемент под курсором')
$myEdit = GUICtrlCreateEdit("First line" & @CRLF, 10, 10, 380, 330, $ES_AUTOVSCROLL + $WS_VSCROLL)
GUISetOnEvent(-3, "_Quit")
GUISetState()
__Au3Obj_VariantInit($pVar)

While 1
	_GetInfo()
	Sleep(200)
WEnd

Func _GetInfo()
	Local $aMousePos, $aRoleCall, $oIAccesible, $tInfo, $tmp
	$aMousePos = MouseGetPos()
	If $aMPx = $aMousePos[0] And $aMPy = $aMousePos[1] Then ; 如果鼠标坐标未改变，则什么都不做
		Return
	Else
		$aMPx = $aMousePos[0]
		$aMPy = $aMousePos[1]
	EndIf

	$aCall = DllCall($hOLEACC, "int", "AccessibleObjectFromPoint", _
			"int", $aMousePos[0], _
			"int", $aMousePos[1], _
			"ptr*", 0, _
			"ptr", $pVar)

	If @error Or $aCall[0] <> 0 Then
		; Ошибка в получении доступа
		Sleep(200)
		Return
	EndIf
	$oIAccesible = __Au3Obj_ConvertPtrToIDispatch($aCall[3]) ; Создаёт IDispatch при отсутствии ошибок

	If IsObj($oIAccesible) Then ; 如果是一个对象

		$oChild = Execute(COMVariantToValue($pVar)) ; int64 в int32
		$tInfo = ''
		; $tInfo &= $sbl & " Событие: " &@Tab&$sep& $oIAccesible.accDefaultAction($oChild) & @CRLF
		$tInfo &= $sbl & " Описание системных элементов: " &@Tab&$sep& $oIAccesible.accDescription($oChild) & @CRLF
		$tInfo &= $sbl & ' 列表中的项目编号: ' &@Tab&$sep& $oChild & @CRLF
		$tInfo &= $sbl & " >>> Текст: " &@Tab&$sep& $oIAccesible.accName($oChild) & @CRLF
		; Dim $sText

		; 获取元素类型的文字描述（按钮，编辑框，单选按钮，复选框）
		$aRoleCall = DllCall($hOLEACC, "int", "GetRoleText", "DWORD", $oIAccesible.accRole($oChild), "str", '', "int", 255)
		$tInfo &= $sbl & " 项目类型: " &@Tab&$sep& $oIAccesible.accRole($oChild) & " : " & $aRoleCall[2] & @CRLF
		$tInfo &= $sbl & " 条件: " &@Tab&$sep& $oIAccesible.accState($oChild) & @CRLF
		$tInfo &= $sbl & " 内容: " &@Tab&$sep& $oIAccesible.accValue($oChild) & @CRLF

		If Not($TmpEdit == $tInfo) Then
			$TmpEdit = $tInfo
			GUICtrlSetData($myEdit, $tInfo)
		EndIf

	EndIf

	;  Не забудьте очистить обратный результат
	If UBound($aCall) > 3 Then __Au3Obj_VariantClear($aCall[4])
	$oIAccesible = 0 ; очистить Объект
EndFunc

; 注册输出功能的COM错误
Func MyErrFunc()
	ConsoleWrite("!Ошибка COM!   " & "Номер: " & Hex($oMyError.number, 8) & "  описание: " & $oMyError.windescription & @CRLF)
EndFunc

; В итоге мы все же хотим объект AutoIt. Эта функция преобразовывает указатель в объект AutoIt
Func ConvertPtrToIDispatch($pIDispatch)
	; Это было бы в 10000 раз проще, если бы autoit поддерживал тип idispatch* в dllstructs...
	; К счастью memcpy может скопировать указатель в idispatch*, повезло нам.
	Local $aCall = DllCall("kernel32.dll", "none", "RtlMoveMemory", _
			"idispatch*", 0, _
			"ptr*", $pIDispatch, _
			"dword", 4)

	If @error Then
		Return SetError(1, 0, 0)
	EndIf

	Return $aCall[1]

EndFunc

Func __Au3Obj_ConvertPtrToIDispatch($pIDispatch)
	; Автор: monoceres
	Local $iSize = 4 + (4 * @AutoItX64)
	Local $aCall = DllCall("kernel32.dll", "none", "RtlMoveMemory", "idispatch*", 0, "ptr*", $pIDispatch, "dword", $iSize)
	If @error Then Return SetError(1, 0, 0)
	Return $aCall[1]
EndFunc

Func __Au3Obj_VariantClear($pvarg)
	; Автор: Prog@ndy
	Local $aCall = DllCall($hOleAut, "long", "VariantClear", "ptr", $pvarg)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc

Func __Au3Obj_VariantInit($pvarg)
	; Автор: Prog@ndy
	Local $aCall = DllCall($hOleAut, "long", "VariantInit", "ptr", $pvarg)
	If @error Then Return SetError(1, 0, 1)
	Return $aCall[0]
EndFunc

Func VTType2AutoitType($iVT_Type)
	Switch $iVT_Type
		Case $VT_I1
			Return "byte"
		Case $VT_I2
			Return "short"
		Case $VT_I4
			Return "int"
		Case $VT_BSTR
			Return "wstr"
		Case $VT_R8
			Return "double"
		Case $VT_DISPATCH
			Return "idispatch"
	EndSwitch
EndFunc

Func COMVariantToValue($pVariant)
	Local $hVariant = DllStructCreate($tagVARIANT, $pVariant)
	; Translate the vt id to a autoit dllcall type
	$sType = VTType2AutoitType(DllStructGetData($hVariant, "vt"))

	If $sType = "wstr" Then
		$pString = DllStructCreate("ptr", DllStructGetPtr($hVariant, "data"))
		; Getting random crashes when trusting autoit to automatically use right size.
		; doing it myself instead (also, it should be a BSTR, but it's not. Is autoit not obeying the rules!?
		$iString_Size = wcslen(DllStructGetData($pString, 1))

		; Sorry trancexx, doesn't seem to work on large strings (crashes like crazy when trying to use on 1 MB string)
		;$tSub = DllStructCreate("dword", DllStructGetData($str_ptr, 1) - 4) ; <- move pointer back 4 bytes!

		$hData = DllStructCreate("wchar[" & $iString_Size & "]", DllStructGetData($pString, 1))

	ElseIf $sType = "idispatch" Then

		Return ConvertPtrToIDispatch(DllStructGetData(DllStructCreate("ptr", DllStructGetPtr($hVariant, "data")), 1))

	Else
		$hData = DllStructCreate($sType, DllStructGetPtr($hVariant, "data"))
	EndIf

	Return DllStructGetData($hData, 1)
EndFunc

; Find out length of string. I do not trust autoit to do this.
Func wcslen($pWString)
	$aCall = DllCall("ntdll.dll", "dword:cdecl", "wcslen", "ptr", $pWString)
	Return $aCall[0]
EndFunc

Func _Quit()
	Exit
EndFunc