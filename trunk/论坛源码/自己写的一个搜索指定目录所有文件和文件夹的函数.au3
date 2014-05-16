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

;��������Ϊ ������Ŀ¼��ַ��0=������Ե�ַ|1=���ؾ��Ե�ַ�����ص��������ݣ��Լ����Switch���֣����Ƿ�д�뵽�ļ�������Ϊ�ļ�·��ʱֱ��д�뵽�ļ����������κ����ݣ�
Func ListDir($DirPath, $rFullPath = 1, $Type = 0, $OutFile = '')
        If Not FileExists($DirPath & '\') Then Return
        Local $tgrPath = $DirPath
        Local $hSearch, $FindFile, $DirList, $FileList, $ListCache, $FileCount, $DirCount, $Tmp
        While $tgrPath <> ''
                $ListCache &= $tgrPath & @CRLF
                $hSearch = FileFindFirstFile($tgrPath & '\*.*')
                If $hSearch <> -1 Then
                        While 1
                                $FindFile = FileFindNextFile($hSearch)
                                If @error Then ExitLoop
                                $FindFile = $tgrPath & '\' & $FindFile
                                If FileExists($FindFile & '\') Then
                                                $DirList &= $FindFile & @CRLF
                                                $DirCount += 1
                                Else
                                        $FileList &= $FindFile & @CRLF
                                        $FileCount += 1
                                EndIf
                        WEnd
                        FileClose($hSearch)
                EndIf
                $tgrPath = ''
                $Tmp = StringSplit($DirList, @CRLF, 1)

  If $Tmp[0] > 1 Then
   $tgrPath = $Tmp[1]
   $DirList = StringReplace($DirList, $Tmp[1] & @CRLF, '')
  EndIf

        WEnd
        If $rFullPath = 0 Then
                $FileList = StringReplace($FileList, $DirPath & '\', '')
                $DirList = StringReplace($DirList, $DirPath & '\', '')
        EndIf
        Local $return
        Switch $Type
                Case -1
                        Local $Tree[2][3]
                        ;$tree[0][0]=All Count         0
                        ;$tree[0][1]=File Count        1
                        ;$tree[0][2]=Dir Count         3
                        ;$tree[1][0]=File & Dir List   5
                        ;$tree[1][1]=File List         7
                        ;$tree[1][2]=Dir List          9
                        $Tree[0][0] = $FileCount + $DirCount
                        $Tree[0][1] = $FileCount
                        $Tree[0][2] = $DirCount
                        $Tree[1][0] = $FileList & $DirList
                        $Tree[1][1] = $FileList
                        $Tree[1][2] = $ListCache
                        $return = $Tree
                Case 0
                        $return = $FileCount + $DirCount
                Case 1
                        $return = $FileCount
                Case 3
                        $return = $DirCount
                Case 5
                        $return = $FileList & $DirList
                Case 7
                        $return = $FileList
                Case 9
                        $return = $ListCache
        EndSwitch

        If $OutFile <> '' Then
                Local $hWrite = FileOpen($OutFile, 10)
                If $hWrite <> -1 Then
                        FileWrite($hWrite, $return)
                        FileClose($hWrite)
                EndIf
        Else
                Return $return
        EndIf
EndFunc   ;==>ListDir