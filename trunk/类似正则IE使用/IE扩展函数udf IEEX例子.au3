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
#include <WindowsConstants.au3>
#include "IEEX.au3"
Opt("GUIResizeMode", 1)
;修改用户名和密码
Global $username = ""
Global $password = ""
Global $oIE = _IECreateEmbedded()
Global $gui = GUICreate("测试", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
GUICtrlCreateObj($oIE, 0, 0, 700, 600)
_IENavigate($oIE, "http://www.autoitx.com/")
GUISetState() ;显示窗口
GUIRegisterMsg($WM_SYSCOMMAND, "WM_SYSCOMMAND")
 
;登录
Local $Ele = _IEQuery($oIE, "A", 'OuterText="登录"')
If IsObj($Ele) Then ; 没有对象已经登录
        _IEAction($Ele, "click")
        $Ele = _IEWaitEle($oIE, "username")
        $Ele.value = $username
        $Ele = _IEWaitEle($oIE, "password3")
        $Ele.value = $password
        $Ele = _IEWaitEle($oIE, "loginsubmit")
        _IEAction($Ele, "click")
EndIf
 
;搜索
$Ele = _IEWaitEle($oIE, "mn_search")
_IEAction($Ele, "click")
$Ele = _IEWaitEle($oIE, "srchtxt")
$Ele.value = "IEEX"
$Ele = _IEWaitEle($oIE,"searchsubmit")
_IEAction($Ele, "click") ;搜索
_IELoadWait($oIE,1000)
$Ele = _IEQuery($oIE,"A",'OuterText="IE扩展函数"',2) ;注意最后一个参数使用部分匹配
_IEAction($Ele, "click")
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536 ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc   ;==>WM_SYSCOMMAND

