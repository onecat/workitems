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
#Include <FTPEx.au3>
$Open = _FTP_Open('MyFTP Control')
$hConnect=_FTP_Connect($Open,"10.10.40.23","","")
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",50*1024)                    ;���ļ�ͷ��ʼ������50K��С������
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",50*1024, 1024 * 50) ;��50K�ĵط���ʼ������50K������
_FTP_FileGetEx($hConnect,"454.jpg",@ScriptDir & "\4546.jpg",-1, 1024 * 100)             ;��100K�ĵط���ʼ,�������ļ�ĩβ
 _FTP_Close($Open)


;
#Include <FTPEx.au3>
;Fountion : _FTP_FileGetEx
;����          : FTP�Ķ�������
;�÷�          : _FTP_FileGetEx($l_FTPSession, $s_RemoteFile, $s_LocalFile [,$FileLen = -1][,$FilePos = 0 ])
;����˵�� : $l_FTPSession - _FTP_Connect ���صľ��
;                        $s_RemoteFile - Զ��·��
;                        $s_LocalFile  - ����·��
;                        $FileLen           - ���صĴ�С
;                                                -1 ,ʹ�ø�ֵ���ļ�������ĩβ
;                        $FilePos          - �ļ�ƫ��(������ļ���ͷ)
 
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