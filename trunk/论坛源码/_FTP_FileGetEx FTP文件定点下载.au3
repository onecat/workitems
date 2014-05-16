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
#Include <FTPEx.au3>
$Open = _FTP_Open('MyFTP Control')
$hConnect=_FTP_Connect($Open,"10.10.40.23","","")
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",50*1024)                    ;从文件头开始，下载50K大小的数据
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",50*1024, 1024 * 50) ;从50K的地方开始，下载50K的数据
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",-1, 1024 * 100)             ;从100K的地方开始,下载至文件末尾
 _FTP_Close($Open)


;
#Include <FTPEx.au3>
;Fountion : _FTP_FileGetEx
;作用          : FTP的定点下载
;用法          : _FTP_FileGetEx($l_FTPSession, $s_RemoteFile, $s_LocalFile [,$FileLen = -1][,$FilePos = 0 ])
;参数说明 : $l_FTPSession - _FTP_Connect 返回的句柄
;                        $s_RemoteFile - 远程路径
;                        $s_LocalFile  - 本地路径
;                        $FileLen           - 下载的大小
;                                                -1 ,使用该值将文件下载至末尾
;                        $FilePos          - 文件偏移(相对于文件开头)
 
Func _FTP_FileGetEx($l_FTPSession, $s_RemoteFile, $s_LocalFile ,$FileLen = -1,$FilePos = 0 )

        If Not FileExists($s_LocalFile) Then 
                Local $FileSize=_FTP_FileGetSize($l_FTPSession, $s_RemoteFile)
                If @error Then Return SetError(2,0,-2)
                _CreateSizeFile($s_LocalFile,$FileSize)
        EndIf
        
        $LocalFile=FileOpen($s_LocalFile,17)
        FileSetPos($LocalFile,$FilePos,0)
        If $FilePos > 0 Then _FTP_Command($l_FTPSession,"REST "&$FilePos)
        $RemoteFile=_FTP_FileOpen($l_FTPSession,$s_RemoteFile)
        If @error Then SetError(1,0,-1)

        Switch $FileLen
                Case -1

                        While 1
                                $FileData=_FTP_FileRead($RemoteFile, 8 *1024)
                                If @error Then ExitLoop
                                FileWrite($LocalFile,$FileData)
                        WEnd
                        
                Case Else
                        Local $FileSize[2]=[Int($FileLen/(8*1024)),Mod($FileLen,8 * 1024)],$i = 0

                        While $i < $FileSize[0]
                                $FileData=_FTP_FileRead($RemoteFile, 8 *1024)
                                If @error Then ExitLoop
                                FileWrite($LocalFile,$FileData)
                                $i +=1
                        WEnd

                        If @error <> -1 And $FileSize[1] <> 0 Then 
                                $FileData=_FTP_FileRead($RemoteFile, $FileSize[1])
                                If Not @error Then FileWrite($LocalFile,$FileData)
                        EndIf
        EndSwitch
                
        _FTP_FileClose($RemoteFile)
        FileClose($LocalFile)

EndFunc

Func _CreateSizeFile($FileName,$FileSize,$cMode=0)
        If $cMode = 1 Then
                        If FileExists($FileName) Then Return SetError(1,0,0)
        EndIf
        $hFile=FileOpen($FileName,18)
        If $hFile = -1 Then Return SetError(2,0,0)
        If $FileSize < 0 Then Return SetError(3,0,0)
        $cSize=FileSetPos($hFile,$FileSize - 4,0)
        If $cSize= False Then Return SetError(4,0,0)
        $cSize=FileWrite($hFile,Binary(0x00))
        If $cSize= False Then Return SetError(5,0,0)
        FileClose($hFile)
        Return 1
EndFunc