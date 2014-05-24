#include <Date.au3>
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