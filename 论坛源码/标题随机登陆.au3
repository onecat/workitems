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
#include <EditConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Local $aSndID
For $i = 1 To 8
        $aSndID &= Chr(Random(97, 122, 1));65, 90,大写
                
Next;------------->
$Form1 = GUICreate($aSndID, 216, 41, -1, -1)
$Input1 = GUICtrlCreateInput("", 8, 8, 121, 21)
$dl = GUICtrlCreateButton("登  入", 136, 8, 75, 25)
GUICtrlSetFont(-1, 14, 400, 0, "微软雅黑")
GUICtrlSetTip($dl, " ←←您要启动程序'"  & "'必须输入标题上显示的字母" & @CRLF & "才能启动.", "提示", "1", "1")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
#Region ### START Koda GUI section ### Form=
$Form2 = GUICreate("文本框", 356, 257, 192, 124)
$Edit1 = GUICtrlCreateEdit("",16, 8, 313, 233)
GUISetState(@SW_HIDE)
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
        Case $dl
                         $password = GUICtrlRead($Input1)
                          If $password <> BinaryToString($aSndID)  Then
                                        MsgBox(16, "错误！"& $aSndID, "↑--验证码不正确！" & @CRLF & "看清楚上面的字母了吗？")
                                                                        Else
                                                                                GUISetState(@SW_HIDE, $Form1)
                                                                                GUISetState(@SW_SHOW, $Form2)
                                        ExitLoop
                                                                                EndIf
        EndSwitch
WEnd
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
        EndSwitch
WEnd