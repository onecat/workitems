#region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=1.0.0.31
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#endregion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾: �ݹ��
	�ű�����: ������
	�����ʼ�: 106182722@qq.com
	QQ/TM:	106182722
	�ű��汾:	1.0.0.0.0
	�ű�����: ��discuz����
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <winhttp.au3>
#include <array.au3>

#include-once
Opt("MustDeclareVars", 1)
FileCopy('mylog.log', 'mylog.bak', 1)
FileDelete("mylog.log")
Global $ini[3]
$ini[2] = 80
$ini[0] = 2 ;��־����1��0�ر�,��־+console


	$ini[1] = InputBox('Discuz����', '����ר��-֧��Discuzȫϵ��վ' & @CRLF & 'Powered By Acn-���� QQ106182722' & @CRLF & "��������Ҫ����http://bbs.icafe8.com/��ô��Ӧ���������£�" & @CRLF & '�������ַ���磺bbs.icafe8.com', 'bbs.icafe8.com')
	If @error = 1 Then Exit
	$ini[2] = InputBox('Discuz����', '����ר��-֧��Discuzȫϵ��վ' & @CRLF & 'Powered By Acn-���� QQ106182722' & @CRLF & "������˿ںţ�һ����վ��Ϊ80�������֪���͵�ȷ�ϰ�", '80')
	If @error = 1 Then Exit

Local $start = HttpStart()
start($start[0])
HttpEnd($start[0], $start[1])

Func CheckFileExists_spath()
	If @ScriptDir & '\' & 'spath.txt' Then
		Local $fileopen = FileOpen(@ScriptDir & '\' & 'spath.txt')
		Local $fileread = FileRead($fileopen)
		Return $fileread
	Else
		Return ""
	EndIf
EndFunc   ;==>CheckFileExists_spath
Func GetScriptName($check = 0)
	If $check = 0 Then
		If StringRegExp(@ScriptDir, '\\((?:\w+[\.|\-]){1,4}\w+)(?:;){0,1}(\d+){0,1}', 0) Then
			Return 1
		Else
			Return 0
		EndIf
	Else
		If UBound(StringRegExp(@ScriptDir, '\\((?:\w+[\.|\-]){1,4}\w+)(?:;){0,1}(\d+){0,1}', 3)) > 1 Then $ini[2] = StringRegExp(@ScriptDir, '\\((?:\w+[\.|\-]){1,4}\w+)(?:;){0,1}(\d+){0,1}', 3)[1]
		Return StringRegExp(@ScriptDir, '\\((?:\w+[\.|\-]){1,4}\w+)(?:;){0,1}(\d+){0,1}', 3)[0]
	EndIf
EndFunc   ;==>GetScriptName
Func ChechAnsiOrUtf8($hConnect)
	Global $sType = 'GET'
	Global $sPath = CheckFileExists_spath()
	Global $sReferrer = 'http://' & $ini[1] & '/'
	Global $sData = ''
	Global $sHeader = Default
	Global $fGetHeaders = 1
	Global $iMode = 2
	Global $BinaryMode = 1 ;$binaryModeΪ����1-4�����벻ͬ�����뷵�ؽ����ͬ
	Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 	MsgBox(1,1,$iData)
	If $iData = 0 Then
		MsgBox(0, 'Fuck��������tm�ĳ����ˡ�', '��ΪPC���ң��һ���������ˣ�BS�㡣')
		Exit
	EndIf
	If StringRegExp($iData[1], 'charset=(.*?)"', 0) Then
		Local $check = StringRegExp($iData[1], 'charset=(.*?)"', 3)
		If StringInStr($check[0], 'utf') <> 0 Then
			Global $BinaryMode = 4
		ElseIf StringInStr($check[0], 'gb') <> 0 Then
			Global $BinaryMode = 1
		Else
			MsgBox(0, 'Fuck��������tm�ĳ����ˡ�', '�Ҽ�⵽charset���Ϊ:' & $check[0] & ',����֪����Ǻá�')
			Exit
		EndIf
	Else
		MsgBox(0, 'Fuck��������tm�ĳ����ˡ�', '��ľ�м�⵽charset���')
		Exit
	EndIf
EndFunc   ;==>ChechAnsiOrUtf8
Func CheckFormat_Href_id($data)
;~ 	If StringRegExp($data,'<li><a href="(.*?)fid-176.html">',0) Then StringRegExp($data,'<li><a href="(.*?)fid-176.html">',3)[0]
;~ 	Return ""
EndFunc   ;==>CheckFormat_Href_id

Func start($hConnect)
	ChechAnsiOrUtf8($hConnect)
	Global $sPath = CheckFileExists_spath() & '/archiver/'
	Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
	mdfiles(1, $iData[1], '0x0001');������ҳ
;~ 	Local $main1 = test1($iData[1], '<a href="(?:archiver/){0,1}.{0,5}fid(.*?)">(.*?)</a>', 'start_func')
	Local $main1 = test1($iData[1], '<a href="(?:archiver/){0,1}(.{0,5}fid.*?)">(.*?)</a>', 'start_func')
;~ 	_ArrayDisplay($main1)

	testfor($hConnect, $main1, '', 1)
EndFunc   ;==>start
Func testfor($hConnect, $main1, $path = "\", $mainhtml = 1)
	
	If $mainhtml = 1 Then
		If UBound($main1) = 0 Then
			
		Else
			For $i = 2 To $main1[0] Step 2
;~ 				_ArrayDisplay($main1, $main1)
				mdfiles($main1[$i], Number(1), '0x0002')
				$sPath = CheckFileExists_spath() & '/archiver/' & $main1[$i - 1]
				Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 				MsgBox(1,1,$iData[1])
				Local $main2 = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}fid.*?)">(.*?)</a>', "testfor_func1")
;~ 				_ArrayDisplay($main2, $main2)
;~ 				myLogs("================================\" & $main1[$i] & @CRLF);2���ļ�������
				If UBound($main2) > 1 Then
					testfor($hConnect, $main2, $main1[$i], 0)
				EndIf
;~ 				myLogs("================================\" & $path & $main1[$i] & @CRLF);2���ļ�������
				mdfiles($main1[$i] & '\' & $main1[$i] & '��ҳ.html', $iData[1], '0x0003') ;N��Ŀ¼�µ���ҳ�ļ�
				;����1��Ŀ¼�µ�HTML�ļ�
;~ 				MsgBox(1, 1, $iData[1])
;~ 				myLogs('startreg2_testfor-' & $i & ' ' & @CRLF)
				Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', "testfor_func2")
;~ 				_ArrayDisplay($downhtml,'downhtml')
;~ 				myLogs('stopreg2_testfor-' & $i & ' ' & @CRLF)
				testdownfor($main1[$i], $downhtml, $hConnect) ;������ҳ��tid�������ļ�ҳ��
;~ 				ClipPut($iData[1])
;~ 				MsgBox(1,1,$iData[1])
				If StringRegExp($iData[1], 'href="(.*?page=.*?)">([0-9]{1,4})</a>', 0) Then
					Local $page = check_end_page($main1[$i], $hConnect, $iData[1])
;~ 				down_every_page($main1, $downhtml, $hConnect)
;~ 					MsgBox(1,1,$page)
;~ 					testfor($hConnect, $main2, $main1[$i], 0);-----------------------------------------------*
				ElseIf StringRegExp($iData[1], '<a href=archiver/(.*?page.*?)>([0-9]{1,4})</a>', 0) Then
					Local $page = check_end_page($main1[$i], $hConnect, $iData[1])
				Else
;~ 					MsgBox(1, 1, $i)
					ContinueLoop
				EndIf ;-----------------------------------
			Next
		EndIf
	Else
;~ 		myLogs($path & "================================\"& $main1[$i-1] & @CRLF);2���ļ�������
;~ 		_ArrayDisplay($main1)
		If UBound($main1) = 0 Then
		Else
			For $i = 2 To $main1[0] Step 2
;~ 				MsgBox(1,1,$path & "\" & $main1[$i])
				
				
				mdfiles($path & "\" & $main1[$i], Number(1), '0x0004')
;~
				
				
				
				
				
				
				
				
				
				
;~ 								mdfiles($main1[$i],Number(1),'0x0005')
				$sPath = CheckFileExists_spath() & '/archiver/' & $main1[$i - 1]
				Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 				MsgBox(1,1,$iData[1])
				Local $main2 = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}fid.*?)">(.*?)</a>', "testfor_func1");�����û��3���ļ���
;~ 				_ArrayDisplay($main2, $main2)
;~ 				myLogs("================================\" & $main1[$i] & @CRLF);2���ļ�������
;~ 				If UBound($main2) > 1 Then
;~ 					testfor($hConnect, $main2, $main1[$i], 0)
;~ 				EndIf
;~ 				myLogs("================================\" & $path &'\'& $main1[$i] & @CRLF);2���ļ�������
;~ 				MsgBox(1,$main1[$i] & '\' & $main1[$i] & '��ҳ.html',"\" & $path &'\'& $main1[$i])
				mdfiles($path & '\' & $main1[$i] & '\' & $main1[$i] & '��ҳ.html', $iData[1], '0x0006') ;N��Ŀ¼�µ���ҳ�ļ�
				;����1��Ŀ¼�µ�HTML�ļ�
;~ 				MsgBox(1, 1, $iData[1])
;~ 				myLogs('startreg2_testfor-' & $i & ' ' & @CRLF)
				Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', "testfor_func2") ;ȡ���ӵ�ַ�����֣��ظ���
;~ 				_ArrayDisplay($downhtml,'downhtml')
;~ 				myLogs('stopreg2_testfor-' & $i & ' ' & @CRLF)
				testdownfor($path & '\' & $main1[$i], $downhtml, $hConnect) ;������ҳ��tid�������ļ�ҳ��
;~ 				ClipPut($iData[1])
;~ 				MsgBox(1,1,$iData[1])
;~ myLogs("================================\" & $path & $main1[$i - 1] & @CRLF);2���ļ�������
				If StringRegExp($iData[1], 'href="(.*?page=.*?)">([0-9]{1,4})</a>', 0) Then
					Local $page = check_end_page($path & '\' & $main1[$i], $hConnect, $iData[1])
;~ 					testfor($hConnect, $main2, $main1[$i], 0);-----------------------------------------------------------------
				ElseIf StringRegExp($iData[1], '<a href=archiver/(.*?page.*?)>([0-9]{1,4})</a>', 0) Then
					Local $page = check_end_page($main1[$i], $hConnect, $iData[1])
				Else
					ContinueLoop
				EndIf
;~
				
				
				
				
				
				
				
				
				
			Next
		EndIf
	EndIf
EndFunc   ;==>testfor
Func down_every_page($hConnect, $number, $main1);���ӣ�ҳ�����ϼ��ļ�Ŀ¼��
	For $i = 1 To $number[0] Step 2
		$sPath = CheckFileExists_spath() & '/archiver/' & $number[$i]
		Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
		Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', 'down_every_page_func')
;~ 		_ArrayDisplay($downhtml)
		testdownfor($main1, $downhtml, $hConnect)
	Next
EndFunc   ;==>down_every_page
Func check_end_page($main1, $hConnect, $data, $strong = 1, $number = 1);data==Ŀ¼�б�
	myLogs('�����ڵ�' & $number & "ҳ" & @CRLF)
	If StringRegExp($data, 'href="(.*?page=.*?)">([0-9]{1,4})</a>', 0) Then
		Local $checkend = checkregexp($data, 'href="(.*?page=.*?)">([0-9]{1,4})</a>', 'check_end_page_func')
	ElseIf StringRegExp($data, '<a href=archiver/(.*?)>(.*?)</a>', 0) Then
		Local $checkend = checkregexp($data, '<a href=archiver/(.*?page.*?)>([0-9]{1,4})</a>', 'check_end_page_func1')
	Else
		
	EndIf
	down_every_page($hConnect, $checkend, $main1)

	$sPath = CheckFileExists_spath() & '/archiver/' & $checkend[$checkend[0] - 1]
	Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
	$number = $checkend[$checkend[0]]
;~ 	MsgBox(1,1,$iData[1])
	If StringRegExp($iData[1], '<strong>\[(.*?)\]</strong>', 0) Then;-----------------------
		Local $temp = StringRegExp($iData[1], '<strong>\[(.*?)\]</strong>', 3)
	Else
		
		ClipPut($iData[1] & @CRLF & '<strong>\[(.*?)\]</strong>')
		myLogs('��ʾ' & 'û�м�⵽' & 'srtingregexp' & '<strong>\[(.*?)\]</strong>')
		Return 0
	EndIf
	myLogs($strong & '--' & $temp[0] & '--' & $number & @CRLF);-----------------------
	If Number($strong) > Number($number) Then
		myLogs($number & @CRLF)
		Return $number
	EndIf
	myLogs($strong & '--' & $temp[0] & '--' & $number & @CRLF);---------------------
	check_end_page($main1, $hConnect, $iData[1], $temp[0], $number)

EndFunc   ;==>check_end_page
Func testdownfor($main1, $downhtml, $hConnect);�ϼ��ļ�Ŀ¼������html�����飬����
	;mail1===Ŀ¼���� ��array
	;downhtml===����1��-xxxxx��html 2�����ı��⡢3�ظ���������
;~ 	_ArrayDisplay($downhtml)
	If $downhtml = 0 Then Return 0
	For $j = 2 To $downhtml[0] - 1 Step 3
		$sPath = CheckFileExists_spath() & '/archiver/' & $downhtml[$j - 1]
		Local $name = StringReplace($downhtml[$j] & $downhtml[$j + 1], '\', "��")
		$name = StringReplace($name, '/', "��")
		$name = StringReplace($name, '|', "-")
		$name = StringReplace($name, ':', "��")
		$name = StringReplace($name, '?', "��")
		$name = StringReplace($name, '<', "��")
		$name = StringReplace($name, '>', "��")
		$name = StringReplace($name, '"', "'")
		$name = StringReplace($name, '.', "��")
		$name = StringReplace($name, '*', "&")
		$name &= '.html'
		$name = $main1 & '\' & $name
		
		If FileExists($main1 & '\' & CheckFilesName($downhtml[$j]) & '(*ƪ�ظ�).html') Then
;~ 			myLogs("�ļ��ظ��Զ�����:" &$main1 & '\' & CheckFilesName($downhtml[$j]) & '(*ƪ�ظ�).html')
		Else
			Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 			MsgBox(1,$sPath,$iData[1])
			If $iData = 0 Then ContinueLoop
			mdfiles($name, $iData[1], '0x0007') ;N��Ŀ¼�µ�������ҳ
		EndIf
		;�����������ѭ����¥��
;~ 		myLogs($j & @CRLF)
;~ 		If $j + 3 > $downhtml[0] Then $j = $downhtml[0] + 99
	Next
;~ myLogs("asdasdasdasdasdasdasd" & @CRLF)
EndFunc   ;==>testdownfor
Func CheckRegExp_array($aa);���ڼ�Ⲣ����������ʽ���ж��ٸ�ʵ�����õ������ţ�$aaΪ������ʽ
	$aa = StringReplace($aa, '\(', '')
	$aa = StringReplace($aa, '(?:', '')
	$aa = StringReplace($aa, '(', '')
	Return @extended
EndFunc   ;==>CheckRegExp_array
Func test1($iData, $regexp, $func = "δ֪")
	If checkfid($iData, $regexp)[0] > 0 Then
		Local $main1 = checkregexp($iData, $regexp, 'test1_func')
;~ 		_ArrayDisplay($main1)
		For $i = 2 To UBound($main1) - 1 Step CheckRegExp_array($regexp)
			$main1[$i] = CheckFilesName($main1[$i])
		Next
;~ 		_ArrayDisplay($main1)
		Return $main1
	Else
		ClipPut($iData & @CRLF & $regexp)
		myLogs('����ʧ���� test1() ��---' & $func & @CRLF)
		Return 0
	EndIf
EndFunc   ;==>test1

Func checkfid($htmlData, $regexp)
;~ 	myLogs(@CRLF & $regexp & @CRLF)
	Return checkregexp($htmlData, $regexp, 'checkfid_func')
EndFunc   ;==>checkfid
Func checkregexp($regexp_Data, $regexp, $func = "δ֪")
	If StringRegExp($regexp_Data, $regexp, 0) Then
		Local $arry = StringRegExp($regexp_Data, $regexp, 3)
		_ArrayInsert($arry, 0, UBound($arry));��ָ�����������һ����ֵ
;~ 		_ArrayDisplay($arry)
		Return $arry
	Else
		myLogs('����ʧ���� checkregexp ��---' & $func & @CRLF)
		Dim $arry[1] = [-1]
		Return $arry
	EndIf
EndFunc   ;==>checkregexp

Func CheckFilesName($name)
	$name = StringReplace($name, '\', "��")
	$name = StringReplace($name, '/', "��")
	$name = StringReplace($name, '|', "-")
	$name = StringReplace($name, ':', "��")
	$name = StringReplace($name, '?', "��")
	$name = StringReplace($name, '<', "��")
	$name = StringReplace($name, '>', "��")
	$name = StringReplace($name, '"', "'")
	$name = StringReplace($name, '.', "��")
	$name = StringReplace($name, '*', "&")
	Return $name
EndFunc   ;==>CheckFilesName
Func mdfiles($name, $data = 1, $log = "δ֪")
;~ 	$name = String(CheckFilesName($name))
;~ MsgBox(1,@ScriptDir,$name)

;~ MsgBox(1,1,1)
	If $name = 1 Then
		Local $tmp = StringRegExp($data, '<h2.*?>(.*?)</h2>', 3)
		If UBound($tmp) < 1 Then
			MsgBox(0, 'Fuck', "���ⶼû�м�⵽�����Ҹ�ë��")
			Exit
		EndIf
		$name = $tmp[0]
		$name = StringReplace($name, "'s Archiver ", "��ҳ.html")
		$name = '�������-' & $name
	EndIf
	Local $path = @ScriptDir & '\' & $name
	If $data = Number(1) Then
		If FileExists($name) Then
			myLogs('mdfilesִ�д���Ŀ¼��������ִ�С�')
		Else
			DirCreate($name)
			myLogs('mdfilesִ�д���' & @ScriptDir & '\' & $name & '���� ---' & $log & @CRLF)
		EndIf
	Else
		If FileExists($path) Then
			ToolTip("�ļ��ظ��Զ�����:" & $name, 0, 0)
;~ 			myLogs("�ļ��ظ��Զ�����:" & $name & @CRLF)
			Return 2 ;����
		Else
			$data = StringRegExpReplace($data, '<title>(.*?)(.*?)</title>', '<title>�������@\1\2</title>')
			$data = StringRegExpReplace($data, "<h2(.*?){0,1}>(.*?)'s.*?</h2>", '<h2\1>�����������:' & @YEAR & "-" & @MON & "-" & @MDAY & '@\2</h2>')
			$data = StringRegExpReplace($data, '<a href="./"><strong>(.*?)</strong></a>', '<strong>�����������˿�������@\1</strong>')
;~ 			$data = StringRegExpReplace($data,'<a href="(.*?)" target="_blank"><strong>(.*?)</strong></a>','<a href="\1" target="_blank"><strong>�鿴������¼Դ: \2</strong></a>')
			$data = StringRegExpReplace($data, '�鿴�����汾:(?:\r\n){0,1}(?: ){0,3}', '�鿴������¼Դ:' & @CRLF)
			$data = StringRegExpReplace($data, 'Powered by <strong>.*</strong>', 'Powered by <strong><a target="_blank" href="http://www.wangbapeixun.com/">���� FX1.0 ������ </a></strong>')

			$data = StringRegExpReplace($data, '</strong>(.*?)(\n){0,5}&copy(.*?)</a>', '</strong> &nbsp;\2 &copy 2012-2013 <a target="_blank" href="http://www.longchaoleyuan.com/">LongChao Soft Inc.</a>')
;~ 			'</strong>(.*?)(?:\r\n){0,1}&copy.*?</a>'

			If StringRegExp($data, '<a(.*?)>(.*?)</a>(.*?)<a(.*?)>(.*?)</a>(.*?)</div>', 0) Then
;~ 							ClipPut($data & @CRLF & '</strong>(.*?)(?:\r\n){0,1}&copy(.*?)</a>' & @CRLF)
;~ 			MsgBox(1,1,1)
				$data = StringRegExpReplace($data, '<a(.*?)>(.*?)</a>(.*?)<a(.*?)>(.*?)</a>(.*?)</div>', '�����������˿�������@\2\3\5\6</div>', 1) ;�����������˿�������@��ά��̳ ? �ƺ� ? �����桿12��13���賿1��-2���ƺ�Ӱ�ӷ���������
				
			Else
				$data = StringRegExpReplace($data, '<a(.*?)>(.*?)</a>(.*?)(.*?)</div>', '�����������˿�������@\2\3\4</div>', 1)
			EndIf
			myLogs('mdfilesִ�д���' & @ScriptDir & '\' & $name & '���� ---' & $log & @CRLF)
			Local $fileopen = FileOpen($path, 10)
			Local $filewrite = FileWrite($fileopen, $data)
			If $filewrite = 0 Then myLogs('mdfilesִ�д���---д��ʧ�ܣ�����·��---' & $path)
			FileClose($fileopen)
			ToolTip("write to " & $path, 0, 0)
;~ 			myLogs("�ļ��ظ��Զ�����:" & $path & @CRLF)
			Return 1
		EndIf
	EndIf
EndFunc   ;==>mdfiles

Func HttpStart()
	; ��ʼ������ȡ�Ự���
	Local $hOpen = _WinHttpOpen("Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.0.3; .NET CLR 2.0.50727; ffco7) Gecko/2008092417 Firefox/3.0.3")
	; ��ȡ���Ӿ��
	Local $hConnect = _WinHttpConnect($hOpen, $ini[1], $ini[2])
	Local $tmp[2] = [$hConnect, $hOpen]
	Return $tmp
EndFunc   ;==>HttpStart
Func HttpEnd($hConnect, $hOpen)
	; �رվ��
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hOpen)
EndFunc   ;==>HttpEnd

Func _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode);$sdataΪ2�������ݣ�$binaryModeΪ����1-4�����벻ͬ�����뷵�ؽ����ͬ
	Local $iData = 0
	Do
		Local $iData = _WinHttpSimpleRequest($hConnect, $sType, $sPath, $sReferrer, StringToBinary($sData, $BinaryMode), $sHeader, $fGetHeaders, $iMode)
		If $iData = 0 Then
			Local $error = @error
			If $error = 1 Then
				myLogs('�޷������� -----��func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 2 Then
				myLogs('�޷��������� -----��func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 3 Then
				myLogs('�޷�������Ӧ -----��func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 4 Then
				myLogs('$iMode ��Ч -----��func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			Else
				myLogs('δ֪���� -----��func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			EndIf
		EndIf
	Until UBound($iData) > 1
	If UBound($iData) < 1 Then Return 0
	$iData[0] = BinaryToString($iData[0], $BinaryMode)
	$iData[1] = BinaryToString($iData[1], $BinaryMode)
	Return $iData
	;0����ͷ�ļ���1����ҳ������
EndFunc   ;==>_WinHttpSimpleRequest_send

Func myLogs($log1 = '', $log2 = '', $log3 = '', $log4 = '', $log5 = '', $log6 = '', $log7 = '')
	Local $logall = @YEAR & "-" & @MON & "-" & @MDAY & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' ' & $log1 & $log2 & $log3 & $log4 & $log5 & $log6 & $log7 & @CRLF
	If $ini[0] = 1 Then
		FileWrite(@ScriptDir & '\mylog.log', $logall)
	ElseIf $ini[0] = 2 Then
		ConsoleWrite($logall)
		FileWrite(@ScriptDir & '\mylog.log', $logall)
	Else
	EndIf
EndFunc   ;==>myLogs