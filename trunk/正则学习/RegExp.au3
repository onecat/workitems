Local $reg, $regtem;全局变量

Func RegCrgeat($Pattern, $str, $IgnoreCase = False, $Multiline = True, $Global = True)
	$reg = ObjCreate("VBScript.RegExp")
	With $reg
		.IgnoreCase = $IgnoreCase;是否区分大小写
		.Multiline = $Multiline;是否匹配多行
		.Singleline = Not $Multiline;Singleline(单行模式)
		.Global = $Global;是否全局匹配
		.Pattern = $Pattern;正则文本
		$regtem = .Execute($str);执行匹配
	EndWith
	Return ($regtem.Count);正则.取匹配数量
EndFunc   ;==>RegGrgeat
;=================正则.创建
Func RegGet($n);$n 匹配索引
	$Match = $regtem.Item($n - 1)
	$Value = $Match.Value
	Return ($Value)
EndFunc   ;==>RegGet
;================正则.取匹配文本
Func RegGet1($m, $n);$m 匹配索引 $n 子匹配索引
	$Match = $regtem.Item($m - 1)
	$SubMatches = $Match.SubMatches
	$Value = $SubMatches.Item($n - 1)
	Return ($Value)
EndFunc   ;==>RegGet1
;================正则.取子匹配文本
Func RegGetCount1();$m 匹配索引 $n 子匹配索引
	$Match = $regtem.Item(0)
	$SubMatches = $Match.SubMatches
	Return ($SubMatches.Count)
EndFunc   ;==>RegGetCount1
;================正则.取子匹配数量
