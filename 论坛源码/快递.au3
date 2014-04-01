#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=Y:\galgame\Icon\icon.ico
#PRE_Compile_Both=y
#PRE_Res_Fileversion=0.0.0.0
#PRE_Res_Fileversion_AutoIncrement=y
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
;#include <array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>




#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("飞龙 - 快递查询", 362, 277, 192, 124)
$Edit1 = GUICtrlCreateEdit("欢迎使用。", 0, 0, 361, 241)
$Input1 = GUICtrlCreateInput("", 72, 248, 209, 21)
$Button1 = GUICtrlCreateButton("查看", 280, 248, 75, 25)
$Label1 = GUICtrlCreateLabel("快递单号：", 8, 248, 64, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$Num = 3575450751

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			
		Case $Button1
			$Num = GUICtrlRead($Input1)
			$getMsg = BinaryToString(InetRead("http://www.kuaidi100.com/autonumber/auto?num="&$Num,1),4);获取可能性
			$kdtype = _Gettype ($getMsg);解析
			;输出解析结果
			$output = @CRLF&"********************************************************"&@CRLF&"        您查询的快递单号为："&$Num&"。"&@CRLF&"           快递公司共有【"&$kdtype[0]&"】种可能。"&@CRLF&"            数据来自：www.kuaidi100.com"&@CRLF&"               程序作者：飞龙"&@CRLF&"********************************************************"&@CRLF
			$typenum = 1
			While $typenum <= $kdtype[0]
				$output = $output&@CRLF&"********************************************************"&@CRLF&"可能性【"&$typenum&"】：【"&$kdtype [$typenum]&"】"&@CRLF
				$getMsg = BinaryToString(InetRead("http://www.kuaidi100.com/query?type="&$kdtype [$typenum]&"&postid="&$Num,1),4)
				$typenum += 1
				
				If StringInStr ($getMsg,'"status":"201"') <> 0 Then ;此状态码表示快递不存在
					$output = $output&"    该快递公司不存在单号："&$Num&@CRLF
				Else
					$getMsgarr = _ReadkdMsg ($getMsg)
					;$output = $output&$getMsg&@CRLF;临时代码，此处数据需要解析！！！
;~ 					_ArrayDisplay($getMsgarr)
					$output = $output&"    该快递公司存在快递单号为："&$Num&"的信息，共计"&$getMsgarr[0][0]&"条。"&@CRLF&@CRLF
					$listnum = 1
					While $listnum <= $getMsgarr[0][0]
						$output = $output&"    "&$getMsgarr[$listnum][0]&"     "&$getMsgarr[$listnum][1]&@CRLF
						$listnum += 1						
					WEnd
					
				EndIf
				$output = $output&@CRLF&"********************************************************"&@CRLF
			WEnd
			GUICtrlSetData($Edit1,$output)

	EndSwitch
WEnd



Func _ReadkdMsg ($getMsg)
	Dim $arr[21][2]
	
	#cs数组用法
				【0】	【1】
		【0】数据总数  最后更新时间
		【1】更新时间	地点
		【2】更新时间	地点
		.....................
		【20】更新时间	地点
		#ce
	$arr[0][0] = 0
	$getMsg = StringTrimLeft($getMsg,StringInStr($getMsg,'"updatetime":"')+13)
	$arr[0][1] = StringLeft($getMsg,StringInStr($getMsg,'"')-1)
	;MsgBox(0,"",$getMsg )
	While 1
		
		If StringInStr($getMsg,'"time":"') <> 0 Then 
			$getMsg = StringTrimLeft($getMsg,StringInStr($getMsg,'"time":"')+7)
			;MsgBox(0,$arr[0][0]+1,$getMsg )
			$arr[$arr[0][0]+1][0] = StringLeft($getMsg,StringInStr($getMsg,'"')-1)
			$getMsg = StringTrimLeft($getMsg,StringInStr($getMsg,'"context":"')+10)
			$arr[$arr[0][0]+1][1] = StringReplace(StringLeft($getMsg,StringInStr($getMsg,'"')-1)," ","")
			$arr[0][0] += 1
		Else
			ExitLoop
		EndIf
	WEnd
	;_ArrayDisplay($arr)
	
	
	Return $arr
EndFunc






Func _Gettype ($getMsg);获取快递公司
	Dim $kdArr[11]
	$kdArr[0] = 0
	While 1
		If StringInStr($getMsg,'{"comCode":"') <> 0 Then 
			$getMsg = StringTrimLeft($getMsg,StringInStr($getMsg,'{"comCode":"')+11)
	;~ 		MsgBox(0,"",$getMsg )
			$kdArr[$kdArr[0]+1] = StringLeft($getMsg,StringInStr($getMsg,'"')-1)
			$kdArr[0] +=1
			$getMsg = StringTrimLeft($getMsg, StringInStr($getMsg,'}'))
		Else
			ExitLoop
		EndIf
	WEnd
;~ 	_ArrayDisplay($kdArr)
	Return $kdArr
EndFunc