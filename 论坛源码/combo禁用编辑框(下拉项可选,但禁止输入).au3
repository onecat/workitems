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

#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
Global $Debug_CB
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>
#include <Guiedit.au3>
 
Opt('MustDeclareVars', 1)
 
$Debug_CB = False
 
_Main()
 
Func _Main()
        Local $tInfo, $hCombo, $hEdit
 
        ; Create GUI
        GUICreate("ComboBox Get ComboBox Info", 400, 296)
        $hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
        GUISetState()
 
        ; Add files
        _GUICtrlComboBox_BeginUpdate($hCombo)
        _GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
        _GUICtrlComboBox_EndUpdate($hCombo)
 
        If _GUICtrlComboBox_GetComboBoxInfo($hCombo, $tInfo) Then
                $hEdit = DllStructGetData($tInfo, "hEdit")
                _GUICtrlEdit_SetReadOnly($hEdit, True)
        EndIf
 
        ; Loop until user exits
        Do
        Until GUIGetMsg() = $GUI_EVENT_CLOSE
        GUIDelete()
EndFunc   ;==>_Main