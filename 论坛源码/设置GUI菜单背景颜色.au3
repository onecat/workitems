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



#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
;~ #include <WindowsConstants.au3>
 
Local $MenuItem[6]
Local $MenuItemName[6] = ['打开', '新建 &N', '打开 &O', '保存 &S', '', '退出 &X']
 
Local $MenuItem2[6]
Local $MenuItemName2[6] = ['你好', '再见', '谢谢', '', '晚安', '退出 &X']
 
; 创建 GUI
$hGUI = GUICreate("菜单函数演示", 400, 300)
 
; 创建文件菜单
$hMenu = GUICtrlCreateMenu("菜单")
For $i = 0 To UBound($MenuItem) - 1
        $MenuItem[$i] = GUICtrlCreateMenuItem($MenuItemName[$i], $hMenu)
Next
 
$hMenu2 = GUICtrlCreateMenu("菜单2")
For $i = 0 To UBound($MenuItem2) - 1
        $MenuItem2[$i] = GUICtrlCreateMenuItem($MenuItemName2[$i], $hMenu2)
Next
 
_GUIMenuSetBkColor($hGUI, 2, 0xffffff); 设为白色
GUISetState()
 
Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE




#include <GuiMenu.au3>
#include <WinAPI.au3>
#include-once
; #FUNCTION# ===================================================================
; 函数名称 ...........: _GUIMenuSetBkColor()
; 描述 ...............: 设置GUI菜单背景颜色.
; 语法 ...............:  _GUIMenuSetBkColor($hWnd, $Menu_num, $Menu_BkColor)
;                     : $hWnd = 窗口的句柄.
;                     : $Menu_num = 菜单个数.
;                     : $Menu_BkColor = 窗口背景色.
;
; 作者................: lixiaolong - [url]http://www.autoitx.com/[/url]
;===============================================================================
Func _GUIMenuSetBkColor($hWnd, $Menu_num, $Menu_BkColor)
        Local $_count, $h_File
        Local $Get_Menu_Handle = _GUICtrlMenu_GetMenu($hWnd)
        Local $h_Brush = _WinAPI_CreateSolidBrush($Menu_BkColor); 颜色

        For $_count = 0 To $Menu_num - 1
                $h_File = _GUICtrlMenu_GetItemSubMenu($Get_Menu_Handle, $_count)
                If Not $h_File Then ExitLoop
                _GUICtrlMenu_SetMenuBackground($h_File, $h_Brush)
                _GUICtrlMenu_SetItemType($h_File, 0, $MFT_MENUBREAK, 1)
        Next
        If $_count Then
                Return True
        Else
                Return False
        EndIf
EndFunc   ;==>_GUIMenuSetBkColor
