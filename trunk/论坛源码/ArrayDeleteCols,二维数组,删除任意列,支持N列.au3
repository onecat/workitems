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
#EndRegion ACNԤ����������(���ò���)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	
	Au3 �汾:
	�ű�����:
	�����ʼ�:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
  #include <Array.au3> 
  Local $aArray[10][20] ;Ԫ�� 0,0 �� 9,19
  Local $iCols = UBound($aArray, 2)
  Local $iRows = UBound($aArray, 1)
    For $i = 0 To $iRows - 1
        For $j = 0 To $iCols - 1
            $aArray[$i][$j] = "Row: " & $i & " - Col: " & $j
        Next
    Next
_ArrayDeleteCols($aArray,2)
_ArrayDisplay($aArray)

Func _ArrayDeleteCols(ByRef $aArray, $iElement)
        If Not IsArray($aArray) Then Return SetError(1, 0, -3)
        If UBound($aArray, 0) == 1 Then Return SetError(1, 0, "�Ƕ�ά����!")
        Local $r, $c, $cc = 0
        Local $iRows = UBound($aArray, 1);��
        Local $iCols = UBound($aArray, 2);��
        Select
                Case $iCols == 2
                        Local $ReturnArray[$iRows];�������=ԭʼ����-1
                Case $iCols > 2
                        Local $ReturnArray[$iRows][$iCols - 1]
        EndSelect
        For $c = 0 To $iCols - 1
                If $c == $iElement Then
                        $cc = -1
                        ContinueLoop
                EndIf
                
                For $r = 0 To $iRows - 1
                        Select
                                Case $iCols == 2;һά����
                                        $ReturnArray[$r] = $aArray[$r][$c]
                                Case $iCols > 2;��ά����
                                        $ReturnArray[$r][$c + $cc] = $aArray[$r][$c]
                        EndSelect
                Next
        Next
        $aArray = $ReturnArray
        Return $aArray
EndFunc   ;==>_ArrayDeleteCol