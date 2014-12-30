#include <Date.au3>

Func _CalcDateDiff($iLastTime)  
        Local $iBootTime,$sBootTime 
        $iBootTime = _DateDiff('n',$iLastTime,_NowCalc())        ;默认按分钟比较,也精确到分钟返回
        If $iBootTime < 60 Then                                        ;[小于1小时，按分计算]
                $sBootTime = $iBootTime & "分"
        ElseIf $iBootTime >= 60 And $iBootTime <1440 Then                ;[大于1小时，但小于1天(1440分钟)，按小时＋分计算]
                $sBootTime = Int($iBootTime/60) & "小时" & Mod($iBootTime,60) & "分"                ;商=Int(除数/被除数) 余=Mod(除数,被除数)
        ElseIf $iBootTime >= 1440 And $iBootTime < 525600 Then        ;[超过一天且小于1年,按天+小时+分计算]
                Local $sTemp
                Local $iTemp = Mod($iBootTime,1440) ;[天剩下的分钟,一定小于1440分]
                If $iTemp >=60 Then 
                        $sTemp = Int($iTemp/60) & "小时" & Mod($iTemp,60) & "分"        ;天剩下的分钟折算成小时
                Else
                        $sTemp = $iTemp & "分"
                EndIf
                $sBootTime = Int($iBootTime/1440) & "天" & $sTemp
        ElseIf $iBootTime >=525600 Then                        ;[大于1年,按年+天+小时+分计算]
                Local $iYear_Min = Mod($iBootTime,525600)
                Local $sTemp2
                If $iYear_Min <60 Then
                        $sTemp2 = $iYear_Min & "分"
                ElseIf $iYear_Min >=60 And $iYear_Min < 1440 Then
                        $sTemp2 = Int($iYear_Min/60) & "小时" & Mod($iYear_Min,60) & "分"
                ElseIf $iYear_Min >= 1440 Then
                        If Mod($iYear_Min,1440) < 60 Then
                                $sTemp2 = Int($iYear_Min/1440) & "天" &  Mod($iYear_Min,1440) & "分"
                        ElseIf Mod($iYear_Min,1440)>=60 Then
                                $sTemp2 = Int($iYear_Min/1440) & "天" & Int(Mod($iYear_Min,1440)/60) & "小时" & Mod(Mod($iYear_Min,1440),60) & "分"
                        EndIf
                EndIf
                $sBootTime = Int($iBootTime/525600) & "年" & $sTemp2
        EndIf
        Return $sBootTime
EndFunc