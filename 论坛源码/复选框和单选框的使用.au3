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

#include <GUIConstantsEx.au3>
 
Example()
 
Func Example()
  Local $msg, $checkbox[3], $radio[5]
  GUICreate("My GUI Checkbox") ; 创建一个对话框，并居中显示
 
  $checkbox[0] = GUICtrlCreateCheckbox("CHECKBOX 1", 10, 10, 120, 20)
  For $i = 0 To 4
    $radio[$i] = GUICtrlCreateRadio('radio', 10, ($i + 2) * 20, 130.20)
    GUICtrlSetState(-1, $gui_disable)
  Next
        ;       $checkbox[1] = GUICtrlCreateCheckbox("CHECKBOX 1", 10, 90, 120, 20)
        ;       $checkbox[2] = GUICtrlCreateCheckbox("CHECKBOX 1", 10,120, 120, 20)
 
    GUISetState() ; 显示有复选框(Checkbox)控件的对话框
 
    ; 运行界面,直到窗口被关闭
    While 1
       $msg = GUIGetMsg()
       If $msg = $checkbox[0] Then
        For $i = 0 To 4
         ; GUICtrlSetState($radio[$i], BitShift(GUICtrlRead($checkbox[0]), -5) * (BitAND(GUICtrlRead($checkbox[0]), 1) + 1))
         ; GUICtrlSetState($radio[$i], BitShift(BitShift(GUICtrlRead($checkbox[0]), -5), - BitAND(GUICtrlRead($checkbox[0]), 1)))
          GUICtrlSetState($radio[$i], BitShift(GUICtrlRead($checkbox[0]), -5 - BitAND(GUICtrlRead($checkbox[0]), 1)))
        Next
      EndIf
      If $msg = $GUI_EVENT_CLOSE Then ExitLoop
   WEnd
EndFunc   ;==>Example