;���� ������ version 1.0
;ʹ��mshtml����html
#cs
;���к�����_MH��ͷ���������Ƹ�IE����һ��
;~ �����б�:
 ;~ _MHDocGetObj() ;����documetn����
;~ _MHDocWriteHTML(ByRef $mh_doc, $s_html) ;д��html����
;~ _MHNavigate(ByRef $mh_doc, $mh_url, $mh_flag = 1) ;����urlԴ��,��д�뵽����
;~ _MHGetObjById(ByRef $mh_doc, $s_Id) ;����id���ض���,��������_IEGetObjById����
;~ _MHGetObjByName(ByRef $mh_doc, $s_name, $i_index = 0) ;����name���ض���,��������_IEGetObjByName����
#ce

#include-once

Func _MHDocGetObj()
	Local $sCLSID = "{25336920-03F9-11CF-8FD0-00AA00686F13}" ;CLSID_HTMLDocument
	Local $sIID = "{332c4425-26cb-11d0-b483-00c04fd90119}" ;IID_IHTMLDocument2
	Local $html = ObjCreateInterface($sCLSID, $sIID)
	If @error Then Return SetError(@error, 0, 0)
	$html.designMode = "on" ;���ÿɱ��༭
	Return $html
EndFunc   ;==>_MHDocGetObj

Func _MHDocWriteHTML(ByRef $mh_doc, $s_html)
	If Not IsObj($mh_doc) Then Return SetError(1, 0, 0)
	$mh_doc.write($s_html)
EndFunc   ;==>_MHDocWriteHTML

;~ $mh_flag ����
;~ [��ѡ] ָ�����ת������������:
;~ 1 = (Ĭ��ֵ) ����������Ϊ ANSI ����
;~ 2 = ����������Ϊ UTF16 С����
;~ 3 = ����������Ϊ UTF16 �����
;~ 4 = ����������Ϊ UTF8 ����
Func _MHNavigate(ByRef $mh_doc, $mh_url, $mh_flag = 1)
	If Not IsObj($mh_doc) Then Return SetError(1, 0, 0)
	Local $iRead = InetRead($mh_url, 1)
	If @error Then Return SetError(2, 0, 0)
	Local $sWrite = BinaryToString($iRead, $mh_flag)
	$mh_doc.write($sWrite)
;~ 	$mh_doc.location = $mh_url
EndFunc   ;==>_MHNavigate

Func _MHGetObjById(ByRef $mh_doc, $s_Id)
	If Not IsObj($mh_doc) Then Return SetError(1, 0, 0)
	Local $mh_obj = $mh_doc.getElementById($s_Id)
	If IsObj($mh_obj) Then
		Return $mh_obj
	Else
		Return SetError(2, 0, 0)
	EndIf
EndFunc   ;==>_MHGetObjById

Func _MHGetObjByName(ByRef $mh_doc, $s_name, $i_index = 0)
	If Not IsObj($mh_doc) Then Return SetError(1, 0, 0)
	$i_index = Number($i_index)
	If $i_index = -1 Then
		Return SetError(0, $mh_doc.GetElementsByName($s_name).length, _
				$mh_doc.GetElementsByName($s_name))
	Else
		If IsObj($mh_doc.GetElementsByName($s_name).item($i_index)) Then
			Return SetError(0, $mh_doc.GetElementsByName($s_name).length, _
					$mh_doc.GetElementsByName($s_name).item($i_index))
		Else
			Return SetError(2, 0, 0)
		EndIf
	EndIf
EndFunc   ;==>_MHGetObjByName
