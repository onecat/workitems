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

_MouseClickAdvanced("left", @DesktopWidth - 47, @DesktopHeight - 15)
; @DesktopWidth - 47 使用这种方式其他的电脑上也可以使用.
If @error Then
        ConsoleWrite('成功！')
Else
        ConsoleWrite('失败！')
EndIf

; _MouseClickAdvanced
; #FUNCTION# ===================================================================
; 函数名称 ...........: _MouseClickAdvanced()
; 描述 ...............: 执行鼠标点击操作, 执行后立即回到原位.
; 语法 ...............:  _MouseClickAdvanced("按钮" [, X坐标, Y坐标 [, 点击次数 [, 速度 ]]])
;                     : 按钮 用于点击操作的按钮:
;                     : "left"(左键)、"right"(右键)、"middle"(中键)、
;                     : "main"(主键)、"menu"(菜单键)、
;                     : "primary"(主要按钮)、"secondary"(次要按钮).
;
; 可选参数 ...........:X坐标,Y坐标 [可选参数] 目标 X/Y 的坐标值 .若两者都留空，则使用当前位置 (默认).
;                     :点击次数 [可选参数] 鼠标按钮点击的次数. Default(默认) = 1.
;                     :速度 [可选参数] 鼠标移动速度，可设数值范围在 1(最快)和 100(最慢)之间.
;                     :若设置速度为 0, 则立即移动鼠标到指定位置. Default(默认) = 0.
;
; 返回值 .............: 成功: 设置 @error 为 1, 失败: 设置 @error 为 0
;
; 作者................: lixiaolong - [url]http://www.autoitx.com/[/url]
;===============================================================================
 
Func _MouseClickAdvanced($Key, $x = 0, $y = 0, $Clicks = 1, $Speed = 0)
        Local $pos = MouseGetPos()
        If $x >= 0 And $x <= @DesktopWidth And _
                        $y >= 0 And $y <= @DesktopHeight And _
                        $Clicks > 0 And $Speed <= 100 Then
                Local $error = MouseClick($Key, $x, $y, $Clicks, $Speed)
                MouseMove($pos[0], $pos[1], 0)
                SetError($error)
        Else
                SetError(0)
        EndIf
EndFunc   ;==>_MouseClickAdvanced
