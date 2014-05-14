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

;根据属性查找元素对象，支持所有元素属性
;_IEQuery(IE对象,标签名,属性列表,匹配模式=1,标志 = true)
 
;多个属性用逗号分隔，可使用双引号括起属性
;成功 如果标志为true 返回找到的第一个元素对象，false返回元素数组，$Eles[0]为找到元素数量
;失败返回0，并设置@error值
;~ @error:
;~ 1 - 无效数据类型
;~ 2 - 找不到元素
 
#include <WindowsConstants.au3>
#include "IEEX.au3"
Opt("GUIResizeMode",1)
Global $oIE = _IECreateEmbedded()
$gui = GUICreate("测试", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://www.baidu.com/")
 GUISetState() ;显示窗口
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;测试
Local $Ele = _IEQuery($oIE,"INPUT",'id="kw1"')
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"INPUT",'value="百度一下"')
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"A",'outerText="设为主页"',2) ;部分匹配，默认是1完全匹配
MsgBox(64,"html",$Ele.outerhtml)
$Ele = _IEQuery($oIE,"A",'outerText="hao\d+"',3) ;正则匹配
MsgBox(64,"html",$Ele.outerhtml)
 
;返回所有文本有"百度"的连接
$Eles = _IEQuery($oIE,"A",'outerText="百度"',2,False) ;最后一个参数false返回找到所有元素数组
;~ $Eles[0] 数组元素个数，其它为元素
For $i = 1 To $Eles[0]
        MsgBox(64,"html",$Eles[$i].outerhtml)
Next
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536  ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc
