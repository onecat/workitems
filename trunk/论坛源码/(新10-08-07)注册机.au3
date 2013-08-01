#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ACN_HASH.au3>
#NoTrayIcon 
#AutoIt3Wrapper_icon=D:\autoit3\Aut2Exe\Icons\kde.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=【智能网维】       编写制作 【土豆】：QQ_825312600  Http://www.sn189.com
#AutoIt3Wrapper_Res_Description=【智能网维工作室】 Http://www.sn189.com
#AutoIt3Wrapper_Res_Fileversion=1.0.5.0
;  2010-08-07 19:27修正 （注册机）
; 智能网维工作室 
;【智能网维工作室】 Http://www.sn189.com 
; 程序编写【土豆】：QQ:825312600  Cmaoge@126.com
Dim $Cdkey
$KeyPw = "Cmaoge@126.com" ;计算注册码时用到的 保护码!
$RegGUI = GUICreate("【智能网维】注册机", 283, 157, @DesktopWidth/2-150,@DesktopHeight/2-150)
$Title = GUICtrlCreateLabel(" * * 注册机 ", 80, 4, 130, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$User = GUICtrlCreateLabel("用户名", 8, 28, 40, 17)
$RegUser = GUICtrlCreateInput("", 55, 25, 217, 21, BitOR($ES_CENTER, $ES_AUTOHSCROLL, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
GUICtrlSetLimit(-1, 15);设置输入框的做大字数
GUICtrlSetBkColor(-1, 0xECE9D8)
$MacKey = GUICtrlCreateLabel("机器码", 8, 58, 40, 17)
$HdKey = GUICtrlCreateInput("", 55, 55, 217, 21, BitOR($ES_CENTER, $ES_AUTOHSCROLL, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
GUICtrlSetLimit(-1, 32);设置输入框的做大字数
GUICtrlSetBkColor(-1, 0xECE9D8)
$RegSn = GUICtrlCreateLabel("注册码", 8, 88, 40, 17)
$RegKey = GUICtrlCreateInput("", 55, 85, 217, 21, BitOR($ES_CENTER, $ES_READONLY, $WS_BORDER, $WS_CLIPSIBLINGS), $WS_EX_STATICEDGE)
;~ GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetLimit(-1, 32);设置输入框的做大字数
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetBkColor(-1, 0xECE9D8)
$BtnOK = GUICtrlCreateButton("取注册码", 104, 120, 75, 25)
GUISetState(@SW_SHOW)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BtnOK
			If GUICtrlRead($HdKey) = "" Or GUICtrlRead($RegUser) = "" Then ;判断输入框$HdKey 或者 $RegUser 是否为空 
				MsgBox(0, "警告", "用户名和机器码都不能为空")
			Else
				_CdKey()
				GUICtrlSetData($RegKey, $Cdkey, "") ;给输入框$RegKey 写入内容$Cdkey
				IniWrite("注册用户.ini", "注册", GUICtrlRead($RegUser), ' ' & GUICtrlRead($HdKey) & ' = ' & $Cdkey)
				ClipPut($Cdkey) ;把指定控件($Cdkey)中的内容发送到剪切板中,
				MsgBox(0, "提示:", " 已经将注册码发送到剪切板 " & @CR & " 可以直接粘贴注册码! ",3)
			EndIf
	EndSwitch
WEnd
;上面的完全只是注册机的界面部分 真正让注册机有用的是下面的部分
Func _CdKey() ;加密的关键部分 这里是用MD5加密  整个注册机的关键部分就是这里, 如果要自己写加密算法 那就复杂了
	$Cdkey = StringMid(_MD5(GUICtrlRead($hdKey) & GUICtrlRead($RegUser) & $KeyPw), 3, 34) ;MD5加密 没事可以试着破解一下@!!!!!
	;StringMid用来取字节中的部分字符 ,GUICtrlRead读取控件中的内容,
	Return $Cdkey
EndFunc   ;==>_CdKey