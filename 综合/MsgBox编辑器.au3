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
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Icon_Add=Resources\1.ico
#AutoIt3Wrapper_Res_Icon_Add=Resources\2.ico
#AutoIt3Wrapper_Res_Icon_Add=Resources\3.ico
#AutoIt3Wrapper_Res_Icon_Add=Resources\4.ico
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
 
#include <GUIComboBox.au3>
#include <GuiComboBoxEx.au3>
#include <GuiImageList.au3>
 
Global Const $MB_USERICON = 128
Global Const $MB_ICONASTERISK = 64
Global Const $MB_ICONEXCLAMATION = 0x30
Global Const $MB_ICONWARNING = 0x30
Global Const $MB_ICONERROR = 16
Global Const $MB_ICONHAND = 16
Global Const $MB_ICONQUESTION = 32
Global Const $MB_OK = 0
Global Const $MB_ABORTRETRYIGNORE = 2
Global Const $MB_APPLMODAL = 0
Global Const $MB_DEFAULT_DESKTOP_ONLY = 0x20000
Global Const $MB_HELP = 0x4000
Global Const $MB_RIGHT = 0x80000
Global Const $MB_RTLREADING = 0x100000
Global Const $MB_TOPMOST = 0x40000
Global Const $MB_DEFBUTTON1 = 0
Global Const $MB_DEFBUTTON2 = 256
Global Const $MB_DEFBUTTON3 = 512
Global Const $MB_DEFBUTTON4 = 0x300
Global Const $MB_ICONINFORMATION = 64
Global Const $MB_ICONSTOP = 16
Global Const $MB_OKCANCEL = 1
Global Const $MB_RETRYCANCEL = 5
Global Const $MB_SERVICE_NOTIFICATION = 0x00200000
Global Const $MB_SERVICE_NOTIFICATION_NT3X = 0x00040000
Global Const $MB_SETFOREGROUND = 0x10000
Global Const $MB_SYSTEMMODAL = 4096
Global Const $MB_TASKMODAL = 0x2000
Global Const $MB_YESNO = 4
Global Const $MB_YESNOCANCEL = 3
Global Const $MB_ICONMASK = 240
Global Const $MB_DEFMASK = 3840
Global Const $MB_MODEMASK = 0x00003000
Global Const $MB_MISCMASK = 0x0000C000
Global Const $MB_NOFOCUS = 0x00008000
Global Const $MB_TYPEMASK = 15
Global Const $MB_CANCELTRYCONTINUE = 6
 
Global Const $IDOK = 1
Global Const $IDCANCEL = 2
Global Const $IDABORT = 3
Global Const $IDRETRY = 4
Global Const $IDIGNORE = 5
Global Const $IDYES = 6
Global Const $IDNO = 7
Global Const $IDCLOSE = 8
Global Const $IDHELP = 9
Global Const $IDTRYAGAIN = 10
Global Const $IDCONTINUE = 11
 
Global $hGui, $sCaption, $sText, $iType
Global $hCodeGui, $hCode, $hClose = 1.5, $hCopy = 1.6, $sCode
 
$hGui = GUICreate("AU3 MsgBox Editor", 420, 310, -1, -1, 0x96C80000, 0x00010101)
GUICtrlCreateLabel("标题：", 10, 12, 40)
$hCaption = GUICtrlCreateInput("AU3 MsgBox", 48, 8, 272)
GUICtrlCreateLabel("信息：", 10, 37, 40)
$hText = GUICtrlCreateEdit("", 48, 33, 272, 80, 0x50211044, 0x00000200)
 
$hTopMost = GUICtrlCreateCheckbox("MsgBox置顶", 329, 8, 100, 20)
$hTest = GUICtrlCreateButton("测试MsgBox", 327, 35, 83, 26, 0x0001)
$hView = GUICtrlCreateButton("查看代码", 327, 61, 83, 26)
$hExit = GUICtrlCreateButton("退出", 327, 87, 83, 26)
 
GUICtrlCreateGroup("添加 MsgBox 按钮", 10, 118, 180, 185)
$hOk = GUICtrlCreateRadio("确定", 20, 135, 130, 20)
GUICtrlSetState(-1, 1)
$hOkCancel = GUICtrlCreateRadio("确定 和 取消", 20, 155, 130, 20)
$hYesNoCancel = GUICtrlCreateRadio("是，否，取消", 20, 175, 130, 20)
$hYesNo = GUICtrlCreateRadio("是 和 否", 20, 195, 130, 20)
$hRetryCancel = GUICtrlCreateRadio("重试 和 取消", 20, 215, 130, 20)
$hAbortRetryIgnore = GUICtrlCreateRadio("终止，重试，忽略", 20, 235, 130, 20)
$hCancelTryContinue = GUICtrlCreateRadio("取消，重试，继续", 20, 255, 130, 20)
$hHelp = GUICtrlCreateCheckbox("添加帮助按钮", 20, 275, 130, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
 
GUICtrlCreateLabel("图标选择：", 200, 129, 60)
$hIcon = _GUICtrlComboBoxEx_Create($hGui, "", 260, 125, 150, 150, 0x0003)
$hImage = _GUIImageList_Create(16, 16, 5, 3)
If @Compiled Then
        _GUIImageList_AddIcon($hImage, @ScriptFullPath, 4)
        _GUIImageList_AddIcon($hImage, @ScriptFullPath, 5)
        _GUIImageList_AddIcon($hImage, @ScriptFullPath, 6)
        _GUIImageList_AddIcon($hImage, @ScriptFullPath, 7)
Else
        _GUIImageList_AddIcon($hImage, @ScriptDir & "\Resources\1.ico")
        _GUIImageList_AddIcon($hImage, @ScriptDir & "\Resources\2.ico")
        _GUIImageList_AddIcon($hImage, @ScriptDir & "\Resources\3.ico")
        _GUIImageList_AddIcon($hImage, @ScriptDir & "\Resources\4.ico")
EndIf
_GUICtrlComboBoxEx_SetImageList($hIcon, $hImage)
_GUICtrlComboBoxEx_BeginUpdate($hIcon)
_GUICtrlComboBoxEx_AddString($hIcon, "无图标")
_GUICtrlComboBoxEx_AddString($hIcon, "错误/警告", 0, 0, 0)
_GUICtrlComboBoxEx_AddString($hIcon, "询问", 1, 1, 1)
_GUICtrlComboBoxEx_AddString($hIcon, "惊叹", 2, 2, 2)
_GUICtrlComboBoxEx_AddString($hIcon, "信息", 3, 3, 3)
_GUICtrlComboBoxEx_EndUpdate($hIcon)
ControlCommand($hGui, "", $hIcon, "SetCurrentSelection", 0)
 
GUICtrlCreateLabel("默认按钮：", 200, 154, 60)
$hDefaultBtn = GUICtrlCreateCombo("", 260, 150, 150, 20, 0x0003)
GUICtrlSetData(-1, "第一个按钮|第二个按钮|第三个按钮|第四个按钮", "第一个按钮")
 
GUICtrlCreateLabel("显示模式：", 200, 179, 60)
$hModal = GUICtrlCreateCombo("", 260, 175, 150, 20, 0x0003)
GUICtrlSetData(-1, "应用程序模式|系统模式|任务模式", "应用程序模式")
 
GUICtrlCreateLabel("超时时间：", 200, 204, 60)
$hTime = GUICtrlCreateInput("0", 260, 200, 150, 20, 0x2000)
 
GUICtrlCreateLabel("所属窗口：", 200, 229, 60)
$hParent = GUICtrlCreateInput("", 260, 225, 150, 20)
GUICtrlSetTip(-1, "输入MsgBox所属窗口的标题，不需要则留空")
 
$hCase = GUICtrlCreateCheckbox("生成Switch Case样式代码", 200, 250, 180, 20)
GUICtrlSetState(-1, 1)
 
$hRight = GUICtrlCreateCheckbox("标题文字及消息内容向右对齐", 200, 275, 180, 20)
 
GUISetState(@SW_SHOW, $hGui)
 
While 1
        $aMsg = GUIGetMsg(1)
        Switch $aMsg[0]
                Case -3
                        If $aMsg[1] = $hGui Then
                                ExitLoop
                        Else
                                GUIDelete($aMsg[1])
                                $hCodeGui = ""
                                $hClose = 1.5
                        EndIf
                Case $hExit
                        ExitLoop
                Case $hClose
                        GUIDelete($aMsg[1])
                        $hCodeGui = ""
                        $hClose = 1.5
                Case $hCopy
                        ClipPut(GUICtrlRead($hCode))
                        WinClose($hCodeGui)
                Case $hTest
                        Compile(True)
                Case $hView
                        ViewCode()
        EndSwitch
WEnd
 
Func SetModal();消息框模式
        Switch _GUICtrlComboBox_GetCurSel($hModal)
                Case 0
                        $iType += $MB_APPLMODAL
                Case 1
                        $iType += $MB_SYSTEMMODAL
                Case 2
                        $iType += $MB_TASKMODAL
        EndSwitch
EndFunc   ;==>SetModal
 
Func SetDeFaultBtn();消息框默认按钮
        Switch _GUICtrlComboBox_GetCurSel($hDefaultBtn)
                Case 0
                        $iType += $MB_DEFBUTTON1
                Case 1
                        $iType += $MB_DEFBUTTON2
                Case 2
                        $iType += $MB_DEFBUTTON3
                Case 3
                        $iType += $MB_DEFBUTTON4
        EndSwitch
EndFunc   ;==>SetDeFaultBtn
 
Func SetIconType();消息框图标
        Switch _GUICtrlComboBoxEx_GetCurSel($hIcon)
                Case 0;无图标
                        $iType += 0
                Case 1;警告/错误
                        $iType += $MB_ICONERROR
                Case 2;询问
                        $iType += $MB_ICONQUESTION
                Case 3;惊叹
                        $iType += $MB_ICONWARNING
                Case 4;信息
                        $iType += $MB_ICONINFORMATION
        EndSwitch
EndFunc   ;==>SetIconType
 
Func SetBtnType();消息框按钮
        If BitAND(GUICtrlRead($hOk), 1) = 1 Then
                $iType += $MB_OK
                $sCode = "    Case " & $IDOK & @CRLF
        ElseIf BitAND(GUICtrlRead($hOkCancel), 1) = 1 Then
                $iType += $MB_OKCANCEL
                $sCode = "    Case " & $IDOK & @CRLF & _
                                "    Case " & $IDCANCEL & @CRLF
        ElseIf BitAND(GUICtrlRead($hYesNoCancel), 1) = 1 Then
                $iType += $MB_YESNOCANCEL
                $sCode = "    Case " & $IDYES & @CRLF & _
                                "    Case " & $IDNO & @CRLF & _
                                "    Case " & $IDCANCEL & @CRLF
        ElseIf BitAND(GUICtrlRead($hYesNo), 1) = 1 Then
                $iType += $MB_YESNO
                $sCode = "    Case " & $IDYES & @CRLF & _
                                "    Case " & $IDNO & @CRLF
        ElseIf BitAND(GUICtrlRead($hRetryCancel), 1) = 1 Then
                $iType += $MB_RETRYCANCEL
                $sCode = "    Case " & $IDRETRY & @CRLF & _
                                "    Case " & $IDCANCEL & @CRLF
        ElseIf BitAND(GUICtrlRead($hAbortRetryIgnore), 1) = 1 Then
                $iType += $MB_ABORTRETRYIGNORE
                $sCode = "    Case " & $IDABORT & @CRLF & _
                                "    Case " & $IDRETRY & @CRLF & _
                                "    Case " & $IDIGNORE & @CRLF
        ElseIf BitAND(GUICtrlRead($hCancelTryContinue), 1) = 1 Then
                $iType += $MB_CANCELTRYCONTINUE
                $sCode = "    Case " & $IDYES & @CRLF & _
                                "    Case " & $IDTRYAGAIN & @CRLF & _
                                "    Case " & $IDCONTINUE & @CRLF
        EndIf
        If BitAND(GUICtrlRead($hHelp), 1) = 1 Then
                $iType += $MB_HELP
                $sCode &= "    Case " & $IDHELP & @CRLF
        EndIf
EndFunc   ;==>SetBtnType
 
Func ViewCode();显示代码
        Compile()
        $hCodeGui = GUICreate("MsgBox Code预览", 380, 225, 20, 1, 0x96C80000, 0x00010141, $hGui)
        $hCode = GUICtrlCreateEdit($sCode, 10, 10, 360, 180, 0x50211044, 0x00000200)
        $hCopy = GUICtrlCreateButton("复制到剪贴板", 210, 195, 80, 25)
        $hClose = GUICtrlCreateButton("关闭", 290, 195, 80, 25)
        GUISetState(@SW_SHOW, $hCodeGui)
EndFunc   ;==>ViewCode
 
Func Compile($bFlag = False)
        $iType = 0
        $sCaption = GUICtrlRead($hCaption)
        $sText = GUICtrlRead($hText)
        If BitAND(GUICtrlRead($hTopMost), 1) = 1 Then $iType += $MB_TOPMOST
        If BitAND(GUICtrlRead($hRight), 1) = 1 Then $iType += $MB_RIGHT
        SetBtnType()
        SetIconType()
        SetDeFaultBtn()
        SetModal()
        If GUICtrlRead($hParent) = "" Then
                If $bFlag Then
                        MsgBox($iType, $sCaption, $sText, Int(GUICtrlRead($hTime)))
                Else
                        If BitAND(GUICtrlRead($hCase), 1) = 1 Then
                                $sCode = 'Switch MsgBox(' & $iType & ', "' & $sCaption & '", _' & @CRLF _
                                                 & '                 "' & $sText & '", _' & @CRLF _
                                                 & '                 ' & Int(GUICtrlRead($hTime)) & ')' & @CRLF & _
                                                $sCode & @CRLF & _
                                                'EndSwitch'
                        Else
                                $sCode = 'Dim $iResult' & @CRLF & _
                                                '$iResult = MsgBox(' & $iType & ', "' & $sCaption & '", _' & @CRLF _
                                                 & '                 "' & $sText & '", _' & @CRLF _
                                                 & '                 ' & Int(GUICtrlRead($hTime)) & ')' & @CRLF
                        EndIf
                EndIf
        Else
                If $bFlag Then
                        MsgBox($iType, $sCaption, $sText, Int(GUICtrlRead($hTime)), WinGetHandle(GUICtrlRead($hParent)))
                Else
                        If BitAND(GUICtrlRead($hCase), 1) = 1 Then
                                $sCode = 'Switch MsgBox(' & $iType & ', "' & $sCaption & '", _' & @CRLF _
                                                 & '                 "' & $sText & '", _' & @CRLF _
                                                 & '                 ' & Int(GUICtrlRead($hTime)) & ', WinGetHandle("' & GUICtrlRead($hParent) & '"))' & @CRLF & _
                                                $sCode & @CRLF & _
                                                'EndSwitch'
                        Else
                                $sCode = 'Dim $iResult' & @CRLF & _
                                                '$iResult = MsgBox(' & $iType & ', "' & $sCaption & '", _' & @CRLF _
                                                 & '                 "' & $sText & '", _' & @CRLF _
                                                 & '                 ' & Int(GUICtrlRead($hTime)) & ', WinGetHandle("' & GUICtrlRead($hParent) & '"))' & @CRLF
                        EndIf
                EndIf
        EndIf
EndFunc