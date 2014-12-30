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
#Include <File.au3>

$ddd=port_list()
_ArrayDisplay($ddd,'Debug~~~')        

Func port_list()
Local $port_list = @TempDir & '\port_list.txt'
RunWait(@ComSpec & " /c " & 'netstat -ano >' & $port_list, '', @SW_HIDE)
$sum=_FileCountLines($port_list)-4
Global $list[$sum][6]
Local $file = FileOpen($port_list)
If $file <> -1 Then
        $f=0
        While 1
                Local $line = FileReadLine($file,$f+5)
                If @error = -1 Then ExitLoop
                                        $line=StringRegExpReplace($line,"(.\h{5,15})","    ")
                                        Local $aArray = StringSplit($line,"    ",2+1)
                                        ;_ArrayDisplay($aArray,$f)        
                                                If @error=0 Then 
                                                        For $i = 0 To UBound($aArray)-1
                                                                          $list[$f][$i]=$aArray[$i]
                                                        next
                                                   $list[$f][5]=_GetProcPath($aArray[$i-1]) 
                                                EndIf 
                                        $f=$f+1                
                WEnd
EndIf
FileClose($file)
   Return $list
EndFunc 
Func _GetProcPath($iPID)
        Local $aProc = DllCall('kernel32.dll', 'hwnd', 'OpenProcess', 'int', 0x00000410, 'int', 0, 'int', $iPID)
        If $aProc[0] = 0 Then Return SetError(1, 0, '')
        Local $vStruct = DllStructCreate('int[1024]')
        DllCall('psapi.dll', 'int', 'EnumProcessModules', 'hwnd', $aProc[0], 'ptr', DllStructGetPtr($vStruct), 'int', _
                        DllStructGetSize($vStruct), 'int_ptr', 0)
        Local $aReturn = DllCall('psapi.dll', 'int', 'GetModuleFileNameEx', 'hwnd', $aProc[0], 'int', _
                        DllStructGetData($vStruct, 1), 'str', '', 'int', 2048)
        If StringLen($aReturn[3]) = 0 Then Return SetError(2, 0, '')
        Return $aReturn[3]
EndFunc   ;==>_GetProcPath