#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=C:\Windows\system32\SHELL32.dll|-123
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#cs
判断mysql路径
#ce
#include <file.au3>
#include <array.au3>

Global $mysqlPath, $mysqldump, $dbuser, $dbpass, $dbname, $dumpfile = 'mysqldump.exe'

main()

Func main()
	If $cmdline[0] < 4 Then quit("缺少参数！")
	
	$dbuser = $cmdline[1]
	$dbpass = $cmdline[2]
	$dbname = $cmdline[3]
	$do = $cmdline[4]
	
	FileInstall('mysqldump.exe', $dumpfile)
	
	$mysqlPath = getMysql()
	$mysqldump = getMysql($mysqlPath, 'mysqldump.exe')
	If $mysqldump == False Then quit('未指定mysqldump路径！')
	
	If $do > 0 Then
		import()
	Else
		export()
	EndIf
	
	quit()
EndFunc

Func export()
	Local $tabMatchs, $tabMatchsFile, $tmpBat, $i, $bats
	
	$tabMatchsFile = @ScriptDir &'\'& $dbname & '.tabs'
	$tmpBat = $tabMatchsFile & '.bat'
	$cmd = '"' & $mysqldump & '" -u' &$dbuser& ' -p' &$dbpass& ' -d ' &$dbname& ' >"' & $tabMatchsFile &'"'
	FileWrite($tmpBat, $cmd)
	ShellExecuteWait($tmpBat, "", "", "", @SW_HIDE)
	FileDelete($tmpBat)
	$tabMatchs = StringRegExp(FileRead($tabMatchsFile), '(?im)\sCREATE\s+TABLE\s+`([^`]+)`\s+\(\s', 3)
	If @error Then quit('获取数据表列表失败!')
	For $i = 0 To UBound($tabMatchs) - 1
		$cmd = '"' & $mysqldump & '" -u' &$dbuser& ' -p' &$dbpass& ' --add-drop-table ' &$dbname& ' ' &$tabMatchs[$i]& ' > "' & @ScriptDir &'\'& $tabMatchs[$i] &'.sql"'
		$bats &= $cmd & @CRLF
	Next
	FileWrite($tmpBat, $bats)
	ShellExecuteWait($tmpBat, "", "", "", @SW_HIDE)
	FileDelete($tabMatchsFile)
	FileDelete($tmpBat)
EndFunc

Func import()
	Local $mysql, $sqls, $bats, $tmpBat = @ScriptDir &'\'& $dbname & '.bat', $filename

	$mysql = getMysql($mysqlPath, 'mysql.exe')
	If Not $mysql Then quit('未找到mysql安装路径！')
	
	$sqls = _FileListToArray(@ScriptDir, '*.sql', 1)
	If @error Then quit('未找到备份数据表文件！')
	For $i = 1 To $sqls[0]
		$filename = StringRegExp($sqls[$i], '^(.+)\.sql$', 3)
		$cmd = '"' & $mysqldump & '" -u' &$dbuser& ' -p' &$dbpass& ' --add-drop-table ' &$dbname& ' '&$filename[0]& ' > "' & @ScriptDir &'\'& $sqls[$i] &'.bak"'
		$cmd &= @CRLF & '"' & $mysql & '" -u' &$dbuser& ' -p' &$dbpass& ' ' &$dbname& ' < "' & @ScriptDir &'\'& $sqls[$i] &'"'
		$bats &= $cmd & @CRLF
	Next
	FileWrite($tmpBat, $bats)
	ShellExecuteWait($tmpBat, "", "", "", @SW_HIDE)
	FileDelete($tmpBat)
EndFunc

Func getMysql($path = Default, $get = 'mysql.exe')
	If $path <> Default Then
		$path = $path & '\' & $get
		If FileExists($path) Then Return $path
		If FileExists(@ScriptDir & '\' & $get) Then Return @ScriptDir & '\' & $get
		Return False
	EndIf
	
	Local $mySqlPath = False, $attrs
	
	$path = EnvGet('path')
	$mySqlPath = StringRegExp($path, '(?:^|;)([^;]*?\bmysql\b[^;]*?)(?:;|$)', 3)
	If Not @error And FileExists($mySqlPath[0]) Then
		$mySqlPath = $mySqlPath[0]
	Else
		If $cmdLine[0] > 4 Then $mySqlPath = $cmdLine[5]
		If Not FileExists($mySqlPath) Then
			If FileExists(@ProgramFilesDir & '\mysql\bin') Then $mySqlPath = @ProgramFilesDir & '\mysql\bin'
		EndIf
	EndIf
	If Not FileExists($mySqlPath) Then Return False

	$attrs = FileGetAttrib($mySqlPath)
	If StringInStr($attrs, 'D') Then Return $mySqlPath
	Return StringRegExpReplace($mySqlPath, '[\\/][^\\/]+?$', '')
EndFunc

Func quit($message = Default)
	If Not ($message == Default) Then MsgBox(16,'操作失败！',$message)
	FileDelete($dumpfile)
	Exit
EndFunc