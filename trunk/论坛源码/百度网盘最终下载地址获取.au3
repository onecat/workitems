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

#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Res_Comment=www.lizhizx.com
#AutoIt3Wrapper_Res_Description=�ٶ����̻�ȡ�������ص�ַV1.0
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=www.lizhizx.com
#EndRegion ;**** ���������� ACNWrapper_GUI ****
;----------�ٶ����̻�ȡ�������ص�ַV1.0  ������ QQ: 6909717
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinHttp.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("�ٶ����̻�ȡ�������ص�ַV1.0", 503, 272, -1, -1)
$Label1 = GUICtrlCreateLabel("�ٶ����̵�ַ", 24, 54, 81, 17)
$Input1 = GUICtrlCreateInput("http://pan.baidu.com/s/1d2IFQ", 104, 54, 289, 21)
$Button1 = GUICtrlCreateButton("��ȡ", 408, 54, 75, 25)
$Input2 = GUICtrlCreateInput("", 104, 104, 289, 21)
$Button2 = GUICtrlCreateButton("����", 408, 104, 75, 25)
$Label2 = GUICtrlCreateLabel("�������ص�ַ", 24, 104, 81, 17)
$Label3 = GUICtrlCreateLabel("������鿴ʹ��˵��", 135, 160, 220, 33)
GUICtrlSetFont(-1, 18, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetCursor (-1, 0)
$Label4 = GUICtrlCreateLabel("www.lizhizx.com ��־����", 102, 200, 338, 33)
GUICtrlSetFont(-1, 18, 400, 4, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetCursor (-1, 0)
$Label5 = GUICtrlCreateLabel("������ֻ�����ԣ�������ʹ�ú�24Сʱ��ɾ���������", 108, 250, 338, 33)
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
                        ShellExecute("http://www.lizhizx.com/bdpan");Ĭ���������
                        
                Case $Label4
                        ShellExecute("http://www.lizhizx.com/");Ĭ���������        
                        
                Case $Button1
                        GUICtrlSetState($Button1, $GUI_DISABLE) ;�ؼ�����ɻ�ɫ״̬(������)
                        GUICtrlSetData($Button1 , "��ȡ��")
                        $mp3url = GUICtrlRead($Input1)
                        If $mp3url<>"" Then
                                $aaa = _getbdurl($mp3url)
                                GUICtrlSetData($Input2 , $aaa)
                                
                        Else
                                MsgBox(0,"��ʾ","������ٶ����̵�ַ","",$Form1)
                                GUICtrlSetState ($Input1,$GUI_FOCUS)
                        EndIf
                        GUICtrlSetData($Button1 , "��ȡ")
                        GUICtrlSetState($Button1, $GUI_ENABLE) ;�ؼ�����ɻ�ɫ״̬(����)        
                Case $Button2
                        ClipPut (GUICtrlRead($Input2))
                        MsgBox(0,"��ʾ","���Ƴɹ������IE������򿪵�ַ�Ϳ������ء�","",$Form1)
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