#cs
这是一些可能用到的东西：
	.版本 2
	
	.子程序 读源码, 字节集
	.参数 地址, 文本型
	.局部变量 对象, 对象
	.局部变量 bp, 字节集
	
	.如果 (对象.创建 (“Microsoft.XMLHTTP”, ))
	对象.方法 (“open”, “GET”, 地址, 假)
	对象.方法 (“send”, )
	bp ＝ 对象.读属性 (“responseBody”, ).取字节集 ()
	返回 (bp)
	.否则
	返回 (到字节集 (“”))
	
	_INetGetSource ( $s_URL )
	不写入临时文件获取网址源代码.
	成功: 返回源代码.
	失败: 返回0并设置@ERROR为1
	
	ctrl+T整理代码
#ce
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <INet.au3>
#Region ### START Koda GUI section ### Form=C:\Users\ilv\Desktop\Form1.kxf
$Form1 = GUICreate("取网页源码 by ilv", 511, 305, 263, 121)
$Label1 = GUICtrlCreateLabel("网址:", 32, 35, 31, 17, $SS_LEFTNOWORDWRAP)
GUICtrlSetCursor(-1, 2)
$Input1 = GUICtrlCreateInput("http://www1.baidu.com/", 78, 31, 353, 21)
$Button1 = GUICtrlCreateButton("获取", 454, 31, 33, 25)
$List1 = GUICtrlCreateInput("", 24, 72, 465, 214, $ES_MULTILINE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $Button1
			$url = GUICtrlRead($Input1)
			If $url <> "" Then GUICtrlSetData($List1, GetSource())
			Sleep(300)
			MsgBox(64, "ok", "获取完成！", 1)
			
;~ 			GUICtrlSetData($Input1,"我是一个好人")
;~ 			Local $str=GUICtrlRead($Input1)

		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
Func GetSource()
	$oHTTP = ObjCreate("microsoft.xmlhttp")
	$oHTTP.Open("get", $url, False)
	$oHTTP.Send("")
	$return = $oHTTP.responsetext;BinaryToString($oHTTP.responseBody)
	Sleep(300)
	Return ($return)
EndFunc   ;==>GetSource

