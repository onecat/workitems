#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
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
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <Array.au3>
#include <Constants.au3>
 
; ------------------------------------------------------------------------
; 本机备份MySQL数据库
; ------------------------------------------------------------------------
; 定义和意义:
; $export_defs .....    结合两个常量: $cEXPORT_DB + ($cEXPORT_TO_... 和 $cEXPORT_AS_...)
;   例如[ $cEXPORT_DB_ALL_DATABASES + $cEXPORT_TO_SINGLE_FILE ] => 所有DBS导出到一个文件
; $custom_dbs ...... 用户创建的数据库。使用逗号分隔，例如“Drupal的，joomla
; $export_path ..... 导出目的地文件夹
; $dbUsr ........... 用户登录账号，通常是'root'
; $dbPwd ........... MySQL登陆密码
; $dbSrv ........... MySQL 服务器, 127.0.0.1 代表本机
; $sMySqlPath ...... MySQL的bin目录的完整路径
; $sSytemDbs ....... MySql安装过程中创建的默认数据库
 
; 使用这个常数变量$export_defs:
Const $cEXPORT_DB_SYSTEMS_ONLY = 1 ; 默认导出数据库(如XAMPP默认数据库)
Const $cEXPORT_DB_NON_SYSTEMS = 2 ;导出用户创建的数据库(例如，所有非XAMPP默认DBS)
Const $cEXPORT_DB_ALL_DATABASES = 4 ; 导出所有数据库
Const $cEXPORT_DB_CUSTOM_DATABASES = 8 ; 导出选定的数据库 (例如仅导出'Drupal' 数据库)
 
Const $cEXPORT_TO_SINGLE_FILE = 128 ; 导出数据库为sql文件
Const $cEXPORT_AS_SEPARATE_FILES = 256 ; 每个存储的数据库导出sql文件区分开来
 
;=== 用户定义 ===================================================>>
Local $export_defs = $cEXPORT_DB_CUSTOM_DATABASES + $cEXPORT_AS_SEPARATE_FILES
;Local $export_defs    = $cEXPORT_DB_NON_SYSTEMS + $cEXPORT_TO_SINGLE_FILE
Local $custom_dbs = "drupal" ; 多个数据库使用逗号分隔，例如 "drupal, joomla"
Local $export_path = "E:\Backup\FullBackup\Aplikace\MySQL"
Local $dbUsr = "root"
Local $dbPwd = "123456"
Local $dbSrv = "127.0.0.1"
Local $sMySqlPath = "C:\xampp\mysql\bin\"
Local $sSytemDbs = "cdcol, information_schema, mysql, performance_schema , phpmyadmin, test, webauth"
;=== 用户定义 ====  (这条线之下，什么都不要改) ====<<
 
$export_path = StringRegExpReplace($export_path, "[\\/]+\z", "") & "\"
$sMySqlPath = StringRegExpReplace($sMySqlPath, "[\\/]+\z", "") & "\"
Local $sMySqlExe = FileGetShortName($sMySqlPath & "mysql.exe")
Local $sMySqlDmpExe = FileGetShortName($sMySqlPath & "mysqldump.exe")
Local $sFormat = "%s -u %s -p%s -h%s %s -e ""show databases"" -s -N"
Local $sExtCmd = StringFormat($sFormat, $sMySqlExe, $dbUsr, $dbPwd, $dbSrv)
Local $aSytemDbs = StringSplit(StringStripWS($sSytemDbs, 8), ",", 2)
Const $2L = @LF & @LF
 
If FileExists($sMySqlExe) <> 1 Then
        MsgBox(8240, "MySql.exe不存在", "mysql.exe不存在!" & $2L & _
                        "检查路径变量 '$export_path' 设置不正确.")
        Exit
EndIf
 
; 运行CMD 
Local $CMD = Run(@ComSpec & " /c " & $sExtCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
ProcessWaitClose($CMD)
Local $sMsg = StdoutRead($CMD)
Local $sErr = StderrRead($CMD)
 
; 如果是 mysql.exe发生错误 (例如 服务没有启动)
If StringInStr($sErr, "ERROR") <> 0 Then
        MsgBox(8208, "错误", $sErr)
        Exit
EndIf
If StringLen($sMsg) = 0 Then
        MsgBox(8208, "Error", "无法获得数据库名称")
        Exit
EndIf
 
; 读取全部已安装的数据库到数组$aAllDbs
Local $aAllDbs = StringSplit($sMsg, Chr(13), 2)
For $i = UBound($aAllDbs) - 1 To 0 Step -1
        $aAllDbs[$i] = StringStripWS($aAllDbs[$i], 3)
        If StringLen($aAllDbs[$i]) = 0 Then
                _ArrayDelete($aAllDbs, $i)
        EndIf
Next
 
; 移动选定数据库名到$aDbs数组
Select
        Case BitAND($export_defs, $cEXPORT_DB_SYSTEMS_ONLY) <> 0
                $aDbs = $aSytemDbs
                Local $sResult = fncItemsInArray($aDbs, $aAllDbs)
                If @error Then
                        MsgBox(8240, "错误", "定义的系统数据库名称 '" & $sResult & "' 不存在!")
                        Exit
                EndIf
        Case BitAND($export_defs, $cEXPORT_DB_NON_SYSTEMS) <> 0
                $aDbs = fncArrayExclude($aAllDbs, $aSytemDbs)
        Case BitAND($export_defs, $cEXPORT_DB_ALL_DATABASES) <> 0
                $aDbs = $aAllDbs
        Case BitAND($export_defs, $cEXPORT_DB_CUSTOM_DATABASES) <> 0
                $aDbs = StringSplit(StringStripWS($custom_dbs, 8), ",", 2)
                Local $sResult = fncItemsInArray($aDbs, $aAllDbs)
                If @error Then
                        MsgBox(8240, "错误", "定义的自定义数据库名称 '" & $sResult & "' 不存在!")
                        Exit
                EndIf
EndSelect
 
; 导出
Local $sOutFile
Local $sFileFirstPart = $export_path & @YEAR & @MON & @MDAY & "." & @HOUR & @MIN & @SEC
$sFormat = "%s --lock-all-tables -u %s -p%s -h%s %s > " & """" & "%s" & """"
Select
        Case BitAND($export_defs, $cEXPORT_TO_SINGLE_FILE) <> 0
                $sOutFile = FileGetShortName($sFileFirstPart & "_" & _ArrayToString($aDbs, ",") & ".sql")
                $sExtCmd = StringFormat($sFormat, $sMySqlDmpExe, $dbUsr, $dbPwd, $dbSrv, "-B " & _
                                _ArrayToString($aDbs, " "), $sOutFile)
                $CMD = RunWait(@ComSpec & " /c " & $sExtCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                If FileExists($sOutFile) = 0 Then
                        MsgBox(8208, "错误", "导出数据库错误..." & $2L & "数据库: " & _
                                        _ArrayToString($aDbs, ", ") & @LF & "目标地址: " & $sOutFile)
                        Exit
                EndIf
 
        Case BitAND($export_defs, $cEXPORT_AS_SEPARATE_FILES) <> 0
                For $x = 0 To UBound($aDbs) - 1
                        $sOutFile = FileGetShortName($sFileFirstPart & "_" & $aDbs[$x] & ".sql")
                        $sExtCmd = StringFormat($sFormat, $sMySqlDmpExe, $dbUsr, $dbPwd, $dbSrv, $aDbs[$x], $sOutFile)
                        $CMD = RunWait(@ComSpec & " /c " & $sExtCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                        If FileExists($sOutFile) = 0 Then
                                MsgBox(8208, "错误", "导出数据库错误..." & $2L & "数据库: " & _
                                                $aDbs[$x] & @LF & "目标地址: " & $sOutFile)
                                Exit
                        EndIf
                Next
EndSelect
 
; final msg
$sFormat = "%s database%s was exported:%s%s%sTo destination:%s%s"
$sMsg = StringFormat($sFormat, UBound($aDbs), _Iif(UBound($aDbs) > 1, "s", ""), $2L, "- " & _
                _ArrayToString($aDbs, @LF & "- "), $2L, $2L, $export_path)
MsgBox(8256, "完成", $sMsg)
 
Exit
; -------------------------------------------------------------------
; 从$aSrc数组检查所有项目是否包含在$aCmp数组
; -------------------------------------------------------------------
Func fncItemsInArray($aSrc, $aCmp)
        Local $bFound, $i, $j
        For $i = 0 To UBound($aSrc) - 1
                $bFound = False
                For $j = 0 To UBound($aCmp) - 1
                        If $aSrc[$i] = $aCmp[$j] Then
                                $bFound = True
                                ExitLoop
                        EndIf
                Next
                If $bFound = False Then
                        SetError(1)
                        Return $aSrc[$i]
                EndIf
        Next
        Return 1
EndFunc   ;==>fncItemsInArray
 
; -------------------------------------------------------------------
;清理数组
; $iFirstIdx1: ... 第一个 $aAll索引
; $iFirstIdx2: ... 第一个 $aExclude索引
; -------------------------------------------------------------------
Func fncArrayExclude($aAll, $aExclude, $iFirstIdx1 = 0, $iFirstIdx2 = 0)
        Local $bFound, $i, $j, $aResult[1]
        For $i = $iFirstIdx1 To UBound($aAll) - 1
                $bFound = False
                For $j = $iFirstIdx2 To UBound($aExclude) - 1
                        If $aAll[$i] = $aExclude[$j] Then
                                $bFound = True
                                ExitLoop
                        EndIf
                Next
                If $bFound = False Then
                        If StringLen($aResult[0]) <> 0 Then
                                ReDim $aResult[UBound($aResult) + 1]
                        EndIf
                        $aResult[UBound($aResult) - 1] = $aAll[$i]
                EndIf
        Next
        Return $aResult
EndFunc   ;==>fncArrayExclude
 
; -------------------------------------------------------------------
;三元判断
; -------------------------------------------------------------------
Func _Iif($fTest, $vTrueVal, $vFalseVal)
        If $fTest Then
                Return $vTrueVal
        Else
                Return $vFalseVal
        EndIf
EndFunc   ;==>_Iif
