#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\测试脚本\更新助手.exe
#PRE_Outfile=N:\测试脚本\更新助手.exe
#PRE_Compression=4
#PRE_Res_Fileversion=2.0.0.0
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

HotKeySet("!1", "xiaozhan") 
HotKeySet("!2", "suoxiao") 
HotKeySet("!3", "ExitScript") 

#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <array.au3>
#include <IE.au3>

Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 679, 425, 192, 124)
$oIE = _IECreateEmbedded()
GUICtrlCreateObj($oIE, 4, 2, 673, 388)
$Button1 = GUICtrlCreateButton("重载", 616, 395, 57, 25)
$Label1 = GUICtrlCreateLabel("         Alt+1 显示窗口      Alt+2 隐藏窗口     Alt+3 关闭本窗口", 0, 400, 274, 17)
GUISetState(@SW_HIDE)
;GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

re()

GUISetOnEvent( $GUI_EVENT_MINIMIZE, "suoxiao")
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xiaozhan") ;注册鼠标左键双击事件(只能在 TrayOnEventMode 设置为 1 时才能使用)
$Start = TrayCreateItem("启用") ;创建第一个菜单项
TrayItemSetOnEvent(-1,"qiyong") ;注册第一个菜单项的（被点下）事件  
;TrayItemSetOnEvent = 当系统托盘发生一个特殊事件就执行一个用户自定义函数
TrayCreateItem("") ;创建一个空白的菜单项（即横斜杠分割符） 
;TrayCreateItem = 在系统托盘上面创建一个菜单项目控件
$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ExitScript") ;注册第二个菜单项的（被点下）事件

TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
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

;==================================================================

Func re()
	_IENavigate($oIE, "http://zh-hr.com")
	_IEAction($oIE, "stop")
	$un = "613973DFF6774BDFF64EC56584D2160C"
	$pw = "613973DFF6774BDFF64DC51784A3160E440A917F8F3BEEF2"
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
        
     ; DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $gx, "int", 1000, "long", 0x00090000);渐隐

        Exit
        
 EndFunc
 
 
Func xiaozhan()
   GUISetState(@SW_SHOW, $Form1)   ;调整窗口的状态
   GUISetState(@SW_RESTORE, $Form1)
 
EndFunc   ;==>启用(双击鼠标)

Func suoxiao()
 GUISetState(@SW_HIDE,$Form1)
EndFunc

Func qiyong()
   GUISetState(@SW_SHOW, $Form1)    ;调整窗口的状态    
   GUISetState(@SW_RESTORE, $Form1)
  
EndFunc  ;==>启用

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>退出

Func post($username, $password)
	
	Local $cookie, $oHTTP, $ResponseText, $postdata
	;=======================登录包开始

	$postdata = "rand=831&homepagelogin=1&loginname=" & $username & "&loginpwd=" & $password & "&submit=";提交数据
	;请将提交数据中的用户名和密码替换为自己的即可  文本加密函数 以及其他功能 自己随意添加
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");创建winhttp.winhttprequest.5.1对象
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);设置超时时间
	$oHTTP.Option(4) = 13056;忽略错误标志
	$oHTTP.option(6) = 0;禁止重定向
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/login/logincheck.jsp", False);创建post/get请求；False 同步方式；True 异步方式
	;------设置请求头开始
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/home/centerzhhr.jsp");来路  就是从哪个网页跳转过来的
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");浏览器标识
	;------设置请求头结束
	$oHTTP.Send($postdata);发送请求
	$cookie = $oHTTP.getResponseHeader("Set-Cookie");获取指定的响应头信息,这里获取的是返回cookie
	$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
	;ConsoleWrite($cookie & @CRLF)
	;FileWrite("响应正文1.txt", $ResponseText);保存到本地 方便用来调试
	$oHTTP = 0;释放对象

	;======================登录包结束

;~ 	If StringInStr($ResponseText, "/jsp/person/other/zhtj.jsp") Then
;~ 		MsgBox(0, "提示", "登录成功")
;~ 	Else
;~ 		MsgBox(0, "提示", "登录失败")
;~ 	EndIf


	;======================刷新包开始

	$postdata = "refresh=1"
	$oHTTP = ObjCreate("winhttp.winhttprequest.5.1");创建winhttp.winhttprequest.5.1对象
	$oHTTP.SetTimeouts(15000, 15000, 15000, 15000);设置超时时间
	$oHTTP.Option(4) = 13056;忽略错误标志
	$oHTTP.option(6) = 0;禁止重定向
	$oHTTP.Open("post", "http://zh-hr.com/jsp/person/other/zhtj.jsp", False);创建post/get请求；False 同步方式；True 异步方式
	;------设置请求头开始
	$oHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	$oHTTP.setRequestHeader("Referer", "http://zh-hr.com/jsp/person/other/zhtj.jsp");来路  就是从哪个网页跳转过来的
	$oHTTP.setRequestHeader("Accept-Encoding", "gzip, deflate")
	$oHTTP.setRequestHeader("Accept-Language", "zh-cn")
	$oHTTP.setRequestHeader("Content-Length", "9")
	$oHTTP.setRequestHeader("Connection", "Keep-Alive")
	$oHTTP.setRequestHeader("Cookie", $cookie)
	$oHTTP.setRequestHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)");浏览器标识
	;------设置请求头结束
	$oHTTP.Send($postdata);发送请求
	$ResponseHeaders = $oHTTP.GetAllResponseHeaders;获取完整响应头
	$ResponseText = $oHTTP.ResponseText;获取响应正文（文本）
	;ConsoleWrite($ResponseHeaders)
	;FileWrite("响应正文2.txt", $ResponseText);保存到本地 方便用来调试
	$oHTTP = 0;释放对象

	;======================刷新包结束

;~ 	If StringInStr($ResponseText, "成功刷新简历") Then
;~ 		MsgBox(0, "提示", "刷新成功")
;~ 	Else
;~ 		MsgBox(0, "提示", "刷新失败")
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
