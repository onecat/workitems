
#cs==========================================================================
	;���ߣ� ������
	;version 3.0
	
	ͨ�û�ȡԪ�ض���
	#include <IE.au3>
	_IEQuery(ByRef $o_object,$_Eletag,$_Elepro)
	
	����
	$o_object InternetExplorer.Application, ����, ��ܻ�������DOM����Ķ������
	$_Eletag  Ԫ�ر�ǩ��
	$_Elepro  Ԫ�������б��Զ���Ϊ�ָ���
	$_Flag  ��־��true ֻ�����ҵ���һ��Ԫ�أ�false �����ҵ���Ԫ������
	
	����ֵ
	�ɹ�: $_Flag=false,����Ԫ�ض�������,����Ԫ�ص��������������Ԫ�� $IE_array[0] ��
		  $_Flag=true �������ҵ���һ��Ԫ��
	ʧ��: ����0 ��������@ERROR
	@Error: 0 ($_IEStatus_Success) = �޴���
	1 = û���ҵ�Ԫ�ض���
	3 ($_IEStatus_InvalidDataType) = ��Ч��������
	4 ($_IEStatus_InvalidObjectType) = ��Ч��������
	
	ע��/˵��
	�����б�֧������:name,id,type,value,class,title,outertext,outerhtml
	innertext,innerhtml,href,src,alt
	
	����ֵ����ʹ��˫���������ر���href����ֵ���ڡ�=���ŵ������������˫��������
	��Щhref����ֵ�����ܴ��ڷ���"/"�����
	
	
	;����1
	#include <IE.au3>
	$oIE = _IE_Example("form")
	$oEles = _IEQuery($oIE,"input",'value=gameBasketball,type=checkbox',false) ;_IEQuery(IE����,��ǩ��,�����б�)
	$Ele = $oEles[1]
	MsgBox(0,"",$Ele.outerhtml)
	
	;����2
	#include <IE.au3>
	$oIE = _IE_Example("form")
	$oEle = _IEQuery($oIE,"input",'value=gameBasketball,type=checkbox') ;_IEQuery(IE����,��ǩ��,�����б�)
	MsgBox(0,"",$oEle.outerhtml)
#ce==========================================================================
	
Func _IEQuery(ByRef $o_object, $_Eletag, $_Elepro, $_Flag = True) ;_IEQuery(IE����,��ǩ��,�����б�,��־)
	If Not IsObj($o_object) Then
		__IEErrorNotify("Error", "_IEPropertyGet", "$_IEStatus_InvalidDataType")
		Return SetError($_IEStatus_InvalidDataType, 1, 0)
	EndIf
	If Not __IEIsObjType($o_object, "browserdom") Then
		__IEErrorNotify("Error", "_IEPropertyGet", "$_IEStatus_InvalidObjectType")
		Return SetError($_IEStatus_InvalidObjectType, 1, 0)
	EndIf
	
	Local $_EleStr = StringSplit($_Elepro, ",")
	Local $n = $_EleStr[0] + 1
	Local $_Ele_Os[$n][$n] = [[$_EleStr[0]]]
	For $i = 1 To $_EleStr[0]
;~ 		$tsp = StringSplit($_EleStr[$i],"=")
		$tsp = StringRegExp($_EleStr[$i], '(.+?)="?([^"]+)"?$', 3)
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
		Return SetError(1, 0, 0) ;ʧ�ܷ���0
	EndIf
EndFunc   ;==>_IEQuery
