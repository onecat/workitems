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

#include <File.au3>
 
$aFile = FileOpenDialog("����ɾ���ظ���",@ScriptDir&"\","�ı��ļ� (*.txt)", 1 + 4)
If @error Then 
        MsgBox(0,0,"�ļ�δѡ��",3)
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
;~         $out_file=StringTrimRight($aFile,4)&'_�����.txt'
;~         if FileExists($out_file) then FileDelete($out_file)
;~         FileWrite($out_file,$str)
;~         ShellExecute($out_file)
;~         WinWaitActive("[CLASS:Notepad]")
;~         WinSetTitle("[CLASS:Notepad]", "", '����'&UBound($file_array)&'��'&'     ��ʱ'&int($dif)&'����')
;~ Exit


#cs
#include <array.au3>
#include <file.au3>
 
Local $aArray,$time=TimerInit()
_FileReadToArray('test.txt',$aArray)
Global $count=$aArray[0]
_ArrayDelete($aArray,0);ɾ��������,�����������
$aa = _unique($aArray)
MsgBox(0,'��ʱ:'&TimerDiff($time),'������:'&$count)
_ArrayDisplay($aa)
 
Func _unique($aArray)
    If Not IsArray($aArray) Then Return SetError(1);������
    Local $rows = UBound($aArray), $cols = UBound($aArray, 2), $dims = UBound($aArray, 0)
    If $dims > 2 Then Return SetError(2);��һά���ά����
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