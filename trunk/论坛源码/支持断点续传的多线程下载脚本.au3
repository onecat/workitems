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

#cs
 Autoit ���߳�����ʾ���ű�
 AutoIt �汾: 3.3.6.1
 �ű�����:  �׿ǳ�<[url=mailto:jdchenjian@gmail.com]jdchenjian@gmail.com[/url]>
 WinHttp.au3 ���ߣ�trancexx, ProgAndy <[url=http://www.autoitscript.com/forum/topic/84133-winhttp-functions>]http://www.autoitscript.com/foru ... inhttp-functions>[/url];
 ˵����֧�ֶϵ������Ķ��߳�����
#ce
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include "WinHttp.au3" ; ���� [url=http://www.autoitscript.com/forum/topic/84133-winhttp-functions/]http://www.autoitscript.com/forum/topic/84133-winhttp-functions/[/url]
 
Opt("GUIOnEventMode", 1)
Opt("GUIResizeMode", $GUI_DOCKALL)
Global $hHttpOpen
Global $Downloading ; ��־��1 - �������أ�0 - �ֶ�ֹͣ����
Global $DownloadThreads = 3 ; �߳���
Global $Progress[$DownloadThreads][3]
Global $DownLoadInfo[$DownloadThreads][5] ; ����
;~ [n, 0] - ��ǰ�߳���ʼ�ֽ���
;~ [n, 1] - ָ�룬ָ������������ڱ����ļ��е�ƫ����
;~ [n, 2] - ��ǰ�߳̽����ֽ���
;~ [n, 3] - $hHttpRequest, �����־: -1 - ��ǰ�̳߳���, 0 - ��ǰ�߳��������
;~ [n, 4] - $hHttpConnect
 
 
;~ ��һ��������֧�ֶ��߳�����
$url = "http://m.ztwan.com/wallpaper/UploadPic/2010/10/20/20101020103343426.jpg"
 
;~ �����������Ӳ�֧�ֶ��߳�����
;~ ����������ӣ�������ֻ�����߳����أ�����ȫ������
;~ ���ڵ�ǰ�߳�������ɺ󣬻��Զ�������һ������̼߳�������
;~ $url = "http://dl-sh-ocn-1.pchome.net/42/zc/1.rar"
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
$file = @WorkingDir & "\" & $fname
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then
 
$url = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "url", $url)
 
$file = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "file", $file)
 
$DownloadThreads = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownloadThreads", $DownloadThreads)*1 ; *1 ��Autoit�Ὣ�ַ���Ϊ����
 
Dim $DownLoadInfo[$DownloadThreads][5]
 
Dim $Progress[$DownloadThreads][3]
 
For $i = 0 To $DownloadThreads-1
 
$DownLoadInfo[$i][0] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][0]", "")*1
 
$DownLoadInfo[$i][1] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][1]", "")*1
 
$DownLoadInfo[$i][2] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][2]", "")*1
 
Next
EndIf
 
$hGUI = GUICreate("���߳�����", 600, 460, -1, -1, BitOR($WS_SIZEBOX, $GUI_SS_DEFAULT_GUI))
GUISetOnEvent ($GUI_EVENT_CLOSE, "ExitApp")
GUICtrlCreateLabel("URL:", 10, 30, 60)
$hUrl = GUICtrlCreateInput($url, 70, 26, 450)
GUICtrlSetOnEvent(-1, "UpdateFile")
GUICtrlCreateLabel("�����ļ�:", 10, 60, 60)
$hFile = GUICtrlCreateInput($file, 70, 56, 450)
GUICtrlCreateButton("���", 530, 58, 40, 20)
GUICtrlSetOnEvent(-1, "SaveAs")
GUICtrlCreateLabel("�߳���:", 10, 90, 60)
$hTreads = GUICtrlCreateInput($DownloadThreads, 70, 86, 50, 20, $ES_NUMBER)
GUICtrlSetOnEvent(-1, "ChangeThreads")
GUICtrlCreateUpdown(-1)
GUICtrlSetLimit(-1, 10, 1)
$hStart = GUICtrlCreateButton("��ʼ����", 360, 90, 80)
GUICtrlSetOnEvent(-1, "StartDownload")
$hStop = GUICtrlCreateButton("ֹͣ����", 480, 90, 80)
GUICtrlSetOnEvent(-1, "StopDownload")
If $DownLoadInfo[0][0] <> $DownLoadInfo[0][1] Then GUICtrlSetData($hStop, "�ָ�����")
$hLog = GUICtrlCreateEdit("", 10, 130, 580, 200, BitOR($GUI_SS_DEFAULT_EDIT, $ES_READONLY))
ChangeThreads()
GUISetState(@SW_SHOW)
If $DownLoadInfo[0][0] <> $DownLoadInfo[0][1] Then Progress()
While 1
 
Sleep(100)
WEnd
 
 
;~ �˳�
Func ExitApp()
 
Exit
EndFunc
 
;~ �˳�ǰ�������ز���
Func SaveInfoToFile()
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "url", $url)
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "file", $file)
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownloadThreads", $DownloadThreads)
 
For $i = 0 To UBound($DownLoadInfo)-1
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][0]", $DownLoadInfo[$i][0])
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][1]", $DownLoadInfo[$i][1])
 
IniWrite(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][2]", $DownLoadInfo[$i][2])
 
Next
EndFunc
 
;~ �ı��߳���
Func ChangeThreads()
 
For $i = 0 to $DownloadThreads-1
 
GUICtrlDelete($Progress[$i][0])
 
GUICtrlDelete($Progress[$i][1])
 
GUICtrlDelete($Progress[$i][2])
 
Next
 
$DownloadThreads = GUICtrlRead($hTreads)
 
Dim $Progress[$DownloadThreads][3]
 
$h = 360
 
For $i = 0 to $DownloadThreads-1
 
$Progress[$i][0] = GUICtrlCreateLabel("�߳� " & $i & " : ", 10, $h+2, 70)
 
$Progress[$i][1] = GUICtrlCreateProgress(80, $h, 150, 20)
 
$Progress[$i][2] = GUICtrlCreateLabel("", 240, $h+2, 380, 20)
 
$h += 30
 
Next
 
WinMove($hGUI, "", Default, Default, 600, $h+50)
EndFunc
 
;~ ���Ϊ
Func SaveAs()
 
$url = GUICtrlRead($hUrl)
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
Local $f = FileSaveDialog( "���Ϊ", @WorkingDir, "All (*.*)" , 16, $fname, $hGUI)
 
If @error Then Return
 
GUICtrlSetData($hFile, $f)
EndFunc
 
 
;~ �����ļ�
Func UpdateFile()
 
$url = GUICtrlRead($hUrl)
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
$file = @WorkingDir & "\" & $fname
 
GUICtrlSetData($hFile, $file)
EndFunc
 
;~ ֹͣ���ָ�����
Func StopDownload()
 
If GUICtrlRead($hStop) = "ֹͣ����" Then
 
If $Downloading Then
 
$Downloading = 0
 
GUICtrlSetData($hStop, "�ָ�����")
 
LogWrite("ֹͣ����...")
 
EndIf
 
Else
 
; �� Timer ��ʽ�������أ����췵����ѭ�������������ڼ� GUI ����Ӧ
 
AdlibRegister("ResumeDownload", 50)
 
GUICtrlSetData($hStop, "ֹͣ����")
 
EndIf
EndFunc
 
;~ ��ʼ����
Func StartDownload()
 
; �� Timer ��ʽ�������أ����췵����ѭ�������������ڼ� GUI ����Ӧ
 
AdlibRegister("Download", 50)
EndFunc
 
;~ �ָ�����
Func ResumeDownload()
 
AdlibUnRegister("ResumeDownload")
 
LogWrite("���Իָ�����...")
 
$Downloading = 1
 
GUICtrlSetState($hStart, $GUI_DISABLE)
 
GUICtrlSetState($hTreads, $GUI_DISABLE)
 
GUICtrlSetData($hStop, "ֹͣ����")
 
OnAutoItExitRegister("SaveInfoToFile")
 
MultiTreadDownload($url, $file, $DownloadThreads, 0, "Progress")
 
Local $error = @error
 
$Downloading = 0
 
GUICtrlSetState($hStart, $GUI_ENABLE)
 
GUICtrlSetState($hTreads, $GUI_ENABLE)
 
If Not $error Then
 
LogWrite("���ؽ�����")
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then FileDelete(@ScriptDir & "\DownloadInfo.ini")
 
OnAutoItExitUnRegister("SaveInfoToFile")
 
If MsgBox(4, "���߳�����", "���سɹ����Ƿ���ļ���") = 6 Then ShellExecute($file)
 
Else
 
GUICtrlSetData($hStop, "�ָ�����")
 
If $error <> 3 Then LogWrite("���س�����������Ȼ���Իָ����ء�")
 
EndIf
EndFunc
 
;~ ��ʼ����
Func Download()
 
AdlibUnRegister("Download")
 
LogWrite("��ʼ����...")
 
$Downloading = 1
 
GUICtrlSetState($hStart, $GUI_DISABLE)
 
GUICtrlSetState($hTreads, $GUI_DISABLE)
 
GUICtrlSetData($hStop, "ֹͣ����")
 
$url = GUICtrlRead($hUrl)
 
$file = GUICtrlRead($hFile)
 
OnAutoItExitRegister("SaveInfoToFile")
 
MultiTreadDownload($url, $file, $DownloadThreads, 1, "Progress")
 
Local $error = @error
 
$Downloading = 0
 
GUICtrlSetState($hStart, $GUI_ENABLE)
 
GUICtrlSetState($hTreads, $GUI_ENABLE)
 
If Not $error Then
 
LogWrite("���ؽ�����")
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then FileDelete(@ScriptDir & "\DownloadInfo.ini")
 
OnAutoItExitUnRegister("SaveInfoToFile")
 
If MsgBox(4, "���߳�����", "���سɹ����Ƿ���ļ���") = 6 Then ShellExecute($file)
 
Else
 
GUICtrlSetData($hStop, "�ָ�����")
 
If $error <> 3 Then LogWrite("���س�����������Ȼ���Իָ����ء�")
 
EndIf
EndFunc
 
;~ ��ʾ log
Func LogWrite($text)
 
GUICtrlSetData($hLog, $text & @crlf, 1)
EndFunc
 
;~ ���� $DownLoadInfo ��Ϣ�������ؽ���
Func Progress()
 
Local $threads = UBound($DownLoadInfo)
 
Local $error, $total, $current, $percent, $info
 
 
For $i = 0 To $threads - 1
 
$error = ""
 
If $DownLoadInfo[$i][3] = -1 Then $error = " - ������ͣ"
 
$total = $DownLoadInfo[$i][2] - $DownLoadInfo[$i][0]
 
$current = $DownLoadInfo[$i][1] - $DownLoadInfo[$i][0]
 
$percent = Round($current/$total*100, 1)
 
$info = $DownLoadInfo[$i][0] & " - (" & $DownLoadInfo[$i][1] & ") - " & $DownLoadInfo[$i][2] & ", ��� " & $percent & " %" & $error
 
GUICtrlSetData($Progress[$i][1], $percent)
 
GUICtrlSetData($Progress[$i][2], $info)
 
Next
EndFunc
 
 
 
; #FUNCTION# ;===============================================================================
; Name...........: MultiTreadDownload
; Description ...: ���߳�����
; Syntax.........: MultiTreadDownload($url, $localfile, $DlThreads, $restart = 0, $progress = ")
; Parameters ....: $url - ��ַ���磺"http://dl.google.com/chrome/install/912.12/chrome_installer.exe"
;                  $localfile - �����ļ�·��
;                  $DlThreads - �����߳���
;                  $restart - 1 - ���� $DownLoadInfo��ɾ�������ļ���������
;                             0 - ���� $DownLoadInfo ����Ϣ�ָ�δ��ɵ���������
;                  $progress - ���ع�������ʾ���ȵ��ӳ�����
; Return values .: Success -
;                  Failure - ���� @error
; Author ........: �׿ǳ�
;============================================================================================
Func MultiTreadDownload($url, $localfile = "", $DlThreads = 3, $restart = 0, $progress = "")
 
Local $i, $header, $remotesize, $aThread, $match
 
If $localfile = "" Then $localfile = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
$hHttpOpen = _WinHttpOpen()
 
 
If $restart Then
 
; ���Է������Ƿ�֧�ֶϵ���������ȡԶ���ļ���С���ֿ�
 
$aThread = CreateThread($url, $hHttpOpen, "10-20")
 
$header = _WinHttpQueryHeaders($aThread[0])
 
_WinHttpCloseHandle($aThread[0])
 
_WinHttpCloseHandle($aThread[1])
 
If StringRegExp($header, '(?i)(?s)^HTTP/[\d\.]+ +200 ') Then ; ��֧�ֶϵ�����
 
Dim $DownLoadInfo[1][5] = [[0,0,0]]
 
$match = StringRegExp($header, '(?i)(?m)Content-Length: *(\d+)', 1)
 
If Not @error Then
 
$remotesize = $match[0]
 
$DownLoadInfo[0][2] = $remotesize - 1
 
EndIf
 
Else
 
Dim $DownLoadInfo[$DlThreads][5]
 
$match = StringRegExp($header, '(?i)(?m)^Content-Range: *bytes +10-20/(\d+)', 1)
 
If Not @error Then ; ���̷ֶ߳�����
 
$remotesize = $match[0]
 
Local $chunks = UBound($DownLoadInfo)
 
Local $chunksize = Ceiling($remotesize / $chunks)
 
Local $pointer = 0
 
$DownLoadInfo[$chunks - 1][2] = $remotesize - 1
 
For $i = 0 To $chunks - 1
 
$DownLoadInfo[$i][0] = $pointer
 
$DownLoadInfo[$i][1] = $pointer
 
$pointer += $chunksize
 
If $i <> $chunks - 1 Then $DownLoadInfo[$i][2] = $pointer
 
$pointer += 1
 
Next
 
EndIf
 
EndIf
 
 
If Not $remotesize Then ; ���Զ���ļ���Сδ֪����ĵ��߳�����
 
Dim $DownLoadInfo[1][5] = [[0,0,0]]
 
EndIf
 
If FileExists($localfile) Then FileDelete($localfile)
 
EndIf
 
 
; ��������
 
Local $range
 
Local $threads = UBound($DownLoadInfo)
 
For $i = 0 To $threads - 1
 
If $DownLoadInfo[$i][2] Then
 
If $DownLoadInfo[$i][1] > $DownLoadInfo[$i][2] Then
 
ContinueLoop
 
EndIf
 
$range = $DownLoadInfo[$i][1] & "-" & $DownLoadInfo[$i][2]
 
EndIf
 
 
$aThread = CreateThread($url, $hHttpOpen, $range)
 
If $i = 0 And _WinHttpQueryHeaders($aThread[0], $WINHTTP_QUERY_STATUS_CODE) = 200 Then ; ��֧�ֶϵ�����
 
$DownLoadInfo[$i][0] = 0
 
$DownLoadInfo[$i][1] = 0
 
EndIf
 
$DownLoadInfo[$i][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$i][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("�߳� " & $i & " �ֿ�: " & $DownLoadInfo[$i][0] & "-" & $DownLoadInfo[$i][2] & ", ����: " & $DownLoadInfo[$i][1] & "-" & $DownLoadInfo[$i][2])
 
Next
 
 
; ��������
 
Local $i, $j, $n, $data, $RecvError, $RecvLen, $error
 
Local $ErrorThreads, $LiveThreads, $bytes
 
Local $hLocalFile = FileOpen($localfile, 25)
 
Do
 
For $i = 0 To $threads - 1
 
 
If IsNumber($DownLoadInfo[$i][3]) Then
 
If $DownLoadInfo[$i][3] = 0 Or $DownLoadInfo[$i][3] = -1 Then
 
ContinueLoop ; 0 ��ʾ���߳���������ɣ�-1 ��ʾ���̳߳���
 
EndIf
 
 
Sleep(10)
 
$DownLoadInfo[$i][3] += 1
 
if $DownLoadInfo[$i][3] > -100 Then
 
$DownLoadInfo[$i][3] = -1 ; ���̳߳�����ͣ��������
 
ContinueLoop
 
EndIf
 
If Mod($DownLoadInfo[$i][3], -100) <> 0 Then ContinueLoop ; ��100������һ��
 
 
LogWrite("���Իָ��߳� " & $i & " ... ")
 
$aThread = CreateThread($url, $hHttpOpen, $DownLoadInfo[$i][1] & "-" & $DownLoadInfo[$i][2])
 
If @error Then ContinueLoop
 
$DownLoadInfo[$i][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$i][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("�߳� " & $i & " �ָ�����! ")
 
EndIf
 
 
If _WinHttpQueryDataAvailable($DownLoadInfo[$i][3]) Then
 
$bytes = @extended
 
Else
 
$bytes = Default
 
EndIf
 
 
$data = _WinHttpReadData($DownLoadInfo[$i][3], 2, $bytes) ; read binary
 
$RecvError = @error
 
$RecvLen = @extended
 
If $RecvError = -1 Then ; ��ǰ�߳��������
 
_WinHttpCloseHandle($DownLoadInfo[$i][3])
 
_WinHttpCloseHandle($DownLoadInfo[$i][4])
 
$DownLoadInfo[$i][3] = 0 ; ��Ϊ 0 ��ʾ���߳����������
 
LogWrite("�߳� " & $i & " �������! ")
 
 
; �ж��Ƿ��г�����ͣ���߳�
 
$n = 0
 
For $j = 0 To $threads - 1
 
If $DownLoadInfo[$j][3] = -1 Then
 
$n = $j
 
ExitLoop
 
EndIf
 
Next
 
; ������������������߳�
 
If $n Then
 
LogWrite("���Իָ��߳� " & $n & " ...")
 
For $j = 1 To 3 ; ����3��
 
Sleep(200)
 
$aThread = CreateThread($url, $hHttpOpen, $DownLoadInfo[$n][1] & "-" & $DownLoadInfo[$n][2])
 
If @error Then ContinueLoop
 
$DownLoadInfo[$n][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$n][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("�߳� " & $n & " �ָ�����! ")
 
ExitLoop
 
Next
 
EndIf
 
ElseIf $RecvError Then ; �������ԣ��ϵ�����
 
_WinHttpCloseHandle($DownLoadInfo[$i][3])
 
_WinHttpCloseHandle($DownLoadInfo[$i][4])
 
$DownLoadInfo[$i][3] = -1000 ; ��ʾ���̳߳���
 
LogWrite("�߳� " & $i & " ����")
 
ElseIf $RecvLen Then
 
FileSetPos($hLocalFile, $DownLoadInfo[$i][1], 0)
 
If Not FileWrite($hLocalFile, $data) Then
 
$error = 1 ; д���ļ�����
 
ExitLoop 2
 
Else
 
$DownLoadInfo[$i][1] += $RecvLen
 
EndIf
 
EndIf
 
Next
 
 
If $progress Then ; ���ý�����ʾ
 
Call($progress)
 
EndIf
 
 
; ��������Ƿ�������Ƿ����
 
$ErrorThreads = 0
 
$LiveThreads = 0
 
For $i = 0 To $threads - 1
 
If $DownLoadInfo[$i][3] = -1 Then
 
$ErrorThreads += 1
 
ElseIf $DownLoadInfo[$i][3] <> 0 Then
 
$LiveThreads += 1
 
EndIf
 
Next
 
 
If Not $LiveThreads And $ErrorThreads Then
 
$error = 2 ; ���س���
 
ExitLoop
 
EndIf
 
 
If Not $Downloading Then
 
$error = 3 ; �ֶ�ֹͣ
 
ExitLoop
 
EndIf
 
Until Not $LiveThreads ; ���ؽ���
 
 
HttpCloseHandles()
 
FileClose($hLocalFile)
 
Return SetError($error)
EndFunc   ;==>MultiTreadDownload
 
; #FUNCTION# ;===============================================================================
; Name...........: CreateThread
; Description ...: �����߳�
; Syntax.........: CreateThread($url, $hHttpOpen, $range = "")
; Parameters ....: $url - ��ַ���磺"http://dl.google.com/chrome/install/912.12/chrome_installer.exe"
;                  $hHttpOpen - _WinHttpOpen()���ص� handle
;                  $range - ����ķ�Χ, �� "0-10000"
; Return values .: array
;                  0 - �ɹ�: $hHttpRequest, ʧ��: -1 ������ @error
;                  1 - $hHttpConnect
; Author ........: �׿ǳ�
;============================================================================================
Func CreateThread($url, $hHttpOpen, $range = "")
 
Local $aHandle[2]
 
Local $hHttpConnect, $hHttpRequest
 
 
Local $aUrl = HttpParseUrl($url) ; $aUrl[0] - host, $aUrl[1] - page, $aUrl[2] - port
 
$hHttpConnect = _WinHttpConnect($hHttpOpen, $aUrl[0], $aUrl[2])
 
 
If $aUrl[2] = 443 Then
 
$hHttpRequest = _WinHttpOpenRequest($hHttpConnect, "GET", $aUrl[1], Default, Default, Default, BitOR($WINHTTP_FLAG_SECURE, $WINHTTP_FLAG_ESCAPE_DISABLE))
 
Else
 
$hHttpRequest = _WinHttpOpenRequest($hHttpConnect, "GET", $aUrl[1])
 
EndIf
 
If $range Then
 
_WinHttpSendRequest($hHttpRequest, "Range: bytes=" & $range & @CRLF)
 
Else
 
_WinHttpSendRequest($hHttpRequest)
 
EndIf
 
_WinHttpReceiveResponse($hHttpRequest)
 
Local $header = _WinHttpQueryHeaders($hHttpRequest, $WINHTTP_QUERY_STATUS_CODE)
 
If StringLeft($header, 1) <> "2" Or Not _WinHttpQueryDataAvailable($hHttpRequest) Then
 
_WinHttpCloseHandle($hHttpRequest)
 
_WinHttpCloseHandle($hHttpConnect)
 
$aHandle[0] = -1
 
Return SetError(1, "", $aHandle)
 
EndIf
 
$aHandle[0] = $hHttpRequest
 
$aHandle[1] = $hHttpConnect
 
Return SetError(0, "", $aHandle)
EndFunc   ;==>CreateThread
 
;~ Close handles
Func HttpCloseHandles()
 
Local $i
 
For $i = 0 To UBound($DownLoadInfo) - 1
 
If Not $DownLoadInfo[$i][3] Or $DownLoadInfo[$i][3] < 0 Then ContinueLoop
 
_WinHttpCloseHandle($DownLoadInfo[$i][3])
 
_WinHttpCloseHandle($DownLoadInfo[$i][4])
 
$DownLoadInfo[$i][3] = 0
 
Next
 
_WinHttpCloseHandle($hHttpOpen)
EndFunc   ;==>HttpCloseHandles
 
; #FUNCTION# ;===============================================================================
; Name...........: HttpParseUrl
; Description ...: ���� http ��ַ
; Syntax.........: HttpParseUrl($url)
; Parameters ....: $url - ��ַ���磺[url=http://dl.google.com/chrome/install/912.12/chrome_installer.exe]http://dl.google.com/chrome/install/912.12/chrome_installer.exe[/url]
; Return values .: Success - $Array[0] - host, �磺dl.google.com
;                            $Array[1] - page, �磺/chrome/install/912.12/chrome_installer.exe
;                            $Array[2] - port, �磺80
;                  Failure - Returns empty sets @error
; Author ........: �׿ǳ�
;============================================================================================
Func HttpParseUrl($url)
 
Local $host, $page, $port, $aResults[3]
 
Local $match = StringRegExp($url, '(?i)^https?://([^/]+)(/?.*)', 1)
 
If @error Then Return SetError(1, "", $aResults)
 
$aResults[0] = $match[0] ; host
 
$aResults[1] = $match[1] ; page
 
If $aResults[1] = "" Then $aResults[1] = "/"
 
If StringLeft($url, 5) = "https" Then
 
$aResults[2] = 443
 
Else
 
$aResults[2] = 80
 
EndIf
 
Return SetError(0, "", $aResults)
EndFunc   ;==>HttpParseUrl
