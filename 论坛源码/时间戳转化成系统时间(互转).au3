#include <Date.au3>
;~ $sNewDate = _DateAdd('s', round(1387790458751/1000), "1970/01/01 08:00:00")
;~ MsgBox( 4096, "", "计算时间: " & $sNewDate )
$sNewDate = _DateAdd('s', round(1415334446), "1970/01/01 08:00:00")
MsgBox( 4096, "", "计算时间: " & $sNewDate )

 
$iDateCalc = _DateDiff('s', "1970/01/01 08:00:00",  _NowCalc())
MsgBox(4096, "", "Number of seconds since EPOCH: " & $iDateCalc)
