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
#AutoIt3Wrapper_Run_Debug_Mode=y                ;调试输出模式
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
DirRemove(@ScriptDir & "\html\.svn",1)
DirRemove(@ScriptDir & "\html\acnfunctions\.svn",1)
DirRemove(@ScriptDir & "\html\appendix\.svn",1)
DirRemove(@ScriptDir & "\html\css\.svn",1)
DirRemove(@ScriptDir & "\html\examples\.svn",1)
DirRemove(@ScriptDir & "\html\functions\.svn",1)
DirRemove(@ScriptDir & "\html\guiref\.svn",1)
DirRemove(@ScriptDir & "\html\images\.svn",1)
DirRemove(@ScriptDir & "\html\intro\.svn",1)
DirRemove(@ScriptDir & "\html\keywords\.svn",1)
DirRemove(@ScriptDir & "\html\libfunctions\.svn",1)
DirRemove(@ScriptDir & "\html\macros\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\guimsgbox\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\helloworld\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\notepad\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\regexp\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\simplecalc-josbe\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\simplecalc-josbe\CSSAlternative\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\winzip\.svn",1)
DirRemove(@ScriptDir & "\MATH\.svn",1)
DirRemove(@ScriptDir & "\scite\.svn",1)
DirRemove(@ScriptDir & "\scite\AU3Record_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\html\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\html\Images\.svn",1)
DirRemove(@ScriptDir & "\scite\css\.svn",1)
DirRemove(@ScriptDir & "\scite\FuncPopUp_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite\images\.svn",1)
DirRemove(@ScriptDir & "\scite\Lua_Doc\.svn",1)
DirRemove(@ScriptDir & "\scite\Scite_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite\SciTEConfig_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite\Scitedoc\.svn",1)
DirRemove(@ScriptDir & "\scite\tidy_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AU3Record_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\html\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\html\Images\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\css\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\FuncPopUp_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\images\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Lua_Doc\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Scite_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\SciTEConfig_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Scitedoc\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\tidy_doc_files\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\AcnExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\AcnLibFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\ADF\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtKeywords\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtlibfunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeLibExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeLibExamples\Extras\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\examples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\libExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtKeywords\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtlibfunctions\.svn",1)
