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
#include <file.au3>
_FileAndDirCreate(@DesktopDir & '\新建文本文档.txt');创建文件
_FileAndDirCreate(@DesktopDir & '\新建文件夹');创建文件夹

#include <file.au3>
;~ _FileAndDirCreate()
;===============================================================================
; 函数名称:   _FileAndDirCreate()
; 描述:       创建文件和文件夹
; 语法:       _FileAndDirCreate($FilePach)
; 参数:       $FilePach - 创建文件的路径和文件名.
; 例子:       _FileAndDirCreate('C:\Users\Administrator\Desktop\a.txt');创建文件
;             _FileAndDirCreate('C:\Users\Administrator\Desktop\a');创建文件夹 
;
; 作者:      lixiaolong - http://www.autoitx.com/
;===============================================================================
 
Func _FileAndDirCreate($FilePach)
        Dim $szDrive, $szDir, $szFName, $szExt
        $arrPath = _PathSplit($FilePach, $szDrive, $szDir, $szFName, $szExt)
        If Not FileExists($FilePach) Then
                If $szExt = '' Then
                        DirCreate($FilePach)
                Else
                        _FileCreate($FilePach)
                EndIf
        Else
                For $i = 1 To 1000
                        If Not FileExists($szDrive & $szDir & $szFName & '(' & $i & ')' & $szExt) Then ExitLoop
                Next
                If $szExt = '' Then
                        DirCreate($szDrive & $szDir & $szFName & '(' & $i & ')')
                Else
                        _FileCreate($szDrive & $szDir & $szFName & '(' & $i & ')' & $szExt)
                EndIf
        EndIf
EndFunc   ;==>_FileAndDirCreate
