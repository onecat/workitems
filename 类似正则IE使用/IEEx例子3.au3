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

;保存图片，一般用于验证码图片保存
;~ _IESaveImg("窗口标题或句柄","IE对象","图片元素对象","保存文件名","标志 = 1") 
;~ 标志 = 1 默认，后台截图
;~ 标志 = 2 前台截图，会激活窗口
 
;~ 成功返回1,失败返回0并设置@error的值
;~ @error:
;~ @error: 1 - 无效数据类型
;~ 2 - 无效对象类型
;~ 4 - 找不到控件句柄
;~ 5 - 复制失败
;~ 6 - 不是bmp格式数据
;~ 7 - 打开剪贴板失败
 
#include <WindowsConstants.au3>
#include <IEEX.au3>
Opt("GUIResizeMode",1)
 
Global $oIE = _IECreateEmbedded()
Global $hGui = GUICreate("测试", 700, 600, Default, Default, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX))
 GUICtrlCreateObj($oIE, 0, 0, 700, 600)
 _IENavigate($oIE,"http://search.pazx888.com/",0)
 GUISetState() ;显示窗口
GUIRegisterMsg($WM_SYSCOMMAND,"WM_SYSCOMMAND")
 
;保存验证码图片
 ;没有id,用_IEWaitquery查找验证码
 
Local $img = _IEWaitQuery($oIE,"img","title=看不清楚?点击刷新")
_IESaveImg($hGui,$oIE,$img,"code.bmp") ;后台截图
If @error Then ;后台失败改前台截图
        _IESaveImg($hGui,$oIE,$img,"code.bmp",2)
EndIf
ShellExecute("code.bmp") ;打开图片看看
 
While 1
        Sleep(100)
WEnd
 
Func WM_SYSCOMMAND($hWnd, $sMsg, $sWParam, $slParam)
        Switch $sWParam
                Case 61536  ;$SC_CLOSE
                        Exit
        EndSwitch
EndFunc
