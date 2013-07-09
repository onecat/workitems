#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <GuiScrollBars.au3>
#include <ScrollBarConstants.au3>

Chart()

Func Chart()
    Local $gui = GUICreate("统计图表例子", 1000, 660)
    GUISetBkColor(0xffffff)
    $arNames=StringSplit("花生奶|红枣奶|纯奶|酸奶|甜奶","|",2)
	Local $arr[1][13]
	For $i=0 To UBound($arNames)-1
		ReDim $arr[$i+1][13]
		$arr[$i][0] = $arNames[$i]
		For $j=1 To 12
			$arr[$i][$j] = Random(0,300,1)
		Next
	Next
    _CreateLineChart($arr, "统计图表例子","折线图",-1,-1,980, 310)
	
	Local $arValues[UBound($arNames)]
	For $i=0 To UBound($arNames)-1
        $arValues[$i]=Random(0,200,1)
    Next
	_CreateBarChart($arNames, $arValues, "统计图表例子","柱状图",-1,320,980,310)
    GUISetState()
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                GUIDelete($gui)
				Exit
        EndSwitch
    WEnd
EndFunc

;折线图
;修改于柱状图
Func _CreateLineChart($arrValues, $sTitle1="",$sTitle2="",$iX=20,$iY=20,$iW=400,$iH=400)
    Local $max=_2DArrayMax($arrValues);取2维数组的最大值，用来确定Y轴比例
    Local $arrColours[UBound($arrValues)]
    For $i=0 To UBound($arrValues)-1
        $arrColours[$i]=(Random(100, 255, 1) * 0x10000) + (Random(100, 255, 1) * 0x100) + Random(100, 255, 1)
    Next
    ;set default values for the frame
    If $iX=-1 Then $iX=10
    If $iY=-1 Then $iY=10
    If $iW=-1 Then $iW=400
    If $iH=-1 Then $iH=400
    ;create frame for the chart
    $grp = GUICtrlCreateGroup("", $iX, $iY, $iW, $iH)
    ;title
    GUICtrlCreateLabel($sTitle1,$iX+15, $iY+10,$iW-30,-1,$SS_CENTER)
    GUICtrlSetColor(-1,0x002244)
    GUICtrlSetFont(-1, 9, 800, 0, "Arial")
    GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    GUICtrlCreateLabel($sTitle2,$iX+15, $iY+25,$iW-30,-1,$SS_CENTER)
    GUICtrlSetColor(-1,0x002244)
    GUICtrlSetFont(-1, 8, 800, 0, "Arial")
    GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Local $Canvas
	$Canvas = _CreateBarCanvas($iX+15, $iY+15, $iW-50, $iH-60)
	Local $arrMon=StringSplit("一|二|三|四|五|六|七|八|九|十|十一|十二","|",2)
	For $i=0 To UBound($arrMon)-1
		GUICtrlCreateLabel($arrMon[$i]&"月",$iX+52+(($Canvas[2]/UBound($arrMon)))*$i+5, $iY+$iH-30)
		GUICtrlSetColor(-1,0x990000)
		GUICtrlSetFont(-1, 8, 800, 0, "Arial")
		GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
	Next
	$i=0
    For $i=0 To UBound($arrValues)-1
		For $j = 1 To UBound($arrValues,2)-1
		Local $Graphic = GUICtrlCreateGraphic($Canvas[0]-0.5*$Canvas[4], $Canvas[1]+0.5*$Canvas[4], $Canvas[2], $Canvas[3],0)	
		GUICtrlSetGraphic($Graphic, $GUI_GR_COLOR, $arrColours[$i], $arrColours[$i])
		GUICtrlSetGraphic($Graphic, $GUI_GR_ELLIPSE, 25+($Canvas[2]/(UBound($arrValues,2)-1))*($j-1), -2+$Canvas[3]-($Canvas[3]/_RoundUp($max))*$arrValues[$i][$j],5,5)
		If $j=1 Then
			GUICtrlCreateLabel($arrValues[$i][0],103+($Canvas[2]/(UBound($arrValues,2)-1))*($j-1), 75+$Canvas[3]-($Canvas[3]/_RoundUp($max))*$arrValues[$i][$j],120)
			GUICtrlSetColor(-1,$arrColours[$i])
			GUICtrlSetFont(-1, 10, 800, 0, "Arial")
			GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
			GUICtrlSetGraphic($Graphic, $GUI_GR_MOVE, 27, -2+$Canvas[3]-($Canvas[3]/_RoundUp($max))*$arrValues[$i][1])
		EndIf
		If $j<UBound($arrValues,2) Then
			GUICtrlSetGraphic($Graphic, $GUI_GR_COLOR, $arrColours[$i])
			GUICtrlSetGraphic($Graphic, $GUI_GR_LINE, 27+($Canvas[2]/(UBound($arrValues,2)-1))*($j-1), -2+$Canvas[3]-($Canvas[3]/_RoundUp($max))*$arrValues[$i][$j],5,5)
		EndIf
		GUICtrlCreateLabel($arrValues[$i][$j],$Canvas[0]+($Canvas[2]/(UBound($arrValues,2)-1))*($j-1), $Canvas[1]+$Canvas[3]+$Canvas[4]-10-($Canvas[3]/_RoundUp($max))*$arrValues[$i][$j])
        GUICtrlSetColor(-1,0x002244)
        GUICtrlSetFont(-1, 7, 800, 0, "Arial")
        GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
		Next
		GUICtrlSetGraphic(-1,$GUI_GR_REFRESH)
    Next
    ;Y Axis
    For $i=0 To $Canvas[3] Step $Canvas[3]/5
        GUICtrlCreateLabel(($i/$Canvas[3])*_RoundUp($max),$Canvas[0]-65,$Canvas[1]+$Canvas[3]+$Canvas[4]-$i,30,-1,$SS_RIGHT)
        GUICtrlSetColor(-1,0x990000)
        GUICtrlSetFont(-1, 8, 800, 0, "Arial")
        GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc

Func _2DArrayMax($arr)
	Local $arrMax[UBound($arr,1)]
	Local $arrTmp[UBound($arr,2)]
	For $i=0 To UBound($arr,1) - 1
		For $j = 0 To UBound($arr,2)-1
			$arrTmp[$j]=$arr[$i][$j]
		Next
		$arrMax[$i]=_ArrayMax($arrTmp,1)
	Next
	Return _ArrayMax($arrMax,1)
EndFunc

;柱状图
;来自论坛的代码，调整了一些地方
Func _CreateBarChart($arNames, $arValues, $sTitle1="", $sTitle2="", $iX=20, $iY=20, $iW=400, $iH=400)
    Local $max=_ArrayMax($arValues,1);compare numerically
    ;Local $values = UBound($arValues)
    Local $arColours[UBound($arNames)]
    Local $color
    For $i=0 To UBound($arValues)-1
        $color = (Random(100, 255, 1) * 0x10000) + (Random(100, 255, 1) * 0x100) + Random(100, 255, 1)
        $arColours[$i]=$color
    Next
    ;set default values for the frame
    If $iX=-1 Then $iX=10
    If $iY=-1 Then $iY=10
    If $iW=-1 Then $iW=400
    If $iH=-1 Then $iH=400
	$iW=$iW-30
    ;create frame for the chart
    Local $grp = GUICtrlCreateGroup("", $iX, $iY, $iW+30, $iH)
    ;title
    GUICtrlCreateLabel($sTitle1,$iX+15, $iY+10,$iW-30,-1,$SS_CENTER)
    GUICtrlSetColor(-1,0x002244)
    GUICtrlSetFont(-1, 9, 800, 0, "Arial")
    GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    GUICtrlCreateLabel($sTitle2,$iX+15, $iY+25,$iW-30,-1,$SS_CENTER)
    GUICtrlSetColor(-1,0x002244)
    GUICtrlSetFont(-1, 8, 800, 0, "Arial")
    GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Local $Canvas
    If IsString($arNames[1]) Then
        $Canvas = _CreateBarCanvas($iX+15, $iY+15, $iW-110, $iH-60)
        GUICtrlCreateGroup("", $Canvas[0]+$Canvas[2]+15, $Canvas[1]-5, ($iW-$Canvas[2])/2+15, $Canvas[3]+$Canvas[4]+5)
        For $i=0 To UBound($arNames)-1
            GUICtrlCreateLabel($i+1 & " " & $arNames[$i],$Canvas[0]+$Canvas[2]+25, $Canvas[1]+10+(($Canvas[3]+$Canvas[4]-15)/UBound($arNames))*$i,($iW-$Canvas[2])/2-5,13,$SS_CENTER)
            GUICtrlSetColor(-1,$arColours[$i]-0x545454)
            GUICtrlSetFont(-1, 8, 800, 0, "Arial")
            GUICtrlSetBkColor(-1,$arColours[$i])			

            GUICtrlCreateLabel($i+1,$iX+52+(($Canvas[2]/UBound($arNames)))*$i+8, $iY+$iH-30)
            GUICtrlSetColor(-1,0x990000)
            GUICtrlSetFont(-1, 8, 800, 0, "Arial")
            GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)			
        Next
        GUICtrlCreateGroup("", -99, -99, 1, 1)
    Else
        $Canvas = _CreateBarCanvas($iX+15, $iY+15, $iW-50, $iH-60)
        For $i=0 To UBound($arNames)-1
            GUICtrlCreateLabel($arNames[$i],$iX+52+(($Canvas[2]/UBound($arNames)))*$i+8, $iY+$iH-30)
            GUICtrlSetColor(-1,0x990000)
            GUICtrlSetFont(-1, 8, 800, 0, "Arial")
            GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
        Next
    EndIf
    ;draw the bars
    GUICtrlCreateGraphic($Canvas[0]-0.5*$Canvas[4], $Canvas[1]+0.5*$Canvas[4], $Canvas[2], $Canvas[3],0)
    For $i=0 To UBound($arValues)-1
        For $j=$Canvas[4]/2.5 To 0 Step -0.5
            GUICtrlSetGraphic(-1, $GUI_GR_COLOR, $arColours[$i]-0x333333, $arColours[$i])
            GUICtrlSetGraphic(-1, $GUI_GR_RECT, 5+($Canvas[2]/UBound($arValues))*$i+$j, -2+$Canvas[3]-$j, 0.5*($Canvas[2]/UBound($arValues)), -($Canvas[3]/_RoundUp($max))*$arValues[$i])
        Next
    Next
    GUICtrlSetGraphic(-1,$GUI_GR_REFRESH)
    For $i=0 To UBound($arValues)-1
        ;values from the top of the bars
;~         GUICtrlCreateLabel($arValues[$i],$Canvas[0]+($Canvas[2]/UBound($arValues))*$i, $iH-$Canvas[1]+$Canvas[4]-10-(($Canvas[3]/_RoundUp($max))*$arValues[$i]));这行有BUG，数值的高度计算有问题
		GUICtrlCreateLabel($arValues[$i],$Canvas[0]+($Canvas[2]/UBound($arValues))*$i, $Canvas[1]+$Canvas[3]+$Canvas[4]-20-($Canvas[3]/_RoundUp($max))*$arValues[$i]);这是上一行的修正 By Crossdoor
        GUICtrlSetColor(-1,0x002244)
        GUICtrlSetFont(-1, 7, 800, 0, "Arial")
        GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Next
    ;Y Axis
    For $i=0 To $Canvas[3] Step $Canvas[3]/5
        GUICtrlCreateLabel(($i/$Canvas[3])*_RoundUp($max),$Canvas[0]-65,$Canvas[1]+$Canvas[3]+$Canvas[4]-$i,30,-1,$SS_RIGHT)
        GUICtrlSetColor(-1,0x990000)
        GUICtrlSetFont(-1, 8, 800, 0, "Arial")
        GUICtrlSetBkColor(-1,$GUI_BKCOLOR_TRANSPARENT)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc
#Region INTERNAL USE ONLY
Func _RoundUp($m)
    Local $rv = Round(Ceiling($m/10)*10,-1)
    ;ConsoleWrite($rv&@CRLF)
    Return $rv
EndFunc

Func _CreateBarCanvas($iX=0, $iY=0, $iW=400, $iH=400, $iDepthCanvas=30, $BgColor=0xEEEEEE)
    Local $iXCanvas=$iX+$iDepthCanvas
    Local $iYCanvas=$iY+10+2*$iDepthCanvas
    Local $iWCanvas=$iW-2*$iDepthCanvas
    Local $iHCanvas=$iH-2*$iDepthCanvas
    Local $BgColor2 = $BgColor - 0x333333
    ;create bg for the bars
    For $i=0 To $iDepthCanvas; Step 0.5
        GUICtrlCreateGraphic($iXCanvas+$i, $iYCanvas-$i, $iWCanvas, $iHCanvas, 0)
        GUICtrlSetBkColor(-1, $BgColor)
        GUICtrlSetColor(-1, $BgColor2)
    Next
    GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 0, $iHCanvas)
    GUICtrlSetGraphic(-1, $GUI_GR_COLOR, $BgColor)
    GUICtrlSetGraphic(-1, $GUI_GR_LINE, -$iDepthCanvas-1, $iHCanvas+$iDepthCanvas+1)
    ;horizontal grid
    For $i=0 To $iHCanvas Step $iHCanvas/5
        GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 0, $i)
        GUICtrlSetGraphic(-1, $GUI_GR_COLOR, $BgColor2)
        GUICtrlSetGraphic(-1, $GUI_GR_LINE, $iWCanvas, $i)

        GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 0, $i)
        GUICtrlSetGraphic(-1, $GUI_GR_COLOR, $BgColor)
        GUICtrlSetGraphic(-1, $GUI_GR_LINE, -$iDepthCanvas, $i+$iDepthCanvas)
    Next
    Local $Canvas = StringSplit($iXCanvas+$iDepthCanvas &"|"& $iYCanvas-$iDepthCanvas&"|"&$iWCanvas&"|"&$iHCanvas&"|"&$iDepthCanvas,"|",2)
    ;ConsoleWrite($iXCanvas+$iDepthCanvas &"|"& $iYCanvas-$iDepthCanvas&"|"&$iWCanvas&"|"&$iHCanvas&@CRLF)
    Return $Canvas
EndFunc
#EndRegion INTERNAL USE ONLY