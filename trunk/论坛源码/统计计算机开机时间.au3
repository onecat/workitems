#include <Date.au3>

Func _CalcDateDiff($iLastTime)  
        Local $iBootTime,$sBootTime 
        $iBootTime = _DateDiff('n',$iLastTime,_NowCalc())        ;Ĭ�ϰ����ӱȽ�,Ҳ��ȷ�����ӷ���
        If $iBootTime < 60 Then                                        ;[С��1Сʱ�����ּ���]
                $sBootTime = $iBootTime & "��"
        ElseIf $iBootTime >= 60 And $iBootTime <1440 Then                ;[����1Сʱ����С��1��(1440����)����Сʱ���ּ���]
                $sBootTime = Int($iBootTime/60) & "Сʱ" & Mod($iBootTime,60) & "��"                ;��=Int(����/������) ��=Mod(����,������)
        ElseIf $iBootTime >= 1440 And $iBootTime < 525600 Then        ;[����һ����С��1��,����+Сʱ+�ּ���]
                Local $sTemp
                Local $iTemp = Mod($iBootTime,1440) ;[��ʣ�µķ���,һ��С��1440��]
                If $iTemp >=60 Then 
                        $sTemp = Int($iTemp/60) & "Сʱ" & Mod($iTemp,60) & "��"        ;��ʣ�µķ��������Сʱ
                Else
                        $sTemp = $iTemp & "��"
                EndIf
                $sBootTime = Int($iBootTime/1440) & "��" & $sTemp
        ElseIf $iBootTime >=525600 Then                        ;[����1��,����+��+Сʱ+�ּ���]
                Local $iYear_Min = Mod($iBootTime,525600)
                Local $sTemp2
                If $iYear_Min <60 Then
                        $sTemp2 = $iYear_Min & "��"
                ElseIf $iYear_Min >=60 And $iYear_Min < 1440 Then
                        $sTemp2 = Int($iYear_Min/60) & "Сʱ" & Mod($iYear_Min,60) & "��"
                ElseIf $iYear_Min >= 1440 Then
                        If Mod($iYear_Min,1440) < 60 Then
                                $sTemp2 = Int($iYear_Min/1440) & "��" &  Mod($iYear_Min,1440) & "��"
                        ElseIf Mod($iYear_Min,1440)>=60 Then
                                $sTemp2 = Int($iYear_Min/1440) & "��" & Int(Mod($iYear_Min,1440)/60) & "Сʱ" & Mod(Mod($iYear_Min,1440),60) & "��"
                        EndIf
                EndIf
                $sBootTime = Int($iBootTime/525600) & "��" & $sTemp2
        EndIf
        Return $sBootTime
EndFunc