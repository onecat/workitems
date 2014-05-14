#include-Once

#cs\\\\\\\\\\\\\\\\\\\\\\\\\\\\ #include <_Ini.au3> \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	������д���������ԭ��
	����1�����ú�������ĳЩini�ļ����ڱ��������д���󣬱���ϵ�к������Ӵ�ģʽ(��32)������ȷ��д��
	����2�����ú�����Ч���ݽ���32767�ַ����Ա��������أ�����ϵ�к����޴����ơ�

	������ǰ�汾��v1.2.0.0
	
	��������˵����
	����_IniDelete-----------;��INI�ṹ�ļ���ɾ��ĳ����ֵ.
	����_IniRead-------------;��INI�ṹ�ļ��ж�ȡĳ����ֵ.
	����_IniReadSection------;��INI�ṹ�ļ��ж�ȡĳ���ֶ��е����йؼ��ּ�ֵ.
	����_IniReadSectionNames-;��INI�ṹ�ļ��ж�ȡ�����ֶ���.
	����_IniRenameSection----;������INI�ṹ�ļ�������ֶ���.
	����_IniRenameKey--------;������INI�ṹ�ļ�����Ĺؼ���.
	����_IniWrite------------;д��һ����ֵ��INI�ṹ�ļ�.
	����_IniWriteSection-----;������д�뵽INI�ṹ�ļ���һ���ֶ�.
	
	����_IniReadSection_str--;��(��)��׼INI�ṹ�ļ��ж�ȡĳ���ֶ��е������ַ�.
	����_IniReadSection_line-;��(��)��׼INI�ṹ�ļ��ж�ȡĳ���ֶ��е����ַ���.
	����_FileRead------------;��ָ����FileOpen��ģʽ���ض�ȡ�ļ����ַ���.
	����_IniDelete_line------;��(��)��׼INI�ṹ�ļ���ɾ��(����)�ؼ��ֵ���.

	����ע�⣺
	������������ļ���ֵ���硰abc=123=AAA�� ԭ���ϡ�abc��Ӧ�ò�Ϊ�ؼ��֣���123=AAA��Ϊֵ��
	��������淶֮����������ʱ����ܻ��С�abc=123��Ϊ�ؼ��֣���AAA��Ϊֵ���������ú�����û��ѡ�ģ���
	������ˣ����ﲻǿ��Ϊ��һ�������ֻ��ע�����¼��㣨��Ȼ��ֻ��1���Ⱥž�����ע����Щ�ˣ���
	����1��_IniReadSection ���������Ϊ�����õ�һ���������abc��Ϊ�ؼ��֣���123=AAA��Ϊֵ
	����2��_IniDelete��_IniRead��_IniRenameKey��_IniWrite ��ͬʱ�������������
	
	��������������������-- Afan -- http://www.autoitx.com -- 2010-6-28 --������ 2014-02-28
#ce\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


; ������:_IniDelete;=============================================================================
; ˵��:����INI�ṹ�ļ���ɾ��ĳ����ֵ��
; �﷨:��_IniDelete('ini�ļ�·��', '�ֶ���'[, '�ؼ���'[, ��ģʽ]])
; ����:����ѡ����'�ؼ���'��Ҫɾ���Ĺؼ��֣�����ָ���ؼ��ֻ�ʹ��Default�ؼ����������ֶν���ɾ����
; ����ֵ:�ɹ�: ����1��
;��������ʧ��: ����0�������� @Error Ϊ����ֵ��
;����������������������������@Error=1 �ļ������ڣ�
;����������������������������@Error=2 �ֶβ����ڣ�
;����������������������������@Error=3 �ؼ��ֲ�����
;����������������������������@Error=4 �ļ�����ֻ�����Ի����޷�д���������á�
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


; ������:_IniRead;=============================================================================
; ˵��:����INI�ṹ�ļ��ж�ȡĳ����ֵ��
; �﷨:��_IniRead('ini�ļ�·��', '�ֶ���', '�ؼ���'[, 'Ĭ��ֵ'[, ��ģʽ]])
; ����ֵ:�ɹ�: ����ָ���Ĺؼ��ֵ�ֵ��
;��������ʧ��: ����Ĭ��ֵ����INI�ļ����ֶβ����ڻ��ȡ���� ������ @error=1��@Error=2 �ؼ��ֲ����ڡ�
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


; ������:_IniReadSection;======================================================================
; ˵��:����INI�ṹ�ļ��ж�ȡĳ���ֶ��е����йؼ��ֻ�ֵ��
;��������ԭIniReadSection����ֻ�����ֶ��е�ǰ32767�ַ����Ա���������,�������޴�����(�������ڴ�)��
;��������ԭIniReadSection��������ĳЩ�ļ�����Ļس���������ϻ�ֹͣ���������أ�������������������
;��������������ԭIniReadSection������ͬ���������޹ؼ��ֵ�ֵ;���޹ؼ�������ֵֻ�еȺŵ�Ҳ�������ء�
; �﷨:��_IniReadSection('ini�ļ�·��', '�ֶ���'[, ��ģʽ])
; ����ֵ:�ɹ�: ����һ����ά����,���У�Ԫ��[0][0]=��С��Ԫ��[n][0]=�ؼ��֡�Ԫ��[n][1]=��Ӧ����ֵ��
;��������ʧ��: ����0����INI�ļ���ȡ������ֶβ����ڽ����� @error=1���ֶ�����Ϊ�ս����� @error=2
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


; ������:_IniReadSectionNames;===============================================================
; ˵��:����INI�ṹ�ļ��ж�ȡ�����ֶε���Ϣ��
;��������ԭIniReadSectionNames����ֻ��ǰ32767�ַ���Ч,�������޴����ơ�
;��������������ԭIniReadSectionNames������ͬ��
;��������    - ��������ѡ���ģʽ���Ա��������������ֶ�����
;��������    - ������������"]"�������ֶ���;
;��������    - �����ؿյ��ֶ�������"[]"��;
;��������    - �ɷ�����"[]"���������������ַ�Ϊ�ֶ������ɰ���[]����"[a[b]]"������Ϊ"a[b]"���ֶ�����
;��������      �����ȡ"a[b]"֮�����"["��"]"�ֶεĹؼ��ֻ�ֵ����ʹ�� _IniReadSection() ������
; �﷨:��_IniReadSectionNames('ini�ļ�·��'[, ��ģʽ[, ��־]])
; ����:����ѡ��������־������־=1ʱ���ص�����0��Ԫ��Ϊ�����Ԫ������(Ĭ��)����־=0ʱ�ر�0Ԫ�ط�������
; ����ֵ:�ɹ�: ����һ�����������ֶ��������顣
;��������ʧ��: ����0����INI�ļ���ȡ������ֶβ����ڽ����� @error=1
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


; ������:_IniRenameSection;=====================================================================
; ˵��:��������INI�ṹ�ļ�������ֶΡ�
; �﷨:��_IniRenameSection('ini�ļ�·��', 'ԭ�ֶ���', '���ֶ���'[, ��ģʽ])
; ����ֵ:�ɹ�: ����1��
;��������ʧ��: ����0�������� @Error Ϊ����ֵ��
;����������������������������@Error=1 ԭ�ֶβ����ڣ�
;����������������������������@Error=2 ���ֶ��Ѵ��ڣ�
;����������������������������@Error=3 �ļ�����ֻ�����Ի����޷�д�����ݡ�
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


; ������:_IniRenameKey;========================================================================
; ˵��:��������INI�ṹ�ļ�����Ĺؼ��֡�
; �﷨:��_IniRenameKey('ini�ļ�·��', '�ֶ���', 'ԭ�ؼ���', '�¹ؼ���'[, ��ģʽ])
; ����ֵ:�ɹ�: ����1��
;��������ʧ��: ����0�������� @Error Ϊ����ֵ��
;����������������������������@Error=1 ԭ�ؼ��ֲ����ڣ�
;����������������������������@Error=2 �¹ؼ����Ѵ��ڣ�
;����������������������������@Error=3 �¹ؼ���Ϊ�ջ�����пո���׸��ǿո��ַ�Ϊ��[��
;����������������������������@Error=4 �ļ�����ֻ�����Ի����޷�д�����ݡ�
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


; ������:_IniWrite;=============================================================================
; ˵��:��д��һ��ֵ��INI�ṹ�ļ���
; �﷨:��_IniWrite('ini�ļ�·��', '�ֶ���', '�ؼ���', 'ֵ'[, ��ģʽ])
; ����ֵ:�ɹ�: ����д�뷵��1���Ѵ�����ͬ�Ĺؼ��ּ�ֵ��д�룬����2��
;��������ʧ��: ����0���ļ�����ֻ�����Ի����޷�д�����ݡ�
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
			$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n\h*' & $_Section & '.*?)((?:\r?\n)+)(\h*\[.*)', '$1' & @CRLF & $_key & '=' & $_Val & '$2$3')	;131022����*Ϊ+
			$s_data = StringTrimLeft($s_data, 2)
			$s_data = StringTrimRight($s_data, 3)
			$Write = FileWrite($FO, $s_data)
	EndSwitch
	FileClose($FO)
	If $Write = 0 Then Return 0
	Return 1
EndFunc   ;==>_IniWrite


; ������:_IniWriteSection;=====================================================================
; ˵��:��������д�뵽INI�ṹ�ļ���һ���ֶΡ�
;���������ұ�������д��ǰ���ȶ����ݽ�������ȥ����Ч�ļ�ֵ���������β�ո񣬶���ԭIniWriteSection
;���������������ӷ�����ȫ��д�롣
; �﷨:��_IniWriteSection('ini�ļ�·��', '�ֶ���', '����'[, '����'[, ��ģʽ]])
; ����:����ѡ����'����'���˲�����������Ϊ����ʱ��Ч, ָ����ʼд���������Ĭ��Ϊ 1��
; ����ֵ:�ɹ�: ����1��
;��������ʧ��: ����0�������� @Error Ϊ����ֵ��
;����������������������������@Error=1 �����2ά���2ά��2��
;����������������������������@Error=2 ���ݸ�ʽ����
;����������������������������@Error=3 �ļ�����ֻ�����Ի����޷�д���������á�
; ע��:������ֶ��Ѵ��ڣ����������ԭ��ֵ��
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


; ������:_IniReadSection_str;===================================================================
; ˵��:����(��)��׼INI�ṹ�ļ��ж�ȡĳ���ֶ�(��ѡ�ظ��ֶ���)�е������ַ���
; �﷨:��_IniReadSection_str('ini�ļ�·��', '�ֶ���'[, ��ģʽ[, �ظ���־]])
; ����:���ظ���־ - [��ѡ]����Щinf�ļ������ظ����ֶ��������ô˱�־Ϊ1ʱ�ɶ�ȡ�������ݡ�
; ����ֵ:�ɹ�: �����ֶ��е������ַ���
;��������ʧ��: ����0����INI�ļ���ȡ������ֶβ����ڽ����� @error=1���ֶ�����Ϊ�ս����� @error=2
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


; ������:_IniReadSection_line;===================================================================
; ˵��:����(��)��׼INI�ṹ�ļ������ж�ȡĳ���ֶ��е��ַ���һ��1ά���顣
; �﷨:��_IniReadSection_line('ini�ļ�·��', '�ֶ���'[, ��ģʽ[, �ظ���־]])
; ����:���ظ���־ - [��ѡ]����Щinf�ļ������ظ����ֶ��������ô˱�־Ϊ1ʱ�ɶ�ȡ�������ݡ�
; ����ֵ:�ɹ�: ����һ��1ά���飬ÿ��Ԫ��Ϊ�ֶ���һ���ַ���
;��������ʧ��: ����0����INI�ļ���ȡ������ֶβ����ڽ����� @error=1���ֶ�����Ϊ�ս����� @error=2
; ע��:��ÿ���ַ�������β�ո�����ų������᷵�ص�һ���ǿո��ַ�Ϊ��;����ע���С�
;==========================================================================================start
Func _IniReadSection_line($iFile, $Section, $mode = 0, $nFlag = 0)
	Local $s_Sec = _IniReadSection_str($iFile, $Section, $mode, $nFlag)
	If @error Then Return SetError(@error, 0, 0)
        Local $s_line = StringRegExp($s_Sec, '\n\h*([^;\s].*?)\h*(?=\r?\n|$)', 3)
	If @error Then Return SetError(2, 0, 0)
	Return $s_line
EndFunc   ;==>_IniReadSection_line


; ������:_FileRead;============================================================================
; ˵��:����FileOpen�Ĵ�ģʽ���ض�ȡ�ļ����ַ���
;==========================================================================================start
Func _FileRead($iFile, $mode = 0)
	Local $o_File = FileOpen($iFile, $mode)
	Local $s_File = String(FileRead($o_File))
	FileClose($o_File)
	Return $s_File
EndFunc   ;==>_FileRead


; ������:_IniDelete_line;=============================================================================
; ˵��:����(��)��׼INI�ṹ�ļ���ɾ��(����)�ؼ��ֵ��С�
; �﷨:��_IniDelete_line('ini�ļ�·��', '�ֶ���', '�ؼ���'[, ƥ���־[, ��ģʽ]])
; ����:����ѡ���� ƥ���־��= 0 ����Ҫɾ���Ĺؼ���(Ĭ��)�� = 1 ����ƥ��ؼ��֡�
; ����ֵ:�ɹ�: ����1��
;��������ʧ��: ����0�������� @Error Ϊ����ֵ��
;����������������������������@Error=1 �ļ����ֶβ����ڣ�
;����������������������������@Error=3 ����ƥ���־δƥ�䵽�ؼ���(������)��
;����������������������������@Error=4 �ļ�����ֻ�����Ի����޷�д���������á�
; ע��:���ú�����ִ��һ��ɾ���У����ж���(����)�ؼ��ֵ�����Ҫɾ�����ɶ��ִ�С�
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

