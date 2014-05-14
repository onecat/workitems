#include-Once

#cs\\\\\\\\\\\\\\\\\\\\\\\\\\\\ #include <_Ini.au3> \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	　　编写本函数库的原因：
	　　1，内置函数对于某些ini文件由于编码问题读写错误，本库系列函数增加打开模式(如32)，以正确读写。
	　　2，内置函数有效数据仅有32767字符可以被正常返回，本库系列函数无此限制。

	　　当前版本：v1.2.0.0
	
	　　函数说明：
	　　_IniDelete-----------;从INI结构文件中删除某个键值.
	　　_IniRead-------------;从INI结构文件中读取某个键值.
	　　_IniReadSection------;从INI结构文件中读取某个字段中的所有关键字及值.
	　　_IniReadSectionNames-;从INI结构文件中读取所有字段名.
	　　_IniRenameSection----;重命名INI结构文件里面的字段名.
	　　_IniRenameKey--------;重命名INI结构文件里面的关键字.
	　　_IniWrite------------;写入一个键值到INI结构文件.
	　　_IniWriteSection-----;将数据写入到INI结构文件的一个字段.
	
	　　_IniReadSection_str--;从(非)标准INI结构文件中读取某个字段中的所有字符.
	　　_IniReadSection_line-;从(非)标准INI结构文件中读取某个字段中的行字符串.
	　　_FileRead------------;用指定的FileOpen打开模式返回读取文件的字符串.
	　　_IniDelete_line------;从(非)标准INI结构文件中删除(含有)关键字的行.

	　　注意：
	　　对于特殊的键与值，如“abc=123=AAA” 原则上“abc”应该才为关键字，“123=AAA”为值，
	　　本想规范之，但觉得有时候可能会有“abc=123”为关键字，“AAA”为值的需求（内置函数是没得选的），
	　　因此，这里不强制为第一种情况，只需注意如下几点（当然，只有1个等号就无需注意这些了）：
	　　1，_IniReadSection 这个将保持为仅适用第一种情况，“abc”为关键字，“123=AAA”为值
	　　2，_IniDelete、_IniRead、_IniRenameKey、_IniWrite 可同时适用两种情况。
	
	　　　　　　　　　　-- Afan -- http://www.autoitx.com -- 2010-6-28 --更新于 2014-02-28
#ce\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


; 函数名:_IniDelete;=============================================================================
; 说明:　从INI结构文件中删除某个数值。
; 语法:　_IniDelete('ini文件路径', '字段名'[, '关键字'[, 打开模式]])
; 参数:　可选参数'关键字'，要删除的关键字，若不指定关键字或使用Default关键字则整个字段将被删除。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 文件不存在；
;　　　　　　　　　　　　　　@Error=2 字段不存在；
;　　　　　　　　　　　　　　@Error=3 关键字不存在
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据设置。
;==========================================================================================start
Func _IniDelete($iFile, $Section, $key = '', $mode = 0)
	If Not FileExists($iFile) Then Return SetError(1, 0, 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	Local $_key = StringRegExpReplace($key, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(2, 0, 0)
	If $key <> '' And $key <> Default Then
		Local $vr = _IniRead($iFile, $Section, $key, @LF, $mode)
		If $vr = @LF Then Return SetError(3, 0, 0)
		Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & ' ', '(?si)(.*?\r?\n\h*' & $_Section & '\h*\r?\n.*?)(\h*' & $_key & '\h*\=.*?\r?\n)(.*)', '$1$3')
	Else
		Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n)(\h*' & $_Section & '.*?)(\r?\n\h*\[.*)', '$1$3')
	EndIf
	$s_data = StringTrimLeft($s_data, 2)
	$s_data = StringTrimRight($s_data, 3)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniDelete


; 函数名:_IniRead;=============================================================================
; 说明:　从INI结构文件中读取某个数值。
; 语法:　_IniRead('ini文件路径', '字段名', '关键字'[, '默认值'[, 打开模式]])
; 返回值:成功: 返回指定的关键字的值。
;　　　　失败: 返回默认值。如INI文件或字段不存在或读取错误 将设置 @error=1；@Error=2 关键字不存在。
;==========================================================================================start
Func _IniRead($iFile, $Section, $key, $default = '', $mode = 0)
	Local $s_Sec = _IniReadSection_str($iFile, $Section, $mode)
	If @error = 1 Then Return SetError(1, 0, $default)
	If @error = 2 Then Return SetError(3, 0, $default)
	Local $_key = StringRegExpReplace($key, '^\h*|\h*$', '')
	Local $aVal = StringRegExp(@LF & $s_Sec & @LF, '(?i)\n\h*\Q' & $_key & '\E\h*\=\h*(\V*?)\h*\v', 1)
	If @error Then Return SetError(2, 0, $default)
	Return $aVal[0]
EndFunc   ;==>_IniRead


; 函数名:_IniReadSection;======================================================================
; 说明:　从INI结构文件中读取某个字段中的所有关键字或值。
;　　　　原IniReadSection函数只有在字段中的前32767字符可以被正常返回,本函数无此限制(初衷在于此)。
;　　　　原IniReadSection函数遇到某些文件特殊的回车及换行组合会停止继续而返回，本函数会完整读出。
;　　　　其它与原IniReadSection函数不同：不返回无关键字的值;既无关键字又无值只有等号的也不被返回。
; 语法:　_IniReadSection('ini文件路径', '字段名'[, 打开模式])
; 返回值:成功: 返回一个二维数组,其中：元素[0][0]=大小、元素[n][0]=关键字、元素[n][1]=对应的数值。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
;==========================================================================================start
Func _IniReadSection($iFile, $Section, $mode = 0)
	Local $s_Sec, $a_1, $ii = 1, $i
	$s_Sec = _IniReadSection_str($iFile, $Section, $mode)
	If @error Then Return SetError(@error, 0, 0)
	$a_1 = StringRegExp($s_Sec & @LF, '\n\h*([^=;\s][^=\v]*?)\h*\=\h*(\V*?)\h*(?=\v)', 3)
	If @error Then Return SetError(2, 0, 0)
	Local $2_array[UBound($a_1) / 2 + 1][2] = [[UBound($a_1) / 2]]
	For $i = 0 To UBound($a_1) - 1 Step 2
		$2_array[$ii][0] = $a_1[$i]
		$2_array[$ii][1] = $a_1[$i + 1]
		$ii += 1
	Next
	Return $2_array
EndFunc   ;==>_IniReadSection


; 函数名:_IniReadSectionNames;===============================================================
; 说明:　从INI结构文件中读取所有字段的信息。
;　　　　原IniReadSectionNames函数只有前32767字符有效,本函数无此限制。
;　　　　其它与原IniReadSectionNames函数不同：
;　　　　    - 本函数可选择打开模式，以便完整读出所有字段名。
;　　　　    - 不返回外面无"]"包括的字段名;
;　　　　    - 不返回空的字段名（即"[]"）;
;　　　　    - 可返回由"[]"包括的行内所有字符为字段名，可包含[]，如"[a[b]]"返回名为"a[b]"的字段名，
;　　　　      如需读取"a[b]"之类包含"["或"]"字段的关键字或值，需使用 _IniReadSection() 函数。
; 语法:　_IniReadSectionNames('ini文件路径'[, 打开模式[, 标志]])
; 参数:　可选参数“标志”，标志=1时返回的数组0号元素为数组的元素数量(默认)；标志=0时关闭0元素返回数量
; 返回值:成功: 返回一个含有所有字段名的数组。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1
;=====================================================================================start
Func _IniReadSectionNames($iFile, $mode = 0, $flag = 1)
	Local $s_File = _FileRead($iFile, $mode)
	Local $Section = StringRegExp(@LF & $s_File, '\n\h*\[\h*(.*[^\h])\h*\]', 3)
	If @error Then Return SetError(1, 0, 0)
	If $flag = 0 Then Return $Section
	Local $_Section[UBound($Section) + 1], $i
	$_Section[0] = UBound($Section)
	For $i = 0 To $_Section[0] - 1
		$_Section[$i + 1] = $Section[$i]
	Next
	Return $_Section
EndFunc   ;==>_IniReadSectionNames


; 函数名:_IniRenameSection;=====================================================================
; 说明:　重命名INI结构文件里面的字段。
; 语法:　_IniRenameSection('ini文件路径', '原字段名', '新字段名'[, 打开模式])
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 原字段不存在；
;　　　　　　　　　　　　　　@Error=2 新字段已存在；
;　　　　　　　　　　　　　　@Error=3 文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniRenameSection($iFile, $Section, $new_Section, $mode = 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(1, 0, 0)
	Local $_new_Section = StringRegExpReplace($new_Section, '^\h*(.+?)\h*$', '$1')
	$_new_Section = StringRegExpReplace($_new_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_new_Section = '\[\h*' & $_new_Section & '\h*\]'
	If StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_new_Section & '\s*') Then Return SetError(2, 0, 0)
	Local $resdata = StringRegExpReplace(@CRLF & $s_File, '(?si)(.*\r?\n\h*)(' & $_Section & '\h*)(.*)', '${1}[' & $new_Section & ']$3')
	$resdata = StringTrimLeft($resdata, 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $resdata)
	FileClose($FO)
	If $Write = 0 Then Return SetError(3, 0, 0)
	Return 1
EndFunc   ;==>_IniRenameSection


; 函数名:_IniRenameKey;========================================================================
; 说明:　重命名INI结构文件里面的关键字。
; 语法:　_IniRenameKey('ini文件路径', '字段名', '原关键字', '新关键字'[, 打开模式])
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 原关键字不存在；
;　　　　　　　　　　　　　　@Error=2 新关键字已存在；
;　　　　　　　　　　　　　　@Error=3 新关键字为空或仅含有空格或首个非空格字符为“[”
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniRenameKey($iFile, $Section, $Key, $new_key, $mode = 0)
	If StringRegExp($new_key, '^\s*(?:\[.*)?$') Then Return SetError(3, 0, 0)
	_IniRead($iFile, $Section, $Key, @LF, $mode)
	If @error Then Return SetError(1, 0, 0)
	_IniRead($iFile, $Section, $new_key, @LF, $mode)
	If Not @error Then Return SetError(2, 0, 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	Local $_key = StringRegExpReplace($Key, '^\h*(.+?)\h*$', '$1')
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Local $_new_key = StringRegExpReplace($new_key, '^\h*(.+?)\h*$', '$1')
	$_new_key = StringRegExpReplace($_new_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Local $resdata = StringRegExpReplace(@CRLF & $s_File, '(?si)(.*\r?\n\h*' & $_Section & '.*?\r?\n)\h*(' & $_key & ')\h*(\=.*)', '${1}' & $_new_key & '$3')
	$resdata = StringTrimLeft($resdata, 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $resdata)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniRenameKey


; 函数名:_IniWrite;=============================================================================
; 说明:　写入一个值到INI结构文件。
; 语法:　_IniWrite('ini文件路径', '字段名', '关键字', '值'[, 打开模式])
; 返回值:成功: 正常写入返回1；已存在相同的关键字及值则不写入，返回2。
;　　　　失败: 返回0。文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniWrite($iFile, $Section, $key, $Val, $mode = 0)
	Local $_Val = StringRegExpReplace($Val, '^\h*(.+?)\h*$', '$1')
	$vr = _IniRead($iFile, $Section, $key, @LF, $mode)
	Local $Error = @error, $s_data, $Write
	If $vr = $_Val Then Return 2
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	Local $_key = StringRegExpReplace($key, '^\h*(.+?)\h*$', '$1')
	Local $data = '[' & $_Section & ']' & @CRLF & $_key & '=' & $_Val
	Local $FO = FileOpen($iFile, $mode + 2)
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	$_Val = StringRegExpReplace($_Val, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Switch $Error
		Case 0
			$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n\h*' & $_Section & '.*?\r?\n\h*' & $_key & '\h*\=)(\V*)(.*)', '${1}' & $_Val & '$3')
			$s_data = StringTrimLeft($s_data, 2)
			$s_data = StringTrimRight($s_data, 3)
			$Write = FileWrite($FO, $s_data)
		Case 1
			If $s_File <> '' Then $s_File = StringRegExpReplace($s_File, '(\r?\n)*$', '') & @CRLF
			$Write = FileWrite($FO, $s_File & $data & @CRLF)
		Case 2, 3
			$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n\h*' & $_Section & '.*?)((?:\r?\n)+)(\h*\[.*)', '$1' & @CRLF & $_key & '=' & $_Val & '$2$3')	;131022修正*为+
			$s_data = StringTrimLeft($s_data, 2)
			$s_data = StringTrimRight($s_data, 3)
			$Write = FileWrite($FO, $s_data)
	EndSwitch
	FileClose($FO)
	If $Write = 0 Then Return 0
	Return 1
EndFunc   ;==>_IniWrite


; 函数名:_IniWriteSection;=====================================================================
; 说明:　将数据写入到INI结构文件的一个字段。
;　　　　且本函数在写入前会先对数据进行整理，去除无效的键值及多余的首尾空格，而非原IniWriteSection
;　　　　函数不加分析的全部写入。
; 语法:　_IniWriteSection('ini文件路径', '字段名', '数据'[, '索引'[, 打开模式]])
; 参数:　可选参数'索引'，此参数仅在数据为数组时有效, 指定开始写入的索引，默认为 1。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 数组非2维或第2维非2；
;　　　　　　　　　　　　　　@Error=2 数据格式错误；
;　　　　　　　　　　　　　　@Error=3 文件具有只读属性或者无法写入数据设置。
; 注意:　如果字段已存在，将会先清空原键值。
;==========================================================================================start
Func _IniWriteSection($iFile, $Section, $data, $index = 1, $mode = 0)
	Local $_data, $s_data = '', $s_Section = '', $key, $i, $FO, $Write, $CRLF = @CRLF
	If IsArray($data) Then
		If UBound($data, 0) <> 2 Or UBound($data, 2) <> 2 Then Return SetError(1, 0, 0)
		For $i = $index To UBound($data) - 1
			$key = StringRegExpReplace($data[$i][0], '^\h*([^=;\s].+?)\h*$', '$1')
			If Not StringRegExp($key, '^\s*$') Then $s_Section &= $key & '=' & StringRegExpReplace($data[$i][1], '^\h*([^=;\s].+?)\h*$', '$1') & @CRLF
		Next
		If $s_Section = '' Then Return SetError(2, 0, 0)
	Else
		$_data = StringRegExp(@CRLF & $data & @CRLF, '\n\h*([^=;\s].*?)\h*\=\h*(.*?)\h*(?=\r?\n)', 3)
		If @error Then Return SetError(2, 0, 0)
		For $i = 0 To UBound($_data) - 1 Step 2
			$s_Section &= $_data[$i] & '=' & $_data[$i + 1] & @CRLF
		Next
	EndIf
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$Section = '[' & $_Section & ']' & @CRLF
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n)\h*' & $_Section & '.*?(\[.*)', '${1}' & $Section & $s_Section & '$2')
	If @extended > 0 Then
		$s_data = StringTrimLeft($s_data, 2)
		$s_data = StringTrimRight($s_data, 3)
	Else
		If $s_File = '' Then $CRLF = ''
		$s_data = StringRegExpReplace($s_File, '(\r?\n)*$', '') & $CRLF & $Section & $s_Section
	EndIf
	$FO = FileOpen($iFile, $mode + 2)
	$Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(3, 0, 0)
	Return 1
EndFunc   ;==>_IniWriteSection


; 函数名:_IniReadSection_str;===================================================================
; 说明:　从(非)标准INI结构文件中读取某个字段(可选重复字段名)中的所有字符。
; 语法:　_IniReadSection_str('ini文件路径', '字段名'[, 打开模式[, 重复标志]])
; 参数:　重复标志 - [可选]，有些inf文件会有重复的字段名，设置此标志为1时可读取所有内容。
; 返回值:成功: 返回字段中的所有字符。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
;==========================================================================================start
Func _IniReadSection_str($iFile, $Section, $mode = 0, $nFlag = 0)
	Local $s_File = _FileRead($iFile, $mode), $line_all
	Local $_Section = StringRegExpReplace($Section, '^\h*|\h*$', '')
        Local $s_Sec = StringRegExp($s_File, '(?si)(?:^|\n)\h*\[\h*\Q' & $_Section & '\E\h*\](.+?)(?=\r?\n\h*\[|$)', 3)
	If @error Then Return SetError(1, 0, 0)
	$line_all = $s_Sec[0]
	If $nFlag Then
        	For $i = 1 To UBound($s_Sec) - 1
                	$line_all &= $s_Sec[$i]
        	Next
	Endif
	If Not StringRegExp($line_all, '\V') Then Return SetError(2, 0, 0)
	Return $line_all
EndFunc   ;==>_IniReadSection_str


; 函数名:_IniReadSection_line;===================================================================
; 说明:　从(非)标准INI结构文件中逐行读取某个字段中的字符到一个1维数组。
; 语法:　_IniReadSection_line('ini文件路径', '字段名'[, 打开模式[, 重复标志]])
; 参数:　重复标志 - [可选]，有些inf文件会有重复的字段名，设置此标志为1时可读取所有内容。
; 返回值:成功: 返回一个1维数组，每个元素为字段中一行字符。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
; 注意:　每行字符串的首尾空格均会排除；不会返回第一个非空格字符为“;”的注释行。
;==========================================================================================start
Func _IniReadSection_line($iFile, $Section, $mode = 0, $nFlag = 0)
	Local $s_Sec = _IniReadSection_str($iFile, $Section, $mode, $nFlag)
	If @error Then Return SetError(@error, 0, 0)
        Local $s_line = StringRegExp($s_Sec, '\n\h*([^;\s].*?)\h*(?=\r?\n|$)', 3)
	If @error Then Return SetError(2, 0, 0)
	Return $s_line
EndFunc   ;==>_IniReadSection_line


; 函数名:_FileRead;============================================================================
; 说明:　用FileOpen的打开模式返回读取文件的字符串
;==========================================================================================start
Func _FileRead($iFile, $mode = 0)
	Local $o_File = FileOpen($iFile, $mode)
	Local $s_File = String(FileRead($o_File))
	FileClose($o_File)
	Return $s_File
EndFunc   ;==>_FileRead


; 函数名:_IniDelete_line;=============================================================================
; 说明:　从(非)标准INI结构文件中删除(含有)关键字的行。
; 语法:　_IniDelete_line('ini文件路径', '字段名', '关键字'[, 匹配标志[, 打开模式]])
; 参数:　可选参数 匹配标志，= 0 含有要删除的关键字(默认)； = 1 完整匹配关键字。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 文件或字段不存在；
;　　　　　　　　　　　　　　@Error=3 根据匹配标志未匹配到关键字(不存在)；
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据设置。
; 注意:　该函数仅执行一次删除行，如有多行(含有)关键字的行需要删除，可多次执行。
;==========================================================================================start
Func _IniDelete_line($iFile, $Section, $key, $flag = 0, $mode = 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(1, 0, 0)
	Local $_key = StringRegExpReplace($key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	If $flag = 0 Then $_key = '[^\r?\n]*?' & $_key & '.*?'
	Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF, '(?si)(.*?\r?\n\h*' & $_Section & '\h*\r?\n(?:\h*[^\[\r\n]*\r?\n)*?)' & $_key & '\r?\n(.*)', '${1}$2')
	If @Extended = 0 Then Return SetError(3, 0, 0)
	$s_data = StringTrimRight(StringTrimLeft($s_data, 2), 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniDelete_line

