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


#NoTrayIcon
 
#Region ;**** 参数创建于 ACNWrapper_GUI ****
 
#AutoIt3Wrapper_outfile=虫子樱桃实用查询工具.exe
 
#AutoIt3Wrapper_Res_Comment=本软件搜索功能归雨林木风的115工具箱所有！
 
#AutoIt3Wrapper_Res_Description=虫子樱桃实用查询工具
 
#AutoIt3Wrapper_Res_LegalCopyright=虫子樱桃
 
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
 
#include <GUIConstants.au3>
 
#include <ButtonConstants.au3>
 
#include <ComboConstants.au3>
 
#include <GUIConstantsEx.au3>
 
#include <StaticConstants.au3>
 
#include <WindowsConstants.au3>
 
#include <IE.au3>
 
Dim $mainwindow,$Dll,$Combo1,$Label2,$Label3,$Button1,$Button2,$xz,$url,$oIE,$ie,$GUIActiveX,$GUI_Button_Forward,$GUI_Button_Home,$GUI_Button_Stop
 
$mainwindow=GUICreate("虫子樱桃实用查询工具", 392, 135, 193, 125)
 
FileInstall("c:\SkinCrafterDll.dll",@TempDir&"\")
 
FileInstall("c:\vista.skf",@TempDir&"\")
 
_SkinGUI(@TempDir&"\SkinCrafterDll.dll", @TempDir&"\Vista.skf", $mainwindow)
 
Func _SkinGUI($SkincrafterDll, $SkincrafterSkin, $Handle)
 
   $Dll = DllOpen($SkincrafterDll)
 
   DllCall($Dll, "int:cdecl", "InitLicenKeys", "wstr", "1", "wstr", "", "wstr", "1@1.com", "wstr", "1")
 
   DllCall($Dll, "int:cdecl", "InitDecoration", "int", 1)
 
   DllCall($Dll, "int:cdecl", "LoadSkinFromFile", "wstr", $SkincrafterSkin)
 
   DllCall($Dll, "int:cdecl", "DecorateAs", "int", $Handle, "int", 25)
 
   DllCall($Dll, "int:cdecl", "ApplySkin")
 
EndFunc
 
Func Quit()
 
    GUISetState(@SW_HIDE)
 
    DllCall($dll, "int:cdecl", "DeInitDecoration")
 
    DllCall($dll, "int:cdecl", "RemoveSkin")
 
    DllClose($dll)
 
    ;DirRemove(@AppDataDir&"\skin",1)
 
    Exit
 
EndFunc
 
$Combo1 = GUICtrlCreateCombo("--请选择您要查询的类型--", 16, 32, 161, 25)
 
GUICtrlSetData(-1, "网速测试工具|手机归属地查询|身份证号码查询|网站IP查询|城市邮编查询|车牌号码查询|网站综合查询")
 
GUICtrlCreateGroup("说明", 192, 8, 185, 105)
 
$Label2 = GUICtrlCreateLabel("本工具集成网速测试工具|手机归属地查询|身份证号码查询|网站IP查询|城市邮编查询|车牌号码查询|网站综合查询这七种实用功能。本工具仅供技术交流，请勿用作他途！", 200, 24, 175, 80)
 
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateLabel("请选择您要查询的类型", 16, 16, 124, 17)
 
$Label3 = GUICtrlCreateLabel("思远技术论坛 虫子樱桃 出品", 17, 99, 170, 17)
 
$Button1 = GUICtrlCreateButton("开始查询", 16, 64, 75, 25, 0)
 
$Button2 = GUICtrlCreateButton("退出", 104, 64, 75, 25, 0)
 
GUISetState(@SW_SHOW)
 
While 1
 
$nMsg = GUIGetMsg()
 
Switch $nMsg
 
Case $GUI_EVENT_CLOSE
 
FileDelete(@TempDir&"\SkinCrafterDll.dll")
 
   FileDelete(@TempDir&"\Vista.skf")
 
   Quit()
 
   Exit
 
  Case $Button1
 
   GUISetState(@SW_HIDE)
 
   $xz=GUICtrlRead($Combo1)
 
   Select
 
    Case $xz="网速测试工具"
 
     $url="http://tool.115.com/live/speed"
 
    Case $xz="手机归属地查询"
 
     $sj=InputBox("虫子樱桃提示您","请输入您要查询的手机号码")
 
     $url="http://tool.115.com/shouji/"&$sj
 
    Case $xz="身份证号码查询"
 
     $sfz=InputBox("虫子樱桃提示您","请输入您要查询的身份证号码")
 
     $url="http://tool.115.com/live/idcard/q/"&$sfz
 
    Case $xz="网站IP查询"
 
     $ip=InputBox("虫子樱桃提示您","请输入您要查询的网站")
 
     $url="http://tool.115.com/ip/"&$ip
 
    Case $xz="城市邮编查询"
 
     $cs=InputBox("虫子樱桃提示您","请输入您要查询邮编的城市")
 
     $url="http://tool.115.com/youbian/"&$cs
 
    Case $xz="车牌号码查询"
 
     $cp=InputBox("虫子樱桃提示您","请输入您要查询车牌号码")
 
     $url="http://tool.115.com/live/chepai/q/"&$cp
 
    Case $xz="网站综合查询"
 
     $wz=InputBox("虫子樱桃提示您","请输入您要查询的网站")
 
     $url="http://tool.115.com/siteall/"&$wz
 
   EndSelect
 
_IEErrorHandlerRegister ()
 
$oIE = _IECreateEmbedded ()
 
$ie=GUICreate("虫子樱桃实用查询工具", 640, 500, (@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, $WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
 
$GUIActiveX = GUICtrlCreateObj($oIE, 10, 40, 600, 360)
 
$GUI_Button_Forward = GUICtrlCreateButton("作者的博客", 120, 420, 100, 30)
 
$GUI_Button_Home = GUICtrlCreateButton("思远论坛", 230, 420, 100, 30)
 
$GUI_Button_Stop = GUICtrlCreateButton("返回", 340, 420, 100, 30)
 
GUISetState()    
_IENavigate ($oIE, $url)
 
While 1
 
$msg = GUIGetMsg()
 
Select
 
Case $msg = $GUI_EVENT_CLOSE
 
  Quit()
 
   ExitLoop
 
  Case $msg = $GUI_Button_Home
 
   _IENavigate ($oIE, "http://bbs.seeyoon.com")
 
  Case $msg = $GUI_Button_Forward
 
   _IENavigate ($oIE, "http://blog.sina.com.cn/leojayfan")
 
  Case $msg = $GUI_Button_Stop
 
   _IEQuit($oIE)
 
   Run(@ScriptFullPath)
 
    Quit()
 
   Exit
 
EndSelect
 
WEnd
 
  Case $Button2
 
   TrayTip("虫子樱桃提示您","谢谢您的使用，正在退出.....",1000)
 
   Sleep(1500)
 
   FileDelete(@TempDir&"\SkinCrafterDll.dll")
 
   FileDelete(@TempDir&"\Vista.skf")
 
   Quit()
 
   Exit
 
EndSwitch
 
WEnd