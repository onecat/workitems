;#include <Array.au3>
;$a="<td>(\d+\.\d+\.\d+\.\d+)</td>[^.]+?<td>(\d{2,5})</td>"
$a="<td>(\S+)</td>[^.]+<td>(\d+)</td>"
$str=GetSource("http://www.xici.net.co/wt/")
$reg=StringRegExp($str,$a,3)
;_ArrayDisplay($reg)
For $n= 0 To UBound($reg)/2-1
	$ip=$reg[2*$n]&":"&$reg[2*$n+1] ;& "|"
	ConsoleWrite($ip&@CRLF)
	FileWrite(@ScriptDir & "\22.txt",$ip&@CRLF)
Next

	

;----------------------------------------------------
Func GetSource($urls)
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $urls, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext
	$oHTTP = 0
	Return ($return)
EndFunc   ;==>GetSource