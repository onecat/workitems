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

Local $sPath = 'C:\Users\chtyfox\Desktop\���'
Local $sPathNew = 'C:\Users\chtyfox\Desktop\������'

$aLine = _FileFinDir($sPath)
If @error Then Exit

For $i = 0 To UBound($aLine) - 1
        MsgBox(0, '', $sPathNew & '\' & $aLine[$i])
        DirCreate($sPathNew & '\' & $aLine[$i])
Next

Func _FileFinDir($_Path)
        $_Path = StringRegExpReplace($_Path, '^\s+|\\+$|\s+$', '')
        Local $sFiles
        __FileFinda($_Path, $sFiles)
        Local $iLen = StringLen($_Path) + 1 ;����ע��
		;-StringLen($FILE2) $FILE2 = StringRight($sPath, StringLen($sPath) - StringInStr($sPath, "\", 1, -1))�ó���ԭĿ¼��Ȼ�󿴿�ԭĿ¼���ַ������������
        $sFiles = StringRegExpReplace($sFiles, '(?m)^.{' & $iLen & '}', '')
        Local $aLine = StringRegExp($sFiles, '\V+', 3)
        If @error Then Return SetError(1)
        Return $aLine
EndFunc   ;==>_FileFinDir

Func __FileFinda($sDir, ByRef $sOut)
        Local $hSearch = FileFindFirstFile($sDir & '\*')
        If $hSearch = -1 Then Return
        While 1
                Local $sFile = FileFindNextFile($hSearch)
                If @error Then ExitLoop
                If Not @extended Then ContinueLoop
                __FileFinda($sDir & '\' & $sFile, $sOut)
                $sOut &= $sDir & '\' & $sFile & @CRLF
        WEnd
        FileClose($hSearch)
EndFunc   ;==>__FileFinda