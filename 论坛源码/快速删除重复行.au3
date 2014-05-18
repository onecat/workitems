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
 
$aFile = FileOpenDialog("快速删除重复行",@ScriptDir&"\","文本文件 (*.txt)", 1 + 4)
If @error Then 
        MsgBox(0,0,"文件未选择",3)
        Exit
EndIf
$begin = TimerInit()
Local $str='',$file_array
_FileReadToArray($aFile,$file_array)
;_ArrayDisplay($file_array)
For $i = 1 To UBound($file_array)-1
        $temp=$file_array[$i]
        If Not IsDeclared($temp) Then
                Assign($temp, $i)               
                $str&=$temp&@CRLF
        EndIf
Next
;~ $dif = TimerDiff($begin)
;~         $out_file=StringTrimRight($aFile,4)&'_已完成.txt'
;~         if FileExists($out_file) then FileDelete($out_file)
;~         FileWrite($out_file,$str)
;~         ShellExecute($out_file)
;~         WinWaitActive("[CLASS:Notepad]")
;~         WinSetTitle("[CLASS:Notepad]", "", '处理'&UBound($file_array)&'行'&'     用时'&int($dif)&'毫秒')
;~ Exit


#cs
#include <array.au3>
#include <file.au3>
 
Local $aArray,$time=TimerInit()
_FileReadToArray('test.txt',$aArray)
Global $count=$aArray[0]
_ArrayDelete($aArray,0);删除总行数,避免排序出错
$aa = _unique($aArray)
MsgBox(0,'用时:'&TimerDiff($time),'总行数:'&$count)
_ArrayDisplay($aa)
 
Func _unique($aArray)
    If Not IsArray($aArray) Then Return SetError(1);非数组
    Local $rows = UBound($aArray), $cols = UBound($aArray, 2), $dims = UBound($aArray, 0)
    If $dims > 2 Then Return SetError(2);非一维或二维数组
    If $dims = 2 Then
        Local $temp[$rows][$cols + 1]
        For $n = 0 To $cols
            If $n < $cols Then
                For $i = 0 To $rows - 1
                    $temp[$i][$n] = $aArray[$i][$n]
                Next
            Else
                For $i = 0 To $rows - 1
                    $temp[$i][$n] = $i
                Next
                ;_ArrayDisplay($temp)
            EndIf
        Next
        _ArraySort($temp)
        For $i = 1 To $rows - 1
            If $temp[$i][0] == $temp[$i - 1][0] Then $temp[$i - 1][$cols] = -1
        Next
        _ArraySort($temp, 0, 0, 0, $cols)
        Local $k = 0, $y = 0, $p = 0, $reules[1][$cols]
        For $n = 0 To $cols - 1
            For $i = 1 To $rows - 1
                If $temp[$i][$cols] > -1 Then
                    $p = UBound($reules)
                    ReDim $reules[$p + 1][$cols]
                    $reules[$k][$n] = $temp[$i][$n]
                    $k += 1
                    If $reules[$p - 1][0] == '' Then _ArrayDelete($reules, $p - 1)
                EndIf
            Next
            $k = $y
            $y += 1
        Next
        _ArrayDelete($reules, UBound($reules) - 1)
        Return $reules
    Else
        Local $temp[$rows][2];,$k=$count,$p=0
        For $i = 0 To $rows - 1
            $temp[$i][0] = $aArray[$i]
            $temp[$i][1] = $i
        Next
        _ArraySort($temp)
        For $i = 1 To UBound($temp) - 1
            If $temp[$i][0] == $temp[$i - 1][0] Then 
                $min=_Min($temp[$i][0],$temp[$i - 1][0])
                $temp[$min][1] = -1
                ;$k-=1
            EndIf
        Next
        _ArraySort($temp, 0, 0, 0, 1)
        Local $k=$count
        For $i=0 To UBound($temp)-1
            If $temp[$i][1]=-1 Then $k-=1
        Next
        Local $reules[$k+1],$p
        For $i=0 To UBound($temp)-1
            If $temp[$i][1]=-1 Then ContinueLoop
            $reules[$p]=$temp[$i][0]
            $p+=1
        Next
        Return $reules
    EndIf
EndFunc   ;==>_unique
 
Func _Min($nNum1, $nNum2)
    If (Not IsNumber($nNum1)) Then Return SetError(1, 0, 0)
    If (Not IsNumber($nNum2)) Then Return SetError(2, 0, 0)
 
    If $nNum1 > $nNum2 Then
        Return $nNum2
    Else
        Return $nNum1
    EndIf
EndFunc   ;==>_Min
#ce