
#cs==========================================================================
	;作者： 风行者
	;version 3.0
	
	通用获取元素对象
	#include <IE.au3>
	_IEQuery(ByRef $o_object,$_Eletag,$_Elepro)
	
	参数
	$o_object InternetExplorer.Application, 窗口, 框架或者任意DOM对象的对象变量
	$_Eletag  元素标签名
	$_Elepro  元素属性列表，以逗号为分隔符
	$_Flag  标志：true 只返回找到第一个元素，false 返回找到的元素数组
	
	返回值
	成功: $_Flag=false,返回元素对象数组,数组元素的数量储存在零号元素 $IE_array[0] 中
		  $_Flag=true ，返回找到第一个元素
	失败: 返回0 并且设置@ERROR
	@Error: 0 ($_IEStatus_Success) = 无错误
	1 = 没有找到元素对象
	3 ($_IEStatus_InvalidDataType) = 无效数据类型
	4 ($_IEStatus_InvalidObjectType) = 无效对象类型
	
	注意/说明
	属性列表支持属性:name,id,type,value,class,title,outertext,outerhtml
	innertext,innerhtml,href,src,alt
	
	属性值允许使用双引号括起，特别是href属性值存在“=”号的情况，必须用双引号括起
	有些href属性值最后可能存在反杠"/"的情况
	
	
	;例子1
	#include <IE.au3>
	$oIE = _IE_Example("form")
	$oEles = _IEQuery($oIE,"input",'value=gameBasketball,type=checkbox',false) ;_IEQuery(IE对象,标签名,属性列表)
	$Ele = $oEles[1]
	MsgBox(0,"",$Ele.outerhtml)
	
	;例子2
	#include <IE.au3>
	$oIE = _IE_Example("form")
	$oEle = _IEQuery($oIE,"input",'value=gameBasketball,type=checkbox') ;_IEQuery(IE对象,标签名,属性列表)
	MsgBox(0,"",$oEle.outerhtml)
#ce==========================================================================
	
Func _IEQuery(ByRef $o_object, $_Eletag, $_Elepro, $_Flag = True) ;_IEQuery(IE对象,标签名,属性列表,标志)
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
	;开始查找元素对象
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
				ContinueLoop 2 ;不相等下一个元素
			EndIf
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
		Return SetError(1, 0, 0) ;失败返回0
	EndIf
EndFunc   ;==>_IEQuery
