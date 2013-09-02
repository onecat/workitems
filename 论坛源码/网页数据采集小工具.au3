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
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <IE.au3>

Dim $oIE,$oIE_MHTL

_IEErrorHandlerRegister()

Local $oIE = _IECreateEmbedded()
$Form1 = GUICreate("网站指定数据采集工具", 623, 548)
;~ $Group1 = GUICtrlCreateGroup("Group1", 0, 0, 621, 217)
$ieGUI = GUICtrlCreateObj($oIE, 1, 0, 621, 217)
$Edit1 = GUICtrlCreateEdit("", 0, 221, 620, 230)
$Input1 = GUICtrlCreateInput("", 0, 456, 505, 21)
$Button1 = GUICtrlCreateButton("转到", 512, 456, 33, 21)
$Button2 = GUICtrlCreateButton("停止", 548, 456, 33, 21)
$Button3 = GUICtrlCreateButton("刷新", 584, 456, 33, 21)
$Label1 = GUICtrlCreateLabel("正则代码：", 8, 490, 64, 17)
$Combo1 = GUICtrlCreateCombo("", 72, 488, 433, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,"href='(http://.*?)' title=|href="&'"'&"(http://.*?)"&'"'&" target=")
$Button4 = GUICtrlCreateButton("测试", 512, 488, 33, 21)
$Input2 = GUICtrlCreateInput("", 72, 520, 193, 21)
$Label2 = GUICtrlCreateLabel("文件名称：", 8, 522, 64, 17)
$Label3 = GUICtrlCreateLabel("数组数值：", 304, 522, 64, 17)
$Input3 = GUICtrlCreateInput("", 368, 520, 137, 21)
$Button5 = GUICtrlCreateButton("输出(&Save)", 548, 488, 69, 21)
$Button6 = GUICtrlCreateButton("输出(&Down）", 512, 520, 105, 21)
Dim $Form1_AccelTable[2][2] = [["{enter}", $Button1],["^{enter}", $Button6]]
GUISetAccelerators($Form1_AccelTable)
GUISetState(@SW_SHOW)
_IENavigate($oIE, "about:blank")

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        GUICtrlSetData($Edit1,"")
                        _IENavigate($oIE,GUICtrlRead($Input1))
                        $oIE_MHTL = _IEDocReadHTML ($oIE)
                        GUICtrlSetPos ($ieGUI, 1, 0, 621, 217)
                        GUICtrlSetData($Edit1,$oIE_MHTL)
                        $SaveName = StringSplit (GUICtrlRead($Input1),"/",1)
                        If StringInStr($SaveName[1], "http:") = 0 Then
                                GUICtrlSetData($Input2,$SaveName[1]&".txt")
                        Else
                                GUICtrlSetData($Input2,$SaveName[3]&".txt")
                        EndIf
                Case $Button2
                        _IEAction($oIE, "stop")
                Case $Button3
                        _IEAction($oIE, "refresh")
                Case $Button4
                        $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                        If Not @Error Then
                                _ArrayDisplay($url, UBound($url))
                        Else
                                MsgBox(0,"","表达式错误或无数据！")
                        EndIf
                Case $Button5
                        If GUICtrlRead($Input1) <> "" And GUICtrlRead($Input2) <> "" And GUICtrlRead($Combo1) <> "" Then
                                $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                                If Not @Error Then
                                        $i = 0
                                        $name = GUICtrlRead($Input2)
                                        If GUICtrlRead($Input3) = "" Then
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = UBound($url) -1
                                        Else
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = GUICtrlRead($Input3)
                                        EndIf
                                Else
                                        MsgBox(0,"","表达式错误或无数据！")
                                EndIf
                        Else
                                MsgBox(16,"错误","数据不能为空!!")
                        EndIf
                Case $Button6
                        If GUICtrlRead($Input1) <> "" And GUICtrlRead($Input2) <> "" And GUICtrlRead($Combo1) <> "" Then
                                $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                                If Not @Error Then
                                        $i = 0
                                        $name = GUICtrlRead($Input2)
                                        If GUICtrlRead($Input3) = "" Then
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = UBound($url) -1
                                                ;-------运行程序
                                        Else
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = GUICtrlRead($Input3)
                                                ;-------运行程序
                                        EndIf
                                Else
                                        MsgBox(0,"","表达式错误或无数据！")
                                EndIf
                        Else
                                MsgBox(16,"错误","数据不能为空!!")
                        EndIf
        EndSwitch
WEnd
