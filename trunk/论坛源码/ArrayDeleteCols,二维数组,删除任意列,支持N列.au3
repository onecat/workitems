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
#EndRegion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
  #include <Array.au3> 
  Local $aArray[10][20] ;元素 0,0 到 9,19
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
        If UBound($aArray, 0) == 1 Then Return SetError(1, 0, "非二维数组!")
        Local $r, $c, $cc = 0
        Local $iRows = UBound($aArray, 1);行
        Local $iCols = UBound($aArray, 2);列
        Select
                Case $iCols == 2
                        Local $ReturnArray[$iRows];结果数组=原始数组-1
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
                                Case $iCols == 2;一维数组
                                        $ReturnArray[$r] = $aArray[$r][$c]
                                Case $iCols > 2;二维数组
                                        $ReturnArray[$r][$c + $cc] = $aArray[$r][$c]
                        EndSelect
                Next
        Next
        $aArray = $ReturnArray
        Return $aArray
EndFunc   ;==>_ArrayDeleteCol