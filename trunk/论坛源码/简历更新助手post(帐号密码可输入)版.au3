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
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <Constants.au3>
#include <array.au3>
#include <WinAPI.au3>
#include <IE.au3>

#Region ### START Koda GUI section ### Form=C:\Users\chtyfox\Desktop\Form1.kxf

Const $FLAG_READING = 1
Const $FLAG_PROTECTED = 2
 
Global $INPUT_FLAG, $INPUT_WNDPROC
Local $oIE
 
$hInputProc = DllCallbackRegister("_InputProc", "long", "hwnd;long;wparam;lparam")
$pInputProc = DllCallbackGetPtr($hInputProc)

;-------------------------------------------------------------------------------------

$Form1 = GUICreate("test", 228, 105, 233, 124)
$Label1 = GUICtrlCreateLabel("�ʺ�", 8, 20, 28, 17)
$Label2 = GUICtrlCreateLabel("����", 8, 44, 28, 17)
$Input1 = GUICtrlCreateInput("", 40, 16, 177, 21)
$INPUT_PASSWORD = GUICtrlCreateInput("", 40, 40, 177, 21, BitOR($ES_AUTOHSCROLL, $ES_PASSWORD))
$INPUT_WNDPROC = _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pInputProc)
$Button1 = GUICtrlCreateButton("ȷ��", 16, 72, 81, 25,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("�˳�", 128, 72, 81, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

_ProtectInputFromRemoteRead()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1	
			WinSetState($Form1, "", @SW_HIDE)
			abc()
			GUIDelete($Form1)
		Case $Button2
			Exit
	EndSwitch
WEnd

Func zh()
	$Encryption1 = StringEncrypt(1, GUICtrlRead($Input1), 'abc', 1, 4)
	Return $Encryption1
EndFunc	

Func mm()
	$Encryption = StringEncrypt(1, _ReadData(), 'abc', 1, 4)
	Return $Encryption
EndFunc

Func _ReadData()
        $INPUT_FLAG = BitOR($INPUT_FLAG, $FLAG_READING)
        Local $sPassword = GUICtrlRead($INPUT_PASSWORD)
        $INPUT_FLAG = BitAND($INPUT_FLAG, BitNot($FLAG_READING))
        Return $sPassword
EndFunc ;==>_ReadData
 
Func _ProtectInputFromRemoteRead()
        $INPUT_FLAG = BitXOR($INPUT_FLAG, $FLAG_PROTECTED)
EndFunc ;==>_ProtectInputFromRemoteRead
 
Func _InputProc($hWnd, $iMsg, $iwParam, $ilParam)
        If $iMsg = $WM_GETTEXT And BitAND($INPUT_FLAG, BitOR($FLAG_READING, $FLAG_PROTECTED)) = $FLAG_PROTECTED Then
                Return 1
        EndIf
        Return _WinAPI_CallWindowProc($INPUT_WNDPROC, $hWnd, $iMsg, $iwParam, $ilParam)
EndFunc ;==>_InputProc



Func abc()
	
HotKeySet("!1", "xiaozhan") 
HotKeySet("!2", "suoxiao") 
HotKeySet("!3", "ExitScript") 

Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;û��Ĭ�ϵģ���ͣ�ű����˳����˵�.
Opt("trayOnEventMode", 1) ;Ӧ�� OnEvent ������ϵͳ����

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("��������", 679, 425, 192, 124)
$oIE = _IECreateEmbedded()
GUICtrlCreateObj($oIE, 4, 2, 673, 388)
$Button1 = GUICtrlCreateButton("����", 616, 395, 57, 25)
GUISetState(@SW_HIDE)
;GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

re()

GUISetOnEvent( $GUI_EVENT_MINIMIZE, "suoxiao")
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xiaozhan") ;ע��������˫���¼�(ֻ���� TrayOnEventMode ����Ϊ 1 ʱ����ʹ��)
$Start = TrayCreateItem("����") ;������һ���˵���
TrayItemSetOnEvent(-1,"qiyong") ;ע���һ���˵���ģ������£��¼�  
;TrayItemSetOnEvent = ��ϵͳ���̷���һ�������¼���ִ��һ���û��Զ��庯��
TrayCreateItem("") ;����һ���հ׵Ĳ˵������б�ָܷ���� 
;TrayCreateItem = ��ϵͳ�������洴��һ���˵���Ŀ�ؼ�
$Quit = TrayCreateItem("�˳�") ;�����������˵���
TrayItemSetOnEvent(-1,"ExitScript") ;ע��ڶ����˵���ģ������£��¼�

TraySetClick(8)  ;���������ϵͳ����ͼ������ĵ��ģʽ - ������������Ż���ʾϵͳ���̵Ĳ˵�  8 = ��������Ҫ����(ͨ���Ҽ�) 
TraySetState()


;===============================================================

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			re()
	EndSwitch
WEnd

EndFunc	


Func re()
	_IENavigate($oIE, "http://zh-hr.com")
	_IEAction($oIE, "stop")
	$un = zh()
	$pw = mm()
	$username = StringEncrypt(0, $un, 'abc', 1, 4)
	$password = StringEncrypt(0, $pw, 'abc', 1, 4)
	post($username, $password)
	$Ele = _IEGetObjById($oIE, "loginname")
	_IEFormElementSetValue($Ele, $username)
	$Ele = _IEGetObjById($oIE, "loginpwd")
	_IEFormElementSetValue($Ele, $password)
	$Ele = _IETagNameGetCollection($oIE, "SPAN", 18)
	_IEAction($Ele, "click")
	Sleep(300)
	Return
EndFunc   ;==>re



Func _Exit()
        
     ; DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $gx, "int", 1000, "long", 0x00090000);����

        Exit
        
 EndFunc
 
 
Func xiaozhan()
   GUISetState(@SW_SHOW, $Form1)   ;�������ڵ�״̬
   GUISetState(@SW_RESTORE, $Form1)
 
EndFunc   ;==>����(˫�����)

Func suoxiao()
 GUISetState(@SW_HIDE,$Form1)
EndFunc

Func qiyong()
   GUISetState(@SW_SHOW, $Form1)    ;�������ڵ�״̬    
   GUISetState(@SW_RESTORE, $Form1)
  
EndFunc  ;==>����

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>�˳�

Func post($username, $password)
	
	Local $cookie, $oHTTP, $ResponseText, $postdata
	;=======================��¼����ʼ

	$postdata = "rand=831&homepagelogin=1&loginname=" & $username & "&loginpwd=" & $password & "&submit=";�ύ����
	;�뽫�ύ�����е��û����������滻Ϊ�Լ��ļ���  �ı����ܺ��� �Լ��������� �Լ��������
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");����winhttp.winhttprequest.5.1����
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);���ó�ʱʱ��
	$oHTTP.Option(4) = 13056;���Դ����־
	$oHTTP.option(6) = 0;��ֹ�ض���
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/login/logincheck.jsp", False);����post/get����False ͬ����ʽ��True �첽��ʽ
	;------��������ͷ��ʼ
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/home/centerzhhr.jsp");��·  ���Ǵ��ĸ���ҳ��ת������
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");�������ʶ
	;------��������ͷ����
	$oHTTP.Send($postdata);��������
	$cookie = $oHTTP.getResponseHeader("Set-Cookie");��ȡָ������Ӧͷ��Ϣ,�����ȡ���Ƿ���cookie
	$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
	;ConsoleWrite($cookie & @CRLF)
	;FileWrite("��Ӧ����1.txt", $ResponseText);���浽���� ������������
	$oHTTP = 0;�ͷŶ���

	;======================��¼������

;~ 	If StringInStr($ResponseText, "/jsp/person/other/zhtj.jsp") Then
;~ 		MsgBox(0, "��ʾ", "��¼�ɹ�")
;~ 	Else
;~ 		MsgBox(0, "��ʾ", "��¼ʧ��")
;~ 	EndIf


	;======================ˢ�°���ʼ

	$postdata = "refresh=1"
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");����winhttp.winhttprequest.5.1����
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);���ó�ʱʱ��
	$oHTTP.Option(4) = 13056;���Դ����־
	$oHTTP.option(6) = 0;��ֹ�ض���
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/other/zhtj.jsp", False);����post/get����False ͬ����ʽ��True �첽��ʽ
	;------��������ͷ��ʼ
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/person/other/zhtj.jsp");��·  ���Ǵ��ĸ���ҳ��ת������
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("Content-Length", "9")
	$oHTTP.setRequestHeader("Connection", "Keep-Alive")
	$oHTTP.setRequestHeader("Cookie", $cookie)
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");�������ʶ
	;------��������ͷ����
	$oHTTP.Send($postdata);��������
	$ResponseHeaders = $oHTTP.GetAllResponseHeaders;��ȡ������Ӧͷ
	$ResponseText = $oHTTP.ResponseText;��ȡ��Ӧ���ģ��ı���
	;ConsoleWrite($ResponseHeaders)
	;FileWrite("��Ӧ����2.txt", $ResponseText);���浽���� ������������
	$oHTTP = 0;�ͷŶ���

	;======================ˢ�°�����

;~ 	If StringInStr($ResponseText, "�ɹ�ˢ�¼���") Then
;~ 		MsgBox(0, "��ʾ", "ˢ�³ɹ�")
;~ 	Else
;~ 		MsgBox(0, "��ʾ", "ˢ��ʧ��")
;~ 	EndIf

EndFunc   ;==>post

Func StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1, $i_Flag = 1)
    If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
        SetError(1)
        Return ''
    ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
        SetError(1)
        Return ''
    Else
        If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
        Local $b_EncryptText
        Local $b_EncryptPassword
        Local $v_EncryptModified
        Local $i_EncryptCountH
        Local $i_EncryptCountG
        Local $v_EncryptSwap
        Local $av_EncryptBox[256][2]
        Local $i_EncryptCountA
        Local $i_EncryptCountB
        Local $i_EncryptCountC
        Local $i_EncryptCountD
        Local $i_EncryptCountE
        Local $v_EncryptCipher
        Local $v_EncryptCipherBy
        $b_EncryptText = StringToBinary($s_EncryptText, $i_Flag)
        $b_EncryptPassword = StringToBinary($s_EncryptPassword, $i_Flag)
        If $i_Encrypt = 1 Then
            For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                $i_EncryptCountG = ''
                $i_EncryptCountH = ''
                $v_EncryptModified = Binary('')
                For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
                    If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
                        $i_EncryptCountH = 1
                    Else
                        $i_EncryptCountH += 1
                    EndIf
                    $v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255),2))
                Next
                $b_EncryptText = $v_EncryptModified
                $i_EncryptCountA = ''
                $i_EncryptCountB = 0
                $i_EncryptCountC = ''
                $i_EncryptCountD = ''
                $i_EncryptCountE = ''
                $v_EncryptCipherBy = ''
                $v_EncryptCipher = ''
                $v_EncryptSwap = ''
                $av_EncryptBox = ''
                Local $av_EncryptBox[256][2]
                For $i_EncryptCountA = 0 To 255
                    $av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1),2))
                    $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                Next
                For $i_EncryptCountA = 0 To 255
                    $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                    $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                    $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                    $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                Next
                For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
                    $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                    $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                    $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
                    $v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
                    $v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy, 2))
                Next
                $b_EncryptText = StringTrimLeft($v_EncryptCipher,2)
            Next
        Else
            $b_EncryptText = $s_EncryptText
            For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                $b_EncryptText = Binary('0x' & $b_EncryptText)
                $i_EncryptCountB = 0
                $i_EncryptCountC = ''
                $i_EncryptCountD = ''
                $i_EncryptCountE = ''
                $v_EncryptCipherBy = ''
                $v_EncryptCipher = ''
                $v_EncryptSwap = ''
                $av_EncryptBox = ''
                Local $av_EncryptBox[256][2]
                For $i_EncryptCountA = 0 To 255
                    $av_EncryptBox[$i_EncryptCountA][1] = Dec(StringTrimLeft(BinaryMid($b_EncryptPassword, Mod($i_EncryptCountA, BinaryLen($b_EncryptPassword)) + 1, 1),2))
                    $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                Next
                For $i_EncryptCountA = 0 To 255
                    $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                    $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                    $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                    $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                Next
                For $i_EncryptCountA = 1 To BinaryLen($b_EncryptText)
                    $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                    $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                    $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
                    $v_EncryptCipherBy = BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountA, 1), $i_EncryptCountE)
                    $v_EncryptCipher = Binary($v_EncryptCipher) & Binary('0x' & Hex($v_EncryptCipherBy,2))
                Next
                $b_EncryptText = $v_EncryptCipher
                $i_EncryptCountG = ''
                $i_EncryptCountH = ''
                $v_EncryptModified = ''
                For $i_EncryptCountG = 1 To BinaryLen($b_EncryptText)
                    If $i_EncryptCountH = BinaryLen($b_EncryptPassword) Then
                        $i_EncryptCountH = 1
                    Else
                        $i_EncryptCountH += 1
                    EndIf
                    $v_EncryptModified = Binary($v_EncryptModified) & Binary('0x' & Hex(BitXOR(BinaryMid($b_EncryptText, $i_EncryptCountG, 1), BinaryMid($b_EncryptPassword, $i_EncryptCountH, 1), 255),2))
                Next
                $b_EncryptText = BinaryToString($v_EncryptModified, $i_Flag)
            Next
        EndIf
        Return $b_EncryptText
    EndIf
EndFunc   ;==>_StringEncrypt
