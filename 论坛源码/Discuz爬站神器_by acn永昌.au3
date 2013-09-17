#region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=1.0.0.31
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本: 递归版
	脚本作者: 张永昌
	电子邮件: 106182722@qq.com
	QQ/TM:	106182722
	脚本版本:	1.0.0.0.0
	脚本功能: 扒discuz数据
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <winhttp.au3>
#include <array.au3>

#include-once
Opt("MustDeclareVars", 1)
FileCopy('mylog.log', 'mylog.bak', 1)
FileDelete("mylog.log")
Global $ini[3]
$ini[2] = 80
$ini[0] = 2 ;日志开关1打开0关闭,日志+console


	$ini[1] = InputBox('Discuz神器', '扒手专家-支持Discuz全系网站' & @CRLF & 'Powered By Acn-永昌 QQ106182722' & @CRLF & "例如你需要下载http://bbs.icafe8.com/那么你应该输入如下：" & @CRLF & '请出入网址例如：bbs.icafe8.com', 'bbs.icafe8.com')
	If @error = 1 Then Exit
	$ini[2] = InputBox('Discuz神器', '扒手专家-支持Discuz全系网站' & @CRLF & 'Powered By Acn-永昌 QQ106182722' & @CRLF & "请输入端口号，一般网站都为80，如果不知道就点确认吧", '80')
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
	Global $BinaryMode = 1 ;$binaryMode为编码1-4，编码不同发送与返回结果不同
	Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 	MsgBox(1,1,$iData)
	If $iData = 0 Then
		MsgBox(0, 'Fuck！！！又tm的出错了。', '作为PC的我，我怀疑你输错了，BS你。')
		Exit
	EndIf
	If StringRegExp($iData[1], 'charset=(.*?)"', 0) Then
		Local $check = StringRegExp($iData[1], 'charset=(.*?)"', 3)
		If StringInStr($check[0], 'utf') <> 0 Then
			Global $BinaryMode = 4
		ElseIf StringInStr($check[0], 'gb') <> 0 Then
			Global $BinaryMode = 1
		Else
			MsgBox(0, 'Fuck！！！又tm的出错了。', '我检测到charset标记为:' & $check[0] & ',但不知如何是好。')
			Exit
		EndIf
	Else
		MsgBox(0, 'Fuck！！！又tm的出错了。', '我木有检测到charset标记')
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
	mdfiles(1, $iData[1], '0x0001');产生主页
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
;~ 				myLogs("================================\" & $main1[$i] & @CRLF);2及文件夹链接
				If UBound($main2) > 1 Then
					testfor($hConnect, $main2, $main1[$i], 0)
				EndIf
;~ 				myLogs("================================\" & $path & $main1[$i] & @CRLF);2及文件夹链接
				mdfiles($main1[$i] & '\' & $main1[$i] & '主页.html', $iData[1], '0x0003') ;N级目录下的主页文件
				;下载1级目录下的HTML文件
;~ 				MsgBox(1, 1, $iData[1])
;~ 				myLogs('startreg2_testfor-' & $i & ' ' & @CRLF)
				Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', "testfor_func2")
;~ 				_ArrayDisplay($downhtml,'downhtml')
;~ 				myLogs('stopreg2_testfor-' & $i & ' ' & @CRLF)
				testdownfor($main1[$i], $downhtml, $hConnect) ;下载首页的tid，主题文件页面
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
;~ 		myLogs($path & "================================\"& $main1[$i-1] & @CRLF);2及文件夹链接
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
				Local $main2 = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}fid.*?)">(.*?)</a>', "testfor_func1");检测有没有3级文件夹
;~ 				_ArrayDisplay($main2, $main2)
;~ 				myLogs("================================\" & $main1[$i] & @CRLF);2及文件夹链接
;~ 				If UBound($main2) > 1 Then
;~ 					testfor($hConnect, $main2, $main1[$i], 0)
;~ 				EndIf
;~ 				myLogs("================================\" & $path &'\'& $main1[$i] & @CRLF);2及文件夹链接
;~ 				MsgBox(1,$main1[$i] & '\' & $main1[$i] & '主页.html',"\" & $path &'\'& $main1[$i])
				mdfiles($path & '\' & $main1[$i] & '\' & $main1[$i] & '主页.html', $iData[1], '0x0006') ;N级目录下的主页文件
				;下载1级目录下的HTML文件
;~ 				MsgBox(1, 1, $iData[1])
;~ 				myLogs('startreg2_testfor-' & $i & ' ' & @CRLF)
				Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', "testfor_func2") ;取帖子地址，名字，回复数
;~ 				_ArrayDisplay($downhtml,'downhtml')
;~ 				myLogs('stopreg2_testfor-' & $i & ' ' & @CRLF)
				testdownfor($path & '\' & $main1[$i], $downhtml, $hConnect) ;下载首页的tid，主题文件页面
;~ 				ClipPut($iData[1])
;~ 				MsgBox(1,1,$iData[1])
;~ myLogs("================================\" & $path & $main1[$i - 1] & @CRLF);2及文件夹链接
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
Func down_every_page($hConnect, $number, $main1);链接，页数，上级文件目录，
	For $i = 1 To $number[0] Step 2
		$sPath = CheckFileExists_spath() & '/archiver/' & $number[$i]
		Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
		Local $downhtml = test1($iData[1], '<li><a href="(?:archiver/){0,1}(.{0,5}tid.*?)">(.*?)</a> (\(.*?\))', 'down_every_page_func')
;~ 		_ArrayDisplay($downhtml)
		testdownfor($main1, $downhtml, $hConnect)
	Next
EndFunc   ;==>down_every_page
Func check_end_page($main1, $hConnect, $data, $strong = 1, $number = 1);data==目录列表
	myLogs('工作在第' & $number & "页" & @CRLF)
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
		myLogs('提示' & '没有检测到' & 'srtingregexp' & '<strong>\[(.*?)\]</strong>')
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
Func testdownfor($main1, $downhtml, $hConnect);上级文件目录，下载html的数组，链接
	;mail1===目录名字 非array
	;downhtml===数组1、-xxxxx。html 2、中文标题、3回复帖子数量
;~ 	_ArrayDisplay($downhtml)
	If $downhtml = 0 Then Return 0
	For $j = 2 To $downhtml[0] - 1 Step 3
		$sPath = CheckFileExists_spath() & '/archiver/' & $downhtml[$j - 1]
		Local $name = StringReplace($downhtml[$j] & $downhtml[$j + 1], '\', "、")
		$name = StringReplace($name, '/', "、")
		$name = StringReplace($name, '|', "-")
		$name = StringReplace($name, ':', "：")
		$name = StringReplace($name, '?', "？")
		$name = StringReplace($name, '<', "《")
		$name = StringReplace($name, '>', "》")
		$name = StringReplace($name, '"', "'")
		$name = StringReplace($name, '.', "。")
		$name = StringReplace($name, '*', "&")
		$name &= '.html'
		$name = $main1 & '\' & $name
		
		If FileExists($main1 & '\' & CheckFilesName($downhtml[$j]) & '(*篇回复).html') Then
;~ 			myLogs("文件重复自动跳过:" &$main1 & '\' & CheckFilesName($downhtml[$j]) & '(*篇回复).html')
		Else
			Local $iData = _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode)
;~ 			MsgBox(1,$sPath,$iData[1])
			If $iData = 0 Then ContinueLoop
			mdfiles($name, $iData[1], '0x0007') ;N级目录下的帖子首页
		EndIf
		;这里可以增加循环扒楼梯
;~ 		myLogs($j & @CRLF)
;~ 		If $j + 3 > $downhtml[0] Then $j = $downhtml[0] + 99
	Next
;~ myLogs("asdasdasdasdasdasdasd" & @CRLF)
EndFunc   ;==>testdownfor
Func CheckRegExp_array($aa);用于检测并返回正则表达式中有多少个实际有用的左括号，$aa为正则表达式
	$aa = StringReplace($aa, '\(', '')
	$aa = StringReplace($aa, '(?:', '')
	$aa = StringReplace($aa, '(', '')
	Return @extended
EndFunc   ;==>CheckRegExp_array
Func test1($iData, $regexp, $func = "未知")
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
		myLogs('策略失败在 test1() 被---' & $func & @CRLF)
		Return 0
	EndIf
EndFunc   ;==>test1

Func checkfid($htmlData, $regexp)
;~ 	myLogs(@CRLF & $regexp & @CRLF)
	Return checkregexp($htmlData, $regexp, 'checkfid_func')
EndFunc   ;==>checkfid
Func checkregexp($regexp_Data, $regexp, $func = "未知")
	If StringRegExp($regexp_Data, $regexp, 0) Then
		Local $arry = StringRegExp($regexp_Data, $regexp, 3)
		_ArrayInsert($arry, 0, UBound($arry));在指定的坐标添加一个新值
;~ 		_ArrayDisplay($arry)
		Return $arry
	Else
		myLogs('策略失败在 checkregexp 被---' & $func & @CRLF)
		Dim $arry[1] = [-1]
		Return $arry
	EndIf
EndFunc   ;==>checkregexp

Func CheckFilesName($name)
	$name = StringReplace($name, '\', "、")
	$name = StringReplace($name, '/', "、")
	$name = StringReplace($name, '|', "-")
	$name = StringReplace($name, ':', "：")
	$name = StringReplace($name, '?', "？")
	$name = StringReplace($name, '<', "《")
	$name = StringReplace($name, '>', "》")
	$name = StringReplace($name, '"', "'")
	$name = StringReplace($name, '.', "。")
	$name = StringReplace($name, '*', "&")
	Return $name
EndFunc   ;==>CheckFilesName
Func mdfiles($name, $data = 1, $log = "未知")
;~ 	$name = String(CheckFilesName($name))
;~ MsgBox(1,@ScriptDir,$name)

;~ MsgBox(1,1,1)
	If $name = 1 Then
		Local $tmp = StringRegExp($data, '<h2.*?>(.*?)</h2>', 3)
		If UBound($tmp) < 1 Then
			MsgBox(0, 'Fuck', "标题都没有检测到，让我搞毛呢")
			Exit
		EndIf
		$name = $tmp[0]
		$name = StringReplace($name, "'s Archiver ", "主页.html")
		$name = '龙擎快照-' & $name
	EndIf
	Local $path = @ScriptDir & '\' & $name
	If $data = Number(1) Then
		If FileExists($name) Then
			myLogs('mdfiles执行创建目录存在跳过执行。')
		Else
			DirCreate($name)
			myLogs('mdfiles执行创建' & @ScriptDir & '\' & $name & '，被 ---' & $log & @CRLF)
		EndIf
	Else
		If FileExists($path) Then
			ToolTip("文件重复自动跳过:" & $name, 0, 0)
;~ 			myLogs("文件重复自动跳过:" & $name & @CRLF)
			Return 2 ;跳过
		Else
			$data = StringRegExpReplace($data, '<title>(.*?)(.*?)</title>', '<title>龙擎快照@\1\2</title>')
			$data = StringRegExpReplace($data, "<h2(.*?){0,1}>(.*?)'s.*?</h2>", '<h2\1>龙擎快照日期:' & @YEAR & "-" & @MON & "-" & @MDAY & '@\2</h2>')
			$data = StringRegExpReplace($data, '<a href="./"><strong>(.*?)</strong></a>', '<strong>龙巢技术联盟快照引擎@\1</strong>')
;~ 			$data = StringRegExpReplace($data,'<a href="(.*?)" target="_blank"><strong>(.*?)</strong></a>','<a href="\1" target="_blank"><strong>查看龙擎收录源: \2</strong></a>')
			$data = StringRegExpReplace($data, '查看完整版本:(?:\r\n){0,1}(?: ){0,3}', '查看龙擎收录源:' & @CRLF)
			$data = StringRegExpReplace($data, 'Powered by <strong>.*</strong>', 'Powered by <strong><a target="_blank" href="http://www.wangbapeixun.com/">龙擎 FX1.0 推土机 </a></strong>')

			$data = StringRegExpReplace($data, '</strong>(.*?)(\n){0,5}&copy(.*?)</a>', '</strong> &nbsp;\2 &copy 2012-2013 <a target="_blank" href="http://www.longchaoleyuan.com/">LongChao Soft Inc.</a>')
;~ 			'</strong>(.*?)(?:\r\n){0,1}&copy.*?</a>'

			If StringRegExp($data, '<a(.*?)>(.*?)</a>(.*?)<a(.*?)>(.*?)</a>(.*?)</div>', 0) Then
;~ 							ClipPut($data & @CRLF & '</strong>(.*?)(?:\r\n){0,1}&copy(.*?)</a>' & @CRLF)
;~ 			MsgBox(1,1,1)
				$data = StringRegExpReplace($data, '<a(.*?)>(.*?)</a>(.*?)<a(.*?)>(.*?)</a>(.*?)</div>', '龙巢技术联盟快照引擎@\2\3\5\6</div>', 1) ;龙巢技术联盟快照引擎@网维论坛 ? 云海 ? 【公告】12月13日凌晨1点-2点云海影视服务器升级
				
			Else
				$data = StringRegExpReplace($data, '<a(.*?)>(.*?)</a>(.*?)(.*?)</div>', '龙巢技术联盟快照引擎@\2\3\4</div>', 1)
			EndIf
			myLogs('mdfiles执行创建' & @ScriptDir & '\' & $name & '，被 ---' & $log & @CRLF)
			Local $fileopen = FileOpen($path, 10)
			Local $filewrite = FileWrite($fileopen, $data)
			If $filewrite = 0 Then myLogs('mdfiles执行创建---写入失败，请检查路径---' & $path)
			FileClose($fileopen)
			ToolTip("write to " & $path, 0, 0)
;~ 			myLogs("文件重复自动跳过:" & $path & @CRLF)
			Return 1
		EndIf
	EndIf
EndFunc   ;==>mdfiles

Func HttpStart()
	; 初始化并获取会话句柄
	Local $hOpen = _WinHttpOpen("Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.9.0.3; .NET CLR 2.0.50727; ffco7) Gecko/2008092417 Firefox/3.0.3")
	; 获取连接句柄
	Local $hConnect = _WinHttpConnect($hOpen, $ini[1], $ini[2])
	Local $tmp[2] = [$hConnect, $hOpen]
	Return $tmp
EndFunc   ;==>HttpStart
Func HttpEnd($hConnect, $hOpen)
	; 关闭句柄
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hOpen)
EndFunc   ;==>HttpEnd

Func _WinHttpSimpleRequest_send($hConnect, $sType, $sPath, $sReferrer, $sData, $sHeader, $fGetHeaders, $iMode, $BinaryMode);$sdata为2进制内容，$binaryMode为编码1-4，编码不同发送与返回结果不同
	Local $iData = 0
	Do
		Local $iData = _WinHttpSimpleRequest($hConnect, $sType, $sPath, $sReferrer, StringToBinary($sData, $BinaryMode), $sHeader, $fGetHeaders, $iMode)
		If $iData = 0 Then
			Local $error = @error
			If $error = 1 Then
				myLogs('无法打开请求 -----在func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 2 Then
				myLogs('无法发送请求 -----在func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 3 Then
				myLogs('无法接收响应 -----在func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			ElseIf $error = 4 Then
				myLogs('$iMode 无效 -----在func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			Else
				myLogs('未知错误 -----在func _WinHttpSimpleRequest_send---' & $ini[1] & ':' & $ini[2] & $sPath)
			EndIf
		EndIf
	Until UBound($iData) > 1
	If UBound($iData) < 1 Then Return 0
	$iData[0] = BinaryToString($iData[0], $BinaryMode)
	$iData[1] = BinaryToString($iData[1], $BinaryMode)
	Return $iData
	;0返回头文件，1返回页面内容
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