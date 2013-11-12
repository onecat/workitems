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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Res_Comment=www.lizhizx.com
#AutoIt3Wrapper_Res_Description=百度网盘获取最终下载地址V1.0
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=www.lizhizx.com
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
;----------百度网盘获取最终下载地址V1.0  作者树 QQ: 6909717
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinHttp.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("百度网盘获取最终下载地址V1.0", 503, 272, -1, -1)
$Label1 = GUICtrlCreateLabel("百度网盘地址", 24, 54, 81, 17)
$Input1 = GUICtrlCreateInput("http://pan.baidu.com/s/1d2IFQ", 104, 54, 289, 21)
$Button1 = GUICtrlCreateButton("获取", 408, 54, 75, 25)
$Input2 = GUICtrlCreateInput("", 104, 104, 289, 21)
$Button2 = GUICtrlCreateButton("复制", 408, 104, 75, 25)
$Label2 = GUICtrlCreateLabel("最终下载地址", 24, 104, 81, 17)
$Label3 = GUICtrlCreateLabel("点这里查看使用说明", 135, 160, 220, 33)
GUICtrlSetFont(-1, 18, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetCursor (-1, 0)
$Label4 = GUICtrlCreateLabel("www.lizhizx.com 励志在线", 102, 200, 338, 33)
GUICtrlSetFont(-1, 18, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetCursor (-1, 0)
$Label5 = GUICtrlCreateLabel("本工具只做测试，请下载使用后24小时内删除本软件。", 108, 250, 338, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;~ _getbdurl()
;~ MsgBox(0,0,_getbdurl())
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                        
                Case $Label3
                        ShellExecute("http://www.lizhizx.com/bdpan");默认浏览器打开
                        
                Case $Label4
                        ShellExecute("http://www.lizhizx.com/");默认浏览器打开        
                        
                Case $Button1
                        GUICtrlSetState($Button1, $GUI_DISABLE) ;控件将变成灰色状态(不可用)
                        GUICtrlSetData($Button1 , "获取中")
                        $mp3url = GUICtrlRead($Input1)
                        If $mp3url<>"" Then
                                $aaa = _getbdurl($mp3url)
                                GUICtrlSetData($Input2 , $aaa)
                                
                        Else
                                MsgBox(0,"提示","请输入百度网盘地址","",$Form1)
                                GUICtrlSetState ($Input1,$GUI_FOCUS)
                        EndIf
                        GUICtrlSetData($Button1 , "获取")
                        GUICtrlSetState($Button1, $GUI_ENABLE) ;控件将变成灰色状态(可用)        
                Case $Button2
                        ClipPut (GUICtrlRead($Input2))
                        MsgBox(0,"提示","复制成功，请打开IE浏览器打开地址就可以下载。","",$Form1)
        EndSwitch
WEnd

Func _getbdurl($urla)
        Local $hebing
        $aaa = _httpconnect($urla, "get", "", '', '', 0, 1)
        If @error Or UBound($aaa)<2 Then Return SetError(1,1,0)
;        If Not StringInStr($aaa[0], 'Set-Cookie: username=') Then Return SetError(2, 2, 0)
;        ConsoleWrite($aaa[1] & @CRLF)
;~         MsgBox(0,0,$aaa[1])
        $ar = StringRegExp($aaa[1], 'home\?uk=(.+?)" target', 3)
        $ar2 = StringRegExp($aaa[1], 'FileUtils.share_id="(.+?)"', 3)
        $ar3 = StringRegExp($aaa[1], 'ViewShareUtils.fsId="(.+?)"', 3)
;~         MsgBox(0,0,$ar3[0])
        $hebing = $ar[0]&"-"&$ar2[0]&"-"&$ar3[0]
        $aaaa = _httpconnect("http://pan.baidu.com/share/download?bdstoken=null&uk="&$ar[0]&"&shareid="&$ar2[0]&"&fid_list=%5B"&$ar3[0]&"%5D", "get", "", '', '', 0, 1)
;~         MsgBox(0,0,$aaaa[1])
        $ar4 = StringRegExp($aaaa[1], 'dlink":"(.+?)"', 3)
        $ar5 = StringReplace($ar4[0], "\", "")
        Return $ar5
EndFunc


Func _httpconnect($_the_url = "", $_method = "post", $_Referer = "", $_cookies = "", $_send_info = "", $_is_REDIRECTS = 1, $_result_code = 2, $_Accept_Encoding = 'gzip,deflate', $_daili_to_use = "", $_Accept_centent = "*/*", $_iServerPort = $INTERNET_DEFAULT_PORT, $_isgetresult = 1)
        Local $_the_server, $_thequest, $_the_headers, $_the_info_to_return[2], $_is_SECURE = $WINHTTP_FLAG_ESCAPE_DISABLE
        $_method = StringUpper($_method)
        If StringInStr($_the_url, "https://") Then $_is_SECURE = $WINHTTP_FLAG_SECURE
        $_the_url = StringRegExpReplace($_the_url, 'https://|http://', '')
        $_the_server = StringRegExp($_the_url, '.*?(?=/)', 1)
        If @error Then $_the_server = $_the_url
        $_thequest = StringRight($_the_url, StringLen($_the_url) - StringLen($_the_server[0]))
        If $_daili_to_use <> "" Then
                $_hOpen = _WinHttpOpen("Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8", $WINHTTP_ACCESS_TYPE_NAMED_PROXY, $_daili_to_use)
        Else
                $_hOpen = _WinHttpOpen("Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8")
        EndIf
        _WinHttpSetTimeouts($_hOpen, 0, 10000, 10000, 10000)
        $_hConnect = _WinHttpConnect($_hOpen, $_the_server[0], $_iServerPort)
        $_hRequest = _WinHttpOpenRequest($_hConnect, $_method, $_thequest, "HTTP/1.1", $_Referer, $_Accept_centent, $_is_SECURE)
        If $_is_REDIRECTS == 0 Then _WinHttpSetOption($_hRequest, $WINHTTP_OPTION_DISABLE_FEATURE, $WINHTTP_DISABLE_REDIRECTS)
        If $_cookies <> "" Then _WinHttpAddRequestHeaders($_hRequest, 'Cookie:' & $_cookies & @CRLF)
        $_the_headers &= 'Cache-Control:no-cache' & @CRLF
        If $_method == "POST" Then $_the_headers &= 'Content-Type:application/x-www-form-urlencoded' & @CRLF
;~         $_the_headers &= 'Accept-Encoding: ' & $_Accept_Encoding & @CRLF
;~         $_the_headers &= 'Accept-Encoding: ' & $_Accept_Encoding & @CRLF
        $_the_headers &= 'Accept-Language: zh-cn' & @CRLF
        $_the_headers &= 'Connection:Keep-Alive' & @CRLF
        _WinHttpSendRequest($_hRequest, $_the_headers, $_send_info, StringLen($_send_info))
        If $_isgetresult == 1 Then
                _WinHttpReceiveResponse($_hRequest)
                If _WinHttpQueryDataAvailable($_hRequest) Then
                        $_header = _WinHttpQueryHeaders($_hRequest)
                        $_the_info_to_return[0] = $_header
                        $_body = _WinHttpReadData($_hRequest, $_result_code, 1000000)
                        $_the_info_to_return[1] = $_body
                Else
                        _WinHttpCloseHandle($_hRequest)
                        _WinHttpCloseHandle($_hConnect)
                        _WinHttpCloseHandle($_hOpen)
                        Return SetError(1, 0, 0)
                EndIf
        Else
                Return
        EndIf
        _WinHttpCloseHandle($_hRequest)
        _WinHttpCloseHandle($_hConnect)
        _WinHttpCloseHandle($_hOpen)
        Return $_the_info_to_return
EndFunc   ;==>_httpconnect