#include <Date.au3>

;#include <Interval_Time.au3>
;~ D - ����Ϊ��λ��ӵ�ָ��������
;~ M - ����Ϊ��λ��ӵ�ָ��������
;~ Y - ����Ϊ��λ��ӵ�ָ��������
;~ w - ����Ϊ��λ��ӵ�ָ��������
;~ h - ��СʱΪ��λ��ӵ�ָ��������
;~ n - �Է���Ϊ��λ��ӵ�ָ��������
;~ s - ������Ϊ��λ��ӵ�ָ��������
_time(10, "s") ;10����ִ��һ��
Func _run()
;~ ������������⿪ʼд
        MsgBox(0,0,"�����ɹ���")
EndFunc

;Interval_Time
Func _time($a, $type)
While True
$NewDate = _DateAdd($type, $a, _NowCalc())
While True
If _NowCalc() = $NewDate Then
_run()
ExitLoop

EndIf
WEnd
WEnd
EndFunc