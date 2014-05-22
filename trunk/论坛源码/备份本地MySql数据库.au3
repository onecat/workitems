#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
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
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#include <Array.au3>
#include <Constants.au3>
 
; ------------------------------------------------------------------------
; ��������MySQL���ݿ�
; ------------------------------------------------------------------------
; ���������:
; $export_defs .....    �����������: $cEXPORT_DB + ($cEXPORT_TO_... �� $cEXPORT_AS_...)
;   ����[ $cEXPORT_DB_ALL_DATABASES + $cEXPORT_TO_SINGLE_FILE ] => ����DBS������һ���ļ�
; $custom_dbs ...... �û����������ݿ⡣ʹ�ö��ŷָ������硰Drupal�ģ�joomla
; $export_path ..... ����Ŀ�ĵ��ļ���
; $dbUsr ........... �û���¼�˺ţ�ͨ����'root'
; $dbPwd ........... MySQL��½����
; $dbSrv ........... MySQL ������, 127.0.0.1 ������
; $sMySqlPath ...... MySQL��binĿ¼������·��
; $sSytemDbs ....... MySql��װ�����д�����Ĭ�����ݿ�
 
; ʹ�������������$export_defs:
Const $cEXPORT_DB_SYSTEMS_ONLY = 1 ; Ĭ�ϵ������ݿ�(��XAMPPĬ�����ݿ�)
Const $cEXPORT_DB_NON_SYSTEMS = 2 ;�����û����������ݿ�(���磬���з�XAMPPĬ��DBS)
Const $cEXPORT_DB_ALL_DATABASES = 4 ; �����������ݿ�
Const $cEXPORT_DB_CUSTOM_DATABASES = 8 ; ����ѡ�������ݿ� (���������'Drupal' ���ݿ�)
 
Const $cEXPORT_TO_SINGLE_FILE = 128 ; �������ݿ�Ϊsql�ļ�
Const $cEXPORT_AS_SEPARATE_FILES = 256 ; ÿ���洢�����ݿ⵼��sql�ļ����ֿ���
 
;=== �û����� ===================================================>>
Local $export_defs = $cEXPORT_DB_CUSTOM_DATABASES + $cEXPORT_AS_SEPARATE_FILES
;Local $export_defs    = $cEXPORT_DB_NON_SYSTEMS + $cEXPORT_TO_SINGLE_FILE
Local $custom_dbs = "drupal" ; ������ݿ�ʹ�ö��ŷָ������� "drupal, joomla"
Local $export_path = "E:\Backup\FullBackup\Aplikace\MySQL"
Local $dbUsr = "root"
Local $dbPwd = "123456"
Local $dbSrv = "127.0.0.1"
Local $sMySqlPath = "C:\xampp\mysql\bin\"
Local $sSytemDbs = "cdcol, information_schema, mysql, performance_schema , phpmyadmin, test, webauth"
;=== �û����� ====  (������֮�£�ʲô����Ҫ��) ====<<
 
$export_path = StringRegExpReplace($export_path, "[\\/]+\z", "") & "\"
$sMySqlPath = StringRegExpReplace($sMySqlPath, "[\\/]+\z", "") & "\"
Local $sMySqlExe = FileGetShortName($sMySqlPath & "mysql.exe")
Local $sMySqlDmpExe = FileGetShortName($sMySqlPath & "mysqldump.exe")
Local $sFormat = "%s -u %s -p%s -h%s %s -e ""show databases"" -s -N"
Local $sExtCmd = StringFormat($sFormat, $sMySqlExe, $dbUsr, $dbPwd, $dbSrv)
Local $aSytemDbs = StringSplit(StringStripWS($sSytemDbs, 8), ",", 2)
Const $2L = @LF & @LF
 
If FileExists($sMySqlExe) <> 1 Then
        MsgBox(8240, "MySql.exe������", "mysql.exe������!" & $2L & _
                        "���·������ '$export_path' ���ò���ȷ.")
        Exit
EndIf
 
; ����CMD 
Local $CMD = Run(@ComSpec & " /c " & $sExtCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
ProcessWaitClose($CMD)
Local $sMsg = StdoutRead($CMD)
Local $sErr = StderrRead($CMD)
 
; ����� mysql.exe�������� (���� ����û������)
If StringInStr($sErr, "ERROR") <> 0 Then
        MsgBox(8208, "����", $sErr)
        Exit
EndIf
If StringLen($sMsg) = 0 Then
        MsgBox(8208, "Error", "�޷�������ݿ�����")
        Exit
EndIf
 
; ��ȡȫ���Ѱ�װ�����ݿ⵽����$aAllDbs
Local $aAllDbs = StringSplit($sMsg, Chr(13), 2)
For $i = UBound($aAllDbs) - 1 To 0 Step -1
        $aAllDbs[$i] = StringStripWS($aAllDbs[$i], 3)
        If StringLen($aAllDbs[$i]) = 0 Then
                _ArrayDelete($aAllDbs, $i)
        EndIf
Next
 
; �ƶ�ѡ�����ݿ�����$aDbs����
Select
        Case BitAND($export_defs, $cEXPORT_DB_SYSTEMS_ONLY) <> 0
                $aDbs = $aSytemDbs
                Local $sResult = fncItemsInArray($aDbs, $aAllDbs)
                If @error Then
                        MsgBox(8240, "����", "�����ϵͳ���ݿ����� '" & $sResult & "' ������!")
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
                        MsgBox(8240, "����", "������Զ������ݿ����� '" & $sResult & "' ������!")
                        Exit
                EndIf
EndSelect
 
; ����
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
                        MsgBox(8208, "����", "�������ݿ����..." & $2L & "���ݿ�: " & _
                                        _ArrayToString($aDbs, ", ") & @LF & "Ŀ���ַ: " & $sOutFile)
                        Exit
                EndIf
 
        Case BitAND($export_defs, $cEXPORT_AS_SEPARATE_FILES) <> 0
                For $x = 0 To UBound($aDbs) - 1
                        $sOutFile = FileGetShortName($sFileFirstPart & "_" & $aDbs[$x] & ".sql")
                        $sExtCmd = StringFormat($sFormat, $sMySqlDmpExe, $dbUsr, $dbPwd, $dbSrv, $aDbs[$x], $sOutFile)
                        $CMD = RunWait(@ComSpec & " /c " & $sExtCmd, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                        If FileExists($sOutFile) = 0 Then
                                MsgBox(8208, "����", "�������ݿ����..." & $2L & "���ݿ�: " & _
                                                $aDbs[$x] & @LF & "Ŀ���ַ: " & $sOutFile)
                                Exit
                        EndIf
                Next
EndSelect
 
; final msg
$sFormat = "%s database%s was exported:%s%s%sTo destination:%s%s"
$sMsg = StringFormat($sFormat, UBound($aDbs), _Iif(UBound($aDbs) > 1, "s", ""), $2L, "- " & _
                _ArrayToString($aDbs, @LF & "- "), $2L, $2L, $export_path)
MsgBox(8256, "���", $sMsg)
 
Exit
; -------------------------------------------------------------------
; ��$aSrc������������Ŀ�Ƿ������$aCmp����
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
;��������
; $iFirstIdx1: ... ��һ�� $aAll����
; $iFirstIdx2: ... ��һ�� $aExclude����
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
;��Ԫ�ж�
; -------------------------------------------------------------------
Func _Iif($fTest, $vTrueVal, $vFalseVal)
        If $fTest Then
                Return $vTrueVal
        Else
                Return $vFalseVal
        EndIf
EndFunc   ;==>_Iif
