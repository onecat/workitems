#include <Date.au3>

;#include <Interval_Time.au3>
;~ D - 以天为单位添加到指定的日期
;~ M - 以月为单位添加到指定的日期
;~ Y - 以年为单位添加到指定的日期
;~ w - 以周为单位添加到指定的日期
;~ h - 以小时为单位添加到指定的日期
;~ n - 以分钟为单位添加到指定的日期
;~ s - 以秒钟为单位添加到指定的日期
_time(10, "s") ;10秒钟执行一次
Func _run()
;~ 运行语句必须从这开始写
        MsgBox(0,0,"函数成功！")
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