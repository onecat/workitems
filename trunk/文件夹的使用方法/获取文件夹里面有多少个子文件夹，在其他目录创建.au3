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
Local $sPath = 'C:\Users\chtyfox\Desktop\���'
$aLine = _FileFindMain($sPath)
If @Error Then Exit
;_ArrayDisplay($aLine, $aLine)
For $i = 0 To UBound($aLine) - 1
       ; MsgBox(0, '', $aLine[$i] );& '\11\222\333\4444\55555\666666')
        ;DirCreate($aLine[$i] & '\11\222\333\4444\55555\666666')
		DirCreate("C:\Users\chtyfox\Desktop\������\" & '\11\222\333\4444\55555\666666')
Next

Func _FileFindMain($_Path)
        Local $sFiles
        __FileFinda($sPath, $sFiles)
        Local $aLine = StringRegExp($sFiles, '\V+', 3)
        If @Error Then Return SetError(1)
        Return $aLine
EndFunc   ;==>_FileFindMain

Func __FileFinda($sDir, ByRef $sOut)
        Local $hSearch = FileFindFirstFile($sDir & '\*')
        If $hSearch = -1 Then Return
        While 1
                Local $sFile = FileFindNextFile($hSearch)
                If @error Then ExitLoop
                If Not @extended Then ContinueLoop
                __FileFinda($sDir & '\' & $sFile, $sOut)
                $sOut &= $sDir & '\' & $sFile & @CRLF
				;MsgBox(0,"1",$sFile)
        WEnd
        FileClose($hSearch)
EndFunc   ;==>__FileFinda