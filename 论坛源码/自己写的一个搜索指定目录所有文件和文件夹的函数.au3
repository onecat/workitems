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

;参数依次为 搜索的目录地址，0=返回相对地址|1=返回绝对地址，返回的数据内容（自己理解Switch部分），是否写入到文件（设置为文件路径时直接写入到文件，不返回任何内容）
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