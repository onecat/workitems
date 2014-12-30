#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\图标素材\Internet.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\电影网站每个月登录一次.exe
#PRE_Compression=4
#PRE_Res_Comment=电影网站每个月登录一次
#PRE_Res_Description=电影网站每个月登录一次
#PRE_Res_Fileversion=2.1.4.2
#PRE_Res_LegalCopyright=小站所有
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
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
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <array.au3>
#include <IE.au3>


#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
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

$Form1 = GUICreate("ZNU每月登录一次", 228, 105, 233, 124)
$Label1 = GUICtrlCreateLabel("帐号", 8, 20, 28, 17)
$Label2 = GUICtrlCreateLabel("密码", 8, 44, 28, 17)
$Input1 = GUICtrlCreateInput("zhqf2080@126.com", 40, 16, 177, 21)
$INPUT_PASSWORD = GUICtrlCreateInput("xz0031140", 40, 40, 177, 21, BitOR($ES_AUTOHSCROLL, $ES_PASSWORD))
$INPUT_WNDPROC = _WinAPI_SetWindowLong(GUICtrlGetHandle(-1), -4, $pInputProc)
$Button1 = GUICtrlCreateButton("确定", 16, 72, 81, 25,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button2 = GUICtrlCreateButton("退出", 128, 72, 81, 25)
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
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("ZNU每月登录一次", 679, 425, 192, 124)
$oIE = _IECreateEmbedded()
GUICtrlCreateObj($oIE, 4, 2, 673, 388)
$Button1 = GUICtrlCreateButton("重载", 616, 395, 57, 25)
$Label1 = GUICtrlCreateLabel("         Alt+1 显示窗口      Alt+2 隐藏窗口     Alt+3 关闭本窗口", 0, 400, 400, 17)
;GUISetState(@SW_HIDE)
GUISetState(@SW_SHOW)

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

EndFunc	


Func re()
	_IENavigate($oIE, "http://cpanel.znu.cc")
	_IEAction($oIE, "stop")
	$un = zh()
	$pw = mm()
	$username = StringEncrypt(0, $un, 'abc', 1, 4)
	$password = StringEncrypt(0, $pw, 'abc', 1, 4)
	BlockInput(1);屏蔽鼠标和键盘用在这只限制IE网页
	$Ele = _IEGetObjById($oIE,"login_email")
	_IEFormElementSetValue($Ele,$username )
	$Ele = _IEGetObjById($oIE,"login_password")
	_IEFormElementSetValue($Ele,$password)
	$Ele = _IEGetObjById($oIE,"lang")
	_IEFormElementOptionSelect($Ele,1,1,"byIndex") ;按0基索引选择下拉第一个
	BlockInput(0)
	$Ele = _IETagNameGetCollection($oIE,"BUTTON",1) ;注意相同name情况,需要第三参数
	_IEAction($Ele,"click");点击
	_IELoadWait ($oIE)
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
