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

;~ By Crossdoor
;~ 从DLL文件中加载图片到图片控件
;~ _SetBitmap(DLL名称, 图片编号, 控件句柄)
;~ 成功返回1
;~ 示例：
;~ $pic = GUICtrlCreatePic("", 0, 0, 640, 480, 0x04000000)
;~ _SetBitmap('Res.dll', '#143', $pic)
Func _SetBitmap($sDll, $sBitmap, $hwnd)
        $LoadLibraryA = DllCall("Kernel32.dll", "hwnd", "LoadLibraryA", "str", $sDll)
        If @error Then Return SetError(@error, 0, 0)
        $LoadBitmap = DllCall("User32.dll", "hwnd", "LoadBitmap", "hwnd", $LoadLibraryA[0], "str", $sBitmap)
        If @error Then Return SetError(@error, 0, -1)
        DllCall("user32.dll", "lparam", "SendMessage", "hwnd", GUICtrlGetHandle($hwnd), "int", 0x0172, "wparam", 0, "lparam", $LoadBitmap[0])
        If @error Then Return SetError(@error, @extended, "")
        DllCall("Kernel32.dll", "hwnd", "FreeLibrary", "hwnd", $LoadLibraryA[0])
        Return 1
EndFunc