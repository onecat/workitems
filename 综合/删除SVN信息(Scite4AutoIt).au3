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

Dim $h=MsgBox(1, "请注意", "确定要删除SVN信息,是否在副本下运行本程序，不是点取消，请复制成副本，在运行")
    if  $h<>1  Then
    Exit 0
EndIf 

DirRemove(@ScriptDir & "\.svn",1)
DirRemove(@ScriptDir & "\Project\.svn",1)
DirRemove(@ScriptDir & "\roject\Bins\.svn",1)
DirRemove(@ScriptDir & "\Project\Properties\.svn",1)
DirRemove(@ScriptDir & "\scintilla\.svn",1)
DirRemove(@ScriptDir & "\scintilla\bin\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\res\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaFramework\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaFramework\English.lproj\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaFramework\ScintillaFramework.xcodeproj\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaTest\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaTest\English.lproj\.svn",1)
DirRemove(@ScriptDir & "\scintilla\cocoa\ScintillaTest\ScintillaTest.xcodeproj\.svn",1)
DirRemove(@ScriptDir & "\scintilla\doc\.svn",1)
DirRemove(@ScriptDir & "\scintilla\gtk\.svn",1)
DirRemove(@ScriptDir & "\scintilla\include\.svn",1)
DirRemove(@ScriptDir & "\scintilla\lexers\.svn",1)
DirRemove(@ScriptDir & "\scintilla\lexlib\.svn",1)
DirRemove(@ScriptDir & "\scintilla\macosx\.svn",1)
DirRemove(@ScriptDir & "\scintilla\macosx\SciTest\.svn",1)
DirRemove(@ScriptDir & "\scintilla\macosx\SciTest\English.lproj\.svn",1)
DirRemove(@ScriptDir & "\scintilla\macosx\SciTest\SciTest.xcode\.svn",1)
DirRemove(@ScriptDir & "\scintilla\src\.svn",1)
DirRemove(@ScriptDir & "\scintilla\test\.svn",1)
DirRemove(@ScriptDir & "\scintilla\test\examples\.svn",1)
DirRemove(@ScriptDir & "\scintilla\test\unit\.svn",1)
DirRemove(@ScriptDir & "\scintilla\win32\.svn",1)
DirRemove(@ScriptDir & "\scite\.svn",1)
DirRemove(@ScriptDir & "\scite\bin\.svn",1)
DirRemove(@ScriptDir & "\scite\bin\properties\.svn",1)
DirRemove(@ScriptDir & "\scite\bin\属性文件\.svn",1)
DirRemove(@ScriptDir & "\scite\boundscheck\.svn",1)
DirRemove(@ScriptDir & "\scite\doc\.svn",1)
DirRemove(@ScriptDir & "\scite\gtk\.svn",1)
DirRemove(@ScriptDir & "\scite\lua\.svn",1)
DirRemove(@ScriptDir & "\scite\lua\include\.svn",1)
DirRemove(@ScriptDir & "\scite\lua\src\.svn",1)
DirRemove(@ScriptDir & "\scite\lua\src\lib\.svn",1)
DirRemove(@ScriptDir & "\scite\scripts\.svn",1)
DirRemove(@ScriptDir & "\scite\src\.svn",1)
DirRemove(@ScriptDir & "\scite\toolbar\.svn",1)
DirRemove(@ScriptDir & "\scite\toolbar\bmp2ico\.svn",1)
DirRemove(@ScriptDir & "\scite\toolbar\ico\.svn",1)
DirRemove(@ScriptDir & "\scite\win32\.svn",1)
