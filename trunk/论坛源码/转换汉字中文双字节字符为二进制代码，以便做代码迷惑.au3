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

;============��һ�ο�����֧��ֱ���Ϸ��ļ������ű�ͼ�꼴���Զ�ת��========;
If $CmdLine[0] > 0 Then
        For $i = 1 To $CmdLine[0]
                _FileReplaceWcharToBinary(FileGetLongName($CmdLine[$i]))
        Next
EndIf
;========================================================================;

Func _FileReplaceWcharToBinary($sFile, $OutFlag = 1, $sFileNew = '')
        ;afan��ʾ�����������ڽ�au3�ļ��к���˫�ֽ��ַ����������ַ���ת��Ϊ�����ƴ��룬�Ա��������Ի�
        ;$sFile - au3�ļ�·��
        ;$OutFlag - �����־��=1(Ĭ��) ���ת������ļ���=2 ����ת������ַ���
        ;$sFileNew - ת�����au3�ļ�·��, ����(Ĭ��)��Ĭ�����Ϊ��ԭau3�ļ���_ת����.au3��
        ;����ֵ - ��ȷ�����ݱ�־���ת������ļ��򷵻�ת������ַ���
        ;������ - ���󣺷��ؿա�������@Error =1 ����������˫�ֽ��ַ�
        Local $str = FileRead($sFile)
        Local $aSR = StringRegExp($str, '("|' & "')(?:(?!\1).)*?[^\x00-\xff](?:(?!\1).)*\1", 4)
        If @error Then Return SetError(1, 0, '') ;---- ����������˫�ֽ��ַ������ش��󼰿��ַ���
        Local $i, $aTmp = 0, $_s = ''
        For $i = 0 To UBound($aSR) - 1
                $aTmp = $aSR[$i]
                $_s = StringTrimRight(StringTrimLeft($aTmp[0], 1), 1)
                $Str = StringReplace($Str, $aTmp[0], 'BinaryToString("' & StringToBinary($_s) & '")')
        Next

        If $OutFlag = 2 Then Return $str
        If $sFileNew = '' Then $sFileNew = StringTrimRight($sFile, 4) & '_ת����.au3'
        FileDelete($sFileNew)
        FileWrite($sFileNew, $str)
EndFunc   ;==>_FileReplaceWcharToBinary