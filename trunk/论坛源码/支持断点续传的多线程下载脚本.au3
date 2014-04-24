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

#cs
 Autoit 多线程下载示例脚本
 AutoIt 版本: 3.3.6.1
 脚本作者:  甲壳虫<[url=mailto:jdchenjian@gmail.com]jdchenjian@gmail.com[/url]>
 WinHttp.au3 作者：trancexx, ProgAndy <[url=http://www.autoitscript.com/forum/topic/84133-winhttp-functions>]http://www.autoitscript.com/foru ... inhttp-functions>[/url];
 说明：支持断点续传的多线程下载
#ce
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include "WinHttp.au3" ; 来自 [url=http://www.autoitscript.com/forum/topic/84133-winhttp-functions/]http://www.autoitscript.com/forum/topic/84133-winhttp-functions/[/url]
 
Opt("GUIOnEventMode", 1)
Opt("GUIResizeMode", $GUI_DOCKALL)
Global $hHttpOpen
Global $Downloading ; 标志，1 - 正常下载，0 - 手动停止下载
Global $DownloadThreads = 3 ; 线程数
Global $Progress[$DownloadThreads][3]
Global $DownLoadInfo[$DownloadThreads][5] ; 数组
;~ [n, 0] - 当前线程起始字节数
;~ [n, 1] - 指针，指向待接收数据在本地文件中的偏移量
;~ [n, 2] - 当前线程结束字节数
;~ [n, 3] - $hHttpRequest, 特殊标志: -1 - 当前线程出错, 0 - 当前线程下载完成
;~ [n, 4] - $hHttpConnect
 
 
;~ 例一：此链接支持多线程下载
$url = "http://m.ztwan.com/wallpaper/UploadPic/2010/10/20/20101020103343426.jpg"
 
;~ 例二：此链接不支持多线程下载
;~ 下面这个链接，服务器只允许单线程下载，其它全部出错，
;~ 但在当前线程下载完成后，会自动启动另一出错的线程继续下载
;~ $url = "http://dl-sh-ocn-1.pchome.net/42/zc/1.rar"
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
$file = @WorkingDir & "\" & $fname
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then
 
$url = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "url", $url)
 
$file = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "file", $file)
 
$DownloadThreads = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownloadThreads", $DownloadThreads)*1 ; *1 后Autoit会将字符作为数字
 
Dim $DownLoadInfo[$DownloadThreads][5]
 
Dim $Progress[$DownloadThreads][3]
 
For $i = 0 To $DownloadThreads-1
 
$DownLoadInfo[$i][0] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][0]", "")*1
 
$DownLoadInfo[$i][1] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][1]", "")*1
 
$DownLoadInfo[$i][2] = IniRead(@ScriptDir & "\DownloadInfo.ini", "DownloadInfo", "DownLoadInfo[" & $i & "][2]", "")*1
 
Next
EndIf
 
$hGUI = GUICreate("多线程下载", 600, 460, -1, -1, BitOR($WS_SIZEBOX, $GUI_SS_DEFAULT_GUI))
GUISetOnEvent ($GUI_EVENT_CLOSE, "ExitApp")
GUICtrlCreateLabel("URL:", 10, 30, 60)
$hUrl = GUICtrlCreateInput($url, 70, 26, 450)
GUICtrlSetOnEvent(-1, "UpdateFile")
GUICtrlCreateLabel("本地文件:", 10, 60, 60)
$hFile = GUICtrlCreateInput($file, 70, 56, 450)
GUICtrlCreateButton("浏览", 530, 58, 40, 20)
GUICtrlSetOnEvent(-1, "SaveAs")
GUICtrlCreateLabel("线程数:", 10, 90, 60)
$hTreads = GUICtrlCreateInput($DownloadThreads, 70, 86, 50, 20, $ES_NUMBER)
GUICtrlSetOnEvent(-1, "ChangeThreads")
GUICtrlCreateUpdown(-1)
GUICtrlSetLimit(-1, 10, 1)
$hStart = GUICtrlCreateButton("开始下载", 360, 90, 80)
GUICtrlSetOnEvent(-1, "StartDownload")
$hStop = GUICtrlCreateButton("停止下载", 480, 90, 80)
GUICtrlSetOnEvent(-1, "StopDownload")
If $DownLoadInfo[0][0] <> $DownLoadInfo[0][1] Then GUICtrlSetData($hStop, "恢复下载")
$hLog = GUICtrlCreateEdit("", 10, 130, 580, 200, BitOR($GUI_SS_DEFAULT_EDIT, $ES_READONLY))
ChangeThreads()
GUISetState(@SW_SHOW)
If $DownLoadInfo[0][0] <> $DownLoadInfo[0][1] Then Progress()
While 1
 
Sleep(100)
WEnd
 
 
;~ 退出
Func ExitApp()
 
Exit
EndFunc
 
;~ 退出前保存下载参数
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
 
;~ 改变线程数
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
 
$Progress[$i][0] = GUICtrlCreateLabel("线程 " & $i & " : ", 10, $h+2, 70)
 
$Progress[$i][1] = GUICtrlCreateProgress(80, $h, 150, 20)
 
$Progress[$i][2] = GUICtrlCreateLabel("", 240, $h+2, 380, 20)
 
$h += 30
 
Next
 
WinMove($hGUI, "", Default, Default, 600, $h+50)
EndFunc
 
;~ 另存为
Func SaveAs()
 
$url = GUICtrlRead($hUrl)
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
Local $f = FileSaveDialog( "另存为", @WorkingDir, "All (*.*)" , 16, $fname, $hGUI)
 
If @error Then Return
 
GUICtrlSetData($hFile, $f)
EndFunc
 
 
;~ 本地文件
Func UpdateFile()
 
$url = GUICtrlRead($hUrl)
 
$fname = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
$file = @WorkingDir & "\" & $fname
 
GUICtrlSetData($hFile, $file)
EndFunc
 
;~ 停止、恢复下载
Func StopDownload()
 
If GUICtrlRead($hStop) = "停止下载" Then
 
If $Downloading Then
 
$Downloading = 0
 
GUICtrlSetData($hStop, "恢复下载")
 
LogWrite("停止下载...")
 
EndIf
 
Else
 
; 以 Timer 方式启动下载，尽快返回主循环，避免下载期间 GUI 无响应
 
AdlibRegister("ResumeDownload", 50)
 
GUICtrlSetData($hStop, "停止下载")
 
EndIf
EndFunc
 
;~ 开始下载
Func StartDownload()
 
; 以 Timer 方式启动下载，尽快返回主循环，避免下载期间 GUI 无响应
 
AdlibRegister("Download", 50)
EndFunc
 
;~ 恢复下载
Func ResumeDownload()
 
AdlibUnRegister("ResumeDownload")
 
LogWrite("尝试恢复下载...")
 
$Downloading = 1
 
GUICtrlSetState($hStart, $GUI_DISABLE)
 
GUICtrlSetState($hTreads, $GUI_DISABLE)
 
GUICtrlSetData($hStop, "停止下载")
 
OnAutoItExitRegister("SaveInfoToFile")
 
MultiTreadDownload($url, $file, $DownloadThreads, 0, "Progress")
 
Local $error = @error
 
$Downloading = 0
 
GUICtrlSetState($hStart, $GUI_ENABLE)
 
GUICtrlSetState($hTreads, $GUI_ENABLE)
 
If Not $error Then
 
LogWrite("下载结束！")
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then FileDelete(@ScriptDir & "\DownloadInfo.ini")
 
OnAutoItExitUnRegister("SaveInfoToFile")
 
If MsgBox(4, "多线程下载", "下载成功！是否打开文件？") = 6 Then ShellExecute($file)
 
Else
 
GUICtrlSetData($hStop, "恢复下载")
 
If $error <> 3 Then LogWrite("下载出错，请检查网络然后尝试恢复下载。")
 
EndIf
EndFunc
 
;~ 开始下载
Func Download()
 
AdlibUnRegister("Download")
 
LogWrite("开始下载...")
 
$Downloading = 1
 
GUICtrlSetState($hStart, $GUI_DISABLE)
 
GUICtrlSetState($hTreads, $GUI_DISABLE)
 
GUICtrlSetData($hStop, "停止下载")
 
$url = GUICtrlRead($hUrl)
 
$file = GUICtrlRead($hFile)
 
OnAutoItExitRegister("SaveInfoToFile")
 
MultiTreadDownload($url, $file, $DownloadThreads, 1, "Progress")
 
Local $error = @error
 
$Downloading = 0
 
GUICtrlSetState($hStart, $GUI_ENABLE)
 
GUICtrlSetState($hTreads, $GUI_ENABLE)
 
If Not $error Then
 
LogWrite("下载结束！")
 
If FileExists(@ScriptDir & "\DownloadInfo.ini") Then FileDelete(@ScriptDir & "\DownloadInfo.ini")
 
OnAutoItExitUnRegister("SaveInfoToFile")
 
If MsgBox(4, "多线程下载", "下载成功！是否打开文件？") = 6 Then ShellExecute($file)
 
Else
 
GUICtrlSetData($hStop, "恢复下载")
 
If $error <> 3 Then LogWrite("下载出错，请检查网络然后尝试恢复下载。")
 
EndIf
EndFunc
 
;~ 显示 log
Func LogWrite($text)
 
GUICtrlSetData($hLog, $text & @crlf, 1)
EndFunc
 
;~ 按照 $DownLoadInfo 信息计算下载进度
Func Progress()
 
Local $threads = UBound($DownLoadInfo)
 
Local $error, $total, $current, $percent, $info
 
 
For $i = 0 To $threads - 1
 
$error = ""
 
If $DownLoadInfo[$i][3] = -1 Then $error = " - 出错暂停"
 
$total = $DownLoadInfo[$i][2] - $DownLoadInfo[$i][0]
 
$current = $DownLoadInfo[$i][1] - $DownLoadInfo[$i][0]
 
$percent = Round($current/$total*100, 1)
 
$info = $DownLoadInfo[$i][0] & " - (" & $DownLoadInfo[$i][1] & ") - " & $DownLoadInfo[$i][2] & ", 完成 " & $percent & " %" & $error
 
GUICtrlSetData($Progress[$i][1], $percent)
 
GUICtrlSetData($Progress[$i][2], $info)
 
Next
EndFunc
 
 
 
; #FUNCTION# ;===============================================================================
; Name...........: MultiTreadDownload
; Description ...: 多线程下载
; Syntax.........: MultiTreadDownload($url, $localfile, $DlThreads, $restart = 0, $progress = ")
; Parameters ....: $url - 网址，如："http://dl.google.com/chrome/install/912.12/chrome_installer.exe"
;                  $localfile - 本地文件路径
;                  $DlThreads - 下载线程数
;                  $restart - 1 - 重置 $DownLoadInfo、删除本地文件重新下载
;                             0 - 按照 $DownLoadInfo 的信息恢复未完成的下载任务
;                  $progress - 下载过程中显示进度的子程序名
; Return values .: Success -
;                  Failure - 设置 @error
; Author ........: 甲壳虫
;============================================================================================
Func MultiTreadDownload($url, $localfile = "", $DlThreads = 3, $restart = 0, $progress = "")
 
Local $i, $header, $remotesize, $aThread, $match
 
If $localfile = "" Then $localfile = StringTrimLeft($url, StringInStr($url, "/", 0, -1))
 
$hHttpOpen = _WinHttpOpen()
 
 
If $restart Then
 
; 测试服务器是否支持断点续传、获取远程文件大小，分块
 
$aThread = CreateThread($url, $hHttpOpen, "10-20")
 
$header = _WinHttpQueryHeaders($aThread[0])
 
_WinHttpCloseHandle($aThread[0])
 
_WinHttpCloseHandle($aThread[1])
 
If StringRegExp($header, '(?i)(?s)^HTTP/[\d\.]+ +200 ') Then ; 不支持断点续传
 
Dim $DownLoadInfo[1][5] = [[0,0,0]]
 
$match = StringRegExp($header, '(?i)(?m)Content-Length: *(\d+)', 1)
 
If Not @error Then
 
$remotesize = $match[0]
 
$DownLoadInfo[0][2] = $remotesize - 1
 
EndIf
 
Else
 
Dim $DownLoadInfo[$DlThreads][5]
 
$match = StringRegExp($header, '(?i)(?m)^Content-Range: *bytes +10-20/(\d+)', 1)
 
If Not @error Then ; 多线程分段下载
 
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
 
 
If Not $remotesize Then ; 如果远程文件大小未知，则改单线程下载
 
Dim $DownLoadInfo[1][5] = [[0,0,0]]
 
EndIf
 
If FileExists($localfile) Then FileDelete($localfile)
 
EndIf
 
 
; 发送请求
 
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
 
If $i = 0 And _WinHttpQueryHeaders($aThread[0], $WINHTTP_QUERY_STATUS_CODE) = 200 Then ; 不支持断点续传
 
$DownLoadInfo[$i][0] = 0
 
$DownLoadInfo[$i][1] = 0
 
EndIf
 
$DownLoadInfo[$i][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$i][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("线程 " & $i & " 分块: " & $DownLoadInfo[$i][0] & "-" & $DownLoadInfo[$i][2] & ", 请求: " & $DownLoadInfo[$i][1] & "-" & $DownLoadInfo[$i][2])
 
Next
 
 
; 接收数据
 
Local $i, $j, $n, $data, $RecvError, $RecvLen, $error
 
Local $ErrorThreads, $LiveThreads, $bytes
 
Local $hLocalFile = FileOpen($localfile, 25)
 
Do
 
For $i = 0 To $threads - 1
 
 
If IsNumber($DownLoadInfo[$i][3]) Then
 
If $DownLoadInfo[$i][3] = 0 Or $DownLoadInfo[$i][3] = -1 Then
 
ContinueLoop ; 0 表示该线程已下载完成，-1 表示该线程出错
 
EndIf
 
 
Sleep(10)
 
$DownLoadInfo[$i][3] += 1
 
if $DownLoadInfo[$i][3] > -100 Then
 
$DownLoadInfo[$i][3] = -1 ; 此线程出错，暂停尝试连接
 
ContinueLoop
 
EndIf
 
If Mod($DownLoadInfo[$i][3], -100) <> 0 Then ContinueLoop ; 隔100次重试一次
 
 
LogWrite("尝试恢复线程 " & $i & " ... ")
 
$aThread = CreateThread($url, $hHttpOpen, $DownLoadInfo[$i][1] & "-" & $DownLoadInfo[$i][2])
 
If @error Then ContinueLoop
 
$DownLoadInfo[$i][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$i][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("线程 " & $i & " 恢复下载! ")
 
EndIf
 
 
If _WinHttpQueryDataAvailable($DownLoadInfo[$i][3]) Then
 
$bytes = @extended
 
Else
 
$bytes = Default
 
EndIf
 
 
$data = _WinHttpReadData($DownLoadInfo[$i][3], 2, $bytes) ; read binary
 
$RecvError = @error
 
$RecvLen = @extended
 
If $RecvError = -1 Then ; 当前线程下载完成
 
_WinHttpCloseHandle($DownLoadInfo[$i][3])
 
_WinHttpCloseHandle($DownLoadInfo[$i][4])
 
$DownLoadInfo[$i][3] = 0 ; 设为 0 表示该线程已下载完成
 
LogWrite("线程 " & $i & " 下载完成! ")
 
 
; 判断是否有出错暂停的线程
 
$n = 0
 
For $j = 0 To $threads - 1
 
If $DownLoadInfo[$j][3] = -1 Then
 
$n = $j
 
ExitLoop
 
EndIf
 
Next
 
; 尝试重新启动出错的线程
 
If $n Then
 
LogWrite("尝试恢复线程 " & $n & " ...")
 
For $j = 1 To 3 ; 重试3次
 
Sleep(200)
 
$aThread = CreateThread($url, $hHttpOpen, $DownLoadInfo[$n][1] & "-" & $DownLoadInfo[$n][2])
 
If @error Then ContinueLoop
 
$DownLoadInfo[$n][3] = $aThread[0] ; $hHttpRequest
 
$DownLoadInfo[$n][4] = $aThread[1] ; $hHttpConnect
 
LogWrite("线程 " & $n & " 恢复下载! ")
 
ExitLoop
 
Next
 
EndIf
 
ElseIf $RecvError Then ; 出错，重试，断点续传
 
_WinHttpCloseHandle($DownLoadInfo[$i][3])
 
_WinHttpCloseHandle($DownLoadInfo[$i][4])
 
$DownLoadInfo[$i][3] = -1000 ; 表示该线程出错
 
LogWrite("线程 " & $i & " 出错。")
 
ElseIf $RecvLen Then
 
FileSetPos($hLocalFile, $DownLoadInfo[$i][1], 0)
 
If Not FileWrite($hLocalFile, $data) Then
 
$error = 1 ; 写入文件出错
 
ExitLoop 2
 
Else
 
$DownLoadInfo[$i][1] += $RecvLen
 
EndIf
 
EndIf
 
Next
 
 
If $progress Then ; 调用进度显示
 
Call($progress)
 
EndIf
 
 
; 检查下载是否结束，是否出错
 
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
 
$error = 2 ; 下载出错
 
ExitLoop
 
EndIf
 
 
If Not $Downloading Then
 
$error = 3 ; 手动停止
 
ExitLoop
 
EndIf
 
Until Not $LiveThreads ; 下载结束
 
 
HttpCloseHandles()
 
FileClose($hLocalFile)
 
Return SetError($error)
EndFunc   ;==>MultiTreadDownload
 
; #FUNCTION# ;===============================================================================
; Name...........: CreateThread
; Description ...: 创建线程
; Syntax.........: CreateThread($url, $hHttpOpen, $range = "")
; Parameters ....: $url - 网址，如："http://dl.google.com/chrome/install/912.12/chrome_installer.exe"
;                  $hHttpOpen - _WinHttpOpen()返回的 handle
;                  $range - 请求的范围, 如 "0-10000"
; Return values .: array
;                  0 - 成功: $hHttpRequest, 失败: -1 并设置 @error
;                  1 - $hHttpConnect
; Author ........: 甲壳虫
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
; Description ...: 解析 http 网址
; Syntax.........: HttpParseUrl($url)
; Parameters ....: $url - 网址，如：[url=http://dl.google.com/chrome/install/912.12/chrome_installer.exe]http://dl.google.com/chrome/install/912.12/chrome_installer.exe[/url]
; Return values .: Success - $Array[0] - host, 如：dl.google.com
;                            $Array[1] - page, 如：/chrome/install/912.12/chrome_installer.exe
;                            $Array[2] - port, 如：80
;                  Failure - Returns empty sets @error
; Author ........: 甲壳虫
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
