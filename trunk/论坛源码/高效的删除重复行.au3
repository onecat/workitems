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
#include <array.au3>


;ʾ��
$begin = TimerInit()
Local $arr
_FileReadToArray("111.txt", $arr)
$new_arr = ArrayUnique($arr)
FileWrite('�ظ������.txt', _ArrayToString($new_arr, @CRLF) & @CRLF)
ShellExecute('�ظ������.txt')
$dif = TimerDiff($begin)
MsgBox(0, "ʱ���,�����ʱ�ľ��ȱ�sleep��", $dif)
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
                        Else   ;������� �г� ��һ������һ����ͬ
                               ; $temp[$i] = $i & "����" & $oD.item($aArray[$i]) & "����ͬ   ----" & $aArray[$i]
                        EndIf
                Next
                Local $aUnique = $oD.Keys()
        EndIf
        $oD.RemoveAll
        $oD = ""
        Return $temp
EndFunc   ;==>ArrayUnique