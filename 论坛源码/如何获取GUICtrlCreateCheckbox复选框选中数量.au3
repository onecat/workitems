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

;~ #include <GUIConstantsEx.au3>
;~ #include <WindowsConstants.au3>

;~ GUICreate("Form1", 600, 450)
;~ $Checkbox1 = GUICtrlCreateCheckbox("复选框 - 1", 40, 30, 97, 17)
;~ $Checkbox2 = GUICtrlCreateCheckbox("复选框 - 2", 160, 30, 97, 17)
;~ $Checkbox3 = GUICtrlCreateCheckbox("复选框 - 3", 280, 30, 97, 17)
;~ $Checkbox4 = GUICtrlCreateCheckbox("复选框 - 4", 400, 30, 97, 17)
;~ $Checkbox5 = GUICtrlCreateCheckbox("复选框 - 5", 40, 80, 97, 17)
;~ $Checkbox6 = GUICtrlCreateCheckbox("复选框 - 6", 160, 80, 97, 17)
;~ $Checkbox7 = GUICtrlCreateCheckbox("复选框 - 7", 280, 80, 97, 17)
;~ $Checkbox8 = GUICtrlCreateCheckbox("复选框 - 8", 400, 80, 97, 17)
;~ $Checkbox9 = GUICtrlCreateCheckbox("复选框 - 9", 40, 130, 97, 17)
;~ $Checkbox10 = GUICtrlCreateCheckbox("复选框 - 10", 160, 130, 97, 17)
;~ $Checkbox11 = GUICtrlCreateCheckbox("复选框 - 11", 280, 130, 97, 17)
;~ $Checkbox12 = GUICtrlCreateCheckbox("复选框 - 12", 400, 130, 97, 17)
;~ GUISetState()

;~ While 1
;~         $nMsg = GUIGetMsg()
;~         Switch $nMsg
;~                 Case - 3
;~                         Exit
;~                 Case $Checkbox1 To $Checkbox12
;~                         $nText = ''
;~                         For $i = $Checkbox1 To $Checkbox12
;~                                 If BitAND(GUICtrlRead($i), $GUI_CHECKED) Then $nText &= '复选框 - ' & $i - 2 & ' 被勾选' & @CRLF
;~                         Next
;~                         MsgBox(0, '被选项目', $nText)
;~         EndSwitch
;~ WEnd


GUICreate("Form1", 600, 450)
$Checkbox1 = GUICtrlCreateCheckbox("复选框 - 1", 40, 30, 97, 17)
$Checkbox2 = GUICtrlCreateCheckbox("复选框 - 2", 160, 30, 97, 17)
$Checkbox3 = GUICtrlCreateCheckbox("复选框 - 3", 280, 30, 97, 17)
$Checkbox4 = GUICtrlCreateCheckbox("复选框 - 4", 400, 30, 97, 17)
$Checkbox5 = GUICtrlCreateCheckbox("复选框 - 5", 40, 80, 97, 17)
$Checkbox6 = GUICtrlCreateCheckbox("复选框 - 6", 160, 80, 97, 17)
$Checkbox7 = GUICtrlCreateCheckbox("复选框 - 7", 280, 80, 97, 17)
$Checkbox8 = GUICtrlCreateCheckbox("复选框 - 8", 400, 80, 97, 17)
$Checkbox9 = GUICtrlCreateCheckbox("复选框 - 9", 40, 130, 97, 17)
$Checkbox10 = GUICtrlCreateCheckbox("复选框 - 10", 160, 130, 97, 17)
$Checkbox11 = GUICtrlCreateCheckbox("复选框 - 11", 280, 130, 97, 17)
$Checkbox12 = GUICtrlCreateCheckbox("复选框 - 12", 400, 130, 97, 17)

$b = GUICtrlCreateButton('检测数量', 130, 200, 150, 25)
GUISetState()
$sl = 0
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
                Case $Checkbox1 To $Checkbox12
                        If GUICtrlRead($nMsg) = 1 Then $sl += 1
                        If GUICtrlRead($nMsg) = 4 Then $sl -= 1
                Case $b
                        MsgBox(0, 0, $sl)
        EndSwitch
WEnd