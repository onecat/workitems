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

#include <File.au3>
#include <array.au3>


;示例
$begin = TimerInit()
Local $arr
_FileReadToArray("111.txt", $arr)
$new_arr = ArrayUnique($arr)
FileWrite('重复检查结果.txt', _ArrayToString($new_arr, @CRLF) & @CRLF)
ShellExecute('重复检查结果.txt')
$dif = TimerDiff($begin)
MsgBox(0, "时间差,这个计时的精度比sleep高", $dif)
;END
 
 
 
 
Func ArrayUnique($aArray, $iBase = 0, $oBase = 0, $iCase = 0)
        If Not IsArray($aArray) Then Return SetError(1, 0, 0)
        If UBound($aArray, 0) > 2 Then Return SetError(2, 0, 0)
        Local $oD = ObjCreate('Scripting.Dictionary')
        If @error Then Return SetError(4, 0, 0)
        Local $dim2 = UBound($aArray, 2)
        Local $temp[UBound($aArray)]
 
        If $dim2 Then ;2D array
                Local $dim1 = UBound($aArray, 1), $aUnique[$dim1][$dim2], $j
                For $i = 0 To $dim1 - 1
                        If Not $oD.Exists($aArray[$i][0]) Then
                                $oD.Add($aArray[$i][0], 0)
                                $aUnique[$j][0] = $aArray[$i][0]
                                $aUnique[$j][1] = $aArray[$i][1]
                                $j += 1
                        Else
                                If Not $oD.item($aArray[$i][0]) = $aArray[$i][1] Then $aUnique[$j - 1][1] = $aArray[$i][1]
                        EndIf
                Next
                ReDim $aUnique[$j][2]
        Else ;1D array
                For $i = 1 To UBound($aArray) - 1
                        If Not $oD.Exists($aArray[$i]) Then
                                $oD.Add($aArray[$i], $i)
                                $temp[$i] = $aArray[$i]
                        Else   ;这里可以 列出 那一行与那一行相同
                               ; $temp[$i] = $i & "行与" & $oD.item($aArray[$i]) & "行相同   ----" & $aArray[$i]
                        EndIf
                Next
                Local $aUnique = $oD.Keys()
        EndIf
        $oD.RemoveAll
        $oD = ""
        Return $temp
EndFunc   ;==>ArrayUnique