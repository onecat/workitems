Local $reg, $regtem;ȫ�ֱ���

Func RegCrgeat($Pattern, $str, $IgnoreCase = False, $Multiline = True, $Global = True)
	$reg = ObjCreate("VBScript.RegExp")
	With $reg
		.IgnoreCase = $IgnoreCase;�Ƿ����ִ�Сд
		.Multiline = $Multiline;�Ƿ�ƥ�����
		.Singleline = Not $Multiline;Singleline(����ģʽ)
		.Global = $Global;�Ƿ�ȫ��ƥ��
		.Pattern = $Pattern;�����ı�
		$regtem = .Execute($str);ִ��ƥ��
	EndWith
	Return ($regtem.Count);����.ȡƥ������
EndFunc   ;==>RegGrgeat
;=================����.����
Func RegGet($n);$n ƥ������
	$Match = $regtem.Item($n - 1)
	$Value = $Match.Value
	Return ($Value)
EndFunc   ;==>RegGet
;================����.ȡƥ���ı�
Func RegGet1($m, $n);$m ƥ������ $n ��ƥ������
	$Match = $regtem.Item($m - 1)
	$SubMatches = $Match.SubMatches
	$Value = $SubMatches.Item($n - 1)
	Return ($Value)
EndFunc   ;==>RegGet1
;================����.ȡ��ƥ���ı�
Func RegGetCount1();$m ƥ������ $n ��ƥ������
	$Match = $regtem.Item(0)
	$SubMatches = $Match.SubMatches
	Return ($SubMatches.Count)
EndFunc   ;==>RegGetCount1
;================����.ȡ��ƥ������
