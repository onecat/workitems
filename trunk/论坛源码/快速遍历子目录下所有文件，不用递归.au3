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

$sDir = "c:\windows"

$t = TimerInit()
$sFiles = _FileListEx($sDir)
Select
Case @error
        ConsoleWrite("ԭʼ�ļ��в�����"&@crlf)
Case $sFiles
        $aFiles = StringSplit($sFiles, "|")
        ConsoleWrite("��ʱ:"&TimerDiff($t)/1000&"��,�����ļ���:"&$aFiles[0]&@CRLF);��ʱ:1.04020835328356��,�����ļ���:9250
        ;$aFiles[1..n]: ��·�����ļ���
Case Else;$sFiles=""
        ConsoleWrite("û���ҵ��ļ�"&@CRLF)
EndSelect




Func _FileListEx($sDir)
        If StringInStr(FileGetAttrib($sDir),"D")=0 Then Return SetError(1,0,"")
        
        Local $oFSO = ObjCreate("Scripting.FileSystemObject")
        Local $objDir

        Local $aDir = StringSplit($sDir, "|", 2)
        Local $iCnt = 0
        Local $sFiles = ""
        Do
                $objDir = $oFSO.GetFolder($aDir[$iCnt])
                For $aItem In $objDir.SubFolders
                        ;��չӦ�ø������, ��ָ���ļ��� If StringInStr($aItem.Name, "XXX") Then
                        $sDir &= "|" & $aItem.Path
                        ;�ļ��в�������ͨ�� StringReplace($aItem.Path, "\", "", 0, 1)��@extendedֵ���ж�
                Next
                ;��������ļ���,�����ļ�,$sFiles����䶼����,����� Return $sDir
                For $aItem In $objDir.Files
                        ;��չӦ�ø��������
                        $sFiles &= $aItem.Path & "|"
                        ;����Ҫ���ļ����а���"kb"(���ִ�Сд),��Ϊ: if StringInStr($aItem.Name, "kb") Then $sFiles &= $aItem.Path & "|"
                        ;����Ӧ������������޸�: $aItem.XXX
                        ;Attributes        ���û򷵻��ļ����ļ��е�����
                        ;DateCreated   ����ָ�����ļ����ļ��еĴ������ں�ʱ�䡣ֻ��
                        ;DateLastAccessed ����ָ�����ļ����ļ��е��ϴη�������(��ʱ��)��ֻ��
                        ;DateLastModified ����ָ�����ļ����ļ��е��ϴ��޸����ں�ʱ�䡣ֻ��
                        ;ShortName   ���ذ�������8.3�ļ�����Լ��ת���Ķ��ļ���
                        ;ShortPath   ���ذ�������8.3����Լ��ת���Ķ�·����
                        ;Size    �����ļ�����ָ���ļ����ֽ����������ļ��У������ļ������е��ļ��к����ļ��е��ֽ���
                                ;Type    �����ļ����ļ��е�������Ϣ
                Next
                $iCnt += 1
                If UBound($aDir) <= $iCnt Then $aDir = StringSplit($sDir, "|", 2)
        Until UBound($aDir) <= $iCnt
        If $sFiles Then $sFiles = StringTrimRight($sFiles, 1);ȥ�����ұ�"|"
        Return $sFiles
EndFunc