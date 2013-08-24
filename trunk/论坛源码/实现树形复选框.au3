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

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=stc2.kxf
$Form1 = GUICreate("STC Conformance Automation", 326, 406, 222, 124)
$MenuItem1 = GUICtrlCreateMenu("File")
$MenuItem2 = GUICtrlCreateMenu("Action")
$MenuItem3 = GUICtrlCreateMenu("About")
$Group1 = GUICtrlCreateGroup("Action", 16, 8, 297, 377)
$Button1 = GUICtrlCreateButton("ConfigureIUT", 112, 32, 81, 25)
$Button2 = GUICtrlCreateButton("Setup", 24, 32, 73, 25)
$Button3 = GUICtrlCreateButton("StartTest", 216, 32, 73, 25)
$Group2 = GUICtrlCreateGroup("Select Feature(s)", 24, 64, 273, 313)
$TreeView1 = GUICtrlCreateTreeView(40, 88, 241, 289, BitOR($GUI_SS_DEFAULT_TREEVIEW,$TVS_CHECKBOXES))
GUICtrlSetBkColor(-1, 0xFFFFFF)
$TreeView1_0 = GUICtrlCreateTreeViewItem("IP Multicast", $TreeView1)
$TreeView1_1 = GUICtrlCreateTreeViewItem("IGMPV2", $TreeView1_0)
$TreeView1_2 = GUICtrlCreateTreeViewItem("IGMPV3", $TreeView1_0)
$TreeView1_3 = GUICtrlCreateTreeViewItem("IGMPSNOOPING", $TreeView1_0)
$TreeView1_4 = GUICtrlCreateTreeViewItem("MLDSNOOPING", $TreeView1_0)
$TreeView1_5 = GUICtrlCreateTreeViewItem("MLDV2", $TreeView1_0)
$TreeView1_6 = GUICtrlCreateTreeViewItem("MLDV1", $TreeView1_0)
$TreeView1_7 = GUICtrlCreateTreeViewItem("MSDP", $TreeView1_0)
$TreeView1_8 = GUICtrlCreateTreeViewItem("PIM", $TreeView1_0)
$TreeView1_9 = GUICtrlCreateTreeViewItem("Broadband Access", $TreeView1)
$TreeView1_10 = GUICtrlCreateTreeViewItem("IPv4 and IPv6 Routing", $TreeView1)
$TreeView1_11 = GUICtrlCreateTreeViewItem("Bridging", $TreeView1)
$TreeView1_12 = GUICtrlCreateTreeViewItem("Data Center", $TreeView1)
$TreeView1_13 = GUICtrlCreateTreeViewItem("Metro and Copper Ethernet", $TreeView1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
WEnd